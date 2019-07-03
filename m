From: keescook at chromium.org (Kees Cook)
Date: Tue, 2 Jul 2019 19:26:32 -0700
Subject: [Linux-kernel-mentees] [PATCH V2] media: usb: technisat-usb2:
	fix buffer overflow
In-Reply-To: <20190703021444.19954-1-tranmanphong@gmail.com>
References: <20190702140211.28399-1-tranmanphong@gmail.com>
	<20190703021444.19954-1-tranmanphong@gmail.com>
Message-ID: <201907021925.1F24D6ADA3@keescook>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Wed, Jul 03, 2019 at 09:14:44AM +0700, Phong Tran wrote:
> The buffer will be overflow in case of the while loop can not break.
> Add the checking buffer condition in while loop for avoiding
> overlooping index.
> 
> This issue was reported by syzbot
> 
> Reported-by: syzbot+eaaaf38a95427be88f4b at syzkaller.appspotmail.com
> 
> Tested-by:
> https://groups.google.com/d/msg/syzkaller-bugs/CySBCKuUOOs/t3PvVheSAAAJ
> 

Avoid these blank lines please. (More below...)

> Signed-off-by: Phong Tran <tranmanphong at gmail.com>
> ---
> Change Log:
>  * V2: add IR_MAX_BUFFER_INDEX and adjust the while loop condition as comments
> ---
>  drivers/media/usb/dvb-usb/technisat-usb2.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
> index c659e18b358b..cdabff97c1ea 100644
> --- a/drivers/media/usb/dvb-usb/technisat-usb2.c
> +++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
> @@ -49,6 +49,7 @@ MODULE_PARM_DESC(disable_led_control,
>  		"disable LED control of the device (default: 0 - LED control is active).");
>  
>  /* device private data */
> +#define IR_MAX_BUFFER_INDEX	63

How does this map to the literal "62" used before the loop you're
fixing?

Otherwise, it's looking good; thanks!

-Kees

>  struct technisat_usb2_state {
>  	struct dvb_usb_device *dev;
>  	struct delayed_work green_led_work;
> @@ -56,7 +57,7 @@ struct technisat_usb2_state {
>  
>  	u16 last_scan_code;
>  
> -	u8 buf[64];
> +	u8 buf[IR_MAX_BUFFER_INDEX + 1];
>  };
>  
>  /* debug print helpers */
> @@ -655,7 +656,7 @@ static int technisat_usb2_get_ir(struct dvb_usb_device *d)
>  #endif
>  
>  	ev.pulse = 0;
> -	while (1) {
> +	while (b <= (buf + IR_MAX_BUFFER_INDEX)) {
>  		ev.pulse = !ev.pulse;
>  		ev.duration = (*b * FIRMWARE_CLOCK_DIVISOR * FIRMWARE_CLOCK_TICK) / 1000;
>  		ir_raw_event_store(d->rc_dev, &ev);
> -- 
> 2.11.0
> 

-- 
Kees Cook
