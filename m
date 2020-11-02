Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FCAC00A89
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:53:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED0A0206F9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 16:53:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqGb/ojs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED0A0206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8DD1E86A6F;
	Mon,  2 Nov 2020 16:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AmPcOUlO3MyI; Mon,  2 Nov 2020 16:53:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 11FCC86957;
	Mon,  2 Nov 2020 16:53:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 005B9C088B;
	Mon,  2 Nov 2020 16:53:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37D4EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 26B9D87227
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmTKcrl9L31r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:53:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 84CA387225
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 16:53:30 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id z3so5227516pfz.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Nov 2020 08:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+FYzDpJVo6o7vUtMY5MEW3bJWYDQoUDOxT/IdoR7Mtw=;
 b=pqGb/ojsmTzbDiumh4WtNsiJGH606Ide/pZHjT/+BjoFB9KSMAxpV5CQ/t8AKbvQGk
 XCAnGwApPmGusMpujWANyP8+gZo1ZRlaGApYaRePfDufmZHYy99ou3SXZuLmJXd0dWUt
 OKvifn+K0l7/WMND09NwcnDQuNoic84nBqnSOGIpaivKWdYB4YOrccXAwTuZUTvHTyWZ
 GzJ+y2jstwpxTLlbyW/PVd00XF4no1zmuNRnaB7cO9hRqxD1ZkZGWXtQUr1vebklVT5X
 e1GSX3d+E1PCXauLySvGSrl/ZR5kPQCC6NjKFQ2nJqe2TDljCRvMhydQZKWhjnAodB/s
 QVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+FYzDpJVo6o7vUtMY5MEW3bJWYDQoUDOxT/IdoR7Mtw=;
 b=e2P3zdzwhic/kPSpnSyZTW7yR1NLkRAlUmP2E00CEjo1/J+hTAQU4IFG4fqDoVHAy4
 2YFSO/+rSi2XJuSi8iW4EkOmgOyiLtAcx9iiAcqq5hMwyQcYRi63eUg8U5Wo/x0aiYqh
 i31UPZIq3E0/VX2A1uDh9f3V4qecxi57iWLx0E3Ef3RFd/OvFTO0f+5fbKvzwXFl5vRS
 Pci1bRrZzwex/8EWMhoeKc4PKZwVhPBrjQAhz3Jojnjl5Y4gvXhSeMKsvDwI1Pc0L1Qc
 eP9Jn+kL066JtrQNPbk2DHuWZIdKdCegevW7OID20dUtDFUA3dvu3ZgOH/JSs5dUY6+8
 fDmA==
X-Gm-Message-State: AOAM532L484sLiMYpyHWh5Z1aDGFl+jtKZ5nypPuxX74Lq2cq6ctrzUB
 u+RwkP2SqUQVa6o0Jd7x9A4=
X-Google-Smtp-Source: ABdhPJzZ7HDMBFqkm0MG4EFU8WiBbdUVuQB59efLgHWUNo012dsn+LurOxiWFE0CxiU/fLJiJMq5UA==
X-Received: by 2002:aa7:9341:0:b029:18b:b43:6c7 with SMTP id
 1-20020aa793410000b029018b0b4306c7mr3186804pfn.7.1604336010095; 
 Mon, 02 Nov 2020 08:53:30 -0800 (PST)
Received: from varodek.localdomain ([223.179.149.110])
 by smtp.gmail.com with ESMTPSA id t74sm4953233pfc.47.2020.11.02.08.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 08:53:29 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Adam Radford <aradford@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
 Hannes Reinecke <hare@suse.com>, Bradley Grove <linuxdrivers@attotech.com>,
 John Garry <john.garry@huawei.com>, Don Brace <don.brace@microsemi.com>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 Balsundar P <balsundar.p@microchip.com>
Date: Mon,  2 Nov 2020 22:17:17 +0530
Message-Id: <20201102164730.324035-17-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
References: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: [Linux-kernel-mentees] [PATCH v4 16/29] scsi: mpt3sas_scsih: use
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

Drivers should do only device-specific jobs. But in general, drivers using
legacy PCI PM framework for .suspend()/.resume() have to manage many PCI
PM-related tasks themselves which can be done by PCI Core itself. This
brings extra load on the driver and it directly calls PCI helper functions
to handle them.

Switch to the new generic framework by updating function signatures and
define a "struct dev_pm_ops" variable to bind PM callbacks. Also, remove
unnecessary calls to the PCI Helper functions along with the legacy
.suspend & .resume bindings.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/mpt3sas/mpt3sas_scsih.c | 34 +++++++++++-----------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_scsih.c b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
index 2d201558b8fb..bc68544856b9 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_scsih.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
@@ -11084,20 +11084,18 @@ _scsih_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return rv;
 }
 
-#ifdef CONFIG_PM
 /**
  * scsih_suspend - power management suspend main entry point
- * @pdev: PCI device struct
- * @state: PM state change to (usually PCI_D3)
+ * @dev: Device struct
  *
  * Return: 0 success, anything else error.
  */
-static int
-scsih_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused
+scsih_suspend(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct Scsi_Host *shost;
 	struct MPT3SAS_ADAPTER *ioc;
-	pci_power_t device_state;
 	int rc;
 
 	rc = _scsih_get_shost_and_ioc(pdev, &shost, &ioc);
@@ -11108,25 +11106,23 @@ scsih_suspend(struct pci_dev *pdev, pm_message_t state)
 	flush_scheduled_work();
 	scsi_block_requests(shost);
 	_scsih_nvme_shutdown(ioc);
-	device_state = pci_choose_state(pdev, state);
-	ioc_info(ioc, "pdev=0x%p, slot=%s, entering operating state [D%d]\n",
-		 pdev, pci_name(pdev), device_state);
+	ioc_info(ioc, "pdev=0x%p, slot=%s, entering operating state\n",
+		 pdev, pci_name(pdev));
 
-	pci_save_state(pdev);
 	mpt3sas_base_free_resources(ioc);
-	pci_set_power_state(pdev, device_state);
 	return 0;
 }
 
 /**
  * scsih_resume - power management resume main entry point
- * @pdev: PCI device struct
+ * @dev: Device struct
  *
  * Return: 0 success, anything else error.
  */
-static int
-scsih_resume(struct pci_dev *pdev)
+static int __maybe_unused
+scsih_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct Scsi_Host *shost;
 	struct MPT3SAS_ADAPTER *ioc;
 	pci_power_t device_state = pdev->current_state;
@@ -11139,8 +11135,6 @@ scsih_resume(struct pci_dev *pdev)
 	ioc_info(ioc, "pdev=0x%p, slot=%s, previous operating state [D%d]\n",
 		 pdev, pci_name(pdev), device_state);
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
 	ioc->pdev = pdev;
 	r = mpt3sas_base_map_resources(ioc);
 	if (r)
@@ -11151,7 +11145,6 @@ scsih_resume(struct pci_dev *pdev)
 	mpt3sas_base_start_watchdog(ioc);
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 /**
  * scsih_pci_error_detected - Called when a PCI error is detected.
@@ -11453,6 +11446,8 @@ static struct pci_error_handlers _mpt3sas_err_handler = {
 	.resume		= scsih_pci_resume,
 };
 
+static SIMPLE_DEV_PM_OPS(scsih_pm_ops, scsih_suspend, scsih_resume);
+
 static struct pci_driver mpt3sas_driver = {
 	.name		= MPT3SAS_DRIVER_NAME,
 	.id_table	= mpt3sas_pci_table,
@@ -11460,10 +11455,7 @@ static struct pci_driver mpt3sas_driver = {
 	.remove		= scsih_remove,
 	.shutdown	= scsih_shutdown,
 	.err_handler	= &_mpt3sas_err_handler,
-#ifdef CONFIG_PM
-	.suspend	= scsih_suspend,
-	.resume		= scsih_resume,
-#endif
+	.driver.pm	= &scsih_pm_ops,
 };
 
 /**
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
