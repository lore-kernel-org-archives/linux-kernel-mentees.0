From: glider at google.com (Alexander Potapenko)
Date: Tue, 2 Jul 2019 16:23:11 +0200
Subject: [Linux-kernel-mentees] [PATCH] media: usb: technisat-usb2: fix
	buffer overflow
In-Reply-To: <20190702140211.28399-1-tranmanphong@gmail.com>
References: <000000000000089d7f058683115e@google.com>
	<20190702140211.28399-1-tranmanphong@gmail.com>
Message-ID: <CAG_fn=VHpZW69TfK35aqL7o6CvgsPazL5raeW1QmWpu9ReYkhw@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Tue, Jul 2, 2019 at 4:02 PM Phong Tran <tranmanphong at gmail.com> wrote:
>
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
>         ev.pulse = 0;
> -       while (1) {
> +       while (b != (buf + 63)) {
I think it won't hurt to either use ARRAY_SIZE here, or define some
magic constant for the buffer size in struct technisat_usb2_state.

>                 ev.pulse = !ev.pulse;
>                 ev.duration = (*b * FIRMWARE_CLOCK_DIVISOR * FIRMWARE_CLOCK_TICK) / 1000;
>                 ir_raw_event_store(d->rc_dev, &ev);
> --
> 2.11.0
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe at googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/20190702140211.28399-1-tranmanphong%40gmail.com.
> For more options, visit https://groups.google.com/d/optout.



-- 
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra?e, 33
80636 M?nchen

Gesch?ftsf?hrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
