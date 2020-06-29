Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2706DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 09:31:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF0B820857
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 09:31:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMnRMopl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF0B820857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E03B725D76;
	Mon, 29 Jun 2020 09:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CyglVfhkGJFM; Mon, 29 Jun 2020 09:31:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0A84325DA8;
	Mon, 29 Jun 2020 09:31:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07337C07FF;
	Mon, 29 Jun 2020 09:31:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBE13C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A1B1988A64
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qms7CxqQcL3O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2548B889D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 09:31:46 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id t11so2799774pfq.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 02:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U8LfJvZ8Suv0UU3L8Vq/myysU79XrKbzAI5mVt1upHA=;
 b=UMnRMoplidwqa2axc+13CTf6GjvG/QKjq19NX5mr89r2PyhZPX2MmNwdhqGn5qo/AE
 M/IV5z4/XD05V3cPZvLn0BS3/ArPV/QS+ZEH9j7MePFM4pBR9FEAf7VN6gytNgMOuzwd
 LpJdF3e/tF391hQub1QawVUYlZHIIYXfYfAVpsYvXVu9lab+VFzIx3/ydCnJKYCUXEmR
 VdWO4gpulSb43KzGvbLkwnqUkfIXscpggHyFGR/ixKo889mdkn9g1akJKYcwTJTY+HIS
 VYxamiq6E56/6ub1rzvsawOCbz6kYBvFRVeo28EdhIndpB5xhclS+Eh+UmAAuX0JpzPp
 egYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U8LfJvZ8Suv0UU3L8Vq/myysU79XrKbzAI5mVt1upHA=;
 b=m4O6Bc8NYLuIG+VRYn/WoedcCZ5TMArUKudZ2X2tmTrctDIfcLGe5BdbJ6iv0XFikP
 MLgwbAM+RAe+qTsSpHcS+YI/7Omc/IinnU031XtiA+v38MnEwzoCtguO4rcAeFGHt0Di
 lUi787HgM2ipO+G6Z/7/0gOo7nFF3KGMHut3ewk6aUogm00kTqTOs76xQKsNZuUL+UFt
 x8VwDUbSyaFSEJUW4qpe/5g/uPhH8o2V8V2GFambL8ImX5PnRIlbMwv+v6ogwVVPp1qu
 y4JUpYhK6AGA9YD4DY7jR3Wk8d9pz6G8HVUEMgmNOUEOktm6aU5G1UMG1EELefVF0EA+
 94jg==
X-Gm-Message-State: AOAM533AZsN6Y/GlgpkkrIcwYL0YwPa/skMlQKmyTAoyBgCZAzhobQOM
 LIk+UkcoK8lYxd9mOuWsn7Q=
X-Google-Smtp-Source: ABdhPJxCrwzkJMp9WcEN5z/vEr5Xrtqg4Z1I1sF8VTyeVMLmhzbwmlekF7t0Va8jyim44rh9w5wtUA==
X-Received: by 2002:a63:b915:: with SMTP id z21mr9981906pge.145.1593423105725; 
 Mon, 29 Jun 2020 02:31:45 -0700 (PDT)
Received: from varodek.localdomain ([106.210.40.90])
 by smtp.gmail.com with ESMTPSA id q20sm2921286pfn.111.2020.06.29.02.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 02:31:45 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Mon, 29 Jun 2020 14:59:43 +0530
Message-Id: <20200629092943.227910-6-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629092943.227910-1-vaibhavgupta40@gmail.com>
References: <20200629092943.227910-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1 5/5] e100: use generic power
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

With legacy PM hooks, it was the responsibility of a driver to manage PCI
states and also the device's power state. The generic approach is to let
PCI core handle the work.

e100_suspend() calls __e100_shutdown() to perform intermediate tasks.
__e100_shutdown() calls pci_save_state() which is not recommended.

e100_suspend() also calls __e100_power_off() which is calling PCI helper
functions, pci_prepare_to_sleep(), pci_set_power_state(), along with
pci_wake_from_d3(...,false). Hence, the functin call is removed and wol is
disabled as earlier using device_wakeup_disable().

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/ethernet/intel/e100.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/intel/e100.c b/drivers/net/ethernet/intel/e100.c
index 1b8d015ebfb0..7506fb5eca8f 100644
--- a/drivers/net/ethernet/intel/e100.c
+++ b/drivers/net/ethernet/intel/e100.c
@@ -2997,8 +2997,6 @@ static void __e100_shutdown(struct pci_dev *pdev, bool *enable_wake)
 		e100_down(nic);
 	netif_device_detach(netdev);
 
-	pci_save_state(pdev);
-
 	if ((nic->flags & wol_magic) | e100_asf(nic)) {
 		/* enable reverse auto-negotiation */
 		if (nic->phy == phy_82552_v) {
@@ -3028,24 +3026,21 @@ static int __e100_power_off(struct pci_dev *pdev, bool wake)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int e100_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused e100_suspend(struct device *dev_d)
 {
 	bool wake;
-	__e100_shutdown(pdev, &wake);
-	return __e100_power_off(pdev, wake);
+	__e100_shutdown(to_pci_dev(dev_d), &wake);
+
+	device_wakeup_disable(dev_d);
+
+	return 0;
 }
 
-static int e100_resume(struct pci_dev *pdev)
+static int __maybe_unused e100_resume(struct device *dev_d)
 {
-	struct net_device *netdev = pci_get_drvdata(pdev);
+	struct net_device *netdev = dev_get_drvdata(dev_d);
 	struct nic *nic = netdev_priv(netdev);
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	/* ack any pending wake events, disable PME */
-	pci_enable_wake(pdev, PCI_D0, 0);
-
 	/* disable reverse auto-negotiation */
 	if (nic->phy == phy_82552_v) {
 		u16 smartspeed = mdio_read(netdev, nic->mii.phy_id,
@@ -3062,7 +3057,6 @@ static int e100_resume(struct pci_dev *pdev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static void e100_shutdown(struct pci_dev *pdev)
 {
@@ -3150,16 +3144,17 @@ static const struct pci_error_handlers e100_err_handler = {
 	.resume = e100_io_resume,
 };
 
+static SIMPLE_DEV_PM_OPS(e100_pm_ops, e100_suspend, e100_resume);
+
 static struct pci_driver e100_driver = {
 	.name =         DRV_NAME,
 	.id_table =     e100_id_table,
 	.probe =        e100_probe,
 	.remove =       e100_remove,
-#ifdef CONFIG_PM
+
 	/* Power Management hooks */
-	.suspend =      e100_suspend,
-	.resume =       e100_resume,
-#endif
+	.driver.pm =	&e100_pm_ops,
+
 	.shutdown =     e100_shutdown,
 	.err_handler = &e100_err_handler,
 };
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
