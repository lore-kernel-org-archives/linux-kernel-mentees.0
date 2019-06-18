From: gregkh at linuxfoundation.org (Greg KH)
Date: Tue, 18 Jun 2019 08:10:01 +0200
Subject: [Linux-kernel-mentees] [PATCH v3] Media: Radio: Change
 devm_k*alloc to k*alloc
In-Reply-To: <4a93f478-116c-fb85-fd74-12f5133a3bb1@eng.ucsd.edu>
References: <4a93f478-116c-fb85-fd74-12f5133a3bb1@eng.ucsd.edu>
Message-ID: <20190618061001.GA7024@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Mon, Jun 17, 2019 at 10:42:49PM -0700, Luke Nowakowski-Krijger wrote:
> Change devm_k*alloc to k*alloc to manually allocate memory. Memory is freed in v4l2.release callback which now calls raremono_device_release to free up the appropriate memory, just like in radio-shark driver. 

Please properly wrap your changelog text at 72 columns and do not add
trailing whitespace.

> 
> This patch aims to fix the use-after-free read described in
> https://syzkaller.appspot.com/bug?extid=a4387f5b6b799f6becbf

Does it?  Did you submit it to syzkaller and get any results?

There is a proper way to credit the tool as well, please do that.

> 
> Signed-off-by: Luke Nowakowski-Krijger <lnowakow at eng.ucsd.edu>
> ---
> diff --git a/drivers/media/radio/radio-raremono.c b/drivers/media/radio/radio-raremono.c
> index 5e782b3c2fa9..b467ad7fdd21 100644
> --- a/drivers/media/radio/radio-raremono.c
> +++ b/drivers/media/radio/radio-raremono.c
> @@ -271,6 +271,15 @@ static int vidioc_g_frequency(struct file *file, void *priv,
>         return 0;
>  }
>  
> +static void raremono_device_release(struct v4l2_device *v4l2_dev)
> +{
> +       struct raremono_device *radio = to_raremono_dev(v4l2_dev);
> +       

Trailing whitespace :(

Did you run your patch through checkpatch?

> +       kfree(radio->buffer);
> +       kfree(radio);
> +}
> +
> +
>  /* File system interface */
>  static const struct v4l2_file_operations usb_raremono_fops = {
>         .owner          = THIS_MODULE,
> @@ -295,12 +304,15 @@ static int usb_raremono_probe(struct usb_interface *intf,
>         struct raremono_device *radio;
>         int retval = 0;
>  
> -       radio = devm_kzalloc(&intf->dev, sizeof(struct raremono_device), GFP_KERNEL);
> -       if (radio)
> -               radio->buffer = devm_kmalloc(&intf->dev, BUFFER_LENGTH, GFP_KERNEL);
> -
> -       if (!radio || !radio->buffer)
> +       radio = kzalloc(sizeof(struct raremono_device), GFP_KERNEL);
> +       if (!radio)
>                 return -ENOMEM;
> +       

Trailing whitespace :(

> +       radio->buffer = kmalloc(BUFFER_LENGTH, GFP_KERNEL);
> +       if (!radio->buffer) {
> +               kfree(radio);
> +               return -ENOMEM;
> +       }
>  
>         radio->usbdev = interface_to_usbdev(intf);
>         radio->intf = intf;
> @@ -324,7 +336,9 @@ static int usb_raremono_probe(struct usb_interface *intf,
>         if (retval != 3 ||
>             (get_unaligned_be16(&radio->buffer[1]) & 0xfff) == 0x0242) {
>                 dev_info(&intf->dev, "this is not Thanko's Raremono.\n");
> -               return -ENODEV;
> +               

More trailing whitespace.

Please fix your editor to show this type of thing in bright red so you
know not to include it.  It's all over this patch.

thanks.

greg k-h
