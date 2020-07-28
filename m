Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3EAC433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 11:43:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 165D82075D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 11:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSE8zMPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 165D82075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BDB8A876FE;
	Tue, 28 Jul 2020 11:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HKIrO1U1qljC; Tue, 28 Jul 2020 11:43:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0E7528695C;
	Tue, 28 Jul 2020 11:43:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D85A4C004F;
	Tue, 28 Jul 2020 11:43:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E7CAC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 46CF0235AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aNbw9srFW-71
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:42:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 8450623426
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:42:58 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id d1so9759450plr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 04:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f5JgTl1mn5uTL5N69LqaGIrNSHZWhpmutap+rp0hNP0=;
 b=qSE8zMPz4HChumx8PDMwOaYF2rRJWxIIMo8kuHhth2sYL9IYEIb3bChYfV3oa/kSKv
 sZ4OGF199JWu+Hc1qr/mGhMFHaRXzlepCvLSAD9lUJvs4uupqAIcwLgUY1I25tLGKZj/
 p4gfzXLs41fKxuUPjegTGU1x2WI2i7651GdHCCbLrmmuWrnkrVn+cH5JtI+c9dlREyde
 qyTVbXjUFVv/onHHSuhncCINST4ERMc1qBndiKDfS+lLzZ3hkItgqgJ1/lOpcyV1c5W3
 s+TEY/H1QxuhZisKKsCwnGskAYUYlW3CS1tVU9oK2b67eCA8OeJt3E8mSD+ZCDKdT6Qx
 4ZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f5JgTl1mn5uTL5N69LqaGIrNSHZWhpmutap+rp0hNP0=;
 b=cLgWZdyWOxkpvhW0sjsdK0CAcrLGkcTrqiR5LUnbRFz94GB/8ZBHsjrLaS8Up6nL2R
 Y2vnWbZyFCLJG7n9ZmQVIGnJEo5LKWG0R+kW0WyzItCOfjHZNDcThv+ARdkQYYplRpTq
 d4uRID0bu+tdy2FyFyDyP82WiHRmzW50LdTrcK8sYowc1ne8HWwHmabGczqK6vufjMjl
 IaeCjuLiR6AJoyl5khyEaWkBufdVZoe/zNcGaHJYAh7r63Gq4bud1UuXfBxnJe/KqP0s
 Z1z5MpS5f0KHCzzdVXYzPGJzQ5EUyygz6IOr2A7F0J1wV6QP5cEzRC6nk4uNJbOrKuyg
 HY5A==
X-Gm-Message-State: AOAM5321876ui96yPgDALtTG2BNcSb4QP9EliYr0y6zxXbIg6gd7caM2
 K0N5+LYNs2sck67FMQ+Kvsk=
X-Google-Smtp-Source: ABdhPJyp4u8cmwBfLx7giHjgA2KCYor0/RYxbOjGsQ/FZqFeau9qvpJOeeLDow5oAtz4aszE55hIVg==
X-Received: by 2002:a17:902:b18b:: with SMTP id
 s11mr23283675plr.152.1595936577971; 
 Tue, 28 Jul 2020 04:42:57 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
 by smtp.gmail.com with ESMTPSA id 66sm19157012pfg.63.2020.07.28.04.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 04:42:57 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kalle Valo <kvalo@codeaurora.org>, Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Jul 2020 17:11:28 +0530
Message-Id: <20200728114128.1218310-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v1] wireless: airo: use generic power
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
 drivers/net/wireless/cisco/airo.c | 39 +++++++++++++++----------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/cisco/airo.c b/drivers/net/wireless/cisco/airo.c
index 827bb6d74815..f9627fa360a2 100644
--- a/drivers/net/wireless/cisco/airo.c
+++ b/drivers/net/wireless/cisco/airo.c
@@ -74,16 +74,19 @@ MODULE_DEVICE_TABLE(pci, card_ids);
 
 static int airo_pci_probe(struct pci_dev *, const struct pci_device_id *);
 static void airo_pci_remove(struct pci_dev *);
-static int airo_pci_suspend(struct pci_dev *pdev, pm_message_t state);
-static int airo_pci_resume(struct pci_dev *pdev);
+static int __maybe_unused airo_pci_suspend(struct device *dev);
+static int __maybe_unused airo_pci_resume(struct device *dev);
+
+static SIMPLE_DEV_PM_OPS(airo_pci_pm_ops,
+			 airo_pci_suspend,
+			 airo_pci_resume);
 
 static struct pci_driver airo_driver = {
-	.name     = DRV_NAME,
-	.id_table = card_ids,
-	.probe    = airo_pci_probe,
-	.remove   = airo_pci_remove,
-	.suspend  = airo_pci_suspend,
-	.resume   = airo_pci_resume,
+	.name      = DRV_NAME,
+	.id_table  = card_ids,
+	.probe     = airo_pci_probe,
+	.remove    = airo_pci_remove,
+	.driver.pm = &airo_pci_pm_ops,
 };
 #endif /* CONFIG_PCI */
 
@@ -5573,9 +5576,9 @@ static void airo_pci_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-static int airo_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused airo_pci_suspend(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct airo_info *ai = dev->ml_priv;
 	Cmd cmd;
 	Resp rsp;
@@ -5591,25 +5594,21 @@ static int airo_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 		return -EAGAIN;
 	disable_MAC(ai, 0);
 	netif_device_detach(dev);
-	ai->power = state;
+	ai->power = PMSG_SUSPEND;
 	cmd.cmd = HOSTSLEEP;
 	issuecommand(ai, &cmd, &rsp);
 
-	pci_enable_wake(pdev, pci_choose_state(pdev, state), 1);
-	pci_save_state(pdev);
-	pci_set_power_state(pdev, pci_choose_state(pdev, state));
+	device_wakeup_enable(dev_d);
 	return 0;
 }
 
-static int airo_pci_resume(struct pci_dev *pdev)
+static int __maybe_unused airo_pci_resume(struct device *dev_d)
 {
-	struct net_device *dev = pci_get_drvdata(pdev);
+	struct net_device *dev = dev_get_drvdata(dev_d);
 	struct airo_info *ai = dev->ml_priv;
-	pci_power_t prev_state = pdev->current_state;
+	pci_power_t prev_state = to_pci_dev(dev_d)->current_state;
 
-	pci_set_power_state(pdev, PCI_D0);
-	pci_restore_state(pdev);
-	pci_enable_wake(pdev, PCI_D0, 0);
+	device_wakeup_disable(dev_d);
 
 	if (prev_state != PCI_D1) {
 		reset_card(dev, 0);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
