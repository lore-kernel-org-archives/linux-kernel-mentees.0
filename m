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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB92C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D67032087C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHC8F3xI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D67032087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BC478203E5;
	Sat,  1 Aug 2020 12:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jeT0YghlopZz; Sat,  1 Aug 2020 12:24:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B3293203DF;
	Sat,  1 Aug 2020 12:24:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFAD9C0050;
	Sat,  1 Aug 2020 12:24:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B9C0C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4BDAB887E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojUJsqKi-6kO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9F30A887DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:33 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id w9so33998643ejc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2peFsovxGVV4gCt0Mx9sMbTzR95trvfBpVMnOvN8Fo4=;
 b=MHC8F3xInCE2ydGK/EnQ0azhTNezTEawS/NpL5c7th2laUuRZK+3U2vHab/2fuwyUl
 DNGUnNCuxH7FBodzjNvlXlNt+ZtIWkCAII9T1Mt5ZLClAw59gW8f9j3k3sKDRPXrNIyU
 7nCi13fJ2aZ6sc5IsXAiUzbUm8llWjSKhTQi3L3uDX7yIQdR01cgPNzxTshbqkALdUmF
 hK4lkL8RnounA/F/1zp63gWlI/H1xL9U7jOVI9/kbegdO5cc7JKr1oDJ+VbmW70htio6
 CjS1szO3vdyvksMtmWHmNEltLVzsLoea/8tqSWjpK0QYt2sLxAkwzyyHnUOWDZeAcs4s
 wsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2peFsovxGVV4gCt0Mx9sMbTzR95trvfBpVMnOvN8Fo4=;
 b=bdbPpv9mt/o+N/Pp18W7NRve1RWkuIE2WUpskP7fyJIEQiqUiwwODC82XSQxN6bKPR
 mUWBRT2Qdpeqkpk+zTbb8R2G1LXg+Bl+Onn7oPr8ZrR6R81tOVIzkGaYIGd3qKy2nUZC
 3tV0sQ3sWieeOm3WCyl6S8jqrSXUlBg3buJ74VmPWEENf/8CxFGbA7Amj/La4a2nhjPY
 T8tHMaYJoB6u08FcGmL8X8Zj4e2WXTedZD0Snp22PJgHL2ZbfGawpEYwrTe1ZYqS2W+Q
 eyJI/pNCCyvx2ayj89XOW3QGi3yP7CNYFDhX7QzmuEGKWn+9upEuURw29mYVslolUmJy
 7zDw==
X-Gm-Message-State: AOAM5330Yn+TFrHr5wRvO11P8VqnCAwbwt7ikIxFwyJVzqMCXeNsWlCc
 XHT2Ze8jmCx4G9r9ubQfaqY=
X-Google-Smtp-Source: ABdhPJwF5aApjIzhTtBaMsMDyrf3A0H/Q78+5Z43GqAcnXua/uT0af+DGG/DDqkiofeX7NtIiEeB7A==
X-Received: by 2002:a17:906:a219:: with SMTP id
 r25mr8529725ejy.201.1596284671989; 
 Sat, 01 Aug 2020 05:24:31 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:31 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Borislav Petkov <bp@alien8.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>
Date: Sat,  1 Aug 2020 13:24:35 +0200
Message-Id: <20200801112446.149549-7-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, Robert Richter <rrichter@marvell.com>,
 James Morse <james.morse@arm.com>, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-edac@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC PATCH 06/17] edac: Drop uses of
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
Check the actual value read for ~0. In this case, ~0 is an invalid value
thus it indicates some kind of error.

drivers/edac/amd8111_edac.c edac_pci_read_dword() :
None of the callers of edac_pci_read_dword() uses the return value. The
obtained value can be checked for validity to confirm success.

Change the return type of edac_pci_read_dword() to void.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/edac/amd64_edac.c      |  8 +++-----
 drivers/edac/amd8111_edac.c    | 16 +++++-----------
 drivers/edac/amd8131_edac.c    |  6 ++----
 drivers/edac/i82443bxgx_edac.c |  3 ++-
 drivers/edac/sb_edac.c         | 12 ++++++++----
 drivers/edac/skx_common.c      | 18 ++++++++++++------
 6 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 6262f6370c5d..f798eb17cb23 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -57,14 +57,12 @@ static const struct scrubrate {
 int __amd64_read_pci_cfg_dword(struct pci_dev *pdev, int offset,
 			       u32 *val, const char *func)
 {
-	int err = 0;
-
-	err = pci_read_config_dword(pdev, offset, val);
-	if (err)
+	pci_read_config_dword(pdev, offset, val);
+	if (*val == (u32)~0)
 		amd64_warn("%s: error reading F%dx%03x.\n",
 			   func, PCI_FUNC(pdev->devfn), offset);
 
-	return err;
+	return -ENODEV;
 }
 
 int __amd64_write_pci_cfg_dword(struct pci_dev *pdev, int offset,
diff --git a/drivers/edac/amd8111_edac.c b/drivers/edac/amd8111_edac.c
index 7508aa416ddb..ebf6deaf1d3d 100644
--- a/drivers/edac/amd8111_edac.c
+++ b/drivers/edac/amd8111_edac.c
@@ -34,24 +34,18 @@ enum amd8111_edac_pcis {
 };
 
 /* Wrapper functions for accessing PCI configuration space */
-static int edac_pci_read_dword(struct pci_dev *dev, int reg, u32 *val32)
+static void edac_pci_read_dword(struct pci_dev *dev, int reg, u32 *val32)
 {
-	int ret;
-
-	ret = pci_read_config_dword(dev, reg, val32);
-	if (ret != 0)
+	pci_read_config_dword(dev, reg, val32);
+	if (val32 == (u32)~0)
 		printk(KERN_ERR AMD8111_EDAC_MOD_STR
 			" PCI Access Read Error at 0x%x\n", reg);
-
-	return ret;
 }
 
 static void edac_pci_read_byte(struct pci_dev *dev, int reg, u8 *val8)
 {
-	int ret;
-
-	ret = pci_read_config_byte(dev, reg, val8);
-	if (ret != 0)
+	pci_read_config_byte(dev, reg, val8);
+	if (val8 == (u8)~0)
 		printk(KERN_ERR AMD8111_EDAC_MOD_STR
 			" PCI Access Read Error at 0x%x\n", reg);
 }
diff --git a/drivers/edac/amd8131_edac.c b/drivers/edac/amd8131_edac.c
index 169353710982..6df98c05391d 100644
--- a/drivers/edac/amd8131_edac.c
+++ b/drivers/edac/amd8131_edac.c
@@ -26,10 +26,8 @@
 /* Wrapper functions for accessing PCI configuration space */
 static void edac_pci_read_dword(struct pci_dev *dev, int reg, u32 *val32)
 {
-	int ret;
-
-	ret = pci_read_config_dword(dev, reg, val32);
-	if (ret != 0)
+	pci_read_config_dword(dev, reg, val32);
+	if (val32 == (u32)~0)
 		printk(KERN_ERR AMD8131_EDAC_MOD_STR
 			" PCI Access Read Error at 0x%x\n", reg);
 }
diff --git a/drivers/edac/i82443bxgx_edac.c b/drivers/edac/i82443bxgx_edac.c
index a2ca929e2168..d6797ed7ac65 100644
--- a/drivers/edac/i82443bxgx_edac.c
+++ b/drivers/edac/i82443bxgx_edac.c
@@ -243,7 +243,8 @@ static int i82443bxgx_edacmc_probe1(struct pci_dev *pdev, int dev_idx)
 	/* Something is really hosed if PCI config space reads from
 	 * the MC aren't working.
 	 */
-	if (pci_read_config_dword(pdev, I82443BXGX_NBXCFG, &nbxcfg))
+	pci_read_config_dword(pdev, I82443BXGX_NBXCFG, &nbxcfg);
+	if (nbxcfg == (u32)~0)
 		return -EIO;
 
 	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
index d414698ca324..e56a06d68a4e 100644
--- a/drivers/edac/sb_edac.c
+++ b/drivers/edac/sb_edac.c
@@ -1697,13 +1697,15 @@ static int get_dimm_config(struct mem_ctl_info *mci)
 
 		if (knl_get_dimm_capacity(pvt, knl_mc_sizes) != 0)
 			return -1;
-		if (pci_read_config_dword(pvt->pci_ta, KNL_MCMTR, &pvt->info.mcmtr)) {
+		pci_read_config_dword(pvt->pci_ta, KNL_MCMTR, &pvt->info.mcmtr);
+		if (pvt->info.mcmtr == (u32)~0) {
 			edac_dbg(0, "Failed to read KNL_MCMTR register\n");
 			return -ENODEV;
 		}
 	} else {
 		if (pvt->info.type == HASWELL || pvt->info.type == BROADWELL) {
-			if (pci_read_config_dword(pvt->pci_ha, HASWELL_HASYSDEFEATURE2, &reg)) {
+			pci_read_config_dword(pvt->pci_ha, HASWELL_HASYSDEFEATURE2, &reg);
+			if (reg == (u32)~0) {
 				edac_dbg(0, "Failed to read HASWELL_HASYSDEFEATURE2 register\n");
 				return -ENODEV;
 			}
@@ -1714,7 +1716,8 @@ static int get_dimm_config(struct mem_ctl_info *mci)
 				goto next;
 			}
 		}
-		if (pci_read_config_dword(pvt->pci_ras, RASENABLES, &reg)) {
+		pci_read_config_dword(pvt->pci_ras, RASENABLES, &reg);
+		if (reg == (u32)~0) {
 			edac_dbg(0, "Failed to read RASENABLES register\n");
 			return -ENODEV;
 		}
@@ -1727,7 +1730,8 @@ static int get_dimm_config(struct mem_ctl_info *mci)
 		}
 
 next:
-		if (pci_read_config_dword(pvt->pci_ta, MCMTR, &pvt->info.mcmtr)) {
+		pci_read_config_dword(pvt->pci_ta, MCMTR, &pvt->info.mcmtr);
+		if (pvt->info.mcmtr == (u32)~0) {
 			edac_dbg(0, "Failed to read MCMTR register\n");
 			return -ENODEV;
 		}
diff --git a/drivers/edac/skx_common.c b/drivers/edac/skx_common.c
index 6d8d6dc626bf..7956c75c289f 100644
--- a/drivers/edac/skx_common.c
+++ b/drivers/edac/skx_common.c
@@ -161,7 +161,8 @@ int skx_get_src_id(struct skx_dev *d, int off, u8 *id)
 {
 	u32 reg;
 
-	if (pci_read_config_dword(d->util_all, off, &reg)) {
+	pci_read_config_dword(d->util_all, off, &reg);
+	if (reg == (u32)~0) {
 		skx_printk(KERN_ERR, "Failed to read src id\n");
 		return -ENODEV;
 	}
@@ -174,7 +175,8 @@ int skx_get_node_id(struct skx_dev *d, u8 *id)
 {
 	u32 reg;
 
-	if (pci_read_config_dword(d->util_all, 0xf4, &reg)) {
+	pci_read_config_dword(d->util_all, 0xf4, &reg);
+	if (reg == (u32)~0) {
 		skx_printk(KERN_ERR, "Failed to read node id\n");
 		return -ENODEV;
 	}
@@ -220,7 +222,8 @@ int skx_get_all_bus_mappings(struct res_config *cfg, struct list_head **list)
 			return -ENOMEM;
 		}
 
-		if (pci_read_config_dword(pdev, cfg->busno_cfg_offset, &reg)) {
+		pci_read_config_dword(pdev, cfg->busno_cfg_offset, &reg);
+		if (reg == (u32)~0) {
 			kfree(d);
 			pci_dev_put(pdev);
 			skx_printk(KERN_ERR, "Failed to read bus idx\n");
@@ -259,19 +262,22 @@ int skx_get_hi_lo(unsigned int did, int off[], u64 *tolm, u64 *tohm)
 		return -ENODEV;
 	}
 
-	if (pci_read_config_dword(pdev, off[0], &reg)) {
+	pci_read_config_dword(pdev, off[0], &reg);
+	if (reg == (u32)~0) {
 		skx_printk(KERN_ERR, "Failed to read tolm\n");
 		goto fail;
 	}
 	skx_tolm = reg;
 
-	if (pci_read_config_dword(pdev, off[1], &reg)) {
+	pci_read_config_dword(pdev, off[1], &reg);
+	if (reg == (u32)~0) {
 		skx_printk(KERN_ERR, "Failed to read lower tohm\n");
 		goto fail;
 	}
 	skx_tohm = reg;
 
-	if (pci_read_config_dword(pdev, off[2], &reg)) {
+	pci_read_config_dword(pdev, off[2], &reg);
+	if (reg == (u32)~0) {
 		skx_printk(KERN_ERR, "Failed to read upper tohm\n");
 		goto fail;
 	}
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
