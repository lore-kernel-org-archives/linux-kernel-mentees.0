Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8D9C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 17:57:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 730AD2080A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 17:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="jXFW2vpq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 730AD2080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BBB4F86818;
	Mon,  7 Sep 2020 17:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KTylF26TMSRd; Mon,  7 Sep 2020 17:57:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D94DC85BA3;
	Mon,  7 Sep 2020 17:57:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4B67C0859;
	Mon,  7 Sep 2020 17:57:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C96B6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 17:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AE7FA221C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 17:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bO3tkCrg+qyo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 17:57:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by silver.osuosl.org (Postfix) with ESMTPS id A5A902153D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 17:57:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id e17so15080806wme.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Sep 2020 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=RsFG54GV+NP4F+IIVMuYkYvf7gdGYuBHjlNkFLPcIoM=;
 b=jXFW2vpqo0B1JyOT5VBIuG9gyefyLdQ0ycGwHcTHninipd8+5VtxLgb8IkgYYvMt+v
 8W+GI4P2cd8TxlUpDDrsjBQnd8tqBCLuASSa1+xYojW+R0KHtDvEovie75S1Z6YMzFju
 JSavVRhxpqkmcQ+s4OQk1bVYh4yKB5g9BqEvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=RsFG54GV+NP4F+IIVMuYkYvf7gdGYuBHjlNkFLPcIoM=;
 b=F3QzfiloJA8H1D18buEApk3Cc4UZgABb6Zdzf86dDTNlnC89FyHEjCpfzNjqzU913G
 W//ptN6sqtfFunaOQSMKf4Yg/yZEnyElbJ+9Bhbe5bf0BGlTOFAB4PDs1hdopKfnPVEH
 i+tQ1mKgxKjPaxNqxMH9/xcoMUbrcAgdJSYdQzsNNH17lEfUm3Nz+KgW/UKuiLrBnVgg
 Ae8MDpdfCw2wZI+cb4Rne6zSGPZsCHtyJ6UYIoP+RaSG2BpJ4T+C5PluUEYgA7WRV+Oe
 aNExlBuWTMkvyImiwxwbFxUz8jOIg7kGxuYETjranhTmyDtZfyNaJdIlPptDnUi3G25p
 VrEw==
X-Gm-Message-State: AOAM532OoBREYsKp3J75wh4ZAvfk+Fox+jiJZziSTvsB3Pao/27rTQsy
 1hcZfJL4wYZQK/ssa85Xl4YgIQ==
X-Google-Smtp-Source: ABdhPJwkSG6w/oKeAR2zEQQ1pJGVVVgYfJ7bv5Pg1nyA4WyBR3gTj1fQsBdjbM44Fhl2fJnj9VpuFQ==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr423949wmj.171.1599501448675;
 Mon, 07 Sep 2020 10:57:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 71sm30404303wrm.23.2020.09.07.10.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 10:57:27 -0700 (PDT)
Date: Mon, 7 Sep 2020 19:57:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200907175725.GX2352366@phenom.ffwll.local>
Mail-Followup-To: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200907075559.GN2352366@phenom.ffwll.local>
 <20200907091621.GA30377@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907091621.GA30377@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thierry Reding <treding@nvidia.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 0/2] video: fbdev: radeonfb:
 PCI PM framework upgrade and fix-ups.
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

On Mon, Sep 07, 2020 at 02:46:21PM +0530, Vaibhav Gupta wrote:
> On Mon, Sep 07, 2020 at 09:55:59AM +0200, Daniel Vetter wrote:
> > On Thu, Aug 06, 2020 at 12:52:54PM +0530, Vaibhav Gupta wrote:
> > > Linux Kernel Mentee: Remove Legacy Power Management. 
> > > 
> > > The original goal of the patch series is to upgrade the power management
> > > framework of radeonfb fbdev driver. This has been done by upgrading .suspend()
> > > and .resume() callbacks.
> > > 
> > > The upgrade makes sure that the involvement of PCI Core does not change the
> > > order of operations executed in a driver. Thus, does not change its behavior.
> > > 
> > > During this process, it was found that "#if defined(CONFIG_PM)" at line 1434 is
> > > redundant. This was introduced in the commit
> > > 42ddb453a0cd ("radeon: Conditionally compile PM code").
> > 
> > I do wonder whether it wouldn't be better to just outright delete these,
> > we have the drm radeon driver for pretty much all the same hardware ...
> > -Daniel
> > 
> Hello Daniel,
> I don't have any problem in either way. My priority is to get rid of the
> legacy .suspend and .resume pointers from "struct pci_driver" . Hence, modifying
> every driver that is using them.

Ok, also sounds like we can't just ditch it outright and merging your
patches makes sense.

Please note that Bart (he's usually picking up the fbdev patches) is on
vacations until next week, I guess he'll then go and vacuum up everything
for 5.10 as he usually does.

Cheers, Daniel

> 
> Vaibhav Gupta
> > > 
> > > ------------
> > > 
> > > Before 42ddb453a0cd:
> > > $ git show 65122f7e80b5:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> > > 
> > > Based on output in terminal:
> > > 
> > > 547:#ifdef CONFIG_PM
> > >        |-- 959:#ifdef CONFIG_PPC_PMAC
> > >        |-- 972:#endif
> > >        |-- 1291:#ifdef CONFIG_PPC_OF
> > >        |-- 1301:#endif /* CONFIG_PPC_OF */
> > >        |-- 1943:#ifdef CONFIG_PPC_OF
> > >                    |-- 2206:#if 0 /* Not ready yet */
> > >                    |-- 2508:#endif /* 0 */
> > >        |-- 2510:#endif /* CONFIG_PPC_OF */
> > >        |-- 2648:#ifdef CONFIG_PPC_PMAC
> > >        |-- 2654:#endif /* CONFIG_PPC_PMAC */
> > >        |-- 2768:#ifdef CONFIG_PPC_PMAC
> > >        |-- 2774:#endif /* CONFIG_PPC_PMAC */
> > >        |-- 2791:#ifdef CONFIG_PPC_OF__disabled
> > >        |-- 2801:#endif /* CONFIG_PPC_OF */
> > > 2803:#endif /* CONFIG_PM */
> > > 
> > > ------------
> > > 
> > > After 42ddb453a0cd:
> > > $ git show 42ddb453a0cd:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> > > 
> > > Based on output in terminal:
> > > 
> > > 547:#ifdef CONFIG_PM
> > >        |-- 959:#ifdef CONFIG_PPC_PMAC
> > >        |-- 972:#endif
> > >        |-- 1291:#ifdef CONFIG_PPC_OF
> > >        |-- 1301:#endif /* CONFIG_PPC_OF */
> > >        |-- 1430:#if defined(CONFIG_PM)
> > >                    |-- 1431:#if defined(CONFIG_X86) || defined(CONFIG_PPC_PMAC)
> > >                    |-- 1944:#endif
> > >                    |-- 1946:#ifdef CONFIG_PPC_OF
> > >                                |-- 1947:#ifdef CONFIG_PPC_PMAC
> > >                                |-- 2208:#endif
> > >                    |-- 2209:#endif
> > >                    |-- 2211:#if 0 /* Not ready yet */
> > >                    |-- 2513:#endif /* 0 */
> > >        |-- 2515:#endif /* CONFIG_PPC_OF */
> > >        |-- 2653:#ifdef CONFIG_PPC_PMAC
> > >        |-- 2659:#endif /* CONFIG_PPC_PMAC */
> > >        |-- 2773:#ifdef CONFIG_PPC_PMAC
> > >        |-- 2779:#endif /* CONFIG_PPC_PMAC */
> > >        |-- 2796:#ifdef CONFIG_PPC_OF__disabled
> > >        |-- 2806:#endif /* CONFIG_PPC_OF */
> > > 2808:#endif /* CONFIG_PM */
> > > 
> > > ------------
> > > 
> > > This also affected the CONFIG_PPC_OF container (line 1943 at commit 65122f7e80b5)
> > > 
> > > The patch-series fixes it along with PM upgrade.
> > > 
> > > All patches are compile-tested only.
> > > 
> > > Test tools:
> > >     - Compiler: gcc (GCC) 10.1.0
> > >     - allmodconfig build: make -j$(nproc) W=1 all
> > > 
> > > Vaibhav Gupta (2):
> > >   video: fbdev: aty: radeon_pm: remove redundant CONFIG_PM container
> > >   fbdev: radeonfb:use generic power management
> > > 
> > >  drivers/video/fbdev/aty/radeon_base.c | 10 ++++---
> > >  drivers/video/fbdev/aty/radeon_pm.c   | 38 ++++++++++++++++++++-------
> > >  drivers/video/fbdev/aty/radeonfb.h    |  3 +--
> > >  3 files changed, 35 insertions(+), 16 deletions(-)
> > > 
> > > -- 
> > > 2.27.0
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
