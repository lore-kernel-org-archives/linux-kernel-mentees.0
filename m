Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F33C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:36:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CA49611C8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CA49611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F4C3405A8;
	Fri, 15 Oct 2021 14:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVi1CjULo2Qf; Fri, 15 Oct 2021 14:36:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B4F1540586;
	Fri, 15 Oct 2021 14:36:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FCE0C000F;
	Fri, 15 Oct 2021 14:36:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 734B1C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6306D407C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myw7GAUXTg7i
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:36:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B194940477
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:36:08 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id c4so1746193pgv.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A1+buzEnWHFfl/ZaWbrWJXy+M9IGPXk9SXcGFxZnAfs=;
 b=RPL7BCrK2/jYy7dA9EeV9fzfOZdBvV8FM1iW0gA441nrIxQ1xg44AUgbJZXbJN0dLZ
 h8GZ848pgkw/SpggGk3Zko6r2dmRVDyVgm4Qzpu+JQZBNG9uUyRXcLcXSMbKPNZdxitc
 /r2CDWerhToBA5WnN6QULeO+FTZ6euC8cju6Uchf4G5vUgen13X2ecOGczouC8L9W32b
 3MlEbvo6LetX8BjoFIfC7+6AN6NRzKguY9vM57zS01VuXgIlLpDVdVL+ConAEe3b3USo
 OdQi9coc7ijOlKl5z4CG4gkXjcOES8tkv7Dlj3zY2sw4Iv3ZuUxfFKTnCjHiYeOB4D8z
 dzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A1+buzEnWHFfl/ZaWbrWJXy+M9IGPXk9SXcGFxZnAfs=;
 b=JykeF32bo6FjCo8qEactD9I0vXpMB+mEfGbERi8dN0QvIldKXkGklm85lgO1BqQCCA
 BlFqnxznROu2d+oAJJj6GETPrHgt8j+bbjSVREbbOwlTgDLatOPNfsuQs0W9QjKzVuma
 g8BtqZzZftStuLcqH5xIwF9Ga9QqeGqb8XKB0Ozs7tQUvHbtqVK6kFyFM2oZqKjcul+P
 6RgnQuF4/Lt2rGNmsKN6DZauqRGrLjvv5eNDIdXo6SucTE+Lc/Xj04XNyF42e299xC/U
 f4UA3GrbxtQUf2CEQpO/IEC2b3yuAiwbBMhbf6GDHAiCsf/55fUidUjP13VyDuyq2G08
 7gpg==
X-Gm-Message-State: AOAM5326n+0oQuUfM37mX8uBitbAnjRIllRaqSpjZy7nC/L5wxEXcI02
 TcyHjR1PIWg/SQXFllaStJ4=
X-Google-Smtp-Source: ABdhPJyWuQ1K1JxflSMa0Mke7WMw5bxh8bvQ3ExR+gido75xKDvVtio4NGskzHymTTSJ5ZhB267d6g==
X-Received: by 2002:a62:ed01:0:b0:44d:6aa6:30eb with SMTP id
 u1-20020a62ed01000000b0044d6aa630ebmr12041882pfh.53.1634308567962; 
 Fri, 15 Oct 2021 07:36:07 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id
 x7sm11536941pjg.5.2021.10.15.07.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:36:07 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v2 00/24] Unify PCI error response checking
Date: Fri, 15 Oct 2021 20:05:51 +0530
Message-Id: <cover.1634306198.git.naveennaidu479@gmail.com> 
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, linux-hyperv@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error.  There's no real data to return to satisfy the 
CPU read, so most hardware fabricates ~0 data.

This patch series adds PCI_ERROR_RESPONSE definition and other helper
definition SET_PCI_ERROR_RESPONSE and RESPONSE_IS_PCI_ERROR and uses it
where appropriate to make these checks consistent and easier to find.

This helps unify PCI error response checking and make error check
consistent and easier to find.

This series also ensures that the error response fabrication now happens
in the PCI_OP_READ and PCI_USER_READ_CONFIG. This removes the
responsibility from controller drivers to do the error response setting. 

Patch 1:
    - Adds the PCI_ERROR_RESPONSE and other related defintions
    - All other patches are dependent on this patch. This patch needs to
      be applied first, before the others

Patch 2:
    - Error fabrication happens in PCI_OP_READ and PCI_USER_READ_CONFIG
      whenever the data read via the controller driver fails.
    - This patch needs to be applied before, Patch 4/24 to Patch 15/24 are
      applied.

Patch 3:
    - Uses SET_PCI_ERROR_RESPONSE() when device is not found and
      RESPONSE_IS_PCI_ERROR() to check hardware read from the hardware.

Patch 4 - 15:
    - Removes redundant error fabrication that happens in controller 
      drivers when the read from a PCI device fails.
    - These patches are dependent on Patch 2/24 of the series.
    - These can be applied in any order.

Patch 16 - 22:
    - Uses RESPONSE_IS_PCI_ERROR() to check the reads from hardware
    - Patches can be applied in any order.

Patch 23 - 24:
    - Edits the comments to include PCI_ERROR_RESPONSE alsong with
      0xFFFFFFFF, so that it becomes easier to grep for faulty 
      hardware reads.

Changelog
=========

v2:
    - Instead of using SET_PCI_ERROR_RESPONSE in all controller drivers
      to fabricate error response, only use them in PCI_OP_READ and
      PCI_USER_READ_CONFIG

Naveen Naidu (24):
 [PATCH 1/24] PCI: Add PCI_ERROR_RESPONSE and it's related definitions
 [PATCH 2/24] PCI: Set error response in config access defines when ops->read() fails
 [PATCH 3/24] PCI: Unify PCI error response checking
 [PATCH 4/24] PCI: Remove redundant error fabrication when device read fails
 [PATCH 5/24] PCI: thunder: Remove redundant error fabrication when device read fails
 [PATCH 6/24] PCI: iproc: Remove redundant error fabrication when device read fails
 [PATCH 7/24] PCI: mediatek: Remove redundant error fabrication when device read fails
 [PATCH 8/24] PCI: exynos: Remove redundant error fabrication when device read fails
 [PATCH 9/24] PCI: histb: Remove redundant error fabrication when device read fails
 [PATCH 10/24] PCI: kirin: Remove redundant error fabrication when device read fails
 [PATCH 11/24] PCI: aardvark: Remove redundant error fabrication when device read fails
 [PATCH 12/24] PCI: mvebu: Remove redundant error fabrication when device read fails
 [PATCH 13/24] PCI: altera: Remove redundant error fabrication when device read fails
 [PATCH 14/24] PCI: rcar: Remove redundant error fabrication when device read fails
 [PATCH 15/24] PCI: rockchip: Remove redundant error fabrication when device read fails
 [PATCH 16/24] PCI/ERR: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 17/24] PCI: vmd: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 18/24] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 19/24] PCI/DPC: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 20/24] PCI/PME: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 21/24] PCI: cpqphp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
 [PATCH 22/24] PCI: keystone: Use PCI_ERROR_RESPONSE to specify hardware error
 [PATCH 23/24] PCI: hv: Use PCI_ERROR_RESPONSE to specify hardware read error
 [PATCH 24/24] PCI: xgene: Use PCI_ERROR_RESPONSE to specify hardware error

 drivers/pci/access.c                        | 36 ++++++++--------
 drivers/pci/controller/dwc/pci-exynos.c     |  4 +-
 drivers/pci/controller/dwc/pci-keystone.c   |  4 +-
 drivers/pci/controller/dwc/pcie-histb.c     |  4 +-
 drivers/pci/controller/dwc/pcie-kirin.c     |  4 +-
 drivers/pci/controller/pci-aardvark.c       | 10 +----
 drivers/pci/controller/pci-hyperv.c         |  2 +-
 drivers/pci/controller/pci-mvebu.c          |  8 +---
 drivers/pci/controller/pci-thunder-ecam.c   | 46 +++++++--------------
 drivers/pci/controller/pci-thunder-pem.c    |  4 +-
 drivers/pci/controller/pci-xgene.c          |  8 ++--
 drivers/pci/controller/pcie-altera.c        |  4 +-
 drivers/pci/controller/pcie-iproc.c         |  4 +-
 drivers/pci/controller/pcie-mediatek.c      | 11 +----
 drivers/pci/controller/pcie-rcar-host.c     |  4 +-
 drivers/pci/controller/pcie-rockchip-host.c |  4 +-
 drivers/pci/controller/vmd.c                |  2 +-
 drivers/pci/hotplug/cpqphp_ctrl.c           |  4 +-
 drivers/pci/hotplug/pciehp_hpc.c            | 10 ++---
 drivers/pci/pci.c                           | 10 ++---
 drivers/pci/pcie/dpc.c                      |  4 +-
 drivers/pci/pcie/pme.c                      |  4 +-
 drivers/pci/probe.c                         | 10 ++---
 include/linux/pci.h                         |  9 ++++
 24 files changed, 87 insertions(+), 123 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
