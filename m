Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294BCC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 07:04:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90E44206B8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 07:04:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5a+MLnV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90E44206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0D462204B4;
	Mon,  7 Sep 2020 07:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLMadpKUE0Ru; Mon,  7 Sep 2020 07:04:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 497482047B;
	Mon,  7 Sep 2020 07:04:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31DC4C0859;
	Mon,  7 Sep 2020 07:04:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8103C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 92EC88708A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:04:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mdROaDVbIwMX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:04:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 113B687029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 07:04:28 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id z15so4062597plo.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Sep 2020 00:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XxdgRFlQigk4lLEnKCMOhpL5rmLS0bgdeVzH2zzhbYk=;
 b=M5a+MLnV7m4BYslTgTXLbVYvDCJ2QB7MC9Se+kNZ7FNpVHy7lHDPtsKHEFFti0QN9k
 PWOhVugkp82UCARsJ6e5aHJE/eeezbYXjCv3lokjUauh6ayjQo7iY7mOl+D6HJIyj9GM
 xCvcxP81rQzAbPFVvVpFfBkw9QB1MZ8sWTKw2oksX253tgDfHVpIZzGAC6CqhYL91IqE
 ErH43LJwV53Kwfp/kElozpKW0tdOH+QtM+XUGtVBYpvRupAR6s993NNAZB+LZtxvzZUL
 UJdOzeDkCzG/eZNgTwGcuLSvg8aIZA61IfPdA6xL1DknoDpu8fy0JYIfVPpXMUYwinuu
 xqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XxdgRFlQigk4lLEnKCMOhpL5rmLS0bgdeVzH2zzhbYk=;
 b=ROSw4SEyn3SA+k9w4IYda1zt4BF9UVNakHgvTHOljEX4vuBjjfs6/HG+cP3c5bhPLc
 dHGpyH/7Wh50J4+1ksbfioksytVb/pUyh/rm7RpU+9esFew6j6KtLr3EXzVk9QVMsKr2
 AzvkUgoyM9ZcZ81Fy7ouZzZ1C/JlYwcvb9MsET9cnnUsrWrANSDFsTYK75gc2thAXcHZ
 sg/K6dqYNMA1Onjh0g3TaF3PAhSW5IE8rMN7ueJ2M8urH2Kt6tO1EynBvvTuLrA0/g2i
 66+vKdlZDJcogEYpKR/5vM+tho1PLxaBgZqxuYMIoJHWkBmjYcR6qHsxoMCPSwqdppaj
 7l2A==
X-Gm-Message-State: AOAM530sxFYC2YOxtDw9IWWtJMSDddmPi1plO81KuKN77Hes7plQ6WTb
 iX6HfnlTFctJb9Vx9lNgJF8=
X-Google-Smtp-Source: ABdhPJxzXrszn/nMlQPgA3dIh74jqZ12lEEdIGvXDzYX2rnrX6ut7BBU2gmf7rUzqk3t1RGZMtWKzw==
X-Received: by 2002:a17:90a:bc08:: with SMTP id
 w8mr19016149pjr.168.1599462267567; 
 Mon, 07 Sep 2020 00:04:27 -0700 (PDT)
Received: from varodek.localdomain ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id 204sm6804733pfc.200.2020.09.07.00.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 00:04:27 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Date: Mon,  7 Sep 2020 12:32:19 +0530
Message-Id: <20200907070221.29938-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 0/2] video: fbdev: radeonfb: PCI
	PM framework upgrade and fix-ups.
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

Linux Kernel Mentee: Remove Legacy Power Management. 

The original goal of the patch series is to upgrade the power management
framework of radeonfb fbdev driver. This has been done by upgrading .suspend()
and .resume() callbacks.

The upgrade makes sure that the involvement of PCI Core does not change the
order of operations executed in a driver. Thus, does not change its behavior.

During this process, it was found that "#if defined(CONFIG_PM)" at line 1434 is
redundant. This was introduced in the commit
42ddb453a0cd ("radeon: Conditionally compile PM code").

------------

Before 42ddb453a0cd:
$ git show 65122f7e80b5:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"

Based on output in terminal:

547:#ifdef CONFIG_PM
       |-- 959:#ifdef CONFIG_PPC_PMAC
       |-- 972:#endif
       |-- 1291:#ifdef CONFIG_PPC_OF
       |-- 1301:#endif /* CONFIG_PPC_OF */
       |-- 1943:#ifdef CONFIG_PPC_OF
                   |-- 2206:#if 0 /* Not ready yet */
                   |-- 2508:#endif /* 0 */
       |-- 2510:#endif /* CONFIG_PPC_OF */
       |-- 2648:#ifdef CONFIG_PPC_PMAC
       |-- 2654:#endif /* CONFIG_PPC_PMAC */
       |-- 2768:#ifdef CONFIG_PPC_PMAC
       |-- 2774:#endif /* CONFIG_PPC_PMAC */
       |-- 2791:#ifdef CONFIG_PPC_OF__disabled
       |-- 2801:#endif /* CONFIG_PPC_OF */
2803:#endif /* CONFIG_PM */

------------

After 42ddb453a0cd:
$ git show 42ddb453a0cd:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"

Based on output in terminal:

547:#ifdef CONFIG_PM
       |-- 959:#ifdef CONFIG_PPC_PMAC
       |-- 972:#endif
       |-- 1291:#ifdef CONFIG_PPC_OF
       |-- 1301:#endif /* CONFIG_PPC_OF */
       |-- 1430:#if defined(CONFIG_PM)
                   |-- 1431:#if defined(CONFIG_X86) || defined(CONFIG_PPC_PMAC)
                   |-- 1944:#endif
                   |-- 1946:#ifdef CONFIG_PPC_OF
                               |-- 1947:#ifdef CONFIG_PPC_PMAC
                               |-- 2208:#endif
                   |-- 2209:#endif
                   |-- 2211:#if 0 /* Not ready yet */
                   |-- 2513:#endif /* 0 */
       |-- 2515:#endif /* CONFIG_PPC_OF */
       |-- 2653:#ifdef CONFIG_PPC_PMAC
       |-- 2659:#endif /* CONFIG_PPC_PMAC */
       |-- 2773:#ifdef CONFIG_PPC_PMAC
       |-- 2779:#endif /* CONFIG_PPC_PMAC */
       |-- 2796:#ifdef CONFIG_PPC_OF__disabled
       |-- 2806:#endif /* CONFIG_PPC_OF */
2808:#endif /* CONFIG_PM */

------------

This also affected the CONFIG_PPC_OF container (line 1943 at commit 65122f7e80b5)

The patch-series fixes it along with PM upgrade.

All patches are compile-tested only.

Test tools:
    - Compiler: gcc (GCC) 10.1.0
    - allmodconfig build: make -j$(nproc) W=1 all

Vaibhav Gupta (2):
  video: fbdev: aty: radeon_pm: remove redundant CONFIG_PM container
  fbdev: radeonfb:use generic power management

 drivers/video/fbdev/aty/radeon_base.c | 10 ++++---
 drivers/video/fbdev/aty/radeon_pm.c   | 38 ++++++++++++++++++++-------
 drivers/video/fbdev/aty/radeonfb.h    |  3 +--
 3 files changed, 35 insertions(+), 16 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
