Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8773C47425
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 11:52:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 612D420789
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 11:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vF4SjmHO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 612D420789
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0B571852D5;
	Wed, 30 Sep 2020 11:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PquOBafe5IG1; Wed, 30 Sep 2020 11:52:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 801E385168;
	Wed, 30 Sep 2020 11:52:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 628D3C016F;
	Wed, 30 Sep 2020 11:52:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 139BCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 11:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F00A1871EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 11:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCaU-cbHgWUr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 11:52:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6C3FC871DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 11:52:08 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A6792076B;
 Wed, 30 Sep 2020 11:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601466728;
 bh=b+UUVp7yg/Xy88+VOq3PGwKPj4epsjdj1Z7Ta82NEkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vF4SjmHOBXqabfycdXzWm4C5m3BiGd2oGtgLyc76At7qPSFh6lYLXhUwN1xgce5T0
 5+4s2yzN27qBOozldoEUetZB7qM1KvhQNEe6b/rt3rT7BSPum33G70uCA/itg2PGvP
 e5j61fytT/nHLPoqDjwMte8LL9iRjJUILyBvWbfM=
Date: Wed, 30 Sep 2020 13:52:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20200930115211.GC1603625@kroah.com>
References: <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
 <20200929123420.GA1143575@PWN>
 <CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com>
 <20200930071151.GA1152145@PWN>
 <20200930095317.GX438822@phenom.ffwll.local>
 <20200930105553.GA1154238@PWN>
 <CAKMK7uFzWZgs4rvqSXqn_ifr8utG_rNw54+y6CWjdV=Epak-iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFzWZgs4rvqSXqn_ifr8utG_rNw54+y6CWjdV=Epak-iQ@mail.gmail.com>
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH 0/3] Prevent out-of-bounds access
 for built-in font data buffers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Sep 30, 2020 at 01:25:14PM +0200, Daniel Vetter wrote:
> On Wed, Sep 30, 2020 at 12:56 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > On Wed, Sep 30, 2020 at 11:53:17AM +0200, Daniel Vetter wrote:
> > > On Wed, Sep 30, 2020 at 03:11:51AM -0400, Peilin Ye wrote:
> > > > On Tue, Sep 29, 2020 at 04:38:49PM +0200, Daniel Vetter wrote:
> > > > > On Tue, Sep 29, 2020 at 2:34 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > > > > Ah, and speaking of built-in fonts, see fbcon_startup():
> > > > > >
> > > > > >         /* Setup default font */
> > > > > >                 [...]
> > > > > >                 vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */
> > > > > >                             ^^^^^^^^^^^^^^^
> > > > > >
> > > > > > This is because find_font() and get_default_font() return a `struct
> > > > > > font_desc *`, but `struct font_desc` doesn't contain `charcount`. I
> > > > > > think we also need to add a `charcount` field to `struct font_desc`.
> > > > >
> > > > > Hm yeah ... I guess maybe struct font_desc should be the starting
> > > > > point for the kernel internal font structure. It's at least there
> > > > > already ...
> > > >
> > > > I see, that will also make handling built-in fonts much easier!
> > >
> > > I think the only downside with starting with font_desc as the internal
> > > font represenation is that there's a few fields we don't need/have for
> > > userspace fonts (like the id/name stuff). So any helpers to e.g. print out
> > > font information need to make sure they don't trip over that
> > >
> > > But otherwise I don't see a problem with this, I think.
> >
> > Yes, and built-in fonts don't use refcount. Or maybe we can let
> > find_font() and get_default_font() kmalloc() a copy of built-in font
> > data, then keep track of refcount for both user and built-in fonts, but
> > that will waste a few K of memory for each built-in font we use...
> 
> A possible trick for this would be to make sure built-in fonts start
> out with a refcount of 1. So never get freed. Plus maybe a check that
> if the name is set, then it's a built-in font and if we ever underflow
> the refcount we just WARN, but don't free anything.
> 
> Another trick would be kern_font_get/put wrappers (we'd want those
> anyway if the userspace fonts are refcounted) and if kern_font->name
> != NULL (i.e. built-in font with name) then we simply don't call
> kref_get/put.

Ick, don't do that, the first trick of having them start out with an
increased reference count is the best way here.  Makes the code simpler
and no special cases for the tear-down path.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
