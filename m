Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C4CC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Nov 2023 17:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A69634218B;
	Tue,  7 Nov 2023 17:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A69634218B
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QthjbYP7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuXT6QQyy-uc; Tue,  7 Nov 2023 17:33:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3EE374218D;
	Tue,  7 Nov 2023 17:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE374218D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BD3EC0039;
	Tue,  7 Nov 2023 17:33:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 497A4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24DAC611B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24DAC611B4
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QthjbYP7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A94R0BdxQj2I
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:33:28 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DAFE613FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 17:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DAFE613FC
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cc9b626a96so33001695ad.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Nov 2023 09:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699378407; x=1699983207;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bMEab8+78Xq3MAypc6voJ0oKphlDvT2dwsA01DU//uY=;
 b=QthjbYP7FUDiXetKD9jaP4zA/zhi1B0vE8uymsP69RuBlp84ImqJcTnTqQPwlZkXiR
 TMk7fEy+rxbM3YXrXg/PDq2nyS2G4J8wpsz/XL4Z8t0zFgmfc9r2zo991PxOLy+a6wJB
 P+/+T97RztSPUYk/ENfGrXXu9vsyVab+3gIrBsI9eOgJEfDAlkKB6ktJZ/4AadszMZYt
 +GrpsjC6TvSEneWyrXzid5NxJu5dZV5pIW3YFVrKaoi/VNRpXEZqsK1hOj1PzNxRNJmh
 FFY6pAxWY7lSc3no1CJU6p0o3Ax8xsT45s0VY0M8NZInAnQyS9tabwZ3TV2Q/t2x5F+Y
 hYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699378407; x=1699983207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMEab8+78Xq3MAypc6voJ0oKphlDvT2dwsA01DU//uY=;
 b=CVX0zMHeCdsLLbWzpcdMK0IAeVJeFD31QU3+0gx+aItO9Vop45ZtcMiWrukxAWEp9l
 gXLXfyP4vaG/QrslaNkaygTL5Z1R63ic8yQLywN6janOIkWHcW2OSsm9SgWjFQ6TcP7Q
 dJpnchXAvJvSMoXMBZLRg8uvT2zEvBs2sJ0T5+k6mKSRj5FKMrg2WQN28UJfXAmHRWch
 O9pJeWQ2mctrIy6Bo/xgik9geBeSF7XOL27uaf1ZK4VqHIc5TeX7e6c81Xz57L4o6vGC
 WigeAMI4cYbvjXXJfZ7MNuV3hvm+xsWTewup1stmaFTBS5A6bSmOJnV4j78lVNLAVhf6
 rpiA==
X-Gm-Message-State: AOJu0YxpXbPV564eP89XC4bJFwh7hwGljfEXU75S453u6FEw3VM0itMr
 4L6vZEbWUrcGtBhVgB9KhqA=
X-Google-Smtp-Source: AGHT+IHSqvdnqOEftkQcwl8OmNI2D/hJ/IRtgW1cTTFXQw2qnRjvjBoSaBKgB58TvBFiwrAHq5hKxA==
X-Received: by 2002:a17:902:da87:b0:1cc:4146:9eb0 with SMTP id
 j7-20020a170902da8700b001cc41469eb0mr29428427plx.57.1699378407353; 
 Tue, 07 Nov 2023 09:33:27 -0800 (PST)
Received: from archlinux.srmu.edu.in ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a170902b58d00b001c9db5e2929sm103116pls.93.2023.11.07.09.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 09:33:27 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 3/3] iio: chemical: add support for Asair AGS02MA
Date: Tue,  7 Nov 2023 23:00:55 +0530
Message-ID: <20231107173100.62715-3-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107173100.62715-1-anshulusr@gmail.com>
References: <20231107173100.62715-1-anshulusr@gmail.com>
MIME-Version: 1.0
Cc: Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Anshul Dalal <anshulusr@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jonathan Cameron <jic23@kernel.org>
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

A simple driver for the TVOC (Total Volatile Organic Compounds)
sensor from Asair: AGS02MA

Steps in reading the VOC sensor value over i2c:
  1. Read 5 bytes from the register `AGS02MA_TVOC_READ_REG` [0x00]
  2. The first 4 bytes are taken as the big endian sensor data with final
     byte being the CRC
  3. The CRC is verified and the value is returned over an
     `IIO_CHAN_INFO_RAW` channel

Tested on Raspberry Pi Zero 2W

Datasheet:
  https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
Product-Page:
  http://www.aosong.com/m/en/products-33.html

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---
 MAINTAINERS                    |   6 ++
 drivers/iio/chemical/Kconfig   |  11 +++
 drivers/iio/chemical/Makefile  |   1 +
 drivers/iio/chemical/ags02ma.c | 156 +++++++++++++++++++++++++++++++++
 4 files changed, 174 insertions(+)
 create mode 100644 drivers/iio/chemical/ags02ma.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 81d5fc0bba68..3592d83543b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3028,6 +3028,12 @@ S:	Supported
 W:	http://www.akm.com/
 F:	drivers/iio/magnetometer/ak8974.c
 
+ASAIR AGS02MA TVOC SENSOR DRIVER
+M:	Anshul Dalal <anshulusr@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	drivers/iio/chemical/ags02ma.c
+
 ASC7621 HARDWARE MONITOR DRIVER
 M:	George Joseph <george.joseph@fairview5.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/iio/chemical/Kconfig b/drivers/iio/chemical/Kconfig
index c30657e10ee1..58c57c15abdb 100644
--- a/drivers/iio/chemical/Kconfig
+++ b/drivers/iio/chemical/Kconfig
@@ -5,6 +5,17 @@
 
 menu "Chemical Sensors"
 
+config ASAIR_AGS02MA
+	tristate "Asair AGS02MA TVOC sensor driver"
+	depends on I2C
+	select crc8
+	help
+	  Say Y here to build support for Asair AGS02MA TVOC (Total Volatile
+	  Organic Compounds) sensor.
+
+	  To compile this driver as module, choose M here: the module will be
+	  called ags02ma.
+
 config ATLAS_PH_SENSOR
 	tristate "Atlas Scientific OEM SM sensors"
 	depends on I2C
diff --git a/drivers/iio/chemical/Makefile b/drivers/iio/chemical/Makefile
index a11e777a7a00..885009f6115f 100644
--- a/drivers/iio/chemical/Makefile
+++ b/drivers/iio/chemical/Makefile
@@ -4,6 +4,7 @@
 #
 
 # When adding new entries keep the list in alphabetical order
+obj-$(CONFIG_ASAIR_AGS02MA)	+= ags02ma.o
 obj-$(CONFIG_ATLAS_PH_SENSOR)	+= atlas-sensor.o
 obj-$(CONFIG_ATLAS_EZO_SENSOR)	+= atlas-ezo-sensor.o
 obj-$(CONFIG_BME680) += bme680_core.o
diff --git a/drivers/iio/chemical/ags02ma.c b/drivers/iio/chemical/ags02ma.c
new file mode 100644
index 000000000000..6590219c076e
--- /dev/null
+++ b/drivers/iio/chemical/ags02ma.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 Anshul Dalal <anshulusr@gmail.com>
+ *
+ * Driver for Asair AGS02MA
+ *
+ * Datasheet: https://asairsensors.com/wp-content/uploads/2021/09/AGS02MA.pdf
+ * Product Page: http://www.aosong.com/m/en/products-33.html
+ *
+ * TODO:
+ *	- Add support for ug/m^3 units of measurement
+ *	- Add support for modifying i2c address
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
+		ret = ags02ma_register_read(data->client, AGS02MA_TVOC_READ_REG,
+					    AGS02MA_TVOC_READ_PROCESSING_DELAY);
+		if (ret < 0)
+			return ret;
+		*val = ret;
+		return IIO_VAL_INT;
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
+	dev_dbg(&client->dev, "Asair AGS02MA, Version: 0x%x", version);
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
+static struct i2c_driver ags02ma_driver = {
+	.driver = {
+		.name = AGS02MA_DEVICE_NAME,
+	},
+	.id_table = ags02ma_id_table,
+	.probe = ags02ma_probe,
+};
+module_i2c_driver(ags02ma_driver);
+
+MODULE_AUTHOR("Anshul Dalal <anshulusr@gmail.com>");
+MODULE_DESCRIPTION("Asair AGS02MA TVOC Driver");
+MODULE_LICENSE("GPL");
-- 
2.42.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
