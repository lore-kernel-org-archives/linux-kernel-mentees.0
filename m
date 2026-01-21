Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A413A7F55
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 Jan 2026 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020175; cv=none; b=E4N373RIMrfNziFsYbStrx3p+l4n0MwynRvUpYByx+DE597Zev3mGr1M2OqOXh+NWUy7R4yBMZsJk+i6Ckmr8x6/BNAnxDAVG9Ua6sZmzfnrUjNGtYrXEhwCVNdp2YRP7+Naszq0ar6j4Va2c9RUkXL5Ck88bqBnjxIVK8CGQ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020175; c=relaxed/simple;
	bh=rXG5ZKvyvWBHHACzLV8wPF9nuPc1igUArEv0FBWhhds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhrWuibT4GZMSUn3D0TGaGoARmPnUQ/v8gjzQZ1s2+KoFa4/CV5fjRGycjZhC+zfTk059q97/pKFpB5pssOaF/c8HF+bbCsn/ddTeFECtxzMJ6s1Til/x8BdSFGBy5I/CmI+JMgSDLSNX0JYXFu1rosDyoKSJN/1BXaxYsvUyVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5Z1q8Bo; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5Z1q8Bo"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81df6a302b1so217105b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 Jan 2026 10:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769020170; x=1769624970; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tc2r2HxnJJlwpaCSqhrItmuiSzit6sO0uRPjBjoXBAU=;
        b=j5Z1q8BorjY1L2pSjoxgPKr0fo2uLp3liSFOV2/a9+y8AKbL1D5J67PET/PiSXHwWY
         h1rufT5sOKlGIz95hQFTYNOnGlaJzDUyl56nVXlAqMiXgCE/yWYTEWv565gsdO1lc42d
         hbZ5n8Gv5XeyLMr5zlWu5Y86bYJtqsGxy8HSfH2IcHwWtNgf8sjIZ0J2+4+VLBy0wU3R
         0DScvZEc1OtaFL9DZOdpkdDqspmDMLMo47uMgpWreSYZNIWc2cQr8Vst2YkKEFpVVkwj
         dA3SOwtInAmZyCd7Dzk9lj/5r6PkZRiZazPyN8fuGLCfYv7YLeaY+BUaP08LNiLsRPM0
         fWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769020170; x=1769624970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tc2r2HxnJJlwpaCSqhrItmuiSzit6sO0uRPjBjoXBAU=;
        b=L9IUSiQ/nHTK91++X/uCWQ8NkGNW542Lres14FmvP7xXENYpNGEIoRb7Eb8zqRwvYY
         4adStRyJ3on7iBsxxDil9/fwV+MJ/AwNzAmB5sMChHsO9YNwv/sessqT6cKxwvKK5EJN
         Ex8GSeGLpvgND9XXjemFZlDWeJ1HL+7gnyJQhNfJqjBwjDEnYz/9Z8KIw99gT76M2Y/W
         XWyYTADUm5dSkqTmKR0bTAKRpGkOrn09IkpdnWrN6z7RwNhVdervF8m9N+AjwFitQlMV
         ic7r70Nn+lfvCfDQyK/xC7SgH4nLVuVF0xHBUSiH64mqaOQirBkTUJtBriX1mcXT0qun
         Rw7w==
X-Forwarded-Encrypted: i=1; AJvYcCX4f/kUu5xeNVFybYvrK/XzaHVdFKYe1DuLGtdalTe3P1wkMFoJ2lfbHPBxLwYPAlbkynfchgvW25rQF8JNl8USM/EhDw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yya8jmHW0kC19bho8YrilrVWHl2HuJavMK1JLCq4BrCJWpjbn9M
	PMBzhVeexyRqDGf/+Lja9bQsm6/vylgE6pPAlT3eQmcqsKvmJ2VcGdt4
X-Gm-Gg: AZuq6aKIBbxNE0rkHkUZbV++9/ov/I7MYadxoAg63gQcFVMNasqQH1sAkZJEtZb6cif
	F/iuASQ1p4pNiID6tsom/dL+hnu5tJsPWi1qNNFtVkZ0TZfRq4QM+m/11rq3jiCJ+IHbLT9Hooj
	wrnYvxjrKFoP4fwvhh9r+j4j15vNtnpNpMJ8n8FjIbjlfEqS/DLOWF8KaQW45cj4BiJkm7hXJ3P
	xrLzL6VPsziIKCUkBqvuXZAS65BL7f+Bcf+nE0O0bhYXgX/1nNqyN5y7i/wC602nfqTNQ6QJJTL
	gTGY3Dx5muj5zesylyb+xV3lfwyGh/rTDLo22xl2IBKz29VLFh3JegnQY9k7CrMHcSrCtvqYuE4
	uP8v08nvcPz/nYWybCXpgvEZloNvLZdre3/nfJpgBHlmIJ73i5aWKkf3d/+MEoiz6SDpmrvT0ym
	ITI0WvccNhMu0=
X-Received: by 2002:a05:6a21:3395:b0:366:19e9:8a3c with SMTP id adf61e73a8af0-38e00bf6c7bmr19050575637.2.1769020170290;
        Wed, 21 Jan 2026 10:29:30 -0800 (PST)
Received: from inspiron ([111.125.231.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf37a7b0sm12838994a12.33.2026.01.21.10.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 10:29:30 -0800 (PST)
Date: Wed, 21 Jan 2026 23:59:20 +0530
From: Prithvi <activprithvi@gmail.com>
To: a.hindborg@kernel.org, leitao@debian.org
Cc: bvanassche@acm.org, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org, hch@lst.de, jlbec@evilplan.org,
	linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org,
	syzbot+f6e8174215573a84b797@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] scsi: target: Fix recursive locking in
 __configfs_open_file()
Message-ID: <20260121182920.hfen6vsf5o27wi3z@inspiron>
References: <20260108191523.303114-1-activprithvi@gmail.com>
 <2f88aa9b-b1c2-4b02-81e8-1c43b982db1b@acm.org>
 <20260119185049.mvcjjntdkmtdk4je@inspiron>
 <ac604919-1620-4fea-9401-869fd15f3533@acm.org>
 <20260121175136.2ku57xskhwwg7syz@inspiron>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121175136.2ku57xskhwwg7syz@inspiron>

On Wed, Jan 21, 2026 at 11:21:46PM +0530, Prithvi wrote:
> On Tue, Jan 20, 2026 at 05:48:16AM -0800, Bart Van Assche wrote:
> > On 1/19/26 10:50 AM, Prithvi wrote:
> > >   Possible unsafe locking scenario:
> > > 
> > >         CPU0
> > >         ----
> > >    lock(&p->frag_sem);
> > >    lock(&p->frag_sem);
> > The least intrusive way to suppress this type of lockdep complaints is
> > by using lockdep_register_key() and lockdep_unregister_key().
> > 
> > Thanks,
> > 
> > Bart.
> 
> Hello Bart,
> 
> I tried using lockdep_register_key() and lockdep_unregister_key() for the
> frag_sem lock, however it stil gives the possible recursive locking
> warning. Here is the patch and the bug report from its test:
> 
> https://lore.kernel.org/all/6767d8ea.050a0220.226966.0021.GAE@google.com/T/#m3203ceddf3423b7116ba9225d182771608f93a6f
> 
> Would using down_read_nested() and subclasses be a better option here?
> 
> I also checked out some documentation regarding it and learnt that to use
> the _nested() form, the hierarchy among the locks should be mapped
> accurately; however, IIUC, there isn't any hierarchy between the locks in
> this case, is this right?
> 
> Apologies if I am missing something obvious here, and thanks for your 
> time and guidance.
> 
> Best Regards,
> Prithvi

Hello Andreas and Breno,

This thread is regarding a patch for fixing possible deadlock in 
__configfs_open_file(); here is its dashboard link:

https://syzkaller.appspot.com/bug?extid=f6e8174215573a84b797

Firstly, flush_write_buffer() is called, which acquires frag_sem lock, 
and then it calls the loaded store function, which, in this case, is
target_core_item_dbroot_store(). target_core_item_dbroot_store() calls
filp_open(), which ultimately calls configfs_write_iter() and in it, 
the thread tries to acquire frag_sem lock again, posing a possibility of
recursive locking.

In the initial patch, I tried to fix this by replacing the call to 
filp_open() in target_core_item_dbroot_store() with kern_path(), since 
it performs the task of checking if the file path exists, rather than 
opening the file using configfs_write_iter(). This also avoids acquiring 
frag_sem in nested manner and thus possibiliy of recursive locking is 
prevented.

After checking I found 3 functions where down-write() is used, which, 
IIUC they might contribute to recursive locking:

1. configfs_rmdir() - calls down_write_killable(&frag->frag_sem)
2. configfs_unregister_group() - calls down_write(&frag->frag_sem);
3. configfs_unregister_subsystem() - calls down_write(&frag->frag_sem);

Bart suggested that this can be a fals positive and can be solved using
lockdep_register_key() and lockdep_unregister_key(). However, on trying
this approach, the possibile recursive locking warning persisted, it can 
be found here:

https://lore.kernel.org/all/6767d8ea.050a0220.226966.0021.GAE@google.com/T/#m3203ceddf3423b7116ba9225d182771608f93a6f

IIUC, we can then use down_read_nested() and lock subclasses here; but,
according to documentation:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/locking/lockdep-design.rst#n230

I learnt that to use the _nested() form, the hierarchy among the locks 
should be mapped accurately; however, from the lockdep documentation, 
my understanding is that there isn't any hierarchy between the locks 
in this case.

Your guidance on whether the kern_path based fix is the right direction here, 
or if there is a more appropriate way to handle this from a configfs or VFS 
point of view would be very valuable.

Thank you for your time and guidance.

Best Regards,
Prithvi
