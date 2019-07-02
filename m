From: tranmanphong@gmail.com (Phong Tran)
Date: Tue, 2 Jul 2019 07:49:26 +0700
Subject: [Linux-kernel-mentees] Analyze syzbot report
	technisat_usb2_rc_query KASAN
Message-ID: <ede75d50-7475-3478-b30f-ef9077b6bf48@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190702004926.gkkRUaX7-6moYD3BaU8GcuFjEqC1rmRS7PPHjK_SFzc@z>

Hello,

I did a checking for this report of syzbot [1]
 From the call stack of dump log:

There shows that a problem within technisat_usb2_get_ir()

BUG: KASAN: slab-out-of-bounds in technisat_usb2_get_ir 
drivers/media/usb/dvb-usb/technisat-usb2.c:664 [inline]
BUG: KASAN: slab-out-of-bounds in technisat_usb2_rc_query+0x5fa/0x660 
drivers/media/usb/dvb-usb/technisat-usb2.c:679
Read of size 1 at addr ffff8880a8791ea8 by task kworker/0:1/12

Take a look into while loop in technisat_usb2_get_ir().
I recognized that a problem. The loop will not break out with the 
condition doesn't reach. Then "b++" will go wrong and buffer will be 
overflow.

while (1) {
[...]
	b++;
	if (*b == 0xff) {
		ev.pulse = 0;
		ev.duration = 888888*2;
		ir_raw_event_store(d->rc_dev, &ev);
		break;
	}
}

I would propose changing the loop condition by checking the address of 
the buffer. If acceptable, I will send this patch to the mailing-list.
eg:

-       while (1) {
+       while (b != (buf + 63)) {
[...]
}

Tested with syzbot, result is good [2].

[1] https://syzkaller.appspot.com/bug?extid=eaaaf38a95427be88f4b
[2] https://groups.google.com/d/msg/syzkaller-bugs/CySBCKuUOOs/0hKq1CdjCwAJ

Phong
