Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D01135BDA0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Apr 2026 19:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775849118; cv=none; b=nrV4B/JKD2r5z66F/EjbCfk+blRekN8ZYa6vIlvMuQwxHe2iT3ehaNaSJ64cnCzbjkmlj+znQZ/86u0NdPrfLJUtk46ZvHiEU2sBJcRWRwOCQkP7AGwLFywnLzUhPO08SS5eEA9rfsh0V0InEnZYIu4ASRa4AIaEIt8NIYpgAYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775849118; c=relaxed/simple;
	bh=HyGNKjUaw8UHRjJdnt6VyhCrwMTZ6pcFQiVCJDVCsuI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GwdsLtdiVICNFiSKOeobVJnm1LfU3uF3M6fhXFkofqS/Q++FvvLZSvCD/S83pPa2oO6P8UlJG/Vy1DhgYOuqNrLFA0jajWG4nv1zigrWsJB/NVy2Xjw1Lkx/GO3fQLGeQSUP21tLcpCh/Y7nMEtaGAM3SZafBSZl0njrVVdBOUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=siAjjsv7; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="siAjjsv7"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A9B5606C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Apr 2026 19:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6a7qKnSpg7jy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Apr 2026 19:25:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=mahad.ibrahim.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F9CD606BB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F9CD606BB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=siAjjsv7
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0F9CD606BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Apr 2026 19:25:15 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488971db0fdso23757175e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Apr 2026 12:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775849114; x=1776453914; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DmYI2M5dHslYk9GTB/2ip8+v8uMXE6KQ+B9xsHJTP0o=;
        b=siAjjsv7IRIxccrpzA9LMLuLjr5xybdOZIIxxRWtvSDUWbGR5mKuhEA3b5EZG0Yn1z
         TI0gJmgz1xAAjwYc1tnuL9wfdktsRqtBseap9CSXoLzzrFjl2JYhLxGagj+AXol67DyV
         mNG830sC1dh2h/K2yFCTX8qLcHCN+QtBeJEMCYaEcrjYTgdpIsK9TsPITUW5E1+ZLj26
         udclSn2wwDhLmsXuyF1+Hyy44BIPUETugQhjzB6qZHcmUsLbX1X7cvq4/TWCsznaNfR0
         2ZvJxv1Zurt7LNt6syGjW9IPkgUO2IomlyP73hmP658aiWYcBtMr+7KymKJd1ReKjp5U
         K3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775849114; x=1776453914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmYI2M5dHslYk9GTB/2ip8+v8uMXE6KQ+B9xsHJTP0o=;
        b=NxNnHUYvUJIkLZB8bkbw+qQI2Ee1VJliIs3Led6/R2AwOdpdSVOHl6iu7hFf8DquTN
         aj8L3v30q3QZTon0pCZ3SfJhHOPtVvKHUqtHERJKadq2l2E0wXMkgCKof0hwaJ4AjTuw
         mnhhN+bsxX/Bx4fsqF8HFz6SlN4hY5PPea2b0bWt3OiSfLZ4jrnxG3yFc5hrtDxFwRuT
         +mrxH701tB5Ryj2Xhk+gkyBnwNMj07nGJems1wKxuu778EyCS5KMFvSQzzhxunOJZZyh
         gcIBPs4hrK+jgKxhq/ONFtn0eWdSuzHRbgLRv48Yq6D2shIl8nKynYw2ZeLgNLRZCsdk
         40zg==
X-Forwarded-Encrypted: i=1; AJvYcCXkX99k1GF8QazlUMsl+Lrcydy3Ec+ke/JLg9ym+lOY7O5cFQLnyOxsPYn2NjYaVuDOZn4U88OYyN133X/c4pwI8nKzWA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxGBXlZV7ghJODJS01DG4BU2HOBBTh0Ut5UAXLQ9czI6TN1pOlN
	07BjBbTqHVAcwvH7gWEmVdf/xybk15Or8xFMT4MHuxLlokaUQTc8FD9y
X-Gm-Gg: AeBDieuBp3xmaFJO3Gtf7nelWUUKmKpW5TYVOn3qmWOGmBqJfdrTXYWKm5/urii5x9C
	ODgA/K07NVts3eEJwtK6I1LNNOW8QexCh60C3vIpk9VTg1J0Y1l23OYE6CtAZkX1/cmKR4Lu/ri
	tGMXSWrg0OsNrJ2vJtIBzBl0qxiwINIh6y4ao/1D8GNeFALy4R3CgUkPnSVT87ehqMoX5WGO//x
	/HSyqSPHL5DZEro/Av3KqjPjCzX4bxy3EGtfe4pYzh5byyY0DPpPMSnuiK8797z9RM5PL5v/bko
	9ztjI3VY5vWZPxTpWn43NOtLlEqO0ROE3fa73sZZHbh6FHrkxzw9bgSBcpIMCtyAe7K2U/3BIrK
	tq5ET9NScsSuSxZ+oRFUUPwLDJDozatGj3gSXyJXITgeP0N7SVufjrzssmX+WUm1z0nlPQWvxAU
	q9ZIzjtmQTILTj4KmHkOmR535vXe7fCYE4EXzVBcx6pPgxPyPqiA==
X-Received: by 2002:a05:600c:45cd:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-488d67f0bb7mr50727815e9.10.1775849113569;
        Fri, 10 Apr 2026 12:25:13 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5cf2e70sm50930135e9.0.2026.04.10.12.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 12:25:13 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH] HID: usbhid: replace strlcat with better alternatives
Date: Fri, 10 Apr 2026 15:24:47 -0400
Message-Id: <20260410192447.7059-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for the removal of the strlcat() API as per the KSPP,
replace the string concatenation logic in hid-core, usbkbd, and
usbmouse with struct seq_buf, which tracks the current write position
and remaining space internally. The changes implemented include:

- Replace device name and phys concatenation with seq_buf_puts().
- Include Struct seq_buf and its initialization.
- Include header file of seq_buf.
- Replace strlen() with seq_buf_used() on the string buffer which was
  tracked by seq_buf to increase speed.
- Add size_t len in files which did not have it.
- Use of strscpy with length in place of strlcat.

Testing: This driver was compiled as a module as well as in-built in
QEMU with the QEMU basic mouse, and QEMU basic keyboard. The testing was
done in the following steps.
- Add Hardware Mouse in QEMU checking the usbhid module.
- Verify dmesg string name of mouse.
- Blacklist hidusb module from auto-loading, and removing the module via
  rmmod.
- Load usbmouse module, and reattach QEMU mouse.
- Verify dmesg string name of mouse.
- Repeat same procedure on usbkbd module.

This aligns the driver with KSPP security guidelines.

Link: https://github.com/KSPP/linux/issues/370

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/hid/usbhid/hid-core.c | 17 ++++++++++-------
 drivers/hid/usbhid/usbkbd.c   | 15 ++++++++++-----
 drivers/hid/usbhid/usbmouse.c | 15 ++++++++++-----
 3 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index ddd5d77fb5a5..476308378e90 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -27,6 +27,7 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <linux/string.h>
+#include <linux/seq_buf.h>
 
 #include <linux/usb.h>
 
@@ -1365,6 +1366,7 @@ static int usbhid_probe(struct usb_interface *intf, const struct usb_device_id *
 	struct usb_device *dev = interface_to_usbdev(intf);
 	struct usbhid_device *usbhid;
 	struct hid_device *hid;
+	struct seq_buf hid_name;
 	unsigned int n, has_in = 0;
 	size_t len;
 	int ret;
@@ -1399,7 +1401,7 @@ static int usbhid_probe(struct usb_interface *intf, const struct usb_device_id *
 	hid->vendor = le16_to_cpu(dev->descriptor.idVendor);
 	hid->product = le16_to_cpu(dev->descriptor.idProduct);
 	hid->version = le16_to_cpu(dev->descriptor.bcdDevice);
-	hid->name[0] = 0;
+	seq_buf_init(&hid_name, hid->name, sizeof(hid->name));
 	if (intf->cur_altsetting->desc.bInterfaceProtocol ==
 			USB_INTERFACE_PROTOCOL_MOUSE)
 		hid->type = HID_TYPE_USBMOUSE;
@@ -1407,22 +1409,23 @@ static int usbhid_probe(struct usb_interface *intf, const struct usb_device_id *
 		hid->type = HID_TYPE_USBNONE;
 
 	if (dev->manufacturer)
-		strscpy(hid->name, dev->manufacturer, sizeof(hid->name));
+		seq_buf_puts(&hid_name, dev->manufacturer);
 
 	if (dev->product) {
 		if (dev->manufacturer)
-			strlcat(hid->name, " ", sizeof(hid->name));
-		strlcat(hid->name, dev->product, sizeof(hid->name));
+			seq_buf_puts(&hid_name, " ");
+		seq_buf_puts(&hid_name, dev->product);
 	}
 
-	if (!strlen(hid->name))
+	if (!seq_buf_used(&hid_name))
 		snprintf(hid->name, sizeof(hid->name), "HID %04x:%04x",
 			 le16_to_cpu(dev->descriptor.idVendor),
 			 le16_to_cpu(dev->descriptor.idProduct));
 
 	usb_make_path(dev, hid->phys, sizeof(hid->phys));
-	strlcat(hid->phys, "/input", sizeof(hid->phys));
-	len = strlen(hid->phys);
+	len = strnlen(hid->phys, sizeof(hid->phys));
+	strscpy(hid->phys + len, "/input", sizeof(hid->phys) - len);
+	len = strnlen(hid->phys, sizeof(hid->phys));
 	if (len < sizeof(hid->phys) - 1)
 		snprintf(hid->phys + len, sizeof(hid->phys) - len,
 			 "%d", intf->altsetting[0].desc.bInterfaceNumber);
diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
index 6b33e6ad0846..83d4df0d7a45 100644
--- a/drivers/hid/usbhid/usbkbd.c
+++ b/drivers/hid/usbhid/usbkbd.c
@@ -20,6 +20,7 @@
 #include <linux/init.h>
 #include <linux/usb/input.h>
 #include <linux/hid.h>
+#include <linux/seq_buf.h>
 
 /*
  * Version Information
@@ -266,8 +267,10 @@ static int usb_kbd_probe(struct usb_interface *iface,
 	struct usb_endpoint_descriptor *endpoint;
 	struct usb_kbd *kbd;
 	struct input_dev *input_dev;
+	struct seq_buf kbd_name;
 	int i, pipe, maxp;
 	int error = -ENOMEM;
+	size_t len;
 
 	interface = iface->cur_altsetting;
 
@@ -292,24 +295,26 @@ static int usb_kbd_probe(struct usb_interface *iface,
 	kbd->usbdev = dev;
 	kbd->dev = input_dev;
 	spin_lock_init(&kbd->leds_lock);
+	seq_buf_init(&kbd_name, kbd->name, sizeof(kbd->name));
 
 	if (dev->manufacturer)
-		strscpy(kbd->name, dev->manufacturer, sizeof(kbd->name));
+		seq_buf_puts(&kbd_name, dev->manufacturer);
 
 	if (dev->product) {
 		if (dev->manufacturer)
-			strlcat(kbd->name, " ", sizeof(kbd->name));
-		strlcat(kbd->name, dev->product, sizeof(kbd->name));
+			seq_buf_puts(&kbd_name, " ");
+		seq_buf_puts(&kbd_name, dev->product);
 	}
 
-	if (!strlen(kbd->name))
+	if (!seq_buf_used(&kbd_name))
 		snprintf(kbd->name, sizeof(kbd->name),
 			 "USB HIDBP Keyboard %04x:%04x",
 			 le16_to_cpu(dev->descriptor.idVendor),
 			 le16_to_cpu(dev->descriptor.idProduct));
 
 	usb_make_path(dev, kbd->phys, sizeof(kbd->phys));
-	strlcat(kbd->phys, "/input0", sizeof(kbd->phys));
+	len = strnlen(kbd->phys, sizeof(kbd->phys));
+	strscpy(kbd->phys + len, "/input0", sizeof(kbd->phys) - len);
 
 	input_dev->name = kbd->name;
 	input_dev->phys = kbd->phys;
diff --git a/drivers/hid/usbhid/usbmouse.c b/drivers/hid/usbhid/usbmouse.c
index 7cc4f9558e5f..b3b2abeee614 100644
--- a/drivers/hid/usbhid/usbmouse.c
+++ b/drivers/hid/usbhid/usbmouse.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/usb/input.h>
 #include <linux/hid.h>
+#include <linux/seq_buf.h>
 
 /* for apple IDs */
 #ifdef CONFIG_USB_HID_MODULE
@@ -110,8 +111,10 @@ static int usb_mouse_probe(struct usb_interface *intf, const struct usb_device_i
 	struct usb_endpoint_descriptor *endpoint;
 	struct usb_mouse *mouse;
 	struct input_dev *input_dev;
+	struct seq_buf mouse_name;
 	int pipe, maxp;
 	int error = -ENOMEM;
+	size_t len;
 
 	interface = intf->cur_altsetting;
 
@@ -140,24 +143,26 @@ static int usb_mouse_probe(struct usb_interface *intf, const struct usb_device_i
 
 	mouse->usbdev = dev;
 	mouse->dev = input_dev;
+	seq_buf_init(&mouse_name, mouse->name, sizeof(mouse->name));
 
 	if (dev->manufacturer)
-		strscpy(mouse->name, dev->manufacturer, sizeof(mouse->name));
+		seq_buf_puts(&mouse_name, dev->manufacturer);
 
 	if (dev->product) {
 		if (dev->manufacturer)
-			strlcat(mouse->name, " ", sizeof(mouse->name));
-		strlcat(mouse->name, dev->product, sizeof(mouse->name));
+			seq_buf_puts(&mouse_name, " ");
+		seq_buf_puts(&mouse_name, dev->product);
 	}
 
-	if (!strlen(mouse->name))
+	if (!seq_buf_used(&mouse_name))
 		snprintf(mouse->name, sizeof(mouse->name),
 			 "USB HIDBP Mouse %04x:%04x",
 			 le16_to_cpu(dev->descriptor.idVendor),
 			 le16_to_cpu(dev->descriptor.idProduct));
 
 	usb_make_path(dev, mouse->phys, sizeof(mouse->phys));
-	strlcat(mouse->phys, "/input0", sizeof(mouse->phys));
+	len = strnlen(mouse->phys, sizeof(mouse->phys));
+	strscpy(mouse->phys + len, "/input0", sizeof(mouse->phys) - len);
 
 	input_dev->name = mouse->name;
 	input_dev->phys = mouse->phys;
-- 
2.39.5

