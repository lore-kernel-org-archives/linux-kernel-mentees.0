Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC873BBE2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 08:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720771462; cv=none; b=ei4+oyQgf1yNiWCNfS7VrcEAm4oyTFGJbbGDNqEkH6mVSCJJKT0CBhGdI3IY1fvkODk5xTgP9HtrnCiYsh2CW8ogiSXJuIVT0Rnya7MBj2hkRuXOHaWfsGLmXWl7i1yVdhtL5yUpAxIhWZPO+BSdxfYVM6E6st4bsKW1R+tNhLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720771462; c=relaxed/simple;
	bh=hqzA3rh5dFQtmqYgOXPNn+gufK9jhC444uvzQu5UEos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEQrhD+RuSo+s+Dz5IBWFl0jdA01PKTWMINGo2OMfjMnbwWksgbEur5SLEvWzmpr9SNtGj1TDuLXosjrFqCgjg6tOFBlGUvLGpD0k1FCd4AmMbO8MXtaCT6zWuDxlQR62MNyF0qIilVdbh5lQynPR0VYauVcs0+Pw1/S8hJ+4jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rjnb2tiH; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rjnb2tiH"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 360AA4129B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 08:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iy6X6M8w8ql2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jul 2024 08:04:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=senozhatsky@chromium.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0DB1240990
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=chromium.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DB1240990
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Rjnb2tiH
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0DB1240990
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 08:04:19 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-70af81e8439so1506547b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 01:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720771459; x=1721376259; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CXFOHNmtNejtp8eYqf/wBMdkQCzaaL+gxzG7fKAaJ98=;
        b=Rjnb2tiHFmmSKuv66kChhanfcNkPcumX5ZLwFmJHxAg0uIaQba4GwDGTUNM2Tx8EmF
         OS/JovrBH4X5Uz/xoR3gL0qnLQelqzHcJe/gTxX1F9Psy/WIE6f3mauvTJIgQHaAHwDC
         mK26D/I+EYmCHn9ZHO2jkg9QTcCYOREeZLSXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720771459; x=1721376259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXFOHNmtNejtp8eYqf/wBMdkQCzaaL+gxzG7fKAaJ98=;
        b=unr+r6/0xWUsO+FCuqL3MFy7DUHTpgrLXBlhv1+KxbcEk0lHA0FVuLMuCFhN0AbuZn
         zCyHJZ/eNm818iWT+vXTacgYbbBjw0e+bUTcW2JeK3BykqH0oUtee7c/SQgV5/zvLqWQ
         lUoL42GlH42RoKk1Srf9yhkH/4RDX9k9Ju40CZU6RqHR+mTtRkqBvaU1BA9O210MJN8j
         8SR5iQa93miFty+pEDs74lZNCoQSz7neJ+BEfnpeA9ZF13Gu49kd4n3rTvUk9/eOLNub
         EId7bQxL4j5y8QUdbYe0tivt8JECr36p1h1kHcByKK7e5/cQG8pNpuKkLg7fqhfs6NFd
         jXQg==
X-Forwarded-Encrypted: i=1; AJvYcCXsYxLtCxeGolPB4FWSkuaPpzbe1/Bb/JSJtcsPnu07Wtnw8FeHoM4AG1bV2SAyQIN32OdW8XW48qEZGBIUa/WPz3Uro7Ur3PXeU9m9xomEYW0P9gyhDQJ1XlTU1NBv
X-Gm-Message-State: AOJu0Yw9NoCCkOoyc6Mj6tu/o+52bSIjwm7jzrcCHEjj5+STpYst3vZy
	C+yvNvJohCh1runDPUrElq+peIsRgf2OAq7WwZo0GsSrV32YV90/MpABD7d+SA==
X-Google-Smtp-Source: AGHT+IH4+oZEOZZ7qKy8fbQavf83lJTLVIUFhOwV7t2v2393WzTooxpV7nuWh1QFdWBbiagy3F208Q==
X-Received: by 2002:a05:6a00:6c89:b0:705:be21:f2be with SMTP id d2e1a72fcca58-70b4356dc65mr12461691b3a.18.1720771459178;
        Fri, 12 Jul 2024 01:04:19 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:acec:d0e8:b0dd:8593])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438c0996sm6864562b3a.60.2024.07.12.01.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 01:04:18 -0700 (PDT)
Date: Fri, 12 Jul 2024 17:04:14 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Pei Li <peili.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+35a4414f6e247f515443@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm: Fix mmap_assert_locked() in follow_pte()
Message-ID: <20240712080414.GA47643@google.com>
References: <20240710-bug12-v1-1-0e5440f9b8d3@gmail.com>
 <92a2dc30-6e48-44ea-9cde-693b911f200d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92a2dc30-6e48-44ea-9cde-693b911f200d@redhat.com>

On (24/07/11 23:33), David Hildenbrand wrote:
[..]
> > @@ -1815,9 +1815,16 @@ static void unmap_single_vma(struct mmu_gather *tlb,
> >   	if (vma->vm_file)
> >   		uprobe_munmap(vma, start, end);
> > -	if (unlikely(vma->vm_flags & VM_PFNMAP))
> > +	if (unlikely(vma->vm_flags & VM_PFNMAP)) {
> > +		if (!mm_wr_locked)
> > +			mmap_read_lock(vma->vm_mm);
> > +
> >   		untrack_pfn(vma, 0, 0, mm_wr_locked);
> > +		if (!mm_wr_locked)
> > +			mmap_read_unlock(vma->vm_mm);
> > +	}
> > +
> >   	if (start != end) {
> >   		if (unlikely(is_vm_hugetlb_page(vma))) {
>
> I'm not sure if this is the right fix. I like to understand how we end up
> without the mmap lock at least in read mode in that path?

I suspect this is causing a deadlock:

[   10.263161] ============================================
[   10.263165] WARNING: possible recursive locking detected
[   10.263170] 6.10.0-rc7-next-20240712+ #645 Tainted: G                 N
[   10.263177] --------------------------------------------
[   10.263179] (direxec)/166 is trying to acquire lock:
[   10.263184] ffff88810b4f0198 (&mm->mmap_lock){++++}-{3:3}, at: mmap_read_lock+0x12/0x40
[   10.263217]
[   10.263217] but task is already holding lock:
[   10.263219] ffff88810b4f0198 (&mm->mmap_lock){++++}-{3:3}, at: exit_mmap+0x9c/0x830
[   10.263238]
[   10.263238] other info that might help us debug this:
[   10.263241]  Possible unsafe locking scenario:
[   10.263241]
[   10.263243]        CPU0
[   10.263245]        ----
[   10.263247]   lock(&mm->mmap_lock);
[   10.263252]   lock(&mm->mmap_lock);
[   10.263257]
[   10.263257]  *** DEADLOCK ***
[   10.263257]
[   10.263259]  May be due to missing lock nesting notation
[   10.263259]
[   10.263262] 3 locks held by (direxec)/166:
[   10.263267]  #0: ffff88810b4e8548 (&sig->cred_guard_mutex){+.+.}-{3:3}, at: bprm_execve+0x70/0x1110
[   10.263286]  #1: ffff88810b4e85e0 (&sig->exec_update_lock){+.+.}-{3:3}, at: exec_mmap+0x9f/0x510
[   10.263302]  #2: ffff88810b4f0198 (&mm->mmap_lock){++++}-{3:3}, at: exit_mmap+0x9c/0x830
[   10.263318]
[   10.263318] stack backtrace:
[   10.263329] CPU: 6 UID: 0 PID: 166 Comm: (direxec) Tainted: G                 N 6.10.0-rc7-next-20240712+ #645
[   10.263340] Tainted: [N]=TEST
[   10.263349] Call Trace:
[   10.263355]  <TASK>
[   10.263360]  dump_stack_lvl+0xa3/0xeb
[   10.263375]  print_deadlock_bug+0x4d5/0x680
[   10.263387]  __lock_acquire+0x65fb/0x7830
[   10.263408]  ? lock_is_held_type+0xdd/0x150
[   10.263425]  lock_acquire+0x14c/0x3e0
[   10.263433]  ? mmap_read_lock+0x12/0x40
[   10.263445]  ? lock_is_held_type+0xdd/0x150
[   10.263454]  down_read+0x58/0x9a0
[   10.263461]  ? mmap_read_lock+0x12/0x40
[   10.263476]  mmap_read_lock+0x12/0x40
[   10.263485]  unmap_single_vma+0x1bf/0x240
[   10.263497]  unmap_vmas+0x146/0x1c0
[   10.263511]  exit_mmap+0x13d/0x830
[   10.263533]  __mmput+0xc2/0x2c0
[   10.263556]  exec_mmap+0x4cb/0x510
[   10.263580]  begin_new_exec+0xfe6/0x1ba0
[   10.263612]  load_elf_binary+0x797/0x22a0
[   10.263637]  ? load_misc_binary+0x53a/0x930
[   10.263656]  ? lock_release+0x50f/0x830
[   10.263673]  ? bprm_execve+0x6d7/0x1110
[   10.263693]  bprm_execve+0x70d/0x1110
[   10.263730]  do_execveat_common+0x44b/0x600
[   10.263745]  __x64_sys_execve+0x8e/0xa0
[   10.263754]  do_syscall_64+0x71/0x110
[   10.263764]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
