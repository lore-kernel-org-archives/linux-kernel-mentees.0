From: skhan at linuxfoundation.org (Shuah Khan)
Date: Tue, 14 May 2019 14:14:39 -0600
Subject: [Linux-kernel-mentees] Syzbot analysis;
 KASAN: null-ptr-deref Read in zr364xx_vidioc_querycap
In-Reply-To: <71bf3532-9233-def6-9b3d-53b90d3546a3@gmail.com>
References: <71bf3532-9233-def6-9b3d-53b90d3546a3@gmail.com>
Message-ID: <e28c8e7d-6595-e31d-6bfe-73bd5993277d@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hi Vandana,

On 5/11/19 1:44 AM, Vandana BN wrote:
> This is a NULL pointer derefrence bug in USB_ZR364XX driver.
> 
> KASAN: null-ptr-deref Read in zr364xx_vidioc_querycap 
> <https://syzkaller.appspot.com/bug?id=9c0c178c24d828a7378f483309001329750aad64>
> 
> 
> The ioctl vidioc_querycap() is used to get capablity of driver and hardware.
> USB_ZR364XX driver registers zr364xx_vidioc_querycap() as 
> .vidioc_querycap funtion which is part of v4l2_ioctl_ops in v4l2.
> When VIDIOC_QUERYCAP ioctl is called, the below function path is traversed
> 
>  ?v4l2_ioctl()->video_usercopy()->__video_do_ioctl()->v4l_querycap()->zr364xx_vidioc_querycap()
> 
> which further calls below funtions
> 
> strcpy()->read_word_at_a_time()->kasan_check_read()->check_memory_region()->check_memory_region_inline->kasan_report().
> 
> In function check_memory_region(), if the input addr is not valid, that is,
> if addr is greater than KASAN_SHADOW_START which is VA_START - the first 
> kernel virtual address.
> then, kasan_report() get called which prints the stack seen in bug 
> report via dump_stack().
> 
> The stack trace in the bug points at below line in zr364xx_vidioc_querycap()
> 
> "706 strscpy(cap->card, cam->udev->product, sizeof(cap->card));"
> 
> The bug report has the below line which? tells that the addr which is 
> src(cam->udev->product) in the above strcpy() is NULL.
> 
> "Read of size 1 at addr 0000000000000000 by task v4l_id/5287"
> 
> So, for this device the Product is not initialized and accessing it 
> causes a NULL pointer deref.
> 
> Also, in usb.h in comment on struct usb_device it says
> "@product: iProduct string, if present (static)" .
> I deduce that product can be NULL from this, and in all other places 
> where udev->product is accessed does NULL check before accessing it.
> 

Correct. Other drivers do check if product in null first.

> The fix would be to check for NULL before strcpy or/and copy DRIVER_DESC 
> or "zr364xx" to cap->card insted in zr364xx_vidioc_querycap().
> 

Right. A null check would fix the problem. Send the fix in. cc'ing Hans
on this

thanks,
-- Shuah
