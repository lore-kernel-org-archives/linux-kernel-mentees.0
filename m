Return-Path: <SRS0=8PjG=QF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717B2C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:04:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B8061AE2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2B8061AE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5F914035D;
	Thu, 18 Nov 2021 14:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4vco7ZgJSjFq; Thu, 18 Nov 2021 14:04:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B58AE40295;
	Thu, 18 Nov 2021 14:04:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88DC6C001E;
	Thu, 18 Nov 2021 14:04:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C650C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00DF24025F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RTGXqzfoCyct
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:04:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A177D40245
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:04:19 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id n8so5333246plf.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 06:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2+h5Kd/hjqlgWPZhxmNy3OoG7OiHuipUsgtMWPBV6Ak=;
 b=U2AsFUKZLXJxwq1AOzr4+SXvMtjFGsxO8ExXuBT8byCkoGnUJsmIHIE9RaBdrO41Rl
 8huvDZAw5E9R6TLbkkzhiG0KK3ozoaeqyNAOCPgfaVXDO9RiMVzPYQO8kM0jpDHGImp7
 mGfT7LqSqvp0vGwEav+2G8mOB/HtIp0+n1d5lT7on4J/eCJ5BhjDOqpUJNodLcLk69LE
 dsQIh5VyqtbSeUIvPCt28VdXKYnJ3AC6q5Y7i7rFWNmPQzuQYztj2GETNDY5XVCxMBRi
 +q4uDB/9eeOsa42CQY/qDnZw4RfX5KuaXc2wcxRoWzNfS6iF4pK1CZwYlyHMbvLRGlQR
 cSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2+h5Kd/hjqlgWPZhxmNy3OoG7OiHuipUsgtMWPBV6Ak=;
 b=VjdkrJDWmNUWpnnH+Ps4v91RumfNTzz9p1cyazoPFllWFNIMPhTREYADjpKFWoPFVc
 UaL9uml39mXzJLjuicsN23nZqFFVEkju7MtSg8JFwSZ2Gj51eddETnwDVefk3PSMW0I0
 LjTAfIw9GydywJwwiaXT1xiwA5nZFJ5gY3ptuIQaYKUy41GSCYLvaNw9vQmNX2D5dbur
 v5gSXCxrnRFwfq/nGH08dbeZNbaV/9PPoLwMhTbBogvhZKjDVRI3O/qjvISUrD8eb8qk
 eYqfJEqRx65kbNC/aUsHd2FnyKwBy5RKMN0na3ytdQ+fYgnZRmIa2ZzX1SdVqSxrzsD8
 ZneA==
X-Gm-Message-State: AOAM531zBrqLlmoswmaTndxZUjEPS1/6eTLKreCuqdPCIp0alnD8GWip
 66VX5VR6m9VkVO/ac2EBekE=
X-Google-Smtp-Source: ABdhPJxcxZ6cnPohSI0/EFdUtlWDJVxg7caCTPrSiqQO3khzZ31HBiXw2/qZEqHgRBRrRj1t2soQnA==
X-Received: by 2002:a17:902:9303:b0:143:d6c7:babc with SMTP id
 bc3-20020a170902930300b00143d6c7babcmr21567418plb.58.1637244258545; 
 Thu, 18 Nov 2021 06:04:18 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:04:18 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 00/25] Unify PCI error response checking
Date: Thu, 18 Nov 2021 19:33:10 +0530
Message-Id: <cover.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-hyperv@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Russell Currey <ruscur@russell.cc>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Toan Le <toan@os.amperecomputing.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Joyce Ooi <joyce.ooi@intel.com>,
 Dexuan Cui <decui@microsoft.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, linux-rockchip@lists.infradead.org,
 "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Robert Richter <rric@kernel.org>, Sean V Kelley <sean.v.kelley@intel.com>,
 Ray Jui <rjui@broadcom.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 linux-arm-kernel@lists.infradead.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
 Scott Branden <sbranden@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, Jingoo Han <jingoohan1@gmail.com>,
 Shawn Guo <shawn.guo@linaro.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
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
definition PCI_SET_ERROR_RESPONSE and PCI_POSSIBLE_ERROR and uses it
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
    - Uses PCI_SET_ERROR_RESPONSE() when device is not found 

Patch 4 - 15:
    - Removes redundant error fabrication that happens in controller 
      drivers when the read from a PCI device fails.
    - These patches are dependent on Patch 2/24 of the series.
    - These can be applied in any order.

Patch 16 - 22:
    - Uses PCI_POSSIBLE_ERROR() to check the reads from hardware
    - Patches can be applied in any order.

Patch 23 - 25:
    - Edits the comments to include PCI_ERROR_RESPONSE alsong with
      0xFFFFFFFF, so that it becomes easier to grep for faulty 
      hardware reads.

Changelog
=========
v4:
   - Rename SET_PCI_ERROR_RESPONSE to PCI_SET_ERROR_RESPONSE
   - Rename RESPONSE_IS_PCI_ERROR to PCI_POSSIBLE_ERROR

v3:
   - Change RESPONSE_IS_PCI_ERROR macro definition
   - Fix the macros, Add () around macro parameters
   - Fix alignment issue in Patch 2/24
   - Add proper receipients for all the patches

v2:
    - Instead of using SET_PCI_ERROR_RESPONSE in all controller drivers
      to fabricate error response, only use them in PCI_OP_READ and
      PCI_USER_READ_CONFIG

Naveen Naidu (25):
 [PATCH v4 1/25] PCI: Add PCI_ERROR_RESPONSE and it's related definitions
 [PATCH v4 2/25] PCI: Set error response in config access defines when ops->read() fails
 [PATCH v4 3/25] PCI: Use PCI_SET_ERROR_RESPONSE() when device not found
 [PATCH v4 4/25] PCI: Remove redundant error fabrication when device read fails
 [PATCH v4 5/25] PCI: thunder: Remove redundant error fabrication when device read fails
 [PATCH v4 6/25] PCI: iproc: Remove redundant error fabrication when device read fails
 [PATCH v4 7/25] PCI: mediatek: Remove redundant error fabrication when device read fails
 [PATCH v4 8/25] PCI: exynos: Remove redundant error fabrication when device read fails
 [PATCH v4 9/25] PCI: histb: Remove redundant error fabrication when device read fails
 [PATCH v4 10/25] PCI: kirin: Remove redundant error fabrication when device read fails
 [PATCH v4 11/25] PCI: aardvark: Remove redundant error fabrication when device read fails
 [PATCH v4 12/25] PCI: mvebu: Remove redundant error fabrication when device read fails
 [PATCH v4 13/25] PCI: altera: Remove redundant error fabrication when device read fails
 [PATCH v4 14/25] PCI: rcar: Remove redundant error fabrication when device read fails
 [PATCH v4 15/25] PCI: rockchip: Remove redundant error fabrication when device read fails
 [PATCH v4 16/25] PCI/ERR: Use PCI_POSSIBLE_ERROR() to check read from hardware
 [PATCH v4 17/25] PCI: vmd: Use PCI_POSSIBLE_ERROR() to check read from hardware
 [PATCH v4 18/25] PCI: pciehp: Use PCI_POSSIBLE_ERROR() to check read from hardware
 [PATCH v4 19/25] PCI/DPC: Use PCI_POSSIBLE_ERROR() to check read from hardware
 [PATCH v4 20/25] PCI/PME: Use PCI_POSSIBLE_ERROR() to check read from hardware
 [PATCH v4 21/25] PCI: cpqphp: Use PCI_POSSIBLE_ERROR() to check read from hardware
 [PATCH v4 22/25] PCI: Use PCI_ERROR_RESPONSE to specify hardware error
 [PATCH v4 23/25] PCI: keystone: Use PCI_ERROR_RESPONSE to specify hardware error
 [PATCH v4 24/25] PCI: hv: Use PCI_ERROR_RESPONSE to specify hardware read error
 [PATCH v4 25/25] PCI: xgene: Use PCI_ERROR_RESPONSE to specify hardware error

 drivers/pci/access.c                        | 32 +++++++-------
 drivers/pci/controller/dwc/pci-exynos.c     |  4 +-
 drivers/pci/controller/dwc/pci-keystone.c   |  4 +-
 drivers/pci/controller/dwc/pcie-histb.c     |  4 +-
 drivers/pci/controller/dwc/pcie-kirin.c     |  4 +-
 drivers/pci/controller/pci-aardvark.c       |  4 +-
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
 24 files changed, 84 insertions(+), 116 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
