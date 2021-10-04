Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76978C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:00:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1927561213
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1927561213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D47114016A;
	Mon,  4 Oct 2021 18:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9oC_YBimcp6; Mon,  4 Oct 2021 18:00:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A71F040018;
	Mon,  4 Oct 2021 18:00:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7EF13C0011;
	Mon,  4 Oct 2021 18:00:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E8C3C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 091FA4016A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZrGAuq2RUHes
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:00:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23D0D40018
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:00:40 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id kk10so2854648pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 11:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F/kZ/G80MyWYhdKVpqBk0C55lIN/V+L/Ury6/lN0H48=;
 b=Iw7vxd3nbj0C1OKCrJ5xQgex0PG/Kc/CV2C7tPUsGeWawiJ+Az940Wzu2Uy5AmVN11
 PYgVr1uisn3pGX1qacas8hTyKYIt8VOmZwZVG1gre/RBFwd13kU/cyjkN896O6+kWsOz
 aqNCYiEUv+Mql1+gA+oauHx8b4gKZ+g+6JhBQ6JHyELV/qC0+trpinxN3/Si0Y/WpNZt
 2otRHBRlasP0qjST8dSK+oXvQx3KF5hIWf8ATarS/AlOYRJtC3LVY4fzb8BFgrY3fyCZ
 NIsIQLmwRkYPqoZj9GvQx7bJRDS0HPeBuGYOOlPlfaxJXhpXhK3AX18GgU/JfHwFGscp
 c11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F/kZ/G80MyWYhdKVpqBk0C55lIN/V+L/Ury6/lN0H48=;
 b=fRRhN0kfYw5IT2ECgkRGpG7NFwlK1HdDMcg+y/tVlGx/yJ+dNB94DvHXh3EpWy03Di
 Htw0RjgEdlFNxnqln618dUCzSqIyVzXNEjpVG7pMs/OigiKlPL1nQp/cWJUwDIxsllRL
 +o/t7Pk09Q+sq3gvzjCQhA3zjEJM1ZFgLziGNR2M1cv7UWkKG1CJlEV4cVeP4W6C2zpx
 /IS6Xt8bwCvWq6urKePFnvPcezJPRPV5Q4Ufo6SjOsB9GVnIMdkB43wbvwlBuF+R05Id
 FfwyL6RuhvMICi4fjZ2G3N9PjEE0qRifD6NOyab4qDOCNIHlDw1Oz4B8LeOhC69w2f1G
 yZ5g==
X-Gm-Message-State: AOAM530WM1k1OIS0pXiah7VfuhFjfwHqx+EOkjuego0NAW2m8Bnpi1WP
 GHCThtL3hBCqnARoC4yZLaE=
X-Google-Smtp-Source: ABdhPJyjTQaAGxBR0yMHdOdR1pG5uX4ZqXJGgnNSDIvUGtfqSnjkdKem5NcrSNhG6aWIO723rBkbDw==
X-Received: by 2002:a17:90a:4306:: with SMTP id
 q6mr32152882pjg.17.1633370439363; 
 Mon, 04 Oct 2021 11:00:39 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 z2sm3641004pfe.210.2021.10.04.11.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:00:38 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com, tsbogend@alpha.franken.de, ruscur@russell.cc,
 oohall@gmail.com
Subject: [PATCH 0/6] MIPS: OCTEON: Remove redundant AER code 
Date: Mon,  4 Oct 2021 23:29:26 +0530
Message-Id: <cover.1633369560.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

e8635b484f64 ("MIPS: Add Cavium OCTEON PCI support.") added MIPS
specific code to enable PCIe and AER error reporting (*irrespective
of CONFIG_PCIEAER value*) because PCI core didn't do that at the time.

But currently, the PCI core clears and enables the AER status registers.
So it's redundant for octeon code to do so. This patch series removes
the redundant code from the pci-octeon.c

Currently, the correctable and uncorrectable AER mask registers are not
set to their default value when AER service driver is loaded. This
defect is also fixed in the "[PATCH 1/6]" in the series.

Please note that "Patch 4/6" is dependent on "Patch 1/6".

Thanks,
Naveen Naidu

Naveen Naidu (6):
 [PATCH 1/6] PCI/AER: Enable COR/UNCOR error reporting in set_device_error_reporting()
 [PATCH 2/6] MIPS: OCTEON: Remove redundant clearing of AER status registers
 [PATCH 3/6] MIPS: OCTEON: Remove redundant enable of PCIe normal error reporting
 [PATCH 4/6] MIPS: OCTEON: Remove redundant enable of COR/UNCOR error
 [PATCH 5/6] MIPS: OCTEON: Remove redundant ECRC Generation Enable
 [PATCH 6/6] MIPS: OCTEON: Remove redundant enable of RP error reporting

 arch/mips/pci/pci-octeon.c | 50 --------------------------------------
 drivers/pci/pcie/aer.c     | 13 +++++++++-
 2 files changed, 12 insertions(+), 51 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
