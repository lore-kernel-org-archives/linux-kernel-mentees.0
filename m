Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569FD2E0922
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Sep 2025 16:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831442; cv=none; b=h3fbd/Am7SkzcbPstMKJE1QnGKY6uzWVOtrLKxQ7BxlSnDxggcGbgeHPq+rnEr0uMB68QyfL/Ne5Sj89CuxvVLsLyr3NTrECLveCklrSVi9tnFOPCmH19E1YoFnaIyjA6vwbwkpSL31gvJ2Ch8UjDJwCaUpd2jdqjvP8odrQs+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831442; c=relaxed/simple;
	bh=iSi019zg+85SfqcwkQSzYtglNtT3gMatjXdwTMEt05M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oLSzTv4xeVQ896QUwI6IgpAuKiTFEeDb1116ToswRyzH+i2FVmtUPt1CcafokE7mtKv8+fxEFAAkhzbW5Ch61/7nZ/8c0bq0kWsUW3adWHGm+IMDrV+nryd/Y6m6suN07x0GEX491LdyXRxoawoMnijO5EHGHW+7FnE7G2Ia6T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDtAvGLT; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDtAvGLT"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE2DD84094
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Sep 2025 16:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jd9_OQVWI3uJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Sep 2025 16:44:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4833B8408A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4833B8408A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KDtAvGLT
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4833B8408A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Sep 2025 16:44:00 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-772679eb358so1375043b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 02 Sep 2025 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756831439; x=1757436239; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDFLUlwGZ9fcnaymc/LV1ZN4f5ggTixFKC+VevtRkBU=;
        b=KDtAvGLTswwyu94caF5awVwvX+kEVlx1eIqM1klIDBhgFYoOkEdSGSiRfKEj5J0XBw
         tQFn5FjC7PjpeFvS6vOYiF72hZjn3fEynfCdcmbAUfhMspim3oqKuPGJVzKvZZ4HQzvO
         ZqxYJvoe/loSNAm9ybfHtR2y+of1+EE/HwRn1a+slcbLjeEWk2OxMjgrRPc8D3PDYLqO
         QKU1rSAfn7fqrCoLv8aO3dv6oBnPBWbWpmXVNb/XBa+nIhv76iuTHXLcry8Mb2c2yDQL
         JuZbOmoXhN8Njkh7CTvCBoY8/Pen/pbQtJdvY56K0+X+rk8Vo96qwXThW2l43NYyKf7K
         csdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756831439; x=1757436239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDFLUlwGZ9fcnaymc/LV1ZN4f5ggTixFKC+VevtRkBU=;
        b=xCDKpWi9XofCFVw43edilZ9QYYVZ7AWbaShLwL+ZRTOUhPXfdbhdnCcC1h2/gADiLK
         XKTuzNOF/bmP2yrGF2PkmNI+StV9A8EszT6FS4vv/FE/u2crNcwtgiVXhL+uAAfHeb62
         sfdcnq2US8QUAZP9V8AB01YQhjZ15O1U/gPptR6dLrdtta25H7ZWJ7UOTGVoGQfYWC9k
         6pY45auOdBiB3kJFPb0LfNGyFfFj7lC/ie75JCfHGEzbjiTcWYD+aufrfvsAeoAnGFbL
         yY/Z0u189z848++pGr10Su4mtG2nZrfshCPDS4CnaLEAv31Ley9HgwViIP9/QLNQHQ/3
         t4sA==
X-Forwarded-Encrypted: i=1; AJvYcCW7wqPnL4/zhnBguhgtflWXJBEFzMilothdkcN+IAa3fmKDKtxpQWGJLlL7Mwvr59WggKceEE7oObaCZf3TAbh5NI1ZaA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyYszIv9YLvIGq4r7n826UXnfeCbYvbW7IgUUosIq3EE4Qx+YLI
	hQW6aFoXw7Mmn5nCzpvBxUmN6IFYNxvY07NlirHjBY8xD4evbBycj/y5
X-Gm-Gg: ASbGnctfJD7rZCzdcjSPGhegY6oxcemz2v95veDsBs0Dl+jgKax5tftBNct4tMc+sRk
	ihiRepprq99rVbcpxjvDdLeK/rWWZJsWAh5qto/G/ZsmflZletE2SJOBPHRbZzUk3O01HYxaBmM
	Pp+yLUUp0NeAfahH/IwFUkTNJD4cz6jbnynPsRUCKMIGCIV+0+LYD80CfIbRgML5S5kExUcmkYz
	zTbx25d21Ath5/HJTQSjSUQibzQXgWGNHhYBgtfMCgTgNRFYyFepQuqLoSyq27wdPsXnoS12rJ5
	CcN0hjKfJiBBk7qYVhkcXwtboGw3/1Xzj6sMMP3lUQas9K9YjIRVB9rHSLa0f5u0pm5t65gx0hf
	q8Etxhk9TbPRwa1bAOPGhW/0PYr81NSQzx96hXUA=
X-Google-Smtp-Source: AGHT+IFnhXzo9XpMwOvHJQbCUoXvdPp69NweZCk4tNGWxerYMAlk/QXOMn1ujstF2h6EEPXUubxeaw==
X-Received: by 2002:a05:6a20:42a3:b0:243:755:58b0 with SMTP id adf61e73a8af0-243d6f3b622mr16537135637.49.1756831439370;
        Tue, 02 Sep 2025 09:43:59 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.162.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26a1b9sm13831449b3a.7.2025.09.02.09.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:43:59 -0700 (PDT)
From: bhanuseshukumar <bhanuseshukumar@gmail.com>
To: rydberg@bitmath.org,
	dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	skhan@linuxfoundation.org,
	bhanuseshukumar@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] Input: bcm5974 - Driver cleanup by replacing dprintk with dev_dbg
Date: Tue,  2 Sep 2025 22:13:51 +0530
Message-Id: <20250902164351.36828-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Debug printk messages are converted to dev_dbg based logs
	for better control over debug messages using dynamic logging.

Signed-off-by: bhanuseshukumar <bhanuseshukumar@gmail.com>
---
 drivers/input/mouse/bcm5974.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
index dfdfb59cc8b5..2791fe0c1932 100644
--- a/drivers/input/mouse/bcm5974.c
+++ b/drivers/input/mouse/bcm5974.c
@@ -156,13 +156,6 @@ MODULE_AUTHOR("Henrik Rydberg");
 MODULE_DESCRIPTION("Apple USB BCM5974 multitouch driver");
 MODULE_LICENSE("GPL");
 
-#define dprintk(level, format, a...)\
-	{ if (debug >= level) printk(KERN_DEBUG format, ##a); }
-
-static int debug = 1;
-module_param(debug, int, 0644);
-MODULE_PARM_DESC(debug, "Activate debugging output");
-
 /* button data structure */
 struct bt_data {
 	u8 unknown1;		/* constant */
@@ -547,11 +540,12 @@ static void setup_events_to_report(struct input_dev *input_dev,
 /* report button data as logical button state */
 static int report_bt_state(struct bcm5974 *dev, int size)
 {
+	struct usb_interface *intf = dev->intf;
+
 	if (size != sizeof(struct bt_data))
 		return -EIO;
 
-	dprintk(7,
-		"bcm5974: button data: %x %x %x %x\n",
+	dev_dbg(&intf->dev, "bcm5974: button data: %x %x %x %x\n",
 		dev->bt_data->unknown1, dev->bt_data->button,
 		dev->bt_data->rel_x, dev->bt_data->rel_y);
 
@@ -688,7 +682,7 @@ static int bcm5974_wellspring_mode(struct bcm5974 *dev, bool on)
 		goto out;
 	}
 
-	dprintk(2, "bcm5974: switched to %s mode.\n",
+	dev_dbg(&dev->intf->dev, "bcm5974: switched to %s mode.\n",
 		on ? "wellspring" : "normal");
 
  out:
@@ -718,7 +712,7 @@ static void bcm5974_irq_button(struct urb *urb)
 	}
 
 	if (report_bt_state(dev, dev->bt_urb->actual_length))
-		dprintk(1, "bcm5974: bad button package, length: %d\n",
+		dev_dbg(&intf->dev, "bcm5974: bad button package, length: %d\n",
 			dev->bt_urb->actual_length);
 
 exit:
@@ -753,7 +747,7 @@ static void bcm5974_irq_trackpad(struct urb *urb)
 		goto exit;
 
 	if (report_tp_state(dev, dev->tp_urb->actual_length))
-		dprintk(1, "bcm5974: bad trackpad package, length: %d\n",
+		dev_dbg(&intf->dev, "bcm5974: bad trackpad package, length: %d\n",
 			dev->tp_urb->actual_length);
 
 exit:
@@ -783,10 +777,11 @@ static void bcm5974_irq_trackpad(struct urb *urb)
 static int bcm5974_start_traffic(struct bcm5974 *dev)
 {
 	int error;
+	struct usb_interface *intf = dev->intf;
 
 	error = bcm5974_wellspring_mode(dev, true);
 	if (error) {
-		dprintk(1, "bcm5974: mode switch failed\n");
+		dev_dbg(&intf->dev, "bcm5974: mode switch failed\n");
 		goto err_out;
 	}
 
-- 
2.34.1

