Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8495C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:59:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93D55208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 18:59:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ddg2juEO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93D55208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4EA3287E93;
	Wed, 19 Aug 2020 18:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-iCDJ+IkWvj; Wed, 19 Aug 2020 18:59:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C5B6087E91;
	Wed, 19 Aug 2020 18:59:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0D0CC07FF;
	Wed, 19 Aug 2020 18:59:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7AC1AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 69587860EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id isU18O9vd44U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:58:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F05AB860DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 18:58:58 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id c10so1516029pjn.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 11:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=teSA+VF9m0g0fiG8uR8fbDhA8YjsqGp+oSZrp5d7n9U=;
 b=Ddg2juEOoCmHUuQArhnsFSay6iY0S9DecklI+21FdyRNq5jSHiDoGK2hZWZBN6dXxf
 uSJdgdBW2SbPPdcGEqOMILtPKUxDod5d+CniKZp2b9MMNxkLNIZ9CK9XHrf9XlMwFH9O
 BeXKAXjBjqp0U9QnBE5dElE/lfDh3muuiVY6RpzO/DhO6iUxwXPd5OAYGwEccOmKeUok
 AvH+PzbcQtdlJZ5v7PYUomw2GhVLghruNZsxqBFTdfvF4HpNxBpH79FXQtn/7ZQ+Sj7r
 hymuwHpjetoojCk3aJJ83r3Okn2hZlhsU7kOFsAeMPrODkHd/n01iMWK8C4/fxGbXpjO
 +Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=teSA+VF9m0g0fiG8uR8fbDhA8YjsqGp+oSZrp5d7n9U=;
 b=dvCbeqnIvZ1gVjR5ifO0kK0SpOsKHLtZcbn8NIV2OVBKL8ManvIDOVCwUr9o13QLxw
 Ak5h/ukOcG816woGnXbyvQna1+Z+w+iFt/u0z/WfycSIznGRUzCz4yCOsWV7rMpwYijy
 K301kkcyRR7dWuETjBI0tv2ZTfnsJ8aDUEWL9TZBsosf+ejBxhvXf5AsjV+hrO748A+q
 yogFC6RhRuP/bn1I0dmt3Ujk9bF7xVQ7R49Q53xq7N6VMfL7HXsLLEvTqOOMcSDMRtuc
 zL6qZkE/DkcKDG7lVxdTOKKOGvymkR7E8fyem5HiQUegcLPPgj/5u0xtKB0qTbXfhIcP
 Fdnw==
X-Gm-Message-State: AOAM533Ek9NfFWnTssu7AT3tqHo64SqnvQaBm52e/cNjIA3zTT2cVMGI
 /Z+JTltpgsnUbhQWj5cNG9A=
X-Google-Smtp-Source: ABdhPJwNFdqnCDQRO/tySZxGOWZIe3t9mcFk7yheydz6bXCndpt/TagKm0lrSk7e+WHEmyBWkUYYHQ==
X-Received: by 2002:a17:90b:4c0c:: with SMTP id
 na12mr4980552pjb.24.1597863538514; 
 Wed, 19 Aug 2020 11:58:58 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id o134sm29149305pfg.200.2020.08.19.11.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 11:58:58 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>, Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>
Date: Thu, 20 Aug 2020 00:26:42 +0530
Message-Id: <20200819185654.151170-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v3 00/12] video: fbdev: use generic
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
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
