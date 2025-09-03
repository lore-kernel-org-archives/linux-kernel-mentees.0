Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A182F1FFA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Sep 2025 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756889719; cv=none; b=i2ivveIpvxyxpz8XE8NeTmmM83u9Rr5tQPI9MSLMFfEJ6uvw1iUEd5H0/hjDTxH+Dhfx0zW5o+SydKx3G4GdRVYvp5wRzlWqmeiPyBjmuEhopM9g7zRyyBHYKdwxzECfvThvc4OuecYFplVJmoH+igfF+wNzHXRATmC6rv+JRhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756889719; c=relaxed/simple;
	bh=O8PBWQwNJ/F70vGI+AS1o/jEY4knrQJnMWmH+oxAvwE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y2jT3xmjH+eNOguSZ/f9qBHaMVDWperghtgTvQiE+kkTM/48XX8AH8LL8nY2H2x0vzBtYa+JKAMpHfoeyQKf2tFHry+gtbUAlv7KeJtY9b8BP6UvWKta8QvP6mWrJJXa8nnheqz0bwbHTvi0wOGwy9DMn9oCFc7Pt1sMmKl7uKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoVxvgkj; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoVxvgkj"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5353C414D8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Sep 2025 08:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MWBcBx9r-GI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Sep 2025 08:55:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7779A414CD
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7779A414CD
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NoVxvgkj
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7779A414CD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Sep 2025 08:55:14 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7722c8d2694so4112948b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Sep 2025 01:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756889714; x=1757494514; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eE9Dqk+BGhLOvtAd8CSQOddrMc+lxDEGcDsD3ik0RG4=;
        b=NoVxvgkj5qxvaFXhgiQ+BIoVcjHAOn1jlzKsB3Fpt8MVZbjkSJCsw9YYmQjKU+zabh
         bAxSQ9g2IL1tTptMUFGhqcqAxYv4xXGag7cVVKbEQWL1QUU6RF3WiwbJkfFWiNnT2gBb
         cq/er/fXxH+p3/Qh7GCk2q9KOvn5vW3IGd77VVOoPFZOXNVoCj/qwRSAMnfRu3n44gVA
         QPd7FeOLpIGldiBafBkPo9wjxxGvVHQY0pMcYBXJ4HZetPQhhuOxHRZ699AZVZpwDRMq
         SkgDbSZlf/IXvp85vp5Bb00Y0eKE6PYi99sGDFC3UcGOw9AHLfOW7NScU7+FXgH33kka
         VqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756889714; x=1757494514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eE9Dqk+BGhLOvtAd8CSQOddrMc+lxDEGcDsD3ik0RG4=;
        b=V7Mn2gC9Fym5oFAFl3wNOR9JO62zR6xT+3mKFNceagS7KTxpzbwv88u3Sesi1nnGCk
         07x/xI6O1HVdog49nMapUOVvCydgZou2E73BELyP+lPUFM6S0BX/9ZxKUcq34mbM4TWv
         AcypP0JyKH6oAU7o+ZwC3Dee86OdGDIpnbO+e3xm6xN16YRDJEbccwtMqRy9voOCZpkk
         GHgHMQtTNKhTRWzI70LR9xpEvJz5IcJidP9FtlCX8Xz7QD8JeYcx6eGima/Or00BDfPY
         vXuWVVGbtd1g9Sw71bgy9UK3KVP/jNDIQiS58Kn91tGXN4laQQJKTjljCitzIGcdTvaE
         i3JA==
X-Forwarded-Encrypted: i=1; AJvYcCVoFM2OfOWIOPQSELgUaXtq0BnN6ZSD51wQjtWM8lZ6SY06FZs1ePTAiPebwTY0WUrT+EWW9kx/urUBmARQ81wB1eT39g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwOm6ISvsh4bQHqmJixm9M5Rm+ZzjuwSZE6VfJmkZXIh+6JNfL3
	GWdHPR5nrOBd4OAVrgKi5f3aQKcAKn4sHIHcyjR24lIqo0s7uE0r3O7X
X-Gm-Gg: ASbGncvPWNI13Mrn4tVbeq7F2tpqk+vjZVuZqyNrNe7ZS+aSAVxRsQI//kkoaw8uR49
	6EmSJHusH9xbZCCx0Gva974unfr3TT7TcjNuem3A4DyD9oZc9pImVKmcqbvwt6qvVvsFKT9e6Bf
	A3GEzJ6tMIq9dUURpEPzTkVZ+MzxH9I8uLLgdCFo94FYLgCPY9kKeiGbVMpb+tyaZqAzyT/gyaK
	d65q63FqYOcHXcc11yVXd/zL7a6h6YxdMENYCk6emOY+elCkJsayMd9nfToguppRTBrAIjmTElt
	cSRx71wgq0vQtVIyKlH6SSIhP8QDmDBs9ACyR7sOFCb2bvOo9sCeWaF1rCMLCSfvzUAf2ppMDd7
	Jt5irE5nE/lIJO1ZAycrtnEbdy8yILGR9CPso0NXsGYuF
X-Google-Smtp-Source: AGHT+IGP3LVDegg2t/sYFf09FF4PFWosWBV1+BXW4mpRYyHpfiHD5ESfphLo+ZvGdzOuFsNDR6KwAQ==
X-Received: by 2002:a05:6a20:918f:b0:246:d43a:3856 with SMTP id adf61e73a8af0-246d449839amr3046338637.22.1756889713564;
        Wed, 03 Sep 2025 01:55:13 -0700 (PDT)
Received: from ti-am64x-sdk.. ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7726c1ed65bsm5419068b3a.45.2025.09.03.01.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:55:13 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: rydberg@bitmath.org,
	dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	bhanuseshukumar@gmail.com
Subject: [PATCH v3] Input: bcm5974 - Driver cleanup by replacing dprintk with dev_dbg
Date: Wed,  3 Sep 2025 14:25:06 +0530
Message-Id: <20250903085506.6042-1-bhanuseshukumar@gmail.com>
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

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Changes in V3
 1. Name in the from tag & signed-off tag are matched.
 
 Note: This patch is tested for compilation.
 v1 patch : https://lore.kernel.org/all/20250902164351.36828-1-bhanuseshukumar@gmail.com/
 v2 patch : https://lore.kernel.org/all/20250903061908.41910-1-bhanuseshukumar@gmail.com/ 

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

