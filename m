Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BDBC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 17:36:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B289A60E78
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 17:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B289A60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80B8540298;
	Mon, 11 Oct 2021 17:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yznVLmhZBFr6; Mon, 11 Oct 2021 17:36:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4BA6540299;
	Mon, 11 Oct 2021 17:36:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A3B1C000F;
	Mon, 11 Oct 2021 17:36:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DBEAC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BBE840299
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7f8hWzZWqCwh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:36:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E24D40298
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 17:36:22 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id n11so11393023plf.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 10:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJzzZJUwpzeKQJlZIVOTzoqmYp8CWlcv3F3YYYU8MOg=;
 b=UQY5fuaeniwoPT/xwHQ3Ao7FeWJFVAhorTY5szyrGdLOGVxLcMbAyI4cuBXif1/HZV
 /PdEKOkP4XWO0c1FKucvGnQLn0BCRsberthTXZxRsm1u3v89wk2oZ3zOnqs9s4ya43NQ
 XWiezH28+9l/P3xR5zTpFmo1T95D98vsV/3nNl6990Qagg8v+WrADDXJx/HGiSOFn4hX
 5XoI5q9TiV72vLFs2lDVIeFnusAPqBeanD8oUQ+lBrDxUns/MCcRe2AdoX2SLgHAI4o/
 QqyEPf7f9Stid6ShIEinzes0Ri61q601MnMDe/BaR+6QaqRYYe4anDzLKd7yAt8ZQLMR
 cfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJzzZJUwpzeKQJlZIVOTzoqmYp8CWlcv3F3YYYU8MOg=;
 b=3esXiSlsrLO4CsUIt7VYK7GHOvPkrLarYSeXJ1bxYsGppxGL/j4VQ7jjxDYlFHZbG6
 3l8U+g6kovPTVa1q8fFplakRcsOjMABBwfkTYshDqR6s/lzuk655Z8qZtEkv7PdwXkfv
 OzruKfntPa0VSkG/PklzOEszQ8q/rs39DIyTegzTuL3KscH0yEPSZcBz5cnpOCpqC80H
 p5NaQPSbWAqErzb48u+fdVulLh6gga1Eap+Mi0KKdslBMc8LF4LupcZ6hFQR+sR/slfb
 ouM2ymTMh9gidRDoyvVy9loCap+nL2t05S8BXy6k3+KhPdkGgJPT5UMjv04PR65ImpoN
 cJ2g==
X-Gm-Message-State: AOAM533nJv4CIPf9bLBq8eDyrLZTSVRXQdjEoqj4+8Qeg0oP+T9fGqbi
 zFgUCJVqlAz28xGPE+yUT/E=
X-Google-Smtp-Source: ABdhPJxbCg5k83AJkkf7TpRQJrReqilB+qCC+1rDSbSN1M5Qa0bgpA3LMBJFY9nGSbN5K03Q8ex3zQ==
X-Received: by 2002:a17:90b:1804:: with SMTP id
 lw4mr354756pjb.174.1633973781406; 
 Mon, 11 Oct 2021 10:36:21 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 z8sm8859954pgc.53.2021.10.11.10.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:36:20 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 00/22] PCI: Unify PCI error response checking
Date: Mon, 11 Oct 2021 23:05:47 +0530
Message-Id: <cover.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org,
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
defintion SET_PCI_ERROR_RESPONSE and RESPONSE_IS_PCI_ERROR and uses it
where appropriate to make these checks consistent and easier to find.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Patch 1:
  - Adds the PCI_ERROR_RESPONSE and other related defintions
  - All other patches are dependent on this patch. This patch needs to
    be applied first, before the others

Patch 2 - 13
  - Uses SET_PCI_ERROR_RESPONSE() when device is not found

Patch 14 - 19
  - Uses RESPONSE_IS_PCI_ERROR() to check the reads from hardware

Patch 20 - 22
  - Edits the comments to include PCI_ERROR_RESPONSE alsong with
    0xFFFFFFFF, so that it becomes easier to grep for faulty hardware
    reads.

Thanks,
Naveen

Naveen Naidu (22):
  [PATCH 1/22] PCI: Add PCI_ERROR_RESPONSE and it's related defintions
  [PATCH 2/22] PCI: Unify PCI error response checking
  [PATCH 3/22] PCI: thunder: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 4/22] PCI: iproc: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 5/22] PCI: mediatek: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 6/22] PCI: exynos: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 7/22] PCI: histb: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 8/22] PCI: kirin: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 9/22] PCI: aardvark: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 10/22] PCI: mvebu: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 11/22] PCI: altera: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 12/22] PCI: rcar: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 13/22] PCI: rockchip: Use SET_PCI_ERROR_RESPONSE() when device not found
  [PATCH 14/22] PCI/ERR: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 15/22] PCI: vmd: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 16/22] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 17/22] PCI/DPC: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 18/22] PCI/PME: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 19/22] PCI: cpqphp: Use RESPONSE_IS_PCI_ERROR() to check read from hardware
  [PATCH 20/22] PCI: keystone: Use PCI_ERROR_RESPONSE to specify hardware error
  [PATCH 21/22] PCI: hv: Use PCI_ERROR_RESPONSE to specify hardware read error
  [PATCH 22/22] PCI: xgene: Use PCI_ERROR_RESPONSE to specify hardware error

 drivers/pci/access.c                        | 22 ++++++++++-----------
 drivers/pci/controller/dwc/pci-exynos.c     |  2 +-
 drivers/pci/controller/dwc/pci-keystone.c   |  4 ++--
 drivers/pci/controller/dwc/pcie-histb.c     |  2 +-
 drivers/pci/controller/dwc/pcie-kirin.c     |  2 +-
 drivers/pci/controller/pci-aardvark.c       |  8 ++++----
 drivers/pci/controller/pci-hyperv.c         |  2 +-
 drivers/pci/controller/pci-mvebu.c          |  4 ++--
 drivers/pci/controller/pci-thunder-ecam.c   | 20 +++++++++----------
 drivers/pci/controller/pci-thunder-pem.c    |  2 +-
 drivers/pci/controller/pci-xgene.c          |  8 ++++----
 drivers/pci/controller/pcie-altera.c        |  2 +-
 drivers/pci/controller/pcie-iproc.c         |  2 +-
 drivers/pci/controller/pcie-mediatek.c      |  4 ++--
 drivers/pci/controller/pcie-rcar-host.c     |  2 +-
 drivers/pci/controller/pcie-rockchip-host.c |  2 +-
 drivers/pci/controller/vmd.c                |  2 +-
 drivers/pci/hotplug/cpqphp_ctrl.c           |  4 ++--
 drivers/pci/hotplug/pciehp_hpc.c            | 10 +++++-----
 drivers/pci/pci.c                           | 10 +++++-----
 drivers/pci/pcie/dpc.c                      |  4 ++--
 drivers/pci/pcie/pme.c                      |  4 ++--
 drivers/pci/probe.c                         | 10 +++++-----
 include/linux/pci.h                         |  9 +++++++++
 24 files changed, 75 insertions(+), 66 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
