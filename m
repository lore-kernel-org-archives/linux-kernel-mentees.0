Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DC6ECAAD2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 27 Aug 2022 11:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93E1D40226;
	Sat, 27 Aug 2022 11:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93E1D40226
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EWRmJBFc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id niSgE8gl5LaM; Sat, 27 Aug 2022 11:03:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0D1964027C;
	Sat, 27 Aug 2022 11:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D1964027C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A42DBC0033;
	Sat, 27 Aug 2022 11:03:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 477F3C0033
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Aug 2022 11:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AC3581B10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Aug 2022 11:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AC3581B10
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EWRmJBFc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yRBUFhCMMN2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Aug 2022 11:03:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D92281B0A
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D92281B0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Aug 2022 11:03:04 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so4598021wmk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Aug 2022 04:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ZBVxYAfDaqJMz8mjI8QWlW9FodyIHzxvNuvatUR69V0=;
 b=EWRmJBFcVOH8fXDsx6wqlvalLaW3FbexNZvYg3ZojKv72IfamhdCVM/TtNUA/6Mtuq
 tZC4UGB7d4cHHZ0Z0wiqG0gZTmO5/+Qp+3YYJAs2Khjk+oTNvG0y4SXrefYXO3HNaGmB
 Jbt+m+j4augHtVM6NeMrZZycvbR7bjCuaVue6VWtpnJxQi3vyN1pndP3ntf+irUM5TkP
 pyi1al51EM+/2nOYUv6oe4HeBWMNE8FQfdU3lz8HZ79EVufb5xmXu27oFbSUO2zglSDB
 TatBCxZSMkVkRHved0KSYYE78LjjFTG6rWVHmeYkvRg2niV8J6HVowOUuQVgEWdpmfMK
 sOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ZBVxYAfDaqJMz8mjI8QWlW9FodyIHzxvNuvatUR69V0=;
 b=p/JVRZFqsbUReLCIh9dVW6BgK9ZW3cBaaPBbMS+IIG/1OEzmL+DKsn0TtX8wBCCUAM
 2XHRTtQv5Sc0+KCZP8vGhDBRuEYDUIIe/eghlJRS6yqACsRK93ooetjQ/EvPegPjOgvT
 Pw/mqBoddt7p9mdOrMma7xovSSE+JFCdqEULrMjDT92Ta7VIthsgPKqH0zgpdkg/hETa
 20g4LQDv3JO1cDw9kxIn7mVyNXKf+xuMlPDWnit8LVE60nExkHkPO6bLi4iyPxuhYhHU
 e8B9PvCyfK1vbcVXW+in6L1tu8oFspz8FjGTDS8CDk0R3rlcVT6f4DhpR8B4YFiiMHCb
 Jg/A==
X-Gm-Message-State: ACgBeo3gKiQ5n+PJuSXpg8YPKzD34GtlmE1phZaCENeNSPP4cfR/b7XV
 i+sNcqJXPky9bqBwIOfUP9s=
X-Google-Smtp-Source: AA6agR4gZ+DRS/ZILUxySNqQaH7Ckv8ujePZSra2f2R+l6cxEWbaJKu1lE6OHAF3af2XlGFrg4j0jg==
X-Received: by 2002:a05:600c:a02:b0:39c:97cc:82e3 with SMTP id
 z2-20020a05600c0a0200b0039c97cc82e3mr2040506wmp.97.1661598182265; 
 Sat, 27 Aug 2022 04:03:02 -0700 (PDT)
Received: from localhost.localdomain ([84.255.184.228])
 by smtp.gmail.com with ESMTPSA id
 z17-20020adfd0d1000000b00222ed7ea203sm2000678wrh.100.2022.08.27.04.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 04:03:00 -0700 (PDT)
From: Mazin Al Haddad <mazinalhaddad05@gmail.com>
To: pontus.fuchs@gmail.com
Subject: [PATCH v3] ar5523: check endpoints type and direction in probe()
Date: Sat, 27 Aug 2022 14:01:49 +0300
Message-Id: <20220827110148.203104-1-mazinalhaddad05@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com,
 syzbot+1bc2c2afd44f820a669f@syzkaller.appspotmail.com, kuba@kernel.org,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, Mazin Al Haddad <mazinalhaddad05@gmail.com>
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

Fixes a bug reported by syzbot, where a warning occurs in usb_submit_urb()
due to the wrong endpoint type. There is no check for both the number
of endpoints and the type.

Fix it by adding a check for the number of endpoints and the
direction/type of the endpoints. If the endpoints do not match -ENODEV is
returned.

usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 1 PID: 71 at drivers/usb/core/urb.c:502 usb_submit_urb+0xed2/0x18a0 drivers/usb/core/urb.c:502
Modules linked in:
CPU: 1 PID: 71 Comm: kworker/1:2 Not tainted 5.19.0-rc7-syzkaller-00150-g32f02a211b0a #0
Hardware name: Google Compute Engine/Google Compute Engine, BIOS Google 06/29/2022
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 ar5523_cmd+0x420/0x790 drivers/net/wireless/ath/ar5523/ar5523.c:275
 ar5523_cmd_read drivers/net/wireless/ath/ar5523/ar5523.c:302 [inline]
 ar5523_host_available drivers/net/wireless/ath/ar5523/ar5523.c:1376 [inline]
 ar5523_probe+0xc66/0x1da0 drivers/net/wireless/ath/ar5523/ar5523.c:1655

Link: https://syzkaller.appspot.com/bug?extid=1bc2c2afd44f820a669f
Reported-and-tested-by: syzbot+1bc2c2afd44f820a669f@syzkaller.appspotmail.com
Signed-off-by: Mazin Al Haddad <mazinalhaddad05@gmail.com>
---
v2->v3 changes:
 - Make use of helper functions instead of checking for direction
	 and type manually. 

 drivers/net/wireless/ath/ar5523/ar5523.c | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/net/wireless/ath/ar5523/ar5523.c b/drivers/net/wireless/ath/ar5523/ar5523.c
index 6f937d2cc126..69979e8f99fd 100644
--- a/drivers/net/wireless/ath/ar5523/ar5523.c
+++ b/drivers/net/wireless/ath/ar5523/ar5523.c
@@ -1581,8 +1581,46 @@ static int ar5523_probe(struct usb_interface *intf,
 	struct usb_device *dev = interface_to_usbdev(intf);
 	struct ieee80211_hw *hw;
 	struct ar5523 *ar;
+	struct usb_host_interface *host = intf->cur_altsetting;
+	struct usb_endpoint_descriptor *cmd_tx, *cmd_rx, *data_tx, *data_rx;
 	int error = -ENOMEM;
 
+	if (host->desc.bNumEndpoints != 4) {
+		dev_err(&dev->dev, "Wrong number of endpoints\n");
+		return -ENODEV;
+	}
+
+	for (int i = 0; i < host->desc.bNumEndpoints; ++i) {
+		struct usb_endpoint_descriptor *ep = &host->endpoint[i].desc;
+
+		if (usb_endpoint_is_bulk_out(ep)) {
+			if (!cmd_tx) {
+				if (ep->bEndpointAddress == AR5523_CMD_TX_PIPE)
+					cmd_tx = ep;
+			}
+			if (!data_tx) {
+				if (ep->bEndpointAddress == AR5523_DATA_TX_PIPE)
+					data_tx = ep;
+				}
+		}
+
+		if (usb_endpoint_is_bulk_in(ep)) {
+			if (!cmd_rx) {
+				if (ep->bEndpointAddress == AR5523_CMD_RX_PIPE)
+					cmd_rx = ep;
+			}
+			if (!data_rx) {
+				if (ep->bEndpointAddress == AR5523_DATA_RX_PIPE)
+					data_rx = ep;
+			}
+		}
+	}
+
+	if (!cmd_tx || !data_tx || !cmd_rx || !data_rx) {
+		dev_warn("wrong number of endpoints\n");
+		return -ENODEV;
+	}
+
 	/*
 	 * Load firmware if the device requires it.  This will return
 	 * -ENXIO on success and we'll get called back afer the usb
-- 
2.37.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
