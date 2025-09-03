Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF482D949A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Sep 2025 06:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756880359; cv=none; b=XL9Xutq+ADp161WUNiDP08hYopMqTeYv1koQFxjQGBIP35pNdLUIeMoZBvqNqRC0y2BeWFHTOIaSDaqA2Q4tuB58Zew1EuRCKP8kSxJ8Kn5TdBGH5nXE5nWHTBzftiAiPKPeO+kOULsbk6JL2Yr86TtcPgdpAoEi86SQrHqtfoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756880359; c=relaxed/simple;
	bh=k4Djx9gzZI0uItX5F6U8NOACJ0CiqvtEXulvh5L7zcM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jSeKLdbXjv8PL0Yzs114PvnaYNuEWvxgEPbcplFpO1bXS9/AYf6QII929t7VNVws+01clCfchdV6ipI3MIl9fdfoiJOugzG2+GxR/nPVJBJxYVwtdOPY7IQSNlj9peLPDfSXbkne1RVJgTdhtUJw/pji69VgsIimScxXI9uyyfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAaDtbGy; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAaDtbGy"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29BA96E7C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Sep 2025 06:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTb1gpbw1pt2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Sep 2025 06:19:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A65661480
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A65661480
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dAaDtbGy
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1A65661480
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Sep 2025 06:19:15 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so1755344b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 02 Sep 2025 23:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756880355; x=1757485155; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6iyLT6U/SMFeXIY3WMF6/nHjn/xLgYLeb3rEUCa7ZA=;
        b=dAaDtbGy1TkPytkrhQpH8hO8ODvrjqkkS8BDBr3wR9+hI8frm/lInLtRhKBB9AjGeQ
         CzNgk5nDfsEFxA+DcQOCOCB0xZA1WIiVTy2seyT9hZ9MJeAIlPwti8Jvx8A9WvYBfXRg
         5B2uGBUICakBdjntU9qNuo8sdryEaOFC7m2gMh8HTFeEMPHF4z28dkrGWNlPqoRANaH1
         ZLW1uzV+FI1K24H0YHcQwyDb4rmM4vgzTWjt9fA0AO4UhG7DlIkXkrmzFkfBAISfoRoR
         WbOi4/WWhSlPp37193wzqQuN3p0rWDS9HbAsF5MpMK4YoSUPpHXTrHR+wHQKmE4x9OvW
         lDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756880355; x=1757485155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6iyLT6U/SMFeXIY3WMF6/nHjn/xLgYLeb3rEUCa7ZA=;
        b=mwBMF6B2Vzdb9G+kBzwyMdAoHuF5W+TORPk14Df5SZInpxGIp9KX4ZoLraqTw5RiW5
         k+s8R/YEUGTwTOOSunXK0yB7uHeiules6LmaZLzl9yC35ixHGO1QsLxAwwCD+3ecmC73
         G9sGuue3bVCvtmA0r4MbZ6V5PWRhXXHpWnsiQvX/IbOF4823twaiIX+TeWkX+KyZJu63
         Ro8wps5IUNDP9nlcsFtyM/pCO5wdAWU/y1zYhUWlmzRR+GbYmJ4JrnjcQ4EeDjZZ7MSS
         ZDakRHAAL6MGv6t99y3Fk+JbSz5cC0jJnKmqxXZELGGPMF7sKSeU7NPvfyYiNoRsHoSx
         wnAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOyS/arvL1+MSFqBjC8JrKETAwYHARul9TJjbazVJbq/0VFDSnfkxvqhiULy6FrAMi5a9GTVflPaOJqSPJKuuDHMqVyQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxeQHOeYBgjMEokuBWYp5DtJ1mZSujky8GhcfW7jR9eeWIMbE2L
	1Z7AmeMWCZEw4M/fBa5ZQaXRdnHRjDCdS3JP/3iindoeklUELWbc3T4a
X-Gm-Gg: ASbGncv/sDAmLJijYOb0rwZQd5boIRSYRt0x5f1gftvIxxMFC28YtNYR0GPXrcbWQ/i
	IdT/ZV8Mid/nULVujjCWvdSLiHqe8eivdjTKmURQbKSladUzfqjbjUufpFs9z8a7yf+OhHCDh2E
	2wZaAg6rim3sm02FxbohVqCLuRm2bQq+YmNq4Gf5R04r7xZDMEjY7KxucMj8PU7dswJD0Bvkekj
	Cbl5djfzKMSYB/Qr6dRFq9jik2mmjHAM6fDRmWhDlpYTYNGvWsPc1koQcfy73CfDBi5elUZ4z8F
	ge8s/hicnDMad35GD52oMUduqAY8yUFjSBU30cbLQR7628SlaFETC5UEJ6j5qtmZFCzGOPxBiEK
	ETbTldXEvCwdO1vD3TO+reaI7mWhEUAPjRQ==
X-Google-Smtp-Source: AGHT+IEYBH8aqizGtqUI/QYZ5SP4z32Qsfox8obVDdoIf6zuZo3PvVTsce+pQuGu63/h0UZFAMQJXQ==
X-Received: by 2002:a05:6a20:1592:b0:243:a373:a9e8 with SMTP id adf61e73a8af0-243d6f030bamr20166944637.38.1756880355075;
        Tue, 02 Sep 2025 23:19:15 -0700 (PDT)
Received: from ti-am64x-sdk.. ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77285bb2614sm165999b3a.58.2025.09.02.23.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 23:19:14 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: rydberg@bitmath.org,
	dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	skhan@linuxfoundation.org,
	bhanuseshukumar@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] Input: bcm5974 - Driver cleanup by replacing dprintk with dev_dbg
Date: Wed,  3 Sep 2025 11:49:08 +0530
Message-Id: <20250903061908.41910-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bhanuseshukumar <bhanuseshukumar@gmail.com>

Debug printk messages are converted to dev_dbg based logs
for better control over debug messages using dynamic logging.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Changes in V2
 1. Removed unnecessary module name(bcm5974) prefix in each dev_dbg logs.
 2. Removed unwanted variable declarations as pointed out in v1 review 
 3. Name is used in signed-off tag instead of email alias.
 
 Note: This patch is tested for compilation.
 v1 patch : https://lore.kernel.org/all/20250902164351.36828-1-bhanuseshukumar@gmail.com/

 drivers/input/mouse/bcm5974.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
index dfdfb59cc8b5..03e112666c2e 100644
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
@@ -550,8 +543,7 @@ static int report_bt_state(struct bcm5974 *dev, int size)
 	if (size != sizeof(struct bt_data))
 		return -EIO;
 
-	dprintk(7,
-		"bcm5974: button data: %x %x %x %x\n",
+	dev_dbg(&dev->intf->dev, "button data: %x %x %x %x\n",
 		dev->bt_data->unknown1, dev->bt_data->button,
 		dev->bt_data->rel_x, dev->bt_data->rel_y);
 
@@ -688,7 +680,7 @@ static int bcm5974_wellspring_mode(struct bcm5974 *dev, bool on)
 		goto out;
 	}
 
-	dprintk(2, "bcm5974: switched to %s mode.\n",
+	dev_dbg(&dev->intf->dev, "switched to %s mode.\n",
 		on ? "wellspring" : "normal");
 
  out:
@@ -718,7 +710,7 @@ static void bcm5974_irq_button(struct urb *urb)
 	}
 
 	if (report_bt_state(dev, dev->bt_urb->actual_length))
-		dprintk(1, "bcm5974: bad button package, length: %d\n",
+		dev_dbg(&intf->dev, "bad button package, length: %d\n",
 			dev->bt_urb->actual_length);
 
 exit:
@@ -753,7 +745,7 @@ static void bcm5974_irq_trackpad(struct urb *urb)
 		goto exit;
 
 	if (report_tp_state(dev, dev->tp_urb->actual_length))
-		dprintk(1, "bcm5974: bad trackpad package, length: %d\n",
+		dev_dbg(&intf->dev, "bad trackpad package, length: %d\n",
 			dev->tp_urb->actual_length);
 
 exit:
@@ -786,7 +778,7 @@ static int bcm5974_start_traffic(struct bcm5974 *dev)
 
 	error = bcm5974_wellspring_mode(dev, true);
 	if (error) {
-		dprintk(1, "bcm5974: mode switch failed\n");
+		dev_dbg(&dev->intf->dev, "mode switch failed\n");
 		goto err_out;
 	}
 
-- 
2.34.1

