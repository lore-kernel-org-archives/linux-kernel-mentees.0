Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C0FC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 11:15:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D0EB2065E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 11:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ig4tkCGz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D0EB2065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4883C87E24;
	Tue, 28 Jul 2020 11:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cudPNg4RVqtu; Tue, 28 Jul 2020 11:15:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8371587E09;
	Tue, 28 Jul 2020 11:15:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61957C004F;
	Tue, 28 Jul 2020 11:15:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60CA1C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5D40B86265
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:15:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2RqFrO3Botld
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:15:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B287686250
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:15:30 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id j187so18163097qke.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 04:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QIWDEkYc8mxAlKuadsKFH4VbD1YSAM7HFnbpBmNVSO8=;
 b=ig4tkCGz3vBobXOMO7BoapRzWs6lWMRevLLAhF4HMFvFHk51aV5q+u29L0ciq0z5Bw
 9heErKQGzKLJu5Sw+Tw8VfRTOpDfyoBOqwfy2SZT/dmbgSiqBwmyZDc5LBGtDvPp23+u
 ofAVBqom40t6XY+Ryc4eHoYhp7jof7gqfisCiwstRZMWzsipSyHPeAlmGRCltZqByuur
 l5qxWpuYjXF5o+VAXFK8pnsE41kEu8Ku+gq4KJ+NjXqKFmQyHyT29aBk3fOpJmkdk56z
 gTlNgo1uRetcwRU0yFDtYZBt1QJi9/sa5lS94DXH4cgYhPvvM969UBD0TUp9jO4NsJC8
 Z2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QIWDEkYc8mxAlKuadsKFH4VbD1YSAM7HFnbpBmNVSO8=;
 b=AV4AMLQyTvn4BnG39jxCph1NtvSq0NMRK5b2nd9UpiMQSnUNjzDd8VBg9rqJdi/MO7
 TwaVyC7ywrubwv0fyve3iz2CUIA2Cul93nu+gGOBhxicPh626UiBxhF2vTyXxgKcIMwx
 m7xjNZypiwca7wfWAzhg5b0HAPLjyAoMXdY9bChH8O7t0iFypEc+edWTAMCEsrGbegwE
 omFsxs19JRYejDpToapQRwGDLbadutuOpOiKBadV3cqctXRBt8ytf7qyb6XwYYBOdOu1
 OG+takNzw1/As9MWwze47UE3xofYfMUDSI6e55M+SG5fx0NLugnPlynV68RvNDv20H6g
 VNrw==
X-Gm-Message-State: AOAM531Nm3icLJNgnhyOETNuLSz6CD/ixUPS7x6cSFHIpSjHxekNsYbI
 e+XbMlO0W+gLsPbojMtTsg==
X-Google-Smtp-Source: ABdhPJwnCLW6FdwCOh5nOUuPdn7nxL775A6fuG5o1mUkIc3N4vsgVbSbHf8jAqg4H/8NhGRdHWbh9g==
X-Received: by 2002:a05:620a:151:: with SMTP id
 e17mr27492002qkn.173.1595934929870; 
 Tue, 28 Jul 2020 04:15:29 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id w27sm17261967qtv.68.2020.07.28.04.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 04:15:29 -0700 (PDT)
Date: Tue, 28 Jul 2020 07:15:27 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200728111527.GA407693@PWN>
References: <20200728014343.341303-1-yepeilin.cs@gmail.com>
 <CAK8P3a29=CugbGtZRQc0abGXvexp=gBk+LwOCG3yNCPakup+NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a29=CugbGtZRQc0abGXvexp=gBk+LwOCG3yNCPakup+NQ@mail.gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] drm/bufs: Prevent
 kernel-infoleak in copy_one_buf()
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

On Tue, Jul 28, 2020 at 10:11:09AM +0200, Arnd Bergmann wrote:
> On Tue, Jul 28, 2020 at 3:45 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > copy_one_buf() is copying uninitialized stack memory to userspace due to
> > the compiler not initializing holes in statically allocated structures.
> > Fix it by initializing `v` with memset().
> 
> I would add 'potentially' somewhere in that description: it is architecture
> dependent whether there are holes in this structure as 'enum' types
> and 'long' are both dependent on the ABI, and even if there is a hole,
> it is undefined behavior whether the hold gets initialized.

I see. I will fix that up. Thank you for the advice!

Peilin Ye

> Other than that, the patch looks good.
> 
> > Cc: stable@vger.kernel.org
> > Fixes: 5c7640ab6258 ("switch compat_drm_infobufs() to drm_ioctl_kernel()")
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
