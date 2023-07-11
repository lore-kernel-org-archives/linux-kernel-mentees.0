Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31122C001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Jul 2023 04:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E1981FA5;
	Tue, 11 Jul 2023 04:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9E1981FA5
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=p741asHO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KzoSGbidBFX4; Tue, 11 Jul 2023 04:28:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A3E8481F74;
	Tue, 11 Jul 2023 04:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3E8481F74
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82DBEC0072;
	Tue, 11 Jul 2023 04:28:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFFB8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Jul 2023 04:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 988A741B55
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Jul 2023 04:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 988A741B55
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=p741asHO
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7aK9B5StACD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Jul 2023 04:28:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62F2941868
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62F2941868
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Jul 2023 04:28:01 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1b9c368f4b5so23931875ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 21:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689049681; x=1691641681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZTTAndE5sQfFOQ4cgQtZgJ/SirH5KDOSAcX/kG5S4M=;
 b=p741asHOh2bb70IklMa/zmdltFAdD3+Nhz8/kXH4FXYL+hXGvqhc6/P2pN9Kadd44z
 g1d5cN596zFJXeZcBYSBIkdM0EwVedDrCtKMp3VREMOZoBE1OVuTh/FOAS9iYtMcn/i4
 ZxPlQkf9kTjZUiUe1gbQGYWLZalZ7axXToBJXRwxtY7qOm1S37DyU2L8i23Ryj2njid+
 cwzNLvPWaVY8tBVhwfccW3jLawrYk8smCZXLzMnWx299bJFp6SlxktFPA8Y2AYR/pxeD
 B5FAuj15Ef0KQ9Im23ievHfEuhwxO1DJbR6TGVeglPPXpXQau9vuHKyVnRCoM0t43wMp
 MO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689049681; x=1691641681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZTTAndE5sQfFOQ4cgQtZgJ/SirH5KDOSAcX/kG5S4M=;
 b=HavbsBt1Htt8Y9Du58xkemUluUYUJI5lxorUOh5LFKWBjNW2ckLaeemQCesV8USUHM
 zLacro1yW8Ag3I5sEVnsJRb/crXTP/WGagyS5j5LfXra9HQkaqSAs28eRjsnzCZfgOWU
 U8AHa9ZDDOy3BgImd4uvhYpN4T66K1hohNCrbhf03/wJZUZwtmf1GsOlBDAcOQvj5riC
 z5ie2AfIJFf05Vq25VBg6pU2pB6+0VtVgZXYEM/pw58rplNJn54gEFJXHTF4LCkHUHhX
 WIE9MrF/L6Td33P2TGgQD4cJ4TznvZmteRvG+L/1aLJso9oF6wYYptnMKmrqLEZGxClD
 Y18w==
X-Gm-Message-State: ABy/qLaJvDYlHG47zihk1TU44os7UIB7iRBCSW3UyHkXQjSF7C9QSLbs
 wgCie3VTqbfOBprqL48CVh8=
X-Google-Smtp-Source: APBJJlH4ryhaiEZRe0ylJ+ZVZWTIIHkDm1lgUpPPIqdfnq8yi7ukBLqTU65G80flKbN3SF82j3iXBg==
X-Received: by 2002:a17:903:228c:b0:1b8:9846:a3b2 with SMTP id
 b12-20020a170903228c00b001b89846a3b2mr21399313plh.14.1689049680642; 
 Mon, 10 Jul 2023 21:28:00 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:602:9300:2710::e399])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a170902b10f00b001b9da7ae98bsm721035plr.122.2023.07.10.21.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 21:28:00 -0700 (PDT)
From: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
To: krzk@kernel.org, gregkh@linuxfoundation.org, raychi@google.com,
 skhan@linuxfoundation.org
Subject: [PATCH] driver/usb: Fixing code style error/warning
Date: Mon, 10 Jul 2023 21:27:20 -0700
Message-Id: <20230711042720.2544320-1-princekumarmaurya06@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1dcd6d8f-f15b-4f71-52a2-3ff48bff7575@kernel.org>
References: <1dcd6d8f-f15b-4f71-52a2-3ff48bff7575@kernel.org>
MIME-Version: 1.0
Cc: linux-usb@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

Update the patch and verified it with --strict flag.
Found no error/warning for this patch.

Signed-off-by: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
---
 drivers/usb/core/hub.c | 58 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a739403a9e45..27037affb746 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1777,7 +1777,7 @@ static bool hub_descriptor_is_sane(struct usb_host_interface *desc)
 	if (!usb_endpoint_is_int_in(&desc->endpoint[0].desc))
 		return false;

-        return true;
+	return true;
 }

 static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
@@ -5854,37 +5854,37 @@ static void hub_event(struct work_struct *work)
 }

 static const struct usb_device_id hub_id_table[] = {
-    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
-                   | USB_DEVICE_ID_MATCH_PRODUCT
-                   | USB_DEVICE_ID_MATCH_INT_CLASS,
-      .idVendor = USB_VENDOR_SMSC,
-      .idProduct = USB_PRODUCT_USB5534B,
-      .bInterfaceClass = USB_CLASS_HUB,
-      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
-    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
-                   | USB_DEVICE_ID_MATCH_PRODUCT,
-      .idVendor = USB_VENDOR_CYPRESS,
-      .idProduct = USB_PRODUCT_CY7C65632,
-      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
-    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
+	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
+			| USB_DEVICE_ID_MATCH_PRODUCT
+			| USB_DEVICE_ID_MATCH_INT_CLASS,
+	  .idVendor = USB_VENDOR_SMSC,
+	  .idProduct = USB_PRODUCT_USB5534B,
+	  .bInterfaceClass = USB_CLASS_HUB,
+	  .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
+	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
+			| USB_DEVICE_ID_MATCH_PRODUCT,
+	  .idVendor = USB_VENDOR_CYPRESS,
+	  .idProduct = USB_PRODUCT_CY7C65632,
+	  .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
+	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
 			| USB_DEVICE_ID_MATCH_INT_CLASS,
-      .idVendor = USB_VENDOR_GENESYS_LOGIC,
-      .bInterfaceClass = USB_CLASS_HUB,
-      .driver_info = HUB_QUIRK_CHECK_PORT_AUTOSUSPEND},
-    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
+	  .idVendor = USB_VENDOR_GENESYS_LOGIC,
+	  .bInterfaceClass = USB_CLASS_HUB,
+	  .driver_info = HUB_QUIRK_CHECK_PORT_AUTOSUSPEND},
+	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
 			| USB_DEVICE_ID_MATCH_PRODUCT,
-      .idVendor = USB_VENDOR_TEXAS_INSTRUMENTS,
-      .idProduct = USB_PRODUCT_TUSB8041_USB2,
-      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
-    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
+	  .idVendor = USB_VENDOR_TEXAS_INSTRUMENTS,
+	  .idProduct = USB_PRODUCT_TUSB8041_USB2,
+	  .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
+	{ .match_flags = USB_DEVICE_ID_MATCH_VENDOR
 			| USB_DEVICE_ID_MATCH_PRODUCT,
-      .idVendor = USB_VENDOR_TEXAS_INSTRUMENTS,
-      .idProduct = USB_PRODUCT_TUSB8041_USB3,
-      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
-    { .match_flags = USB_DEVICE_ID_MATCH_DEV_CLASS,
-      .bDeviceClass = USB_CLASS_HUB},
-    { .match_flags = USB_DEVICE_ID_MATCH_INT_CLASS,
-      .bInterfaceClass = USB_CLASS_HUB},
+	  .idVendor = USB_VENDOR_TEXAS_INSTRUMENTS,
+	  .idProduct = USB_PRODUCT_TUSB8041_USB3,
+	  .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
+	{ .match_flags = USB_DEVICE_ID_MATCH_DEV_CLASS,
+	  .bDeviceClass = USB_CLASS_HUB},
+	{ .match_flags = USB_DEVICE_ID_MATCH_INT_CLASS,
+	  .bInterfaceClass = USB_CLASS_HUB},
     { }						/* Terminating entry */
 };

--
2.40.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
