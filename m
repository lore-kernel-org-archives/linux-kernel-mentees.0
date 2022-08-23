Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22259C32793
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Aug 2022 22:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86B7160D5A;
	Tue, 23 Aug 2022 22:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86B7160D5A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pvfL7cJb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BffLQ08levSk; Tue, 23 Aug 2022 22:58:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8DD5C60C0B;
	Tue, 23 Aug 2022 22:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DD5C60C0B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 687D7C0032;
	Tue, 23 Aug 2022 22:58:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5CF9C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 22:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8972F60C1F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 22:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8972F60C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OeBEvQZqtPEV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 22:58:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B02C60C0B
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B02C60C0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 22:58:13 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id h1so7902302wmd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 15:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=lk8/tj/nL+5/3atLQyJ228xPqcFNf3nUrZ03uJtpZEE=;
 b=pvfL7cJb4Q6aj5gWTQZr10k4cTHpOUxS7OR9MD9VoS52aLJQqXyhRq0jV08egaTM99
 +PZuXYnNSeIR+5K3C2HGqM0kq7LHIw+Bmdtna0MRXVK7AYCWQfuhPS4audm7Iuq6it+t
 zxDpN7LXKfs3pakXGXkNaf7nkqR2s9gEe1UCs9azV0aGGogLnmVRsknkLmP3C90Wiqod
 d8jmm9Qo1MIPLKZOwYA+BCnoxz6dM3fB+Vkgi7RPZrHrGPLzexH9gEYz8gDcOSBDz5Vc
 NQekFrrPeElUGnSETN4rTBDqiBV9Ca5A1nAh7wXsROpOmYDgoFI2tjnwb+qsY/5mJEM9
 gDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=lk8/tj/nL+5/3atLQyJ228xPqcFNf3nUrZ03uJtpZEE=;
 b=7ItVPp3mZW9KpHa69/I+kVMkOdqc9eWhPAG/ze986qnS6H4/q6ooZKAakCJB+wHxzD
 Vpwoa3830qDzYIB0Ds0iHs+epr6nOIkS8LpciqaUHj+xO/SYzEH1AWzQTkoqoI1dyfKh
 B9qU/qQjAgALn/75c+z5jQrAhRWmv8STHdhktbHFrjdT1dRfUcaYqC0PMXJFduMayPp1
 gR6ehWFoHrqGXpkj3lhCGAnxSezHzHQ3PAg5pZQFLvp/nHRxElicBruJGtIYdTVCrGBD
 Jwpve9flXGrKLhpGY2b3jIeRi/xYF+8R3c0qGjll7tKQQq/g9T0JeeuhYDUqx72BoH6P
 Nrzg==
X-Gm-Message-State: ACgBeo1IvJQn/K90FScch5ClSiaZ1qO77xx9VEunzerf3kikh7sw0gaW
 R/9xYCVGO8qOgYSWx/UTTcY=
X-Google-Smtp-Source: AA6agR43PKc2OD8KiUkOBN1+RxOPi6GqXs/g9ouzuKC/13rWTetZzknP+V5rl+Lf0JXq4gPbsnRVWg==
X-Received: by 2002:a7b:cc90:0:b0:3a5:3899:7be1 with SMTP id
 p16-20020a7bcc90000000b003a538997be1mr3361217wma.19.1661295491434; 
 Tue, 23 Aug 2022 15:58:11 -0700 (PDT)
Received: from localhost.localdomain ([84.255.184.228])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a056000108600b002250c35826dsm15052123wrw.104.2022.08.23.15.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:58:10 -0700 (PDT)
From: Mazin Al Haddad <mazinalhaddad05@gmail.com>
To: pontus.fuchs@gmail.com
Subject: [PATCH v2] ar5523: check endpoints type and direction in probe()
Date: Wed, 24 Aug 2022 01:57:54 +0300
Message-Id: <20220823225754.519945-1-mazinalhaddad05@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+1bc2c2afd44f820a669f@syzkaller.appspotmail.com, edumazet@google.com,
 paskripkin@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 Mazin Al Haddad <mazinalhaddad05@gmail.com>
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
of endpoints and the type which causes an error as the code tries to
send a URB to the wrong endpoint.

Fix it by adding a check for the number of endpoints and the
direction/type of the endpoints. If the endpoints do not match the
expected configuration -ENODEV is returned.

Syzkaller report:

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
v1->v2 changes:
	- Fix incorrect check in if statement within switch case (was missing
		a "!" operator).
	- Added comments explaining the code.

 drivers/net/wireless/ath/ar5523/ar5523.c | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/net/wireless/ath/ar5523/ar5523.c b/drivers/net/wireless/ath/ar5523/ar5523.c
index 6f937d2cc126..d7e86dc4c293 100644
--- a/drivers/net/wireless/ath/ar5523/ar5523.c
+++ b/drivers/net/wireless/ath/ar5523/ar5523.c
@@ -1581,8 +1581,41 @@ static int ar5523_probe(struct usb_interface *intf,
 	struct usb_device *dev = interface_to_usbdev(intf);
 	struct ieee80211_hw *hw;
 	struct ar5523 *ar;
+	struct usb_host_interface *host = intf->cur_altsetting;
 	int error = -ENOMEM;
 
+	if (host->desc.bNumEndpoints != 4) {
+		dev_err(&dev->dev, "Wrong number of endpoints\n");
+		return -ENODEV;
+	}
+
+	// Check for type of endpoint and direction.
+	for (int i = 0; i < host->desc.bNumEndpoints; ++i) {
+		struct usb_endpoint_descriptor *ep = &host->endpoint[i].desc;
+
+		switch (i) {
+		case 0:
+		case 1:
+			// if endpoint direction and type does not match
+			if (!((ep->bEndpointAddress & USB_DIR_OUT) &&
+			      ((ep->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK)
+			      == USB_ENDPOINT_XFER_BULK))){
+				dev_err(&dev->dev, "Wrong type of endpoints\n");
+				return -ENODEV;
+			}
+			break;
+		case 2:
+		case 3:
+			if (!((ep->bEndpointAddress & USB_DIR_IN) &&
+			      ((ep->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK)
+			     == USB_ENDPOINT_XFER_BULK))){
+				dev_err(&dev->dev, "Wrong type of endpoints\n");
+				return -ENODEV;
+			}
+			break;
+		}
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
