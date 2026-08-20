Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9097B359A89
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Aug 2026 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236360; cv=none; b=G6kDKO1nUXGvxny+TMwHjXDkvWfGN5qNR8Lb6o1hM+yopzw0jG/2nC26R6/UJszZ55Qw04KFRBPKvpLJ2JvGhDW/J38pqebvNki8/TMNibCn/5nPPjcPGQj2+UOzyOeSgMBTwHGnlzYZOqR1zQVXZX654esp0lVtFA+fP/MzmgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236360; c=relaxed/simple;
	bh=UYAG8scIKHog05RozGPXp8+bn3honIbHODh1cjp75xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GWzyfPeprH8Zri6/GH2lO86Ekosf6Cj+lracWbfhS8q+J3MyRkXCuhvRaZ0oFx8tEyecG0kcPy3DxSbtEDpJqMFE98jV1rp0eLCEfqkfwxaKakODz/PUYhZR8vfOsjqqykGf9gpoirTSuiebGxidkdGkyclHR1ph8V2Au6d6LSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qlNFInLY; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlNFInLY"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bfa6766cf6so1483766e0c.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 20 Aug 2026 07:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787236357; x=1787841157; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dMAMky95vhwY2GpQOZwt4ADrs1Y3YEhuvL0J2CFisxE=;
        b=qlNFInLYnhV3uaaiAMlDb91L3X3jRbromZlR2B31GBeuBeyU8qoo7kqmyWalbfnRTd
         N91U+byDxsHI9+LQ4K/M5n6L+8TtLGKEt6a7jefWxU/3y41j8W6Jv0JG3b3E5N+t7zVv
         qBV4jIeK+bgjQbrV6QwWDFlYSQZ5AgPJPtIjtLX1Az3oBFGN5cHOPshvChI6tvKnuiK5
         IlLOnBERW5E9SqWI8OQMSDyA/+AsxqMvderBcCvYl6kPIUP7hq/7OmSf2P3XdJyw+Nqt
         MQk7E3h7sJjpCsXoFhpBc/uiGE3FaxauO6KBYBK0Ld+xr7NtBpDzWD13i3o98jjstiuK
         Q9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236357; x=1787841157;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMAMky95vhwY2GpQOZwt4ADrs1Y3YEhuvL0J2CFisxE=;
        b=Xvg86BoE0SuZo0EyOl5SkBXZc1J13SmXX5a0jdPwPA0aeZzFo+lhTjAMqKfPkQ/6lF
         audzk3CulwHigBI+L5qF+FIyxMLi7Qi2opgGhv6IZ9szbmw2vYGc7jGioVqHwStWGGGN
         1LHKlb7YRSZ/G5SrNhwbaFnK1XEWdTsLIyMA/Of3Auwnd3MNvFz9iMlhMt1Ei1t04Kxm
         Jad4wN1KkGu21+YB8iGFKNZHKEl6ISVELKSPo9fcXdul793zxVGFFxNZsmNLawl5A2VZ
         XAkPpHs2oSA24nLl7nS833cWiIQ1AUFfiaK4DPWOtWXbiBWi8k3zYv3p1w3XLd2vmERk
         PNVA==
X-Forwarded-Encrypted: i=1; AHgh+RpAJllUArofD4eYOynEEDCPQw8XaE+uaKk1TiXpEOYz0HywDUOIbsXxDNxLcrRoXB5t4EHhD3gnbKKNGU8la0PJ62c7YQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTDzJaLLkZERUZRB6AlD3AN3UaJE+hk6+OBSB9iSgfmfDEzG3M
	Cbr0UQCZyXX7Iyq5nXsC5yhuw7xI9eGRaLDob9Orjb/RQmdKV8zN2Ls=
X-Gm-Gg: AR+sD10PA0QsBEBB6vnhswmYOJhkLTkW3pLlpdd9HA1pXdV7kWK2EDMroqMSeBb2h8r
	WHbQCrPpfrYn8brFlHoohTdkjA+xAC/r22auT/8b8aCZdcypP48TFHlfGD3rrnQ+mpJuw6pd5g3
	MM9R2cG6IBrCDkDUhmsF74fJQOYv0vgxm2bR/6KIwajjfj93KnkJl9kEvJ/u22ITpPCEo8UBbzc
	zBg/T85MdT5la2a8yPOsVMVhGtfdv9NIAk1n4IhhTVIjp2kyI/QERnjdys7gnLMERAc1SJna310
	BoFDrXm9VY3IDPjUcb4vYEnmkdgZ3MFcKk5wcjfH2BpfLMSfaNICSbJ/rZc+NO6gBbes7SHGlSe
	BCGRQOym/6BSPJO2tpHejmFgfCLjKEmRp4p/FAwcq/SCthAMXEwg8Xkj5BlAoxcYjIz49bCqBMs
	LhFXNiuiOZAXyewdz6G6TtV+wXhrBW5/vsRJ0umOXLvXFNgE+c/VqGMvcCs76J2OS+nSbo9Wvdc
	J8ddQjgCBpRSAejNoG+5Rz2lrQmRQLMi7CVE5l4
X-Received: by 2002:a05:6122:4f99:b0:5bf:9bfa:53a0 with SMTP id 71dfb90a1353d-5c5e3b676admr6134085e0c.1.1787236357265;
        Thu, 20 Aug 2026 07:32:37 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e25e3459sm6393922e0c.4.2026.08.20.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:32:36 -0700 (PDT)
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
	linux-kernel-mentees@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 2/2] iio: humidity: am2315: add support for am2320
Date: Thu, 20 Aug 2026 11:31:10 -0300
Message-ID: <e831d50c53b4c4c0fc0f201c6ef6bf90c0a15629.1786973355.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786973355.git.nico.antinori.7@gmail.com>
References: <cover.1786973355.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AM2320 design is fully compatible with AM2315 in terms of I2C
communication protocol and measurement conversions.

Add the "am2320" entry to the i2c_device_id table and register a
of_device_id table to match against devices declared in device tree.

Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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
index f29baa251f9f..5c7582f3a4f9 100644
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
+		return -ENODATA;
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
+	{ }
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

