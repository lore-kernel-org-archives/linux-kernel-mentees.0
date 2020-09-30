Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E199AC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 10:56:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF51206A1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 10:56:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ST3Kd8Ns"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BF51206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AEE91851CC;
	Wed, 30 Sep 2020 10:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GP6yZ_4BJwON; Wed, 30 Sep 2020 10:56:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2AF1B8502A;
	Wed, 30 Sep 2020 10:56:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1196FC0890;
	Wed, 30 Sep 2020 10:56:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EA84C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 10:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7753385549
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 10:56:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZURpibKDQcf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 10:56:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7492F8484B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 10:56:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s31so885769pga.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 03:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oHjy/cJNfXXtogE/EOScxb15VZyxV8RmFzlm1RVW7+4=;
 b=ST3Kd8NsgI00gcwe++TnkB9yoG7CcnwaH1PhFE7KHu2q8pACXvMlCKfgfMR4yCUOJu
 ADghrfvzWjSlgIUCxoJM7ZQjtPtxlo33UaHnhi+3+Y8DpDYs9PHoW5N3sZrZ4AtsxomX
 mFlkpo3duTlRy6LZnvVCEyrnEIoRNBO7X87egzV14m7epsPyc/6Jab9yI502MgaWlQae
 2rIIV140OVnyhadXYHdTmEAXDspwTby8A0pU8fE3wJMaoN+2rkgMMdLhX1vm6wpplv37
 0K806v7DDEPK3d+/Gj2NiaXqsYvDUrExl7lmpaOGK+r0m4Qo9ruZgkAAOfZldREf7KOn
 Bihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oHjy/cJNfXXtogE/EOScxb15VZyxV8RmFzlm1RVW7+4=;
 b=tMvgeQh/Tg0gczUgtmz1UqXQuFk4rmLoRC54uQWnVND05xauicXZyRVYiABhj52Fb5
 E2E4yGbwJS44kezJbro03Hta9BsVaJe1+b/57leOPqipbw8MtLOFf8CeO8w+X1grxWMf
 PFXE/hQvDjDx67fl9f+hU+lmEb5lAW8C6sG1p+zrzXLltMB7YNrldYr3wv+Fay6TWKbU
 Sr0zobtp8MxZTdK51s8HVt5tZ1iyHtYqFiHov5iSkuqiWuxeoETpQRu0dqTZcgOc8zZ/
 Hk99OBthXyjiVr0MWCfwIC+Qoki5DVu83x+9d3EEPxHR2BuLBz0ryx04wmbgCcQt+8p2
 wX0Q==
X-Gm-Message-State: AOAM531Y8vGZ62UR4Bj3gqsHD67cMrO7YOriuMwS6+UbmCwTBKH8vejw
 asYkIINcYaLA0f+4XZIevA==
X-Google-Smtp-Source: ABdhPJxwDjg9fu9SIBa0weczPWatPsktZqfGJP54jLXM6mwLCAozwhwqJF1pVlQk2zADetgfH2HP7w==
X-Received: by 2002:a63:4e0a:: with SMTP id c10mr1671562pgb.369.1601463362849; 
 Wed, 30 Sep 2020 03:56:02 -0700 (PDT)
Received: from PWN ([161.117.80.159])
 by smtp.gmail.com with ESMTPSA id l14sm1837033pfc.170.2020.09.30.03.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 03:56:02 -0700 (PDT)
Date: Wed, 30 Sep 2020 06:55:53 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20200930105553.GA1154238@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
 <20200929123420.GA1143575@PWN>
 <CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com>
 <20200930071151.GA1152145@PWN>
 <20200930095317.GX438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930095317.GX438822@phenom.ffwll.local>
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

On Wed, Sep 30, 2020 at 11:53:17AM +0200, Daniel Vetter wrote:
> On Wed, Sep 30, 2020 at 03:11:51AM -0400, Peilin Ye wrote:
> > On Tue, Sep 29, 2020 at 04:38:49PM +0200, Daniel Vetter wrote:
> > > On Tue, Sep 29, 2020 at 2:34 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > > Ah, and speaking of built-in fonts, see fbcon_startup():
> > > >
> > > >         /* Setup default font */
> > > >                 [...]
> > > >                 vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */
> > > >                             ^^^^^^^^^^^^^^^
> > > >
> > > > This is because find_font() and get_default_font() return a `struct
> > > > font_desc *`, but `struct font_desc` doesn't contain `charcount`. I
> > > > think we also need to add a `charcount` field to `struct font_desc`.
> > > 
> > > Hm yeah ... I guess maybe struct font_desc should be the starting
> > > point for the kernel internal font structure. It's at least there
> > > already ...
> > 
> > I see, that will also make handling built-in fonts much easier!
> 
> I think the only downside with starting with font_desc as the internal
> font represenation is that there's a few fields we don't need/have for
> userspace fonts (like the id/name stuff). So any helpers to e.g. print out
> font information need to make sure they don't trip over that
> 
> But otherwise I don't see a problem with this, I think.

Yes, and built-in fonts don't use refcount. Or maybe we can let
find_font() and get_default_font() kmalloc() a copy of built-in font
data, then keep track of refcount for both user and built-in fonts, but
that will waste a few K of memory for each built-in font we use...

> > > I think for vc_date->vc_font we might need a multi-step approach:
> > > - first add a new helper function which sets the font for a vc using
> > > an uapi console_font struct (and probably hard-coded assumes cnt ==
> > > 256.
> > 
> > But user fonts may have a charcount different to 256... But yes I'll try
> > to figure out how.
> 
> Hm yeah, maybe we need a helper to give us the charcount then, which by
> default is using the magic negative offset.

Ah, I see! :)

> Then once we've converted everything over to explicitly passing charcount
> around, we can switch that helper. So something like
> 
> int kern_font_charcount(struct kern_font *font);
> 
> Feel free to bikeshed the struct name however you see fit :-)

I think both `kern_font` and `font_desc` makes sense, naming is so
hard...

> > > For first steps I'd start with demidlayering some of the internal
> > > users of uapi structs, like the console_font_op really shouldn't be
> > > used anywhere in any function, except in the ioctl handler that
> > > converts it into the right function call. You'll probably discover a
> > > few other places like this on the go.
> > 
> > Sure, I'll start from this, then cleaning up these dummy functions, then
> > `vc_data`. Thank you for the insights!
> 
> Please don't take this rough plan as fixed, it's just where I'd start from
> browsing the code and your analysis a bit. We'll probably have to adapt as
> we go and more nasty things turn up ...

Sure, I'll first give it a try and see. Thank you!

Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
