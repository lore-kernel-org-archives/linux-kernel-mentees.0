Return-Path: <SRS0=3LEE=DC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EF2C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 10:13:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA8F121741
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Sep 2020 10:13:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7Zjo2El"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA8F121741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3CE848758D;
	Fri, 25 Sep 2020 10:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1DEyKUTzYQcl; Fri, 25 Sep 2020 10:13:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AECE187588;
	Fri, 25 Sep 2020 10:13:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A12A9C0889;
	Fri, 25 Sep 2020 10:13:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A37E6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 10:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 990262E157
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 10:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YpEKLOL1pL3v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 10:13:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id A68192E149
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 10:13:09 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id y14so2130585pgf.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 03:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=720jfHfclRnuElbF5sBzZ7YrsJeN0GPjCiRxFVwpZoA=;
 b=i7Zjo2El5BzxdVYuuVMLa8MGZcc6OstPdzLxRwuXbMZdkeeu04m+n0XhYNS/MxNSkI
 +geUVpxEp6s3OgH7eUXw9uaBQrQGlBCVnmiYJWiL3enEzsGYVYIsC0NToHgONfeoZtNQ
 08429bRaEKBsTttN92pFdakTfdyCrToHclfhyX4rr8XMkapPN+F4kiDVVqbmyDLyD3DY
 dkEFSJmSw51IsvsTjnMzLX2WELq2j0Z0PtdNZQsCioN4TodyVPV5jr2EAiY+nnVMnv9J
 0xrYTrx5pOJ46fagsf8opPRq6G3TwOCJP3ZFC0vp+96yjyM/fmXmr77viRZrad1yqkEO
 CHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=720jfHfclRnuElbF5sBzZ7YrsJeN0GPjCiRxFVwpZoA=;
 b=RuGf/kW5C43neOM51mmQKSSwVvqeEkB8Gcbkmm4WF9w7XjMJShbbjSGAbHlUhqqM35
 6E0KaqCfyxePu9UnxLc/n+KBXZqRD01da40p+Qe8OqD1bOeS3rzgCqOK/CFfz4B+AN3+
 q68hMYllid2AcxEC2O3MnXuOZO1dVSrI33/GUzCXUW9KhDxGUhXmfuZEco5xdG4FzgF4
 PY9GgfjRwHdQy4XsORfHHQHZJvhGOO5dY6I5vLuLH9rSp49eptDXt+V8nE8fwzWBtUbf
 mqK3joxq6/gEb6uVB8LLWHxtYfuqRlA0J7tbYS0+Ab4jdVYyzuJK/nS5KD7WukAN31wK
 viNQ==
X-Gm-Message-State: AOAM532SUvbLw6c8JBuAwN/NfwE4o+rbLBCSOONwl6g7f4BGtLntGH/E
 sXBmE6i40/wSov8K+hpHdg==
X-Google-Smtp-Source: ABdhPJyH9hSYbuzMVkeLBRiy0bfoGk8cDtw/2un0NnyLt7EEM2tTDwRAuEk/AUNhm/BuhmA41p3M3g==
X-Received: by 2002:aa7:8249:0:b029:142:2501:35c9 with SMTP id
 e9-20020aa782490000b0290142250135c9mr3375837pfn.41.1601028789229; 
 Fri, 25 Sep 2020 03:13:09 -0700 (PDT)
Received: from PWN (n11212042027.netvigator.com. [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id h1sm1665573pji.52.2020.09.25.03.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 03:13:08 -0700 (PDT)
Date: Fri, 25 Sep 2020 06:13:00 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20200925101300.GA890211@PWN>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
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

Hi all!

On Fri, Sep 25, 2020 at 08:46:04AM +0200, Jiri Slaby wrote:
> > In order to perform a reliable range check, fbcon_get_font() needs to know
> > `FONTDATAMAX` for each built-in font under lib/fonts/. Unfortunately, we
> > do not keep that information in our font descriptor,
> > `struct console_font`:
> > 
> > (include/uapi/linux/kd.h)
> > struct console_font {
> > 	unsigned int width, height;	/* font size */
> > 	unsigned int charcount;
> > 	unsigned char *data;	/* font data with height fixed to 32 */
> > };
> > 
> > To make things worse, `struct console_font` is part of the UAPI, so we
> > cannot add a new field to keep track of `FONTDATAMAX`.
> 
> Hi,
> 
> but you still can define struct kernel_console_font containing struct
> console_font and the 4 more members you need in the kernel. See below.
> 
> > Fortunately, the framebuffer layer itself gives us a hint of how to
> > resolve this issue without changing UAPI. When allocating a buffer for a
> > user-provided font, fbcon_set_font() reserves four "extra words" at the
> > beginning of the buffer:
> > 
> > (drivers/video/fbdev/core/fbcon.c)
> > 	new_data = kmalloc(FONT_EXTRA_WORDS * sizeof(int) + size, GFP_USER);
> 
> I might be missing something (like coffee in the morning), but why don't
> you just:
> 1) declare struct font_data as
> {
>   unsigned sum, char_count, size, refcnt;
>   const unsigned char data[];
> }
> 
> Or maybe "struct console_font font" instead of "const unsigned char
> data[]", if need be.
> 
> 2) allocate by:
>   kmalloc(struct_size(struct font_data, data, size));
> 
> 3) use container_of wherever needed
> 
> That is you name the data on negative indexes using struct as you
> already have to define one.
> 
> Then you don't need the ugly macros with negative indexes. And you can
> pass this structure down e.g. to fbcon_do_set_font, avoiding potential
> mistakes in accessing data[-1] and similar.

Sorry that I didn't mention it in the cover letter, but yes, I've tried
this - a new `kernel_console_font` would be much cleaner than negative
array indexing.

The reason I ended up giving it up was, frankly speaking, these macros
are being used at about 30 places, and I am not familiar enough with the
framebuffer and newport_con code, so I wasn't confident how to clean
them up and plug in `kernel_console_font` properly...

Another reason was that, functions like fbcon_get_font() handle both user
fonts and built-in fonts, so I wanted a single solution for both of
them. I think we can't really introduce `kernel_console_font` while
keeping these macros, that would make the error handling logics etc.
very messy.

I'm not very sure what to do now. Should I give it another try cleaning
up all the macros?

And thank you for reviewing this!

Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
