Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD1EC761AF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Mar 2023 01:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E89340550;
	Fri, 31 Mar 2023 01:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E89340550
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Y8Ry0QCY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJFW-jJZRt1R; Fri, 31 Mar 2023 01:33:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 36CB840128;
	Fri, 31 Mar 2023 01:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36CB840128
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD70DC0037;
	Fri, 31 Mar 2023 01:33:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6856AC002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Mar 2023 01:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4245760BB0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Mar 2023 01:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4245760BB0
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20210112 header.b=Y8Ry0QCY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKC2JAv4KUt1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Mar 2023 01:33:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BED360BA0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BED360BA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Mar 2023 01:33:06 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1a19cf1b8ddso193955ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Mar 2023 18:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680226386;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R5BfCm5LJSVqy2GRHOsUJLl8pmivkWNOPbogWlIH6Rc=;
 b=Y8Ry0QCYqWVPclUT/1jUKuJYd+7uWZaq74QJQqc8efWHkb900SDo2HMu0kIugifNRh
 LWqUvZJC63jDus2mCRJPyzprpKkvqn3v1ianxtQ9baMza5eYGYq4dfC70/6SAVp43XXl
 JvOZzMtCkNHHJGAi+uoHRRxCf8KPTvwcNUbRfQrls8oh0DAEl4DYJsQqSmCZIbTCZEcZ
 H4aBlgXWvXufx5zMklBmShASI3SDFY70ClUDfDDriq4q9NuHQClzg9OjDyPnPqV1JP2R
 2C2FxeiTHQSXA+IizhpWOOa43pmaj20t3y3lsM9jf/HOdUXXVZBvMTnNEe3vdEJNzjPk
 TCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680226386;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R5BfCm5LJSVqy2GRHOsUJLl8pmivkWNOPbogWlIH6Rc=;
 b=ugaDSFPbuxahcl67jTliWrbZcVJH1+Bu+PGdZFbx+1VySlttmn/LO/ltiolbUqNGBE
 Whet7lwPk9CP5io9FBDyKXimrrPAo7bcYAvNulZXTkFMU5z8Y6DpZwo3UmSq8OAnbJuf
 NbnBrIrTO852pf/1UMXknSkq7WqAayi60qABVz5Qt4POw0R8gxKKiCmhvTl5bx5tUqn+
 4KZkHlcF9wVm+J8/zkeOm88b8Jbys0s/khrOXr1scXca6+GWXcR4wtsiHx1wG4Ndn5Tz
 CbnssrDXwcJVBV5iXVjb2iNwXxu6xQA6oS+53KH3wO0QFfb8HA415ZPvLta7FSkmHU0Y
 o7Dg==
X-Gm-Message-State: AAQBX9cvxDtFpXjwX7eZBJIpzHEPJTCLhXiNQQTswog3oC41Cjy3TIxw
 FGkq86+lFDyZ9/WN5Jt40rR6IA==
X-Google-Smtp-Source: AKy350a+u7aNz6PUTYlfRL+pBCp4Ct/UTl/zfYVGu9lLcjxUhgffncrwJ7qIFLd4w1puQdArVVoXtw==
X-Received: by 2002:a17:902:c20c:b0:1a2:4bc:5420 with SMTP id
 12-20020a170902c20c00b001a204bc5420mr133571pll.10.1680226385545; 
 Thu, 30 Mar 2023 18:33:05 -0700 (PDT)
Received: from google.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
 by smtp.gmail.com with ESMTPSA id
 13-20020aa7924d000000b006262520ac59sm469774pfp.127.2023.03.30.18.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 18:33:04 -0700 (PDT)
Date: Thu, 30 Mar 2023 18:33:01 -0700
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH v2] mm: khugepaged: Fix kernel BUG in
 hpage_collapse_scan_file
Message-ID: <20230331013301.ecgkjymaf3ws6rfb@google.com>
References: <20230330155305.423051-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230330155305.423051-1-ivan.orlov0322@gmail.com>
Cc: shy828301@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com,
 akpm@linux-foundation.org, linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
From: Zach O'Keefe via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Zach O'Keefe <zokeefe@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mar 30 19:53, Ivan Orlov wrote:
> Syzkaller reported the following issue:
> 
> kernel BUG at mm/khugepaged.c:1823!
> invalid opcode: 0000 [#1] PREEMPT SMP KASAN
> CPU: 1 PID: 5097 Comm: syz-executor220 Not tainted 6.2.0-syzkaller-13154-g857f1268a591 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/16/2023
> RIP: 0010:collapse_file mm/khugepaged.c:1823 [inline]
> RIP: 0010:hpage_collapse_scan_file+0x67c8/0x7580 mm/khugepaged.c:2233
> Code: 00 00 89 de e8 c9 66 a3 ff 31 ff 89 de e8 c0 66 a3 ff 45 84 f6 0f 85 28 0d 00 00 e8 22 64 a3 ff e9 dc f7 ff ff e8 18 64 a3 ff <0f> 0b f3 0f 1e fa e8 0d 64 a3 ff e9 93 f6 ff ff f3 0f 1e fa 4c 89
> RSP: 0018:ffffc90003dff4e0 EFLAGS: 00010093
> RAX: ffffffff81e95988 RBX: 00000000000001c1 RCX: ffff8880205b3a80
> RDX: 0000000000000000 RSI: 00000000000001c0 RDI: 00000000000001c1
> RBP: ffffc90003dff830 R08: ffffffff81e90e67 R09: fffffbfff1a433c3
> R10: 0000000000000000 R11: dffffc0000000001 R12: 0000000000000000
> R13: ffffc90003dff6c0 R14: 00000000000001c0 R15: 0000000000000000
> FS:  00007fdbae5ee700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fdbae6901e0 CR3: 000000007b2dd000 CR4: 00000000003506e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  madvise_collapse+0x721/0xf50 mm/khugepaged.c:2693
>  madvise_vma_behavior mm/madvise.c:1086 [inline]
>  madvise_walk_vmas mm/madvise.c:1260 [inline]
>  do_madvise+0x9e5/0x4680 mm/madvise.c:1439
>  __do_sys_madvise mm/madvise.c:1452 [inline]
>  __se_sys_madvise mm/madvise.c:1450 [inline]
>  __x64_sys_madvise+0xa5/0xb0 mm/madvise.c:1450
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 

Thanks, Ivan.

In the process of reviewing this, I starting thinking if the !shmem case was
also susceptible to a similar race, and I *think* it might be. Unfortunately, my
time has ran out, and I haven't been able to validate ; I'm less familiar with
the file-side of things.

The underlying problem is race with truncation/hole-punch  under OOM condition.
The nice do-while loop near the top of collapse_file() attempts to avoid this
scenario by making sure enough slots are available. However, when we drop xarray
lock, we open ourselves up to concurrent removal + slot deletion. Those slots
then need to be allocated again -- which under OOM condition is failable.

The syzbot reproducer picks on shmem, but I think this can occur for file as
well. If we find a hole, we unlock the xarray and call
page_cache_sync_readahead(), which if it succeeds, IIUC, will have allocated a
new slot in our mapping pointing to the new page. We *then* locks the page. Only
after the page is locked are we protected from concurrent removal (Note: this is
what provides us protection in many of the xas_store() cases ; we've held the
slot's contained page-lock since verifying the slot exists, protecting us from
removal / reallocation races).

Maybe I'm just low on caffeine at the end of the day, and am missing something,
but if I had more time, I'd be looking into the file-side some more to verify.
Apologies that hasn't occurred to me until now ; I was looking at one of your
comments and double-checked why I *thought* we were safe.

Anyways, irrespective of that looming issues, some more notes to follow:

> The 'xas_store' call during page cache scanning can potentially
> translate 'xas' into the error state (with the reproducer provided
> by the syzkaller the error code is -ENOMEM). However, there are no
> further checks after the 'xas_store', and the next call of 'xas_next'
> at the start of the scanning cycle doesn't increase the xa_index,
> and the issue occurs.
> 
> This patch will add the xarray state error checking after the
> 'xas_store' and the corresponding result error code. It will
> also add xarray state error checking via WARN_ON_ONCE macros,
> to be sure that ENOMEM or other possible errors don't occur
> at the places they shouldn't.

Thanks for the additions here. I think it's worthwhile providing even more
details about the specifics of the race we are fixing and/or guarding against to
help ppl understand how that -ENOMEM comes about if the do-while loop has
"Ensured" we have slots available (additionally, I think that comment can be
augmented).

> Tested via syzbot.
> 
> Reported-by: syzbot+9578faa5475acb35fa50@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=7d6bb3760e026ece7524500fe44fb024a0e959fc
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
> V1 -> V2: Add WARN_ON_ONCE error checking and comments
> 
>  mm/khugepaged.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 92e6f56a932d..8b6580b13339 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -55,6 +55,7 @@ enum scan_result {
>  	SCAN_CGROUP_CHARGE_FAIL,
>  	SCAN_TRUNCATED,
>  	SCAN_PAGE_HAS_PRIVATE,
> +	SCAN_STORE_FAILED,
>  };

I'm still reluctant to add a new error code for this as this seems like quite a
rare race that requires OOM to trigger. I'd be happier just reusing SCAN_FAIL,
or, something we might get some millage out of later: SCAN_OOM.

Also, a reminder to update include/trace/events/huge_memory.h, if you go that
route.

>  
>  #define CREATE_TRACE_POINTS
> @@ -1840,6 +1841,15 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
>  					goto xa_locked;
>  				}
>  				xas_store(&xas, hpage);
> +				if (xas_error(&xas)) {
> +					/* revert shmem_charge performed
> +					 * in the previous condition
> +					 */

Nit: Here, and following, I think standard convention for multiline comment is
to have an empty first and last line, eg:

 +					/*
 +					 * revert shmem_charge performed
 +					 * in the previous condition
 +					 */

Though, checkpatch.pl --strict didn't seem to care.

> +					mapping->nrpages--;
> +					shmem_uncharge(mapping->host, 1);
> +					result = SCAN_STORE_FAILED;
> +					goto xa_locked;
> +				}
>  				nr_none++;
>  				continue;
>  			}
> @@ -1992,6 +2002,11 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
>  
>  		/* Finally, replace with the new page. */
>  		xas_store(&xas, hpage);
> +		/* We can't get an ENOMEM here (because the allocation happened before)
> +		 * but let's check for errors (XArray implementation can be
> +		 * changed in the future)
> +		 */
> +		WARN_ON_ONCE(xas_error(&xas));

Nit: it's not just that allocation happened before -- need some guarantee we've
been protected from concurrent removal. This is what made me look at the file
side.

>  		continue;
>  out_unlock:
>  		unlock_page(page);
> @@ -2029,6 +2044,11 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
>  	/* Join all the small entries into a single multi-index entry */
>  	xas_set_order(&xas, start, HPAGE_PMD_ORDER);
>  	xas_store(&xas, hpage);
> +	/* Here we can't get an ENOMEM (because entries were
> +	 * previously allocated) But let's check for errors
> +	 * (XArray implementation can be changed in the future)
> +	 */
> +	WARN_ON_ONCE(xas_error(&xas));

Ditto.

Apologies I won't be around to see this change through -- I'm just out of time,
and will be shutting my computer down tomorrow for 3 months.  Sorry for the poor
timing, for raising issues, then disappearing. Hopefully I'm wrong and the
file-side isn't a concern.

Best,
Zach

>  xa_locked:
>  	xas_unlock_irq(&xas);
>  xa_unlocked:
> -- 
> 2.34.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
