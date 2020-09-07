Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6C8C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 11:59:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5706F207C3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 11:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5706F207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F31E486554;
	Mon,  7 Sep 2020 11:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NpuUAbj90it7; Mon,  7 Sep 2020 11:59:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E5A68667B;
	Mon,  7 Sep 2020 11:59:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 568E4C0859;
	Mon,  7 Sep 2020 11:59:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DDD6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 11:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 37CDD2026D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 11:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OaJGWAckO8TV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 11:59:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 40BD92012D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 11:59:14 +0000 (UTC)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 087Bwjb2023420
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 7 Sep 2020 06:58:49 -0500
Message-ID: <6161b96a30e51ff77a387a71eee6a46400530155.camel@kernel.crashing.org>
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Daniel Vetter <daniel@ffwll.ch>, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Date: Mon, 07 Sep 2020 21:58:44 +1000
In-Reply-To: <20200907075559.GN2352366@phenom.ffwll.local>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200907075559.GN2352366@phenom.ffwll.local>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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

On Mon, 2020-09-07 at 09:55 +0200, Daniel Vetter wrote:
> On Thu, Aug 06, 2020 at 12:52:54PM +0530, Vaibhav Gupta wrote:
> > Linux Kernel Mentee: Remove Legacy Power Management. 
> > 
> > The original goal of the patch series is to upgrade the power
> > management
> > framework of radeonfb fbdev driver. This has been done by upgrading
> > .suspend()
> > and .resume() callbacks.
> > 
> > The upgrade makes sure that the involvement of PCI Core does not
> > change the
> > order of operations executed in a driver. Thus, does not change its
> > behavior.
> > 
> > During this process, it was found that "#if defined(CONFIG_PM)" at
> > line 1434 is
> > redundant. This was introduced in the commit
> > 42ddb453a0cd ("radeon: Conditionally compile PM code").
> 
> I do wonder whether it wouldn't be better to just outright delete
> these,
> we have the drm radeon driver for pretty much all the same hardware
> ...

The only thing is, afaik, the DRM drivers never got the D2/D3 code that
I wrote for radeonfb to get old powerbooks to suspend/resume.

Cheers,
Ben.

> -Daniel
> 
> > 
> > ------------
> > 
> > Before 42ddb453a0cd:
> > $ git show 65122f7e80b5:drivers/video/aty/radeon_pm.c | grep -n
> > "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> > 
> > Based on output in terminal:
> > 
> > 547:#ifdef CONFIG_PM
> >        |-- 959:#ifdef CONFIG_PPC_PMAC
> >        |-- 972:#endif
> >        |-- 1291:#ifdef CONFIG_PPC_OF
> >        |-- 1301:#endif /* CONFIG_PPC_OF */
> >        |-- 1943:#ifdef CONFIG_PPC_OF
> >                    |-- 2206:#if 0 /* Not ready yet */
> >                    |-- 2508:#endif /* 0 */
> >        |-- 2510:#endif /* CONFIG_PPC_OF */
> >        |-- 2648:#ifdef CONFIG_PPC_PMAC
> >        |-- 2654:#endif /* CONFIG_PPC_PMAC */
> >        |-- 2768:#ifdef CONFIG_PPC_PMAC
> >        |-- 2774:#endif /* CONFIG_PPC_PMAC */
> >        |-- 2791:#ifdef CONFIG_PPC_OF__disabled
> >        |-- 2801:#endif /* CONFIG_PPC_OF */
> > 2803:#endif /* CONFIG_PM */
> > 
> > ------------
> > 
> > After 42ddb453a0cd:
> > $ git show 42ddb453a0cd:drivers/video/aty/radeon_pm.c | grep -n
> > "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> > 
> > Based on output in terminal:
> > 
> > 547:#ifdef CONFIG_PM
> >        |-- 959:#ifdef CONFIG_PPC_PMAC
> >        |-- 972:#endif
> >        |-- 1291:#ifdef CONFIG_PPC_OF
> >        |-- 1301:#endif /* CONFIG_PPC_OF */
> >        |-- 1430:#if defined(CONFIG_PM)
> >                    |-- 1431:#if defined(CONFIG_X86) ||
> > defined(CONFIG_PPC_PMAC)
> >                    |-- 1944:#endif
> >                    |-- 1946:#ifdef CONFIG_PPC_OF
> >                                |-- 1947:#ifdef CONFIG_PPC_PMAC
> >                                |-- 2208:#endif
> >                    |-- 2209:#endif
> >                    |-- 2211:#if 0 /* Not ready yet */
> >                    |-- 2513:#endif /* 0 */
> >        |-- 2515:#endif /* CONFIG_PPC_OF */
> >        |-- 2653:#ifdef CONFIG_PPC_PMAC
> >        |-- 2659:#endif /* CONFIG_PPC_PMAC */
> >        |-- 2773:#ifdef CONFIG_PPC_PMAC
> >        |-- 2779:#endif /* CONFIG_PPC_PMAC */
> >        |-- 2796:#ifdef CONFIG_PPC_OF__disabled
> >        |-- 2806:#endif /* CONFIG_PPC_OF */
> > 2808:#endif /* CONFIG_PM */
> > 
> > ------------
> > 
> > This also affected the CONFIG_PPC_OF container (line 1943 at commit
> > 65122f7e80b5)
> > 
> > The patch-series fixes it along with PM upgrade.
> > 
> > All patches are compile-tested only.
> > 
> > Test tools:
> >     - Compiler: gcc (GCC) 10.1.0
> >     - allmodconfig build: make -j$(nproc) W=1 all
> > 
> > Vaibhav Gupta (2):
> >   video: fbdev: aty: radeon_pm: remove redundant CONFIG_PM
> > container
> >   fbdev: radeonfb:use generic power management
> > 
> >  drivers/video/fbdev/aty/radeon_base.c | 10 ++++---
> >  drivers/video/fbdev/aty/radeon_pm.c   | 38 ++++++++++++++++++++---
> > ----
> >  drivers/video/fbdev/aty/radeonfb.h    |  3 +--
> >  3 files changed, 35 insertions(+), 16 deletions(-)
> > 
> > -- 
> > 2.27.0
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
