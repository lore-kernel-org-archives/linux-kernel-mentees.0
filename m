From: alexandre.belloni at bootlin.com (Alexandre Belloni)
Date: Thu, 27 Jun 2019 01:32:09 +0200
Subject: [Linux-kernel-mentees] [PATCH] drivers: rtc: Fix return value
 assignment
In-Reply-To: <20190626224717.27051-3-c0d1n61at3@gmail.com>
References: <20190626224717.27051-1-c0d1n61at3@gmail.com>
	<20190626224717.27051-3-c0d1n61at3@gmail.com>
Message-ID: <20190626233209.GF3692@piout.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hello,

Please do use subject lines matching the style for the subsystem.

Also, you should definitively send patches to the subsystem mailing list
so that tools like patchwork would see them.

On 26/06/2019 17:47:17-0500, Jiunn Chang wrote:
> hrtimer_forward_now() returns u64, so change count to u64.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
>  drivers/rtc/interface.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index 4124f4dd376b..72b7ddc43116 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -633,7 +633,7 @@ enum hrtimer_restart rtc_pie_update_irq(struct hrtimer *timer)
>  {
>  	struct rtc_device *rtc;
>  	ktime_t period;
> -	int count;
> +	u64 count;
>  

Finally, I'm sorry but someone already beat you to it (and made almost
the same mistakes):

https://patchwork.ozlabs.org/patch/1117613/


>  	rtc = container_of(timer, struct rtc_device, pie_timer);
>  
> -- 
> 2.22.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
