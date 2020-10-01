Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06721C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 07:33:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FA3C206D9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 07:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D72DiC0Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FA3C206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4030686A61;
	Thu,  1 Oct 2020 07:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XpNeanMXn3lW; Thu,  1 Oct 2020 07:33:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 59F4E86AC8;
	Thu,  1 Oct 2020 07:33:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E834C1AD9;
	Thu,  1 Oct 2020 07:33:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD839C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A940386791
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id olrCMp-3Kk9V
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:33:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D9D7B81E21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:33:20 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id o25so3406175pgm.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 00:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MMQaSvH0Kx6bA3nvjTwxRxny7XPXqNvhRkFHeW4802Q=;
 b=D72DiC0Y4x01OSsq8PYVmh2eyPP1awTN2KmJxwDa2llYQkx4PYUuNyQN/dmE6ZDm2P
 NbUUEkSI0e/8ZqqVSO2NmXqzvDVFTO5Sf8Ylmd/SqzLrhK7fx6Pp+5msfOi8tH+43zxS
 yX7dALP9mpNFLvpC++q6WplnJaKkvI2e/vu/Kpvi+U+5no6MKrwTcsZjP7wq+mt0pQae
 1WZ3AHCJrH8Bn9KokXVZd3139UU9OZYe6z3NnnfEMN7/71YgzjgKqMM3F8ErL8Af/WxG
 HCVr0MOemfFzIx3ZjE/PX5wk5UuxEpPlsPjBTwCmDL6o/R5a7FOHlzF4gLBVlPQi67HM
 9DDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MMQaSvH0Kx6bA3nvjTwxRxny7XPXqNvhRkFHeW4802Q=;
 b=rirzwi8tzs09SyFg+TdZQXdKIYsUYqzOsvChqVQdexdhP/0FkngzMlpWH2mMWQucDQ
 5cNEDji4rNf6Mlix9iTTEck18D4hW1cqn+/tn0jtwaTRVTqIO+mxkQ9Pr+emT8D++nwA
 ALtOtLCVO3MWLpz5crC2J6yxDPl7qDihEzAGQYTPeU4bIk09dkEdHWCF9ctmF9r//TWJ
 H3oIN/YPGpsUw0lQvxk5de9k2o4FtrOCtr9Rxy36vcxJ913wn1gs+MXQSyVrgAzQRL76
 Za4bB0QLpMAPags6VwUrEyNzA5NcrSBgK02Dpw3WgORp9Uq6d4Y9GFO+tB1KU4RYbThP
 cW1Q==
X-Gm-Message-State: AOAM533bZU7wmUI+mIwh04/M5SazxTpkbDP8QgRI5s3NaESwxnl3qXGl
 p83cU/QmP/VwIBj8CZFVAGxLLO84ogWQtl2bln0=
X-Google-Smtp-Source: ABdhPJwuU76xzp1pRklPBcovrJe7OwB7CKUmZLAEVCOio2OiSt94fQu2tR4KKcbO4pQVITEWWqgagQ==
X-Received: by 2002:a63:e1a:: with SMTP id d26mr5191223pgl.190.1601537599777; 
 Thu, 01 Oct 2020 00:33:19 -0700 (PDT)
Received: from localhost.localdomain ([49.207.212.76])
 by smtp.gmail.com with ESMTPSA id u14sm5058589pfm.80.2020.10.01.00.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 00:33:18 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Thu,  1 Oct 2020 13:02:20 +0530
Message-Id: <20201001073221.239618-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Petko Manolov <petkan@nucleusys.com>,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH v2] net: usb: rtl8150: prevent
	set_ethernet_addr from setting uninit address
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

When get_registers() fails (which happens when usb_control_msg() fails)
in set_ethernet_addr(), the uninitialized value of node_id gets copied
as the address.

Checking for the return values appropriately, and handling the case
wherein set_ethernet_addr() fails like this, helps in avoiding the
mac address being incorrectly set in this manner.

Reported-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
Tested-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Acked-by: Petko Manolov <petkan@nucleusys.com>
---
Changes in v2:
	* Modified condition checking get_registers()'s return value to 
		ret == sizeof(node_id)
	  for stricter checking in compliance with the new usb_control_msg_recv()
	  API
	* Added Acked-by: Petko Manolov

Since Petko didn't explicitly mention an email-id in his Ack, I put the
email-id present in the MAINTAINERS file. I hope that's not an issue.


 drivers/net/usb/rtl8150.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 733f120c852b..e542a9ab2ff8 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -150,7 +150,7 @@ static const char driver_name [] = "rtl8150";
 **	device related part of the code
 **
 */
-static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
+static int get_registers(rtl8150_t *dev, u16 indx, u16 size, void *data)
 {
 	void *buf;
 	int ret;
@@ -274,12 +274,17 @@ static int write_mii_word(rtl8150_t * dev, u8 phy, __u8 indx, u16 reg)
 		return 1;
 }
 
-static inline void set_ethernet_addr(rtl8150_t * dev)
+static bool set_ethernet_addr(rtl8150_t *dev)
 {
 	u8 node_id[6];
+	int ret;
 
-	get_registers(dev, IDR, sizeof(node_id), node_id);
-	memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));
+	ret = get_registers(dev, IDR, sizeof(node_id), node_id);
+	if (ret == sizeof(node_id)) {
+		memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));
+		return true;
+	}
+	return false;
 }
 
 static int rtl8150_set_mac_address(struct net_device *netdev, void *p)
@@ -909,21 +914,24 @@ static int rtl8150_probe(struct usb_interface *intf,
 		goto out1;
 	}
 	fill_skb_pool(dev);
-	set_ethernet_addr(dev);
-
+	if (!set_ethernet_addr(dev)) {
+		dev_err(&intf->dev, "couldn't set the ethernet address for the device\n");
+		goto out2;
+	}
 	usb_set_intfdata(intf, dev);
 	SET_NETDEV_DEV(netdev, &intf->dev);
 	if (register_netdev(netdev) != 0) {
 		dev_err(&intf->dev, "couldn't register the device\n");
-		goto out2;
+		goto out3;
 	}
 
 	dev_info(&intf->dev, "%s: rtl8150 is detected\n", netdev->name);
 
 	return 0;
 
-out2:
+out3:
 	usb_set_intfdata(intf, NULL);
+out2:
 	free_skb_pool(dev);
 out1:
 	free_all_urbs(dev);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
