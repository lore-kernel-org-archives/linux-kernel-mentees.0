Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A773C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 21:20:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB5A3206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 21:20:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uW8S+Fcu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB5A3206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8AA6D8557E;
	Sat,  3 Oct 2020 21:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQl51KXVW9SU; Sat,  3 Oct 2020 21:20:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7D73085572;
	Sat,  3 Oct 2020 21:20:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58D97C0889;
	Sat,  3 Oct 2020 21:20:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA0A7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 21:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C78CB8702F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 21:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 95NOKJebz-YQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 21:20:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F14B886FF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 21:20:15 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id j8so1345362pjy.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 14:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=snQrsKK9wGUFakYFc3REQ5zRMVVl45uxLHEVZUf1zPE=;
 b=uW8S+Fcu7cIrW1qdaLgGVCTcAXyZtwcLuuFHOuASPkpEY5tMlqyE2xZEsr+U7O7jnU
 /oPYqWZ019qoXJ2N8XTHDr2274AVt/GhmPhdV7pPp07oYF2PRtQlignkwNwcUvY/pWI8
 7QOdpol5oWv2i/+dIP77XbIiuWVLwPYfpI8fzoPiuscI2GXfNIyuYgpfbs6xG/ThizmK
 wonsMN9Bdc4ZanBrm0TLxpQe8RMyMGb4FOc2s2PrhmGqYUsE7pDlRPIOIFCF3QvEeMEh
 rojF6mDqPIpfDhdfk7OtAC6hct9CwhFiy8EGAR8m+p2/9LiU6Q9aAXapS8JQWHbA7SoO
 OJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=snQrsKK9wGUFakYFc3REQ5zRMVVl45uxLHEVZUf1zPE=;
 b=enxcSsTugwjQpbGfp5Iwdu6EQLsMiZeu/aXpr2T9qTsnUpKljDMdM3NcYPE9fzu69B
 ihU5da4mz5j8UT8tpt1/gL/1sl4OMCM2NTiF2LfIAHpGiytcgqSEt6aWy6mHFFevkYwK
 UB1BkUss165gT4R1/WgwNi0NHo3P7mUb5r+W9Rx0FHhr0l3hSBOXzg/VeEg+eh8836zF
 r85fmLCxpx/tde8zVs6fY1kbkfHSgAKyah5a+agb5e/RBR9yDDmJHOHI5hkINFJ0PGUU
 PV6gJ3vDmpakN5znafIRcOSOi0CF5Pb2KLmotn0NaH/Yl4Xrv8zP07v+Di+N29X14Ib1
 Vrcg==
X-Gm-Message-State: AOAM533EAsms38ca6bOAWxhMCzv/pZV9s8TqUMr2FOPIoOVE5NyZlVpn
 riN/W3X03Y4u5MyL1JF07N4h7+cqnqFR6s5U3so=
X-Google-Smtp-Source: ABdhPJxu6wgoODYD1L249tBKjrit5dqjZ8vAWqt9NDnX4FUgsb5CwVv9+fEdutwq+r/QCMsLlyhyJQ==
X-Received: by 2002:a17:90a:128d:: with SMTP id
 g13mr9016097pja.35.1601760014082; 
 Sat, 03 Oct 2020 14:20:14 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.69])
 by smtp.gmail.com with ESMTPSA id u8sm2406380pfk.79.2020.10.03.14.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 14:20:13 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Sun,  4 Oct 2020 02:49:31 +0530
Message-Id: <20201003211931.11544-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Petko Manolov <petkan@nucleusys.com>,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH v3] net: usb: rtl8150: set random MAC
	address when set_ethernet_addr() fails
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

When get_registers() fails, in set_ethernet_addr(),the uninitialized
value of node_id gets copied as the address. This can be considered as
set_ethernet_addr() itself failing.

The return type of set_ethernet_addr() is modified to indicate if it
failed or not, and return values are appropriately checked by caller.

When set_ethernet_addr() fails, a randomly generated MAC address is set
as the MAC address instead.

On the other hand, for the case when get_registers() does succeed,
set_ethernet_addr() has been updated to use ether_addr_copy() to copy
the address, instead of memcpy().

Reported-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
Tested-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
Acked-by: Petko Manolov <petkan@nucleusys.com>
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
Changes in v3:

	* Set a random MAC address to the device rather than making
	  the device not work at all in the even set_ethernet_addr()
	  fails. (Suggested by David Miller <davem@davemloft.net>)

	* Update set_ethernet_addr() to use ether_addr_copy() to copy 
	  the MAC Address (instead of using memcpy() for that same).
	  (Suggested by Joe Perches <joe@perches.com>)


Changes in v2:

	* Modified condition checking get_registers()'s return value to 
		ret == sizeof(node_id)
	  for stricter checking in compliance with the new usb_control_msg_recv()
	  API

	* Added Acked-by: Petko Manolov

 drivers/net/usb/rtl8150.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 733f120c852b..bbd49ebdf095 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -274,12 +274,17 @@ static int write_mii_word(rtl8150_t * dev, u8 phy, __u8 indx, u16 reg)
 		return 1;
 }
 
-static inline void set_ethernet_addr(rtl8150_t * dev)
+static bool set_ethernet_addr(rtl8150_t *dev)
 {
-	u8 node_id[6];
+	u8 node_id[ETH_ALEN];
+	int ret;
 
-	get_registers(dev, IDR, sizeof(node_id), node_id);
-	memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));
+	ret = get_registers(dev, IDR, sizeof(node_id), node_id);
+	if (ret == sizeof(node_id)) {
+		ether_addr_copy(dev->netdev->dev_addr, node_id);
+		return true;
+	}
+	return false;
 }
 
 static int rtl8150_set_mac_address(struct net_device *netdev, void *p)
@@ -909,7 +914,10 @@ static int rtl8150_probe(struct usb_interface *intf,
 		goto out1;
 	}
 	fill_skb_pool(dev);
-	set_ethernet_addr(dev);
+	if (!set_ethernet_addr(dev)) {
+		dev_err(&intf->dev, "assigining a random MAC address\n");
+		eth_hw_addr_random(dev->netdev);
+	}
 
 	usb_set_intfdata(intf, dev);
 	SET_NETDEV_DEV(netdev, &intf->dev);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
