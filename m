Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20516C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 13:26:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 785E32076D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 13:26:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="O5Wv1IsS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 785E32076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EC2F686BDA;
	Fri, 25 Sep 2020 13:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RqJf0ubfmz5B; Fri, 25 Sep 2020 13:25:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 320BB8698B;
	Fri, 25 Sep 2020 13:25:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FBC3C0889;
	Fri, 25 Sep 2020 13:25:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 333B2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 13:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 21019874F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 13:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbUjUnCm0Zy4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 13:25:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0C87F8750E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 13:25:55 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id w2so3053808wmi.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=yoij1P7j+Xx2RWFa9SVqI2FsfBHkpzDlIUwpiLGvHCs=;
 b=O5Wv1IsSLOcxCzcYzyGteQ12YwvQDDgtGufFm3QgoL3W9ikTTvLPP56IBzaY85PZFs
 p7JxOohdXRnM2KsAxLCSc5felltd/SWWA6JwHieEfFf8z6q8p7bV0yK56vOcTBaEQJZK
 nQZdCFnKQyDz4RX3JYfbOSd9QXr6fN1Z9n6g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=yoij1P7j+Xx2RWFa9SVqI2FsfBHkpzDlIUwpiLGvHCs=;
 b=Uq2eoxd8GRh2xgQB7bHNxbBmF9lR9FOLdIIG47Ym5fJxGUiIL/JXoDZprnJ9bSwmFr
 u6EJx4G5iz6ku32mL0LjIb7mwqXZZVKFORAKPSxa/U1ry3gU+PLOmu7XelbU0oiRYjLY
 8oUz2vWyyU1ACAbhOiN9XH5YIpLMm8KEVsnGhOMt6I5qkt3Q9T9X8GCB7ROvsfmGOExQ
 ZzyJh3h0XUh98MItwxoPNv9w0M6JaYT4h3ovqo8hAGgijXBYp36swlSKnjtFEfmsuHLX
 Z7y5hRZVkKH5Vw6ZiEwBVubT9P1CWfEJG5ww3mbjrtV9bx/L0xqLDRoVpFw/+IMszKTL
 73Ug==
X-Gm-Message-State: AOAM533HEvwhVZsBXh3iHJiZ0h5aFjKa8Q8YR2kUOpqhYENaASQQs9X3
 ee1FYAeOJoVp5McL2EJwrscE0Q==
X-Google-Smtp-Source: ABdhPJyBZrVOoGGq5hPUstHZ/Y1HyDY0PIguaVz0GuDdkIvNUqMBJyEp1I87FKugY2GqQ8LaJuCahA==
X-Received: by 2002:a7b:c1d3:: with SMTP id a19mr3071230wmj.19.1601040354194; 
 Fri, 25 Sep 2020 06:25:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm3275837wre.7.2020.09.25.06.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 06:25:53 -0700 (PDT)
Date: Fri, 25 Sep 2020 15:25:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200925132551.GF438822@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925101300.GA890211@PWN>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiri Slaby <jirislaby@kernel.org>,
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

On Fri, Sep 25, 2020 at 06:13:00AM -0400, Peilin Ye wrote:
> Hi all!
> 
> On Fri, Sep 25, 2020 at 08:46:04AM +0200, Jiri Slaby wrote:
> > > In order to perform a reliable range check, fbcon_get_font() needs to know
> > > `FONTDATAMAX` for each built-in font under lib/fonts/. Unfortunately, we
> > > do not keep that information in our font descriptor,
> > > `struct console_font`:
> > > 
> > > (include/uapi/linux/kd.h)
> > > struct console_font {
> > > 	unsigned int width, height;	/* font size */
> > > 	unsigned int charcount;
> > > 	unsigned char *data;	/* font data with height fixed to 32 */
> > > };
> > > 
> > > To make things worse, `struct console_font` is part of the UAPI, so we
> > > cannot add a new field to keep track of `FONTDATAMAX`.
> > 
> > Hi,
> > 
> > but you still can define struct kernel_console_font containing struct
> > console_font and the 4 more members you need in the kernel. See below.
> > 
> > > Fortunately, the framebuffer layer itself gives us a hint of how to
> > > resolve this issue without changing UAPI. When allocating a buffer for a
> > > user-provided font, fbcon_set_font() reserves four "extra words" at the
> > > beginning of the buffer:
> > > 
> > > (drivers/video/fbdev/core/fbcon.c)
> > > 	new_data = kmalloc(FONT_EXTRA_WORDS * sizeof(int) + size, GFP_USER);
> > 
> > I might be missing something (like coffee in the morning), but why don't
> > you just:
> > 1) declare struct font_data as
> > {
> >   unsigned sum, char_count, size, refcnt;
> >   const unsigned char data[];
> > }
> > 
> > Or maybe "struct console_font font" instead of "const unsigned char
> > data[]", if need be.
> > 
> > 2) allocate by:
> >   kmalloc(struct_size(struct font_data, data, size));
> > 
> > 3) use container_of wherever needed
> > 
> > That is you name the data on negative indexes using struct as you
> > already have to define one.
> > 
> > Then you don't need the ugly macros with negative indexes. And you can
> > pass this structure down e.g. to fbcon_do_set_font, avoiding potential
> > mistakes in accessing data[-1] and similar.
> 
> Sorry that I didn't mention it in the cover letter, but yes, I've tried
> this - a new `kernel_console_font` would be much cleaner than negative
> array indexing.
> 
> The reason I ended up giving it up was, frankly speaking, these macros
> are being used at about 30 places, and I am not familiar enough with the
> framebuffer and newport_con code, so I wasn't confident how to clean
> them up and plug in `kernel_console_font` properly...
> 
> Another reason was that, functions like fbcon_get_font() handle both user
> fonts and built-in fonts, so I wanted a single solution for both of
> them. I think we can't really introduce `kernel_console_font` while
> keeping these macros, that would make the error handling logics etc.
> very messy.
> 
> I'm not very sure what to do now. Should I give it another try cleaning
> up all the macros?
> 
> And thank you for reviewing this!

I think the only way to make this work is that we have one place which
takes in the userspace uapi struct, and then converts it once into a
kernel_console_font. With all the error checking.

Then all internal code deals in terms of kernel_console_font, with
properly typed and named struct members and helper functions and
everything. And we might need a gradual conversion for this, so that first
we can convert over invidual console drivers, then subsystems, until at
the end we've pushed the conversion from uapi array to kernel_console_font
all the way to the ioctl entry points.

But that's indeed a huge pile of work, and fair warning: fbcon is
semi-orphaned, so by doing this you'll pretty much volunteer for
maintainership :-)

But I'd be very happy to help get this done and throw some maintainership
credentials at you in the proces ...

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
