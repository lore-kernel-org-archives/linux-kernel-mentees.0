Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5FB275AE4
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760290271; cv=none; b=jQXogXHM1fQlzprgF96xj9jcMVwWv0tnxAKYSPMgRuJ4+qGvre8Y6T9YYKUk/vqrrLCIKNh+W/MJ7hfg6IOwhcIMuTixqDlUKdJwHzuFH27s/c0IsockixpJE4Ul4iUZbIk8LZ5ZC4tE5vjSTZ7eB7WQjC+1NUFODOptLTxNazo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760290271; c=relaxed/simple;
	bh=cFKlcvuaXtcSZMOgGjWRYhdQn9J0B/w0AZ9XU7P7kLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQwDp0MicJrI7KrlY+DFdo992HFrBHaIJBzonWV9gGiu/nIN0LEsx2RA3pydrQDpsBOMqPB9uChJYLmsauxYqJSxXq4EiuPPr+zqYJQdWbgdAR44fIJiux1Azn9Z00UZq97kJDp7iZbxXs7OSVYxhurYrCyCyMO5fevt33qQ7bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFftIZdB; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFftIZdB"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7811fa91774so2935598b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 12 Oct 2025 10:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760290268; x=1760895068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1WYbiDGYBtvcLhOiPigF7y5tczemtOhMUj/Ff3hDUg=;
        b=GFftIZdBr8jm7ELZ4Unzp+dQqWydb9RZsFAwkVfUn7oIk5f3Hu1A1Q1WdV7N+SmeYT
         X6Hvb7zm9JASJz3xLOmdrHlJ4miEyZHuGkeiXrFHwaV8ly7y26v6D3GTn1hnn5snvE9L
         sjuNkDlD1wr7NBAIHeCXEyITPXlH7deERNyoU9fzywlpwMjkkmf09Q3a8xXoQj/JnX0B
         PT8OGL3ww+a4ezUav++RfD3xv3sQiAOtXI07CXKuskspGVfWe1a45blyGs5FCw6jVTce
         nHYgzUD/6Cu8uSv+Ial+Y+T9bCuvkh9mY3tottjiSzSGgt7P5q9b1CqCUSxD77d3wfs7
         zl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760290268; x=1760895068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1WYbiDGYBtvcLhOiPigF7y5tczemtOhMUj/Ff3hDUg=;
        b=ikCrf4e7l3SFbMAZMOvO66ewVtFGgUUhp0ZwuCdlK1/rV6WEW7Q4odJJku1PDwbxK2
         xXb32WLRGuXXzMK6laZRxWkBA+67K8i+cLn8rWPkguz+w2sveFOOZEdnYqhDk2qxCRUR
         R6nHUIe3shW2Z0pItzf0kto+j9Z/nigy+4NtjY5vEBQmzardwASkjvARzqGPpBRXMgqu
         MuGYZNKumZ2VKr7H3ANTf7wE1t6YS+yj8upcfttlPCEpk7Jj13GcbDhFWx/bxGLQBsMM
         3Yqt0dda5mTTKYIEi6KkGoOepxvcfe5p8ONKKStzEdqP+3vUaA0q8/Lf3WHfPBa/ommX
         AmBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrEMtwaCcqVquKlMKEUwu6cenDbBjtvBxLC/gGAJO6H0jh9cjWfXvWOBawJHfJ7VV23iLyeh8lPriUEHLZ3Us5YzgoPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ99TqF7UYuIsPBxTkpt48OZQB5Dwk8YmuRMyo/RY3NvUBpXj6
	fv14d3igbHTlxpsZ+7BB08VRy5L/W1YuluqZfZLMiOXV77wOliaXh1OB
X-Gm-Gg: ASbGncsoFJ9PS5e1IaW1mjJ9kOk1pSBn83KKlM1jevcyNMK7+SVPi0S4Rz1CRntCDfC
	p3fqasKg4w9Bw8Ne3vkm5cDrJX1EZqgW45uOggWXspWg2qDxyWncBECeK0JDX2EbbjD3v8NSsFE
	FLka+Uc4wEVzw2Yx0mhXz90CCU0FQKQeHTJqfwCMabY/bFPC+085aZMFj1V0DFHYnIoVBJVLV1M
	aCPMnqiCxbk3XcJAr21c2rO+Lp0gAt5mSFw90negbhWT0JsUqLfXMBxPyFNCIoAFi/PcMgLTDzO
	VqWzrryPZjzTJ9/KFrosmAAab1eLSiWJLYAt6EiNHKEdVDTxIO56cD0S3TWcSHTQaVLPzpemEuy
	jucrN+Zuya3oXWtfG1syXbQAbqJQe85ogXbTqONvIcht5I4tRfGQi5es6WSwHK3J2iQ==
X-Google-Smtp-Source: AGHT+IEHQhj2HZRPcvVzv+9O3j9EgA5G5z/y+In7nTPUNMgaYFBeAqR4KlBOulH8TFpYHBuaXDP4SQ==
X-Received: by 2002:a05:6a00:3e08:b0:781:1f28:eadd with SMTP id d2e1a72fcca58-7938763716amr18550052b3a.20.1760290268342;
        Sun, 12 Oct 2025 10:31:08 -0700 (PDT)
Received: from Ubuntu24.. ([103.187.64.31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09ace5sm9030616b3a.53.2025.10.12.10.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 10:31:07 -0700 (PDT)
From: Shrikant Raskar <raskar.shree97@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	matt@ranostay.sg,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Shrikant Raskar <raskar.shree97@gmail.com>
Subject: [PATCH v3 2/2] iio: health: max30100: Make LED pulse-width configurable via DT
Date: Sun, 12 Oct 2025 23:00:35 +0530
Message-ID: <20251012173035.12536-3-raskar.shree97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251012173035.12536-1-raskar.shree97@gmail.com>
References: <20251012173035.12536-1-raskar.shree97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The required LED pulse width depends on board-specific optical and
mechanical design, which affects measurement accuracy and power use.
Making it configurable via Device Tree allows each platform to define
an appropriate value instead of relying on a hardcoded default.

If unspecified, the driver defaults to 1600 us for backward compatibility.

Tested on: Raspberry Pi 3B + MAX30100 breakout board.

Reviewed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
---
Changelog:
Changes since v2:
- Reorder SPO2_CONFIG register defines by bit position (lowest to highest).
- Add missing header file for FIELD_PREP() macro.
- Add Reviewed-by tag.

Link to v2:
https://lore.kernel.org/all/20251008031737.7321-3-raskar.shree97@gmail.com/
---
 drivers/iio/health/max30100.c | 38 ++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/health/max30100.c b/drivers/iio/health/max30100.c
index 814f521e47ae..3d441013893c 100644
--- a/drivers/iio/health/max30100.c
+++ b/drivers/iio/health/max30100.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2015, 2018
  * Author: Matt Ranostay <matt.ranostay@konsulko.com>
  *
- * TODO: enable pulse length controls via device tree properties
  */
 
 #include <linux/module.h>
@@ -18,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/bitfield.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/kfifo_buf.h>
@@ -52,9 +52,13 @@
 #define MAX30100_REG_MODE_CONFIG_PWR		BIT(7)
 
 #define MAX30100_REG_SPO2_CONFIG		0x07
+#define MAX30100_REG_SPO2_CONFIG_PW_MASK	GENMASK(1, 0)
+#define MAX30100_REG_SPO2_CONFIG_200US		0x0
+#define MAX30100_REG_SPO2_CONFIG_400US		0x1
+#define MAX30100_REG_SPO2_CONFIG_800US		0x2
+#define MAX30100_REG_SPO2_CONFIG_1600US		0x3
 #define MAX30100_REG_SPO2_CONFIG_100HZ		BIT(2)
 #define MAX30100_REG_SPO2_CONFIG_HI_RES_EN	BIT(6)
-#define MAX30100_REG_SPO2_CONFIG_1600US		0x3
 
 #define MAX30100_REG_LED_CONFIG			0x09
 #define MAX30100_REG_LED_CONFIG_LED_MASK	0x0f
@@ -306,19 +310,47 @@ static int max30100_led_init(struct max30100_data *data)
 		MAX30100_REG_LED_CONFIG_LED_MASK, reg);
 }
 
+static int max30100_get_pulse_width(unsigned int pwidth_us)
+{
+	switch (pwidth_us) {
+	case 200:
+		return MAX30100_REG_SPO2_CONFIG_200US;
+	case 400:
+		return MAX30100_REG_SPO2_CONFIG_400US;
+	case 800:
+		return MAX30100_REG_SPO2_CONFIG_800US;
+	case 1600:
+		return MAX30100_REG_SPO2_CONFIG_1600US;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int max30100_chip_init(struct max30100_data *data)
 {
 	int ret;
+	int pulse_width;
+	/* set default LED pulse-width to 1600 us */
+	unsigned int pulse_us = 1600;
+	struct device *dev = &data->client->dev;
 
 	/* setup LED current settings */
 	ret = max30100_led_init(data);
 	if (ret)
 		return ret;
 
+	/* Read LED pulse-width-us from DT */
+	device_property_read_u32(dev, "maxim,pulse-width-us", &pulse_us);
+
+	pulse_width = max30100_get_pulse_width(pulse_us);
+	if (pulse_width < 0)
+		return dev_err_probe(dev, pulse_width, "invalid LED pulse-width %uus\n", pulse_us);
+
 	/* enable hi-res SPO2 readings at 100Hz */
 	ret = regmap_write(data->regmap, MAX30100_REG_SPO2_CONFIG,
 				 MAX30100_REG_SPO2_CONFIG_HI_RES_EN |
-				 MAX30100_REG_SPO2_CONFIG_100HZ);
+				 MAX30100_REG_SPO2_CONFIG_100HZ |
+				 FIELD_PREP(MAX30100_REG_SPO2_CONFIG_PW_MASK, pulse_width));
 	if (ret)
 		return ret;
 
-- 
2.43.0

