Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DDCC4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 08:21:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C00A20739
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 08:21:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t5XTKkDj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C00A20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 252B7870B6;
	Tue, 29 Sep 2020 08:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eqif8ec707LL; Tue, 29 Sep 2020 08:21:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 29255870B7;
	Tue, 29 Sep 2020 08:21:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 125A1C0889;
	Tue, 29 Sep 2020 08:21:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9690C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 08:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 848EA203F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 08:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F9yShM4OGTba
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 08:21:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 3E5942034D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 08:21:15 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d13so3247443pgl.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 01:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2IG2LUHqbbcHboNgwqS1w0pMbuO40GaU7Cwhtd/F7+A=;
 b=t5XTKkDj9sdkpQ8SO5mAnE6QPYPgPaXdVXF3frmYCydG4TCOwlyppJl5k694T60cOl
 n4uKdFeZFmDZyreOOd0rLorkaBkJixrJtiGaz2fsRtszrdL7NnitD9jpDLGr+G6HsgRF
 dmDGL5+IZH/D5PyMq2//BPGtvJfKEfaU1KU/hMsGzGil4AUBeXjrJMHwjjEnPNwjogSk
 rWVP6dpXvpzJ7hJ055I4m+gaAT0wCzget4UASB9nm2bP68cN5Ygkz7MoUBXSrIN08SXg
 J32SoRqMv/NK8aoBwZn+FOQUj3ubWAdPh94W9Vvs/0eEmXk+MaV5ayqVPHYkDfwd+zkm
 aSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2IG2LUHqbbcHboNgwqS1w0pMbuO40GaU7Cwhtd/F7+A=;
 b=raemC2NL3fDxkSgg/GGpjeCTlm81Bj53RZ1ek8xrJlo3pZlsMP82/HwJl3dj+Wqwbz
 PVVXan7eaJJ1zdE0/DzIivbrj1E0cMMKEFKv0ndNYzQhr1JLPEFJCNVbzUIfTH81j7wL
 KUVHKiSglx6c4+b/aXQR8JPYvHaLw8AaNcQxknz3Wp3vHMUou71qZPUxOJuNF46XYzBC
 vs1kxDS9E0xYtKZAxo82T9TJQocb9ZSumYcsagv5LVSYnIzjS03R3dgAANEnswgR8Tzx
 y3mWKCL9ZRoRaGJiGb7as8MfjEZ8jvBxcWsF9rNXsJF7mwXHhs59pQB18joIm+Q5sAIq
 YQ1A==
X-Gm-Message-State: AOAM530UnQwW1dgSj/4/kUVbrUVnduJTxNyBChZPGHRMvIFetlw8RRzG
 fBS0mIf+KjEk29BvXxQ0ogfaXLMz/BtyCyefcfw=
X-Google-Smtp-Source: ABdhPJymBuqDQprFF3XXwMA343nL48tGqWCZXcN3Uj49AeWf99JOtrfiyk/h92hAMNaNOlaRgi+HSg==
X-Received: by 2002:a63:d245:: with SMTP id t5mr2258997pgi.283.1601367674255; 
 Tue, 29 Sep 2020 01:21:14 -0700 (PDT)
Received: from localhost.localdomain ([49.207.218.220])
 by smtp.gmail.com with ESMTPSA id a18sm3704592pgw.50.2020.09.29.01.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 01:21:13 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Tue, 29 Sep 2020 13:50:28 +0530
Message-Id: <20200929082028.50540-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Petko Manolov <petkan@nucleusys.com>,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH] net: usb: rtl8150: prevent
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
---
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
+	if (ret > 0 && ret <= sizeof(node_id)) {
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
