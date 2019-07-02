From: keescook@chromium.org (Kees Cook)
Date: Tue, 2 Jul 2019 09:03:05 -0700
Subject: [Linux-kernel-mentees] [PATCH] media: usb: technisat-usb2: fix
	buffer overflow
In-Reply-To: <20190702140211.28399-1-tranmanphong@gmail.com>
References: <000000000000089d7f058683115e@google.com>
	<20190702140211.28399-1-tranmanphong@gmail.com>
Message-ID: <201907020858.66B63B24@keescook>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190702160305.6ThtpkbVHQ1CowzMpnYszM0lzdMulqzbB9eIhyqXNhk@z>

On Tue, Jul 02, 2019 at 09:02:11PM +0700, Phong Tran wrote:
> The buffer will be overflow in case of the while loop can not break.
> Add the checking buffer condition in while loop for avoiding
> overlooping index.
> 
> This issue was reported by syzbot
> 
> Reported-by: syzbot+eaaaf38a95427be88f4b at syzkaller.appspotmail.com
> 
> Tested by:
> https://groups.google.com/d/msg/syzkaller-bugs/CySBCKuUOOs/0hKq1CdjCwAJ
> 
> Signed-off-by: Phong Tran <tranmanphong at gmail.com>
> ---
>  drivers/media/usb/dvb-usb/technisat-usb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
> index c659e18b358b..4e0b6185666a 100644
> --- a/drivers/media/usb/dvb-usb/technisat-usb2.c
> +++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
> @@ -655,7 +655,7 @@ static int technisat_usb2_get_ir(struct dvb_usb_device *d)
>  #endif
>  
>  	ev.pulse = 0;
> -	while (1) {
> +	while (b != (buf + 63)) {

This matches the "62" from the earlier read -- instead of these literal
numbers, could you replace the "62"s with a named define for whatever
would make sense for this driver (maybe "IR_MAX_EVENTS"?), and then you
can make the above be something like:

	while (b <= buf + IR_MAX_EVENTS) {


>  		ev.pulse = !ev.pulse;
>  		ev.duration = (*b * FIRMWARE_CLOCK_DIVISOR * FIRMWARE_CLOCK_TICK) / 1000;
>  		ir_raw_event_store(d->rc_dev, &ev);
> -- 
> 2.11.0
> 

-- 
Kees Cook
