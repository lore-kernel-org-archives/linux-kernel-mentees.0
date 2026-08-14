Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701CE492181
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Aug 2026 17:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786730102; cv=none; b=g3Xx5l53TTSK9zQsNIn2qDvuSTiyS9QBXHcd0op++uFfynhEVC8ale7ZfM0XVJc+4X5x5K9u+M/eyGcHyuBzZpkpxQpJEne+PAJ3FFj61OyDH+4BedpS8lysdlfh3Uc5sWy4uVlWEwJhidtuRMSXIvW29zZg91tWZyZmyj/E7vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786730102; c=relaxed/simple;
	bh=ZGfx0g19f1BGXUFsCvd5dkL3s6zDjSbj2Y36nSNQydU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GAm/m40Q7dZKJhLymUAOK3xXMOO53IEZatoY9edXyu+P6wjM9DaBkiLZvQIkG5RJ+M4G/SSTTfGT4qu/MKyfQJg5VEVbfogHocF+qg8o94+4HEkyXPPs7eD/vxecmCbc/X4WuroCk0VNAQXN3veJGjRCOvhuTS5tK3nZXv74fvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOcoRIaf; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOcoRIaf"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1127199a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 14 Aug 2026 10:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786730100; x=1787334900; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MmM5BWELeV/soQlGFaiWyzZSNjOOXNNBMJCjP4mlS0A=;
        b=pOcoRIaf0fpQ5PiUzg1WIPNQfRdGxtOGqbmmI9ONYmg0BwGCFHMM0B9VJu7gzzspoz
         ZnVyYJb+MK7Ff8bXI25+kZo4kWWYFQ1Td+lJLO+DlSv+R2Bwd+6pBqWWQeE9wfHUfl6L
         KCxSXc4LiSVmZl+HoGt0rPQDRqXIb4dCTJ5hRlfBH3c8dNakNalrs8pS1rJU5NV4EsCX
         uIKARrdMseImSigDVG/hClSdOpYloxFOdCtJGkXGdI+C3eDtNky6eAf7gAH1fScrkaNo
         8f0atdZKmmLvfyda+bcGsufnej3E6i7Urq+YR/9QDGIsrMMfuwdJxzXGtbNV0esOi5Y+
         Tbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786730100; x=1787334900;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MmM5BWELeV/soQlGFaiWyzZSNjOOXNNBMJCjP4mlS0A=;
        b=A1FgV9jucZ6BbW1eCPSxsPgMSYcM0J/PDOl5iYIGlPbd9Qvy3dst3NNf0LOx4p4PLn
         PAdG7/yxFbCFRGgk/6pBy2vTbg7SQBIM5ZsNKmx26uIrXpcafch4BbIHChQF9tc8u9nK
         c9+GOXYEFYgxmm1FtjvncIEnIWxEJMrqH7jUay6GeZExGlveErvj7Yoazn+liTH/quBP
         U9Hj4AS/d1EzkpWmCqSXu57Pjz6bhkuiqv+35WWpZ6YRL2e6/iJumg7bYA+9CygLphkM
         Sw8NbBVmvadDnXvWWJPXKFYOSuTZLYNKbT76oEY2rHzXiwwHjWlB+xkqiY4Md8HibtI0
         6HyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzOM9PrgCKrFLi8wis2fOlJFHJfHRd2Pq+RSFeul2xD+F3aCfKboEYhDCI62d1SWRSql9M8OY3A9tvv7HCROwYBXIHgg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywyt60nCiUiZs2dpykw89LRp1VA8Mv6wEo3CEq+rY3qAW8qA9wM
	kMd3xbVvdNnaOu8e5WQTC+Qo9qquHc2++5midLk1zhCypUtzOpZaapM=
X-Gm-Gg: AR+sD11OM1Fd+v+fR7LPMPGp5riQvmWbRN5bqPqh+JgE0GPq5I0FtvEMSUt3ZOvGZHX
	RC4iZwUxUvyhqmEfQhMR25tBY9tTkJ1E5gTNEZmZYPIVsPx5Ctt5WXc/KXhp6ZCh0SsvfsiJ86P
	R3mb2lE61lYSfoykMI+PpfebpqgmB+MTu4gghEcnQje2DixuvKrhdkhTAuygsr4wy8I8g+Io00Z
	ALG/13B/vr/PTtFfTu9iLA69cLIGfTzwJGbkSUuvkIMrp9NE8e9Aez9ZexQOeLPuR8jtgJc9stG
	PYPSdeO16pQc3Iag3XHiZlPaZOPzqOrm+mz9qrgiPTPO/aOtnchi8gVq0abrNQeNw0Gy7kwB9M+
	4YD9arztfP83e2R1+QXgXyOOqc9+yDQ2xCgtnnBZzQ4XyMms7cpw0+Y5iFtbnTzO2m+idcmIyQU
	Te2Dqb6FwFcQJkWO4YXniVlqG1E/mBblvvM/uwFuwFBbQwzjIDLXbpBk4iaPm1Z+OgkTaPw8bID
	Q+pMe5LOVX2jZm7ddSo/EUxDAUPrOSYWd/Gd+ZDMUn4zA==
X-Received: by 2002:a17:90b:3c02:b0:380:f389:447b with SMTP id 98e67ed59e1d1-3933b8938f9mr9133156a91.11.1786730099789;
        Fri, 14 Aug 2026 10:54:59 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887ee70sm11128710c88.11.2026.08.14.10.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 10:54:59 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 2/2] iio: humidity: am2315: add support for am2320
Date: Fri, 14 Aug 2026 14:50:20 -0300
Message-ID: <83c8a41607ed07285a84dba8ed10a954226076b4.1786725567.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786725567.git.nico.antinori.7@gmail.com>
References: <cover.1786725567.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
communication protocol and measurement conversions.

Add the "am2320" entry to the i2c_device_id table and create
of_device_id table.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 drivers/iio/humidity/Kconfig  |  8 +++++---
 drivers/iio/humidity/am2315.c | 34 +++++++++++++++++++++++++++++-----
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/humidity/Kconfig b/drivers/iio/humidity/Kconfig
index 54f11f000b6f..13e267943f67 100644
--- a/drivers/iio/humidity/Kconfig
+++ b/drivers/iio/humidity/Kconfig
@@ -5,13 +5,15 @@
 menu "Humidity sensors"

 config AM2315
-	tristate "Aosong AM2315 relative humidity and temperature sensor"
+	tristate "Aosong AM2315 and similar relative humidity and temperature sensor"
 	depends on I2C
 	select IIO_BUFFER
 	select IIO_TRIGGERED_BUFFER
 	help
-	  If you say yes here you get support for the Aosong AM2315
-	  relative humidity and ambient temperature sensor.
+	  If you say yes here you get support for the Aosong relative
+	  humidity and ambient temperature sensors:
+	  - AM2315
+	  - AM2320

 	  This driver can also be built as a module. If so, the module will
 	  be called am2315.
diff --git a/drivers/iio/humidity/am2315.c b/drivers/iio/humidity/am2315.c
index f29baa251f9f..37491416076c 100644
--- a/drivers/iio/humidity/am2315.c
+++ b/drivers/iio/humidity/am2315.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Aosong AM2315 relative humidity and temperature
+ * Aosong AM2315 and similar relative humidity and temperature
  *
  * Copyright (c) 2016, Intel Corporation.
  *
@@ -27,7 +27,17 @@
 #define AM2315_TEMP_OFFSET			4
 #define AM2315_ALL_CHANNEL_MASK			GENMASK(1, 0)

-#define AM2315_DRIVER_NAME			"am2315"
+struct am2315_chip_info {
+	const char *name;
+};
+
+static const struct am2315_chip_info am2315_chip_info = {
+	.name = "am2315",
+};
+
+static const struct am2315_chip_info am2320_chip_info = {
+	.name = "am2320",
+};

 struct am2315_data {
 	struct i2c_client *client;
@@ -220,9 +230,14 @@ static const struct iio_info am2315_info = {
 static int am2315_probe(struct i2c_client *client)
 {
 	int ret;
+	const struct am2315_chip_info *chip_info;
 	struct iio_dev *indio_dev;
 	struct am2315_data *data;

+	chip_info = i2c_get_match_data(client);
+	if (!chip_info)
+		return -EINVAL;
+
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;
@@ -233,7 +248,7 @@ static int am2315_probe(struct i2c_client *client)
 	mutex_init(&data->lock);

 	indio_dev->info = &am2315_info;
-	indio_dev->name = AM2315_DRIVER_NAME;
+	indio_dev->name = chip_info->name;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = am2315_channels;
 	indio_dev->num_channels = ARRAY_SIZE(am2315_channels);
@@ -249,8 +264,16 @@ static int am2315_probe(struct i2c_client *client)
 	return devm_iio_device_register(&client->dev, indio_dev);
 }

+static const struct of_device_id am2315_of_match[] = {
+	{ .compatible = "aosong,am2315", .data = &am2315_chip_info },
+	{ .compatible = "aosong,am2320", .data = &am2320_chip_info },
+	{}
+};
+MODULE_DEVICE_TABLE(of, am2315_of_match);
+
 static const struct i2c_device_id am2315_i2c_id[] = {
-	{ .name = "am2315" },
+	{ .name = "am2315", .driver_data = (kernel_ulong_t)&am2315_chip_info },
+	{ .name = "am2320", .driver_data = (kernel_ulong_t)&am2320_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, am2315_i2c_id);
@@ -258,6 +281,7 @@ MODULE_DEVICE_TABLE(i2c, am2315_i2c_id);
 static struct i2c_driver am2315_driver = {
 	.driver = {
 		.name = "am2315",
+		.of_match_table = am2315_of_match,
 	},
 	.probe =        am2315_probe,
 	.id_table =         am2315_i2c_id,
@@ -266,5 +290,5 @@ static struct i2c_driver am2315_driver = {
 module_i2c_driver(am2315_driver);

 MODULE_AUTHOR("Tiberiu Breana <tiberiu.a.breana@intel.com>");
-MODULE_DESCRIPTION("Aosong AM2315 relative humidity and temperature");
+MODULE_DESCRIPTION("Aosong AM2315 and similar relative humidity and temperature");
 MODULE_LICENSE("GPL v2");
--
2.47.3

