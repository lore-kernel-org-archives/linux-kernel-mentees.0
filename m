Return-Path: <SRS0=sW3u=BQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0497DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Aug 2020 11:06:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6651204FD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Aug 2020 11:06:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlHv4vQ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6651204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CB2B188757;
	Thu,  6 Aug 2020 07:28:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HyXrvGAsTAMu; Thu,  6 Aug 2020 07:28:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 605738874B;
	Thu,  6 Aug 2020 07:28:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AC1BC0050;
	Thu,  6 Aug 2020 07:28:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B983BC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 07:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A876988751
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 07:28:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPQgpNR54e4E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 07:28:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2B12C8874B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 07:28:42 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id o1so27071324plk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Aug 2020 00:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XxdgRFlQigk4lLEnKCMOhpL5rmLS0bgdeVzH2zzhbYk=;
 b=FlHv4vQ3VE/olmEyXl/0XGGhlOpr/3Wij7v72m3kCKiJ8HQN64oV/l2YU6MpViKD/c
 VzriSXtzL1h10FtNlHeGdJFQdfemeX+u/yNotMOdpLtO+npHb1nsBD6M579Bd0RM7Akz
 TbvVB8Ex6/YW7ZRmE/1vGxX7gl19yorBetIWPr5QIEY6AZB/kCh6NJFzppkjQnakoH6Q
 RPTFCddX7l/tegFjdysNNCgDMYpgyQAyPKU5OFSIfzTzcDS6l3AHJoOrIerAQaIiUZHx
 1QcqOue1z1k9sId/jFdRzdAEvJvU2sm8hJOYSNZ3y07QmZuV69+W9IRprFpWLBJmypFW
 vKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XxdgRFlQigk4lLEnKCMOhpL5rmLS0bgdeVzH2zzhbYk=;
 b=o8ILXoFasZY5k6fQYmDO7feJXtSfOpHTd1hFo2gucIdv7p+1a7f1CEMGhfMSiAL1sn
 gWEfJg53korBT5n0eF59ziTbm9VGvddUqxpx/KxxPmrgvDjYVp6pYdjW/hSzAt5ao1zq
 OFl0xIq6FDyUmyvmPDJvl2qh4I5PN+i529MQhmiQDpgUsG5MPsv4s+H/lk6PdY+ZK/N3
 lSeuENvKELqIzuTAU6Z9bnEZmECJj7TPQyAmBwNyo9zvygAYZKz8edx6DOiijBzdNvAt
 N9ocGd9czIIWwejixIOeTbttRw5+n904Yqi4+RGkqMIJs8br9P0NhO3Jc3OI0iTPtwSO
 dYQA==
X-Gm-Message-State: AOAM531Iurhn6TLyzNE+KuAYBSRAtvWOUNT6IzBID+Ud6oUO3lfW/SYH
 WlUuRhxe13i+vKQgpoiBf5k=
X-Google-Smtp-Source: ABdhPJy7rdcwXEx1kuFL2y1hDY5pQJYgbk0CrGVGdH58fTlyJBq3RxNFJpj108XYiC7FRL9fXS9JyQ==
X-Received: by 2002:a17:90b:368c:: with SMTP id
 mj12mr6307408pjb.152.1596698921683; 
 Thu, 06 Aug 2020 00:28:41 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id e125sm6654646pfh.69.2020.08.06.00.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 00:28:41 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Date: Thu,  6 Aug 2020 12:56:56 +0530
Message-Id: <20200806072658.592444-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
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
