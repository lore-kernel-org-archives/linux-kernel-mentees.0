From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Fri, 28 Jun 2019 18:33:33 -0500
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] - BUG: unable to handle
 kernel NULL
In-Reply-To: <f4bf3d5f-7fb5-b658-f61d-b381b33c268f@linuxfoundation.org>
References: <20190628083114.4ashvojeuey2tjoq@rYz3n>
	<f4bf3d5f-7fb5-b658-f61d-b381b33c268f@linuxfoundation.org>
Message-ID: <20190628233332.2isf4ki45w7z5iao@rYz3n>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190628233333.Eqj130aMQLUEA-S4ywfbHxF28Kh9sV20fG9rctdR-ew@z>

On Fri, Jun 28, 2019 at 02:55:46PM -0600, Shuah Khan wrote:
> On 6/28/19 2:31 AM, Jiunn Chang wrote:
> > pointer dereference in hci_uart_set_flow_control
> > Reply-To:
> > 
> > Hello,
> > 
> > This is an analysis of the following Syzbot report:
> > 
> > https://syzkaller.appspot.com/bug?id=1b42faa2848963564a5b1b7f8c837ea7b55ffa50
> > 
> > I am able to reproduce this crash on upstream.  The .config is for v5.1-rc1, so
> > that is what I tested with.  I compiled with gcc 9.1 and used the syz program
> > provided in the report.
> > 
> > The RIP register is null, so I had to fallback on the trace to find the site of
> > the error.
> > 
> > Trace:
> > 
> > [   74.096479][ T1179] Call Trace:
> > [   74.096479][ T1179]  hci_uart_set_flow_control+0x4fb/0x680
> > [   74.096479][ T1179]  mrvl_setup+0x22/0x110
> > [   74.096479][ T1179]  hci_uart_setup+0x2b0/0x530
> > [   74.096479][ T1179]  hci_dev_do_open+0x78c/0x1780
> > [   74.096479][ T1179]  hci_power_on+0x10d/0x580
> > 
> > The trace begins when an hci device being registered and a worker thread call to
> > hci_power_on().  The last call in the trace is to mrvl_setup() calling
> > hci_uart_set_flow_control().  The exact line of the error is:
> > 
> > status = tty->driver->ops->tiocmget(tty);
> > 
> > The above line is in hci_ldisc.c:327.
> > 
> > The syz program is below:
> > 
> > #{"procs":1,"sandbox":"","fault_call":-1}
> > r0 = openat$ptmx(0xffffffffffffff9c, &(0x7f0000000000)='/dev/ptmx\x00', 0x0, 0x0)
> > ioctl$TCSETS(r0, 0x40045431, &(0x7f00005befdc))
> > r1 = syz_open_pts(r0, 0x0)
> > ioctl$TIOCSETD(r1, 0x5423, &(0x7f00000000c0)=0xf)
> > ioctl$PIO_FONTRESET(r1, 0x400455c8, 0xb)
> > 
> > Analysis:
> > 
> > The syz program begins by mapping a ptmx device for a ptm/pts pair.  The program
> > then proceeds to set serial port settings and line discipline.  If look at the line
> > there the null dereference occurs, it appears that some operations on some drivers
> > may not be needed or supported.  I do not know enough about the device core to make
> > that determination.  I begin by looking for any patches that deal with
> > hci_uart_set_flow_control().
> > 
> > I find this patch:  https://patchwork.kernel.org/patch/9985313/
> > 
> > It appears that this patch is already in the branch so this is not the fix.  I then
> > look for patches that deal with tiocmget().  I find the following patch by Shuah:
> > 
> > https://lore.kernel.org/patchwork/patch/1035787/
> > 
> > This patch is along the same lines at the the bug I am seeing.  The discussion in
> > this patch mentions that setting line discipline on a master pty should not happen.
> > So I grab v2 of that patch here: https://lore.kernel.org/patchwork/patch/1037692/
> > 
> > I apply this patch and test again so see if this fixes the bug but got the same
> > trace.  I look harder for anything related to tiocmget() and finally find this patch:
> > 
> > https://lore.kernel.org/linux-bluetooth/20190212083645.GA7055 at myunghoj-Precision-5530/
> > 
> > I apply this patch, compile and test again.  No more trace this time.  Looks like this
> > patch works and it will fix this bug.
> > 
> > Fix:
> > 
> > This patch will fix this bug:
> > 
> > https://lore.kernel.org/linux-bluetooth/20190212083645.GA7055 at myunghoj-Precision-5530/
> > 
> > This patch will check to see if tiocmget or tiocmset is null in hci_uart_tty_open().
> > If either are null -EOPNOTSUPP is returned.
> > 
> 
> 
> Hi Jiunn,
> 
> Don't worry about this bug. Analysis is done on this and fix has been
> identified. There is no need do analysis on this one.
> 
> You have done the RCU documentation work and connected with RCU team.
> You could look into one of the rcu related issues for analysis.
> 
> 
> thanks,
> -- Shuah
> 

  Hello Shuah,

  Okay--will do.  I will look into one of the RCU related issues and provide and
  analysis.

  Thanks Shuah.

  Jiunn

> 
