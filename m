Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034B1C1ACB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 27 Sep 2024 18:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727462262; cv=none; b=TntPd0w6PbdJp70+2W9Dnl1Fvs1z/Bn5McRKHDICWnHhsX+oPZaljBSdrBfU+oeQnGpL0kgixdbTGGf5p47fiSOciZ0ROYRE3v5lWsxhQkzBmNZcBRnjTJn9ZUgfZzl4MvktIm1FDf+/FYMlbfaT4vqaAd4EumJmzP9KuOua4ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727462262; c=relaxed/simple;
	bh=b5VUBWbsAu2exHbAegrbqVrNFo16caQHIE4OT3L5mCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qttWmcspQa5rclDYGFyUTKKEfeDJwO500m1cWegld+9Bd3E/9VEBzkJgeXcpTyN5fO+Ig4OI1i+f/hPpaQum7c3PmovgtvAK9WeDMtBSO6NHlwrcZe3fmwEH5jpWqwSJUJoJWcMS+QNvAai3Viy6nIgnC2Gcgs9xYgG55zJXMO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqEXs0Xk; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqEXs0Xk"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D369A60732
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 27 Sep 2024 18:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MW1S9gmCsnqc for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Sep 2024 18:37:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C163660715
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C163660715
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iqEXs0Xk
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C163660715
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 27 Sep 2024 18:37:39 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4583083d019so14709041cf.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 27 Sep 2024 11:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727462258; x=1728067058; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I23sQH+zBH3NL+Wb16mMPrx1e0aS0RcSOdMlchmtwnM=;
        b=iqEXs0XkCWDhEBkEDTT0ulapSgXhA9SRFFtdSLQjstSMsv2MdN7Xn+WiBYiU81VsBl
         4ilrd+Sa+umqj1S0H3HPqGWssIW10GXegR5Gyyjo1qkvGpNv/zTB09JfjGhPrxC/EbJD
         OlVDvmNaRMnMM66HndrXlc1S1p1ClOCvAQ037uPXF/bWIBIOgRh11QwTM/lryw+KSLLH
         rzXRE3AylSGbabS/3j18A8Bpjwlzlr4X+WlM7I6i7DbdbVtFr5foktQ3ngE8vHg8Ctim
         VajjHTGv5Yt1xIp799DNXYE5+IMBwicukqWZCWtGkKg8YjF+N6/f+ZcryIUcuyryzvFv
         aaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727462258; x=1728067058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I23sQH+zBH3NL+Wb16mMPrx1e0aS0RcSOdMlchmtwnM=;
        b=RLvJetX8fhC3zYPs6D5RTHQZ/zsyhJUJXyWHyVG38Yz3sA8oWTL2nak60E0qeuvbHg
         NRlMx6nSey3gQTu3X5T9osbT9fJcz4s2uS3exQFIVeHF8SngHUr1knyhzgzC7r/NzXMF
         CbBG7m92F8uSKlPlvgDvWH+9HlGAoy5aBW16ULabkbkDC4wmd+8+5PDYdWvElnU5/xkK
         iwvrPyZDYdSG1JCyAUsSUOIEFenSMwyd5mud7RvLmtr8SoZGuJ43uu4Fi0vcYjnXvEUI
         3/ZVGGmJCfSCVhVwWjkJepyPJ4NYZALiVid6nsfkA1gV1nnKK7DaE8OkHUQgthRdRuaA
         U0GA==
X-Gm-Message-State: AOJu0YzIlLaGd0frS1qSJbQMfM/WkytlbMjvbDqzSKfwg8hlPPu50Nwo
	aL1L8LwVJjEGZOX7tCREWujL2OZf37GOaqbi8UFkxWhTCPo5HXco
X-Google-Smtp-Source: AGHT+IHaC5Go/NVY+OVranygSvAHD0RyEeJN/p0x0gM5UwrKcLvhuJjgATpgptWz+wxXJk3J1aO49w==
X-Received: by 2002:ac8:5812:0:b0:458:2c22:e696 with SMTP id d75a77b69052e-45c9f289eb4mr65846281cf.56.1727462257996;
        Fri, 27 Sep 2024 11:37:37 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f33bcb0sm10544501cf.74.2024.09.27.11.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 11:37:37 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH] iio: imu: bmi270: Add spi driver for bmi270 imu
Date: Fri, 27 Sep 2024 14:37:10 -0400
Message-ID: <20240927183717.3613601-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement SPI driver for the Bosch BMI270 6-axis IMU. Provide raw read
write access to acceleration and angle velocity measurements via the SPI
interface on the device.

Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
---
 drivers/iio/imu/bmi270/Kconfig       | 12 ++++
 drivers/iio/imu/bmi270/Makefile      |  1 +
 drivers/iio/imu/bmi270/bmi270.h      |  2 +
 drivers/iio/imu/bmi270/bmi270_core.c | 13 ++--
 drivers/iio/imu/bmi270/bmi270_i2c.c  |  7 ++-
 drivers/iio/imu/bmi270/bmi270_spi.c  | 89 ++++++++++++++++++++++++++++
 6 files changed, 114 insertions(+), 10 deletions(-)
 create mode 100644 drivers/iio/imu/bmi270/bmi270_spi.c

diff --git a/drivers/iio/imu/bmi270/Kconfig b/drivers/iio/imu/bmi270/Kconfig
index a8db44187286..0ffd29794fda 100644
--- a/drivers/iio/imu/bmi270/Kconfig
+++ b/drivers/iio/imu/bmi270/Kconfig
@@ -18,3 +18,15 @@ config BMI270_I2C
 
 	  This driver can also be built as a module. If so, the module will be
 	  called bmi270_i2c.
+
+config BMI270_SPI
+	tristate "Bosch BMI270 SPI driver"
+	depends on SPI
+	select BMI270
+	select REGMAP_SPI
+	help
+	  Enable support for the Bosch BMI270 6-Axis IMU connected to SPI
+	  interface.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called bmi270_spi.
diff --git a/drivers/iio/imu/bmi270/Makefile b/drivers/iio/imu/bmi270/Makefile
index ab4acaaee6d2..d96c96fc3d83 100644
--- a/drivers/iio/imu/bmi270/Makefile
+++ b/drivers/iio/imu/bmi270/Makefile
@@ -4,3 +4,4 @@
 #
 obj-$(CONFIG_BMI270) += bmi270_core.o
 obj-$(CONFIG_BMI270_I2C) += bmi270_i2c.o
+obj-$(CONFIG_BMI270_SPI) += bmi270_spi.o
diff --git a/drivers/iio/imu/bmi270/bmi270.h b/drivers/iio/imu/bmi270/bmi270.h
index 608b29ea58a3..8950e6234203 100644
--- a/drivers/iio/imu/bmi270/bmi270.h
+++ b/drivers/iio/imu/bmi270/bmi270.h
@@ -4,11 +4,13 @@
 #define BMI270_H_
 
 #include <linux/regmap.h>
+#include <linux/iio/iio.h>
 
 struct device;
 struct bmi270_data {
 	struct device *dev;
 	struct regmap *regmap;
+	__le16 sample __aligned(IIO_DMA_MINALIGN);
 };
 
 extern const struct regmap_config bmi270_regmap_config;
diff --git a/drivers/iio/imu/bmi270/bmi270_core.c b/drivers/iio/imu/bmi270/bmi270_core.c
index 8e45343d6472..4decdad791d9 100644
--- a/drivers/iio/imu/bmi270/bmi270_core.c
+++ b/drivers/iio/imu/bmi270/bmi270_core.c
@@ -66,16 +66,9 @@ enum bmi270_scan {
 	BMI270_SCAN_GYRO_Z,
 };
 
-const struct regmap_config bmi270_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-};
-EXPORT_SYMBOL_NS_GPL(bmi270_regmap_config, IIO_BMI270);
-
 static int bmi270_get_data(struct bmi270_data *bmi270_device,
 			   int chan_type, int axis, int *val)
 {
-	__le16 sample;
 	int reg;
 	int ret;
 
@@ -90,11 +83,13 @@ static int bmi270_get_data(struct bmi270_data *bmi270_device,
 		return -EINVAL;
 	}
 
-	ret = regmap_bulk_read(bmi270_device->regmap, reg, &sample, sizeof(sample));
+	ret = regmap_bulk_read(bmi270_device->regmap, reg,
+			       &bmi270_device->sample,
+			       sizeof(bmi270_device->sample));
 	if (ret)
 		return ret;
 
-	*val = sign_extend32(le16_to_cpu(sample), 15);
+	*val = sign_extend32(le16_to_cpu(bmi270_device->sample), 15);
 
 	return 0;
 }
diff --git a/drivers/iio/imu/bmi270/bmi270_i2c.c b/drivers/iio/imu/bmi270/bmi270_i2c.c
index f70dee2d8a64..ce8279ae90cd 100644
--- a/drivers/iio/imu/bmi270/bmi270_i2c.c
+++ b/drivers/iio/imu/bmi270/bmi270_i2c.c
@@ -9,12 +9,17 @@
 
 #include "bmi270.h"
 
+const struct regmap_config bmi270_i2c_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
 static int bmi270_i2c_probe(struct i2c_client *client)
 {
 	struct regmap *regmap;
 	struct device *dev = &client->dev;
 
-	regmap = devm_regmap_init_i2c(client, &bmi270_regmap_config);
+	regmap = devm_regmap_init_i2c(client, &bmi270_i2c_regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "Failed to init i2c regmap");
diff --git a/drivers/iio/imu/bmi270/bmi270_spi.c b/drivers/iio/imu/bmi270/bmi270_spi.c
new file mode 100644
index 000000000000..906b9b852a09
--- /dev/null
+++ b/drivers/iio/imu/bmi270/bmi270_spi.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+#include <linux/iio/iio.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/regmap.h>
+
+#include "bmi270.h"
+
+/*
+ * The following two functions are taken from the BMI323 spi driver code.
+ * In section 6.4 of the BMI270 data it specifies that after a read
+ * operation the first data byte from the device is a dummy byte
+ */
+static int bmi270_regmap_spi_read(void *context, const void *reg_buf,
+				  size_t reg_size, void *val_buf,
+				  size_t val_size)
+{
+	struct spi_device *spi = context;
+
+	return spi_write_then_read(spi, reg_buf, reg_size, val_buf, val_size);
+}
+
+static int bmi270_regmap_spi_write(void *context, const void *data,
+				   size_t count)
+{
+	struct spi_device *spi = context;
+	u8 *data_buff = (u8 *)data;
+
+	/*
+	 * Remove the extra pad byte since its only needed for the read
+	 * operation
+	 */
+	data_buff[1] = data_buff[0];
+	return spi_write(spi, data_buff + 1, count - 1);
+}
+
+static const struct regmap_bus bmi270_regmap_bus = {
+	.read = bmi270_regmap_spi_read,
+	.write = bmi270_regmap_spi_write,
+};
+
+const struct regmap_config bmi270_spi_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.pad_bits = 8,
+	.read_flag_mask = BIT(7),
+};
+
+static int bmi270_spi_probe(struct spi_device *spi)
+{
+	struct regmap *regmap;
+	struct device *dev = &spi->dev;
+
+	regmap = devm_regmap_init(dev, &bmi270_regmap_bus, dev,
+				  &bmi270_spi_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Failed to init i2c regmap");
+
+	return bmi270_core_probe(dev, regmap);
+}
+
+static const struct spi_device_id bmi270_spi_id[] = {
+	{ "bmi270" },
+	{ }
+};
+
+static const struct of_device_id bmi270_of_match[] = {
+	{ .compatible = "bosch,bmi270" },
+	{ }
+};
+
+static struct spi_driver bmi270_spi_driver = {
+	.driver = {
+		.name = "bmi270",
+		.of_match_table = bmi270_of_match,
+	},
+	.probe = bmi270_spi_probe,
+	.id_table = bmi270_spi_id,
+};
+module_spi_driver(bmi270_spi_driver);
+
+MODULE_AUTHOR("Alex Lanzano");
+MODULE_DESCRIPTION("BMI270 driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(IIO_BMI270);
-- 
2.46.2

