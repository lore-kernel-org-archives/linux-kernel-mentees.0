Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FD5C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA1A02076A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puciVruZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA1A02076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB4CE87051;
	Sat,  1 Aug 2020 12:24:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qk79UZOHKm5K; Sat,  1 Aug 2020 12:24:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D759C87046;
	Sat,  1 Aug 2020 12:24:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C61F7C0050;
	Sat,  1 Aug 2020 12:24:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3CD5C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DCCEE203E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7kl3SZDyM+n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 423C2203D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:49 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id o18so34005295eje.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WuEfbc6tXTSPxgYhc8GBlrhIgPKHPNIokCc6jcbGrnA=;
 b=puciVruZjSj58crrBaPOvKOFovdmwjton2ViDkAJyXSDsbH8S5wJxOHfMtUqv0lnvK
 UbzqzW8Sw74URsHUOZuVVnmeJFtusJ7sP7gVy9SKne9ZoWNsdiwXkBj0ECAq1CHwPmIO
 reMg2wCxUhVWSbkj6jSC/fzluoGV8fnAM3wy2+eCMIqhlGsCAE/zYXiseP7GDtf2rwpQ
 sH54wyQ/QX+TE/5jtzRPmS9EmeJKWowCukWlbSl9s0QLXogmlXZn3RyX7zqzgbPaZuiB
 z3bPxmwfp+pWZo+EkqHlCyJeSpotz1fGxShfzxiB7Q1gEumoOUdz4bp7+Rm73oNtinsu
 ImfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WuEfbc6tXTSPxgYhc8GBlrhIgPKHPNIokCc6jcbGrnA=;
 b=A+N7IDK4OkjdNxl7Sp3RH58Jc0qYaZN6+6gmvYACXnt/YM0oLbp+xnmH4ViqlH3sML
 +RSNdSJ7LlesPvNScAHIkC2tdqRF1fPZ8L5gkTEEimf7Qi/aVh4e3s35/fYiuVrjDfJ4
 EGcHkRLi898h4Y/ZSK0d7SYdeC8eCmIbRzNbiVwFMSxAMBI5UvQwCct9BNOWankeLEOw
 xtFaNzwfjgPPY61TpCSvtp/eiWNi47udlDtkIJADOMMwT3Jnnm++Vt9VbTwcSJBpGJbd
 z+gAfTggi+w4Ir3FpZBqJb8PGbWxh/xB6EMwKff5U1NYr6QeuCBUGN82efi92nuLTdhQ
 w8DA==
X-Gm-Message-State: AOAM533x6KU8xnq4rHpWofqsmBSH/SEKxGqmkhtj84j4efRxBBHcgdx2
 0MS79+yDF3fPxE4jKxPY8k4=
X-Google-Smtp-Source: ABdhPJwWT9TZbxDhqkMVpM+iCmur7AgDN5wt9JmA4+V0x7td71JPi8yIMDJT1uKV5t2/nsl3f9ZyYw==
X-Received: by 2002:a17:906:9356:: with SMTP id
 p22mr8260889ejw.119.1596284687686; 
 Sat, 01 Aug 2020 05:24:47 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:47 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, "David S. Miller" <davem@davemloft.net>,
 Kalle Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>
Date: Sat,  1 Aug 2020 13:24:46 +0200
Message-Id: <20200801112446.149549-18-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 17/17] net: Drop uses of
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
 drivers/net/can/peak_canfd/peak_pciefd_main.c     |  6 ++++--
 drivers/net/can/sja1000/peak_pci.c                |  6 ++++--
 drivers/net/ethernet/agere/et131x.c               | 11 +++++++----
 .../net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c   |  5 +++--
 .../ethernet/cavium/liquidio/cn23xx_pf_device.c   |  4 ++--
 drivers/net/ethernet/marvell/sky2.c               |  5 +++--
 drivers/net/ethernet/mellanox/mlx4/catas.c        |  7 +------
 drivers/net/ethernet/mellanox/mlx4/reset.c        | 10 ++++++----
 drivers/net/ethernet/myricom/myri10ge/myri10ge.c  |  4 ++--
 drivers/net/wan/farsync.c                         |  5 +++--
 .../wireless/broadcom/brcm80211/brcmfmac/pcie.c   |  4 ++--
 drivers/net/wireless/intel/iwlwifi/pcie/trans.c   | 15 ++++++++++-----
 12 files changed, 47 insertions(+), 35 deletions(-)

diff --git a/drivers/net/can/peak_canfd/peak_pciefd_main.c b/drivers/net/can/peak_canfd/peak_pciefd_main.c
index 6ad83a881039..484a214fc1f1 100644
--- a/drivers/net/can/peak_canfd/peak_pciefd_main.c
+++ b/drivers/net/can/peak_canfd/peak_pciefd_main.c
@@ -730,9 +730,11 @@ static int peak_pciefd_probe(struct pci_dev *pdev,
 		goto err_disable_pci;
 
 	/* the number of channels depends on sub-system id */
-	err = pci_read_config_word(pdev, PCI_SUBSYSTEM_ID, &sub_sys_id);
-	if (err)
+	pci_read_config_word(pdev, PCI_SUBSYSTEM_ID, &sub_sys_id);
+	if (sub_sys_id == (u16)~0) {
+		err = -ENODEV;
 		goto err_release_regions;
+	}
 
 	dev_dbg(&pdev->dev, "probing device %04x:%04x:%04x\n",
 		pdev->vendor, pdev->device, sub_sys_id);
diff --git a/drivers/net/can/sja1000/peak_pci.c b/drivers/net/can/sja1000/peak_pci.c
index 8c0244f51059..d25a99ad08da 100644
--- a/drivers/net/can/sja1000/peak_pci.c
+++ b/drivers/net/can/sja1000/peak_pci.c
@@ -560,9 +560,11 @@ static int peak_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		goto failure_disable_pci;
 
-	err = pci_read_config_word(pdev, 0x2e, &sub_sys_id);
-	if (err)
+	pci_read_config_word(pdev, 0x2e, &sub_sys_id);
+	if (sub_sys_id == (u16)~0) {
+		err = -ENODEV;
 		goto failure_release_regions;
+	}
 
 	dev_dbg(&pdev->dev, "probing device %04x:%04x:%04x\n",
 		pdev->vendor, pdev->device, sub_sys_id);
diff --git a/drivers/net/ethernet/agere/et131x.c b/drivers/net/ethernet/agere/et131x.c
index 865892c1f23f..6b0e5f193e73 100644
--- a/drivers/net/ethernet/agere/et131x.c
+++ b/drivers/net/ethernet/agere/et131x.c
@@ -505,7 +505,8 @@ static int eeprom_wait_ready(struct pci_dev *pdev, u32 *status)
 	 *    to 1 prior to starting a single byte read/write
 	 */
 	for (i = 0; i < MAX_NUM_REGISTER_POLLS; i++) {
-		if (pci_read_config_dword(pdev, LBCIF_DWORD1_GROUP, &reg))
+		pci_read_config_dword(pdev, LBCIF_DWORD1_GROUP, &reg);
+		if (reg == (u32)~0)
 			return -EIO;
 
 		/* I2C idle and Phy Queue Avail both true */
@@ -679,7 +680,8 @@ static int et131x_init_eeprom(struct et131x_adapter *adapter)
 	 * function, because I thought there could be some time conditions
 	 * but it didn't work. Call the whole function twice also work.
 	 */
-	if (pci_read_config_byte(pdev, ET1310_PCI_EEPROM_STATUS, &eestatus)) {
+	pci_read_config_byte(pdev, ET1310_PCI_EEPROM_STATUS, &eestatus);
+	if (eestatus == (u8)~0) {
 		dev_err(&pdev->dev,
 			"Could not read PCI config space for EEPROM Status\n");
 		return -EIO;
@@ -3059,8 +3061,9 @@ static int et131x_pci_init(struct et131x_adapter *adapter,
 	}
 
 	for (i = 0; i < ETH_ALEN; i++) {
-		if (pci_read_config_byte(pdev, ET1310_PCI_MAC_ADDRESS + i,
-					 adapter->rom_addr + i)) {
+		pci_read_config_byte(pdev, ET1310_PCI_MAC_ADDRESS + i,
+					 adapter->rom_addr + i);
+		if (*(adapter->rom_addr + i) == (u8)~0) {
 			dev_err(&pdev->dev, "Could not read PCI config space for MAC address\n");
 			goto err_out;
 		}
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c
index 7cea33803f7f..5962a1d2dffc 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c
@@ -1463,14 +1463,15 @@ static int bnx2x_nvram_read32(struct bnx2x *bp, u32 offset, u32 *buf,
 
 static bool bnx2x_is_nvm_accessible(struct bnx2x *bp)
 {
-	int rc = 1;
+	bool rc = true;
 	u16 pm = 0;
 	struct net_device *dev = pci_get_drvdata(bp->pdev);
 
 	if (bp->pdev->pm_cap)
-		rc = pci_read_config_word(bp->pdev,
+		pci_read_config_word(bp->pdev,
 					  bp->pdev->pm_cap + PCI_PM_CTRL, &pm);
 
+	rc = (pm == (u16)~0);
 	if ((rc && !netif_running(dev)) ||
 	    (!rc && ((pm & PCI_PM_CTRL_STATE_MASK) != (__force u16)PCI_D0)))
 		return false;
diff --git a/drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c b/drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c
index 43d11c38b38a..cf52d6cc2a46 100644
--- a/drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c
+++ b/drivers/net/ethernet/cavium/liquidio/cn23xx_pf_device.c
@@ -1162,8 +1162,8 @@ static int cn23xx_get_pf_num(struct octeon_device *oct)
 	ret = 0;
 
 	/** Read Function Dependency Link reg to get the function number */
-	if (pci_read_config_dword(oct->pci_dev, CN23XX_PCIE_SRIOV_FDL,
-				  &fdl_bit) == 0) {
+	pci_read_config_dword(oct->pci_dev, CN23XX_PCIE_SRIOV_FDL, &fdl_bit);
+	if (fdl_bit != (u32)~0) {
 		oct->pf_num = ((fdl_bit >> CN23XX_PCIE_SRIOV_FDL_BIT_POS) &
 			       CN23XX_PCIE_SRIOV_FDL_MASK);
 	} else {
diff --git a/drivers/net/ethernet/marvell/sky2.c b/drivers/net/ethernet/marvell/sky2.c
index fe54764caea9..1042bfd0ff70 100644
--- a/drivers/net/ethernet/marvell/sky2.c
+++ b/drivers/net/ethernet/marvell/sky2.c
@@ -4964,8 +4964,9 @@ static int sky2_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 *       other PCI access through shared memory for speed and to
 	 *	 avoid MMCONFIG problems.
 	 */
-	err = pci_read_config_dword(pdev, PCI_DEV_REG2, &reg);
-	if (err) {
+	pci_read_config_dword(pdev, PCI_DEV_REG2, &reg);
+	if (reg == (u32)~0) {
+		err = -ENODEV;
 		dev_err(&pdev->dev, "PCI read config failed\n");
 		goto err_out_disable;
 	}
diff --git a/drivers/net/ethernet/mellanox/mlx4/catas.c b/drivers/net/ethernet/mellanox/mlx4/catas.c
index 5b11557f1ae4..1e774a181133 100644
--- a/drivers/net/ethernet/mellanox/mlx4/catas.c
+++ b/drivers/net/ethernet/mellanox/mlx4/catas.c
@@ -52,12 +52,7 @@ static int read_vendor_id(struct mlx4_dev *dev)
 	u16 vendor_id = 0;
 	int ret;
 
-	ret = pci_read_config_word(dev->persist->pdev, 0, &vendor_id);
-	if (ret) {
-		mlx4_err(dev, "Failed to read vendor ID, ret=%d\n", ret);
-		return ret;
-	}
-
+	pci_read_config_word(dev->persist->pdev, 0, &vendor_id);
 	if (vendor_id == 0xffff) {
 		mlx4_err(dev, "PCI can't be accessed to read vendor id\n");
 		return -EINVAL;
diff --git a/drivers/net/ethernet/mellanox/mlx4/reset.c b/drivers/net/ethernet/mellanox/mlx4/reset.c
index 0076d88587ca..f0b9af99aa26 100644
--- a/drivers/net/ethernet/mellanox/mlx4/reset.c
+++ b/drivers/net/ethernet/mellanox/mlx4/reset.c
@@ -81,8 +81,9 @@ int mlx4_reset(struct mlx4_dev *dev)
 	for (i = 0; i < 64; ++i) {
 		if (i == 22 || i == 23)
 			continue;
-		if (pci_read_config_dword(dev->persist->pdev, i * 4,
-					  hca_header + i)) {
+		pci_read_config_dword(dev->persist->pdev, i * 4,
+							hca_header + i);
+		if (*(hca_header + i) == (u32)~0) {
 			err = -ENODEV;
 			mlx4_err(dev, "Couldn't save HCA PCI header, aborting\n");
 			goto out;
@@ -124,8 +125,9 @@ int mlx4_reset(struct mlx4_dev *dev)
 
 	end = jiffies + MLX4_RESET_TIMEOUT_JIFFIES;
 	do {
-		if (!pci_read_config_word(dev->persist->pdev, PCI_VENDOR_ID,
-					  &vendor) && vendor != 0xffff)
+		pci_read_config_word(dev->persist->pdev, PCI_VENDOR_ID,
+					&vendor);
+		if (vendor != 0xffff)
 			break;
 
 		msleep(1);
diff --git a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
index e1e1f4e3639e..b1b055f8ac47 100644
--- a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
+++ b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
@@ -3090,8 +3090,8 @@ static void myri10ge_enable_ecrc(struct myri10ge_priv *mgp)
 	if (!cap)
 		return;
 
-	ret = pci_read_config_dword(bridge, cap + PCI_ERR_CAP, &err_cap);
-	if (ret) {
+	pci_read_config_dword(bridge, cap + PCI_ERR_CAP, &err_cap);
+	if (err_cap == (u32)~0) {
 		dev_err(dev, "failed reading ext-conf-space of %s\n",
 			pci_name(bridge));
 		dev_err(dev, "\t pci=nommconf in use? "
diff --git a/drivers/net/wan/farsync.c b/drivers/net/wan/farsync.c
index 7916efce7188..8981334d9f82 100644
--- a/drivers/net/wan/farsync.c
+++ b/drivers/net/wan/farsync.c
@@ -678,8 +678,9 @@ fst_cpureset(struct fst_card_info *card)
 	unsigned int regval;
 
 	if (card->family == FST_FAMILY_TXU) {
-		if (pci_read_config_byte
-		    (card->device, PCI_INTERRUPT_LINE, &interrupt_line_register)) {
+		pci_read_config_byte
+		    (card->device, PCI_INTERRUPT_LINE, &interrupt_line_register);
+		if (interrupt_line_register == (u8)~0) {
 			dbg(DBG_ASS,
 			    "Error in reading interrupt line register\n");
 		}
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 39381cbde89e..f501b4759630 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -544,8 +544,8 @@ brcmf_pcie_select_core(struct brcmf_pciedev_info *devinfo, u16 coreid)
 	if (core) {
 		bar0_win = core->base;
 		pci_write_config_dword(pdev, BRCMF_PCIE_BAR0_WINDOW, bar0_win);
-		if (pci_read_config_dword(pdev, BRCMF_PCIE_BAR0_WINDOW,
-					  &bar0_win) == 0) {
+		pci_read_config_dword(pdev, BRCMF_PCIE_BAR0_WINDOW, &bar0_win);
+		if (bar0_win != (u32)~0) {
 			if (bar0_win != core->base) {
 				bar0_win = core->base;
 				pci_write_config_dword(pdev,
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
index e5160d620868..caafad424aa7 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/trans.c
@@ -122,7 +122,8 @@ void iwl_trans_pcie_dump_regs(struct iwl_trans *trans)
 	sprintf(prefix, "iwlwifi %s: ", pci_name(pdev));
 	IWL_ERR(trans, "iwlwifi device config registers:\n");
 	for (i = 0, ptr = buf; i < PCI_DUMP_SIZE; i += 4, ptr++)
-		if (pci_read_config_dword(pdev, i, ptr))
+		pci_read_config_dword(pdev, i, ptr);
+		if (*ptr == (u32)~0)
 			goto err_read;
 	print_hex_dump(KERN_ERR, prefix, DUMP_PREFIX_OFFSET, 32, 4, buf, i, 0);
 
@@ -135,7 +136,8 @@ void iwl_trans_pcie_dump_regs(struct iwl_trans *trans)
 	if (pos) {
 		IWL_ERR(trans, "iwlwifi device AER capability structure:\n");
 		for (i = 0, ptr = buf; i < PCI_ERR_ROOT_COMMAND; i += 4, ptr++)
-			if (pci_read_config_dword(pdev, pos + i, ptr))
+			pci_read_config_dword(pdev, pos + i, ptr);
+			if (*ptr == (u32)~0)
 				goto err_read;
 		print_hex_dump(KERN_ERR, prefix, DUMP_PREFIX_OFFSET,
 			       32, 4, buf, i, 0);
@@ -151,7 +153,8 @@ void iwl_trans_pcie_dump_regs(struct iwl_trans *trans)
 	IWL_ERR(trans, "iwlwifi parent port (%s) config registers:\n",
 		pci_name(pdev));
 	for (i = 0, ptr = buf; i < PCI_PARENT_DUMP_SIZE; i += 4, ptr++)
-		if (pci_read_config_dword(pdev, i, ptr))
+		pci_read_config_dword(pdev, i, ptr);
+		if (*ptr == (u32)~0)
 			goto err_read;
 	print_hex_dump(KERN_ERR, prefix, DUMP_PREFIX_OFFSET, 32, 4, buf, i, 0);
 
@@ -165,7 +168,8 @@ void iwl_trans_pcie_dump_regs(struct iwl_trans *trans)
 			pci_name(pdev));
 		sprintf(prefix, "iwlwifi %s: ", pci_name(pdev));
 		for (i = 0, ptr = buf; i <= PCI_ERR_ROOT_ERR_SRC; i += 4, ptr++)
-			if (pci_read_config_dword(pdev, pos + i, ptr))
+			pci_read_config_dword(pdev, pos + i, ptr);
+			if (*ptr == (u32)~0)
 				goto err_read;
 		print_hex_dump(KERN_ERR, prefix, DUMP_PREFIX_OFFSET, 32,
 			       4, buf, i, 0);
@@ -2191,8 +2195,9 @@ static int iwl_trans_pcie_write_mem(struct iwl_trans *trans, u32 addr,
 static int iwl_trans_pcie_read_config32(struct iwl_trans *trans, u32 ofs,
 					u32 *val)
 {
-	return pci_read_config_dword(IWL_TRANS_GET_PCIE_TRANS(trans)->pci_dev,
+	pci_read_config_dword(IWL_TRANS_GET_PCIE_TRANS(trans)->pci_dev,
 				     ofs, val);
+	return (*val == (u32)~0) ? -ENODEV : 0;
 }
 
 static void iwl_trans_pcie_freeze_txq_timer(struct iwl_trans *trans,
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
