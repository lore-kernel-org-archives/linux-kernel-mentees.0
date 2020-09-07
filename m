Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D1DC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 09:18:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B62E2078E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 09:18:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0nVzEt0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B62E2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AF8C3870BA;
	Mon,  7 Sep 2020 09:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o5lmhjIYbng1; Mon,  7 Sep 2020 09:18:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E0F5870B7;
	Mon,  7 Sep 2020 09:18:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B544C0859;
	Mon,  7 Sep 2020 09:18:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61AF3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 09:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4FC858452D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 09:18:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZWeUDi6QkdW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 09:18:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AA03184516
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 09:18:32 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id kk9so3834568pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Sep 2020 02:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kpwNni5DZsL81VsUzOEF6fgBNL8irinRHr++pS6DIH4=;
 b=O0nVzEt0to+Hpt5DmVNSrpKsB5pOnDvRJ8682q1tjqS9v/Qx3Bmbmcd8+okOLCi3Ci
 FjWoetYIYjZznCRSXunkH7DUavf55Gq7vRf958XI9iG/HYsQIrNfJpNlhebrFk0nL8sn
 Zht4yGQs7+PF5kJyNUh2Fn+CjmW4Vpp8DIzMgswenMi9y9jHnEeEoBy6OnYMcDqxYgkb
 0rmPSbRH8mKBId82tj1AdNhjksNhIqlXe7b0dbwEFqxCNq1T4a04DRFhs5vXccFg99Bo
 L/DoH3fIdmoqbfxRybBFcOB09axnPvtjZ2ivlNSmNFMInppDv8rhq+A27pmtroCDe0vq
 SwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kpwNni5DZsL81VsUzOEF6fgBNL8irinRHr++pS6DIH4=;
 b=WKUoVyf85qrLgdn9bYI1P5f1yn/NcmPxIf29WtXCzlZejVAMcKTS70g6+UITz4qdyf
 NnPUNUJWShpj+UgRHsTi7XJX5eVH1coMRjIoMtlM/fnn4T7uZJ92E23aMEGZyKSAxJjl
 eVsaiGvfojspvCl9DqNawFACzsBl+57Ann5lNX48swqSqpm+1OS7q6HCwLvXeaG+pAkM
 +AtQH4UFLuyDAJnaRA8E3haL+i/oERAuE0XZL5vbea5KSjc6K0blX/OgjS3nzIO+dBjj
 wKYawVqYzc5VXU0E4AUSAA4Gmd53nJZxda+PlDnTb/FAztHEbHlIydH8ZT1DHN8+2L7W
 sbbg==
X-Gm-Message-State: AOAM533wokXlyW2heO3p2+8P230wbooByBNkc5eC2QA9lyZ0+n/svJ0K
 xPd5QXFKo9ryn0eHClHU6sE=
X-Google-Smtp-Source: ABdhPJz8OyFdACQ/fUoHKevIftBWifFC0ICyCifnJiqsqaCt6U+OjFvMmXblon5SpVeKNm99E3VMxA==
X-Received: by 2002:a17:902:8bc7:: with SMTP id
 r7mr17695124plo.92.1599470312191; 
 Mon, 07 Sep 2020 02:18:32 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id h1sm5934980pji.52.2020.09.07.02.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 02:18:31 -0700 (PDT)
Date: Mon, 7 Sep 2020 14:46:21 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200907091621.GA30377@gmail.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200907075559.GN2352366@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907075559.GN2352366@phenom.ffwll.local>
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

On Mon, Sep 07, 2020 at 09:55:59AM +0200, Daniel Vetter wrote:
> On Thu, Aug 06, 2020 at 12:52:54PM +0530, Vaibhav Gupta wrote:
> > Linux Kernel Mentee: Remove Legacy Power Management. 
> > 
> > The original goal of the patch series is to upgrade the power management
> > framework of radeonfb fbdev driver. This has been done by upgrading .suspend()
> > and .resume() callbacks.
> > 
> > The upgrade makes sure that the involvement of PCI Core does not change the
> > order of operations executed in a driver. Thus, does not change its behavior.
> > 
> > During this process, it was found that "#if defined(CONFIG_PM)" at line 1434 is
> > redundant. This was introduced in the commit
> > 42ddb453a0cd ("radeon: Conditionally compile PM code").
> 
> I do wonder whether it wouldn't be better to just outright delete these,
> we have the drm radeon driver for pretty much all the same hardware ...
> -Daniel
> 
Hello Daniel,
I don't have any problem in either way. My priority is to get rid of the
legacy .suspend and .resume pointers from "struct pci_driver" . Hence, modifying
every driver that is using them.

Vaibhav Gupta
> > 
> > ------------
> > 
> > Before 42ddb453a0cd:
> > $ git show 65122f7e80b5:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
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
> > $ git show 42ddb453a0cd:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> > 
> > Based on output in terminal:
> > 
> > 547:#ifdef CONFIG_PM
> >        |-- 959:#ifdef CONFIG_PPC_PMAC
> >        |-- 972:#endif
> >        |-- 1291:#ifdef CONFIG_PPC_OF
> >        |-- 1301:#endif /* CONFIG_PPC_OF */
> >        |-- 1430:#if defined(CONFIG_PM)
> >                    |-- 1431:#if defined(CONFIG_X86) || defined(CONFIG_PPC_PMAC)
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
> > This also affected the CONFIG_PPC_OF container (line 1943 at commit 65122f7e80b5)
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
> >   video: fbdev: aty: radeon_pm: remove redundant CONFIG_PM container
> >   fbdev: radeonfb:use generic power management
> > 
> >  drivers/video/fbdev/aty/radeon_base.c | 10 ++++---
> >  drivers/video/fbdev/aty/radeon_pm.c   | 38 ++++++++++++++++++++-------
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
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
