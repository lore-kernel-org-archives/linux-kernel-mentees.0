Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1754EB64DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Jul 2023 00:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC2D3415DC;
	Sun,  9 Jul 2023 00:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC2D3415DC
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RVuSaUHT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6QkeDItlaFPH; Sun,  9 Jul 2023 00:52:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 794C1415CA;
	Sun,  9 Jul 2023 00:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 794C1415CA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60626C0072;
	Sun,  9 Jul 2023 00:52:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03AB4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 00:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D321E81E59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 00:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D321E81E59
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=RVuSaUHT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tGxwUuMpOAVe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 00:52:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC09D81E58
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC09D81E58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 00:52:18 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-666e64e97e2so1634736b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 08 Jul 2023 17:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688863938; x=1691455938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vveFk2wGcZ+4HH5+EqiZf6j3z828PkBXCiuToG8yuJc=;
 b=RVuSaUHTrHnXaZc3Bew+SSbj7GRo4/pc/VDP7SjTLhGiXRX2NTkLOh2J+tlEjYZnwe
 Hf4Q4uwopJPgjdTtV7unxypqjnuLkmvfZoL9SY10Tsj2klywj9FHAYgsicxFLr8cjK2u
 pEdfX3fiTxXDWMx2c+kW8Ng9Nw7egHXIup7DsJohADz/HJauk3aEI608TL5kLSJS9QFq
 FwjrbVlseLqxmlYJsGyT/uGCSC+a0ZsRXdcQowAjOHlh5qZT+xL4MVLDyVnjpOFLOpqw
 qcsWm4oKK0FVE5vG6PI9regrQy0IjV/9PhS+GJlsELd535l3TRQiPdcN7vvN5H6LQ5K2
 JLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688863938; x=1691455938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vveFk2wGcZ+4HH5+EqiZf6j3z828PkBXCiuToG8yuJc=;
 b=QeMAkER0HCqgxNwp6ue03tG9xZkd8OimGxqyq7ORczkapL2zJsZzHkzOx7KG/YFvjf
 lZLfuG6qTIrVX51YUD8dja5RwTyo/+V7ZXzgf1Bm9iJ8LiMrF+8sNRlnhkruapaFwbcw
 uQDPAAIQfB/LOgC6pi9fa70ytaB4ILSyKiTFnVZYr91W927rXyFgxBK4lU9FgKTnp+oP
 LVmHJ+VOidm3vgkAvjOD9jRk7VojKb6WPr9utPfUGTi9K8x4wPIOZzfknut7MiDpU9aS
 oEElLi/KPfCePi912eLGNg9OneDKqUW80izAvQmQ8u2JCHraNaAF4q74BWNB2YLTdntX
 cT5A==
X-Gm-Message-State: ABy/qLYns0iLLCGANiV2HYNM69UJkD0BbpRFsmTH3OMOTX6r3/Imo2aF
 eCAQEV4UxrfKoIoFkIkftVE=
X-Google-Smtp-Source: APBJJlGIRW909tqywb92TBH+bHgqsWLuH+U0T5PLOC8uzUZ1o+B6JpickN+hiNZrfG6M1ZFnVlLE6Q==
X-Received: by 2002:a05:6a20:3c87:b0:12d:4c17:bb2d with SMTP id
 b7-20020a056a203c8700b0012d4c17bb2dmr8824052pzj.26.1688863937993; 
 Sat, 08 Jul 2023 17:52:17 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:602:9300:2710::e399])
 by smtp.gmail.com with ESMTPSA id
 u21-20020aa78395000000b006765cb32558sm4829319pfm.139.2023.07.08.17.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 17:52:17 -0700 (PDT)
From: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
To: gregkh@linuxfoundation.org, raychi@google.com, skhan@linuxfoundation.org
Subject: [PATCH] Style error/warning fixes: replacing space with tabs
Date: Sat,  8 Jul 2023 17:51:33 -0700
Message-Id: <20230709005133.2439465-1-princekumarmaurya06@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, linux-usb@vger.kernel.org
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

Style fixes for warning found using checkpatch.pl script 

Signed-off-by: Prince Kumar Maurya <princekumarmaurya06@gmail.com>
---
 drivers/usb/core/hub.c | 58 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a739403a9e45..82a7b127a340 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1777,7 +1777,7 @@ static bool hub_descriptor_is_sane(struct usb_host_interface *desc)
 	if (!usb_endpoint_is_int_in(&desc->endpoint[0].desc))
 		return false;
 
-        return true;
+		return true;
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
