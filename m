Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214821DE2A5
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  4 Oct 2025 06:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759560988; cv=none; b=szDNQHaz/wbI8Qr4+Gh5VW/yglU7tqh/wq85iQWoqs7WL9Wsy67eNbnA/lBZXVKkBaAxfmW8UG77ev0BGhy5+bD6yh47rVh2RRBq9lnOipsXOWBu+wpl1SNUpO42tdgoE/UJpxQsfpBtgAlMUpiYjQ05LianeS6CCGY2OLfM5Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759560988; c=relaxed/simple;
	bh=Akg62ZfHSXk8/MAeJYQ188NE63lSNc+b3eVzEJKBmqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aavSGCVT+TRsVqreLXKDv+7DZs4p354KlrY+TszMeVeUsaLb7C0AhROyXotkaglVt8MX54l/J0RkrM2ThyJw5PdSAHMw7mCn5QlyP/x9lzlXNCDIHleODiHJ4JqjGMyGtlwXX+PI61H+QX77+lQVhigWrBguvEEdrjAtO1/+BQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAAF4PoE; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAAF4PoE"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7811a02316bso2235834b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 03 Oct 2025 23:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759560986; x=1760165786; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/31utkvfUNb/M8r9xoY+/XrOhevw5/hi8IXZ2URA6Q=;
        b=KAAF4PoEKpt0bCk9WyflHbhyCQ6pejiZCO2ATZd9ppVjGcW8AMG0dhVR2E3h4sR09h
         BOYTqBa2xMf2SkOfea7+olF7IT+mhqdl+Z+0E2abEaYHZNivVnXGCl/+iG94fyqiLfXa
         2WIboygowB2DF1w33cnYuhHyr88LVh7tkc0Xjjr7CW6XtGqurXpWDdiRxNTbvylyHT8A
         v42o3vfg+3UNW8i3CvD1L+MiuhsEuylTnitJNDvxuQktO9fZbtgX1mhG6reqhVIA0VUo
         8JcB54SEtdWSI28LrdjxDiaoUguRMkWGZcU8qD4Cwk65om6FWydSbtNxPJ4PT0ED3mwP
         9pgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759560986; x=1760165786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/31utkvfUNb/M8r9xoY+/XrOhevw5/hi8IXZ2URA6Q=;
        b=GNVLiPauLwNfbeh5DhQlG+BfUoCAT7Pkpzr7JxpEQzPKJbncL/BS6CPDwPpWDg6arI
         Y5BBca66dQ84gUPMI23vS3GT7QfJqphA1sc3vLjIC1y0Z/TdhmqTNpcenn83ugyDcG+o
         IzJbRTECsRXocLl7zK89nop3N84faDeoE582ThU1pCkXKCHInxV/IXosc8ahr8VjBQsW
         UMq3MOL8PxeV/mmb3YSKPn2NgFWilHT5415sY2WL/IFlOroUKtiujPHB2XeRH/15uYYh
         BGuhIby564c88XHnt250sPTACF7guNBVaJeFxmsstTg4QkA7PpgLhEPh4HEWflT9xcff
         VWSw==
X-Forwarded-Encrypted: i=1; AJvYcCUc1xbchW2v2aNllCqVP0IdA4gS5248jPoJL5rNJpUQYd9cCsq0ImQJCvJDZ065eWY73DXaxc+FIvOuTjsuRgOFEiuItQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0QDi4CMofOkDr4tx20c3iLikzOQbu4vjeIS4iDpZ/Ce6P9Zr7
	YnveytnoRtkcruzAKtzvw1DxAWlBtUuwnKw6l6qAOagvXAfOxffogkYN
X-Gm-Gg: ASbGncs6TKZOwIDL07sbcKnkYdcurtH9bcFoTl02iKlzhPo+FtInbNX05LrER757LQ7
	svTF4RXr8lLjfr3nIdTWxTh5MHbfNYs9NrPCsGmqBq+ul+uThxn9I2ec+C2vJlj3Q6RwPGTJVvz
	jH8uQKRLCqhAxJSDQngmavc1CGgrIAEUyUfwS58BPuQoAu6/BEW+dH91t0sjjBFDdP6a6aeP6t4
	m8W//DCYDHhoyuUD8cbYW7vd8rdgcBG5kFqqW5MThdM5X7brsZuxrR68/F+b6bq47y4q0IiPpF4
	DSxFy9nGPHpuaim1Z8BG5UA54yJriJPjjBCDV2vuzI3YsziX6jg4/FKRxXpYh772HzKIjMogVxs
	3oyzBKy01uDF5Lv1zFzxUDE+wyCou7LEUc/NtKJE0xpMg2wxs5BO/EqF3EvKGzQ==
X-Google-Smtp-Source: AGHT+IFD7GHyG9wTtVtGlBN3EdoD8sakaAaNr/H/4XHW4uSuPD+X3zU0Xm9uor2HWS1YrnouFiQMmA==
X-Received: by 2002:a05:6a21:32a8:b0:2fd:a3b:933d with SMTP id adf61e73a8af0-32b6212a95amr8167723637.58.1759560986198;
        Fri, 03 Oct 2025 23:56:26 -0700 (PDT)
Received: from mentee25.. ([2405:201:d003:7033:7b72:2259:4f28:5ecc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ebe5f2sm10022160a91.11.2025.10.03.23.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 23:56:25 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH] usb: serial: fix: space prohibited before comma separator
Date: Sat,  4 Oct 2025 12:26:18 +0530
Message-ID: <20251004065618.70151-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

Run `checkpatch.pl` script on path `drivers/usb/serial/*`.
Find ERROR: space prohibited before that ',' (ctx:WxE).

Doesn't claim any functionality changes in any of the modified
file.

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 drivers/usb/serial/ark3116.c          | 12 ++++++------
 drivers/usb/serial/ftdi_sio.c         |  2 +-
 drivers/usb/serial/iuu_phoenix.c      |  4 ++--
 drivers/usb/serial/keyspan_usa90msg.h |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/serial/ark3116.c b/drivers/usb/serial/ark3116.c
index 800b04fe37fa..f1cc4e36e4e6 100644
--- a/drivers/usb/serial/ark3116.c
+++ b/drivers/usb/serial/ark3116.c
@@ -143,18 +143,18 @@ static int ark3116_port_probe(struct usb_serial_port *port)
 	ark3116_write_reg(serial, UART_FCR, 0);
 	/* handshake control */
 	priv->hcr = 0;
-	ark3116_write_reg(serial, 0x8     , 0);
+	ark3116_write_reg(serial, 0x8, 0);
 	/* modem control */
 	priv->mcr = 0;
 	ark3116_write_reg(serial, UART_MCR, 0);
 
 	if (!(priv->irda)) {
-		ark3116_write_reg(serial, 0xb , 0);
+		ark3116_write_reg(serial, 0xb, 0);
 	} else {
-		ark3116_write_reg(serial, 0xb , 1);
-		ark3116_write_reg(serial, 0xc , 0);
-		ark3116_write_reg(serial, 0xd , 0x41);
-		ark3116_write_reg(serial, 0xa , 1);
+		ark3116_write_reg(serial, 0xb, 1);
+		ark3116_write_reg(serial, 0xc, 0);
+		ark3116_write_reg(serial, 0xd, 0x41);
+		ark3116_write_reg(serial, 0xa, 1);
 	}
 
 	/* setup baudrate */
diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 49666c33b41f..f5d4335c4f6c 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -190,7 +190,7 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(FTDI_VID, FTDI_8U232AM_PID) },
 	{ USB_DEVICE(FTDI_VID, FTDI_8U232AM_ALT_PID) },
 	{ USB_DEVICE(FTDI_VID, FTDI_232RL_PID) },
-	{ USB_DEVICE(FTDI_VID, FTDI_8U2232C_PID) ,
+	{ USB_DEVICE(FTDI_VID, FTDI_8U2232C_PID),
 		.driver_info = (kernel_ulong_t)&ftdi_8u2232c_quirk },
 	{ USB_DEVICE(FTDI_VID, FTDI_4232H_PID) },
 	{ USB_DEVICE(FTDI_VID, FTDI_232H_PID) },
diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index c21dcc9b6f05..fc71aaea3229 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -360,7 +360,7 @@ static void iuu_led_activity_on(struct urb *urb)
 	usb_fill_bulk_urb(port->write_urb, port->serial->dev,
 			  usb_sndbulkpipe(port->serial->dev,
 					  port->bulk_out_endpointAddress),
-			  port->write_urb->transfer_buffer, 8 ,
+			  port->write_urb->transfer_buffer, 8,
 			  iuu_rxcmd, port);
 	usb_submit_urb(port->write_urb, GFP_ATOMIC);
 }
@@ -380,7 +380,7 @@ static void iuu_led_activity_off(struct urb *urb)
 	usb_fill_bulk_urb(port->write_urb, port->serial->dev,
 			  usb_sndbulkpipe(port->serial->dev,
 					  port->bulk_out_endpointAddress),
-			  port->write_urb->transfer_buffer, 8 ,
+			  port->write_urb->transfer_buffer, 8,
 			  iuu_rxcmd, port);
 	usb_submit_urb(port->write_urb, GFP_ATOMIC);
 }
diff --git a/drivers/usb/serial/keyspan_usa90msg.h b/drivers/usb/serial/keyspan_usa90msg.h
index c4ca0f631d20..e01df75140c7 100644
--- a/drivers/usb/serial/keyspan_usa90msg.h
+++ b/drivers/usb/serial/keyspan_usa90msg.h
@@ -69,7 +69,7 @@ struct keyspan_usa90_portControlMessage
 		txMode,			// TXMODE_DMA or TXMODE_BYHAND
 
 		setTxFlowControl,	// host requests tx flow control be set
-		txFlowControl	,	// use TX_FLOW... bits below
+		txFlowControl,	        // use TX_FLOW... bits below
 		setRxFlowControl,	// host requests rx flow control be set
 		rxFlowControl,	// use RX_FLOW... bits below
 		sendXoff,		// host requests XOFF transmitted immediately
-- 
2.43.0

