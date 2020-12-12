Return-Path: <SRS0=PhKz=FQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA9FC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Dec 2020 15:35:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99C72222BB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Dec 2020 15:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99C72222BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 14917874C5;
	Sat, 12 Dec 2020 15:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSuv1hYSG4DO; Sat, 12 Dec 2020 15:35:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 57F848731D;
	Sat, 12 Dec 2020 15:35:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D0B4C0FA7;
	Sat, 12 Dec 2020 15:35:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35B11C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 15:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 233A820377
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 15:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SChx171U9VLu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 15:35:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 1814E20355
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 15:35:51 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id u4so6260542plr.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Dec 2020 07:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SkqHCgjhAon7BXFJjxkN4LU/qWImxYhq9UcK5E1V6sM=;
 b=tyrURw/oBNUbz2uKFuIiEGaR3VIsQEItmzaUxQWruXUDBcQGgwJotb1KuYXqLsNTe1
 xDPQcf1O5topvGQwhNO8kGXUBQ4XYUQ7vfdDzDxtY98sYKGnjkrt4YOPvKbARPmZ5Hcr
 isF/l/WcO/dWL5/S1db3H51uCCYv20TYgXkv9E9TldDWmdFnpSEz0Qfvl9FmwhXDROG4
 2cF0Pf0rxKv6pLDxnUPUSh7qiuu4PBHPV45NJ++FU79I+RS+2Ha/1zneea/tcaMLczRW
 HxuxFbWQiisIuhYbBSnVn9I7226/eUJI4QaBSxC6P6XaqjUKYj0O3GZCM3H2kR+SBYY3
 d90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SkqHCgjhAon7BXFJjxkN4LU/qWImxYhq9UcK5E1V6sM=;
 b=HS8Q/LpyLj5pyRXzT9pmsTlW6jrXZvPQ8D5kCxE6BqPi5sBlkrVmSKinRuvfjQobw4
 NpOVSF9pinRZ4pLg5rafn9RPmXpgs1usRkjsWR15ma5LcoMXvwyhMIc4f6/TmQrI3ryE
 XQNyfeHk7J+skINvnaWIDaKHfVLzvW0Q0MMcB1d4/w0DTR8HdpDS4XzaSN0e5fpYO9gb
 WJDKm4ZRshZddYdAMP8kytLqXuDT1Uy2kBupu1fdEU+dJlugiZokk8EhQ7iOMDrhG//s
 7qiNM6VFoSZ/5bFDb8x2h8fJycHbEEi9K4LkGLlw2C6WXBc2FxGcCNfD+QS+ikqtu6vn
 45RA==
X-Gm-Message-State: AOAM531RA+8B38ZfHWLIgqbGFfyNb6nZCaKFISoOHP2ay2pHnF/luxtn
 Qsqa77XjePHubRKLsIN2wro=
X-Google-Smtp-Source: ABdhPJzM69Fm19mjP6X2zB3yozejb+j+pvkWaBDhpJdOVMaKSVUyA2c2wuZclZCZWnzKGnx0at7G5g==
X-Received: by 2002:a17:902:8ec4:b029:d7:eb0d:84c0 with SMTP id
 x4-20020a1709028ec4b02900d7eb0d84c0mr15138114plo.23.1607787349144; 
 Sat, 12 Dec 2020 07:35:49 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6825:89f0:a659:1148:a80f])
 by smtp.gmail.com with ESMTPSA id p15sm14726990pgl.19.2020.12.12.07.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Dec 2020 07:35:48 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sat, 12 Dec 2020 21:05:17 +0530
Message-Id: <20201212153517.155164-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] leds: convert symbolic permission
	bit macros to octal
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

Symbolic macro names are hard to understand and should not be
used for permission bits.

Convert all bad symbolic permission bit macro uses in led to just use
the octal numbers.

Following macros were replaced:

S_IRUGO => 0444
S_IWUSR => 0200
S_IRUGO | S_IWUSR => 0644

Link: https://lore.kernel.org/lkml/CA+55aFw5v23T-zvDZp-MmD_EYxF8WbafwwB59934FV7g21uMGQ@mail.gmail.com/

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 drivers/leds/leds-blinkm.c        | 8 ++++----
 drivers/leds/leds-lm355x.c        | 2 +-
 drivers/leds/leds-lm3642.c        | 4 ++--
 drivers/leds/leds-lp55xx-common.h | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
index e11fe1788242..6b9b13f58d8a 100644
--- a/drivers/leds/leds-blinkm.c
+++ b/drivers/leds/leds-blinkm.c
@@ -209,7 +209,7 @@ static ssize_t store_red(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(red, S_IRUGO | S_IWUSR, show_red, store_red);
+static DEVICE_ATTR(red, 0644, show_red, store_red);
 
 static ssize_t show_green(struct device *dev, struct device_attribute *attr,
 			  char *buf)
@@ -229,7 +229,7 @@ static ssize_t store_green(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(green, S_IRUGO | S_IWUSR, show_green, store_green);
+static DEVICE_ATTR(green, 0644, show_green, store_green);
 
 static ssize_t show_blue(struct device *dev, struct device_attribute *attr,
 			 char *buf)
@@ -248,7 +248,7 @@ static ssize_t store_blue(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(blue, S_IRUGO | S_IWUSR, show_blue, store_blue);
+static DEVICE_ATTR(blue, 0644, show_blue, store_blue);
 
 static ssize_t show_test(struct device *dev, struct device_attribute *attr,
 			 char *buf)
@@ -273,7 +273,7 @@ static ssize_t store_test(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(test, S_IRUGO | S_IWUSR, show_test, store_test);
+static DEVICE_ATTR(test, 0644, show_test, store_test);
 
 /* TODO: HSB, fade, timeadj, script ... */
 
diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
index 1505521249b5..d15cc0808573 100644
--- a/drivers/leds/leds-lm355x.c
+++ b/drivers/leds/leds-lm355x.c
@@ -381,7 +381,7 @@ static ssize_t lm3556_indicator_pattern_store(struct device *dev,
 	return ret;
 }
 
-static DEVICE_ATTR(pattern, S_IWUSR, NULL, lm3556_indicator_pattern_store);
+static DEVICE_ATTR(pattern, 0200, NULL, lm3556_indicator_pattern_store);
 
 static struct attribute *lm355x_indicator_attrs[] = {
 	&dev_attr_pattern.attr,
diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index 62c14872caf7..b7c2edd0234a 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -193,7 +193,7 @@ static ssize_t lm3642_torch_pin_store(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(torch_pin, S_IWUSR, NULL, lm3642_torch_pin_store);
+static DEVICE_ATTR(torch_pin, 0200, NULL, lm3642_torch_pin_store);
 
 static int lm3642_torch_brightness_set(struct led_classdev *cdev,
 					enum led_brightness brightness)
@@ -240,7 +240,7 @@ static ssize_t lm3642_strobe_pin_store(struct device *dev,
 	return size;
 }
 
-static DEVICE_ATTR(strobe_pin, S_IWUSR, NULL, lm3642_strobe_pin_store);
+static DEVICE_ATTR(strobe_pin, 0200, NULL, lm3642_strobe_pin_store);
 
 static int lm3642_strobe_brightness_set(struct led_classdev *cdev,
 					 enum led_brightness brightness)
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 2f38c5b33830..9345ab1cf323 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -29,11 +29,11 @@ enum lp55xx_engine_mode {
 };
 
 #define LP55XX_DEV_ATTR_RW(name, show, store)	\
-	DEVICE_ATTR(name, S_IRUGO | S_IWUSR, show, store)
+	DEVICE_ATTR(name, 0644, show, store)
 #define LP55XX_DEV_ATTR_RO(name, show)		\
-	DEVICE_ATTR(name, S_IRUGO, show, NULL)
+	DEVICE_ATTR(name, 0444, show, NULL)
 #define LP55XX_DEV_ATTR_WO(name, store)		\
-	DEVICE_ATTR(name, S_IWUSR, NULL, store)
+	DEVICE_ATTR(name, 0200, NULL, store)
 
 #define show_mode(nr)							\
 static ssize_t show_engine##nr##_mode(struct device *dev,		\
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
