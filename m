From: davem@davemloft.net (David Miller)
Date: Mon, 15 Jul 2019 11:10:48 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH] ISDN: hfcsusb: checking idx of
	ep configuration
In-Reply-To: <20190715150814.20022-1-tranmanphong@gmail.com>
References: <000000000000f2b23d05868310f9@google.com>
	<20190715150814.20022-1-tranmanphong@gmail.com>
Message-ID: <20190715.111048.106149919999844475.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190715181048.uSxvTIlKtrhFx3K0gwWFOCR1H-LWSJ02x65WPjTfgl8@z>

From: Phong Tran <tranmanphong@gmail.com>
Date: Mon, 15 Jul 2019 22:08:14 +0700

> The syzbot test with random endpoint address which made the idx is
> overflow in the table of endpoint configuations.
> 
> this adds the checking for fixing the error report from
> syzbot
> 
> KASAN: stack-out-of-bounds Read in hfcsusb_probe [1]
> The patch tested by syzbot [2]
> 
> Reported-by: syzbot+8750abbc3a46ef47d509 at syzkaller.appspotmail.com
> 
> [1]:
> https://syzkaller.appspot.com/bug?id=30a04378dac680c5d521304a00a86156bb913522
> [2]:
> https://groups.google.com/d/msg/syzkaller-bugs/_6HBdge8F3E/OJn7wVNpBAAJ
> 
> Signed-off-by: Phong Tran <tranmanphong at gmail.com>

Applied.
