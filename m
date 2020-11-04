Return-Path: <SRS0=I1jd=EK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C935C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A68972236F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdgDAL36"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A68972236F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E50E12155B;
	Wed,  4 Nov 2020 06:47:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4VK5Wd5ZP2s; Wed,  4 Nov 2020 06:47:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5B2C220532;
	Wed,  4 Nov 2020 06:47:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 499ABC088B;
	Wed,  4 Nov 2020 06:47:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 250A5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0FF2C20532
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QEQ8SX3V-UDX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 411F420404
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:41 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id i7so13808892pgh.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jIXN4oV96UfWYf6NfkH9p6xOm8rqz64TQybeTquYEoU=;
 b=bdgDAL36GFSxZ5FJZO8E/+xQp0pgIRfJKgW1vhllCfE0cWJXALFLZGTVA13Io9oEax
 kLBpBdoxoqrgjlfuKpWU9xamztTgEHWQ/4zyec1bzBTOi42ddb3NxHH3veNbcCCbkv+C
 lj7FjBxipHKImRwsp9ihQpsbBvb+SR5XVAtFS8g3+Sy5NZfVSWtcPONRHV/XDazRGabG
 LwoyNMh3bfJMpBDoeuCJSFWlYlPlYt/qbsqR+YoC+4QkiMUXyE1m3jyWCJ1edBEUQV96
 vQRdQb8hs4hPxg2NrxnrQURJjQE/8/4HjyfeMPmci58vskAZ2q/OxQMHkKUmJaH8Gko/
 5dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jIXN4oV96UfWYf6NfkH9p6xOm8rqz64TQybeTquYEoU=;
 b=oy+nl0aypDnQ6OL91iB3lySS3eUMBT10f8sA6s2533Hx1IB6uE700RxROcSv7rM8Da
 grJ3kdu+LKTkw/rNDs6uRL4uM6cD2gYRYuub84PZTXjWf5bYU0jpxVyqK4C4Fv8gGEHO
 eKQlBLi5QETV4G2VVmgViVF+qZGBryFhVBiCy2m23yfjAbgaWpelvL2xZhxddTqtfTgY
 uyPGK3pmMipoWRmi8jFQsg16PhDxy5WgIVBsMa8Z8sIKA6f3n/VvtWNLdrN+W2c0JVdR
 0+cOJp1oSqkD86g7J3K7yCiWcthDheiokW/CJYCl12P2Q+A58pAJzdMELFHjlN16bdLx
 CKgw==
X-Gm-Message-State: AOAM532nIDBlVcuO/Sua4MzYQb5ZGMcmRcsCcGzgnBMws+WFMTU9idjj
 EvZSKqhbohgnQo4NeAevB1I=
X-Google-Smtp-Source: ABdhPJwbeR7/672K26Vnqd7j+koUadp3SD8IiepZdPZZlrlpgw5sN/lrTix2osWHCk8nYK4A+rfHtg==
X-Received: by 2002:a63:1d12:: with SMTP id d18mr20727693pgd.314.1604472460880; 
 Tue, 03 Nov 2020 22:47:40 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:47:40 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:16:51 +0530
Message-Id: <20201104064703.15123-4-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 03/15] usb: serial: ch314: use
	usb_control_msg_recv() and usb_control_msg_send()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
usb_control_msg() with proper error check. Hence use the wrappers
instead of calling usb_control_msg() directly.

Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
---
 drivers/usb/serial/ch341.c | 45 ++++++++++++--------------------------
 1 file changed, 14 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index a2e2f56c88cd..58c5d3ce4f75 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -111,10 +111,10 @@ static int ch341_control_out(struct usb_device *dev, u8 request,
 	dev_dbg(&dev->dev, "%s - (%02x,%04x,%04x)\n", __func__,
 		request, value, index);
 
-	r = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), request,
-			    USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
-			    value, index, NULL, 0, DEFAULT_TIMEOUT);
-	if (r < 0)
+	r = usb_control_msg_send(dev, 0, request, USB_TYPE_VENDOR |
+				 USB_RECIP_DEVICE | USB_DIR_OUT, value, index,
+				 NULL, 0, DEFAULT_TIMEOUT, GFP_KERNEL);
+	if (r)
 		dev_err(&dev->dev, "failed to send control message: %d\n", r);
 
 	return r;
@@ -129,23 +129,14 @@ static int ch341_control_in(struct usb_device *dev,
 	dev_dbg(&dev->dev, "%s - (%02x,%04x,%04x,%u)\n", __func__,
 		request, value, index, bufsize);
 
-	r = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), request,
-			    USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
-			    value, index, buf, bufsize, DEFAULT_TIMEOUT);
-	if (r < (int)bufsize) {
-		if (r >= 0) {
-			dev_err(&dev->dev,
-				"short control message received (%d < %u)\n",
-				r, bufsize);
-			r = -EIO;
-		}
-
+	r = usb_control_msg_recv(dev, 0, request, USB_TYPE_VENDOR |
+				 USB_RECIP_DEVICE | USB_DIR_IN, value, index,
+				 buf, bufsize, DEFAULT_TIMEOUT, GFP_KERNEL);
+	if (r)
 		dev_err(&dev->dev, "failed to receive control message: %d\n",
 			r);
-		return r;
-	}
 
-	return 0;
+	return r;
 }
 
 #define CH341_CLKRATE		48000000
@@ -343,22 +334,18 @@ static int ch341_detect_quirks(struct usb_serial_port *port)
 	struct usb_device *udev = port->serial->dev;
 	const unsigned int size = 2;
 	unsigned long quirks = 0;
-	char *buffer;
+	u8 buffer[2];
 	int r;
 
-	buffer = kmalloc(size, GFP_KERNEL);
-	if (!buffer)
-		return -ENOMEM;
-
 	/*
 	 * A subset of CH34x devices does not support all features. The
 	 * prescaler is limited and there is no support for sending a RS232
 	 * break condition. A read failure when trying to set up the latter is
 	 * used to detect these devices.
 	 */
-	r = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0), CH341_REQ_READ_REG,
-			    USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
-			    CH341_REG_BREAK, 0, buffer, size, DEFAULT_TIMEOUT);
+	r = usb_control_msg_recv(udev, 0, CH341_REQ_READ_REG, USB_TYPE_VENDOR |
+				 USB_RECIP_DEVICE | USB_DIR_IN, CH341_REG_BREAK,
+				 0, &buffer, size, DEFAULT_TIMEOUT, GFP_KERNEL);
 	if (r == -EPIPE) {
 		dev_info(&port->dev, "break control not supported, using simulated break\n");
 		quirks = CH341_QUIRK_LIMITED_PRESCALER | CH341_QUIRK_SIMULATE_BREAK;
@@ -366,17 +353,13 @@ static int ch341_detect_quirks(struct usb_serial_port *port)
 		goto out;
 	}
 
-	if (r != size) {
-		if (r >= 0)
-			r = -EIO;
+	if (r) {
 		dev_err(&port->dev, "failed to read break control: %d\n", r);
 		goto out;
 	}
 
 	r = 0;
 out:
-	kfree(buffer);
-
 	if (quirks) {
 		dev_dbg(&port->dev, "enabling quirk flags: 0x%02lx\n", quirks);
 		priv->quirks |= quirks;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
