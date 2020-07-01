Return-Path: <SRS0=WnLp=AM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35963C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:03:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C37420760
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jul 2020 13:03:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeI6jd5q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C37420760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F077B8BF7B;
	Wed,  1 Jul 2020 13:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLjksB4mcISd; Wed,  1 Jul 2020 13:03:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 52DBC8BF60;
	Wed,  1 Jul 2020 13:03:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40ACFC0865;
	Wed,  1 Jul 2020 13:03:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BAEEC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7AF6C8BF7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKfCV23SiuF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EB4BB8BF60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jul 2020 13:02:58 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id bj10so4665952plb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JaFJ/hx4zZUnfgo4JKE7j2RfbZZGmBOayqe3X94Vna0=;
 b=SeI6jd5qcI4MWoIJWk7OAlSq5pCtb1e//GYnPJkLZHhiMeIN8KTJBOdpjRIOH/FYMA
 8DAayXy3U7R6bWIteOxdM7iLgUKdf/TCVQQzoklLKuKPeXxMSClWpzUH+qzzbr+IPHHE
 HWI/xcb4ZgfbwdnsUyHIsaGri+JAL6KCDcIgGBjUhb5sZGXijZIaCXm9nSMeW4GqKDi3
 or9HMHb0eTQkijuu/JIgEESfmZemF5mRy35T6pn0U5X73aMCbE0thuRw90Q29a5LRap+
 BPyBfgZAakSYWrGBKfJYFJNexoQ6UXRcSeUXDql8oiTHCnq+FBfe9zg4OwQWEDoMMS2z
 TOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JaFJ/hx4zZUnfgo4JKE7j2RfbZZGmBOayqe3X94Vna0=;
 b=GIDZBMmJ0qKslANkkQsKdolJAOEg88WCPS+T4f2Y0AnQ0YzYkeg8OAw+2M6bmEqPkz
 h1v3KQZBu+wHgTiJRSFSazyvoxjOulvKo2FzFZqZHdNVZLHN3NOQW6lua7bVBj6P2wEv
 PwXAduBosgQcmdX5GeExVDRxNK2kogg/RWJiisOcA9Bsj46wj4bSFvC8KBfjwWyfpXaE
 x+VVn1YYIFFePQhkj9dL6i6KEw7+ux0aHMoRJY+zrxC+tcGJkn9d73Ud8eqQrB/+koG2
 IGPMe+djHBCU7XK+jjyNxd8mwiUAavneWyzDx6LNDAPP5khyRyjpY5z/TWhf4l6oYWvw
 VD/A==
X-Gm-Message-State: AOAM533nTJdMr9uSXwniKg0ipYD+ZfkUv3SG0/Oc9HUVv9ReU0r8uPUb
 lp4At6iFLprrV/OpbGi+3to=
X-Google-Smtp-Source: ABdhPJx3ovlqUEBQx59ijfPYg7qUQN4EEBXl/DnS3CPEAZtiq2o8Z6aiBHOM93on8+WyQaN6rBuj7A==
X-Received: by 2002:a17:902:eed4:: with SMTP id
 h20mr802787plb.100.1593608578403; 
 Wed, 01 Jul 2020 06:02:58 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id d9sm6070908pgv.45.2020.07.01.06.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 06:02:57 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 David Dillow <dave@thedillows.org>, Ion Badulescu <ionut@badula.org>,
 Netanel Belgazal <netanel@amazon.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Guy Tzalik <gtzalik@amazon.com>,
 Saeed Bishara <saeedb@amazon.com>, Zorik Machulsky <zorik@amazon.com>,
 Derek Chickles <dchickles@marvell.com>,
 Satanand Burla <sburla@marvell.com>,
 Felix Manlunas <fmanlunas@marvell.com>,
 Denis Kirjanov <kda@linux-powerpc.org>,
 Ajit Khaparde <ajit.khaparde@broadcom.com>,
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
 Somnath Kotur <somnath.kotur@broadcom.com>,
 Tariq Toukan <tariqt@mellanox.com>, Jon Mason <jdmason@kudzu.us>
Date: Wed,  1 Jul 2020 18:29:34 +0530
Message-Id: <20200701125938.639447-8-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
References: <20200701125938.639447-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 07/11] benet: use generic power
	management
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
pci_enable/disable_device(), pci_save/restore_sate() and
pci_set_power_state().

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/emulex/benet/be_main.c | 22 +++++++--------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/emulex/benet/be_main.c b/drivers/net/ethernet/emulex/benet/be_main.c
index a7ac23a6862b..e26f59336cfd 100644
--- a/drivers/net/ethernet/emulex/benet/be_main.c
+++ b/drivers/net/ethernet/emulex/benet/be_main.c
@@ -6037,32 +6037,23 @@ static int be_probe(struct pci_dev *pdev, const struct pci_device_id *pdev_id)
 	return status;
 }
 
-static int be_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused be_suspend(struct device *dev_d)
 {
-	struct be_adapter *adapter = pci_get_drvdata(pdev);
+	struct be_adapter *adapter = dev_get_drvdata(dev_d);
 
 	be_intr_set(adapter, false);
 	be_cancel_err_detection(adapter);
 
 	be_cleanup(adapter);
 
-	pci_save_state(pdev);
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 	return 0;
 }
 
-static int be_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused be_pci_resume(struct device *dev_d)
 {
-	struct be_adapter *adapter = pci_get_drvdata(pdev);
+	struct be_adapter *adapter = dev_get_drvdata(dev_d);
 	int status = 0;
 
-	status = pci_enable_device(pdev);
-	if (status)
-		return status;
-
-	pci_restore_state(pdev);
-
 	status = be_resume(adapter);
 	if (status)
 		return status;
@@ -6234,13 +6225,14 @@ static const struct pci_error_handlers be_eeh_handlers = {
 	.resume = be_eeh_resume,
 };
 
+static SIMPLE_DEV_PM_OPS(be_pci_pm_ops, be_suspend, be_pci_resume);
+
 static struct pci_driver be_driver = {
 	.name = DRV_NAME,
 	.id_table = be_dev_ids,
 	.probe = be_probe,
 	.remove = be_remove,
-	.suspend = be_suspend,
-	.resume = be_pci_resume,
+	.driver.pm = &be_pci_pm_ops,
 	.shutdown = be_shutdown,
 	.sriov_configure = be_pci_sriov_configure,
 	.err_handler = &be_eeh_handlers
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
