Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F970C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 13:53:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A863A61213
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 13:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A863A61213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6441661B7C;
	Mon,  4 Oct 2021 13:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TkC75qrohwei; Mon,  4 Oct 2021 13:53:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 48D7261B6B;
	Mon,  4 Oct 2021 13:53:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E011C0011;
	Mon,  4 Oct 2021 13:53:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34A89C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B33A61B6B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7DmSuz4aZdm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E68260BD5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:17 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id ls18so1486658pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 06:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QehrCbnowDf1RKEEztwsvEnHuiWWf1+by9ueLaqBt5I=;
 b=HD1FAaEtufc7ayGdPFagvKFo4lY+o6I6/nQOa+nVkJHZWF4gn1Zd86f56QDiJmRERT
 cJ7/qKo40ISZ9l6pLFbm7BG+GvlqxekUCZucWtRLoGIZL0sAmMTGgGxEbo+89QGomMqk
 F06R/fZFslZqdzjDhsuFd6DM9UJxmwRmegojJHXlFwjzshrhgKufUcrnmWtk8oQOyKyV
 48P036+d1eYmnHMqEMXCm084uNEGSg9txbxUXWiU69JjBsacmUsrPGih+ky85b/2QB3r
 lLSD1qhYF77rBR/NWuUVA4marCG9VaWVfBOoI9Rnw4dd1xAyB9uJHKQU04cUUSzm0j6p
 Zhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QehrCbnowDf1RKEEztwsvEnHuiWWf1+by9ueLaqBt5I=;
 b=58y4oXp7uX+zmoGJxEvpKjlzKzECf0b/rz9dshMUbOLcmAxEQgrLoMaQJg5gCna6Mx
 pDXEq+beJTChW0kX+/QGcOGkEEGbHf1KKdfBtK10oRNG3jSlLrq8quGRUtofRxHfNx73
 gGnzNxb3eHgFUv6f6QZTTHLGm6S2vWqnKhQgc+BmdclMsKReu/YPfhbl4FO+ffNfntP/
 YGX6DkkJm1Mz16L4NC32OFQvQLwFcAHFghbzBrlwmg+S+l66+U/jmg1FaNuvRiJpuyjd
 qAuAYGv6H425FVit22nmwMCrxPqgCUWt/qE14MZ3RMmO3YAqRM5s3jDY1+8soYEa2Ys4
 bjdQ==
X-Gm-Message-State: AOAM532NQ0ll4lnrdGMPlfO0brE9k5lvwhtDGAU+geKxIZLvFbrPcaic
 2NiBpks761CD7ddjJpqpQeM=
X-Google-Smtp-Source: ABdhPJyN7WK8TDIV07lY6Vw3BSCzWsRh8SxCdZyrqPzER9GZiXV7WlUHrJTVeRbnHqxrI3lD1Qshqw==
X-Received: by 2002:a17:90a:1984:: with SMTP id
 4mr31119195pji.241.1633355597382; 
 Mon, 04 Oct 2021 06:53:17 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 k17sm12209548pfu.82.2021.10.04.06.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:53:16 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH 0/8] Fix long standing AER Error Handling Issues 
Date: Mon,  4 Oct 2021 19:22:35 +0530
Message-Id: <cover.1633353468.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

Naveen Naidu (8):
 [PATCH 1/8] PCI/AER: Remove ID from aer_agent_string[]
 [PATCH 2/8] PCI: Cleanup struct aer_err_info
 [PATCH 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
 [PATCH 4/8] PCI/DPC: Use pci_aer_clear_status() in dpc_process_error()
 [PATCH 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER registers
 [PATCH 6/8] PCI/AER: Clear error device AER registers in aer_irq()
 [PATCH 7/8] PCI/ERR: Remove redundant clearing of AER register in pcie_do_recovery()
 [PATCH 8/8] PCI/AER: Include DEVCTL in aer_print_error()

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
