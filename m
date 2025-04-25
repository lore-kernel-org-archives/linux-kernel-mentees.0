Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67BC1C1AB4
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Apr 2025 16:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745599970; cv=none; b=fvg1dEewnBlXZYGAfavBMWgPJ0ci0fFL396NSvpwu2oQYULw+Htdwwxk7xEJPLG/HjST41SFPOkYynxWvcN4idlcXcoS7HTmq9GpXhK8gM9PneRFap1wH6aE5PqRMBan522gW58jo1PxiHBCa6+YLcSjU7v8XHEc9ZidSCKfztA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745599970; c=relaxed/simple;
	bh=b7xROfOzVGEJ+F8+IU2YtVbSzBcJ5YtgexLbCieurdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P417MBdth86NNc7rJ3b7YOcnx2aQEeC8VTyyBDjzPWflKLCmZt/y9Ko3B+ptSLJNM8U8xrqp+GCzLack92J4OJbstzt+/7DONiVMMaIfVSDQ5obsLvEqqAZD7knNkF52Fn4CTWeKJdvqTwYP6iuxRk2eGVS92qgnDpHetNos8vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f98bGm26; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f98bGm26"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b061a775ac3so2443735a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Apr 2025 09:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745599968; x=1746204768; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xUo8ldcQnt9oMg4WgBNcdcluURoGZZ9nuZ9OpdGRZpI=;
        b=f98bGm26pgvYnUrg1pxzqI4H2W78Ban2NiIDH8oZOGU8vAjpfSlJ7UYvZ0MC4JP0CI
         JV/ILWhNQ4BoPnSbgdv+upHgSVppVMyD949E8SRax3vWsjZ3MU5xGAfzNrzr/6UY8ZTy
         9n3YhKq51lyLvzV8fSZFw1K7z8V2uHblu9WlZjMlp6Skyr5nH1yavI/7aiGzSgnNFTHV
         f7MTQxpik6FLdHFOaAJbgiksx5JI8aen3pB7PT1EUDcp+3Nr/0msT1eMB1ToD7bwJ7e0
         yTbq2MmxF+S1aSKw/XqRY61s9siT5pSF/IJO4aezq/oSiz8TC7ACH1iWkOJQWaaJaftY
         WHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745599968; x=1746204768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUo8ldcQnt9oMg4WgBNcdcluURoGZZ9nuZ9OpdGRZpI=;
        b=miiOV5PzfY4t13jJD1Cd56iDdGd80aLV+NMMEPic3iXTgKEMwkvKH0ClEEJ6IP/JKu
         GEySHt+ns4lbCUg+a8BwHoC+B7ABYmidTobfkaeZJKzdmIX1Y7sZ7s3wuDVoQn4ZXAAA
         AmQruIwb7y7oPMtE99bRz2iP8XOSmzWbEXjka3TvH4df3z6ct4CRpPU8KoLEDEHytrwW
         kIjPg0b19iBPa/IsUz6mjslk49z2U9vv6kkn2PZjWj2t0c4MbTN3EaVVvuty7DSafA2v
         c+b9Asm6q6tXAr5TI64xjcm+buB43WNB2VnbSCUOl9BXgSuGlZv1UKccYJXvMjx1YIsG
         f9lg==
X-Forwarded-Encrypted: i=1; AJvYcCUIhDb3+CpLelaj9BjESwsNqQXPxEYlXgyH56gi7Nyc3WTTrSJffGQiq0aqLXeqLlGC+HF2Hng9pqS1gHsFGYS1O6S70g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIYhqr+aUUm+PYR2fctv+zMc+cYMqbYUFLTeFhkE6o+QgcmH8L
	LjJ0tMOc0/Yh1WDtOcZPs6IoqFtNrqnf+gCeVoOv9nO9YqKMoWpd
X-Gm-Gg: ASbGnct5BmDg7AJSpgBStRj0F/zmOTTX3at7AUhSZpRFkmNTmNN4TkOa5R7FQ/IrIRS
	9Ageqk/yCnZ9y1x/K3OP7/FCdLVIm2sPy9qpQDa9C/lsvDUAmm1Xy32v184+GFOCOcYHtbBAbWT
	Z9y0wIiXWXrrAjL2UITSvznQ/xFMECgnlJJiDwLxsgo+jIKqcqrFxlMlOZfxrMVd8i3v2Axjx32
	tWID0H5OgVSfijtG7KCCPZi1mhM76tI1xhnf8fRQWtPsxXKbOs1zfy1Cbj2MnlZ6qcPmAyn8tcC
	TTYwR5jEdTt5mC71q1aJiwRWKAZh80RcwbJiXptbI2UqMBUzKq14O7rLxu/R/C1ivRJS
X-Google-Smtp-Source: AGHT+IFojj7f+se3pSr/WR6LUWCeOvjNpR7dRU6l5UkaIDRsEoeOc1uUIphwPcBM8pHGM0feoLQTuw==
X-Received: by 2002:a05:6a20:6f0a:b0:1fe:90c5:7cee with SMTP id adf61e73a8af0-2045b98fd7emr4718790637.28.1745599968077;
        Fri, 25 Apr 2025 09:52:48 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:f97d:cfa2:241e:84aa])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a30csm3387276b3a.88.2025.04.25.09.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:52:47 -0700 (PDT)
Date: Sat, 26 Apr 2025 00:52:42 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: syzbot+de1498ff3a934ac5e8b4@syzkaller.appspotmail.com,
	viro@zeniv.linux.org.uk, brauner@kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net, shaggy@kernel.org,
	syzkaller-bugs@googlegroups.com, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH] fs/buffer: Handle non folio buffer case for
 drop_buffer()
Message-ID: <aAu92k-iPbnWBKGz@vaxr-BM6660-BM6360>
References: <66fcb7f9.050a0220.f28ec.04e8.GAE@google.com>
 <20250423023703.632613-1-richard120310@gmail.com>
 <nfnwvcefhvm5sfrvlqqf4zcdq2iyzk4f2n366ux3bjatj7o4vl@5hq5evovwsxp>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nfnwvcefhvm5sfrvlqqf4zcdq2iyzk4f2n366ux3bjatj7o4vl@5hq5evovwsxp>

On Wed, Apr 23, 2025 at 12:13:29PM +0200, Jan Kara wrote:
> On Wed 23-04-25 10:37:03, I Hsin Cheng wrote:
> > When the folio doesn't have any buffers, "folio_buffers(folio)" will
> > return NULL, causing "buffer_busy(bh)" to dereference a null pointer.
> > Handle the case and jump to detach the folio if there's no buffer within
> > it.
> > 
> > Reported-by: syzbot+de1498ff3a934ac5e8b4@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=de1498ff3a934ac5e8b4
> > Fixes: 6439476311a64 ("fs: Convert drop_buffers() to use a folio")
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> > syzbot reported a null pointer dereference issue. [1]
> > 
> > If the folio be sent into "drop_buffer()" doesn't have any buffers,
> > assigning "bh = head" will make "bh" to NULL, and the following
> > operation of cleaning the buffer will encounter null pointer
> > dereference.
> > 
> > I checked other use cases of "folio_buffers()", e.g. the one used in
> > "buffer_check_dirty_writeback()" [2]. They generally use the same
> > approach to check whether a folio_buffers() return NULL.
> > 
> > I'm not sure whether it's normal for a non-buffer folio to reach inside
> > "drop_buffers()", if it's not maybe we have to dig more into the problem
> > and find out where did the buffers of folio get freed or corrupted, let
> > me know if that's needed and what can I test to help. I'm new to fs
> > correct me if I'm wrong I'll be happy to learn, and know more about
> > what's the expected behavior or correct behavior for a folio, thanks !
> 
> Thanks for the patch but try_to_free_buffers() is not expected to be called
> when there are no buffers. Seeing the stacktrace below, it is unexpected it
> got called because filemap_release_folio() calls folio_needs_release()
> which should make sure there are indeed buffers attached.
>

I see, it doesn't make sense to have no buffers inside
try_to_free_buffers() then, I'll dig into it more and send v2.

> Can you print more about the folio where this happened? In particular it
> would be interesting what's in folio->flags, folio->mapping->flags and
> folio->mapping->aops (resolved to a symbol). Because either the mapping has
> AS_RELEASE_ALWAYS set but then we should have ->releasepage handler, or
> have PG_Private bit set without buffers attached to a page but then again
> either ->releasepage should be set or there's some bug in fs/buffer.c which
> can set PG_Private without attaching buffers (I don't see where that could
> be).
> 

Hmm so I suppose when there're buffers attached, the PG_Private bit
should always be set in folio->flags or folio->mapping->flags or
folio->mapping->aops ?

Thanks for your patience and detailed reviewed again, I'll refer back to
you ASAP.

Best regards,
I Hsin Cheng

> 								Honza
> 
> > 
> > [1]:
> > BUG: KASAN: null-ptr-deref in instrument_atomic_read include/linux/instrumented.h:68 [inline]
> > BUG: KASAN: null-ptr-deref in atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
> > BUG: KASAN: null-ptr-deref in buffer_busy fs/buffer.c:2881 [inline]
> > BUG: KASAN: null-ptr-deref in drop_buffers+0x6f/0x710 fs/buffer.c:2893
> > Read of size 4 at addr 0000000000000060 by task kswapd0/74
> > 
> > CPU: 0 UID: 0 PID: 74 Comm: kswapd0 Not tainted 6.12.0-rc1-syzkaller-00031-ge32cde8d2bd7 #0
> > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> > Call Trace:
> >  <TASK>
> >  __dump_stack lib/dump_stack.c:94 [inline]
> >  dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
> >  print_report+0xe8/0x550 mm/kasan/report.c:491
> >  kasan_report+0x143/0x180 mm/kasan/report.c:601
> >  kasan_check_range+0x282/0x290 mm/kasan/generic.c:189
> >  instrument_atomic_read include/linux/instrumented.h:68 [inline]
> >  atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
> >  buffer_busy fs/buffer.c:2881 [inline]
> >  drop_buffers+0x6f/0x710 fs/buffer.c:2893
> >  try_to_free_buffers+0x295/0x5f0 fs/buffer.c:2947
> >  shrink_folio_list+0x240c/0x8cc0 mm/vmscan.c:1432
> >  evict_folios+0x549b/0x7b50 mm/vmscan.c:4583
> >  try_to_shrink_lruvec+0x9ab/0xbb0 mm/vmscan.c:4778
> >  shrink_one+0x3b9/0x850 mm/vmscan.c:4816
> >  shrink_many mm/vmscan.c:4879 [inline]
> >  lru_gen_shrink_node mm/vmscan.c:4957 [inline]
> >  shrink_node+0x3799/0x3de0 mm/vmscan.c:5937
> >  kswapd_shrink_node mm/vmscan.c:6765 [inline]
> >  balance_pgdat mm/vmscan.c:6957 [inline]
> >  kswapd+0x1ca3/0x3700 mm/vmscan.c:7226
> >  kthread+0x2f0/0x390 kernel/kthread.c:389
> >  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
> >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> >  </TASK>
> > 
> > [2]:https://elixir.bootlin.com/linux/v6.14.3/source/fs/buffer.c#L97
> > 
> > Best regards,
> > I Hsin Cheng
> > ---
> >  fs/buffer.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/fs/buffer.c b/fs/buffer.c
> > index cc8452f60251..29fd17f78265 100644
> > --- a/fs/buffer.c
> > +++ b/fs/buffer.c
> > @@ -2883,6 +2883,8 @@ drop_buffers(struct folio *folio, struct buffer_head **buffers_to_free)
> >  	struct buffer_head *head = folio_buffers(folio);
> >  	struct buffer_head *bh;
> >  
> > +	if (!head)
> > +		goto detach_folio;
> >  	bh = head;
> >  	do {
> >  		if (buffer_busy(bh))
> > @@ -2897,6 +2899,7 @@ drop_buffers(struct folio *folio, struct buffer_head **buffers_to_free)
> >  			__remove_assoc_queue(bh);
> >  		bh = next;
> >  	} while (bh != head);
> > +detach_folio:
> >  	*buffers_to_free = head;
> >  	folio_detach_private(folio);
> >  	return true;
> > -- 
> > 2.43.0
> > 
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
