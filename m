Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D7FC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 12:59:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D476520709
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 12:59:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJKbz8Q0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D476520709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F04284636;
	Wed, 30 Sep 2020 12:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gXDQA2Gh13yO; Wed, 30 Sep 2020 12:59:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 754588462A;
	Wed, 30 Sep 2020 12:59:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 649F0C0889;
	Wed, 30 Sep 2020 12:59:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 387E1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 12:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2A14021FA9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 12:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ad3A6p9henJf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 12:59:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id B42C6227AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 12:59:05 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id s14so890464pju.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 05:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BGONJfBGfiZJ8B5gVDKbSF1BVGKwQjHdLl3ddJo9tVY=;
 b=eJKbz8Q0kBy+c9iBIWhnx+5lDxtWn3fntLUDzpGUW709Er3KPWJPiwrRw6GnRMJeGn
 xodi9WCSndpOjnrfs4XfsryyUrXfJmelVfDFngugKTT/TIFNXxrsEiPfUMqP1E3vrCD3
 Ujq0ESsfFS5bbg1mDhmeYuLR1dazAfdE7Uq5/bVNFR4L68c6+6C+ex5KCWxd9DrWxrL8
 l9Xg8oS6UFCyOsOj81oskbHKdF5QskffRIDpTO3vpxBIuOadWbgZ13hoHaeNF+VI1jCG
 Vaato+9lnzp0K1IkdzExljN8tXbUqiyHcLJodvjhypXRNCpVPsE8Zc3bZbit2DkzcNcL
 wkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BGONJfBGfiZJ8B5gVDKbSF1BVGKwQjHdLl3ddJo9tVY=;
 b=buOz1lwupUXy7ODv6AXZSpicHlkvK+UU2psyKrJ7wJ1Og9wVhYPhEd5RAGIGeoRBG4
 Ptl5BfEtq9M+ROrQwxr9IuQVJ4YcIgzP9Nve73lZ90gQpkEF/cnB2IRHZgvBET0hGv7M
 wtt1db2HfLCLywfw4Gu+bIHnVfHlbJiNr9M84PozAirmQ+0Uig1qREYiDf8JQZPE/+Xs
 CyY9o39s5txMRyeDIDqw/HtzTyWLOLzhcTg8lW9C5KPmf5/yqe4m8ncCgrMOqkPsiHg9
 mTfmCjuMUpSMlGWlr1kgIY7WaskcfZ98F3OV2jEKe9BA05RfhNJPv7TAhlfBlXeac6jc
 l7tQ==
X-Gm-Message-State: AOAM5329hTJOzp4GnehegkxLfs2UjOAv8TqoZMFe6KOOzwEo4r9dNCOP
 /OpGyObq0n4KJNEtPdy4EQ==
X-Google-Smtp-Source: ABdhPJwbSPtClFFI3ea1mNKe4eO1VEd6GSD/SvuAQtvcm7zxPoV0QkXo2AazrpiYHQjW/KT/XysBXQ==
X-Received: by 2002:a17:90b:30c2:: with SMTP id
 hi2mr921373pjb.89.1601470745283; 
 Wed, 30 Sep 2020 05:59:05 -0700 (PDT)
Received: from PWN ([161.117.80.159])
 by smtp.gmail.com with ESMTPSA id u15sm2536438pjx.50.2020.09.30.05.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 05:59:04 -0700 (PDT)
Date: Wed, 30 Sep 2020 08:58:55 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20200930125855.GA1155358@PWN>
References: <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
 <20200929123420.GA1143575@PWN>
 <CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com>
 <20200930071151.GA1152145@PWN>
 <20200930095317.GX438822@phenom.ffwll.local>
 <20200930105553.GA1154238@PWN>
 <CAKMK7uFzWZgs4rvqSXqn_ifr8utG_rNw54+y6CWjdV=Epak-iQ@mail.gmail.com>
 <20200930115211.GC1603625@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930115211.GC1603625@kroah.com>
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
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

On Wed, Sep 30, 2020 at 01:52:11PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Sep 30, 2020 at 01:25:14PM +0200, Daniel Vetter wrote:
> > On Wed, Sep 30, 2020 at 12:56 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > Yes, and built-in fonts don't use refcount. Or maybe we can let
> > > find_font() and get_default_font() kmalloc() a copy of built-in font
> > > data, then keep track of refcount for both user and built-in fonts, but
> > > that will waste a few K of memory for each built-in font we use...
> > 
> > A possible trick for this would be to make sure built-in fonts start
> > out with a refcount of 1. So never get freed. Plus maybe a check that
> > if the name is set, then it's a built-in font and if we ever underflow
> > the refcount we just WARN, but don't free anything.
> > 
> > Another trick would be kern_font_get/put wrappers (we'd want those
> > anyway if the userspace fonts are refcounted) and if kern_font->name
> > != NULL (i.e. built-in font with name) then we simply don't call
> > kref_get/put.
> 
> Ick, don't do that, the first trick of having them start out with an
> increased reference count is the best way here.  Makes the code simpler
> and no special cases for the tear-down path.

I see, I'll just let them start out with 1, and only check `->name !=
NULL` in kern_font_put(). Thank you!

Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
