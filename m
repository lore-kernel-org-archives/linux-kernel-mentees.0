Return-Path: <SRS0=sA50=AN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9B6C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 06:38:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 324F72070C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 06:38:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbUIvX2x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 324F72070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0D4AD253CA;
	Thu,  2 Jul 2020 06:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i16BYYe5w1hc; Thu,  2 Jul 2020 06:38:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6AB2825397;
	Thu,  2 Jul 2020 06:38:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54BBBC0865;
	Thu,  2 Jul 2020 06:38:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB12FC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 06:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E189F253CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 06:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ed6dCHG4tz1Z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 06:38:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id C1B6625397
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 06:38:13 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id a14so7527907pfi.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jul 2020 23:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W5VyTVc6pqjY8BZMU1suOu8lMlrhY2GnLm40n7rAuB0=;
 b=IbUIvX2xeRCHyYUd7UzydP1SUOQdtpQ7YUw75qwVAA8SyoSslClfhEt55hbZnMKoEP
 Patmec2jNBnqKkg9HhJT9jLoX7ObSDNUUaSr4LubH6ZsR45rRT8HSb3zdrPJmtQjU0xc
 IvK0CI5FJW/PGhwYNXpXSVeYMbsYYxi+4TCE3HCTm/CDO5+bqPdjCNlnoKWpwZgdpD5Y
 EHDKsMRmZOnvJnz3wVnOrXoqqh7JhvN4CERKcSWhum35mlk3YJ5VUef1tz5m2DV8Bv5F
 IeepaKgM2ia/9Nh0nERKfwX8miVIJN5KB1MoQrvQ7bfHJqU1ymP1EjU99zOER4+DiTN4
 Dhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W5VyTVc6pqjY8BZMU1suOu8lMlrhY2GnLm40n7rAuB0=;
 b=j8XXb8xLgfYovaMYA57ISphxEmkTNk+PciRsALzjR0CBDSCXMyVFmf/qTDt58U/6OV
 /Egm72vV22ppLI0JkuPv+38vDctZH9frC4UxgnA8ztwuxZJlZnhJ6Rg4qVghL0JSAOM1
 Y8Sod9sQzIgbp8+tbZ8CzhI5VBVFp/P12edlIQ1ZEDFELrgoFdVzzXiZQVE3wHBC2ONX
 7Z+N9NRPrqKqYUw66grxydiItTr89A56T2XuOjsze+c7IEj7qFOgGuFo+EEzpo52NiNc
 jKlozEtkjG7399PurgOEqgL4CFfbzuWmnDxuy1WGUwmY0G/bPf+yEq7eSrT78z19TiQN
 xbew==
X-Gm-Message-State: AOAM5330ON9ZyyWVPAwEki1+TUfwUCgbn/3yOLuhRVeMCXSOuD6/9HXc
 nifrEhyyohbqvgPot3rtT2Q=
X-Google-Smtp-Source: ABdhPJwx5JOu/vxym75bmMwsktikujKgXS2aJ7oyts4Vwr63mim+pdRxfm7TTLCStHcWjP0zIbOhlA==
X-Received: by 2002:a62:f206:: with SMTP id m6mr14228672pfh.260.1593671893294; 
 Wed, 01 Jul 2020 23:38:13 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id l12sm7523549pff.212.2020.07.01.23.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 23:38:12 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>
Date: Thu,  2 Jul 2020 12:06:31 +0530
Message-Id: <20200702063632.289959-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702063632.289959-1-vaibhavgupta40@gmail.com>
References: <20200702063632.289959-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 1/2] netxen_nic: use generic power
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
device's power states and takes care of register states. And they use PCI
helper functions to do it.

After upgrading to the generic structure, PCI core will take care of
required tasks and drivers should do only device-specific operations.

In this driver:
netxen_nic_resume() calls netxen_nic_attach_func() which then invokes PCI
helper functions like pci_enable_device(), pci_set_power_state() and
pci_restore_state(). Other function:
 - netxen_io_slot_reset()
also calls netxen_nic_attach_func().

Also, netxen_io_slot_reset() returns specific value based on the return value
of netxen_nic_attach_func() as whole. Thus, cannot simply move some piece of
code from netxen_nic_attach_func() to it.

Hence, define a new function netxen_nic_attach_late_func() to do the tasks
which has to be done after PCI helper functions have done their job.

Now, netxen_nic_attach_func() invokes netxen_nic_attach_late_func(), thus
netxen_io_slot_reset() behaves normally.
And, netxen_nic_resume() calls netxen_nic_attach_late_func() to avoid PCI
helper functions calls.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 .../ethernet/qlogic/netxen/netxen_nic_main.c  | 59 +++++++++----------
 1 file changed, 28 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
index 8067ea04d455..f21847739ef1 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
@@ -1695,19 +1695,13 @@ static void netxen_nic_detach_func(struct netxen_adapter *adapter)
 	clear_bit(__NX_RESETTING, &adapter->state);
 }
 
-static int netxen_nic_attach_func(struct pci_dev *pdev)
+static int netxen_nic_attach_late_func(struct pci_dev *pdev)
 {
 	struct netxen_adapter *adapter = pci_get_drvdata(pdev);
 	struct net_device *netdev = adapter->netdev;
 	int err;
 
-	err = pci_enable_device(pdev);
-	if (err)
-		return err;
-
-	pci_set_power_state(pdev, PCI_D0);
 	pci_set_master(pdev);
-	pci_restore_state(pdev);
 
 	adapter->ahw.crb_win = -1;
 	adapter->ahw.ocm_win = -1;
@@ -1741,6 +1735,20 @@ static int netxen_nic_attach_func(struct pci_dev *pdev)
 	return err;
 }
 
+static int netxen_nic_attach_func(struct pci_dev *pdev)
+{
+	int err;
+
+	err = pci_enable_device(pdev);
+	if (err)
+		return err;
+
+	pci_set_power_state(pdev, PCI_D0);
+	pci_restore_state(pdev);
+
+	return netxen_nic_attach_late_func(pdev);
+}
+
 static pci_ers_result_t netxen_io_error_detected(struct pci_dev *pdev,
 						pci_channel_state_t state)
 {
@@ -1785,36 +1793,24 @@ static void netxen_nic_shutdown(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-#ifdef CONFIG_PM
-static int
-netxen_nic_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused
+netxen_nic_suspend(struct device *dev_d)
 {
-	struct netxen_adapter *adapter = pci_get_drvdata(pdev);
-	int retval;
+	struct netxen_adapter *adapter = dev_get_drvdata(dev_d);
 
 	netxen_nic_detach_func(adapter);
 
-	retval = pci_save_state(pdev);
-	if (retval)
-		return retval;
-
-	if (netxen_nic_wol_supported(adapter)) {
-		pci_enable_wake(pdev, PCI_D3cold, 1);
-		pci_enable_wake(pdev, PCI_D3hot, 1);
-	}
-
-	pci_disable_device(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
+	if (netxen_nic_wol_supported(adapter))
+		device_wakeup_enable(dev_d);
 
 	return 0;
 }
 
-static int
-netxen_nic_resume(struct pci_dev *pdev)
+static int __maybe_unused
+netxen_nic_resume(struct device *dev_d)
 {
-	return netxen_nic_attach_func(pdev);
+	return netxen_nic_attach_late_func(to_pci_dev(dev_d));
 }
-#endif
 
 static int netxen_nic_open(struct net_device *netdev)
 {
@@ -3448,15 +3444,16 @@ static const struct pci_error_handlers netxen_err_handler = {
 	.slot_reset = netxen_io_slot_reset,
 };
 
+static SIMPLE_DEV_PM_OPS(netxen_nic_pm_ops,
+			 netxen_nic_suspend,
+			 netxen_nic_resume);
+
 static struct pci_driver netxen_driver = {
 	.name = netxen_nic_driver_name,
 	.id_table = netxen_pci_tbl,
 	.probe = netxen_nic_probe,
 	.remove = netxen_nic_remove,
-#ifdef CONFIG_PM
-	.suspend = netxen_nic_suspend,
-	.resume = netxen_nic_resume,
-#endif
+	.driver.pm = &netxen_nic_pm_ops,
 	.shutdown = netxen_nic_shutdown,
 	.err_handler = &netxen_err_handler
 };
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
