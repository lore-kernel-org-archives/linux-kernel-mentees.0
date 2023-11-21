Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA3F3C091
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ezi6dsbR"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F240607EC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 09:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F240607EC
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ezi6dsbR
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id REjGyxKG8Zxt
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 21 Nov 2023 09:59:57 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F0650607E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 09:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0650607E3
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6c3363a2b93so5081534b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Nov 2023 01:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700560796; x=1701165596; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQ/YNQr6tUgsIDrHiHHLOY/pXL1P8RTvK6IheVvqGHI=;
        b=Ezi6dsbRI0U4C1ygNzdECTtTHILPirhdPePnEgORPDTEKAAL/C8CRBeBQko65dWeef
         SqEj7bfji/lcwmWC7xFB6O9ydcxTpht1cyzFBMKxdhBh6A6JGRyhDOA6EPbWq7FkLQqc
         1xBzmSG44INOMOnLkelTKNliF/IgbJypZ1Dxk/+3v7GwUYFlIghjbb0sKKa0dcYmFPUq
         xAFuT82xsB2nAGccsaGeldQuEVQ463Zo3HVF8eVxN0FhL/i+bnRV9daHvSRrNIXW6YCT
         BfOyRlWpxC0/wQ7fADZtSepKqFpx/pclbDWT3saJdht+hWYA8Q5Lhv9Irp5HSm70cK9J
         pE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700560796; x=1701165596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQ/YNQr6tUgsIDrHiHHLOY/pXL1P8RTvK6IheVvqGHI=;
        b=bRARPZcnP/yIprqCpmRu25lrPgLk6aAA0rPl2/ihMvbXHPxTk23yfsEuRhQ7vdzfhj
         mmpuBy24A8wquZwmt4fhxpzKX4k3JYoZAc/zq+0cfRQxNLq5fwtbOClwaK1xFxLRpGJj
         hqpgY/U4j7x1LVfOmF7gosk/48/yOR/J/8+dND2gGEtX16yXRKgucdx1KgrojY6fGl3b
         CM3FJQnROS/hZYBBlB0HHRXysRXajNT7O3Zn315cxs9/d1DDjuWuxqGlGd/8aRat72F1
         q1dJ0gawpS3/X3F/34Ry8l2P2dDULezNYvp817gj5qP/3FOLu9d3rR+CjdatOjlJwNzY
         jRkg==
X-Gm-Message-State: AOJu0YzRkWupx+duDpbo+P6LGZXALm9RmHDMpMhz7X3eBqDha8IPjcZm
	WdWvQmy9C9P1bgkrNaCVrfg=
X-Google-Smtp-Source: AGHT+IELCT4f6RHWkvY5fyBGFOiGs8h9XYBqu0aGsrZxXQWjlca14E72x+FJoWsReCqFtNNG0TWIEw==
X-Received: by 2002:a05:6a21:3403:b0:189:bde9:9cb0 with SMTP id yn3-20020a056a21340300b00189bde99cb0mr13223976pzb.27.1700560796196;
        Tue, 21 Nov 2023 01:59:56 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id c14-20020a170903234e00b001cf68e1c5a1sm2047415plh.4.2023.11.21.01.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 01:59:55 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Anshul Dalal <anshulusr@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH v3 3/3] iio: chemical: add support for Aosong AGS02MA
Date: Tue, 21 Nov 2023 15:27:59 +0530
Message-ID: <20231121095800.2180870-3-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231121095800.2180870-1-anshulusr@gmail.com>
References: <20231121095800.2180870-1-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A simple driver for the TVOC (Total Volatile Organic Compounds)
sensor from Aosong: AGS02MA

Steps in reading the VOC sensor value over i2c:
  1. Read 5 bytes from the register `AGS02MA_TVOC_READ_REG` [0x00]
  2. The first 4 bytes are taken as the big endian sensor data with final
     byte being the CRC
  3. The CRC is verified and the value is returned over an
     `IIO_CHAN_INFO_RAW` channel as percents

Tested on Raspberry Pi Zero 2W

Datasheet:
  https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
Product-Page:
  http://www.aosong.com/m/en/products-33.html

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---

Changes for v3:
- Added of_device_id

v2: https://lore.kernel.org/lkml/20231115125810.1394854-3-anshulusr@gmail.com/

Changes for v2:
- Fixed Kconfig not selecting CRC8 (used to be `select crc8`)
- Changed instances of asair to aosong
- Report raw readings in percents instead of ppb
- Added myself as maintainer for the device binding

v1: https://lore.kernel.org/lkml/20231107173100.62715-3-anshulusr@gmail.com/
---
 MAINTAINERS                    |   7 ++
 drivers/iio/chemical/Kconfig   |  11 +++
 drivers/iio/chemical/Makefile  |   1 +
 drivers/iio/chemical/ags02ma.c | 168 +++++++++++++++++++++++++++++++++
 4 files changed, 187 insertions(+)
 create mode 100644 drivers/iio/chemical/ags02ma.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 81d5fc0bba68..ba3c950aca1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3028,6 +3028,13 @@ S:	Supported
 W:	http://www.akm.com/
 F:	drivers/iio/magnetometer/ak8974.c
 
+AOSONG AGS02MA TVOC SENSOR DRIVER
+M:	Anshul Dalal <anshulusr@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/chemical/aosong,ags02ma.yaml
+F:	drivers/iio/chemical/ags02ma.c
+
 ASC7621 HARDWARE MONITOR DRIVER
 M:	George Joseph <george.joseph@fairview5.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/iio/chemical/Kconfig b/drivers/iio/chemical/Kconfig
index c30657e10ee1..02649ab81b3c 100644
--- a/drivers/iio/chemical/Kconfig
+++ b/drivers/iio/chemical/Kconfig
@@ -5,6 +5,17 @@
 
 menu "Chemical Sensors"
 
+config AOSONG_AGS02MA
+	tristate "Aosong AGS02MA TVOC sensor driver"
+	depends on I2C
+	select CRC8
+	help
+	  Say Y here to build support for Aosong AGS02MA TVOC (Total Volatile
+	  Organic Compounds) sensor.
+
+	  To compile this driver as module, choose M here: the module will be
+	  called ags02ma.
+
 config ATLAS_PH_SENSOR
 	tristate "Atlas Scientific OEM SM sensors"
 	depends on I2C
diff --git a/drivers/iio/chemical/Makefile b/drivers/iio/chemical/Makefile
index a11e777a7a00..2f3dee8bb779 100644
--- a/drivers/iio/chemical/Makefile
+++ b/drivers/iio/chemical/Makefile
@@ -4,6 +4,7 @@
 #
 
 # When adding new entries keep the list in alphabetical order
+obj-$(CONFIG_AOSONG_AGS02MA)	+= ags02ma.o
 obj-$(CONFIG_ATLAS_PH_SENSOR)	+= atlas-sensor.o
 obj-$(CONFIG_ATLAS_EZO_SENSOR)	+= atlas-ezo-sensor.o
 obj-$(CONFIG_BME680) += bme680_core.o
diff --git a/drivers/iio/chemical/ags02ma.c b/drivers/iio/chemical/ags02ma.c
new file mode 100644
index 000000000000..04a07307caa9
--- /dev/null
+++ b/drivers/iio/chemical/ags02ma.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 Anshul Dalal <anshulusr@gmail.com>
+ *
+ * Driver for Aosong AGS02MA
+ *
+ * Datasheet:
+ *   https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
+ * Product Page:
+ *   http://www.aosong.com/m/en/products-33.html
+ *
+ * TODO:
+ *   - Add support for ug/m^3 units of measurement
+ *   - Add support for modifying i2c address
+ */
+
+#include <linux/crc8.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/iio/iio.h>
+#include <linux/module.h>
+
+#define AGS02MA_DEVICE_NAME		   "ags02ma"
+
+#define AGS02MA_TVOC_READ_REG		   0x00
+#define AGS02MA_VERSION_REG		   0x11
+
+#define AGS02MA_VERSION_PROCESSING_DELAY   30
+#define AGS02MA_TVOC_READ_PROCESSING_DELAY 1500
+
+#define AGS02MA_CRC8_INIT		   0xff
+#define AGS02MA_CRC8_POLYNOMIAL		   0x31
+#define AGS02MA_PPB_PERCENT_CONVERSION     10000000
+
+DECLARE_CRC8_TABLE(ags02ma_crc8_table);
+
+struct ags02ma_data {
+	struct i2c_client *client;
+};
+
+struct ags02ma_reading {
+	__be32 data;
+	u8 crc;
+} __packed;
+
+static u32 ags02ma_register_read(struct i2c_client *client, u8 reg, u16 delay)
+{
+	u32 ret;
+	u8 crc;
+	struct ags02ma_reading read_buffer;
+
+	ret = i2c_master_send(client, &reg, sizeof(reg));
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to send data to register 0x%x: %d", reg, ret);
+		return ret;
+	}
+
+	/* Processing Delay, Check Table 7.7 in the datasheet */
+	msleep_interruptible(delay);
+
+	ret = i2c_master_recv(client, (u8 *)&read_buffer, sizeof(read_buffer));
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to receive from register 0x%x: %d", reg, ret);
+		return ret;
+	}
+	ret = be32_to_cpu(read_buffer.data);
+
+	crc = crc8(ags02ma_crc8_table, (u8 *)&read_buffer.data,
+		   sizeof(read_buffer.data), AGS02MA_CRC8_INIT);
+	if (crc != read_buffer.crc) {
+		dev_err(&client->dev, "CRC error\n");
+		return -EIO;
+	}
+
+	return ret;
+}
+
+static int ags02ma_read_raw(struct iio_dev *iio_device,
+			    struct iio_chan_spec const *chan, int *val,
+			    int *val2, long mask)
+{
+	int ret;
+	struct ags02ma_data *data = iio_priv(iio_device);
+
+	if (mask == IIO_CHAN_INFO_RAW) {
+		/* The sensor reads data as ppb */
+		ret = ags02ma_register_read(data->client, AGS02MA_TVOC_READ_REG,
+					    AGS02MA_TVOC_READ_PROCESSING_DELAY);
+		if (ret < 0)
+			return ret;
+		*val = ret;
+		*val2 = AGS02MA_PPB_PERCENT_CONVERSION;
+		return IIO_VAL_FRACTIONAL;
+	} else {
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info ags02ma_info = {
+	.read_raw = ags02ma_read_raw,
+};
+
+static const struct iio_chan_spec ags02ma_channels[] = {
+	{ .type = IIO_CONCENTRATION,
+	  .channel2 = IIO_MOD_VOC,
+	  .info_mask_separate = BIT(IIO_CHAN_INFO_RAW) }
+};
+
+static int ags02ma_probe(struct i2c_client *client)
+{
+	int ret;
+	struct ags02ma_data *data;
+	struct iio_dev *indio_dev;
+	u32 version;
+
+	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	crc8_populate_msb(ags02ma_crc8_table, AGS02MA_CRC8_POLYNOMIAL);
+
+	ret = ags02ma_register_read(client, AGS02MA_VERSION_REG,
+				    AGS02MA_VERSION_PROCESSING_DELAY);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read device version: %d", ret);
+		return ret;
+	}
+	version = ret;
+	dev_dbg(&client->dev, "Aosong AGS02MA, Version: 0x%x", version);
+
+	data = iio_priv(indio_dev);
+	i2c_set_clientdata(client, indio_dev);
+	data->client = client;
+	indio_dev->info = &ags02ma_info;
+	indio_dev->channels = ags02ma_channels;
+	indio_dev->num_channels = ARRAY_SIZE(ags02ma_channels);
+	indio_dev->name = AGS02MA_DEVICE_NAME;
+
+	return devm_iio_device_register(&client->dev, indio_dev);
+}
+
+static const struct i2c_device_id ags02ma_id_table[] = {
+	{ AGS02MA_DEVICE_NAME, 0 },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, ags02ma_id_table);
+
+static const struct of_device_id ags02ma_of_table[] = {
+	{ .compatible = "aosong,ags02ma"},
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ags02ma_of_table);
+
+static struct i2c_driver ags02ma_driver = {
+	.driver = {
+		.name = AGS02MA_DEVICE_NAME,
+		.of_match_table = of_match_ptr(ags02ma_of_table),
+	},
+	.id_table = ags02ma_id_table,
+	.probe = ags02ma_probe,
+};
+module_i2c_driver(ags02ma_driver);
+
+MODULE_AUTHOR("Anshul Dalal <anshulusr@gmail.com>");
+MODULE_DESCRIPTION("Aosong AGS02MA TVOC Driver");
+MODULE_LICENSE("GPL");
-- 
2.42.1

