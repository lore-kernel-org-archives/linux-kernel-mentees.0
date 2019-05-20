From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Mon, 20 May 2019 01:04:32 -0600
Subject: [Linux-kernel-mentees] [SYZBOT REPORT] WARNING in
	vkms_vblank_simulate
In-Reply-To: <a604a925-57ee-2933-90c2-6bc62b9c644a@linuxfoundation.org>
References: <20190517164651.GA5873@asus>
	<a604a925-57ee-2933-90c2-6bc62b9c644a@linuxfoundation.org>
Message-ID: <20190520070430.GA2527@asus>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Fri, May 17, 2019 at 12:24:56PM -0600, Shuah Khan wrote:
> On 5/17/19 10:46 AM, Kelsey Skunberg wrote:
> > WARNING in vkms_vblank_simulate
> > 
> > https://syzkaller.appspot.com/bug?id=0ba17d70d062b2595e1f061231474800f076c7cb
> > 
> > Warning appears when a call to hrtimer_forward_now() fails.
> > A bisection was provided and determined warning started with
> > the following patch:
> > 
> > https://patchwork.freedesktop.org/patch/284352/
> > 
> > Introduction of WARNING is clear since the patch is adding a
> > WARN_ON() which alerts if the return of hrtimer_forward_now()
> > function is not 1. This error was likely being produced before
> > this patch was implemented.
> > 
> It looks like only a few callers of hrtimer_forward_now() bother to
> check the return. Probably it doesn't matter in many cases.
> 
> The patch commit log doesn't really explain why the tolerance for
> overrun is 1. I am not sure if WARN_ON is even necessary here.
> 
> > Function where WARN_ON() is called after calling hrtimer_forward_now()
> > can be found here:
> > drivers/gpu/drm/vkms/vkms_crtc.c
> > 
> > hrtimer_forward_now() calls return hrtimer_forward() which
> > verifies if request to forward the timer expiry is valid.
> > hrtimer_forward() is further explored below:
> > 
> > Function Objective:
> >   * hrtimer_forward - forward the timer expiry
> > 
> > Function Location:
> > kernel/time/hrtimer.c
> > 
> > Variables:
> >   * @timer:      hrtimer to forward
> >   * @now:        forward past this time
> >   * @interval:   the interval to forward
> >   * @delta:      @now ? timer expiry
> > 
> > A warning is issued if one of the following are met:
> > 
> > 	[1] If starting time expiry is greater than ?now?
> > 
> > 	[2] If the number of intervals needed to pass ?now? is
> > 	    greater than 1.
> > 
> > In the listed crashes with reproducers the kernel version is 5.0.0
> > and multiple reports without reproducers on kernel version 5.1.0
> >  > I had the option to test on kernel versions 5.1.0-rc7 and 5.1.2 with
> > no success of reproducing. I was able to verify that the WARN_ON() is
> > still checked in the vkms_crtc.c file. Reproducer was ran individually and in a
> > loop to attempt triggering, though to no avail. It?s possible for debugging
> > going to kernel 5.0.0 to test reproducer and find where the warning is typically
> > triggered from could help find the problem. Since the reports are only on 5.0.0
> > and 5.1.0 (atleast in this report), it's possible the changes in
> > newer kernels have resolved the error.
> > 
> 
> This might be an obvious question. Do you have DRM_VKMS enabled in your
> config. More like, are you using the same config the report is using.
> 
> https://syzkaller.appspot.com/text?tag=KernelConfig&x=c1e0e0ec44d1e5ff
> 
> thanks,
> -- Shuah

I double checked and this is when DRM_VKMS enabled, yes. However, when I
first tried to compile with the provided config file in whole I recieved an
error when running "make modules_install install". So I only changed
this portion of the config file which modules installed fine on, except I was
still unable to reproduce the Warning.

I have extra time this week I want to come back to explore this and
attempt reproducing. I'll see about taking the full config file and
debug the errors I'm recieving when building modules if that occurs again.

Let me know if you have any suggestions or futher reccomendations. Thank
you!

Cheers,
Kelsey
