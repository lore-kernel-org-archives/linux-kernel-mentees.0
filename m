From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Wed, 26 Jun 2019 18:29:47 -0500
Subject: [Linux-kernel-mentees] [PATCH] drivers: rtc: Fix return value
 assignment
In-Reply-To: <20190626224717.27051-3-c0d1n61at3@gmail.com>
References: <20190626224717.27051-1-c0d1n61at3@gmail.com>
	<20190626224717.27051-3-c0d1n61at3@gmail.com>
Message-ID: <20190626232946.ozc4gcayxudm7l2b@rYz3n>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190626232947.c_BfQU0tFYSLaW_rX_5eJe8Sp7dRh6OzesYC3qiEh7Y@z>

On Wed, Jun 26, 2019 at 05:47:17PM -0500, Jiunn Chang wrote:
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
>  	rtc = container_of(timer, struct rtc_device, pie_timer);
>  
> -- 
> 2.22.0
> 

Hello,

Looks like this patch was already submitted by someone else.

Please ignore unless the other patches have been dropped.

Regards,

Jiunn
