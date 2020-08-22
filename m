Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9F2C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E00612086A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvJZ+51t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E00612086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7C38C8839C;
	Sat, 22 Aug 2020 21:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xsq1GBIETSLP; Sat, 22 Aug 2020 21:03:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DD8C988378;
	Sat, 22 Aug 2020 21:03:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B86FBC07FF;
	Sat, 22 Aug 2020 21:03:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5451C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7E9A288378
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xcdhOm9FNqt4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CB8498816B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:36 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r15so5008937wrp.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JXcMuQkQe+Xsu5q5U7yQ4vFfMDv2FpXZyBEp3vptN0E=;
 b=AvJZ+51tZN6BBuU2r8ZzcOMYYVrfaRWSoPoLv6apV3SwITY2ymro33/MvOX2MqRzy8
 pVEbjjAK0X+Afw8dUJYNTJQPyasSisK9cEbr2DF3fZOINOBqi8dmbsCYXVX+WE3mcsmy
 cbLMQn2bDu0qqy1D5tjOMra1z6OsUiIDbpO6r1TGqYSnqJax1wFz8p5VPf8/lJU9LvMG
 jnzEbCJMljrUTP43tWCozGvIoZDYIOo39Q2BxLF3GPRlXlUjAAib3PSzljXOHliDJG7h
 fz8dCosnWld8obqx1EZof3jzHyiN/4ZFK3APG18u8dbd6nksEGmQWZj3P5wZ1eRa82dg
 qUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JXcMuQkQe+Xsu5q5U7yQ4vFfMDv2FpXZyBEp3vptN0E=;
 b=OyTXOaTyr1Iuy+Rt7cBayCs+vlj6UJ1SmnDx6Pwf6+gX9U+0iCkKzXxPmO+Zg3vol6
 aXXQSrVMfkeWw+6+SGQBmgw6zq5JxLBxXrxrSrelcXhowxCfs3GW3qt8lgsWfJW99ft/
 pHzBm81vkqBmII0zhtw+TJL8MUQ4xsqkU0YOMaQ3B39ltIeJfi6obYSEth5FyvaqL0r7
 3atSh6ig39wx+oF+0I+1SZuBfVNm8lgcQddGbfET34hO0Ct8jXJvWSKAB4tZ2CdYEade
 d7r9I5BYqVCSbyMYeuCuZ1h/Y5zegKjVr7xKCT8mGhShsuGy656JMPXy11FKwl6huvU5
 stog==
X-Gm-Message-State: AOAM531Kh5P55Ma4oIpm3dcxquAW4+aItEPQwmcTq14/RiE+AaQGslbn
 7zz6n3WrdqzhDlllLEn5Czw=
X-Google-Smtp-Source: ABdhPJyKbVs3UxMq0FgXZyzdNbqR9KEAsiSMRXEhjKniYVRKiMZSY+QNHGFI1A4DBn5VZMM373hmjA==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr2634225wrv.47.1598130215144; 
 Sat, 22 Aug 2020 14:03:35 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:34 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:35 +0200
Message-Id: <20200822200358.252967-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 00/23] Remove struct
	pcie_link_state and aspm_register_info
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This series removes struct pcie_link_state and struct aspm_register_info
and reoganise the code in a require.

MERGE:
Please don't merge yet

ToDo
 - Remove redundant functions like get_link_state()
 - Are locks still needed?
 - A few cleanups
 - Look for any other redundant code

Saheed O. Bolarinwa (23):
  PCI: Migrate ASPM info from struct pcie_link_state to struct pci_dev
  PCI: Add l1ss_cap and l1ss_cap_ptr to struct pci_dev
  PCI: Rework calc_l*_latency() to take a pci_dev *
  PCI: Compute aspm_register_info.support directly
  PCI: Read value of aspm_register_info.l1ss_ctl1 directly
  PCI: Replace aspm_register_info.l1ss_cap* with their pci_dev version
  PCI: Compute aspm_register_info.enable directly
  PCI: Remove unused aspm_calc_l1ss_info() arguments
  PCI: Remove pcie_get_aspm_reg() and struct aspm_register_info
  PCI: Relocate call to aspm_calc_l1ss_info
  PCI: Rework and Rename aspm_calc_l1ss_info()
  PCI: Add ASPM and CLOCK PM states to struct pci_dev
  PCI: Initialise and Update values of pci_dev's PCIe link info
  PCI: Change Return and Argument values from pcie_link_state to pci_dev
  PCI: Replace pcie_link_state based device list with a pci_dev one
  PCI: Remove Exit latencies from struct pcie_link_state
  PCI: Remove .clkpm_* from struct pcie_link_state
  PCI: Remove .aspm_* from struct pcie_link_state
  PCI: Remove .parent from struct pcie_link_state
  PCI: Remove .root from struct pcie_link_state
  PCI: Remove .downstream from struct pcie_link_state
  PCI: Remove .pdev from struct pcie_link_state
  PCI: Remove struct pcie_link_state

 drivers/pci/pcie/aspm.c | 570 ++++++++++++++++------------------------
 drivers/pci/probe.c     |   7 +
 include/linux/pci.h     |  37 ++-
 3 files changed, 267 insertions(+), 347 deletions(-)


base-commit: 5f49ff2540e2c2799cde0cfaf6af9e1f824cd393
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
