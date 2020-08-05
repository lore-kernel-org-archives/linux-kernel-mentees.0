Return-Path: <SRS0=4e7Y=BP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA3AC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 18:09:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2FB52073E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Aug 2020 18:09:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpYfgwkQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2FB52073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A8AD285546;
	Wed,  5 Aug 2020 18:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzyKK9DeAPyq; Wed,  5 Aug 2020 18:09:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C98685E79;
	Wed,  5 Aug 2020 18:09:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE562C0050;
	Wed,  5 Aug 2020 18:09:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E52CC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 18:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1DCE385E79
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 18:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZgTS45ibMUi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 18:09:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 82B1D85546
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Aug 2020 18:09:51 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id q17so25727600pls.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Aug 2020 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VdNiALEgQ/Tw0IhAxmU7az6lLgcNbLOEAuDmANrnfiA=;
 b=cpYfgwkQEP2bfsWRB/iVZRH2zrSxLRKcuJ0SMrxw0P1y3eCwkEg98QxaDBvvtOL80B
 LJPRCOV1klEqeHCOroXhZRlVL+oWZgwRa8ajKVzDGk9zioTu5G3cmhenrt5ZX3SeSUxd
 NDBsNkd0dLRvlwt84lTb8Da1o38oGpVwEYRd4e6k6hxVLloxJMcPrCN5GjceT2b2cyFr
 ddbwvDOJzw7yPqzg6kx51vIvjDbRY2ZRq+8qxdAxC+UT5zl/vwTHeaP2RIvzQvhTbDOp
 Z2ahvmTpHyMuWu9aCcE7DKXUZ87kyLLqxMwFvKXFcNoeQVXZ1n330wFDOktOokpHONSF
 vyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VdNiALEgQ/Tw0IhAxmU7az6lLgcNbLOEAuDmANrnfiA=;
 b=EtInm4K6gs3PK4IfiYPAQjxQUt53IBINd66TxbYi0PmCLGp+mvpD2ennsDaC3x9RQU
 6M3KKqdTWuWIYV5TzG/24dn09jEhnR66f2GAUrlbH+nt63YiZHhx184hCDvjCK0TN+Bf
 3PCPnMboI7eiMdGlAv88G13GoHduv20CChwSoEdVSM3sALIUTUSFNBu2qT9L746JVW3v
 vNQcYDW1HqkwZ/flzydj/ul62y5unO5njNTe64lg/zput+VerB8JuUOZxA3j0LhC9Y71
 QPaRV+4EbEIthGopatLUjJ1Ut0PVUAXcsa0SYhVVMM0/e3n7WyF/h29SqaT1qSesIydO
 ngVA==
X-Gm-Message-State: AOAM531zgQ5MGZozEX9etg0ipfEDrwRT+f4m3Y5u737Akc+/sdrP3j3k
 biO9oGO5PL8yF82GZL2M83s=
X-Google-Smtp-Source: ABdhPJyDd6hePwgMx1pVDIy6sNSuRn+nHzmygK+IonbCInDlhNLVZGl75c+GI/m8YHSip6M5lXCFTg==
X-Received: by 2002:a17:902:b203:: with SMTP id
 t3mr4063000plr.50.1596650991064; 
 Wed, 05 Aug 2020 11:09:51 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id t63sm4977510pfb.210.2020.08.05.11.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 11:09:50 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Paul Mackerras <paulus@samba.org>, Russell King <linux@armlinux.org.uk>,
 Andres Salomon <dilinger@queued.net>, Antonino Daplas <adaplas@gmail.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Date: Wed,  5 Aug 2020 23:37:15 +0530
Message-Id: <20200805180722.244008-6-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805180722.244008-1-vaibhavgupta40@gmail.com>
References: <20200805180722.244008-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v1 05/12] fbdev: aty128fb: use
	generic power management
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

Drivers using legacy power management .suspen()/.resume() callbacks
have to manage PCI states and device's PM states themselves. They also
need to take care of standard configuration registers.

Switch to generic power management framework using a single
"struct dev_pm_ops" variable to take the unnecessary load from the driver.
This also avoids the need for the driver to directly call most of the PCI
helper functions and device power state control functions, as through
the generic framework PCI Core takes care of the necessary operations,
and drivers are required to do only device-specific jobs.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/aty/aty128fb.c | 51 ++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index d05d4195acad..dd7762fea058 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -162,10 +162,22 @@ static char * const r128_family[] = {
 static int aty128_probe(struct pci_dev *pdev,
                                const struct pci_device_id *ent);
 static void aty128_remove(struct pci_dev *pdev);
-static int aty128_pci_suspend(struct pci_dev *pdev, pm_message_t state);
-static int aty128_pci_resume(struct pci_dev *pdev);
+static int aty128_pci_suspend_late(struct device *dev, pm_message_t state);
+static int __maybe_unused aty128_pci_suspend(struct device *dev);
+static int __maybe_unused aty128_pci_hibernate(struct device *dev);
+static int __maybe_unused aty128_pci_freeze(struct device *dev);
+static int __maybe_unused aty128_pci_resume(struct device *dev);
 static int aty128_do_resume(struct pci_dev *pdev);
 
+static const struct dev_pm_ops aty128_pci_pm_ops = {
+	.suspend	= aty128_pci_suspend,
+	.resume		= aty128_pci_resume,
+	.freeze		= aty128_pci_freeze,
+	.thaw		= aty128_pci_resume,
+	.poweroff	= aty128_pci_hibernate,
+	.restore	= aty128_pci_resume,
+};
+
 /* supported Rage128 chipsets */
 static const struct pci_device_id aty128_pci_tbl[] = {
 	{ PCI_VENDOR_ID_ATI, PCI_DEVICE_ID_ATI_RAGE128_LE,
@@ -272,8 +284,7 @@ static struct pci_driver aty128fb_driver = {
 	.id_table	= aty128_pci_tbl,
 	.probe		= aty128_probe,
 	.remove		= aty128_remove,
-	.suspend	= aty128_pci_suspend,
-	.resume		= aty128_pci_resume,
+	.driver.pm	= &aty128_pci_pm_ops,
 };
 
 /* packed BIOS settings */
@@ -2320,7 +2331,6 @@ static int aty128fb_ioctl(struct fb_info *info, u_int cmd, u_long arg)
 static void aty128_set_suspend(struct aty128fb_par *par, int suspend)
 {
 	u32	pmgt;
-	struct pci_dev *pdev = par->pdev;
 
 	if (!par->pdev->pm_cap)
 		return;
@@ -2347,23 +2357,15 @@ static void aty128_set_suspend(struct aty128fb_par *par, int suspend)
 		aty_st_le32(BUS_CNTL1, 0x00000010);
 		aty_st_le32(MEM_POWER_MISC, 0x0c830000);
 		msleep(100);
-
-		/* Switch PCI power management to D2 */
-		pci_set_power_state(pdev, PCI_D2);
 	}
 }
 
-static int aty128_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int aty128_pci_suspend_late(struct device *dev, pm_message_t state)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct fb_info *info = pci_get_drvdata(pdev);
 	struct aty128fb_par *par = info->par;
 
-	/* Because we may change PCI D state ourselves, we need to
-	 * first save the config space content so the core can
-	 * restore it properly on resume.
-	 */
-	pci_save_state(pdev);
-
 	/* We don't do anything but D2, for now we return 0, but
 	 * we may want to change that. How do we know if the BIOS
 	 * can properly take care of D3 ? Also, with swsusp, we
@@ -2422,6 +2424,21 @@ static int aty128_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
+static int __maybe_unused aty128_pci_suspend(struct device *dev)
+{
+	return aty128_pci_suspend_late(dev, PMSG_SUSPEND);
+}
+
+static int __maybe_unused aty128_pci_hibernate(struct device *dev)
+{
+	return aty128_pci_suspend_late(dev, PMSG_HIBERNATE);
+}
+
+static int __maybe_unused aty128_pci_freeze(struct device *dev)
+{
+	return aty128_pci_suspend_late(dev, PMSG_FREEZE);
+}
+
 static int aty128_do_resume(struct pci_dev *pdev)
 {
 	struct fb_info *info = pci_get_drvdata(pdev);
@@ -2468,12 +2485,12 @@ static int aty128_do_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-static int aty128_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused aty128_pci_resume(struct device *dev)
 {
 	int rc;
 
 	console_lock();
-	rc = aty128_do_resume(pdev);
+	rc = aty128_do_resume(to_pci_dev(dev));
 	console_unlock();
 
 	return rc;
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
