Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8085AC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53E322080C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPXE0MeF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53E322080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 33DFC87046;
	Sat,  1 Aug 2020 12:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSpT8wLN61xn; Sat,  1 Aug 2020 12:24:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 97CD68704F;
	Sat,  1 Aug 2020 12:24:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86798C0050;
	Sat,  1 Aug 2020 12:24:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4171AC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3949F887C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4p6ztfZ5KFnT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 27419887D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:44 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id a26so8221078ejc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SrhDN2Qf8+lE/P1EU/TJXEXFld12zPt7dPQFf412LUk=;
 b=TPXE0MeFmNEeYfTarS0h6lEu6T0txCu1b9KgvIqoPjxSgbUjX4ba/CalHwh+XNV9EE
 zlXi4oKFUnZZ5zVHu3WsUdEEvPp6L05on/HWX3VkVM77SKuj2FlpD86dH5NZ0QEzjtTg
 K6Nhr9ENw+lKNFgRQijLjk+mW5c0pk5ZeQxpTHze7A4BQdrPzxltjjv/Vjb6Z0Aox8Ed
 VEDJwMbimBqhxR0PWwCryl7i42bAF/Lj23OoFongQc7qaNfxcZ19cdJVnPclf3scGhyn
 SuPxs1q4uD+8x4GNtXQxh8OWpVwFNMLSH/5l5QbhWZdIK8bLxs9GcQ3rDUmnwv4+7V1h
 dxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SrhDN2Qf8+lE/P1EU/TJXEXFld12zPt7dPQFf412LUk=;
 b=EFqivTsAeOyLc1dAZjWO4E4Q/aeCVjT15RAOxfF2+11MOaH4YIYPnnTK5y0aAt7DHi
 ooeggfN+EItJxAtg4t7o0gqx+Qz/QMHdmVD/U21Bl40M14P1k68hVYwNJQXYhzpw43P8
 1J3Fb1FHHPNJbZk4jSm1yPupuUvMu+e19yKYRGdXDWC3dY1t9G1Lz1Ns+RSzZyh0YEpL
 Ey0dHPmQBnkhtFwjKVF3RD7g2bH/WsoyHVJ5Mz+SSAiXNaL0I6ANjXTtBXTaOEq1Engl
 FMQ/ZFFvszVapQ+vYZtmeQoBWXTxkqLTrKOaR3I6QRm4PsJwhSN1G9M82fRLjhQ6VUKK
 cm5A==
X-Gm-Message-State: AOAM531VAGIRKsqMVonWwSy2188R0RHSmkKA/j/r8zqRgEU7k+IFHNXb
 msD1n+4mxxFF63KQup4ISxc=
X-Google-Smtp-Source: ABdhPJwCqcTSSFI7x9YZQM/IwvnR14OpHVv8jfwf8XU/U7ZA+HW+nlMkfVJ1UJTfn+AVXi9rMi5gOw==
X-Received: by 2002:a17:906:3616:: with SMTP id
 q22mr8872560ejb.79.1596284682629; 
 Sat, 01 Aug 2020 05:24:42 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:42 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Date: Sat,  1 Aug 2020 13:24:43 +0200
Message-Id: <20200801112446.149549-15-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Cc: linux-rdma@vger.kernel.org,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 14/17] IB: Drop uses of
	pci_read_config_*() return value
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

The return value of pci_read_config_*() may not indicate a device error.
However, the value read by these functions is more likely to indicate
this kind of error. This presents two overlapping ways of reporting
errors and complicates error checking.

It is possible to move to one single way of checking for error if the
dependency on the return value of these functions is removed, then it
can later be made to return void.

Remove all uses of the return value of pci_read_config_*().
Check the actual value read for ~0. In this case, ~0 is an invalid
value thus it indicates some kind of error.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/infiniband/hw/hfi1/pcie.c         | 38 +++++++++++------------
 drivers/infiniband/hw/mthca/mthca_reset.c | 19 ++++++------
 2 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/pcie.c b/drivers/infiniband/hw/hfi1/pcie.c
index 1a6268d61977..11cf7dde873d 100644
--- a/drivers/infiniband/hw/hfi1/pcie.c
+++ b/drivers/infiniband/hw/hfi1/pcie.c
@@ -392,24 +392,24 @@ int restore_pci_variables(struct hfi1_devdata *dd)
 /* Save BARs and command to rewrite after device reset */
 int save_pci_variables(struct hfi1_devdata *dd)
 {
-	int ret = 0;
+	int ret = -ENODEV;
 
-	ret = pci_read_config_dword(dd->pcidev, PCI_BASE_ADDRESS_0,
+	pci_read_config_dword(dd->pcidev, PCI_BASE_ADDRESS_0,
 				    &dd->pcibar0);
-	if (ret)
+	if (dd->pcibar0 == (u32)~0)
 		goto error;
 
-	ret = pci_read_config_dword(dd->pcidev, PCI_BASE_ADDRESS_1,
+	pci_read_config_dword(dd->pcidev, PCI_BASE_ADDRESS_1,
 				    &dd->pcibar1);
-	if (ret)
+	if (dd->pcibar1 == (u32)~0)
 		goto error;
 
-	ret = pci_read_config_dword(dd->pcidev, PCI_ROM_ADDRESS, &dd->pci_rom);
-	if (ret)
+	pci_read_config_dword(dd->pcidev, PCI_ROM_ADDRESS, &dd->pci_rom);
+	if (dd->pci_rom == (u32)~0)
 		goto error;
 
-	ret = pci_read_config_word(dd->pcidev, PCI_COMMAND, &dd->pci_command);
-	if (ret)
+	pci_read_config_word(dd->pcidev, PCI_COMMAND, &dd->pci_command);
+	if (dd->pci_command == (u16)~0)
 		goto error;
 
 	ret = pcie_capability_read_word(dd->pcidev, PCI_EXP_DEVCTL,
@@ -427,14 +427,14 @@ int save_pci_variables(struct hfi1_devdata *dd)
 	if (ret)
 		goto error;
 
-	ret = pci_read_config_dword(dd->pcidev, PCI_CFG_MSIX0, &dd->pci_msix0);
-	if (ret)
+	pci_read_config_dword(dd->pcidev, PCI_CFG_MSIX0, &dd->pci_msix0);
+	if (dd->pci_command == (u32)~0)
 		goto error;
 
 	if (pci_find_ext_capability(dd->pcidev, PCI_EXT_CAP_ID_TPH)) {
-		ret = pci_read_config_dword(dd->pcidev, PCIE_CFG_TPH2,
+		pci_read_config_dword(dd->pcidev, PCIE_CFG_TPH2,
 					    &dd->pci_tph2);
-		if (ret)
+		if (dd->pci_tph2 == (u32)~0)
 			goto error;
 	}
 	return 0;
@@ -783,9 +783,9 @@ static int load_eq_table(struct hfi1_devdata *dd, const u8 eq[11][3], u8 fs,
 		pci_write_config_dword(pdev, PCIE_CFG_REG_PL102,
 				       eq_value(c_minus1, c0, c_plus1));
 		/* check if these coefficients violate EQ rules */
-		ret = pci_read_config_dword(dd->pcidev,
+		pci_read_config_dword(dd->pcidev,
 					    PCIE_CFG_REG_PL105, &violation);
-		if (ret) {
+		if (violation == (32)~0) {
 			dd_dev_err(dd, "Unable to read from PCI config\n");
 			hit_error = 1;
 			break;
@@ -1322,8 +1322,8 @@ int do_pcie_gen3_transition(struct hfi1_devdata *dd)
 	/* step 10: decide what to do next */
 
 	/* check if we can read PCI space */
-	ret = pci_read_config_word(dd->pcidev, PCI_VENDOR_ID, &vendor);
-	if (ret) {
+	pci_read_config_word(dd->pcidev, PCI_VENDOR_ID, &vendor);
+	if (vendor == (u16)~0) {
 		dd_dev_info(dd,
 			    "%s: read of VendorID failed after SBR, err %d\n",
 			    __func__, ret);
@@ -1376,8 +1376,8 @@ int do_pcie_gen3_transition(struct hfi1_devdata *dd)
 	setextled(dd, 0);
 
 	/* check for any per-lane errors */
-	ret = pci_read_config_dword(dd->pcidev, PCIE_CFG_SPCIE2, &reg32);
-	if (ret) {
+	pci_read_config_dword(dd->pcidev, PCIE_CFG_SPCIE2, &reg32);
+	if (reg32 == (u32)~0) {
 		dd_dev_err(dd, "Unable to read from PCI config\n");
 		return_error = 1;
 		goto done;
diff --git a/drivers/infiniband/hw/mthca/mthca_reset.c b/drivers/infiniband/hw/mthca/mthca_reset.c
index 2a6979e4ae1c..5f09d5312472 100644
--- a/drivers/infiniband/hw/mthca/mthca_reset.c
+++ b/drivers/infiniband/hw/mthca/mthca_reset.c
@@ -102,7 +102,10 @@ int mthca_reset(struct mthca_dev *mdev)
 	for (i = 0; i < 64; ++i) {
 		if (i == 22 || i == 23)
 			continue;
-		if (pci_read_config_dword(mdev->pdev, i * 4, hca_header + i)) {
+
+		pci_read_config_dword(mdev->pdev, i * 4,
+						hca_header + i);
+		if (*(hca_header + i) == (u32)~0) {
 			err = -ENODEV;
 			mthca_err(mdev, "Couldn't save HCA "
 				  "PCI header, aborting.\n");
@@ -123,7 +126,10 @@ int mthca_reset(struct mthca_dev *mdev)
 		for (i = 0; i < 64; ++i) {
 			if (i == 22 || i == 23)
 				continue;
-			if (pci_read_config_dword(bridge, i * 4, bridge_header + i)) {
+
+			pci_read_config_dword(bridge, i * 4,
+							bridge_header + i);
+			if (*(bridge_header + i) == (u32)~0) {
 				err = -ENODEV;
 				mthca_err(mdev, "Couldn't save HCA bridge "
 					  "PCI header, aborting.\n");
@@ -164,13 +170,8 @@ int mthca_reset(struct mthca_dev *mdev)
 		int c = 0;
 
 		for (c = 0; c < 100; ++c) {
-			if (pci_read_config_dword(bridge ? bridge : mdev->pdev, 0, &v)) {
-				err = -ENODEV;
-				mthca_err(mdev, "Couldn't access HCA after reset, "
-					  "aborting.\n");
-				goto free_bh;
-			}
-
+			pci_read_config_dword(bridge ? bridge : mdev->pdev, 0,
+									&v);
 			if (v != 0xffffffff)
 				goto good;
 
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
