Return-Path: <SRS0=dZTT=OZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DD2C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Oct 2021 17:20:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BDC761506
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Oct 2021 17:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BDC761506
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A8CB40217;
	Tue,  5 Oct 2021 17:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1qUsPwn-UwQ; Tue,  5 Oct 2021 17:20:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4AB52402E3;
	Tue,  5 Oct 2021 17:20:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29807C000F;
	Tue,  5 Oct 2021 17:20:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85DEDC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74F3960C19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QCtNGVwQOyjO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:20:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7C8560C0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:20:24 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id s55so127161pfw.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Oct 2021 10:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+NqgXClATM2+U/6pmcAe6ttC1b34HIq6gozyTG/Fag=;
 b=GlH/iBtQPycG2+vBjfYb9YFZT0YC56AKQ1tVIynYkTBrvjpWGLWo08OltcrmtvYqIB
 0jMRr3FkNUcmMQxd2pt/9uCc0CqGkPvYMwM0XNwKaTsh9ExY6AmpD7hjpNw6QuKFq5cS
 zwT6QC2ioPW/E4YzbKYad5iLMiCdSaCTyvyZqrFOz46tnl2GRqON1GXP/f3PnTd4TO7c
 1fj1xkFehbw0B1+H3i4vdBlg6AuCcyBAjoVxIo2XgxE7U5Yz867IPV3RNkAMknj9Hmyd
 ltNU6p9WNhu0nxcT7+cZlG/vUiVw2am4cK9x7rGAryS1t+2vkwdoy73GxJXeLNjNsBfo
 E1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+NqgXClATM2+U/6pmcAe6ttC1b34HIq6gozyTG/Fag=;
 b=nMVZRQnih7gfI8tXma32tBwNtYTzhmt4m8Yq+9xz18mdwNXhcD7lHDO7MD5br23+uC
 guGhVyeubbkzQpoE0MWB+puYp6d+esp0DDrH8/fNB8hQmFYQ/cBbp13IeQMHwfea72wW
 Zf/GAcwUmPGz0+XYejlZNLpSF51np4i2AnbUcYscT8Z9hjiSM2qfTZ/bOympv+4icFm0
 ASsfSlbNJXHPXKwsH+zWG40mXnunOi83Boj9DbLqzNfvDIjCan91Zw7rSNa0iF5karG3
 Sb5IGRv9I3wyuJva3554N8fEvKFjkwyWpSN/UJclJQLEPN/ymVeKnXCV5992xWPcQn5T
 Gygw==
X-Gm-Message-State: AOAM531EzbSOlZnb5YXybfIgzyqkzMQefYsh/ZUuPuMF6JY28wzTC+T6
 ZvSFPrT1QzcrGwDkRziphP4=
X-Google-Smtp-Source: ABdhPJxWGXtU11U8vgjFgtp/AwHRz21P2apHXPFWNX+czZ73dNSiwz+WnMvQIpDfwIBfgeFjid5dvA==
X-Received: by 2002:a62:3802:0:b0:44c:776b:f555 with SMTP id
 f2-20020a623802000000b0044c776bf555mr6250036pfa.82.1633454424124; 
 Tue, 05 Oct 2021 10:20:24 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:f69:1127:b4ce:ef67:b718])
 by smtp.gmail.com with ESMTPSA id
 f25sm18476722pge.7.2021.10.05.10.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 10:20:23 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v4 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER
 registers
Date: Tue,  5 Oct 2021 22:48:12 +0530
Message-Id: <0a443323ab64ba8c0fc6caa03ca56ecd4d038ea3.1633453452.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633453452.git.naveennaidu479@gmail.com>
References: <cover.1633453452.git.naveennaidu479@gmail.com>
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
