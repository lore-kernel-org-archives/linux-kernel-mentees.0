Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9890C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 03:33:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE9AB206C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 03:33:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqUbKDPj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE9AB206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 811648914A;
	Mon, 29 Jun 2020 03:33:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gXOudi528mB7; Mon, 29 Jun 2020 03:33:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F223C890BF;
	Mon, 29 Jun 2020 03:33:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E893FC0865;
	Mon, 29 Jun 2020 03:33:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B41AC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 03:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 14A0C885DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 03:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7DLw0XNmDseP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 03:33:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8C4C0884C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 03:33:49 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id q90so6653369pjh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 28 Jun 2020 20:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7pdRoNIQxLUhqhAFVYUae+IUaVMSVu90O9pRkmyfRUE=;
 b=MqUbKDPjHH58VRvfEM2e92nSMSPFLGr5x6g3CwqokrXG1vPxG9oLly8UdNxcmNw5Ec
 0LktYxO4eNegwhMlYslnFZMwLRCJaS3SN7SGl4pwL+NC+SYYlVp+exdAVheZUiurtO2c
 a3GdngVZa4nXZF4aun5KUhUB7W+E7Wmc1pnmVr26bP6QHfSna1+t6jMRabhKvcktIWCn
 ZNgN5keoSqkesztuPVcDuEmpKhq4GXOU1eaWgyVZWBZTeqkke+2anAqt4L88bMknM935
 Chmlc1Trfqqobs2DS2LW0z70HB0/Afsvww1SRIMAQzYqm3xRthsU6QMuAwcRqcjRrkq6
 MP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pdRoNIQxLUhqhAFVYUae+IUaVMSVu90O9pRkmyfRUE=;
 b=DOmSwL/D6BZ++Ph1OiTmR/9F6kEOTKLLl92sEfvGLIgqySIi1pgsP3nMKF9sJJ/5Q5
 SFVxi9w72eYlAUCbIrc4X1sSOixkuVeWKlggMctnS94T/7EJXjgLXb4nXEDz5aVEswg0
 MYO/J/92XxY2a4h1L1I3lTpyS/jPtIBdNZEpDGV+bFIdEFWTiq1zXRCrnwDhDI0VqHhl
 9V4g/0vGX9BpKwIlslhVArFludQEon49ur82s66zMMj2Z0ANd2jqa9d9rZiDnJToL4ap
 ooxSlhNfgFTKRISv/uthfSBB7yG56x3X4z1V981/V3J5lujeIp2UODnYHEYjaREf5qbf
 PaIQ==
X-Gm-Message-State: AOAM533n8hKu2yzFNbmDH8K1/a6NzoyohhR+MpECQzk1l6b0oV4IiFuc
 7j4vfZoOX0AOCsqtojnqOj4=
X-Google-Smtp-Source: ABdhPJxW85j1R52gBwd6LuoKKZoh8q7FkbIGlammyJyNseWZVtXqEJ6qUePxGnkFeWcr1P3HrEa/zA==
X-Received: by 2002:a17:90a:89:: with SMTP id a9mr14232333pja.27.1593401629174; 
 Sun, 28 Jun 2020 20:33:49 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id e191sm10679196pfh.42.2020.06.28.20.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:33:48 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>
Date: Mon, 29 Jun 2020 09:02:25 +0530
Message-Id: <20200629033226.160936-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629033226.160936-1-vaibhavgupta40@gmail.com>
References: <20200629033226.160936-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 1/2] ipw2100: use generic power
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

The driver was invoking PCI helper functions like pci_save/restore_state(),
pci_enable/disable_device() and pci_set_power_state(), which is not
recommended.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/net/wireless/intel/ipw2x00/ipw2100.c | 31 +++++---------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2100.c b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
index 624fe721e2b5..57ce55728808 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2100.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
@@ -6397,10 +6397,9 @@ static void ipw2100_pci_remove_one(struct pci_dev *pci_dev)
 	IPW_DEBUG_INFO("exit\n");
 }
 
-#ifdef CONFIG_PM
-static int ipw2100_suspend(struct pci_dev *pci_dev, pm_message_t state)
+static int __maybe_unused ipw2100_suspend(struct device *dev_d)
 {
-	struct ipw2100_priv *priv = pci_get_drvdata(pci_dev);
+	struct ipw2100_priv *priv = dev_get_drvdata(dev_d);
 	struct net_device *dev = priv->net_dev;
 
 	IPW_DEBUG_INFO("%s: Going into suspend...\n", dev->name);
@@ -6414,10 +6413,6 @@ static int ipw2100_suspend(struct pci_dev *pci_dev, pm_message_t state)
 	/* Remove the PRESENT state of the device */
 	netif_device_detach(dev);
 
-	pci_save_state(pci_dev);
-	pci_disable_device(pci_dev);
-	pci_set_power_state(pci_dev, PCI_D3hot);
-
 	priv->suspend_at = ktime_get_boottime_seconds();
 
 	mutex_unlock(&priv->action_mutex);
@@ -6425,11 +6420,11 @@ static int ipw2100_suspend(struct pci_dev *pci_dev, pm_message_t state)
 	return 0;
 }
 
-static int ipw2100_resume(struct pci_dev *pci_dev)
+static int __maybe_unused ipw2100_resume(struct device *dev_d)
 {
+	struct pci_dev *pci_dev = to_pci_dev(dev_d);
 	struct ipw2100_priv *priv = pci_get_drvdata(pci_dev);
 	struct net_device *dev = priv->net_dev;
-	int err;
 	u32 val;
 
 	if (IPW2100_PM_DISABLED)
@@ -6439,16 +6434,6 @@ static int ipw2100_resume(struct pci_dev *pci_dev)
 
 	IPW_DEBUG_INFO("%s: Coming out of suspend...\n", dev->name);
 
-	pci_set_power_state(pci_dev, PCI_D0);
-	err = pci_enable_device(pci_dev);
-	if (err) {
-		printk(KERN_ERR "%s: pci_enable_device failed on resume\n",
-		       dev->name);
-		mutex_unlock(&priv->action_mutex);
-		return err;
-	}
-	pci_restore_state(pci_dev);
-
 	/*
 	 * Suspend/Resume resets the PCI configuration space, so we have to
 	 * re-disable the RETRY_TIMEOUT register (0x41) to keep PCI Tx retries
@@ -6473,7 +6458,6 @@ static int ipw2100_resume(struct pci_dev *pci_dev)
 
 	return 0;
 }
-#endif
 
 static void ipw2100_shutdown(struct pci_dev *pci_dev)
 {
@@ -6539,15 +6523,14 @@ static const struct pci_device_id ipw2100_pci_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, ipw2100_pci_id_table);
 
+static SIMPLE_DEV_PM_OPS(ipw2100_pm_ops, ipw2100_suspend, ipw2100_resume);
+
 static struct pci_driver ipw2100_pci_driver = {
 	.name = DRV_NAME,
 	.id_table = ipw2100_pci_id_table,
 	.probe = ipw2100_pci_init_one,
 	.remove = ipw2100_pci_remove_one,
-#ifdef CONFIG_PM
-	.suspend = ipw2100_suspend,
-	.resume = ipw2100_resume,
-#endif
+	.driver.pm = &ipw2100_pm_ops,
 	.shutdown = ipw2100_shutdown,
 };
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
