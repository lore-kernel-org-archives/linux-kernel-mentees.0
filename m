Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A048C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 13:53:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE8061213
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 13:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DE8061213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F23F084B3F;
	Mon,  4 Oct 2021 13:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDxKRIyTIvlm; Mon,  4 Oct 2021 13:53:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0AB9A84B47;
	Mon,  4 Oct 2021 13:53:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDAF8C0011;
	Mon,  4 Oct 2021 13:53:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F09EEC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3EB784B3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiFoA9si4K-w
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59D7E84B4A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:53 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id m21so16548932pgu.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 06:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+NqgXClATM2+U/6pmcAe6ttC1b34HIq6gozyTG/Fag=;
 b=psisIvsoqqZTvAJJ5lZS9bVAzGPIXOqlASUu6Ft+XKdLqGhfIJqNLDB3IJY/rOhOn6
 W0emjIskVKKkuFOpMab0ECiJBjhbjT1iPghl9LbSO/wBM01uDStrHFDjsKEEPVjqD+L5
 D+yz0Ti1YGOvhSbCbGQCfOP+lKVLxj4FltbpE3mfhLLvI9pv/kUcPmp2sWNWOB4/GWjR
 to+BiHxENksQs39APHR5XyX9R6fMWxEj3/ghrXb2tb4ljex7JgLIFQlAaTdEGWw0Hj+x
 zuaz++vPpRgvUJ6rOV3iD+3LFFGEb7JL9+6P9G4NMNOLUKH7dFEdhikpbnkPjMN02Gxp
 W7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+NqgXClATM2+U/6pmcAe6ttC1b34HIq6gozyTG/Fag=;
 b=U22Cm6k1D2/s0FgYVAHkn5TsQfFON+KArdSiQEusHq+YXRGDZUUjEk0b+PgIPCl2r9
 IAzbu+BUm9XNbTvxKb5UzXDDoRXb4xfYc4xhEilDr3oUtQzoNl2+Nill98I6osXwIae3
 BmrPOVOEPdMGIJ56k3tDWEggTtCzrB3UFXmxcJdL5mbFV3p2OHWdrZCDdcoDJLYuVFCD
 UuGYmb1SFJaID3x/TXKtHx0mbn+/zd5s3Yf9fhDLVY/QNc16bZBUylqcb00CZl5Im7+R
 t96wFfAIPyK1hPtkxa1YbuoWpJWCw5hVG+8Z9j5xjZKTCHkoru6qpvaGM8kmgBblglx6
 O16w==
X-Gm-Message-State: AOAM530DjsooIDdR5BbPrIs7/EyIu0xuWHJS2GGblqusxaWnuRCmPKHn
 NZ5x6tAIbjEqMhnloXHwbOI=
X-Google-Smtp-Source: ABdhPJwDSowptib1nJXhPUUJ3bBp3fd+JhzlaX7H/iuzO/TxYXwQ3yb5JSe0S6KbmH4lWdaEU10rQg==
X-Received: by 2002:a63:5c1b:: with SMTP id q27mr10744331pgb.284.1633355632829; 
 Mon, 04 Oct 2021 06:53:52 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 k17sm12209548pfu.82.2021.10.04.06.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:53:52 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER
 registers
Date: Mon,  4 Oct 2021 19:22:40 +0530
Message-Id: <14df904c301dc417485f5a7563053b81ab1d3c76.1633353468.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633353468.git.naveennaidu479@gmail.com>
References: <cover.1633353468.git.naveennaidu479@gmail.com>
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

In the EDR path, AER registers are cleared *after* DPC error event is
processed. The process stack in EDR is:

  edr_handle_event()
    dpc_process_error()
    pci_aer_raw_clear_status()
    pcie_do_recovery()

But in DPC path, AER status registers are cleared *while* processing
the error. The process stack in DPC is:

  dpc_handler()
    dpc_process_error()
      pci_aer_clear_status()
    pcie_do_recovery()

In EDR path, AER status registers are cleared irrespective of whether
the error was an RP PIO or unmasked uncorrectable error. But in DPC, the
AER status registers are cleared only when it's an unmasked uncorrectable
error.

This leads to two different behaviours for the same task (handling of
DPC errors) in FFS systems and when native OS has control.

Bring the same semantics for clearing the AER status register in EDR
path and DPC path.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/dpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index faf4a1e77fab..68899a3db126 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -288,7 +288,6 @@ void dpc_process_error(struct pci_dev *pdev)
 		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
 		 aer_get_device_error_info(pdev, &info)) {
 		aer_print_error(pdev, &info);
-		pci_aer_clear_status(pdev);
 	}
 }
 
@@ -297,6 +296,7 @@ static irqreturn_t dpc_handler(int irq, void *context)
 	struct pci_dev *pdev = context;
 
 	dpc_process_error(pdev);
+	pci_aer_clear_status(pdev);
 
 	/* We configure DPC so it only triggers on ERR_FATAL */
 	pcie_do_recovery(pdev, pci_channel_io_frozen, dpc_reset_link);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
