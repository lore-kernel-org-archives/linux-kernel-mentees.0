Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0465C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 11:47:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5A682075F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 11:47:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ilt2tbwC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5A682075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8907C856F6;
	Wed, 30 Sep 2020 11:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VSV5Qs1amR3I; Wed, 30 Sep 2020 11:47:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA577856CB;
	Wed, 30 Sep 2020 11:47:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8D85C016F;
	Wed, 30 Sep 2020 11:47:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44095C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 11:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 380B320462
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 11:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3oMgyVCaeE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 11:47:13 +0000 (UTC)
X-Greylist: delayed 00:21:47 by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by silver.osuosl.org (Postfix) with ESMTPS id C90DF20419
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 11:47:13 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id s66so1509834otb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XPhNhgXjvXmO6qMe12Ico/ebR2/givwfQj61bckl1Qw=;
 b=ilt2tbwC7TC34+YDgjBCThqgVJBSTbEAwVvPYe1QHXusF6Z5z6Qhipdawxa2ueUHc/
 Z29fDYlSSnSdMgyHlZLEHRHHCCrU1VXxd0D4yc1r5I1TFQ8HqE4YbmwyD3qvfYnx7QeP
 4NwAkOjWuoMBi53qM8r+48EmM0QeY7MrIr5Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XPhNhgXjvXmO6qMe12Ico/ebR2/givwfQj61bckl1Qw=;
 b=Kc3LSgpnjAtphQU5cj/zRlLqZEMMQWqe1yotX2nCuWojP4bU0gMZ9/zEi05SkW/X00
 hITTG8+z1PyJpf2aGgOeXtp0jewy/6IqPDlP5JlbZhiEqDw2ymZXURg9A2xF2FKlitJw
 Xav31doik4LYy5MxAdyGDlD/5S4Cgzf8lv7h7Rwt8tvOIVgEH2cUzKr4ebgHZsRvA946
 wr4i87jmmQtUq/aiUA5NbwYovwxLIScp0+9bJMo5UfMyGwM5IDeGioE29obP+Ktm3Rm0
 Q7r49OIWegYvyD5ZK/v+awCRmhUm9IAE0o331ijqFk5IXYTsk8tVaUQrm40NluyZAqjb
 BAhA==
X-Gm-Message-State: AOAM533OebbNnOtavvLhdRH/Z+Oj+26n1t0CdEPFopIHN11OVsZR0wwz
 zQf+MWu7B3Z0fadeLmW7Dr2Okezv1bjtM/POT6Y/FmCgvtRg0w==
X-Google-Smtp-Source: ABdhPJxEgm74LL2epdjXJXLLzINvmmFbGywbDO4Fc87teAZPaKspdA7yDK4a1Y64+ZE5t7m/SLjyxrDFnCEfpchc8Ko=
X-Received: by 2002:a05:6830:1e56:: with SMTP id
 e22mr1190431otj.303.1601465125944; 
 Wed, 30 Sep 2020 04:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local> <20200929123420.GA1143575@PWN>
 <CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com>
 <20200930071151.GA1152145@PWN> <20200930095317.GX438822@phenom.ffwll.local>
 <20200930105553.GA1154238@PWN>
In-Reply-To: <20200930105553.GA1154238@PWN>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Sep 2020 13:25:14 +0200
Message-ID: <CAKMK7uFzWZgs4rvqSXqn_ifr8utG_rNw54+y6CWjdV=Epak-iQ@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Wed, Sep 30, 2020 at 12:56 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Wed, Sep 30, 2020 at 11:53:17AM +0200, Daniel Vetter wrote:
> > On Wed, Sep 30, 2020 at 03:11:51AM -0400, Peilin Ye wrote:
> > > On Tue, Sep 29, 2020 at 04:38:49PM +0200, Daniel Vetter wrote:
> > > > On Tue, Sep 29, 2020 at 2:34 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > > > Ah, and speaking of built-in fonts, see fbcon_startup():
> > > > >
> > > > >         /* Setup default font */
> > > > >                 [...]
> > > > >                 vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */
> > > > >                             ^^^^^^^^^^^^^^^
> > > > >
> > > > > This is because find_font() and get_default_font() return a `struct
> > > > > font_desc *`, but `struct font_desc` doesn't contain `charcount`. I
> > > > > think we also need to add a `charcount` field to `struct font_desc`.
> > > >
> > > > Hm yeah ... I guess maybe struct font_desc should be the starting
> > > > point for the kernel internal font structure. It's at least there
> > > > already ...
> > >
> > > I see, that will also make handling built-in fonts much easier!
> >
> > I think the only downside with starting with font_desc as the internal
> > font represenation is that there's a few fields we don't need/have for
> > userspace fonts (like the id/name stuff). So any helpers to e.g. print out
> > font information need to make sure they don't trip over that
> >
> > But otherwise I don't see a problem with this, I think.
>
> Yes, and built-in fonts don't use refcount. Or maybe we can let
> find_font() and get_default_font() kmalloc() a copy of built-in font
> data, then keep track of refcount for both user and built-in fonts, but
> that will waste a few K of memory for each built-in font we use...

A possible trick for this would be to make sure built-in fonts start
out with a refcount of 1. So never get freed. Plus maybe a check that
if the name is set, then it's a built-in font and if we ever underflow
the refcount we just WARN, but don't free anything.

Another trick would be kern_font_get/put wrappers (we'd want those
anyway if the userspace fonts are refcounted) and if kern_font->name
!= NULL (i.e. built-in font with name) then we simply don't call
kref_get/put.
-Daniel

> > > > I think for vc_date->vc_font we might need a multi-step approach:
> > > > - first add a new helper function which sets the font for a vc using
> > > > an uapi console_font struct (and probably hard-coded assumes cnt ==
> > > > 256.
> > >
> > > But user fonts may have a charcount different to 256... But yes I'll try
> > > to figure out how.
> >
> > Hm yeah, maybe we need a helper to give us the charcount then, which by
> > default is using the magic negative offset.
>
> Ah, I see! :)
>
> > Then once we've converted everything over to explicitly passing charcount
> > around, we can switch that helper. So something like
> >
> > int kern_font_charcount(struct kern_font *font);
> >
> > Feel free to bikeshed the struct name however you see fit :-)
>
> I think both `kern_font` and `font_desc` makes sense, naming is so
> hard...
>
> > > > For first steps I'd start with demidlayering some of the internal
> > > > users of uapi structs, like the console_font_op really shouldn't be
> > > > used anywhere in any function, except in the ioctl handler that
> > > > converts it into the right function call. You'll probably discover a
> > > > few other places like this on the go.
> > >
> > > Sure, I'll start from this, then cleaning up these dummy functions, then
> > > `vc_data`. Thank you for the insights!
> >
> > Please don't take this rough plan as fixed, it's just where I'd start from
> > browsing the code and your analysis a bit. We'll probably have to adapt as
> > we go and more nasty things turn up ...
>
> Sure, I'll first give it a try and see. Thank you!
>
> Peilin Ye
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
