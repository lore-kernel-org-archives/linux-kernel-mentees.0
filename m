Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5406EC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Dec 2021 19:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18C0F82893;
	Wed,  8 Dec 2021 19:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t_aKktNvRwaU; Wed,  8 Dec 2021 19:25:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 232DA82849;
	Wed,  8 Dec 2021 19:25:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1100FC002F;
	Wed,  8 Dec 2021 19:25:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55C93C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3807582897
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fzrLQNPFJIsc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27B778283D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:25:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8E468B8227F;
 Wed,  8 Dec 2021 19:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D37C341CB;
 Wed,  8 Dec 2021 19:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638991509;
 bh=QEAVmPKcbfLK9UF+RR+mmCH6uory5+56xfMjGTff7FY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nAdq+tksKQ3hlZEqT10fOP6xA7lKP5QPDC06I2bBBoUMVqqWW8SCL266In7VpfjHd
 Kji4QnM6n8tOUf2IdRQZbtSjlrGZDKJQwr2HtGy8B8ZIQ0eZX+Xdx5ldePVJEkYlHP
 KetpquO0IFceCBeiQRkxHfl4RqguH3piC/ResGC5Ci46mXlCGmARbROvwdC8N3EMXl
 9H9IZyydEWfRXqa8CFzNXj1lK6jxNEtN3He5g1rlSScuqnF7UKLKDUSNguBuXCVzcx
 MZ4emoKEdrYJttnVPKAUwQ91lSIoq+C72IeV3x7a6U2bF80IP4HpA2QGnBZe1yhY3n
 y0TxmDn02gkvA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>
Subject: [PATCH v5 3/4] mtip32xx: convert to generic power management
Date: Wed,  8 Dec 2021 13:24:48 -0600
Message-Id: <20211208192449.146076-4-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208192449.146076-1-helgaas@kernel.org>
References: <20211208192449.146076-1-helgaas@kernel.org>
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

From: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Convert mtip32xx from legacy PCI power management to the generic power
management framework.

Previously, mtip32xx used legacy PCI power management, where
mtip_pci_suspend() and mtip_pci_resume() were responsible for both
device-specific things and generic PCI things:

  mtip_pci_suspend
    mtip_block_suspend(dd)              <-- device-specific
    pci_save_state(pdev)                <-- generic PCI
    pci_set_power_state(pdev, pci_choose_state(pdev, state))

  mtip_pci_resume
    pci_set_power_state(PCI_D0)         <-- generic PCI
    pci_restore_state(pdev)             <-- generic PCI
    pcim_enable_device(pdev)            <-- generic PCI
    pci_set_master(pdev)                <-- generic PCI
    mtip_block_resume(dd)               <-- device-specific

With generic power management, the PCI bus PM methods do the generic PCI
things, and the driver needs only the device-specific part, i.e.,

  suspend_devices_and_enter
    dpm_suspend_start(PMSG_SUSPEND)
      pci_pm_suspend                    # PCI bus .suspend() method
        mtip_pci_suspend                # dev->driver->pm->suspend
          mtip_block_suspend            <-- device-specific
    suspend_enter
      dpm_suspend_noirq(PMSG_SUSPEND)
        pci_pm_suspend_noirq            # PCI bus .suspend_noirq() method
          pci_save_state                <-- generic PCI
          pci_prepare_to_sleep          <-- generic PCI
            pci_set_power_state
    ...
    dpm_resume_end(PMSG_RESUME)
      pci_pm_resume                     # PCI bus .resume() method
        pci_restore_standard_config
          pci_set_power_state(PCI_D0)   <-- generic PCI
          pci_restore_state             <-- generic PCI
        mtip_pci_resume                 # dev->driver->pm->resume
          mtip_block_resume             <-- device-specific

[bhelgaas: commit log]
Link: https://lore.kernel.org/r/20210114115423.52414-2-vaibhavgupta40@gmail.com
Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/block/mtip32xx/mtip32xx.c | 48 +++++++------------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index 894020aaaaeb..368b3c4e0744 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -4144,30 +4144,17 @@ static void mtip_pci_remove(struct pci_dev *pdev)
  *	0  Success
  *	<0 Error
  */
-static int mtip_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
+static int __maybe_unused mtip_pci_suspend(struct device *dev)
 {
 	int rv = 0;
-	struct driver_data *dd = pci_get_drvdata(pdev);
+	struct driver_data *dd = dev_get_drvdata(dev);
 
 	set_bit(MTIP_DDF_RESUME_BIT, &dd->dd_flag);
 
 	/* Disable ports & interrupts then send standby immediate */
 	rv = mtip_block_suspend(dd);
-	if (rv < 0) {
-		dev_err(&pdev->dev,
-			"Failed to suspend controller\n");
-		return rv;
-	}
-
-	/*
-	 * Save the pci config space to pdev structure &
-	 * disable the device
-	 */
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-
-	/* Move to Low power state*/
-	pci_set_power_state(pdev, PCI_D3hot);
+	if (rv < 0)
+		dev_err(dev, "Failed to suspend controller\n");
 
 	return rv;
 }
@@ -4179,25 +4166,10 @@ static int mtip_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
  *      0  Success
  *      <0 Error
  */
-static int mtip_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused mtip_pci_resume(struct device *dev)
 {
 	int rv = 0;
-	struct driver_data *dd = pci_get_drvdata(pdev);
-
-	/* Move the device to active State */
-	pci_set_power_state(pdev, PCI_D0);
-
-	/* Restore PCI configuration space */
-	pci_restore_state(pdev);
-
-	/* Enable the PCI device*/
-	rv = pcim_enable_device(pdev);
-	if (rv < 0) {
-		dev_err(&pdev->dev,
-			"Failed to enable card during resume\n");
-		goto err;
-	}
-	pci_set_master(pdev);
+	struct driver_data *dd = dev_get_drvdata(dev);
 
 	/*
 	 * Calls hbaReset, initPort, & startPort function
@@ -4205,9 +4177,8 @@ static int mtip_pci_resume(struct pci_dev *pdev)
 	 */
 	rv = mtip_block_resume(dd);
 	if (rv < 0)
-		dev_err(&pdev->dev, "Unable to resume\n");
+		dev_err(dev, "Unable to resume\n");
 
-err:
 	clear_bit(MTIP_DDF_RESUME_BIT, &dd->dd_flag);
 
 	return rv;
@@ -4238,14 +4209,15 @@ static const struct pci_device_id mtip_pci_tbl[] = {
 	{ 0 }
 };
 
+static SIMPLE_DEV_PM_OPS(mtip_pci_pm_ops, mtip_pci_suspend, mtip_pci_resume);
+
 /* Structure that describes the PCI driver functions. */
 static struct pci_driver mtip_pci_driver = {
 	.name			= MTIP_DRV_NAME,
 	.id_table		= mtip_pci_tbl,
 	.probe			= mtip_pci_probe,
 	.remove			= mtip_pci_remove,
-	.suspend		= mtip_pci_suspend,
-	.resume			= mtip_pci_resume,
+	.driver.pm		= &mtip_pci_pm_ops,
 	.shutdown		= mtip_pci_shutdown,
 };
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
