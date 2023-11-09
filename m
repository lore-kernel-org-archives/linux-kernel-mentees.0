Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5A410A23
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5mfYT7l"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26408819D1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 09:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26408819D1
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M5mfYT7l
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NKs61u3CZBT
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  9 Nov 2023 09:07:23 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CE2F6818A7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Nov 2023 09:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE2F6818A7
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc5916d578so5469165ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 09 Nov 2023 01:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699520843; x=1700125643; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEZyb/QZ2iPnGY0ahNBgyCxqyLsITOxiF+qCJVvMOPs=;
        b=M5mfYT7lDU55UNf2gwzfL20BxOUQDkmEZzswrtGweCgCvoRPuyBgtUcPtkhcjFllkJ
         4Hwa8WjGmgPCaOYpYT6RZzLHJathXn4fgoQAvgWC1UuI3qSK69Pdc9olfhDuWSfCXGTZ
         sG7wuGT0ufW2D9d0iX5d2UBxdlpjbOYrEVtyJV/fAsLebBKsi+FWLWfk39tIcBjNiqW4
         +uQHNtdxpA4X22m66YKDJ9HAUpsmK9AdxMR9I8HlRRk6PSG/hbEboC9SUsh8mgNmOGsA
         ClsxVxjywxYDWSmCmNeBp31yu0GWnWaWRyEx6wm+74HS6XZi+Znbnkv2kuJqNucTSFXU
         GhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520843; x=1700125643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEZyb/QZ2iPnGY0ahNBgyCxqyLsITOxiF+qCJVvMOPs=;
        b=se40kuHZxM+Wavnzf/Arw8gFHyMVi48fNGz1KvzEqXpjGg71XiLI97UQ+69fE6DJNu
         P4mZxcwzMblaaeFuRB+LiLadhALCX75G1itp2Y7lRprA0kPGLYQfK9jVlnXILc5amGtP
         UtSlycCmrIE8R6zHAcQpCVr+OI7wP05H6rKbF/VhWfX0/lcGVj6r9sqvaKSRHAu635L0
         5BZrxxPdEybPyQWLcU4r7DkeQX4cI0Ojxf6Q9t4jbMxKygUNSSM/lWSK5oIQAGiIq/GA
         zUaIdAb0uJ6Bl3CJlFwcOF0qE3dOJUv8iKX219AqqW0MFDReYTdt2U0e8tMndF2aY/kv
         5QQA==
X-Gm-Message-State: AOJu0YxLMFbPpLa3mmbEXkKVEo1fieLzdN/BZiUauyDGgR/OH6Y0/CvL
	CFwlWn2ATEQaqT7wrowv0hduIjuo2gaiHqut
X-Google-Smtp-Source: AGHT+IGeWGUEyOQofbQudaULEri10tJouat6FrH5luTseGWZO0IiqO6rLe2Djnr0bmJanzla+WkiOQ==
X-Received: by 2002:a17:902:d512:b0:1cc:6fa1:c99f with SMTP id b18-20020a170902d51200b001cc6fa1c99fmr5379880plg.57.1699520843128;
        Thu, 09 Nov 2023 01:07:23 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:2353:8963:b940:1ac0:2fbc:6b6])
        by smtp.gmail.com with ESMTPSA id jj17-20020a170903049100b001b06c106844sm3036318plb.151.2023.11.09.01.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:07:22 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Anshul Dalal <anshulusr@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] iio: light: driver for Lite-On ltr390
Date: Thu,  9 Nov 2023 14:34:54 +0530
Message-ID: <20231109090456.814230-2-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109090456.814230-1-anshulusr@gmail.com>
References: <20231109090456.814230-1-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implements driver for the Ambient/UV Light sensor LTR390.
The driver exposes two ways of getting sensor readings:
  1. Raw UV Counts directly from the sensor
  2. The computed UV Index value with a percision of 2 decimal places

NOTE: Ambient light sensing has not been implemented yet.

Datasheet:
  https://optoelectronics.liteon.com/upload/download/DS86-2015-0004/LTR-390UV_Final_%20DS_V1%201.pdf

Driver tested on RPi Zero 2W

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---
 MAINTAINERS                |   7 ++
 drivers/iio/light/Kconfig  |  11 ++
 drivers/iio/light/Makefile |   1 +
 drivers/iio/light/ltr390.c | 224 +++++++++++++++++++++++++++++++++++++
 4 files changed, 243 insertions(+)
 create mode 100644 drivers/iio/light/ltr390.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 81d5fc0bba68..c9f2238673f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12484,6 +12484,13 @@ S:	Maintained
 W:	http://linux-test-project.github.io/
 T:	git https://github.com/linux-test-project/ltp.git
 
+LTR390 AMBIENT/UV LIGHT SENSOR DRIVER
+M:	Anshul Dalal <anshulusr@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
+F:	drivers/iio/light/ltr390.c
+
 LYNX 28G SERDES PHY DRIVER
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/iio/light/Kconfig b/drivers/iio/light/Kconfig
index 45edba797e4c..61993ae79afe 100644
--- a/drivers/iio/light/Kconfig
+++ b/drivers/iio/light/Kconfig
@@ -347,6 +347,17 @@ config SENSORS_LM3533
 	  changes. The ALS-control output values can be set per zone for the
 	  three current output channels.
 
+config LTR390
+	tristate "LTR-390UV-01 ambient light and UV sensor"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for the Lite-On LTR-390UV-01
+	  ambient light and UV sensor.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called ltr390.
+
 config LTR501
 	tristate "LTR-501ALS-01 light sensor"
 	depends on I2C
diff --git a/drivers/iio/light/Makefile b/drivers/iio/light/Makefile
index c0db4c4c36ec..550f8b408bc2 100644
--- a/drivers/iio/light/Makefile
+++ b/drivers/iio/light/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_SENSORS_ISL29028)	+= isl29028.o
 obj-$(CONFIG_ISL29125)		+= isl29125.o
 obj-$(CONFIG_JSA1212)		+= jsa1212.o
 obj-$(CONFIG_SENSORS_LM3533)	+= lm3533-als.o
+obj-$(CONFIG_LTR390)		+= ltr390.o
 obj-$(CONFIG_LTR501)		+= ltr501.o
 obj-$(CONFIG_LTRF216A)		+= ltrf216a.o
 obj-$(CONFIG_LV0104CS)		+= lv0104cs.o
diff --git a/drivers/iio/light/ltr390.c b/drivers/iio/light/ltr390.c
new file mode 100644
index 000000000000..1445f944bfd0
--- /dev/null
+++ b/drivers/iio/light/ltr390.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * IIO driver for Lite-On LTR390 ALS and UV sensor
+ * (7-bit I2C slave address 0x53)
+ *
+ * Based on the work of:
+ *   Shreeya Patel and Shi Zhigang (LTRF216 Driver)
+ *
+ * Copyright (C) 2023 Anshul Dalal <anshulusr@gmail.com>
+ *
+ * Datasheet: https://optoelectronics.liteon.com/upload/download/DS86-2015-0004/LTR-390UV_Final_%20DS_V1%201.pdf
+ *
+ * TODO:
+ *   - Support for configurable gain and resolution
+ *   - Sensor suspend/resume support
+ *   - Add support for reading the ALS
+ *   - Interrupt support
+ */
+
+#include <asm/unaligned.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/iio/iio.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+
+#define LTR390_DEVICE_NAME	   "ltr390"
+
+#define LTR390_MAIN_CTRL	   0x00
+#define LTR390_PART_ID		   0x06
+#define LTR390_UVS_DATA		   0x10
+
+#define LTR390_SW_RESET		   BIT(4)
+#define LTR390_UVS_MODE		   BIT(3)
+#define LTR390_SENSOR_ENABLE	   BIT(1)
+
+#define LTR390_PART_NUMBER_ID	   0xb
+#define LTR390_FRCTIONAL_PERCISION 100
+
+/*
+ * At 20-bit resolution (integration time: 400ms) and 18x gain, 2300 counts of
+ * the sensor are equal to 1 UV Index [Datasheet Page#8].
+ *
+ * For the default resolution of 18-bit (integration time: 100ms) and default
+ * gain of 3x, the counts/uvi are calculated as follows:
+ * 2300 / ((3/18) * (100/400)) = 95.83
+ */
+#define LTR390_COUNTS_PER_UVI 96
+
+/*
+ * Window Factor is needed when the device is under Window glass with coated
+ * tinted ink. This is to compensate for the light loss due to the lower
+ * transmission rate of the window glass and helps * in calculating lux.
+ */
+#define LTR390_WINDOW_FACTOR 1
+
+struct ltr390_data {
+	struct regmap *regmap;
+	struct i2c_client *client;
+	struct mutex lock;
+};
+
+static const struct regmap_config ltr390_regmap_config = {
+	.name = LTR390_DEVICE_NAME,
+	.reg_bits = 8,
+	.reg_stride = 1,
+	.val_bits = 8,
+};
+
+static int ltr390_register_read(struct ltr390_data *data, u8 register_address)
+{
+	struct device *dev = &data->client->dev;
+	int ret;
+	u8 recieve_buffer[3];
+
+	mutex_lock(&data->lock);
+
+	ret = regmap_bulk_read(data->regmap, register_address, recieve_buffer,
+			       sizeof(recieve_buffer));
+	if (ret) {
+		dev_err(dev, "failed to read measurement data: %d\n", ret);
+		mutex_unlock(&data->lock);
+		return ret;
+	}
+
+	mutex_unlock(&data->lock);
+	return get_unaligned_le24(recieve_buffer);
+}
+
+static int ltr390_get_uv_index(struct ltr390_data *data)
+{
+	int ret;
+	int uv_index;
+
+	ret = ltr390_register_read(data, LTR390_UVS_DATA);
+	if (ret < 0)
+		return ret;
+
+	uv_index = DIV_ROUND_CLOSEST(ret * LTR390_FRCTIONAL_PERCISION *
+					     LTR390_WINDOW_FACTOR,
+				     LTR390_COUNTS_PER_UVI);
+
+	return uv_index;
+}
+
+static int ltr390_read_raw(struct iio_dev *iio_device,
+			   struct iio_chan_spec const *chan, int *val,
+			   int *val2, long mask)
+{
+	int ret;
+	struct ltr390_data *data = iio_priv(iio_device);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_PROCESSED:
+		ret = ltr390_get_uv_index(data);
+		if (ret < 0)
+			return ret;
+		*val = ret;
+		*val2 = LTR390_FRCTIONAL_PERCISION;
+		return IIO_VAL_FRACTIONAL;
+	case IIO_CHAN_INFO_RAW:
+		ret = ltr390_register_read(data, LTR390_UVS_DATA);
+		if (ret < 0)
+			return ret;
+		*val = ret;
+		return IIO_VAL_INT;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info ltr390_info = {
+	.read_raw = ltr390_read_raw,
+};
+
+static const struct iio_chan_spec ltr390_channels[] = {
+	{
+		.type = IIO_UVINDEX,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED)
+	},
+	{
+		.type = IIO_INTENSITY,
+		.channel2 = IIO_MOD_LIGHT_UV,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW)
+	},
+};
+
+static int ltr390_probe(struct i2c_client *client)
+{
+	struct ltr390_data *data;
+	struct iio_dev *indio_dev;
+	int ret, part_number;
+
+	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	data = iio_priv(indio_dev);
+
+	data->regmap = devm_regmap_init_i2c(client, &ltr390_regmap_config);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(data->regmap),
+				     "regmap initialization failed\n");
+
+	data->client = client;
+	i2c_set_clientdata(client, indio_dev);
+	mutex_init(&data->lock);
+
+	indio_dev->info = &ltr390_info;
+	indio_dev->channels = ltr390_channels;
+	indio_dev->num_channels = ARRAY_SIZE(ltr390_channels);
+	indio_dev->name = LTR390_DEVICE_NAME;
+
+	ret = regmap_read(data->regmap, LTR390_PART_ID, &part_number);
+	if (ret) {
+		dev_err(&client->dev, "failed to get sensor's part id: %d",
+			ret);
+		return ret;
+	}
+	/* Lower 4 bits of `part_number` change with hardware revisions */
+	if (part_number >> 4 != LTR390_PART_NUMBER_ID) {
+		dev_err(&client->dev, "received invalid product id: 0x%x",
+			part_number);
+		return -ENODEV;
+	}
+	dev_dbg(&client->dev, "LTR390, product id: 0x%x\n", part_number);
+
+	/* reset sensor, chip fails to respond to this, so ignore any errors */
+	regmap_set_bits(data->regmap, LTR390_MAIN_CTRL, LTR390_SW_RESET);
+
+	/* Wait for the registers to reset before proceeding */
+	usleep_range(1000, 2000);
+
+	ret = regmap_set_bits(data->regmap, LTR390_MAIN_CTRL,
+			      LTR390_SENSOR_ENABLE | LTR390_UVS_MODE);
+	if (ret) {
+		dev_err(&client->dev, "failed to enable the sensor: %d\n", ret);
+		return ret;
+	}
+
+	return devm_iio_device_register(&client->dev, indio_dev);
+}
+
+static const struct i2c_device_id ltr390_id[] = {
+	{ LTR390_DEVICE_NAME, 0 },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(i2c, ltr390_id);
+
+static struct i2c_driver ltr390_driver = {
+	.driver = {
+		.name = LTR390_DEVICE_NAME,
+	},
+	.probe = ltr390_probe,
+	.id_table = ltr390_id,
+};
+
+module_i2c_driver(ltr390_driver);
+
+MODULE_AUTHOR("Anshul Dalal <anshulusr@gmail.com>");
+MODULE_DESCRIPTION("Lite-On LTR390 ALS and UV sensor Driver");
+MODULE_LICENSE("GPL");
-- 
2.42.0

