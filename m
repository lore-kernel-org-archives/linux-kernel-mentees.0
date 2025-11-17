Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2475F1F19A
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Nov 2025 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763388656; cv=none; b=hkW+y3C28svc0k7Y9bt/P1T7zkK6CUkWecNWCdKA0/MyBnVSqJtqUpfk/27z6Yx8s1hPQeo8O5Wi+fK7lWUaV1epbaH2QnZWt2vNTZKx42m5jepv90CKV83I1pDOv41wmr6pVa4CYWHSVe9o6obZmXRdiB9XdLAyzgjGZoS3mJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763388656; c=relaxed/simple;
	bh=F2Ua36tXeKfRdmHPae8b9CvhsWDEBwQq83nyEUZ4THw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlRnRAp5cdd+Smu3QQ5qeLucL43zlfp+usHMfj4nFWYwdeuOO9Jjn2BT0U5JhylyHy5l4yMX0yOygeNaQnPWJZjNjsxAi9SW2ptnjz2D9ZdIrDVuIks3jMxOnodpJfN+VxMht8oKkGzEh5U8a7dQqpH5MPF+BiuCnnqeUbQ//fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=YU3kVGEI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="YU3kVGEI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2984dfae0acso58284325ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Nov 2025 06:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1763388654; x=1763993454; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGIlUhwcW4Oy871xAlA/Pf+rhr+iZnkvTchf2PcaDVU=;
        b=YU3kVGEI3EXs9n/9CRDnXas3sz3xDFp95ut44NAsAcYkSy9Kp3bKD1qEc4d8/oRB2j
         iA46BKAE3y3/J5d8+Bi5+np+tYibrJKBPBHNxT/04qUfoegxhsxzqMZAJdvpxQiOV7Ym
         y+qom2SuNDxjC4ckJQE/gP0ojsL1d0ifgZQIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388654; x=1763993454;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGIlUhwcW4Oy871xAlA/Pf+rhr+iZnkvTchf2PcaDVU=;
        b=cX4OuM/hrS4gBTdmkuAfVc2ugswizrjXKq3aS6kIe3KmrC/tH/kM+ZMDRW6a/ovVws
         cdEtj4/oT8+l42DDCOcpoHzseTg+3gguQoos8n2w+WFU9sqh/YcSvOurNzA/K5Iv2obl
         CAW5ChENm0hXJrALOx7FmVNDV2FH3c/CkzUvD7J4ue+FMn/vhQv+sjQJt0OHAzaP2PiV
         dUZyd3Mrf2uhCy4xodBzNig9zQ5h/qkmNDwWhOnzd1c3PK5R434WFReB+DstGQjP8g/q
         VjhMkcFT/m6cRCl5EiwsEVXOmeQ3o25mtdinvRkraVbYZCf2Tv6URZa7X/lxBbSVANyi
         ax1A==
X-Forwarded-Encrypted: i=1; AJvYcCU2kp6nJ3EcA2MKsPhpbvItK4rhZxdvmeJhy3OIWN9Qw7UjpvZTlz9WhldikkKhJF1MtTq9EFLDqpYN4OWZS3P9JgBXaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxByjDU8KuaffINdKKZTDBWy1DM4FUavr3fmCAilGFweDNkm/uD
	/mFgvBxSQW9wB1GI0CYu2t37B3KnuR/f6rcEpze+45VpFh9MR+gu8V49cADqVgCvMP4=
X-Gm-Gg: ASbGnctPPQXmxk3Ou1cUtt3yamAL5lSVJrQ8kaiqkxgsr5qbpL3eF2dG6TaW+YMO0Oa
	j1hKL+ermxYp1uai7h9DBw8D/s/l8m75VunNEkhg3waS+4y9iyRT1izGNR5c//S3FP6W026e3ku
	NyJqlWJj0E9ZtWqmduX/IKDlhKJnaGQajKRmjcHl/X5bO6leBdRpmjdcgtBeiIAIWbkpJc4QxOr
	JVrzZKtJMxLafDu7ROfjA1BG1jZ8Xz/h+O1yCxsqETOz4PC2agJbyEGajyN2+sHe7qMqiL8+BBl
	+CxLfGehVsfzhAeRtcVjySwtWx124LTgS3gf9yLzzrbYXKI1no4JJ6vwtS7sb4q5U1WX0LpUN5j
	yYulv14n1w2yMi93gd9VgBLOQ0KjT+HB1MzW7YVsZku6R/Dpo9cQV3US5URjZNiRmemnG/C2Uh/
	jdA6cY71nU1w1mL8nbWm0UJLahsbv3YWmcjrWqytL2p6AXtLDf
X-Google-Smtp-Source: AGHT+IGpmjetQdMYOQuuR7kG1GZkoPWMou40quIaqM1bcw0cREwgl582S5zRn/xRIwFNmTYkE5eDqQ==
X-Received: by 2002:a17:902:c405:b0:295:596f:8507 with SMTP id d9443c01a7336-2986a5fbf9fmr167840905ad.0.1763388654266;
        Mon, 17 Nov 2025 06:10:54 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx ([2405:201:31:d869:ee61:77ad:1f3e:2b12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm139768835ad.47.2025.11.17.06.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:10:53 -0800 (PST)
Date: Mon, 17 Nov 2025 19:40:45 +0530
From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, shakeel.butt@linux.dev, eddyz87@gmail.com,
	andrii@kernel.org, ast@kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	syzbot+09b7d050e4806540153d@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm/filemap: fix NULL pointer dereference in
 do_read_cache_folio()
Message-ID: <aRsqwndQ459VN8I9@ranegod-HP-ENVY-x360-Convertible-13-bd0xxx>
References: <20251114193729.251892-1-ssranevjti@gmail.com>
 <aReUv1kVACh3UKv-@casper.infradead.org>
 <CANNWa07Y_GPKuYNQ0ncWHGa4KX91QFosz6WGJ9P6-AJQniD3zw@mail.gmail.com>
 <aRpQ7LTZDP-Xz-Sr@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRpQ7LTZDP-Xz-Sr@casper.infradead.org>

On Sun, Nov 16, 2025 at 10:32:12PM +0000, Matthew Wilcox wrote:
> First, some process things ;-)
> 
> 1. Thank you for working on this.  Andrii has been ignoring it since
> August, which is bad.  So thank you for picking it up.
> 
> 2. Sending a v2 while we're having a discussion is generally a bad idea.
> It's fine to send a patch as a reply, but going as far as a v2 isn't
> necessary.  If conversation has died down, then a v2 is definitely
> warranted, but you and I are still having a discussion ;-)
> 
> 3. When you do send a v2 (or, now that you've sent a v2, send a v3),
> do it as a new thread rather then in reply to the v1 thread.  That plays
> better with the tooling we have like b4 which will pull in all patches
> in a thread.
>
Apologies for the process errors regarding the v2 submission. I appreciate the guidance on the workflow and threading; I will ensure the next version is sent as a clean, new thread once we have agreed on the technical solution.
> With that over with, on to the fun technical stuff.
> 
> On Sun, Nov 16, 2025 at 11:13:42AM +0530, SHAURYA RANE wrote:
> > On Sat, Nov 15, 2025 at 2:14 AM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Sat, Nov 15, 2025 at 01:07:29AM +0530, ssrane_b23@ee.vjti.ac.in wrote:
> > > > When read_cache_folio() is called with a NULL filler function on a
> > > > mapping that does not implement read_folio, a NULL pointer
> > > > dereference occurs in filemap_read_folio().
> > > >
> > > > The crash occurs when:
> > > >
> > > > build_id_parse() is called on a VMA backed by a file from a
> > > > filesystem that does not implement ->read_folio() (e.g. procfs,
> > > > sysfs, or other virtual filesystems).
> > >
> > > Not a fan of this approach, to be honest.  This should be caught at
> > > a higher level.  In __build_id_parse(), there's already a check:
> > >
> > >         /* only works for page backed storage  */
> > >         if (!vma->vm_file)
> > >                 return -EINVAL;
> > >
> > > which is funny because the comment is correct, but the code is not.
> > > I suspect the right answer is to add right after it:
> > >
> > > +       if (vma->vm_file->f_mapping->a_ops == &empty_aops)
> > > +               return -EINVAL;
> > >
> > > Want to test that out?
> > Thanks for the suggestion.
> > Checking for
> >     a_ops == &empty_aops
> > is not enough. Certain filesystems for example XFS with DAX use
> > their own a_ops table (not empty_aops) but still do not implement
> > ->read_folio(). In those cases read_cache_folio() still ends up with
> > filler = NULL and filemap_read_folio(NULL) crashes.
> 
> Ah, right.  I had assumed that the only problem was synthetic
> filesystems like sysfs and procfs which can't have buildids because
> buildids only exist in executables.  And neither procfs nor sysfs
> contain executables.
> 
> But DAX is different.  You can absolutely put executables on a DAX
> filesystem.  So we shouldn't filter out DAX here.  And we definitely
> shouldn't *silently* fail for DAX.  Otherwise nobody will ever realise
> that the buildid people just couldn't be bothered to make DAX work.
> 
> I don't think it's necessarily all that hard to make buildid work
> for DAX.  It's probably something like:
> 
> 	if (IS_DAX(file_inode(file)))
> 		kernel_read(file, buf, count, &pos);
> 
> but that's just off the top of my head.
> 
> 
I agree that DAX needs proper support rather than silent filtering.
However, investigating the actual syzbot reproducer revealed that the issue extends beyond just DAX. The crash is actually triggering on tmpfs (shmem).I verified via debug logging that the crashing VMA is backed by `shmem_aops`. Looking at `mm/shmem.c`, tmpfs legitimately lacks a `.read_folio` implementation by design.
It seems there are several "real" filesystems that can contain executables/libraries but lack `.read_folio`:
1. tmpfs/shmem
2. OverlayFS (delegates I/O)
3. DAX filesystems
Given that this affects multiple filesystem types, handling them all correctly via `kernel_read` might be a larger scope than fixing the immediate crash. I worry about missing edge cases in tmpfs or OverlayFS if we try to implement the fallback immediately in this patch.
> I really don't want the check for filler being NULL in read_cache_folio().
> I want it to crash noisily if callers are doing something stupid.
I propose the following approach for v3. It avoids the silent failure you are concerned about, but prevents the kernel panic:

1. Silent reject for `empty_aops` (procfs/sysfs), as they legitimately can't contain build IDs.
2. Loud warning + Error for other cases (DAX, tmpfs, OverlayFS).

The code would look like this:

    /* pseudo-filesystems */
    if (vma->vm_file->f_mapping->a_ops == &empty_aops)
        return -EINVAL;

    /* Real filesystems missing read_folio (DAX, tmpfs, OverlayFS, etc.) */
    if (!vma->vm_file->f_mapping->a_ops->read_folio) {
        /*
         * TODO: Implement kernel_read() fallback for DAX/tmpfs.
         * For now, fail loudly so we know what we are missing.
         */
        pr_warn_once("build_id_parse: filesystem %s lacks read_folio support\n",
                     vma->vm_file->f_path.dentry->d_sb->s_type->name);
        return -EOPNOTSUPP;
    }

This highlights exactly which filesystems are missing support in the logs without crashing the machine
Thanks,
Shaurya
