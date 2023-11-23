Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0592111F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kMJh48iH"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C219240AA2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 09:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C219240AA2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kMJh48iH
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sf3h_S4VHO88
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 23 Nov 2023 09:43:27 +0000 (UTC)
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 58BC3403E7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 09:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58BC3403E7
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-45dadc5bf51so226914137.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Nov 2023 01:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700732606; x=1701337406; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lryrEVp0pcZo60SdyGtopQxDXDiRzsB0TNAuuSGzQ+0=;
        b=kMJh48iHO8usrb5fe9yO8LE1fCJBykJwcNNFy5A+N+WEUFwjyFcw9YNNSmbGIzyNeC
         5H+luhZHAwKWjbAeMCNS3ap8Yr9Fwy1Hya0iBFCXbRb0af3nFfYoRHAgcg9hHwJO/sd8
         kedJXBZl/RpyW3FNJjUGqSoXpJLni7/MJBRinb7gOOSTDUrJmaO8phUHWTjH5IfkXO9A
         ej3yFFBFLN4OKnr1Sb9xF0Af6uYON84xuHQBto3RvA9hxkPcd+hYFdlTti2aHwE/bEth
         NgSAOB04IGnwyMvMc437kW5uTlKjWO6r6SpTrBURg+HgnJ6CRBLOIQdPoCe8JEpanraN
         ytBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732606; x=1701337406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lryrEVp0pcZo60SdyGtopQxDXDiRzsB0TNAuuSGzQ+0=;
        b=Zv+dRwDUUzWPfkGCXmNvZzSxteuFBzQrQQcw1/1D4PN6dx0TPNUe0KhqA5AuIgki+v
         OwvB8CLFBZfW3hDw81o/FGQ8NJO7CEw4wlj9vkvRKQLSmZ1+C59C0erlRjHrkeIReijY
         G9LEvLGvye6OhOTwhgrZVEMhmBsaTv7Z6tgooC4HG2V/Zel2j8U57g+1UWLXw7rbgFG9
         Wi8gcDQUyjlZY5mIemOe8ZNbW6Zzt8H4dVMxNTi6rPPL/WVI11ojmurKRISm/4ZAyjt5
         +8C2bZ1bucRaBzPhLA1/dAshrMWuJIVe9do+Dm5/FCRqNhCgSHHE9MVvuIQVRFE6OvaY
         pwqw==
X-Gm-Message-State: AOJu0Yw0lkmpC+CKbuI+O/6fgHP6wi328EFqYmOv54+wjdPwGCDqfNIQ
	6Z7qXLRLAbX0+AL2TipU53q5o/zeqsUVISNzMxRxYQ==
X-Google-Smtp-Source: AGHT+IFqBeOIaHKyrXq881wDBVRDXzgnV4q21QPK5FmdAqeYGDfmK15LNRbrY0A1mdpRtly2i/6RSHFK1Xb0kdQGGL8=
X-Received: by 2002:a05:6102:1004:b0:45d:aa3e:a78 with SMTP id
 q4-20020a056102100400b0045daa3e0a78mr5613596vsp.10.1700732605928; Thu, 23 Nov
 2023 01:43:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <VI1P193MB0752A2F21C050D701945B62799BAA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CANpmjNPvDhyEcc0DdxrL8hVd0rZ-J4k95R5M5AwoeSotg-HCVg@mail.gmail.com>
 <VI1P193MB0752E3CA6B2660860BD3923D99BAA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
 <CANpmjNMejg7ekEhuuwdxpzOk5-mO+xn+qEL1qmx8ZVQG9bz_XA@mail.gmail.com> <VI1P193MB0752D8881930F88BACFB56A499B9A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P193MB0752D8881930F88BACFB56A499B9A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
From: Marco Elver <elver@google.com>
Date: Thu, 23 Nov 2023 10:42:48 +0100
Message-ID: <CANpmjNNHe7YnA_n_Ek4_NJuq99jOH5PJfWtAkc5u8fMNJpFOSA@mail.gmail.com>
Subject: Re: [PATCH] kfence: Replace local_clock() with ktime_get_boot_fast_ns()
To: Juntong Deng <juntong.deng@outlook.com>
Cc: glider@google.com, dvyukov@google.com, akpm@linux-foundation.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Nov 2023 at 10:29, Juntong Deng <juntong.deng@outlook.com> wrote:
>
> On 2023/11/23 6:19, Marco Elver wrote:
> > On Wed, 22 Nov 2023 at 22:36, Juntong Deng <juntong.deng@outlook.com> wrote:
> >>
> >> On 2023/11/23 4:35, Marco Elver wrote:
> >>> On Wed, 22 Nov 2023 at 21:01, Juntong Deng <juntong.deng@outlook.com> wrote:
> >>>>
> >>>> The time obtained by local_clock() is the local CPU time, which may
> >>>> drift between CPUs and is not suitable for comparison across CPUs.
> >>>>
> >>>> It is possible for allocation and free to occur on different CPUs,
> >>>> and using local_clock() to record timestamps may cause confusion.
> >>>
> >>> The same problem exists with printk logging.
> >>>
> >>>> ktime_get_boot_fast_ns() is based on clock sources and can be used
> >>>> reliably and accurately for comparison across CPUs.
> >>>
> >>> You may be right here, however, the choice of local_clock() was
> >>> deliberate: it's the same timestamp source that printk uses.
> >>>
> >>> Also, on systems where there is drift, the arch selects
> >>> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK (like on x86) and the drift is
> >>> generally bounded.
> >>>
> >>>> Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
> >>>> ---
> >>>>    mm/kfence/core.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> >>>> index 3872528d0963..041c03394193 100644
> >>>> --- a/mm/kfence/core.c
> >>>> +++ b/mm/kfence/core.c
> >>>> @@ -295,7 +295,7 @@ metadata_update_state(struct kfence_metadata *meta, enum kfence_object_state nex
> >>>>           track->num_stack_entries = num_stack_entries;
> >>>>           track->pid = task_pid_nr(current);
> >>>>           track->cpu = raw_smp_processor_id();
> >>>> -       track->ts_nsec = local_clock(); /* Same source as printk timestamps. */
> >>>> +       track->ts_nsec = ktime_get_boot_fast_ns();
> >>>
> >>> You have ignored the comment placed here - now it's no longer the same
> >>> source as printk timestamps. I think not being able to correlate
> >>> information from KFENCE reports with timestamps in lines from printk
> >>> is worse.
> >>>
> >>> For now, I have to Nack: Unless you can prove that
> >>> ktime_get_boot_fast_ns() can still be correlated with timestamps from
> >>> printk timestamps, I think this change only trades one problem for
> >>> another.
> >>>
> >>> Thanks,
> >>> -- Marco
> >>
> >> Honestly, the possibility of accurately matching a message in the printk
> >> log by the timestamp in the kfence report is very low, since allocation
> >> and free do not directly correspond to a certain event.
> >
> > It's about being able to compare the timestamps. I don't want to match
> > an exact event, but be able to figure out which event happened
> > before/after an allocation or free, i.e. the logical ordering of
> > events.
> >
> > With CONFIG_PRINTK_CALLER we can see the CPU ID in printk lines and
> > are therefore able to accurately compare printk lines with information
> > given by KFENCE alloc/free info.
> >
>
>
> That makes sense.
>
>
> >> Since time drifts across CPUs, timestamps may be different even if
> >> allocation and free can correspond to a certain event.
> >
> > This is not a problem with CONFIG_PRINTK_CALLER.
> >
> >> If we really need to find the relevant printk logs by the timestamps in
> >> the kfence report, all we can do is to look for messages that are within
> >> a certain time range.
> >>
> >> If we are looking for messages in a certain time range, there is not
> >> much difference between local_clock() and ktime_get_boot_fast_ns().
> >>
> >> Also, this patch is in preparation for my next patch.
> >>
> >> My next patch is to show the PID, CPU number, and timestamp when the
> >> error occurred, in this case time drift from different CPUs can
> >> cause confusion.
> >
> > It's not quite clear how there's a dependency between this patch and a
> > later patch, but generally it's good practice to send related patches
> > as a patch series. That way it's easier to see what the overall
> > changes are and provide feedback as a whole - as is, it's difficult to
> > provide feedback.
> >
> > However, from what you say this information is already given.
> > dump_stack_print_info() shows this - e.g this bit here is printed by
> > where the error occurred:
> >
> > | CPU: 0 PID: 484 Comm: kunit_try_catch Not tainted 5.13.0-rc3+ #7
> > | Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2
> > 04/01/2014
> >
> > And if the printk log has timestamps, then these lines are prefixed
> > with the timestamp where the error occurred.
> >
>
>
> Thanks, I found that information.
>
> Since this information is at the bottom of the report, I had previously
> ignored them.
>
> I would suggest considering moving this information to the top of
> the report, for example
>
> BUG: KFENCE: out-of-bounds read in test_out_of_bounds_read+0xa6/0x234
>
> CPU: 0 PID: 484 Comm: kunit_try_catch Not tainted 5.13.0-rc3+ #7
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2
> 04/01/2014
>
> Out-of-bounds read at 0xffff8c3f2e291fff (1B left of kfence-#72):
> ...
>
> This more clearly correlates this information with the occurrence of
> the error.

Most kernel warnings/bugs/etc. show this information at the bottom of
the report, hence KFENCE also showing it there. If you look at
kfence_report_error() where it prints this info, there is a mode where
KFENCE also dumps all registers via show_regs(). show_regs() itself
displays this information at the bottom as well, but showing a dump of
registers at the start of the KFENCE report is pretty distracting and
looks ugly.

The placement of this information is not the best, but at the same
time I found it to be the least bad compromise (when also considering
the mode where it dumps registers). We could of course untangle some
of these functions and e.g. have a show_regs() version that doesn't
show that info, but I find that to add more interfaces to the kernel
with unclear gains - overall probably not worth the time effort.

At least that's the reasoning for why things are the way they are
today. If there is an easier way I missed, any clear improvements are
of course welcome.

Thanks,
-- Marco
