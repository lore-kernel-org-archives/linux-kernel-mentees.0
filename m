Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263B81AED40
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 15:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723735794; cv=none; b=kIXyN5MmJ/BkVgh5o+J19aK95IMPv2pvIw/DinVcsenh/6PDwANlK6gCkz5OBoi+s3je0Q9ck3+9S2l5b6sY1FvTUrqPC5nsGlSrVwlS13eG+G46PnpbL3pSmE32ejh7+KYCF8y6gLGrBSE6QnxQIc1Qsx82zUTPYiAQnvJx1bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723735794; c=relaxed/simple;
	bh=pI8L/RvDGnryLxS0LDdr60wqC3uvj+nWgBAUoDUazXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Px1aMKZ6ULgHLohbZaybjSMYRhtbZH5WOqyNYeTIe83wFqsbynOWiKL6t4vs4Jxgn3BFDGSdlBuPHYYvwOIlIXjovggpgAgndAA7hWBaxAfUMAk/70LjORvDY0hw2Ap27Q7RabJ26T14o6M9MN/KYfz4OW0LX+Cwb6MSjI0cslQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdKjJPlf; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdKjJPlf"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3B1B6066F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 15:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFn9HfV7rFbg for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 15:29:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jaegeuk@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BFFEA600CA
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFFEA600CA
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JdKjJPlf
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BFFEA600CA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 15:29:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D319C61E65;
	Thu, 15 Aug 2024 15:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7A8C32786;
	Thu, 15 Aug 2024 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723735789;
	bh=pI8L/RvDGnryLxS0LDdr60wqC3uvj+nWgBAUoDUazXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JdKjJPlf7v2Y1Lj7NmPGxBj4PKcneKao15DLyuq6cyuN/6U7Xw+DMnG6coeXyvVOx
	 IX2LuVvHV3fUM45Q6Oy5+OuoEs/KJ0aR1mMKQYy9B2X/mJqGfqib+coF3Zcannz+VR
	 RL0X4mUr9Df55fKbkhSy/UBfZZ9Qulf0jziRZDyRmcZmUMTqyNHD5//RGOcSNfrP7S
	 qnuXLJG+aRKj5SupigskfsktTuIVvoKGo2KcXs7sLdBZndPlUlooJsps4XpTjKeco+
	 Tm+RLWbsKx4K1MGzXBGNSoEUJDO2VAb/uP1mwJxjxj+hM9ghfR43KqktxnSQIQhKho
	 yqHyCFPBSMJIQ==
Date: Thu, 15 Aug 2024 15:29:47 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Diogo Jahchan Koike <djahchankoike@gmail.com>
Cc: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] f2fs: fix unreleased reader lock on return
Message-ID: <Zr4e6zsKOotTLVTp@google.com>
References: <20240814211640.167728-1-djahchankoike@gmail.com>
 <efcc15bf-0248-4690-b4d4-11022d12cffd@kernel.org>
 <CAJwTMzrXOBrZ2XSG4GykDhjeTAztO8j1h8zoAFGZeZBqZF5brQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJwTMzrXOBrZ2XSG4GykDhjeTAztO8j1h8zoAFGZeZBqZF5brQ@mail.gmail.com>

On 08/15, Diogo Jahchan Koike wrote:
> No problem whatsoever.

Thanks. I removed the original patch from -next. Chao, please post a fixed
version.

> 
> Thanks,
> 
> Em qua., 14 de ago. de 2024, 21:51, Chao Yu <chao@kernel.org> escreveu:
> 
> > On 2024/8/15 5:16, Diogo Jahchan Koike wrote:
> > > fix reader lock unreleased in error path.
> >
> > Thank you for catching this, if you don't mind, I'd like to merge it to
> > original patch, since it is still in dev-test branch.
> >
> > Thanks,
> >
> > >
> > > Fixes: 374a8881ce4c ("f2fs: atomic: fix to forbid dio in atomic_file")
> > > Reported-by: syzbot+733300ca0a9baca7e245@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=733300ca0a9baca7e245
> > > Signed-off-by: Diogo Jahchan Koike <djahchankoike@gmail.com>
> > > ---
> > >   fs/f2fs/file.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > >
> > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > index 51f6ffd5f4e2..c9eda5dbd11f 100644
> > > --- a/fs/f2fs/file.c
> > > +++ b/fs/f2fs/file.c
> > > @@ -2172,6 +2172,7 @@ static int f2fs_ioc_start_atomic_write(struct file
> > *filp, bool truncate)
> > >       ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
> > >       if (ret) {
> > >               f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > > +             f2fs_up_write(&fi->i_gc_rwsem[READ]);
> > >               goto out;
> > >       }
> > >
> > > @@ -2181,6 +2182,7 @@ static int f2fs_ioc_start_atomic_write(struct file
> > *filp, bool truncate)
> > >               pinode = f2fs_iget(inode->i_sb, fi->i_pino);
> > >               if (IS_ERR(pinode)) {
> > >                       f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > > +                     f2fs_up_write(&fi->i_gc_rwsem[READ]);
> > >                       ret = PTR_ERR(pinode);
> > >                       goto out;
> > >               }
> > > @@ -2189,6 +2191,7 @@ static int f2fs_ioc_start_atomic_write(struct file
> > *filp, bool truncate)
> > >               iput(pinode);
> > >               if (ret) {
> > >                       f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > > +                     f2fs_up_write(&fi->i_gc_rwsem[READ]);
> > >                       goto out;
> > >               }
> > >
> > > @@ -2202,6 +2205,7 @@ static int f2fs_ioc_start_atomic_write(struct file
> > *filp, bool truncate)
> > >               ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
> > >               if (ret) {
> > >                       f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> > > +                     f2fs_up_write(&fi->i_gc_rwsem[READ]);
> > >                       goto out;
> > >               }
> > >       }
> >
> >
