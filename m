Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C490BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 10:04:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9963B221FD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 10:04:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XktoSDHv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9963B221FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A1AC8A3D2;
	Tue, 14 Jul 2020 10:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRkEH9z9uC98; Tue, 14 Jul 2020 10:04:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5C43E8A3D3;
	Tue, 14 Jul 2020 10:04:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A479C0891;
	Tue, 14 Jul 2020 10:04:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AA7FC1797
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 32E958A3C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vbjDKH5I8rFt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:04:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 373D28A397
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:04:37 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id b15so16402686edy.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AjG9ZXkNlThAdSsdCQVBfTOrnZyMZnOrLKfSK8ObxrE=;
 b=XktoSDHvwVEyA2qSIGNOe+27lD8+It+w/oscI06k1+IugxY4fNo2iArgZd7tJ3tb5O
 RZLCpZitcssWbDWunZax7lwh9Ub95pp+os7YmA1wVFQDvEkawcTNqADWbZKkp6tPST+L
 0s2KtGLEv1ioVe3n135P1Uxczafk+qydGAZ3fXM6ExjpuPgazhaCAFxHSbqeWtQhQZYJ
 UaXEnOhyR07Hvudk1fhTt6QO6f57G7Lu9TsSqwH+516GePqs2elh6vuHaWvsBRyfb9vL
 ijKUVWQqPdfzp/6LgoJCP0wzjZ1REOKByf9BIwseFbU07cEx/bPJr7KvC+/n6vjQqGQ/
 0zJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AjG9ZXkNlThAdSsdCQVBfTOrnZyMZnOrLKfSK8ObxrE=;
 b=JGPJ33NHwXkzi2d2272OMSUQW4MsR7ai3hmPa4O5M/V770t4/+dS+zSNkq22Ta6jfP
 uJU8La20zmAwgVNUzM2t4jBsO8DR6uxa6TRQzOUvL1ABam8qY/c2cuYDqNWrnR+JDHrn
 PtI8DnFaTh+6IGj6QjgN7lThMfQbk4zcHKjOsEGiiqqzK5WEoCuU03lKVOVndhPqv4+W
 J8mCT0C5IAVnM68lBpPhTyzyUDgOo2AKP15EPPg7kjQhooIl5iH5qk0T7AmX3dbseJax
 VpLy4Slm+wPrhMrbma68qQNxNx6CQQHvCT62CdUtlDd4kiyUCtPu2qecTe4z2mb35PRR
 vqRw==
X-Gm-Message-State: AOAM532+LIdjvnZDH2G+XoBbfy6Kh22e8jcCvlYUThlFHkYBzo/+ZgGB
 aj09gPn3ZIOeX0hqf0z3B/g=
X-Google-Smtp-Source: ABdhPJw4d+6fAHfArS6YVCLKVPm4T/c8KMuzMlKt/TwrMSjQlmp+/J9pYfzHKZouoVLK/LJ5+omnQQ==
X-Received: by 2002:aa7:c305:: with SMTP id l5mr3754952edq.163.1594721075471; 
 Tue, 14 Jul 2020 03:04:35 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id bs18sm14137672edb.38.2020.07.14.03.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 03:04:35 -0700 (PDT)
From: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Tue, 14 Jul 2020 13:04:44 +0200
Message-Id: <20200714110445.32605-3-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200714110445.32605-1-refactormyself@gmail.com>
References: <20200714110445.32605-1-refactormyself@gmail.com>
Cc: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 10/14 v4] PCI: Check return value of
	pcie_capability_read_*()
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

On failure pcie_capability_read_dword() sets it's last parameter,
val to 0.
However, with Patch 14/14, it is possible that val is set to ~0 on
failure. This would introduce a bug because (x & x) == (~0 & x).

This bug can be avoided if the return value of pcie_capability_read_word
is checked to confirm success.

Check the return value of pcie_capability_read_word() to ensure success.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
v4 changes:
Remove unnecessary boolean conversion.

 drivers/pci/probe.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 2f66988cea25..3c87a8a1d4b5 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1121,10 +1121,11 @@ EXPORT_SYMBOL(pci_add_new_bus);
 static void pci_enable_crs(struct pci_dev *pdev)
 {
 	u16 root_cap = 0;
+	int ret;
 
 	/* Enable CRS Software Visibility if supported */
-	pcie_capability_read_word(pdev, PCI_EXP_RTCAP, &root_cap);
-	if (root_cap & PCI_EXP_RTCAP_CRSVIS)
+	ret = pcie_capability_read_word(pdev, PCI_EXP_RTCAP, &root_cap);
+	if (!ret && (root_cap & PCI_EXP_RTCAP_CRSVIS))
 		pcie_capability_set_word(pdev, PCI_EXP_RTCTL,
 					 PCI_EXP_RTCTL_CRSSVE);
 }
@@ -1519,9 +1520,10 @@ void set_pcie_port_type(struct pci_dev *pdev)
 void set_pcie_hotplug_bridge(struct pci_dev *pdev)
 {
 	u32 reg32;
+	int ret;
 
-	pcie_capability_read_dword(pdev, PCI_EXP_SLTCAP, &reg32);
-	if (reg32 & PCI_EXP_SLTCAP_HPC)
+	ret = pcie_capability_read_dword(pdev, PCI_EXP_SLTCAP, &reg32);
+	if (!ret && (reg32 & PCI_EXP_SLTCAP_HPC))
 		pdev->is_hotplug_bridge = 1;
 }
 
@@ -2057,10 +2059,11 @@ int pci_configure_extended_tags(struct pci_dev *dev, void *ign)
 bool pcie_relaxed_ordering_enabled(struct pci_dev *dev)
 {
 	u16 v;
+	int ret;
 
-	pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &v);
+	ret = pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &v);
 
-	return !!(v & PCI_EXP_DEVCTL_RELAX_EN);
+	return (!ret && (v & PCI_EXP_DEVCTL_RELAX_EN));
 }
 EXPORT_SYMBOL(pcie_relaxed_ordering_enabled);
 
@@ -2096,16 +2099,17 @@ static void pci_configure_ltr(struct pci_dev *dev)
 	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
 	struct pci_dev *bridge;
 	u32 cap, ctl;
+	int ret;
 
 	if (!pci_is_pcie(dev))
 		return;
 
-	pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
-	if (!(cap & PCI_EXP_DEVCAP2_LTR))
+	ret = pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
+	if (ret || !(cap & PCI_EXP_DEVCAP2_LTR))
 		return;
 
-	pcie_capability_read_dword(dev, PCI_EXP_DEVCTL2, &ctl);
-	if (ctl & PCI_EXP_DEVCTL2_LTR_EN) {
+	ret = pcie_capability_read_dword(dev, PCI_EXP_DEVCTL2, &ctl);
+	if (!ret && (ctl & PCI_EXP_DEVCTL2_LTR_EN)) {
 		if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT) {
 			dev->ltr_path = 1;
 			return;
@@ -2142,12 +2146,13 @@ static void pci_configure_eetlp_prefix(struct pci_dev *dev)
 	struct pci_dev *bridge;
 	int pcie_type;
 	u32 cap;
+	int ret;
 
 	if (!pci_is_pcie(dev))
 		return;
 
-	pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
-	if (!(cap & PCI_EXP_DEVCAP2_EE_PREFIX))
+	ret = pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
+	if (ret || !(cap & PCI_EXP_DEVCAP2_EE_PREFIX))
 		return;
 
 	pcie_type = pci_pcie_type(dev);
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
