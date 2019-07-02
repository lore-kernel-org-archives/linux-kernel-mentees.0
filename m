From: davem@davemloft.net (David Miller)
Date: Tue, 02 Jul 2019 15:25:09 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH V2] net: usb: asix: init MAC
	address buffers
In-Reply-To: <20190702001008.26048-1-tranmanphong@gmail.com>
References: <20190630234533.15089-1-tranmanphong@gmail.com>
	<20190702001008.26048-1-tranmanphong@gmail.com>
Message-ID: <20190702.152509.767279980793826503.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190702222509.uqFUm9fyRqs_jPxRxjlsGekeLQN0NoPtV4YSKtrHsF0@z>

From: Phong Tran <tranmanphong@gmail.com>
Date: Tue,  2 Jul 2019 07:10:08 +0700

> This is for fixing bug KMSAN: uninit-value in ax88772_bind
> 
> Tested by
> https://groups.google.com/d/msg/syzkaller-bugs/aFQurGotng4/eB_HlNhhCwAJ
> 
> Reported-by: syzbot+8a3fc6674bbc3978ed4e at syzkaller.appspotmail.com
> 
> syzbot found the following crash on:
> 
> HEAD commit:    f75e4cfe kmsan: use kmsan_handle_urb() in urb.c
> git tree:       kmsan
 ...
> Signed-off-by: Phong Tran <tranmanphong at gmail.com>

Applied, thanks.
