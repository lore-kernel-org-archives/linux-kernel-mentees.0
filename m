Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404C5C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:37:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B6EC23142
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="poRphb1e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B6EC23142
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0164689379;
	Mon, 29 Jun 2020 07:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1eOK5eKu4CPS; Mon, 29 Jun 2020 07:37:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 796E08929A;
	Mon, 29 Jun 2020 07:37:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72238C07FF;
	Mon, 29 Jun 2020 07:37:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B64E1C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B345B85F7C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajf5Rq95Ls5r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 27C7B85F49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:25 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id i4so7664267pjd.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 00:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ifGLXHxiOienXo0hWvWd74w+f7qa8wNAzzXfNulzp8=;
 b=poRphb1edoRyTwY5xiBnZ6TuYDI2kCd1dYcamUyrK7RqW97yTWRcfNKEAR/DoiwYVV
 RCbv9CM/NsCtcgeaYU/Ra0HAltx0Yf7xUJIB5mOeNgxHI2+ekW5HBWxYI/UvL4rstJCF
 EPZ3ZeGi21q0M2f5RGqY3qbVbv8oQ14Q30a0OwT0r9cMMOAZCw5bH3KfMoN15H3hIps/
 qjp0EE7KBko4vCKVZpkkaJeg4hd7a7+XIHgd7wT/3CCYL/Az03roic1UTZ7MNJEHUhIw
 lxckGX5xNQ0bZJDiRdVu1Ps4xwj53SXbNwY+X5evbb1wZxz5AxI0qdTSyu4KnKAi5vXO
 X3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ifGLXHxiOienXo0hWvWd74w+f7qa8wNAzzXfNulzp8=;
 b=K7/EGNFbGo5LofghXUsZE+82wHSUuz8jKncIaODANA7rwlK0OESqZj/UboPOfcgpjo
 kBCIAqCAA5XF+e3eqttVPFrYvhR/ZoXJ90/kvMzqsJstve3hdL/l+bPa2v0ZvAnMhUra
 G8bDRhOBGIKF/I//lTaaB6aFWc87jUnlOZO0eRU9jFKgeF9AGCeAxoJR5FUbM6Uqi0mc
 T9rVan4bNlqJeDEN3CrV4rVqprlpDckILJ/q7eHpB3wWkn0p4YAIYUVJFwOR93ZePRpp
 MzMzvp//Pz+DV7HqpTd/yU8/GcrLsrNHkFOTu7D2XtkalJz32fGutGBdFQbIyAVFte8z
 v//Q==
X-Gm-Message-State: AOAM530s6Btv49+o8bRuIaEDNz4Dd9VDDxKEv9dVo6oGARjcbFV2QXxv
 j4eGNzdVckolXGArX5xhpuU=
X-Google-Smtp-Source: ABdhPJyBHGFTB+Ll5eDRdlLwQCmQjPO4kU/xjGppeCt2UlKi5yHFmwSOWQd96Y27L1XY8Snd21oWRw==
X-Received: by 2002:a17:902:8305:: with SMTP id
 bd5mr12209336plb.113.1593416244715; 
 Mon, 29 Jun 2020 00:37:24 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id q10sm34673004pfk.86.2020.06.29.00.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 00:37:24 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Mon, 29 Jun 2020 13:05:59 +0530
Message-Id: <20200629073604.205478-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
References: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 1/6] [media] sta2x11: use generic
	power management
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

With legacy PM, drivers themselves were responsible for managing the
device's power states and takes care of register states.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

Thus, there is no need to call the PCI helper functions like
pci_enable_device(), pci_save/restore_sate(), etc.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/sta2x11/sta2x11_vip.c | 63 ++++++-------------------
 1 file changed, 15 insertions(+), 48 deletions(-)

diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index 798574cfad35..56804ab11c2d 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -1167,21 +1167,18 @@ static void sta2x11_vip_remove_one(struct pci_dev *pdev)
 	 */
 }
 
-#ifdef CONFIG_PM
-
 /**
  * sta2x11_vip_suspend - set device into power save mode
- * @pdev: PCI device
- * @state: new state of device
+ * @dev_d: PCI device
  *
  * all relevant registers are saved and an attempt to set a new state is made.
  *
  * return value: 0 always indicate success,
  * even if device could not be disabled. (workaround for hardware problem)
  */
-static int sta2x11_vip_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused sta2x11_vip_suspend(struct device *dev_d)
 {
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pdev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
 	struct sta2x11_vip *vip =
 	    container_of(v4l2_dev, struct sta2x11_vip, v4l2_dev);
 	unsigned long flags;
@@ -1198,15 +1195,8 @@ static int sta2x11_vip_suspend(struct pci_dev *pdev, pm_message_t state)
 		vip->register_save_area[SAVE_COUNT + IRQ_COUNT + i] =
 		    reg_read(vip, registers_to_save[i]);
 	spin_unlock_irqrestore(&vip->slock, flags);
-	/* save pci state */
-	pci_save_state(pdev);
-	if (pci_set_power_state(pdev, pci_choose_state(pdev, state))) {
-		/*
-		 * do not call pci_disable_device on sta2x11 because it
-		 * break all other Bus masters on this EP
-		 */
-		vip->disabled = 1;
-	}
+
+	vip->disabled = 1;
 
 	pr_info("VIP: suspend\n");
 	return 0;
@@ -1214,45 +1204,23 @@ static int sta2x11_vip_suspend(struct pci_dev *pdev, pm_message_t state)
 
 /**
  * sta2x11_vip_resume - resume device operation
- * @pdev : PCI device
- *
- * re-enable device, set PCI state to powered and restore registers.
- * resume normal device operation afterwards.
+ * @dev : PCI device
  *
  * return value: 0, no error.
  *
  * other, could not set device to power on state.
  */
-static int sta2x11_vip_resume(struct pci_dev *pdev)
+static int __maybe_unused sta2x11_vip_resume(struct device *dev_d)
 {
-	struct v4l2_device *v4l2_dev = pci_get_drvdata(pdev);
+	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev_d);
 	struct sta2x11_vip *vip =
 	    container_of(v4l2_dev, struct sta2x11_vip, v4l2_dev);
 	unsigned long flags;
-	int ret, i;
+	int i;
 
 	pr_info("VIP: resume\n");
-	/* restore pci state */
-	if (vip->disabled) {
-		ret = pci_enable_device(pdev);
-		if (ret) {
-			pr_warn("VIP: Can't enable device.\n");
-			return ret;
-		}
-		vip->disabled = 0;
-	}
-	ret = pci_set_power_state(pdev, PCI_D0);
-	if (ret) {
-		/*
-		 * do not call pci_disable_device on sta2x11 because it
-		 * break all other Bus masters on this EP
-		 */
-		pr_warn("VIP: Can't enable device.\n");
-		vip->disabled = 1;
-		return ret;
-	}
 
-	pci_restore_state(pdev);
+	vip->disabled = 0;
 
 	spin_lock_irqsave(&vip->slock, flags);
 	for (i = 1; i < SAVE_COUNT; i++)
@@ -1266,22 +1234,21 @@ static int sta2x11_vip_resume(struct pci_dev *pdev)
 	return 0;
 }
 
-#endif
-
 static const struct pci_device_id sta2x11_vip_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_STMICRO, PCI_DEVICE_ID_STMICRO_VIP)},
 	{0,}
 };
 
+static SIMPLE_DEV_PM_OPS(sta2x11_vip_pm_ops,
+			 sta2x11_vip_suspend,
+			 sta2x11_vip_resume);
+
 static struct pci_driver sta2x11_vip_driver = {
 	.name = KBUILD_MODNAME,
 	.probe = sta2x11_vip_init_one,
 	.remove = sta2x11_vip_remove_one,
 	.id_table = sta2x11_vip_pci_tbl,
-#ifdef CONFIG_PM
-	.suspend = sta2x11_vip_suspend,
-	.resume = sta2x11_vip_resume,
-#endif
+	.driver.pm = &sta2x11_vip_pm_ops,
 };
 
 static int __init sta2x11_vip_init_module(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
