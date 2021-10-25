Return-Path: <SRS0=xjH5=PN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46873C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Oct 2021 17:02:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F422E60F9D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Oct 2021 17:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F422E60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D452F80F1B;
	Mon, 25 Oct 2021 17:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJUXSaZBNiYf; Mon, 25 Oct 2021 17:02:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EF8B780F0F;
	Mon, 25 Oct 2021 17:02:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0756C0019;
	Mon, 25 Oct 2021 17:02:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82498C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63FF8403B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QElPek56qoU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:02:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 973F2403BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:02:32 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id y1so78354plg.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 10:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cqjk8A2jWPq0oF4j9f9pzp1s4umWD0fjXGGtRVK6pjI=;
 b=Km6qa7as2zKj4ahv0p9FX7MpcWGD6tjOML1ZhOUQeUR0KuKrOM/Y0B/OyJfcY7k+wV
 vxBWCUFtyHAC9xpI7R+JpBoHX7mIBWtExK6dpDNOvdxr8x585+K1/QoH1n9W51ljXFIe
 Ime4psXupDQ8xMItucMuFoc8wY9NLuiKaSBK9NCeCLy4GpEaqcgSw4MigLRUmPBvRKBV
 zeGByhYX/WSCf8Rw50ZVEGRzOm1ClghUP3ygjo8N7vdrD6cgqrTBfTZqpLCwQ5gg2s9A
 hpWhkVoMpqIKr+Z8t1u0lgEIc0EPdLIJCebjyg1jYoq/0ks0XSKGoaFxjA2/LD1Bz+gE
 HU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cqjk8A2jWPq0oF4j9f9pzp1s4umWD0fjXGGtRVK6pjI=;
 b=b4Z40XCr1DWqW1VBOYQ0bMW4s9QyR5eicGXXDIRBzIiqP5J32PU8YD0xCRjICVSyKP
 gvJTfey9EPY1L7BMM1hLLHu/AIC1KXlenHWCzoaMBpNdi41LLK9m/m6w63OJSoY7bG6j
 L72cSiFC/6W7RZlpGUCUfxsBwQQSvomoZC51GIEQKVUR8NN1lzEDWtur167L2JBHCBHf
 zUpScOIzgH0O++BQzKcg+5xwFqmxCiMyjryB7Ks59CtIQepyN/H0D3CC5MUfNPm7nFFb
 HdeUXzIk0duYXbQ8nIzVHyePtrvV0mIbq6K/e6Ulv+OXe/Agn7+jEbDjm3Od4KVvW/Lq
 X8YA==
X-Gm-Message-State: AOAM533AsrOukfzPpBFoDXleHCwtMD3QBCunN0wmY9+CqtKCzW1vSUZ0
 zxJkm60JUWDIZlunNDjzNv8=
X-Google-Smtp-Source: ABdhPJwvg9sfWgMNprK2Vf152fcQgXoPVYpKGuP89MlymuNgLLjfTAnceEvjffU47QWeOG5XuHfFZw==
X-Received: by 2002:a17:90b:1bcc:: with SMTP id
 oa12mr21825917pjb.212.1635181351786; 
 Mon, 25 Oct 2021 10:02:31 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:df8b:7255:8580:2394:764c])
 by smtp.gmail.com with ESMTPSA id
 g18sm5100858pfj.67.2021.10.25.10.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:02:31 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v5 5/5] PCI/AER: Include DEVCTL in aer_print_error()
Date: Mon, 25 Oct 2021 22:31:04 +0530
Message-Id: <656b4eab7fae68de86bb0a52568fb93822833828.1635179600.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635179600.git.naveennaidu479@gmail.com>
References: <cover.1635179600.git.naveennaidu479@gmail.com>
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

Print the contents of Device Control Register of the device which
detected the error. This might help in faster error diagnosis.

It is easy to test this by using aer-inject:

  $ aer-inject -s 00:03:0 corr-err-file

The content of the corr-err-file is as below:

  AER
  COR_STATUS BAD_TLP
  HEADER_LOG 0 1 2 3

Sample output from dummy error injected by aer-inject:

  pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03.0
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver)
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000, devctl=0x000f <-- devctl added to the error log
  pcieport 0000:00:03.0:    [ 6] BadTLP

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pci.h      |  2 ++
 drivers/pci/pcie/aer.c | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index eb88d8bfeaf7..48ed7f91113b 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -437,6 +437,8 @@ struct aer_err_info {
 	u32 status;		/* COR/UNCOR Error Status */
 	u32 mask;		/* COR/UNCOR Error Mask */
 	struct aer_header_log_regs tlp;	/* TLP Header */
+
+	u16 devctl;
 };
 
 /* Preliminary AER error information processed from Root port */
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index d3937f5384e4..fdeef9deb016 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -729,8 +729,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 		   aer_error_severity_string[info->severity],
 		   aer_error_layer[layer], aer_agent_string[agent]);
 
-	pci_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
-		   dev->vendor, dev->device, info->status, info->mask);
+	pci_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x, devctl=%#06x\n",
+		   dev->vendor, dev->device, info->status, info->mask, info->devctl);
 
 	__aer_print_error(dev, info);
 
@@ -1083,6 +1083,12 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 	if (!aer)
 		return 0;
 
+	/*
+	 * Cache the value of Device Control Register now, because later the
+	 * device might not be available
+	 */
+	pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &info->devctl);
+
 	if (info->severity == AER_CORRECTABLE) {
 		pci_read_config_dword(dev, aer + PCI_ERR_COR_STATUS,
 			&info->status);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
