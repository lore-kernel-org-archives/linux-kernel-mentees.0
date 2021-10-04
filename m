Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243EDC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 14:08:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D005E611C1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 14:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D005E611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A157661B8C;
	Mon,  4 Oct 2021 14:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42n75zokIg5T; Mon,  4 Oct 2021 14:08:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BC0D361B8B;
	Mon,  4 Oct 2021 14:08:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0187C000F;
	Mon,  4 Oct 2021 14:08:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B164C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 792B3405EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xIaL5FtsmwCO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:08:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8802640134
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:08:12 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id s75so5771759pgs.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 07:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=90VZotrStGy8mgssJr/W9iFiKQDvcfNAnl0DsJhkfs0=;
 b=o/QK+MjgwS+aEQuPx4irPsbCaHMW6sfXp8BaqM12h1M93plmbNOTRFIEVh1NBvMkEB
 ZUI/rsaRIpecJgpTBkNdVhjXxkwcmFdasoMV5ExX4poVBKt+rT6b3AXqoH8YrS1V9Cma
 yTLd30q8/soHf0V8eO5srZz85E1ywxMMQjSiHSXBQmm4FwKQnXqmnLibeVWcAbhZsPoG
 g7rBm1DWVZe9gEnb4fnGCjTY7cLC1uB+fjbWcPtPfaxV99JFomRFEybhCoXr3oNyDkpZ
 +zue++onjHrY646/5Vrk8fAzNswt0qpQPvj0GEqZcPrHvgmnxDwplbLQUFeXbAVc1+Wk
 8g0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=90VZotrStGy8mgssJr/W9iFiKQDvcfNAnl0DsJhkfs0=;
 b=kofZNT45ZD/VzsnkSP2H9yCmclFV/ljwL6sg0QwPhShaDVVs1mVEc9G+NgjV6VIHg+
 LXMyd0Cw5cWkEYbdP3pLfJ8omx83kgU2mm8co/OaQdK2pSfPfmuuCAUM+or+P/KCR00A
 0WhLhz7LbvST6B9hxmHiJ0sybZsWXbLNy5HmfTVmhUGd1hcGucUSZll7BVhbisGdcXVL
 zLShFNRXVPDS97VfYP1bo8casP5BRSBwlNHB9AsVvAxo6Cu+gy2Ge/GSPE2A1Spkp0gr
 IuSXfMDeUkZVPLnPVz/dZcKIw+2dCCNte5nrPDaHNnfb/QbRpJ8sudaD+V+XpDrm1HFF
 qp7Q==
X-Gm-Message-State: AOAM533NBBIYnxxiJL/bwFL3HY73QosUNSSxxYy3bUevdnHxaLPmNFlC
 7kzACXq4CDGGP9h6UWrIIU0=
X-Google-Smtp-Source: ABdhPJxdmeh3wBzsACdJJKEbMJ6nFPRgGudEiYPsvM9XJ9KsMd2LE/efWBCTvow/NjbvzslzV8Q/lg==
X-Received: by 2002:a63:63c5:: with SMTP id x188mr5138080pgb.391.1633356491815; 
 Mon, 04 Oct 2021 07:08:11 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 p2sm15274135pgd.84.2021.10.04.07.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:08:11 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v2 0/8] Fix long standing AER Error Handling Issues 
Date: Mon,  4 Oct 2021 19:36:26 +0530
Message-ID: <cover.1633353468.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
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
Message-ID: <20211004140626.ZkhdriP2tkVyoQ2nxiOmcwW-SsD_rLRlwI5ccpam-yA@z>

This patch series aims at fixing some of the AER error handling issues
we have.

Currently we have the following issues:
 - Confusing message in aer_print_error()
 - aer_err_info not being initialized completely in DPC path before 
   we print the AER logs
 - A bug [1] in clearing of AER registers in the native AER path

[1] https://lore.kernel.org/linux-pci/20151229155822.GA17321@localhost/

The primary aim of this patch series is to converge the APEI path and the
native AER error handling paths. In our current code, we find that we
have two different behaviours (especially when it comes to clearing of
the AER registers) for the same functionality.

This patch series, tries to bring the same semantics and hence more 
commonanlity between the APEI part of code and the native OS 
handling of AER errors.

PATCH 1: 
  - Fixes the first issue

PATCH 2 - 4:
  - Fixes the second issue
  - "Patch 3/8" is dependent on "Patch 2/3" in the series

PATCH 5 - 7
  - Deals with converging the various paths and to bring more
    commonality between them
  - "Patch 6/8" depends on "Patch 1/8"

PATCH 8:
  -  Adds extra information in AER error logs.

Thanks,
Naveen Naidu

Changelog
=========

v2:
  Apologies for the mistake, I forgot to cc the linux-pci mailing list.
  Resent the email with cc to linux-pci.

Naveen Naidu (8):
 [PATCH v2 1/8] PCI/AER: Remove ID from aer_agent_string[]
 [PATCH v2 2/8] PCI: Cleanup struct aer_err_info
 [PATCH v2 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
 [PATCH v2 4/8] PCI/DPC: Use pci_aer_clear_status() in dpc_process_error()
 [PATCH v2 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER registers
 [PATCH v2 6/8] PCI/AER: Clear error device AER registers in aer_irq()
 [PATCH v2 7/8] PCI/ERR: Remove redundant clearing of AER register in pcie_do_recovery()
 [PATCH v2 8/8] PCI/AER: Include DEVCTL in aer_print_error()

 drivers/pci/pci.h      |  23 +++-
 drivers/pci/pcie/aer.c | 265 ++++++++++++++++++++++++++++-------------
 drivers/pci/pcie/dpc.c |   9 +-
 drivers/pci/pcie/err.c |   9 +-
 4 files changed, 207 insertions(+), 99 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
