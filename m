Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD8481BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Dec 2023 18:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUozy9C2"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DB3E60AB1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Dec 2023 18:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB3E60AB1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HUozy9C2
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pI0aiOKwkrTs
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 17 Dec 2023 18:11:16 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0E38C60A5E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Dec 2023 18:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E38C60A5E
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7b6fe5d67d4so103369639f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Dec 2023 10:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702836675; x=1703441475; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+1xKzyjjirOFL/hBqfrsgPumLajHjnToiDoIwsSPbQ=;
        b=HUozy9C2+0qSDSeGch9F+9oHUwbj+Xv1nm9f5UprAnQaJf+AI/oSj4zCdcR01fO/AA
         EHllcEmXgn1Y/cNFgb7RUJEVwQ4kgQEbRcIpjdVU01D120w1wsAnhi/VWc9Ete2MDPJz
         ak2xRYTk9wFKln5ply5IEdBQTppAbbwkdbwZZpr+GMJ1s/ni4r2SQoEFHR2dnQrBv5pO
         92CxbP6U0E/C22GDjfn+QKM49IEl9Livc9aKGpn2VRvet984S7rnepVq4hoA0R7MA1S8
         Hp4/xO+oHM5KUnkSAkjr196/xcTmaXcQggnrtLkc4zG6r50P5fEfSJhMd+8aOgxFwnwU
         GTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702836675; x=1703441475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+1xKzyjjirOFL/hBqfrsgPumLajHjnToiDoIwsSPbQ=;
        b=iDhpPqzbjMzSzSihNjSg7cshaH7ZVHDtJ5Ld3yUriebIbL8eQB8kgmLVneuGqu41XM
         8mjL00coqWkyEknzJuWyOgmbuIP+4p9EN2VDiO9NZj6sBnEiHmBLSOlRSIf+p3TukVGw
         RcIEm6VNAdKFxeuksf/b/5voo2UnKDzreBRxQYWGYmbrgT5L2wd8rs8cPXuaEjWzIx3V
         omyvYuYMTLYT/MPFCUI76otdCmxhMJLW7jyuJDDrdNbFJRc7SdOtWh9NVSDsJmV9oj6Y
         iyRv8+2/dovKCeZrZJhnR3tfPQuH5d6J9FvTQikZaV4iZ+2juue+b0To+Gcux6ZSdpZ2
         Dcow==
X-Gm-Message-State: AOJu0YyE00MOaAo7iPg1k3LEr8jmi6BUTbZ/+q/TnqEXwbz2c+9Hcgme
	fyOLD6ZicFRQ1/Fqj/9GOUQ=
X-Google-Smtp-Source: AGHT+IHT6wEf4uuav+OhJn3BTeGxC5UmNci9q038V+CcG5mKb13dtLpu9Bmd+/q90yiYrIUrf2BuVA==
X-Received: by 2002:a6b:6517:0:b0:7b3:92f4:f3e9 with SMTP id z23-20020a6b6517000000b007b392f4f3e9mr15037940iob.21.1702836674964;
        Sun, 17 Dec 2023 10:11:14 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:581e:798e:871c:98db:5638:a4])
        by smtp.gmail.com with ESMTPSA id d18-20020aa78692000000b006bdd7cbcf98sm16761286pfo.182.2023.12.17.10.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 10:11:14 -0800 (PST)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	devicetree@vger.kernel.org
Cc: Anshul Dalal <anshulusr@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 2/2] iio: dac: driver for MCP4821
Date: Sun, 17 Dec 2023 23:38:34 +0530
Message-ID: <20231217180836.584828-2-anshulusr@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231217180836.584828-1-anshulusr@gmail.com>
References: <20231217180836.584828-1-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds driver for the MCP48xx series of DACs.

Device uses a simplex SPI channel. To set the value of an output channel,
a 16-bit data of following format must be written:

Bit field | Description
15 [MSB]  | Channel selection bit
            0 -> Channel A
            1 -> Channel B
13        | Output Gain Selection bit
            0 -> 2x Gain (Vref = 4.096V)
            1 -> 1x Gain (Vref = 2.048V)
12        | Output Shutdown Control bit
            0 -> Shutdown the selected channel
            1 -> Active mode operation
11-0 [LSB]| DAC Input Data bits
            Value's big endian representation is taken as input for the
            selected DAC channel. For devices with a resolution of less
            than 12-bits, only the x most significant bits are considered
            where x is the resolution of the device.
Reference: Page#22 [MCP48x2 Datasheet]

Supported devices:
  +---------+--------------+-------------+
  | Device  |  Resolution  |   Channels  |
  |---------|--------------|-------------|
  | MCP4801 |     8-bit    |      1      |
  | MCP4802 |     8-bit    |      2      |
  | MCP4811 |    10-bit    |      1      |
  | MCP4812 |    10-bit    |      2      |
  | MCP4821 |    12-bit    |      1      |
  | MCP4822 |    12-bit    |      2      |
  +---------+--------------+-------------+

Devices tested:
  MCP4821 [12-bit single channel]
  MCP4802 [8-bit dual channel]

Tested on Raspberry Pi Zero 2W

Datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/22244B.pdf #MCP48x1
Datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.pdf #MCP48x2
Signed-off-by: Anshul Dalal <anshulusr@gmail.com>

---

Changes for v2:
- Changed device ordering to numerical
- Fixed ordering of headers
- Added struct mcp4821_chip_info instead of relying on driver_data from
  spi device ids
- Use scoped_guards for all mutex locks
- Changed write_val from __be16 to u16 in mcp4821_write_raw
  Fixes sparse warning: incorrect type in assignment

Previous versions:
v1: https://lore.kernel.org/lkml/20231117073040.685860-2-anshulusr@gmail.com/
---
 MAINTAINERS               |   7 ++
 drivers/iio/dac/Kconfig   |  10 ++
 drivers/iio/dac/Makefile  |   1 +
 drivers/iio/dac/mcp4821.c | 228 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 246 insertions(+)
 create mode 100644 drivers/iio/dac/mcp4821.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 81d5fc0bba68..8d9274c33c6e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13029,6 +13029,13 @@ F:	Documentation/ABI/testing/sysfs-bus-iio-potentiometer-mcp4531
 F:	drivers/iio/potentiometer/mcp4018.c
 F:	drivers/iio/potentiometer/mcp4531.c
 
+MCP4821 DAC DRIVER
+M:	Anshul Dalal <anshulusr@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/dac/microchip,mcp4821.yaml
+F:	drivers/iio/dac/mcp4821.c
+
 MCR20A IEEE-802.15.4 RADIO DRIVER
 M:	Stefan Schmidt <stefan@datenfreihafen.org>
 L:	linux-wpan@vger.kernel.org
diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
index 93b8be183de6..34eb40bb9529 100644
--- a/drivers/iio/dac/Kconfig
+++ b/drivers/iio/dac/Kconfig
@@ -400,6 +400,16 @@ config MCP4728
 	  To compile this driver as a module, choose M here: the module
 	  will be called mcp4728.
 
+config MCP4821
+	tristate "MCP4801/02/11/12/21/22 DAC driver"
+	depends on SPI
+	help
+	  Say yes here to build the driver for the Microchip MCP4801
+	  MCP4802, MCP4811, MCP4812, MCP4821 and MCP4822 DAC devices.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called mcp4821.
+
 config MCP4922
 	tristate "MCP4902, MCP4912, MCP4922 DAC driver"
 	depends on SPI
diff --git a/drivers/iio/dac/Makefile b/drivers/iio/dac/Makefile
index 5b2bac900d5a..55bf89739d14 100644
--- a/drivers/iio/dac/Makefile
+++ b/drivers/iio/dac/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_MAX5522) += max5522.o
 obj-$(CONFIG_MAX5821) += max5821.o
 obj-$(CONFIG_MCP4725) += mcp4725.o
 obj-$(CONFIG_MCP4728) += mcp4728.o
+obj-$(CONFIG_MCP4821) += mcp4821.o
 obj-$(CONFIG_MCP4922) += mcp4922.o
 obj-$(CONFIG_STM32_DAC_CORE) += stm32-dac-core.o
 obj-$(CONFIG_STM32_DAC) += stm32-dac.o
diff --git a/drivers/iio/dac/mcp4821.c b/drivers/iio/dac/mcp4821.c
new file mode 100644
index 000000000000..7384df71f702
--- /dev/null
+++ b/drivers/iio/dac/mcp4821.c
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 Anshul Dalal <anshulusr@gmail.com>
+ *
+ * Driver for Microchip MCP4801, MCP4802, MCP4811, MCP4812, MCP4821 and MCP4822
+ *
+ * Based on the work of:
+ *	Michael Welling (MCP4922 Driver)
+ *
+ * Datasheet:
+ *	MCP48x1: https://ww1.microchip.com/downloads/en/DeviceDoc/22244B.pdf
+ *	MCP48x2: https://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.pdf
+ *
+ * TODO:
+ *	- Configurable gain
+ *	- Regulator control
+ */
+
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/spi/spi.h>
+
+#include <linux/iio/iio.h>
+#include <linux/iio/types.h>
+
+#include <asm/unaligned.h>
+
+#define MCP4821_ACTIVE_MODE BIT(12)
+#define MCP4802_SECOND_CHAN BIT(15)
+
+/* DAC uses an internal Voltage reference of 4.096V at a gain of 2x */
+#define MCP4821_2X_GAIN_VREF_MV 4096
+
+enum mcp4821_supported_drvice_ids {
+	ID_MCP4801,
+	ID_MCP4802,
+	ID_MCP4811,
+	ID_MCP4812,
+	ID_MCP4821,
+	ID_MCP4822,
+};
+
+struct mcp4821_state {
+	struct spi_device *spi;
+	// Protects dac_value
+	struct mutex lock;
+	u16 dac_value[2];
+};
+
+struct mcp4821_chip_info {
+	const char *name;
+	int num_channels;
+	const struct iio_chan_spec channels[2];
+};
+
+#define MCP4821_CHAN(channel_id, resolution)                          \
+	{                                                             \
+		.type = IIO_VOLTAGE, .output = 1, .indexed = 1,       \
+		.channel = (channel_id),                              \
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),         \
+		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE), \
+		.scan_type = {                                        \
+			.sign = 'u',                                  \
+			.realbits = (resolution),                     \
+			.storagebits = 16,                            \
+			.shift = 12 - (resolution),                   \
+		},                                                    \
+	}
+
+static const struct mcp4821_chip_info mcp4821_chip_info_table[6] = {
+	[ID_MCP4801] = {
+			.name = "mcp4801",
+			.num_channels = 1,
+			.channels = { MCP4821_CHAN(0, 8) }
+			},
+	[ID_MCP4802] = {
+			.name = "mcp4802",
+			.num_channels = 2,
+			.channels = { MCP4821_CHAN(0, 8),
+				       MCP4821_CHAN(1, 8) }
+			},
+	[ID_MCP4811] = {
+			.name = "mcp4811",
+			.num_channels = 1,
+			.channels = { MCP4821_CHAN(0, 10) }
+			},
+	[ID_MCP4812] = {
+			.name = "mcp4812",
+			.num_channels = 2,
+			.channels = { MCP4821_CHAN(0, 10),
+				       MCP4821_CHAN(1, 10) }
+			},
+	[ID_MCP4821] = {
+			.name = "mcp4821",
+			.num_channels = 1,
+			.channels = { MCP4821_CHAN(0, 12) }
+			},
+	[ID_MCP4822] = {
+			.name = "mcp4822",
+			.num_channels = 2,
+			.channels = { MCP4821_CHAN(0, 12),
+				       MCP4821_CHAN(1, 12) }
+			},
+};
+
+static int mcp4821_read_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan, int *val,
+			    int *val2, long mask)
+{
+	struct mcp4821_state *state;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		state = iio_priv(indio_dev);
+		scoped_guard(mutex, &state->lock)
+			*val = state->dac_value[chan->channel];
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		*val = MCP4821_2X_GAIN_VREF_MV;
+		*val2 = chan->scan_type.realbits;
+		return IIO_VAL_FRACTIONAL_LOG2;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mcp4821_write_raw(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan, int val,
+			     int val2, long mask)
+{
+	struct mcp4821_state *state;
+	u16 write_val;
+	__be16 write_buffer;
+	int ret;
+	bool is_value_valid = val >= 0 && val < BIT(chan->scan_type.realbits) &&
+			      val2 == 0;
+
+	if (!is_value_valid)
+		return -EINVAL;
+	if (mask != IIO_CHAN_INFO_RAW)
+		return -EINVAL;
+
+	state = iio_priv(indio_dev);
+	write_val = MCP4821_ACTIVE_MODE | val << chan->scan_type.shift;
+	if (chan->channel)
+		write_val |= MCP4802_SECOND_CHAN;
+	put_unaligned_be16(write_val, &write_buffer);
+	ret = spi_write(state->spi, &write_buffer, sizeof(write_buffer));
+	if (ret) {
+		dev_err(&state->spi->dev, "Failed to write to device: %d", ret);
+		return ret;
+	}
+
+	scoped_guard(mutex, &state->lock)
+		state->dac_value[chan->channel] = val;
+	return 0;
+}
+
+static const struct iio_info mcp4821_info = {
+	.read_raw = &mcp4821_read_raw,
+	.write_raw = &mcp4821_write_raw,
+};
+
+static int mcp4821_probe(struct spi_device *spi)
+{
+	struct iio_dev *indio_dev;
+	struct mcp4821_state *state;
+	const struct mcp4821_chip_info *info;
+
+	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*state));
+	if (indio_dev == NULL)
+		return -ENOMEM;
+
+	state = iio_priv(indio_dev);
+	state->spi = spi;
+	mutex_init(&state->lock);
+
+	info = spi_get_device_match_data(spi);
+	indio_dev->name = info->name;
+	indio_dev->info = &mcp4821_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = info->channels;
+	indio_dev->num_channels = info->num_channels;
+	return devm_iio_device_register(&spi->dev, indio_dev);
+}
+
+#define MCP4821_COMPATIBLE(of_compatible, id)        \
+	{                                            \
+		.compatible = of_compatible,         \
+		.data = &mcp4821_chip_info_table[id] \
+	}
+
+static const struct of_device_id mcp4821_of_table[] = {
+	MCP4821_COMPATIBLE("microchip,mcp4801", ID_MCP4801),
+	MCP4821_COMPATIBLE("microchip,mcp4802", ID_MCP4802),
+	MCP4821_COMPATIBLE("microchip,mcp4811", ID_MCP4811),
+	MCP4821_COMPATIBLE("microchip,mcp4812", ID_MCP4812),
+	MCP4821_COMPATIBLE("microchip,mcp4821", ID_MCP4821),
+	MCP4821_COMPATIBLE("microchip,mcp4822", ID_MCP4822),
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mcp4821_of_table);
+
+static const struct spi_device_id mcp4821_id_table[] = {
+	{ "mcp4801", (kernel_ulong_t)&mcp4821_chip_info_table[ID_MCP4801]},
+	{ "mcp4802", (kernel_ulong_t)&mcp4821_chip_info_table[ID_MCP4802]},
+	{ "mcp4811", (kernel_ulong_t)&mcp4821_chip_info_table[ID_MCP4811]},
+	{ "mcp4812", (kernel_ulong_t)&mcp4821_chip_info_table[ID_MCP4812]},
+	{ "mcp4821", (kernel_ulong_t)&mcp4821_chip_info_table[ID_MCP4821]},
+	{ "mcp4822", (kernel_ulong_t)&mcp4821_chip_info_table[ID_MCP4822]},
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, mcp4821_id_table);
+
+static struct spi_driver mcp4821_driver = {
+	.driver = {
+		.name = "mcp4821",
+		.of_match_table = mcp4821_of_table,
+	},
+	.probe = mcp4821_probe,
+	.id_table = mcp4821_id_table,
+};
+module_spi_driver(mcp4821_driver);
+
+MODULE_AUTHOR("Anshul Dalal <anshulusr@gmail.com>");
+MODULE_DESCRIPTION("Microchip MCP4821 DAC Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

