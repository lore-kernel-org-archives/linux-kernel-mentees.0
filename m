From: gregkh at linuxfoundation.org (Greg KH)
Date: Thu, 3 Oct 2019 21:56:27 +0200
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] divide error in
 usbtmc_generic_read
In-Reply-To: <20191003193016.GA21429@localhost.localdomain>
References: <20191003193016.GA21429@localhost.localdomain>
Message-ID: <20191003195627.GA3590105@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Fri, Oct 04, 2019 at 01:00:16AM +0530, Jaskaran Singh wrote:
> Hi,
> 
> Following is my analysis of syzbot report:
> https://syzkaller.appspot.com/bug?id=688d05e810900459b03c82fb48dc609edbbf7df9
> 
> The bug pertains to a divide error. The report's call trace is as follows:
> 
>  usbtmc_ioctl_generic_read drivers/usb/class/usbtmc.c:1029 [inline]
>  usbtmc_ioctl+0x27d/0x2ab0 drivers/usb/class/usbtmc.c:2089
>  vfs_ioctl fs/ioctl.c:46 [inline]
>  file_ioctl fs/ioctl.c:509 [inline]
>  do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
>  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
>  __do_sys_ioctl fs/ioctl.c:720 [inline]
>  __se_sys_ioctl fs/ioctl.c:718 [inline]
>  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
>  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> The file:line where the error occurs is this:
> 	drivers/usb/class/usbtmc.c:816
> 
> Line 816 of that file is as follows:
> 		if ((max_transfer_size % data->wMaxPacketSize) == 0)
> 
> Running a 'git blame' on the file in question reveals that the last
> modification to line 816 was commit bb99794a4792068cb4bfd40e99e0f9d8fe7872fa.
> The commit adds the USBTMC_IOCTL_READ call for the driver, and thus the
> usbtmc_generic_read function.
> 
> I was not able to reproduce the error using my native machine and the
> same gcc version used by syzkaller (gcc 9.0.0 20181231). However, the
> error probably occurs because data->wMaxPacketSize is zero.
> 
> An intuitive fix for this seems to be:
> 
> -		if ((max_transfer_size % data->wMaxPacketSize) == 0)
> +		if (data->wMaxPacketSize &&
> +		    (max_transfer_size % data->wMaxPacketSize) == 0)
> 
> Or perhaps introduce a guard condition above line 816 to raise an error.

Yes, if wMaxPacketSize is 0, then the code should just return an error.
Care to make up a patch for this and submit it to syzbot to see if it
solves the problem or not?

thanks,

greg k-h
