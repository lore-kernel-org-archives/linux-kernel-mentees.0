Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8A4C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Dec 2021 19:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABFC1403A4;
	Wed,  8 Dec 2021 19:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AcGwvq0LxS3N; Wed,  8 Dec 2021 19:33:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 78BE7400FC;
	Wed,  8 Dec 2021 19:33:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5835AC002F;
	Wed,  8 Dec 2021 19:33:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BE4BC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27360828C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A0Ez2eSfH39P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:33:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 398958275A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 19:33:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B2A74B8227D;
 Wed,  8 Dec 2021 19:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7D7C341C7;
 Wed,  8 Dec 2021 19:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638992000;
 bh=nOoqjNV9s//XwN0iRkPsYCk6HiPgVgpB8FkLXH6zPKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ByWisZpVHDM0n7jIKjTe1HpZmZrp6wUl3xMNabqSFvx3jtoIWfQ0wj9pS5gOH69NE
 7cERxV0CHmmp/zgFU/cyAA7Ty09F+guhVHMNXKKf12tvmZUyVIqRnfAtFU7/rRyNmT
 MWgtN8XuA5zo0sOnaSY/8WfPJVpGviHvEqZJGHaXKpayCA/brU+/nnBE4hNkw60MMz
 MUgpd06bnCUn6aFjj6lc4KRtaglYhWhel3qC6D7xYTwX7U2JSp4f7YsdoiAtWv0jXx
 bC6WuHLc1kb8c09zVWvuENeWgPuAByZFbp53Tl+SvjaqqFVNK/kVNh5eT98euKBOOh
 m5y+Sag2w1AzQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@linux.ie>
Subject: [PATCH v3 1/3] amd64-agp: convert to generic power management
Date: Wed,  8 Dec 2021 13:33:03 -0600
Message-Id: <20211208193305.147072-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208193305.147072-1-helgaas@kernel.org>
References: <20211208193305.147072-1-helgaas@kernel.org>
MIME-Version: 1.0
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
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

Convert amd64-agp from legacy PCI power management to the generic power
management framework.

Previously, amd64-agp used legacy PCI power management, and
agp_amd64_suspend() and agp_amd64_resume() were responsible for both
device-specific things and generic PCI things:

  agp_amd64_suspend
    pci_save_state(pdev)                <-- generic PCI
    pci_set_power_state(pdev, pci_choose_state(pdev, state)) <-- generic PCI

  agp_amd64_resume
    pci_set_power_state(pdev, PCI_D0)   <-- generic PCI
    pci_restore_state(pdev)             <-- generic PCI
    nforce3_agp_init()                  <-- device-specific
    amd_8151_configure()                <-- device-specific

With generic power management, the PCI bus PM methods do the generic PCI
things, and the driver needs only the device-specific part, i.e.,

  suspend_devices_and_enter
    dpm_suspend_start(PMSG_SUSPEND)
      pci_pm_suspend                    # PCI bus .suspend() method
        agp_amd64_suspend               <-- not needed at all; removed
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
        agp_amd64_resume                # dev->driver->pm->resume
          nforce3_agp_init()            <-- device-specific
          amd_8151_configure()          <-- device-specific

[bhelgaas: commit log]
Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/char/agp/amd64-agp.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index b40edae32817..dc78a4fb879e 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -588,20 +588,11 @@ static void agp_amd64_remove(struct pci_dev *pdev)
 	agp_bridges_found--;
 }
 
-#ifdef CONFIG_PM
+#define agp_amd64_suspend NULL
 
-static int agp_amd64_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused agp_amd64_resume(struct device *dev)
 {
-	pci_save_state(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
-	return 0;
-}
-
-static int agp_amd64_resume(struct pci_dev *pdev)
-{
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
+	struct pci_dev *pdev = to_pci_dev(dev);
 
 	if (pdev->vendor == PCI_VENDOR_ID_NVIDIA)
 		nforce3_agp_init(pdev);
@@ -609,8 +600,6 @@ static int agp_amd64_resume(struct pci_dev *pdev)
 	return amd_8151_configure();
 }
 
-#endif /* CONFIG_PM */
-
 static const struct pci_device_id agp_amd64_pci_table[] = {
 	{
 	.class		= (PCI_CLASS_BRIDGE_HOST << 8),
@@ -738,15 +727,14 @@ static const struct pci_device_id agp_amd64_pci_promisc_table[] = {
 	{ }
 };
 
+static SIMPLE_DEV_PM_OPS(agp_amd64_pm_ops, agp_amd64_suspend, agp_amd64_resume);
+
 static struct pci_driver agp_amd64_pci_driver = {
 	.name		= "agpgart-amd64",
 	.id_table	= agp_amd64_pci_table,
 	.probe		= agp_amd64_probe,
 	.remove		= agp_amd64_remove,
-#ifdef CONFIG_PM
-	.suspend	= agp_amd64_suspend,
-	.resume		= agp_amd64_resume,
-#endif
+	.driver.pm  = &agp_amd64_pm_ops,
 };
 
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
