Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17C6C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:59:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 821F12080C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZsnFz6L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 821F12080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E18785D45;
	Mon, 10 Aug 2020 18:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fsBUp70dv5Tt; Mon, 10 Aug 2020 18:59:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CA8FA85D41;
	Mon, 10 Aug 2020 18:59:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDBD5C013C;
	Mon, 10 Aug 2020 18:59:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10167C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F342A85D45
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rBi2f27vrX8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:59:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7C25E85D41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:59:18 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id o5so5456440pgb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 11:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x87wiamKK8IpHrYWyQZkX28BwuSCR2wXWSfYCvqc6Rg=;
 b=ZZsnFz6L+wbM1Zgg5QA7lgADPT6oEH8/ADKOklgw32TAKsJT37pzlRTS8P3PEYEU21
 0a5tolSF9/i6pWJzA1Ezl7Lmuroho8D9xIgHerRNXT5z2bFEzWjqeFDUNBNJ5j0CozVE
 WVZCtUqwr5eChlEX3rtzkrtXYQRS+F/KAJJOwggs2PcBOip781/p8XMRT8WEr+s1rII0
 nAmGLbJwKfTsy/ySJlzup63SsbjrJ727FRySv3UAg5IWXReYUSy76ylEygkQ1VnZMFE+
 cIxdPQafbXsER2xhNcurt51yWutvFr8nD+sGheu+NIer6bZs1UbfeEq8GTYPsucTFlNl
 cjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x87wiamKK8IpHrYWyQZkX28BwuSCR2wXWSfYCvqc6Rg=;
 b=QwV3/++gQTFXI3rMroPtxF6+xqyY8ZkU/yGoCCHjw5n7xoJeqvV5QhgJmGQu6moPCN
 5GptFor1G1bUwWBsY/wRdHDDbovnHjbuUu9SoSzGK6wCtBzn+8OyODPgO4Gzpz6x95lt
 FdB3xOAaH87PquTAEuotpiiBVXXhoPeX67b/Liz7oP0rKLXd92WMRlpQOPdH/cx5XP5+
 6fAfKPYHfjMfkVYDmJeLhdNCCAGtgufA96vqdhU0SuTQnBhmWJn91rJHCOmYY8vuaBev
 mbBcIbzpgy/+qrL9QHS8bBk7KzUGmzRmHMqfb36ReNPLWM2fqeriRkzx+Rsk3kjooYAD
 7asw==
X-Gm-Message-State: AOAM532zLmclq+KYPb8jV+1Tn4fjoN9q9SWzg/vbNfI2Hv1uxvj/xz3H
 OZA2HWVtnQ3plzWb5q8w71k=
X-Google-Smtp-Source: ABdhPJyPqIiE4/6f56BZE0TAQHYbCJrcQ8/BTUQoQnH8DzVTNJrbgDzgOiV0zuWvmdXily+zD39Uqw==
X-Received: by 2002:a62:cfc1:: with SMTP id b184mr2255523pfg.262.1597085957970; 
 Mon, 10 Aug 2020 11:59:17 -0700 (PDT)
Received: from varodek.localdomain ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id f27sm22683547pfk.217.2020.08.10.11.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 11:59:17 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Tue, 11 Aug 2020 00:27:11 +0530
Message-Id: <20200810185723.15540-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200810165458.GA292825@ravnborg.org>
References: <20200810165458.GA292825@ravnborg.org>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v2 00/12] video: fbdev: use generic
	power management
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

The purpose of this patch series is to upgrade power management in video fbdev
drivers. This has been done by upgrading .suspend() and .resume() callbacks.

The upgrade makes sure that the involvement of PCI Core does not change the
order of operations executed in a driver. Thus, does not change its behavior.

In general, drivers with legacy PM, .suspend() and .resume() make use of PCI
helper functions like pci_enable/disable_device_mem(), pci_set_power_state(),
pci_save/restore_state(), pci_enable/disable_device(), etc. to complete
their job.

The conversion requires the removal of those function calls, change the
callbacks' definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

Test tools:
    - Compiler: gcc (GCC) 10.1.0
    - allmodconfig build: make -j$(nproc) W=1 all

Vaibhav Gupta (12):
  fbdev: gxfb: use generic power management
  fbdev: lxfb: use generic power management
  fbdev: via-core: use generic power management
  fbdev: aty: use generic power management
  fbdev: aty128fb: use generic power management
  fbdev: nvidia: use generic power management
  fbdev: savagefb: use generic power management
  fbdev: cyber2000fb: use generic power management
  fbdev: i740fb: use generic power management
  fbdev: vt8623fb: use generic power management
  fbdev: s3fb: use generic power management
  fbdev: arkfb: use generic power management

 drivers/video/fbdev/arkfb.c                  | 41 ++++++-------
 drivers/video/fbdev/aty/aty128fb.c           | 51 ++++++++++------
 drivers/video/fbdev/aty/atyfb_base.c         | 50 ++++++++++-----
 drivers/video/fbdev/cyber2000fb.c            | 13 ++--
 drivers/video/fbdev/geode/gxfb.h             |  5 --
 drivers/video/fbdev/geode/gxfb_core.c        | 36 ++++++-----
 drivers/video/fbdev/geode/lxfb.h             |  5 --
 drivers/video/fbdev/geode/lxfb_core.c        | 37 +++++------
 drivers/video/fbdev/geode/lxfb_ops.c         |  4 --
 drivers/video/fbdev/geode/suspend_gx.c       |  4 --
 drivers/video/fbdev/i740fb.c                 | 40 +++++-------
 drivers/video/fbdev/nvidia/nvidia.c          | 64 +++++++++++---------
 drivers/video/fbdev/s3fb.c                   | 39 +++++-------
 drivers/video/fbdev/savage/savagefb_driver.c | 52 ++++++++++------
 drivers/video/fbdev/via/via-core.c           | 39 +++++-------
 drivers/video/fbdev/vt8623fb.c               | 41 ++++++-------
 include/linux/via-core.h                     |  2 -
 17 files changed, 267 insertions(+), 256 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
