Return-Path: <SRS0=sA50=AN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2615C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 17:03:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9C5D2088E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Jul 2020 17:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lw8XSKrr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9C5D2088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C53B8A6BF;
	Thu,  2 Jul 2020 17:03:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TEsCMNHI0cww; Thu,  2 Jul 2020 17:03:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 084A18A6BB;
	Thu,  2 Jul 2020 17:03:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1078C0890;
	Thu,  2 Jul 2020 17:03:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9E76C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B55488AD3E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtUIFmT70RSB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:03:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1F3868AD39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Jul 2020 17:03:12 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id f3so13769995pgr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Jul 2020 10:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W5VyTVc6pqjY8BZMU1suOu8lMlrhY2GnLm40n7rAuB0=;
 b=lw8XSKrr5R/+fyQQeJMjkgEzCec8sITna2+ApqYBDDDuP2Q+k8POoHJEaijRIP719z
 9pfOjFTijV2v6snbvasYFt1TJf0GEO7xQFArYI26JjsNt3dG+UFAQaSUjR4GTsYZWbCu
 3QsaDvuZra/FuKV5i5S2KdcEWqZzUxawi0WeLDCNtQJmKul8IORwg0cWQVduZIpAyDw0
 HO3lA8sOK2F1yZo9e9NfRoaSUW9pf1uq1TvlKpuR/0/IFyCrNY3+cFM//jkdgUKnBu31
 TfKhFMfLM7zuCKJIikQvZXxiiCWaBYx7SHbbwF3cTtgUlWerQZDYxJASDHGZQbeGEkb3
 Eb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W5VyTVc6pqjY8BZMU1suOu8lMlrhY2GnLm40n7rAuB0=;
 b=mFlCBW8lnGrku5m8mhAwF3I4+MHF1/6Uol+kESfYkzTF1gxvtyNJASoa9ysXNbosMU
 Plr94QJ2eica+v3RsrsFMTobyjWP+xMoM5GtLcPG00iHnAxIfgqMzbai8XOXAgpltRbN
 Ny/aOjf43KsLlOPzOs+6EDtLV9OVVFzj7kxw0SyrCvtmimw8F9scL9VligNO44cEtrIt
 dzROMGLhE45dE7YdvbQnz5GKh0z/E5horoKmXLUKjt40npv0PeppvgPYp7Wq7j1UGSK0
 dO8yNNIQYB1mDt6k5jUWuURTG/l2vTM7J3LJ29QS5pXireGde+2PzMo/kGTT4j01zpvY
 osOg==
X-Gm-Message-State: AOAM531B3YdKliz6Sk+ZztpTJdn0S9vWEM4DxMZu4Mh1o1pNmkL7kehS
 7X9V1suePtpyH3jfc8dCybc=
X-Google-Smtp-Source: ABdhPJzyKVB3sQNjJvh3UVpGVPmDot9e6Xhw6CRDWZDxX1kg17Buad1H/qLXg3vLeB61OsRu6iufsw==
X-Received: by 2002:a63:215e:: with SMTP id s30mr14633116pgm.87.1593709391612; 
 Thu, 02 Jul 2020 10:03:11 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id j21sm9230429pfa.133.2020.07.02.10.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 10:03:11 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>
Date: Thu,  2 Jul 2020 22:31:42 +0530
Message-Id: <20200702170143.27201-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702170143.27201-1-vaibhavgupta40@gmail.com>
References: <20200702170143.27201-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 1/2] netxen_nic: use generic power
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
