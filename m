From: hverkuil at xs4all.nl (Hans Verkuil)
Date: Fri, 24 May 2019 08:28:24 +0200
Subject: [Linux-kernel-mentees] [PATCH] Media: Radio: Change
	devm_k*alloc to k*alloc
In-Reply-To: <9d919e81-c291-5f7d-90db-5a2284eeab2a@eng.ucsd.edu>
References: <9d919e81-c291-5f7d-90db-5a2284eeab2a@eng.ucsd.edu>
Message-ID: <862d7247-e4bf-aa0c-3ef5-7ded121a11de@xs4all.nl>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hi Luke,

On 5/23/19 9:56 AM, Luke Nowakowski-Krijger wrote:
> This patch aims to fix the use-after-free read described in
> https://syzkaller.appspot.com/bug?extid=a4387f5b6b799f6becbf
> 
> Changes devm_k*alloc to k*alloc which manually frees memory allocated by
> raremono_device instead of leaving it to be automatically deallocated
> when the USB interface calls it to be freed. The devices resources are
> freed in usb_raremono_disconnect as well as freed when error conditions
> occur in usb_raremono_probe.
> 
> This change is necessary due to the fact that when the USB device is
> disconnected, it frees the raremono_device structure before doing the
> necessary cleanup to remove references to the device, thus we get these
> use-after-free errors.
> 
> I would like to thank Hans Verkuil for pointing me in the right
> direction to fix this issue.
> 
> Signed-off-by: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
> 
> ---
>  ?drivers/media/radio/radio-raremono.c | 18 +++++++++++++-----
>  ?1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/radio/radio-raremono.c b/drivers/media/radio/radio-raremono.c
> index 5e782b3c2fa9..88cff46cde28 100644
> --- a/drivers/media/radio/radio-raremono.c
> +++ b/drivers/media/radio/radio-raremono.c
> @@ -171,6 +171,8 @@ static void usb_raremono_disconnect(struct usb_interface *intf)
>  ??????? v4l2_device_disconnect(&radio->v4l2_dev);
>  ??????? mutex_unlock(&radio->lock);
>  ??????? v4l2_device_put(&radio->v4l2_dev);
> +?????? kfree(radio->buffer);
> +?????? kfree(radio);

Ah no, this isn't the right place to free the memory. The disconnect() is
called at the moment the USB device is unplugged, so applications can still
have the radio device open. That just creates the same problem as devm_*alloc()
does. You should free this in the release callback of the struct video_device
(radio->vdev.release). That's called when the last user of the device disappears.

>  ?}
> 
>  ?/*
> @@ -295,12 +297,15 @@ static int usb_raremono_probe(struct usb_interface *intf,
>  ??????? struct raremono_device *radio;
>  ??????? int retval = 0;
> 
> -?????? radio = devm_kzalloc(&intf->dev, sizeof(struct raremono_device), GFP_KERNEL);
> -?????? if (radio)
> -?????????????? radio->buffer = devm_kmalloc(&intf->dev, BUFFER_LENGTH, GFP_KERNEL);
> -
> -?????? if (!radio || !radio->buffer)
> +?????? radio = kzalloc(sizeof(struct raremono_device), GFP_KERNEL);
> +?????? if (!radio)
> +?????????????? return -ENOMEM;
> +
> +?????? radio->buffer = kmalloc(BUFFER_LENGTH, GFP_KERNEL);
> +?????? if (!radio->buffer) {
> +?????????????? kfree(radio);
>  ??????????????? return -ENOMEM;
> +?????? }
> 
>  ??????? radio->usbdev = interface_to_usbdev(intf);
>  ??????? radio->intf = intf;
> @@ -324,6 +329,9 @@ static int usb_raremono_probe(struct usb_interface *intf,
>  ??????? if (retval != 3 ||
>  ??????????? (get_unaligned_be16(&radio->buffer[1]) & 0xfff) == 0x0242) {
>  ??????????????? dev_info(&intf->dev, "this is not Thanko's Raremono.\n");
> +
> +?????????????? kfree(radio->buffer);
> +?????????????? kfree(radio);
>  ??????????????? return -ENODEV;
>  ??????? }
> 

You missed another two other 'returns' in the probe() function where this
memory should be freed. It's best to use a 'goto free_mem' instead of a
return in those cases.

Regards,

	Hans
