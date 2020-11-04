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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CA3C55179
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA35622277
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGMsvBSA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA35622277
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 68E8B2281C;
	Wed,  4 Nov 2020 06:47:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fDzrLBWKSwhk; Wed,  4 Nov 2020 06:47:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AA120220C1;
	Wed,  4 Nov 2020 06:47:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99409C088B;
	Wed,  4 Nov 2020 06:47:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA97AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A8164869E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRfZzM7S7TvZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 293F6868D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:56 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id f38so15761703pgm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Gj3vhr1jCB9Dg5NnjmQRggTwPs6mgGI9aVvWxKxd4YM=;
 b=LGMsvBSA5gQwLgkvnOtNA/ctaxR/E125DO1k+uIzy8+IItaLrI13+92z9tUKubJ9VX
 GTUh+oetORPbEjpLw6kRJPhQlanj/eFr7ZmgmkZ3if/3vzTeI0D0evPTE2iO7fDnhqTh
 zmp2sU8c8zTFcnT/qGhh/G5K7qr8DElmk6J7LHoJPbp27iyk+hyC/OflbKdaCpLiDJd5
 yhcd2VBlQY1RNmjWfzb6SC0cb4vjh++6YTekI/TODPfwmKF3bm3pp1Ex1Sh7Cbjcbzlu
 Tls94X0O8/vQhL2pJr5uytezbDhLEWq+CPJfErobLvgKSNWICIu/n9HbhXQB/XFTMrna
 VjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Gj3vhr1jCB9Dg5NnjmQRggTwPs6mgGI9aVvWxKxd4YM=;
 b=U7iKfvT+DiUu4Dmaxi3+rqCEInGpzKdNADyYxKrLGqLtnhMHHdAuwH6F5k9BrhKRgJ
 7VFFuaJpthRVEld6WgD2EB9UqIr/FZetsP2PEexwQ5KC4Eb0v94BFPg75y3b5UqnWsFt
 HR4RGrYTm/KrQI8lhag/JPfZwTV3ZyERFsg8PEuQ8xpLxd0AXnNC5qPvZ8F/Qlx3Z+YG
 0h/t16cfSXcpM/bD9QizzMOxx02r4gX1oIrFLM4stpNDdplm1Erawn6OVG0/TVBzgX2l
 y8fONr1wiUkztc7wJR7QukeY64keWzdspUV8XsmAtbT0w6O+hE+GwOo2zM8JlV9H1iv1
 I73w==
X-Gm-Message-State: AOAM5316cF66/JQSPm0mhf1SEy0pYeNVtes7+tC49eRLdD7ShcrK4/0P
 lXM1vztP78qLETUg/FwWjBY=
X-Google-Smtp-Source: ABdhPJwpRtZ7gPzaBfsGb4ipy/z5/ycwX0Yqva3is6V9+uWWx9rwD7uszHRbk8NvkHmAbfSr70TXBQ==
X-Received: by 2002:a63:381:: with SMTP id 123mr6416620pgd.112.1604472475787; 
 Tue, 03 Nov 2020 22:47:55 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:47:55 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:16:55 +0530
Message-Id: <20201104064703.15123-8-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 07/15] usb: serial: f81534: use
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
 drivers/usb/serial/f81534.c | 63 +++++++++++--------------------------
 1 file changed, 18 insertions(+), 45 deletions(-)

diff --git a/drivers/usb/serial/f81534.c b/drivers/usb/serial/f81534.c
index 5661fd03e545..23eb17a2c052 100644
--- a/drivers/usb/serial/f81534.c
+++ b/drivers/usb/serial/f81534.c
@@ -217,38 +217,26 @@ static int f81534_set_register(struct usb_serial *serial, u16 reg, u8 data)
 	struct usb_device *dev = serial->dev;
 	size_t count = F81534_USB_MAX_RETRY;
 	int status;
-	u8 *tmp;
-
-	tmp = kmalloc(sizeof(u8), GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
-
-	*tmp = data;
 
 	/*
 	 * Our device maybe not reply when heavily loading, We'll retry for
 	 * F81534_USB_MAX_RETRY times.
 	 */
 	while (count--) {
-		status = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
-					 F81534_SET_GET_REGISTER,
-					 USB_TYPE_VENDOR | USB_DIR_OUT,
-					 reg, 0, tmp, sizeof(u8),
-					 F81534_USB_TIMEOUT);
-		if (status > 0) {
-			status = 0;
-			break;
-		} else if (status == 0) {
-			status = -EIO;
+		status = usb_control_msg_send(dev, 0, F81534_SET_GET_REGISTER,
+					      USB_TYPE_VENDOR | USB_DIR_OUT,
+					      reg, 0, &data, sizeof(u8),
+					      F81534_USB_TIMEOUT, GFP_KERNEL);
+		if (status) {
+			/* Try again */
+			continue;
 		}
 	}
 
-	if (status < 0) {
+	if (status)
 		dev_err(&interface->dev, "%s: reg: %x data: %x failed: %d\n",
-				__func__, reg, data, status);
-	}
+			__func__, reg, data, status);
 
-	kfree(tmp);
 	return status;
 }
 
@@ -258,40 +246,25 @@ static int f81534_get_register(struct usb_serial *serial, u16 reg, u8 *data)
 	struct usb_device *dev = serial->dev;
 	size_t count = F81534_USB_MAX_RETRY;
 	int status;
-	u8 *tmp;
-
-	tmp = kmalloc(sizeof(u8), GFP_KERNEL);
-	if (!tmp)
-		return -ENOMEM;
 
 	/*
 	 * Our device maybe not reply when heavily loading, We'll retry for
 	 * F81534_USB_MAX_RETRY times.
 	 */
 	while (count--) {
-		status = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
-					 F81534_SET_GET_REGISTER,
-					 USB_TYPE_VENDOR | USB_DIR_IN,
-					 reg, 0, tmp, sizeof(u8),
-					 F81534_USB_TIMEOUT);
-		if (status > 0) {
-			status = 0;
-			break;
-		} else if (status == 0) {
-			status = -EIO;
+		status = usb_control_msg_recv(dev, 0, F81534_SET_GET_REGISTER,
+					      USB_TYPE_VENDOR | USB_DIR_IN, reg,
+					      0, data, sizeof(u8),
+					      F81534_USB_TIMEOUT, GFP_KERNEL);
+		if (status) {
+			/* Try again */
+			continue;
 		}
 	}
 
-	if (status < 0) {
+	if (status)
 		dev_err(&interface->dev, "%s: reg: %x failed: %d\n", __func__,
-				reg, status);
-		goto end;
-	}
-
-	*data = *tmp;
-
-end:
-	kfree(tmp);
+			reg, status);
 	return status;
 }
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
