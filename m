From: greg@kroah.com (Greg KH)
Date: Mon, 29 Apr 2019 16:56:35 +0200
Subject: [Linux-kernel-mentees] [PATCH] staging: media: bcm2048: Fixed
 style error ERROR: Macros with complex values should be enclosed in
 parentheses found using scripts/checkpatch.pl
In-Reply-To: <20190429145002.GA12732@arch>
References: <20190429145002.GA12732@arch>
Message-ID: <20190429145635.GA7601@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429145635.sNUl6pGm8Najs-UlJrRomxmDNKXg_eTj5_0H0DGSXts@z>

On Mon, Apr 29, 2019 at 08:20:02PM +0530, Puranjay Mohan wrote:
> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> ---

I think your subject line needs a bit of work :)

Also, I can't take patches without any changelog text.

>  drivers/staging/media/bcm2048/radio-bcm2048.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/bcm2048/radio-bcm2048.c b/drivers/staging/media/bcm2048/radio-bcm2048.c
> index d9b02ff66259..599da6c977ed 100644
> --- a/drivers/staging/media/bcm2048/radio-bcm2048.c
> +++ b/drivers/staging/media/bcm2048/radio-bcm2048.c
> @@ -2000,7 +2000,7 @@ static ssize_t bcm2048_##prop##_read(struct device *dev,		\
>  	return sprintf(buf, mask "\n", value);				\
>  }
>  
> -#define DEFINE_SYSFS_PROPERTY(prop, prop_type, mask, check)		\
> +#define (DEFINE_SYSFS_PROPERTY(prop, prop_type, mask, check))		\
>  property_write(prop, prop_type, mask, check)				\
>  property_read(prop, mask)						\

Wait, did you build this patch?  Are you sure it is doing what you think
it is doing?

thanks,

greg k-h
