Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DDAC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 19:14:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C474720738
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 19:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGhcRP3X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C474720738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 97B33887B3;
	Fri, 21 Aug 2020 19:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0yKT3BjifPF6; Fri, 21 Aug 2020 19:14:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E765788799;
	Fri, 21 Aug 2020 19:14:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB02AC0889;
	Fri, 21 Aug 2020 19:14:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 705A8C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 19:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 494D82047D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 19:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MF1Ldh--HIBB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 19:14:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 2BB51203AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 19:14:13 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id nv17so1231703pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 12:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZW8KhlX+gLf0/rf2sp3YxSoFxOMpb5isg+POvbKd/iI=;
 b=bGhcRP3XJIZ9J9UzpEqLsf4MoqsrKC0dOZBjbh8W5P1yKFlusMr8jzkTzxPCvPBCP9
 rIDLml24uWDNGKMetqaDXtCHGKlWziZiXTRksmo3MjwAHlYWuDihfLlOUX+aM2nsdBtP
 dHDL6mHaucm+3ubFFk6HPtbsYRAN+s2ykiuYT28tc8XofnK32daKQxmdKVqgBfs4QxtN
 kj+vqnplfCTjOAHE2kMvhH4um8/YS8xHGNfaF9jaE9c1y+EZ6L+NDdrZg8AlDSYixZ9j
 t+EFzlJ3NIp8A0ob8jzdsisidNIwavvv3W5UFTYGMLWdPvJb9QtOOLRppkPOhTtdsvh4
 WTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZW8KhlX+gLf0/rf2sp3YxSoFxOMpb5isg+POvbKd/iI=;
 b=SzhkXG9JOdDQN0+LO3+6INwGfPux2dJ9lFk+bWXRvqX+L0t99aJrw2ADFmhgkKhfWq
 kRal4Cwsckn5HHtjOHtr+cX66lndwZzcLrES29BwK9BODXOFsTfmnh9UYZdy605NPFRj
 DQ+0+OsCllk4GTscRKzbLU5I+IQqw356m3rHIXdXF9i9SnAqv60sgUZoB3jWHh972oo7
 EcekrDZ22BYhzALtwg8YqeB0rklJkXTKUdWx7uPP4ytq695+/+S7TR+WzvF4NG8XicHs
 dqqbdUvZbGQ1ABTVujBOGAiVewcUd+arFISgEMCOl9CZ7DQLUpC4rCfTHJ1Dw3vbeDHh
 iG+A==
X-Gm-Message-State: AOAM530dO0uutOoPv/dZ1HEBAbDpqFk39B0g+WwrXYeAz5TIuPQbQ5Zo
 MqroXfBEdJlCF2pDooPRvLA=
X-Google-Smtp-Source: ABdhPJyBUgh3FGkk+9vVN/BVmq53gQpTkRBknq8vo5yY0EVa+dG/Qk6Qh9hv/r7JMdwo8y720emb7g==
X-Received: by 2002:a17:902:c408:: with SMTP id
 k8mr3501015plk.102.1598037252356; 
 Fri, 21 Aug 2020 12:14:12 -0700 (PDT)
Received: from localhost.localdomain ([124.253.196.72])
 by smtp.googlemail.com with ESMTPSA id q71sm2688663pjq.7.2020.08.21.12.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 12:14:11 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: bjorn@helgaas.com
Date: Sat, 22 Aug 2020 00:43:56 +0530
Message-Id: <20200821191356.7669-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Puranjay Mohan <puranjay12@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] PCI: Add support for LTR
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

Add a new function pci_ltr_init() which will be called from
pci_init_capabilities() to initialize every PCIe device's LTR values.
Add code in probe.c to evaluate LTR _DSM and save the latencies in pci_dev.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 drivers/pci/pci-acpi.c   | 28 ++++++++++++++++++++++++++++
 drivers/pci/pci.c        | 26 ++++++++++++++++++++++++++
 drivers/pci/pci.h        |  5 +++++
 drivers/pci/probe.c      |  6 ++++++
 include/linux/pci-acpi.h |  1 +
 include/linux/pci.h      |  2 ++
 6 files changed, 68 insertions(+)

diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 7224b1e5f2a8..c9151f96f3c9 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1213,6 +1213,34 @@ static void pci_acpi_optimize_delay(struct pci_dev *pdev,
 	ACPI_FREE(obj);
 }
 
+/* pci_acpi_evaluate_ltr_latency
+ *
+ * @dev - the pci_dev to evaluate and save latencies
+ */
+void pci_acpi_evaluate_ltr_latency(struct pci_dev *dev)
+{
+	union acpi_object *obj, *elements;
+	struct acpi_device *handle;
+
+	handle = ACPI_HANDLE(&dev->dev);
+	if (!handle)
+		return;
+
+	obj = acpi_evaluate_dsm(handle, &pci_acpi_dsm_guid, 0x2,
+				DSM_PCI_LTR_MAX_LATENCY, NULL);
+	if (!obj)
+		return;
+
+	if (obj->type == ACPI_TYPE_PACKAGE && obj->package.count == 4) {
+		elements = obj->package.elements;
+		dev->max_snoop_latency = (u16)elements[1].integer.value |
+				((u16)elements[0].integer.value << PCI_LTR_SCALE_SHIFT);
+		dev->max_nosnoop_latency = (u16)elements[3].integer.value |
+				((u16)elements[2].integer.value << PCI_LTR_SCALE_SHIFT);
+	}
+	ACPI_FREE(obj);
+}
+
 static void pci_acpi_set_untrusted(struct pci_dev *dev)
 {
 	u8 val;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index c9338f914a0e..8aa71175ebea 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2921,6 +2921,32 @@ void pci_pm_init(struct pci_dev *dev)
 		dev->imm_ready = 1;
 }
 
+/**
+ * pci_ltr_init - Initialize Latency Tolerance Information of given PCI device
+ * @dev: PCI device to handle.
+ */
+void pci_ltr_init(struct pci_dev *dev)
+{
+#ifdef CONFIG_PCIASPM
+	int ltr;
+	struct pci_dev *endpoint_dev = dev;
+	u16 max_snoop_sum = 0;
+	u16 max_nosnoop_sum = 0;
+
+	ltr = pci_find_ext_capability(endpoint_dev, PCI_EXT_CAP_ID_LTR);
+	if (!ltr)
+		return;
+
+	dev = pci_upstream_bridge(dev);
+	while (dev) {
+		max_snoop_sum += dev->max_snoop_latency;
+		max_nosnoop_sum += dev->max_nosnoop_latency;
+		dev = pci_upstream_bridge(dev);
+	}
+	pci_write_config_word(endpoint_dev, ltr + PCI_LTR_MAX_SNOOP_LAT, max_snoop_sum);
+	pci_write_config_word(endpoint_dev, ltr + PCI_LTR_MAX_NOSNOOP_LAT, max_nosnoop_sum);
+#endif
+}
 static unsigned long pci_ea_flags(struct pci_dev *dev, u8 prop)
 {
 	unsigned long flags = IORESOURCE_PCI_FIXED | IORESOURCE_PCI_EA_BEI;
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 6d3f75867106..f824dd977dd3 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -109,6 +109,7 @@ void pci_free_cap_save_buffers(struct pci_dev *dev);
 bool pci_bridge_d3_possible(struct pci_dev *dev);
 void pci_bridge_d3_update(struct pci_dev *dev);
 void pci_bridge_wait_for_secondary_bus(struct pci_dev *dev);
+void pci_ltr_init(struct pci_dev *dev);
 
 static inline void pci_wakeup_event(struct pci_dev *dev)
 {
@@ -673,11 +674,15 @@ static inline int pci_aer_raw_clear_status(struct pci_dev *dev) { return -EINVAL
 
 #ifdef CONFIG_ACPI
 int pci_acpi_program_hp_params(struct pci_dev *dev);
+void pci_acpi_evaluate_ltr_latency(struct pci_dev *dev);
 #else
 static inline int pci_acpi_program_hp_params(struct pci_dev *dev)
 {
 	return -ENODEV;
 }
+static inline void pci_acpi_evaluate_ltr_latency(struct pci_dev *dev)
+{
+}
 #endif
 
 #ifdef CONFIG_PCIEASPM
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 2f66988cea25..0bc9d7e6a0e9 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2134,6 +2134,11 @@ static void pci_configure_ltr(struct pci_dev *dev)
 		dev->ltr_path = 1;
 	}
 #endif
+
+	/*
+	 * Read latency values from _DSM and save in pci_dev
+	 */
+	pci_acpi_evaluate_ltr_latency(dev);
 }
 
 static void pci_configure_eetlp_prefix(struct pci_dev *dev)
@@ -2394,6 +2399,7 @@ static void pci_init_capabilities(struct pci_dev *dev)
 	pci_ptm_init(dev);		/* Precision Time Measurement */
 	pci_aer_init(dev);		/* Advanced Error Reporting */
 	pci_dpc_init(dev);		/* Downstream Port Containment */
+	pci_ltr_init(dev);		/* Latency Tolerance Reporting */
 
 	pcie_report_downtraining(dev);
 
diff --git a/include/linux/pci-acpi.h b/include/linux/pci-acpi.h
index 5ba475ca9078..e23236a4ff66 100644
--- a/include/linux/pci-acpi.h
+++ b/include/linux/pci-acpi.h
@@ -110,6 +110,7 @@ extern const guid_t pci_acpi_dsm_guid;
 
 /* _DSM Definitions for PCI */
 #define DSM_PCI_PRESERVE_BOOT_CONFIG		0x05
+#define DSM_PCI_LTR_MAX_LATENCY			0x06
 #define DSM_PCI_DEVICE_NAME			0x07
 #define DSM_PCI_POWER_ON_RESET_DELAY		0x08
 #define DSM_PCI_DEVICE_READINESS_DURATIONS	0x09
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 34c1c4f45288..e407c8cba2d3 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -380,6 +380,8 @@ struct pci_dev {
 	struct pcie_link_state	*link_state;	/* ASPM link state */
 	unsigned int	ltr_path:1;	/* Latency Tolerance Reporting
 					   supported from root to here */
+	u16 max_snoop_latency;		/* LTR Max Snoop latency */
+	u16 max_nosnoop_latency;	/* LTR Max No Snoop latency */
 #endif
 	unsigned int	eetlp_prefix_path:1;	/* End-to-End TLP Prefix */
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
