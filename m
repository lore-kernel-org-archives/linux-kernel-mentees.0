Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8151B1407
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 15:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720105483; cv=none; b=RMBxzrX55JhuvKvye9XSZ+wbB8z4b8q132pwKXxBjQJpFVHUUup3BVtPbaBtDUCHKisj5CQiGsI5xEXl3HKLZZD5EoIs8nib+ju1K7IpNskmaBsvBDjSFOG+bRCB/BeXbWVIq723W3Xn0dTfOoysvz5Hq4lr4UqNx2me1cI0SAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720105483; c=relaxed/simple;
	bh=nVQ5WJN4fk8XmK0MfllwsbUQxxLWjlsoAHgsH+vZJ60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZHSYa0a64BYaSrS2QqsIUBj26mYxJhyRZmgIXGxiXq37XpM+XXKK8QOIw5Bgf+YfcxfEuHnT/ZD9BmWe1HjoBaE4DGsuKg5PTDhFuuYs7Mnu6lJby2+G6QD+GRDfoscuR3ENs5Hivl1NoAQUL94wYLwIh9fDKzkk4NNA3kNry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HepyLPuK; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HepyLPuK"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DD466085E
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 15:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKEWinW33UB6 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Jul 2024 15:04:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=dvyukov@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E4DB60777
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E4DB60777
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=HepyLPuK
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2E4DB60777
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 15:04:41 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-380dacc983eso197295ab.0
        for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 04 Jul 2024 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720105480; x=1720710280; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nVQ5WJN4fk8XmK0MfllwsbUQxxLWjlsoAHgsH+vZJ60=;
        b=HepyLPuK5rgVlh1bTokDs8DwfDg/3xOgjvcVdXnYGaqeuS3qew53TFbxWJ+JTLFF78
         3ol4pvRgz0qor6eHWluB3EqEJG5AeDWMH1kc8mJXSVGfSINvJbrcmO03nUA7VyHCeIW/
         3pCgCrLWuuDgAEUBb+vvCRqE9rTEpM+rEXGJMAFtvPF7e6sx06zDb3Lra9Emmeb/Xb91
         FEut8Ycujrb76HrYyC7SGRC/2gx91U9pCrdgK3wLW43/Do1XvQrc4JXY+6mSM24siuFn
         pQDQFymqGtlpyGrtc6Jklu4IjpaY1qihAAn1mrpIBb4R5gnGU16jbA7BbQbzVSnr6qDf
         n00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720105480; x=1720710280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVQ5WJN4fk8XmK0MfllwsbUQxxLWjlsoAHgsH+vZJ60=;
        b=hoXZDVH83HJgVyh6RhUuPdLUpAUpc4fneJwF39v1aTAkBNuWnCxAD6cNBjhZ9zR/nP
         ZBdDRrzG6JF/JCX28psldvLrZ/Qkb+NvyTDCtY1W5gOXgKdNnws9df3yr0v+NX8EQdNL
         +chVKGOAcdgwZsCLdg9MeBXy+9pZqVW+0WsdNF0DraqNPCDv3yiBTZXyRTsbrZFGH9Ad
         MCj3g7J7kuPt8VkYIYOazErqFdKX7/YbrIiB7sAZDyiMLW+cDojCM/r322cffJGpoaB2
         iHrvIw8pFVe3zwcN5FdmXXWIt06h8TVUGK6poJGwI1NOk/TMX6ckgZQCWgn9K6rSyBlw
         0TKw==
X-Forwarded-Encrypted: i=1; AJvYcCWAD972G3QI/JjTge0V6OapZ43lITHB1B67hek1X9k7gQudeCUGfnOqmYDuSRP4CHKSx7qMeedoukpDchoTreLfuidShZvt6dQUxBHjpLXyY9BK+DuzTeRmqLILlEND
X-Gm-Message-State: AOJu0YxoDRTfQIiVQ/E29DeSjWCIRDSc8y8CTyA841PKnZIlZUBr1ff9
	nGEG6bUXDmkqYtmenx4+AfeRtSikJkDk6YMGk+DrFHnCaaS9Xs0VmalCwCEsRuWVL9alLh1STPY
	cdrFN7YtMKHaRiDixvzOkj+l1ELbt8z6j2v+4
X-Google-Smtp-Source: AGHT+IHS4wVl7BK95b+qtiofP2pvB71Mm2j0xjjS7ClvF3mfyTcnGuwYfg6w/iwp7+LC45vznDA9DofYKh37frM4bAI=
X-Received: by 2002:a05:6e02:18cb:b0:375:9558:2b8c with SMTP id
 e9e14a558f8ab-3834e6e04d1mr2914815ab.4.1720105479909; Thu, 04 Jul 2024
 08:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2023082746-antelope-drop-down-5562@gregkh> <20240704135057.1174408-1-dvyukov@google.com>
 <2024070416-hatbox-playlist-9886@gregkh> <CACT4Y+arKNML2gLvmXzqdfyJY5ydj0yjfk-NbrZpOLgTOTNH6A@mail.gmail.com>
 <2024070430-smell-cornhusk-1d6c@gregkh> <CACT4Y+az44BGCQ_DjOoCjfcQHEt6YEPi=pksFCRj=-zMrPwSQQ@mail.gmail.com>
 <2024070419-calamity-blade-02fb@gregkh>
In-Reply-To: <2024070419-calamity-blade-02fb@gregkh>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 4 Jul 2024 17:04:18 +0200
Message-ID: <CACT4Y+ZwQGPEGwFc0Pq6pJyHLeYwbQP7xyoO6xtnh0ZAY1PTOQ@mail.gmail.com>
Subject: Re: [PATCH] fs/befs: fix shift-out-of-bounds in befs_check_sb
To: Greg KH <gregkh@linuxfoundation.org>
Cc: 88c258bd-3d0c-de79-b411-6552841eb8d0@gmail.com, 
	Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	luisbg@kernel.org, salah.triki@gmail.com, 
	syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jul 2024 at 16:58, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > > > Hi,
> > > > > >
> > > > > > What's the kernel policy for such cases?
> > > > >
> > > > > What "case"?
> > > > >
> > > > > There is no context here at all, and I can't find any patch on lore at
> > > > > all.
> > > > >
> > > > > Please always properly quote stuff...
> > > >
> > > > It's not easy with kernel lists. I used the lore suggested reply-to
> > > > command. Here is full thread:
> > > > https://lore.kernel.org/all/20240704135057.1174408-1-dvyukov@google.com/
> > >
> > > I see no patch on lore on this thread :(
> >
> > Oh, it wasn't properly threaded, sorry.
> > Here is the patch:
> > https://lore.kernel.org/all/20230801155823.206985-1-ghandatmanas@gmail.com/
>
> Ah, ok, resend it and cc: the vfs maintainer, it should probably go
> through their tree for other abandoned filesystems.

Ack, thanks!
Manas, are you still interested in pursuing this fix?
