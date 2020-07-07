Return-Path: <SRS0=keMi=AS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DC2C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 23:03:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C320620771
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jul 2020 23:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ou7IvQjQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C320620771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A964D226C2;
	Tue,  7 Jul 2020 23:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ij2GIFDgaK5T; Tue,  7 Jul 2020 23:03:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9A10122610;
	Tue,  7 Jul 2020 23:03:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 840ECC0893;
	Tue,  7 Jul 2020 23:03:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3276C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D0C69873AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lMvNBavG9mmD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 07B0D87394
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jul 2020 23:03:46 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id w16so48445499ejj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jul 2020 16:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eDBfMfO3gH5XivlUuml3iPrkilSX9rGahEiW/VBWUow=;
 b=ou7IvQjQr1Q/ko6wXjR104fN8y9sz8sdtEUgt6XuwBDCe/bqL7yG4MquFqpwpesoNz
 4mQHGHG8rhlYgMovXI+2u1t0kTuTb16vMzkYt8LMQfW8dsJ10uVdWhGj2npLhQjxTFQ5
 bNEPjnVtwAwiDjhRcHBMX+CO15CDxvWI39OwhnkpSme+k+8If4V3geXKh7TC41tiqRIl
 LazOhFBwS0CWwj+s5WvoSbL8jtujUEJ+RcbWYSvwyTf6lWjOomxJWLNceHmM95FPgwtM
 XsFlIm8VWI6zmE4UL1ki6huTv6nhWYtsjREj2tovGbxGtnv8/GoAxXfc3MvlWf8VJDi/
 YPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eDBfMfO3gH5XivlUuml3iPrkilSX9rGahEiW/VBWUow=;
 b=ggYlFXOHfuaih7OxEjXD9rcvlkDFFh3s4EDC16Q+aV2HB6BxHBfkxnuOY43w0DuzfB
 BlLpROhry6QXpxWrPUBDTU2PgFSlRHxN344+tSd7WrP/7HOCUxIz3RDlFYkcYoDjyFgv
 sN7xeLx2L1P2kFDXdbdALlmaJ4iySXWLLN9dPIc1weeyYxkg3UMF/jNh3gc4OfoSD8or
 i5fNpQPPj+5Dtizo6UM1V4W7Np3XGTNUba3vXgraRPzJaNP6wcii6TDsemKGZ8krAlEf
 ucz+BwUdZ5nHmSS6bsYSUDiSz9JcK8gZbA5c7jwD5C96elm+UnlMf4nZwxZaD4ieALgm
 rqHA==
X-Gm-Message-State: AOAM533cyZCKTffM/zYQ+w0GhLxoQjAKO3iBEgPRzz9vLkV7KLn6OP8N
 +rTs+ccCeaRtM4XFKzury3k=
X-Google-Smtp-Source: ABdhPJwtxtIuKYVG7KClu+FbOLLOSlitE09bPAeMD6EZGf+XK2CKnqIBEZR0FluZwQZL99Gj8OP1Ag==
X-Received: by 2002:a17:906:f94c:: with SMTP id
 ld12mr48127036ejb.426.1594163024217; 
 Tue, 07 Jul 2020 16:03:44 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id f10sm27096310edx.5.2020.07.07.16.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 16:03:43 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  8 Jul 2020 00:03:13 +0200
Message-Id: <20200707220324.8425-3-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200707220324.8425-1-refactormyself@gmail.com>
References: <20200707220324.8425-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 2/13] misc: rtsx: Check the return
	value of pcie_capability_read_*()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

On failure pcie_capability_read_dword() sets it's last parameter, val
to 0. In which case (val & PCI_EXP_DEVCTL2_LTR_EN) evaluates to 0.
However, with Patch 13/13, it is possible that val is set to ~0 on
failure. This would introduce a bug because (x & x) == (~0 & x).

This bug can be avoided without changing the function's behaviour if the
return value of pcie_capability_read_word is checked to confirm success.

Check the return value of pcie_capability_read_word() to ensure success.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

---
 drivers/misc/cardreader/rts5227.c | 5 +++--
 drivers/misc/cardreader/rts5249.c | 5 +++--
 drivers/misc/cardreader/rts5260.c | 5 +++--
 drivers/misc/cardreader/rts5261.c | 5 +++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/cardreader/rts5227.c b/drivers/misc/cardreader/rts5227.c
index 3a9467aaa435..7a20a4898d07 100644
--- a/drivers/misc/cardreader/rts5227.c
+++ b/drivers/misc/cardreader/rts5227.c
@@ -92,6 +92,7 @@ static void rts5227_force_power_down(struct rtsx_pcr *pcr, u8 pm_state)
 static int rts5227_extra_init_hw(struct rtsx_pcr *pcr)
 {
 	u16 cap;
+	int ret;
 
 	rtsx_pci_init_cmd(pcr);
 
@@ -105,8 +106,8 @@ static int rts5227_extra_init_hw(struct rtsx_pcr *pcr)
 	/* LED shine disabled, set initial shine cycle period */
 	rtsx_pci_add_cmd(pcr, WRITE_REG_CMD, OLT_LED_CTL, 0x0F, 0x02);
 	/* Configure LTR */
-	pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &cap);
-	if (cap & PCI_EXP_DEVCTL2_LTR_EN)
+	ret = pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &cap);
+	if (!ret && (cap & PCI_EXP_DEVCTL2_LTR_EN))
 		rtsx_pci_add_cmd(pcr, WRITE_REG_CMD, LTR_CTL, 0xFF, 0xA3);
 	/* Configure OBFF */
 	rtsx_pci_add_cmd(pcr, WRITE_REG_CMD, OBFF_CFG, 0x03, 0x03);
diff --git a/drivers/misc/cardreader/rts5249.c b/drivers/misc/cardreader/rts5249.c
index 6c6c9e95a29f..2b05e8663431 100644
--- a/drivers/misc/cardreader/rts5249.c
+++ b/drivers/misc/cardreader/rts5249.c
@@ -95,6 +95,7 @@ static void rts5249_init_from_cfg(struct rtsx_pcr *pcr)
 {
 	struct rtsx_cr_option *option = &(pcr->option);
 	u32 lval;
+	int ret;
 
 	if (CHK_PCI_PID(pcr, PID_524A))
 		rtsx_pci_read_config_dword(pcr,
@@ -118,8 +119,8 @@ static void rts5249_init_from_cfg(struct rtsx_pcr *pcr)
 	if (option->ltr_en) {
 		u16 val;
 
-		pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
-		if (val & PCI_EXP_DEVCTL2_LTR_EN) {
+		ret = pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
+		if (!ret && (val & PCI_EXP_DEVCTL2_LTR_EN)) {
 			option->ltr_enabled = true;
 			option->ltr_active = true;
 			rtsx_set_ltr_latency(pcr, option->ltr_active_latency);
diff --git a/drivers/misc/cardreader/rts5260.c b/drivers/misc/cardreader/rts5260.c
index 7a9dbb778e84..934aeaeebfaf 100644
--- a/drivers/misc/cardreader/rts5260.c
+++ b/drivers/misc/cardreader/rts5260.c
@@ -498,6 +498,7 @@ static void rts5260_init_from_cfg(struct rtsx_pcr *pcr)
 {
 	struct rtsx_cr_option *option = &pcr->option;
 	u32 lval;
+	int ret;
 
 	rtsx_pci_read_config_dword(pcr, PCR_ASPM_SETTING_5260, &lval);
 
@@ -518,8 +519,8 @@ static void rts5260_init_from_cfg(struct rtsx_pcr *pcr)
 	if (option->ltr_en) {
 		u16 val;
 
-		pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
-		if (val & PCI_EXP_DEVCTL2_LTR_EN) {
+		ret = pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
+		if (!ret && (val & PCI_EXP_DEVCTL2_LTR_EN)) {
 			option->ltr_enabled = true;
 			option->ltr_active = true;
 			rtsx_set_ltr_latency(pcr, option->ltr_active_latency);
diff --git a/drivers/misc/cardreader/rts5261.c b/drivers/misc/cardreader/rts5261.c
index 195822ec858e..2b6f61696e19 100644
--- a/drivers/misc/cardreader/rts5261.c
+++ b/drivers/misc/cardreader/rts5261.c
@@ -438,9 +438,10 @@ static void rts5261_init_from_cfg(struct rtsx_pcr *pcr)
 	rtsx_pci_write_register(pcr, ASPM_FORCE_CTL, 0xFF, 0);
 	if (option->ltr_en) {
 		u16 val;
+		int ret;
 
-		pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
-		if (val & PCI_EXP_DEVCTL2_LTR_EN) {
+		ret = pcie_capability_read_word(pcr->pci, PCI_EXP_DEVCTL2, &val);
+		if (!ret && (val & PCI_EXP_DEVCTL2_LTR_EN)) {
 			option->ltr_enabled = true;
 			option->ltr_active = true;
 			rtsx_set_ltr_latency(pcr, option->ltr_active_latency);
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
