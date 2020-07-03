Return-Path: <SRS0=CGmO=AO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC96C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 039DE206A1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HY9dYLnm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 039DE206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CCDD687DB6;
	Fri,  3 Jul 2020 08:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2AAEQXTfpVdp; Fri,  3 Jul 2020 08:16:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B20F487DB0;
	Fri,  3 Jul 2020 08:16:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5932C0888;
	Fri,  3 Jul 2020 08:16:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06478C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 08:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DFDCC88D91
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 08:16:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mB8pOam9yFBe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 08:16:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C8E0688D8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Jul 2020 08:16:13 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id gc15so4784278pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 03 Jul 2020 01:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dX1y3EZXLwuCJAuG+s638H9srGw+Bv0i5V3KBJVUxbU=;
 b=HY9dYLnm3ErI+evPVxOOELTSXIrSfRXLyBecauxWz+4akfnnMTqeBHYlJ451fUPJJN
 nWCJDx0OyqnWliWCFUyRi2agBVfLxFPIJyaD57p1oPUynCuMYU/01uIWxkyPhwPhnYL3
 Oy0kE9SGnQEl4LcpTR4JIpYR/QncK76BYew3gOH2XMWDwOssy1obyTQqdoFiuQuD0q9Z
 qDK91+lQS5p8fTYJBsShymdiKb4+L/Fpyzi7Sipw+4WMVGLSOVyxCKgNMblxZ4BiR7YO
 2ty+ZbQ19OCGlOIB7idbdZS6JjgLj/ydJZ8dCvRP6JVnaphdtqIn+13rO8+zvJHuEuC/
 9W1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dX1y3EZXLwuCJAuG+s638H9srGw+Bv0i5V3KBJVUxbU=;
 b=QRCn9nUT4yLJY95bm3YuetEGt1c3Lg+GPEDYv67QxcQ9H+LZPhONWi4dkaK0q0Kj1n
 qCe+0sngZFgQAzfkVt4wR73y8xTAWXasdEbEOah7jIWCjFDTRjmZh9Vjkk+xTeKD2M5a
 DT/FKUxUdwxbQ1VX8cz18GDlfYweEBFC51D8xwgKD1KAqT3KOxALhh0bAmdyQkCq50lJ
 /6BWusMJBAEPUwU5I8sU/QgpZd+5pY+lSRMgVp0gbPETekcwQmMRCyU/Wpi8OpXxN/72
 39e65246K5jnVr2F7DJ4YtL5jPT1Stu9cc6bVxDODU7xdlLROJbHNQmISMRfjNQEKc3c
 +zyQ==
X-Gm-Message-State: AOAM530YKkP4bzYTJRA7lkDoO4RWxNbLECHVIS6f9UEIdQPSM4xNA5Eg
 g+JhZGVEMPGjISzM3ELptpk=
X-Google-Smtp-Source: ABdhPJyu7elHooqc3ZPVMwTGcHHv784cEG5qJZel5gkB1yqKLwT51/PoIU1mh380wOPhTtCkGk/CIQ==
X-Received: by 2002:a17:90a:728d:: with SMTP id
 e13mr22595947pjg.51.1593764173155; 
 Fri, 03 Jul 2020 01:16:13 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id y198sm8437085pfg.116.2020.07.03.01.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:16:12 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Date: Fri,  3 Jul 2020 13:44:24 +0530
Message-Id: <20200703081428.1011527-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-ide@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 0/4] drivers: ide: use generic
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

The purpose of this patch series is to remove legacy power management callbacks
from ide drivers.

The suspend() and resume() callbacks operations are still invoking
pci_save/restore_state(), pci_set_power_state(), pci_enable/disable_state(),
etc. and handling the power management themselves, which is not recommended.

The conversion requires the removal of the those function calls and change the
callback definition accordingly and make use of dev_pm_ops structure.

All patches are compile-tested only.

V2: Kbuild had modpost error for undefined reference in v1.

Testing by:
  Compiler: gcc (GCC) 10.1.0
  Build: make -j$(nproc) W=1 all

Vaibhav Gupta (4):
  ide: use generic power management
  ide: triflex: use generic power management
  ide: sc1200: use generic power management
  ide: delkin_cb: use generic power management

 drivers/ide/aec62xx.c         |  3 +--
 drivers/ide/alim15x3.c        |  3 +--
 drivers/ide/amd74xx.c         |  3 +--
 drivers/ide/atiixp.c          |  3 +--
 drivers/ide/cmd64x.c          |  3 +--
 drivers/ide/cs5520.c          |  3 +--
 drivers/ide/cs5530.c          |  3 +--
 drivers/ide/cs5535.c          |  3 +--
 drivers/ide/cs5536.c          |  3 +--
 drivers/ide/cy82c693.c        |  3 +--
 drivers/ide/delkin_cb.c       | 30 +++++-------------------
 drivers/ide/hpt366.c          |  3 +--
 drivers/ide/ide-pci-generic.c |  3 +--
 drivers/ide/it8172.c          |  3 +--
 drivers/ide/it8213.c          |  3 +--
 drivers/ide/it821x.c          |  3 +--
 drivers/ide/jmicron.c         |  3 +--
 drivers/ide/ns87415.c         |  3 +--
 drivers/ide/opti621.c         |  3 +--
 drivers/ide/pdc202xx_new.c    |  3 +--
 drivers/ide/pdc202xx_old.c    |  3 +--
 drivers/ide/piix.c            |  3 +--
 drivers/ide/sc1200.c          | 43 ++++++++++++-----------------------
 drivers/ide/serverworks.c     |  3 +--
 drivers/ide/setup-pci.c       | 29 +++++------------------
 drivers/ide/siimage.c         |  3 +--
 drivers/ide/sis5513.c         |  3 +--
 drivers/ide/sl82c105.c        |  3 +--
 drivers/ide/slc90e66.c        |  3 +--
 drivers/ide/triflex.c         | 24 +++++++++----------
 drivers/ide/via82cxxx.c       |  3 +--
 include/linux/ide.h           |  8 +------
 32 files changed, 65 insertions(+), 150 deletions(-)

-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
