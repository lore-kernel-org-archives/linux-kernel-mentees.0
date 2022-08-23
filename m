Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BAEC38142
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Aug 2022 22:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8710140A1D;
	Tue, 23 Aug 2022 22:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8710140A1D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ISOAaZjB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Dv6DcDfpx6j; Tue, 23 Aug 2022 22:25:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 71124400FE;
	Tue, 23 Aug 2022 22:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71124400FE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F715C0032;
	Tue, 23 Aug 2022 22:25:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1570CC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 22:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7E1D40A1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 22:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7E1D40A1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7J0d016mDGa9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 22:25:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E83640A19
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E83640A19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 22:25:47 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u5so10801082wrt.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Aug 2022 15:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=0KiyNC174zzIjrp1GQzwkUvnQfE9zdtStKGjmTOoAis=;
 b=ISOAaZjBLHcybcp4uPVGbXkobnssTpHtkw01HnsIkvCOXnpw0/0LwaIbeXccRKCQ0M
 JKTK29tVl3uxvOrLEEfvBYrHm+cjw8F1x0eBXsQjDQKqE5di3ZMDFVqaQ7i6oS3xeTOy
 McKs03C2T5MNpFnSZw7g/0fM4sFGLp8WtHnfMXFFK1hN7wABEa1w6M8g0mgCbDt7weSS
 41xaeJvRF1ZAyjpxLi0/3Qh88jiIgM64CTkN5KVXoLNt5qtZDStaC9hJrrsNLuGvrWzK
 akMDScEddIA2fx0iToXHjyt//hg4dUKZ1sF2TBFvOtWQB+zblWRHviWhK5d7jeKuIryJ
 7O3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=0KiyNC174zzIjrp1GQzwkUvnQfE9zdtStKGjmTOoAis=;
 b=3ghrObifh19im2Yav2QDiSNZ02hGGUJFlX95YuGObYV4rl6hr5oUlTGbgDgMvPP82E
 Hza9ObeZ6B4OYLmRqPKKAxpnx0c0MhTitvtMZJU08//sBTXxoqqV8lzSL1I+nMZr4zVJ
 9TOmYgBYQGz1uwhmt1hYxqBNXcsQX/gLP50UTVQ9qzBg0wDi3uPQn+B4UY1G6wYOXmZz
 F2JyQ6k3Dd9KsdCNRcDdQfewt3J3WoaUzPON2IzmffL1HKO6Jkgh7ViZM5KkmjxtJ7BF
 QQvCXINyDMvksmvtb5sI4m5JinS6Gc4eYb7gwWTGJu6gVEDUcgOu8Njf3BmBHMF7qtW1
 cqaQ==
X-Gm-Message-State: ACgBeo1lB+V3+4kdyHlPcAszIuFJH88pQYLaJl7PgOqQfSS3P9RPDcoW
 brfIGkpKp9A19rKDkw8LlfQ=
X-Google-Smtp-Source: AA6agR4y17yGEPfUjNos3CS9FizMNvtc29TAVoyBBkCY/cph1Sh1OwBFkf27OS+J6CbR5P851Ny8bw==
X-Received: by 2002:a5d:594a:0:b0:225:3606:da33 with SMTP id
 e10-20020a5d594a000000b002253606da33mr12411231wri.60.1661293545431; 
 Tue, 23 Aug 2022 15:25:45 -0700 (PDT)
Received: from localhost.localdomain ([84.255.184.228])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c4ecb00b003a4c6e67f01sm26522607wmq.6.2022.08.23.15.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:25:44 -0700 (PDT)
From: Mazin Al Haddad <mazinalhaddad05@gmail.com>
To: pontus.fuchs@gmail.com
Subject: [PATCH] ar5523: check endpoints type and direction in probe()
Date: Wed, 24 Aug 2022 01:24:38 +0300
Message-Id: <20220823222436.514204-1-mazinalhaddad05@gmail.com>
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
 drivers/net/wireless/ath/ar5523/ar5523.c | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/wireless/ath/ar5523/ar5523.c b/drivers/net/wireless/ath/ar5523/ar5523.c
index 6f937d2cc126..5451bf9ab9fb 100644
--- a/drivers/net/wireless/ath/ar5523/ar5523.c
+++ b/drivers/net/wireless/ath/ar5523/ar5523.c
@@ -1581,8 +1581,39 @@ static int ar5523_probe(struct usb_interface *intf,
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
+	for (int i = 0; i < host->desc.bNumEndpoints; ++i) {
+		struct usb_endpoint_descriptor *ep = &host->endpoint[i].desc;
+		// Check for type of endpoint and direction.
+		switch (i) {
+		case 0:
+		case 1:
+			if ((ep->bEndpointAddress & USB_DIR_OUT) &&
+			    ((ep->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK)
+			     == USB_ENDPOINT_XFER_BULK)){
+				dev_err(&dev->dev, "Wrong type of endpoints\n");
+				return -ENODEV;
+			}
+			break;
+		case 2:
+		case 3:
+			if ((ep->bEndpointAddress & USB_DIR_IN) &&
+			    ((ep->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK)
+			     == USB_ENDPOINT_XFER_BULK)){
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
