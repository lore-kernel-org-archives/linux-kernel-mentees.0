Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB78C4727D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 13:30:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29AC020756
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 13:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiUPfJAY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29AC020756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EA9C52042E;
	Mon,  5 Oct 2020 13:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCj9o2HmkqU1; Mon,  5 Oct 2020 13:30:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C469B203D0;
	Mon,  5 Oct 2020 13:30:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEBB3C07FF;
	Mon,  5 Oct 2020 13:30:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D414AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 13:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CBB9B856BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 13:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5L4O_7uCDQY0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 13:30:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F37688557E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 13:30:23 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b26so3558645pff.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 06:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KiVd1CB6lv+K5WRh3wsB+klp28Y/L0HyIFaj1iXVxLg=;
 b=LiUPfJAYlPG24Mmd5k3kdAcFh4fpsIM6iQfhPWi/GlYdSZy5/Y4NYgjBGt2cWC63y0
 PDxPAR8L1oTJoFcesFGZLGZqlLto66HKZI4ehZsOp+VRkpzuYs0skwwrEunRomaR5CCi
 ATI5+0Jucupp3yVEMFZcUHP3sY6agPxRApErUiuLyaa6D9cu6GCcuhawlrK26U+y9iYi
 CJmxovGG7JrVxpRJ6pdQapAALr9QIHtQmVQFWmQhPK9A+uGPTX2Vc47snJPzEe3LYpfd
 CuMRzPTNW1qOKEYLQCzQgZv7tjNKKNRtdjntyBrip+MiAEbnxi37FYLVHU7onUjCJRYp
 dQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KiVd1CB6lv+K5WRh3wsB+klp28Y/L0HyIFaj1iXVxLg=;
 b=mERwI+MOExiLCYZB4XbEoDOhfJqvFQD3Cs+oLoj+emEXw6kVgIKzwGsIKLdu2y2xxj
 1rWRz1gyH+5PTXBsJCKfD3ZL9rU+veqQrBejYJDtGTehm20bmSdlYnxS6wQMy2dcDlwC
 7+NwDOExL6wbGu8kJS88yz9P+p4R4t1q0FoqfPJ2LpiPE2NlPTnNGeCJVB/IItlXljgP
 R0O6CUnNGe1fG5dzIdlYWad2oEPO1+9bEPns89ZMCPLt8P5Sj2/cCTWK2UDPWBsnaBHX
 iqZhJYcfID4KcPuX0LCDGaQe8q1z9DeGYXvQONpM4yL7nuiByt9Ca/cDInU44H8M5XkP
 Ijag==
X-Gm-Message-State: AOAM532bKVsdfUvJnBpXhG4ij2yqbbmw7i+93FXjUDIc7JyMLGsWb2wD
 BvzFW7RmVA7a/nV815Snj5AcjpDDmocv9vJYK5Y=
X-Google-Smtp-Source: ABdhPJx42KObFaC35cretEvYRkAKYv1Q6kZMzxHGXyv3iTLzMgdH/w8QfHF+vIObQGxlrDZlOylVfQ==
X-Received: by 2002:a63:5858:: with SMTP id i24mr14417015pgm.449.1601904622430; 
 Mon, 05 Oct 2020 06:30:22 -0700 (PDT)
Received: from localhost.localdomain ([49.207.199.235])
 by smtp.gmail.com with ESMTPSA id k7sm10597169pjs.9.2020.10.05.06.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:30:21 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Mon,  5 Oct 2020 18:59:58 +0530
Message-Id: <20201005132958.5712-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Petko Manolov <petkan@nucleusys.com>,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH v4] net: usb: rtl8150: set random MAC
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

When get_registers() fails in set_ethernet_addr(),the uninitialized
value of node_id gets copied over as the address.
So, check the return value of get_registers().

If get_registers() executed successfully (i.e., it returns
sizeof(node_id)), copy over the MAC address using ether_addr_copy()
(instead of using memcpy()).

Else, if get_registers() failed instead, a randomly generated MAC
address is set as the MAC address instead.

Reported-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
Tested-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
Acked-by: Petko Manolov <petkan@nucleusys.com>
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
Changes in v4:
	* Use netdev_notice() instead of dev_warn() and update the 
	  logged message to show the new random MAC as well 
	  (Suggested by Joe Perches <joe@perches.com>)
	* Convert set_ethernet_addr()'s return type back to void.
	  Since we're not treating get_registers() (and thus 
	  set_ethernet_addr()) failing as an erroneous condition,
	  we can perform the error handling (setting a random
	  ethernet address) that was being done in v3 within 
	  set_ethernet_addr() itself.
	  (Suggested by Petko Manolov <petkan@nucleusys.com>)

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
	  for stricter checking in compliance with the new 
	  usb_control_msg_recv() API 
	  (Suggested by Petko Manolov <petkan@nucleusys.com>)
	* Added Acked-by: Petko Manolov

 drivers/net/usb/rtl8150.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 733f120c852b..9d079dc2a535 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -274,12 +274,20 @@ static int write_mii_word(rtl8150_t * dev, u8 phy, __u8 indx, u16 reg)
 		return 1;
 }
 
-static inline void set_ethernet_addr(rtl8150_t * dev)
+static void set_ethernet_addr(rtl8150_t *dev)
 {
-	u8 node_id[6];
+	u8 node_id[ETH_ALEN];
+	int ret;
+
+	ret = get_registers(dev, IDR, sizeof(node_id), node_id);
 
-	get_registers(dev, IDR, sizeof(node_id), node_id);
-	memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));
+	if (ret == sizeof(node_id)) {
+		ether_addr_copy(dev->netdev->dev_addr, node_id);
+	} else {
+		eth_hw_addr_random(dev->netdev);
+		netdev_notice(dev->netdev, "Assigned a random MAC address: %pM\n",
+			      dev->netdev->dev_addr);
+	}
 }
 
 static int rtl8150_set_mac_address(struct net_device *netdev, void *p)
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
