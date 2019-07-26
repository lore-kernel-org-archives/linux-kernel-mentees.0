From: pebolle@tiscali.nl (Paul Bolle)
Date: Fri, 26 Jul 2019 16:22:18 +0200
Subject: [Linux-kernel-mentees] [PATCH] isdn/gigaset: check endpoint
	null in gigaset_probe
In-Reply-To: <20190726133528.11063-1-tranmanphong@gmail.com>
References: <20190726133528.11063-1-tranmanphong@gmail.com>
Message-ID: <1876196a0e7fc665f0f50d5e9c0e2641f713e089.camel@tiscali.nl>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190726142218.hruAs78ErD1WK4H8W0DfScfUwsXLGI5HfkzWHBTzJ_U@z>

Phong Tran schreef op vr 26-07-2019 om 20:35 [+0700]:
> This fixed the potential reference NULL pointer while using variable
> endpoint.
> 
> Reported-by: syzbot+35b1c403a14f5c89eba7 at syzkaller.appspotmail.com
> Tested by syzbot:
> https://groups.google.com/d/msg/syzkaller-bugs/wnHG8eRNWEA/Qn2HhjNdBgAJ
> 
> Signed-off-by: Phong Tran <tranmanphong at gmail.com>
> ---
>  drivers/isdn/gigaset/usb-gigaset.c | 9 +++++++++

This is now drivers/staging/isdn/gigaset/usb-gigaset.c.

>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/isdn/gigaset/usb-gigaset.c b/drivers/isdn/gigaset/usb-gigaset.c
> index 1b9b43659bdf..2e011f3db59e 100644
> --- a/drivers/isdn/gigaset/usb-gigaset.c
> +++ b/drivers/isdn/gigaset/usb-gigaset.c
> @@ -703,6 +703,10 @@ static int gigaset_probe(struct usb_interface *interface,
>  	usb_set_intfdata(interface, cs);
>  
>  	endpoint = &hostif->endpoint[0].desc;
> +        if (!endpoint) {
> +		dev_err(cs->dev, "Couldn't get control endpoint\n");
> +		return -ENODEV;
> +	}

When can this happen? Is this one of those bugs that one can only trigger with
a specially crafted (evil) usb device?

>  	buffer_size = le16_to_cpu(endpoint->wMaxPacketSize);
>  	ucs->bulk_out_size = buffer_size;
> @@ -722,6 +726,11 @@ static int gigaset_probe(struct usb_interface *interface,
>  	}
>  
>  	endpoint = &hostif->endpoint[1].desc;
> +        if (!endpoint) {
> +		dev_err(cs->dev, "Endpoint not available\n");
> +		retval = -ENODEV;
> +		goto error;
> +	}
>  
>  	ucs->busy = 0;
>  

Please note that I'm very close to getting cut off from the ISDN network, so
the chances of being able to testi this on a live system are getting small. 

Thanks,


Paul Bolle
