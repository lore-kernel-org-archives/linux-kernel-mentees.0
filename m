Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF0BC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:02:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2FFA61130
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 18:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2FFA61130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85BE9405C1;
	Mon,  4 Oct 2021 18:02:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id amL-rYmdYyXG; Mon,  4 Oct 2021 18:02:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B28FD4057A;
	Mon,  4 Oct 2021 18:02:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9048AC0011;
	Mon,  4 Oct 2021 18:02:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A62DC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5695160838
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uiWs0v8dW__S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6B60605BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 18:02:49 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so545396pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 11:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PKklRx9y5Qor/aGWnNnuo+lS2V9yeaUbLzR0QD7Qli0=;
 b=EjT1r3PfOqOTV9SjziQCZVpG3EQgBHx0RG8Xv1lR0WpTgXkde6DDI2XQGrKGdHGuOu
 sF8twN+l6PEyjaQgO2BIbkDAnZOxsyGpLSQx0bkTBfWz4phFythCJUO4BZRv3/Z/8zKr
 1//l0509wxgBJzdQE3exb9ktxgeL1GX8XjLoF24duAVx1O1TZSBk2RSLHje65Qnxn8tD
 choOqeAKFsYBiq3gwXktjQK6A0LUWmGLIwhm3ekrXBemHgpW2KSXMwBP7rUFeKDPmjfS
 WWxTDvX8wjrXjFPuwm3Fey5YCsR27a1Yb26TkgNatJpgQGXQF46aJ9xIPDup4JAZPfGu
 OtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PKklRx9y5Qor/aGWnNnuo+lS2V9yeaUbLzR0QD7Qli0=;
 b=hlksbme+LEX0lZ3/dj3gMMVoidxTYc2Yc0MmZQwjBPNzBLlkDR7jbTF284sipKiMnb
 QeY0IaMmAk0HwECs9TuYP4ewE7w+C5IEDjmHQAvExF2GtbKC2lVj7DeK9EOqI055Zes6
 DQWp6Po1+QVZ4W4CIdeOtr7glm4CRT/5Btl7g9Ss8uRlJn3VQPaATpEpxwuCk9P/+Gyk
 go2rOM76PZ+C+CIgZKhOVu5KlT/VT1J2DlbVCGDzGtsIFI4tNDZJWaN5GveBZ8v4WdFY
 IHqQt5jyVYfiacQW9LQB+ugHngVCR2PFA4L5HdS/L/PrNTzd08S8wI9E+XQP7M3e+KY+
 grsQ==
X-Gm-Message-State: AOAM5314GAQsT6rbgWaLpSGvXmH9a6p3IaA/Acahmoa57gEk7i4/dK1a
 CAE5ojExxIjwQJGckRGNLMY=
X-Google-Smtp-Source: ABdhPJyBIls+LLr17tvrEzq80SP4CQurse34IktWPG8aqV9f13TkQAW/TRNDg2X5+MjZ3loaaHOhLw==
X-Received: by 2002:a17:90a:8912:: with SMTP id
 u18mr31155201pjn.69.1633370568999; 
 Mon, 04 Oct 2021 11:02:48 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 z2sm3641004pfe.210.2021.10.04.11.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 11:02:48 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	tsbogend@alpha.franken.de
Subject: [PATCH 6/6] MIPS: OCTEON: Remove redundant enable of RP error
 reporting
Date: Mon,  4 Oct 2021 23:29:32 +0530
Message-Id: <66ad4e435d11d191ca71b491a15e1487e07fc204.1633369560.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633369560.git.naveennaidu479@gmail.com>
References: <cover.1633369560.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

Currently when CONFIG_PCIEAER=y, root port's error reporting is
enabled by aer_enable_rootport() in the aer_probe() path.

It is now no longer necessary for Octeon code to enable RP's error
reporting since it's done when PCIe bus loads the AER service driver.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 arch/mips/pci/pci-octeon.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/mips/pci/pci-octeon.c b/arch/mips/pci/pci-octeon.c
index b973fc464c21..239eec8ac942 100644
--- a/arch/mips/pci/pci-octeon.c
+++ b/arch/mips/pci/pci-octeon.c
@@ -114,24 +114,6 @@ int pcibios_plat_dev_init(struct pci_dev *dev)
 		pci_write_config_word(dev, PCI_BRIDGE_CONTROL, config);
 	}
 
-	/* Find the Advanced Error Reporting capability */
-	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
-	if (pos) {
-		/*
-		 * Leave severity at HW default. This only controls if
-		 * errors are reported as uncorrectable or
-		 * correctable, not if the error is reported.
-		 */
-		/* PCI_ERR_UNCOR_SEVER - Uncorrectable Error Severity */
-
-		/* PCI_ERR_HEADER_LOG - Header Log Register (16 bytes) */
-		/* Report all errors to the root complex */
-		pci_write_config_dword(dev, pos + PCI_ERR_ROOT_COMMAND,
-				       PCI_ERR_ROOT_CMD_COR_EN |
-				       PCI_ERR_ROOT_CMD_NONFATAL_EN |
-				       PCI_ERR_ROOT_CMD_FATAL_EN);
-	}
-
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
