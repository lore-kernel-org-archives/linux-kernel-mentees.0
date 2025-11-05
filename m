Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE25631AF06
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  5 Nov 2025 19:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762371076; cv=none; b=Y0MXml61enL0i5iUPhfk/EeTDdFkCrTK2OFCkbpL9FYvCBjcyyAQpusk2XQQWg23cq86mfINEIlcmnlNFt/4/cNy7z+JYWV+uLlboyHRuQo/yNpNMRVuNI6Yk87VxN9E6S9YZXeadPl9P8hYVMK4yugyO/SxI6FtTm1LQLK9o54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762371076; c=relaxed/simple;
	bh=6TJSt3xv2/A7v5854hVI5HwkywLc6Tyjd2khpuHUBnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bl7PMpsH0YXprrs3A62VZU38XCAPn1tMxe0UUBpYrGS6WiITXO/jZaxcOvyliB++sNL+XKLexovBt8VrOc1pRAkSMrKEOPlA6BnTDOBcrn6JjaMOcgmVHQFiJTrfVy1t1kIrt0UUY/69eIuVHhbSZGkdVzXDdTvGIBiiJ+fdc/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgOftdJQ; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgOftdJQ"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-880570bdef8so2851586d6.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 05 Nov 2025 11:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762371074; x=1762975874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EtdMFqP5e+uOi79bVwRdCIbG6WeQQ2xS83d6a0IHvlE=;
        b=TgOftdJQW3Enb61Jsr1FI71qRTYdwkOODvfkSugxU5Seb804KPs9mUmNlF5HtRMFU5
         EkLvlf4e+/mIgT4wnpQ1O6pJeJY5c0eFNJFnE6Hzm46TRHm5JJmBBj/uKwB5vmA5/Gmj
         PBMyV30WZvxs9LKmZg8PwMue2py+rZk1WA/vm/ICpunigP3LUN8SdKkUkrnQdshQF/np
         ThElcVvyvFUiN2XPVRyhTa4iG/QhqQ3x2tcPquWJseP3zat54eGqFfzeAt7wa2mLZsuC
         jai8SF6uckvPKVxeqCVvNn7NzTh16aFDxY2qZdfdBgNVLvmI4N+j8+ICJQyULOCrvzC+
         LuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762371074; x=1762975874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtdMFqP5e+uOi79bVwRdCIbG6WeQQ2xS83d6a0IHvlE=;
        b=VGRKCAA6UVw/ZVOuXEFtkrg9K4ELykPHiX1b4XXBFZHEmJ1Qxez7/9pgKMoiiXOZEk
         AQAtXpYEGnHM9JgyJA0yQkX6Ev9qNDdtV1UZObltVKZIJJxw2mPbB5Lw/9Drz+svenOi
         8V6I/cOgcssMKOiyfYUHa7ilyVb6hjr1eMMQEioR0JyXF/FB9/N6FC6inz5tya+5erfG
         pgxKzlGn+nLSCSS5i6FTRx9/Yv/cmPYOBAg5DBLGWeS2mnD4G1bffqgn1tUiRmRDRSJ+
         BFI/HuuDPQi/YnarSj58GnRDPliEO15b6vs4B1idj/5bNEaxTKSgP82iXM5CmSzxq4Sc
         Tg0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbE4UDi18qsAhn95PpmY+LcNv87MEalr19jOR1JLJhgIqUC8DL3Wp2WqqCWZheNYh+TLU4CUYD36uGzY/9033vEmi0QA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYfBH3z1W0r772rkhs+JNLegrpkanE+oQ1G40AIeeY+NIuBC+2
	Pz2gilG2rKpT6GwAT5LgOVWlEsEzuJNuk7iF1iQo0pMTAtBhnF1mCpKX
X-Gm-Gg: ASbGncvQQVy66symYFkJ/IRqcquUlj5CmOi/Jg6fjYzKiRMIz6fO3Qd9B/nxlS0Ckhr
	4dMCt/q3SUKATCkPgnKHnanvpY4559h68vyZkbAK5NqEot/vFlaWYGGAgVbE98wvNMAfaDkazcp
	lSPUSMgfX8iWlwZSgPRW4SxYmba1JbGs84QJXjWhhBNtslvvG//tM7o7XRMHifj4fRG9YWt/upq
	2pxlGIuXZKR6vZWY/dzVm2Sd7ek1V6D9SF2kFywMScoLqNlxvZM07geMyUBZ8acvxvL6KxgwW+j
	livJpnzrvrl9MUFqfPi0NEl+vNb8tGkbXzGgtNV3qcU5E7raSuY+924EpudrkSEkGFZWfFgWTjp
	OOQFKHhAmXPC9cNdshy2jcEM2WZjqXsbYtY2y19zjfHqX3gl3esqPfanX3xJBl3StEcKcy7xXjR
	InXt7oJSrEKLw8+LsAeTQPgGBLUKct42A=
X-Google-Smtp-Source: AGHT+IGTQtwZl6sL+8gi5DnCDG03CnMRgliitzD0zn5JCJuTQDzTT1J9RmyVcxbUgojmqhn5RXv1cg==
X-Received: by 2002:ad4:5ae7:0:b0:880:4f55:4af0 with SMTP id 6a1803df08f44-880710be2d5mr47019406d6.20.1762371073669;
        Wed, 05 Nov 2025 11:31:13 -0800 (PST)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-880828c4faasm3348326d6.12.2025.11.05.11.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 11:31:13 -0800 (PST)
From: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+2fc81b50a4f8263a159b@syzkaller.appspotmail.com,
	skhan@linuxfoundation.org,
	Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Subject: [PATCH] Bluetooth: btusb: reorder cleanup in btusb_disconnect to avoid UAF
Date: Wed,  5 Nov 2025 14:28:41 -0500
Message-ID: <20251105192839.895418-3-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a KASAN: slab-use-after-free read in btusb_disconnect().
Calling "usb_driver_release_interface(&btusb_driver, data->intf)" will
free the btusb data associated with the interface. The same data is
then used later in the function, hence the UAF.

Fix by moving the accesses to btusb data to before the data is free'd.

Reported-by: syzbot+2fc81b50a4f8263a159b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2fc81b50a4f8263a159b
Tested-by: syzbot+2fc81b50a4f8263a159b@syzkaller.appspotmail.com
Fixes: fd913ef7ce619 ("Bluetooth: btusb: Add out-of-band wakeup support")
Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
---
Syzbot opens a usb device with out of order interface descriptors:
Interface 3 (ISOC) in position 0, Interface 2 (DIAG) in position 1,
Interface 1 (INTF) in position 2.
So, ISOC is the first interface to get disconnected by usb_disconnect()
-> usb_disable_device() -> ... -> btusb_disconnect().

I don't think this is a problem on hardware, where the bInterfaceNumber 
matches the position in the dev->actconfig->interface list; and in 
btusb_disconnect() it would only ever go into the first if 
statement: "if (intf == data->intf)" and not into any of the others.

 drivers/bluetooth/btusb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 9ab661d2d1e6..1f8d4af184de 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -4269,6 +4269,11 @@ static void btusb_disconnect(struct usb_interface *intf)
 
 	hci_unregister_dev(hdev);
 
+	if (data->oob_wake_irq)
+		device_init_wakeup(&data->udev->dev, false);
+	if (data->reset_gpio)
+		gpiod_put(data->reset_gpio);
+
 	if (intf == data->intf) {
 		if (data->isoc)
 			usb_driver_release_interface(&btusb_driver, data->isoc);
@@ -4279,17 +4284,11 @@ static void btusb_disconnect(struct usb_interface *intf)
 			usb_driver_release_interface(&btusb_driver, data->diag);
 		usb_driver_release_interface(&btusb_driver, data->intf);
 	} else if (intf == data->diag) {
-		usb_driver_release_interface(&btusb_driver, data->intf);
 		if (data->isoc)
 			usb_driver_release_interface(&btusb_driver, data->isoc);
+		usb_driver_release_interface(&btusb_driver, data->intf);
 	}
 
-	if (data->oob_wake_irq)
-		device_init_wakeup(&data->udev->dev, false);
-
-	if (data->reset_gpio)
-		gpiod_put(data->reset_gpio);
-
 	hci_free_dev(hdev);
 }
 
-- 
2.43.0

