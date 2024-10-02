Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A806E1642B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 03:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727840208; cv=none; b=ZCDnUJ4EwQJIFJjHzm983vZdwzLsychqRGSnlDoQkg+WLluRuydmjnLsKZ1cvZG8jYHwpQWVsCTJZwgahYm/UFkRJtRnrd44Rv/s4DgdMx5yaAHbY7m3ZVwVKMZbxBYwFGpZ8XlTCbEoEQdTo0g8GcZtBahBKeI3e4BpTxt+9kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727840208; c=relaxed/simple;
	bh=L4NzGFQcO6PX+KJV0Ui6Rmjl8d+ZZBqDVW7zHm4NBwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rm+BuHuJlZH7GQwChx6i0RGqtBxkdnvSK3cINtQRNosLFBAot3KugoSpoCtsKx1GWzNqC1cvLnWSJZvSujPQb5TJfgAD64ivDBiWl561neeZGa8ubHCpi20vE5scaIPeMMCg4B8sbfe4P3CAqmMr73pu0D90ncDJMtrZovu4Htg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhvWC0MD; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhvWC0MD"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B8F580B8D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 03:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGFh_EURlIUz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Oct 2024 03:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 17E6E80B76
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17E6E80B76
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RhvWC0MD
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 17E6E80B76
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 03:36:44 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6cb3062d9a6so51566386d6.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 01 Oct 2024 20:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727840203; x=1728445003; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bV3u9CcluYyYwNmKPnJnslG0Jl3Fd+oK5lR5WfckDS8=;
        b=RhvWC0MDMHhXJrp9ReWr+0Sq2I+STrbwmB/av2mDkL2h7Bj/O/uNt53Q+W6eK2dSpm
         zswszdfhOh+P12oexP5mWT6zjnDXs44j8YuK5mtsci57FnPeHuTkZjPTZ1hcTM92Za+2
         6q57B4mlq7fRE9LCFdTLeFvPQ9lcj50eCm/1QrGlPPsywQU1IzC1Xd50Dox4m2LTwNMu
         F+x3aA6SM9ZP080Aw3MFs3Wg1ojc/g3Ij+1IUWjB0HVDAZuexYqY16fUWuFJEuvkdAro
         8jV901NoZspZjQVWlYhfBL9Slf5UjDHNTjHuS8YTsf5WD2jxI4uAmcEAdHPR0BoKFe9j
         CwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727840203; x=1728445003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bV3u9CcluYyYwNmKPnJnslG0Jl3Fd+oK5lR5WfckDS8=;
        b=f2tuBgZGYav8m/VWzYi9FdZHfjqVd78rBsY6uS6nE1SsnxQB3QNby32nppDPbAoz7T
         zM1UWJMFFbgRh1DtU0y2LftrPKt+XbZw1Uogur6ELLL7xXiUijcBj+tE53RuIP+2K4Kq
         BIL3Vm2JtKi7zsHse+zbw9Tg2S7NoSTOiQp/zJfCXwxVcz0Ubk1eb4wbnQ7cb7yNx0t8
         nQ0U73+vO+7VCuPUMjBFd60y8pzZrpysKxrnnrdOW3IvHoCe2R4d5npt4h4XZY3e5OqW
         jmYReGsbajp60WQXK5kfWw8+oKwn6G/wiHnSZz/5RPx47km/YNiiElo/JpgQCg3SXv9Q
         fsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdAHFgcXmwqRJWewHqF6CEtH6rIcoWb2Alqy0s/OZfLZr1XFDrIk4aOvC3Zw08JvSFwLzP35pHpr7eOLd9BZNCtZA+Eg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzM/XRc6RSDUT0lAzTh9NDeyx254Jh4tLNSbLBZ3edZWBxpnHep
	i2bCGX2pyUR22NVMxF8DUDSDkKHfM83nLUXpe0fHKSA685Qws5SD
X-Google-Smtp-Source: AGHT+IHLTLy9CNseakdYC7EkLXEGTVDYpBTWCMMDmkf9orXTFrvpWUQIEIhnTRcR7U8IRZV0WNLuyw==
X-Received: by 2002:a05:6214:5904:b0:6cb:3279:f0ac with SMTP id 6a1803df08f44-6cb819f5f7dmr28859896d6.24.1727840203529;
        Tue, 01 Oct 2024 20:36:43 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b66cdddsm56089696d6.88.2024.10.01.20.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 20:36:42 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v2 1/1] iio: imu: bmi270: Add spi driver for bmi270 imu
Date: Tue,  1 Oct 2024 23:36:22 -0400
Message-ID: <20241002033628.681812-1-lanzano.alex@gmail.com>
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

Changes in v2:
- Remove unnecessary __le16 sample variable out of priv data
- Add static to regmap_config structures
- Sort includes in bmi270_spi.c alphabetically
- Rename "context" argument for spi regmap functions to "spi" and use it directly
- Replace spi_write with spi_write_then_read to ensure bounce buffer is
always used

---
 drivers/iio/imu/bmi270/Kconfig       | 12 ++++
 drivers/iio/imu/bmi270/Makefile      |  1 +
 drivers/iio/imu/bmi270/bmi270.h      |  1 +
 drivers/iio/imu/bmi270/bmi270_core.c | 10 +---
 drivers/iio/imu/bmi270/bmi270_i2c.c  |  7 ++-
 drivers/iio/imu/bmi270/bmi270_spi.c  | 86 ++++++++++++++++++++++++++++
 6 files changed, 109 insertions(+), 8 deletions(-)
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
index 608b29ea58a3..8ac20ad7ee94 100644
--- a/drivers/iio/imu/bmi270/bmi270.h
+++ b/drivers/iio/imu/bmi270/bmi270.h
@@ -4,6 +4,7 @@
 #define BMI270_H_
 
 #include <linux/regmap.h>
+#include <linux/iio/iio.h>
 
 struct device;
 struct bmi270_data {
diff --git a/drivers/iio/imu/bmi270/bmi270_core.c b/drivers/iio/imu/bmi270/bmi270_core.c
index 8e45343d6472..638ce2c30d0e 100644
--- a/drivers/iio/imu/bmi270/bmi270_core.c
+++ b/drivers/iio/imu/bmi270/bmi270_core.c
@@ -66,12 +66,6 @@ enum bmi270_scan {
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
@@ -90,7 +84,9 @@ static int bmi270_get_data(struct bmi270_data *bmi270_device,
 		return -EINVAL;
 	}
 
-	ret = regmap_bulk_read(bmi270_device->regmap, reg, &sample, sizeof(sample));
+	ret = regmap_bulk_read(bmi270_device->regmap, reg,
+			       &sample,
+			       sizeof(sample));
 	if (ret)
 		return ret;
 
diff --git a/drivers/iio/imu/bmi270/bmi270_i2c.c b/drivers/iio/imu/bmi270/bmi270_i2c.c
index f70dee2d8a64..e9025d22d5cc 100644
--- a/drivers/iio/imu/bmi270/bmi270_i2c.c
+++ b/drivers/iio/imu/bmi270/bmi270_i2c.c
@@ -9,12 +9,17 @@
 
 #include "bmi270.h"
 
+static const struct regmap_config bmi270_i2c_regmap_config = {
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
index 000000000000..34d5ba6273bb
--- /dev/null
+++ b/drivers/iio/imu/bmi270/bmi270_spi.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+#include <linux/iio/iio.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+
+#include "bmi270.h"
+
+/*
+ * The following two functions are taken from the BMI323 spi driver code.
+ * In section 6.4 of the BMI270 data it specifies that after a read
+ * operation the first data byte from the device is a dummy byte
+ */
+static int bmi270_regmap_spi_read(void *spi, const void *reg_buf,
+				  size_t reg_size, void *val_buf,
+				  size_t val_size)
+{
+	return spi_write_then_read(spi, reg_buf, reg_size, val_buf, val_size);
+}
+
+static int bmi270_regmap_spi_write(void *spi, const void *data,
+				   size_t count)
+{
+	u8 *data_buff = (u8 *)data;
+
+	/*
+	 * Remove the extra pad byte since its only needed for the read
+	 * operation
+	 */
+	data_buff[1] = data_buff[0];
+	return spi_write_then_read(spi, data_buff + 1, count - 1, NULL, 0);
+}
+
+static const struct regmap_bus bmi270_regmap_bus = {
+	.read = bmi270_regmap_spi_read,
+	.write = bmi270_regmap_spi_write,
+};
+
+static const struct regmap_config bmi270_spi_regmap_config = {
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

