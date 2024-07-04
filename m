Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7051AEFF4
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720102450; cv=none; b=odpBmphXELeSvxXXwF0xnNHj1j9QffAzdIpT5PUdUvCfABlsVFp9ESuCbjTycyNUDd+sr33i48nn2bdnLXQGfruaGYRH1ycouY3yOUUtyhgl+FjUmUVcnuyBdLmUXMx1kZsU6lffI3Y4FiLX4SH4k7ZU6N3h0E+HCz/6skODJw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720102450; c=relaxed/simple;
	bh=x3Dw/3JoSR6Plp0fIHlHJyzdmxfWmxmBK8E7elO5i9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVSsmP8hzRzJ097qnAqjG59qbHYwpIT1CYwJcdixG2ApGr8phAsTUrqUfiyYPtvtwyk/lUgathRTjGbb1luuDEsiiXFaOgve3loIJXC503UyM4B3StW2MhwtwRmeIoG2myHrwLTu4CMhHT/Jj5sITZ0FdnTDDKNG7ov7mEdXQLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ur7XeSAd; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ur7XeSAd"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A080780FBC
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 14:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -17.601
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTK8jPWqG5PS for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Jul 2024 14:14:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=dvyukov@google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78DF980F37
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78DF980F37
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Ur7XeSAd
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 78DF980F37
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 14:14:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-424a3cb87f1so68495e9.1
        for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 04 Jul 2024 07:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720102445; x=1720707245; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x3Dw/3JoSR6Plp0fIHlHJyzdmxfWmxmBK8E7elO5i9k=;
        b=Ur7XeSAd1KeSoMRfJ++Na5rhj0QXc/klGLwAJVkLNC1NbGfeIZ82yaX3FEbrlbpXO4
         1ggcC48eaSCoeiQ+wLKDhG+2hdxKIo9JwPW+SVbE+LKMqsa+zuTF4MHCOl36auyhMfn8
         RkHnWWgkwYr3xVa8H3eXqbAvc6BCgpS71TpFe2fkVtP0O3IQAb1wVrp+IEkK06DzIrmf
         qAPj1jmcZ7g1t7v4aRqLuGHxS+6WIczuEvSLjvfC/N85w7XzOgjsh2OQI6ju+kFbjicO
         7Ftbv91w9nbndH/+uP6khcHESg/0YWmNJhlpN3SJVdadOO0Np4YpLCqOPWCvwKfU6LPD
         9ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720102445; x=1720707245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3Dw/3JoSR6Plp0fIHlHJyzdmxfWmxmBK8E7elO5i9k=;
        b=plyQShKg7ZV9lgJvhJQNLmbtZbzN1tgn7uMcyeozXmxCV3ucKQ8wcGMSSQMhHhY/3C
         dnLhpnSb5TBBgIxCh4Uxthv2iqMuMs4QDTPhimO8/QcO4Q4IXFutnSSW+ZGD0l2mQ3H6
         +FgOlIJaN5cGH8A5yVax4Vnwf501VcrbST5wSIiv2KwsBAq4Kpq++6lih1w+0NKkK1nz
         5WZ0BCEGDP3IvzDF59cmUvk4DNQ/1zRkHWDQg09jGk7WHCKY5k0Xi7D6U6oo+yc6ZjJm
         fqHb0YOdbUhCTxWKNE4kBXu+nRchPMkxYK0OPZF4vjuSeKHO0EqQnGrpWOnia5CvYIMd
         4moQ==
X-Forwarded-Encrypted: i=1; AJvYcCUosmFFSjJ4IWymxnGEercnoGpMbxZEUya6SOJX2Ey17Sy0u8RCTrQ4+DtBd7YzHOSL/oZ1apx1zkdnkmAFiHlm5pw0GKM0vrEtANzgEGluHIpNaYaJhqeyjzWe+9UP
X-Gm-Message-State: AOJu0YwKrVLOPFudJdUo+NXV7gRSBBfRzmMNyND3kPrPYxzB5xS5Rlxb
	b436nuFSxSwSow/bO48b/4RC6nL3gPVJ4wJumhoTnA3EgxdqjFVHG8peOG/te+WZeTd3LcxJRA6
	pnZ7YGPPqXjWAF7Z2KABb0BPa09O/jKkkDfPA
X-Google-Smtp-Source: AGHT+IEcgF3fIovho1cf009IR3WFantb6YwS9xjv1nVNsH2RPT6ipAn5QHz5AcPyOGe9DVQFNc2EK798vO0gxjk8Flo=
X-Received: by 2002:a05:600c:3b02:b0:421:6c54:3a8 with SMTP id
 5b1f17b1804b1-42649a5cb24mr1491055e9.7.1720102445000; Thu, 04 Jul 2024
 07:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2023082746-antelope-drop-down-5562@gregkh> <20240704135057.1174408-1-dvyukov@google.com>
 <2024070416-hatbox-playlist-9886@gregkh> <CACT4Y+arKNML2gLvmXzqdfyJY5ydj0yjfk-NbrZpOLgTOTNH6A@mail.gmail.com>
 <2024070430-smell-cornhusk-1d6c@gregkh>
In-Reply-To: <2024070430-smell-cornhusk-1d6c@gregkh>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 4 Jul 2024 16:13:52 +0200
Message-ID: <CACT4Y+az44BGCQ_DjOoCjfcQHEt6YEPi=pksFCRj=-zMrPwSQQ@mail.gmail.com>
Subject: Re: [PATCH] fs/befs: fix shift-out-of-bounds in befs_check_sb
To: Greg KH <gregkh@linuxfoundation.org>
Cc: 88c258bd-3d0c-de79-b411-6552841eb8d0@gmail.com, 
	Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	luisbg@kernel.org, salah.triki@gmail.com, 
	syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jul 2024 at 16:11, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > On Thu, Jul 04, 2024 at 03:50:57PM +0200, Dmitry Vyukov wrote:
> > > > Hi,
> > > >
> > > > What's the kernel policy for such cases?
> > >
> > > What "case"?
> > >
> > > There is no context here at all, and I can't find any patch on lore at
> > > all.
> > >
> > > Please always properly quote stuff...
> >
> > It's not easy with kernel lists. I used the lore suggested reply-to
> > command. Here is full thread:
> > https://lore.kernel.org/all/20240704135057.1174408-1-dvyukov@google.com/
>
> I see no patch on lore on this thread :(

Oh, it wasn't properly threaded, sorry.
Here is the patch:
https://lore.kernel.org/all/20230801155823.206985-1-ghandatmanas@gmail.com/
