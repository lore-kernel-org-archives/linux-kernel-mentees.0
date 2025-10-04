Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D5A1A08A3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 08:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759566855; cv=none; b=Yn3jiqFFFhG0JEHELym8ex55fU/h1Tn0czgeV6Xc2MD8mC8KGYrnDk5tnHm7wj3TxtdF10kboXm6no5RNbTSe+eAur3zVJ3VGUdOpau/7OVQR3l9cZ1lUwhy2V4faFjB8irYUfSwOdEY7Erbc3eNN16F6nwPC+O+jtQEEgXltP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759566855; c=relaxed/simple;
	bh=ewAScujQh6IO+nNyoKcQ1124xJn4eyXuYWjb3HxVNyI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oDhfKNWRBVWz1vB87/b0VWtgAp9QgPuVK/6zmsah8SsN9VVoCo4jACvnWHPpmjisygrmhEGOMrJte/nrIzbtjL6/lzIsFqpUqg4QfNUaNEC9HMw4/HB21yEgtnzDMUEvRRXyogWabqwILWhxEjJuhnzmsdUPWfEBf9TUVWNgdsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TjNB8KUZ; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TjNB8KUZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EF37410A6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 08:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -9.601
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzyCeaK7iAzJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  4 Oct 2025 08:34:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3bnzgaackai0f4rwwzax55x2v.t53@flex--ynaffit.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29DDA410A3
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29DDA410A3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TjNB8KUZ
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 29DDA410A3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  4 Oct 2025 08:34:12 +0000 (UTC)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-336b9f3b5b0so3548254a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 04 Oct 2025 01:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759566852; x=1760171652; darn=lists.linuxfoundation.org;
        h=cc:to:from:subject:message-id:user-agent:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DNUXIAMIgyuQcbpSIlbWyb8Yr08Un31/NnbXWZYjsP0=;
        b=TjNB8KUZfvgEbs7yJ6Q/fMWH323G54nlK9eyhw5vDcO5Cn2ri+n+Xj2s44IzvPdfE7
         p3GEviR7Q1j6VAxNAAYKlNqC1rFCrXCXUGNc+EY7m+rUEjQx3k7pGkhXYlAEL0Jv0cyl
         gqL44DbxTgX/2y0X9FWEx0Pmq2XfeuG/vK6LeD6+gVNS6ugHrOGWGN7qWAt2JW6ClgaQ
         v3xSbQZBtaWfnnGJvezFySvAmqa5DhEhBKH75xBfHcDmxC/0276PpvM54oddeXJAnmjx
         Ksh3bpEUxlgWJXlI+vLJvQ59Ao4kAqwldxJbSb10ERhWYlGhlrwS4WJPM0mYGJRXEbyI
         KHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759566852; x=1760171652;
        h=cc:to:from:subject:message-id:user-agent:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNUXIAMIgyuQcbpSIlbWyb8Yr08Un31/NnbXWZYjsP0=;
        b=KqNR9IThgFLiXn6h68S5aqddsLm1EwTT+/FBpFuK+hZyHpfsrnnnJFY7xCHUIhSO4H
         a1IQ6+uv6Oq641k5k+6eQC6yNSvyKbGqTgYL+6NJGTvji5rdKm3AOINPVxSR4SJNTZnT
         sHXUU4k/H/l7i9mHHSiqKK8qQldotvJqB+79w1JRwOFEQvCdRMxMzpQZklb6vvPbzfzO
         XN1fxEijGutFlR0Ro7Nf9NUQvg3GIr6pN61YPKkJu3BVrecZzL8cFkNYdkjNPAfMUOzj
         9t6lZEIyTSQIi1Cumf5qbCAT3hMFqDfWrLm5asqdEAvTVZ//N6yeZW5HxXUb7DqPhiJp
         J2zg==
X-Forwarded-Encrypted: i=1; AJvYcCXJW2tSV40rzPZ0gAE0GCKfF+7UAuEbp+aKKhtmgoA1D517u4x9RkJP3SvlflueFWQ7NPHpKIq99YX4iw9wMLtM8kadVA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxJD6tLtkzuhA3rp7YwpswRvMFovD7YqC+T/CbTxRrJ3TS08Vjm
	OgCsOU3GEOTtO5Y5ZHcVcPWsK+DWN+tlGP2zM6elqvr79OmGb6Z40UgECc79kDbBDNQDN+teHOa
	PJJidK+MkFA==
X-Google-Smtp-Source: AGHT+IG8WMGHaurimhri+gW5zRlp6uwHUCV2xHoW/prUeoq2RpfxaFVx0IibIcEVP1lg9S9cRSoC1Wbb2vOb
X-Received: from pjzh5.prod.google.com ([2002:a17:90a:ea85:b0:32d:e264:a78e])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3ec6:b0:330:3fb8:3885
 with SMTP id 98e67ed59e1d1-339c276e814mr6792475a91.18.1759566852200; Sat, 04
 Oct 2025 01:34:12 -0700 (PDT)
Date: Sat, 04 Oct 2025 01:34:10 -0700
In-Reply-To: <20251003114555.413804-1-nirbhay.lkd@gmail.com> (Nirbhay Sharma's
 message of "Fri, 3 Oct 2025 17:15:55 +0530")
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251003114555.413804-1-nirbhay.lkd@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Message-ID: <dbx87bxbvzel.fsf@ynaffit-andsys.c.googlers.com>
Subject: Re: [PATCH] cgroup: Fix seqcount lockdep assertion in cgroup freezer
From: Tiffany Yang <ynaffit@google.com>
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"Michal =?utf-8?Q?Koutn=C3=BD?=" <mkoutny@suse.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	syzbot+27a2519eb4dad86d0156@syzkaller.appspotmail.com, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Nirbhay Sharma <nirbhay.lkd@gmail.com> writes:

> The commit afa3701c0e45 ("cgroup: cgroup.stat.local time accounting")
> introduced a seqcount to track freeze timing but initialized it as a
> plain seqcount_t using seqcount_init().

> However, the write-side critical section in cgroup_do_freeze() holds
> the css_set_lock spinlock while calling write_seqcount_begin(). On
> PREEMPT_RT kernels, spinlocks do not disable preemption, causing the
> lockdep assertion for a plain seqcount_t, which checks for preemption
> being disabled, to fail.

> This triggers the following warning:
>    WARNING: CPU: 0 PID: 9692 at include/linux/seqlock.h:221

> Fix this by changing the type to seqcount_spinlock_t and initializing
> it with seqcount_spinlock_init() to associate css_set_lock with the
> seqcount. This allows lockdep to correctly validate that the spinlock
> is held during write operations, resolving the assertion failure on all
> kernel configurations.

> Reported-by: syzbot+27a2519eb4dad86d0156@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=27a2519eb4dad86d0156
> Fixes: afa3701c0e45 ("cgroup: cgroup.stat.local time accounting")
> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
> ---
>   include/linux/cgroup-defs.h | 2 +-
>   kernel/cgroup/cgroup.c      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

> diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
> index 539c64eeef38..933c4487a846 100644
> --- a/include/linux/cgroup-defs.h
> +++ b/include/linux/cgroup-defs.h
> @@ -435,7 +435,7 @@ struct cgroup_freezer_state {
>   	int nr_frozen_tasks;

>   	/* Freeze time data consistency protection */
> -	seqcount_t freeze_seq;
> +	seqcount_spinlock_t freeze_seq;

>   	/*
>   	 * Most recent time the cgroup was requested to freeze.
> diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
> index ab096b884bbc..fe175326b155 100644
> --- a/kernel/cgroup/cgroup.c
> +++ b/kernel/cgroup/cgroup.c
> @@ -5789,7 +5789,7 @@ static struct cgroup *cgroup_create(struct cgroup  
> *parent, const char *name,
>   	 * if the parent has to be frozen, the child has too.
>   	 */
>   	cgrp->freezer.e_freeze = parent->freezer.e_freeze;
> -	seqcount_init(&cgrp->freezer.freeze_seq);
> +	seqcount_spinlock_init(&cgrp->freezer.freeze_seq, &css_set_lock);
>   	if (cgrp->freezer.e_freeze) {
>   		/*
>   		 * Set the CGRP_FREEZE flag, so when a process will be

Thanks for this fix, Nirbhay!

-- 
Tiffany Y. Yang
