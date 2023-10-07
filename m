Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC941E95A61
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Oct 2023 14:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E12061331;
	Sat,  7 Oct 2023 14:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E12061331
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OOyunpTs
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sEAPZr6SCo1f; Sat,  7 Oct 2023 14:42:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 223C66105A;
	Sat,  7 Oct 2023 14:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 223C66105A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F357AC0071;
	Sat,  7 Oct 2023 14:42:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB9D9C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 14:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9AE7408FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 14:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9AE7408FC
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OOyunpTs
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1q-QAtvuGgc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 14:42:23 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5617400CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 14:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5617400CE
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c60778a3bfso25829075ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Oct 2023 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696689743; x=1697294543;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GhFZ0ylJeJYc9W1IBEjFmY/pbEmLASmVaX25VxCW5Ec=;
 b=OOyunpTsULJiJApLT8fsj+m2sJIIhq3y/gcBs4xcWdAahmb8E8DYHCuxwALhicmfSJ
 lD8cXK4z1Si6CklxACxDxqzMXauF0/xwgWdATPjcvl7OmSP/iWb+Fh7LVYEI8HHL3wnu
 yIOeXq05uZ96i/7AKe9bjEcuLHqfbwAeBXde6c6ZrkiqXL4yC82WR+HTXqwMx0bIxROD
 PKayGD11zSEKSxfHwLkeghSkhqQz254kvnGIFGmhTxotFuK2l7tYXdI9JQX2j4jo6jMn
 s0pEbLM00T7N/jI9ILRyU5xNG8xwyr2w9LbBKyCb5x5AuTFqoMRuMqHeyFPLCSJdAzdm
 wONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696689743; x=1697294543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GhFZ0ylJeJYc9W1IBEjFmY/pbEmLASmVaX25VxCW5Ec=;
 b=AyAOI18p0g3UMYWm7Ds/kMFfaTtoiRG3Nhw7WrRB0e36qMn1/Xrw2bMlS/g3NzMuyx
 ceFbpzC+44m+FyknVdorc4CRzZCHKYGIBjFLNWw44ymFRdcVquQiFe5D2+poKO409h/A
 ABkdhv3V3qBVWh2UUiWjTB0uUpkanH00aYwtwomgTr35Va3+/OvdEdpnY4XQNylIfWwz
 ZilT+bcBEOsUX16juLlAxnM11EgPyr8ndtI9TxTH/REgAtVqB8V9fDMj/D7rYrz4rXb4
 JWbDfxG3CPpVFNeQlM4BPkudm0zZrNUDJTx0L/QsVRg0GKWUBsoUSuvV7yTPoXK36kY8
 P7mw==
X-Gm-Message-State: AOJu0YzjgNM6LQtITyC7xHnH2HEiZceYaIs3bliTvFPsPmNk2Lt+gX8X
 lhXXm/o+RW7NYOkwgs2j89I=
X-Google-Smtp-Source: AGHT+IF2uRpTS/yZQCnOVDisu/+touQEYOwpDVQYD9onvQlHVInRiiZ9/G/78LKYSeGyFLtcOW6QTQ==
X-Received: by 2002:a17:903:1c1:b0:1c0:c4be:62ca with SMTP id
 e1-20020a17090301c100b001c0c4be62camr11352576plh.17.1696689742940; 
 Sat, 07 Oct 2023 07:42:22 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:6291:4752:3191:cc16:9883:82e9])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a1709028c9800b001c73f51e61csm5962288plo.106.2023.10.07.07.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 07:42:22 -0700 (PDT)
From: Anshul Dalal <anshulusr@gmail.com>
To: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] input: add Adafruit Seesaw Gamepad driver
Date: Sat,  7 Oct 2023 20:10:50 +0530
Message-ID: <20231007144052.1535417-2-anshulusr@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231007144052.1535417-1-anshulusr@gmail.com>
References: <20231007144052.1535417-1-anshulusr@gmail.com>
MIME-Version: 1.0
Cc: Conor Dooley <conor+dt@kernel.org>, Anshul Dalal <anshulusr@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

A simple driver for a mini gamepad that communicates over i2c, the gamepad
has bidirectional thumb stick input and six buttons.

The gamepad chip utilizes the open framework from Adafruit called 'Seesaw'
to transmit the ADC data for the joystick and digital pin state for the
buttons. I have only implemented the functionality required to receive the
thumb stick and button state.

Steps in reading the gamepad state over i2c:
  1. Reset the registers
  2. Set the pin mode of the pins specified by the `BUTTON_MASK` to input
      `BUTTON_MASK`: A bit-map for the six digital pins internally
       connected to the joystick buttons.
  3. Enable internal pullup resistors for the `BUTTON_MASK`
  4. Bulk set the pin state HIGH for `BUTTON_MASK`
  5. Poll the device for button and joystick state done by:
      `seesaw_read_data(struct i2c_client *client, struct seesaw_data *data)`

Product page:
  https://www.adafruit.com/product/5743
Arduino driver:
  https://github.com/adafruit/Adafruit_Seesaw

Tested on RPi Zero 2W

Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
---
 MAINTAINERS                              |   7 +
 drivers/input/joystick/Kconfig           |   9 +
 drivers/input/joystick/Makefile          |   1 +
 drivers/input/joystick/adafruit_seesaw.c | 275 +++++++++++++++++++++++
 4 files changed, 292 insertions(+)
 create mode 100644 drivers/input/joystick/adafruit_seesaw.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 81d5fc0bba68..cd4f9deb77e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -441,6 +441,13 @@ W:	http://wiki.analog.com/AD7879
 W:	https://ez.analog.com/linux-software-drivers
 F:	drivers/input/touchscreen/ad7879.c
 
+ADAFRUIT MINI I2C GAMEPAD
+M:	Anshul Dalal <anshulusr@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/adafruit_seesaw.yaml
+F:	drivers/input/joystick/adafruit_seesaw.c
+
 ADDRESS SPACE LAYOUT RANDOMIZATION (ASLR)
 M:	Jiri Kosina <jikos@kernel.org>
 S:	Maintained
diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
index ac6925ce8366..b8337edc6e22 100644
--- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -412,4 +412,13 @@ config JOYSTICK_SENSEHAT
 	  To compile this driver as a module, choose M here: the
 	  module will be called sensehat_joystick.
 
+config JOYSTICK_SEESAW
+	tristate "Adafruit Mini I2C Gamepad with Seesaw"
+	depends on I2C
+	help
+		Say Y here if you want to use the Adafruit Mini I2C Gamepad.
+
+		To compile this driver as a module, choose M here: the module will be
+		called adafruit_seesaw.
+
 endif
diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
index 3937535f0098..fdc653209542 100644
--- a/drivers/input/joystick/Makefile
+++ b/drivers/input/joystick/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_JOYSTICK_N64)		+= n64joy.o
 obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+= psxpad-spi.o
 obj-$(CONFIG_JOYSTICK_PXRC)		+= pxrc.o
 obj-$(CONFIG_JOYSTICK_QWIIC)		+= qwiic-joystick.o
+obj-$(CONFIG_JOYSTICK_SEESAW)		+= adafruit_seesaw.o
 obj-$(CONFIG_JOYSTICK_SENSEHAT)	+= sensehat-joystick.o
 obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+= sidewinder.o
 obj-$(CONFIG_JOYSTICK_SPACEBALL)	+= spaceball.o
diff --git a/drivers/input/joystick/adafruit_seesaw.c b/drivers/input/joystick/adafruit_seesaw.c
new file mode 100644
index 000000000000..a04df0469595
--- /dev/null
+++ b/drivers/input/joystick/adafruit_seesaw.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 Anshul Dalal <anshulusr@gmail.com>
+ *
+ * Driver for Adafruit Mini I2C Gamepad
+ *
+ * Based on the work of:
+ *	Oleh Kravchenko (Sparkfun Qwiic Joystick driver)
+ *
+ * Product page: https://www.adafruit.com/product/5743
+ * Firmware and hardware sources: https://github.com/adafruit/Adafruit_Seesaw
+ */
+
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+/* clang-format off */
+#define SEESAW_DEVICE_NAME	"seesaw_gamepad"
+
+#define SEESAW_STATUS_BASE	0
+#define SEESAW_GPIO_BASE	1
+#define SEESAW_ADC_BASE		9
+
+#define SEESAW_GPIO_DIRCLR_BULK	3
+#define SEESAW_GPIO_BULK	4
+#define SEESAW_GPIO_BULK_SET	5
+#define SEESAW_GPIO_PULLENSET	11
+
+#define SEESAW_STATUS_HW_ID	1
+#define SEESAW_STATUS_SWRST	127
+
+#define SEESAW_ADC_OFFSET	7
+
+#define BUTTON_A	5
+#define BUTTON_B	1
+#define BUTTON_X	6
+#define BUTTON_Y	2
+#define BUTTON_START	16
+#define BUTTON_SELECT	0
+
+#define ANALOG_X	14
+#define ANALOG_Y	15
+
+#define SEESAW_JOYSTICK_MAX_AXIS	1023
+#define SEESAW_JOYSTICK_FUZZ		2
+#define SEESAW_JOYSTICK_FLAT		4
+
+#define SEESAW_GAMEPAD_POLL_INTERVAL	16
+#define SEESAW_GAMEPAD_POLL_MIN		8
+#define SEESAW_GAMEPAD_POLL_MAX		32
+/* clang-format on */
+
+u32 BUTTON_MASK = (1UL << BUTTON_A) | (1UL << BUTTON_B) | (1UL << BUTTON_X) |
+		  (1UL << BUTTON_Y) | (1UL << BUTTON_START) |
+		  (1UL << BUTTON_SELECT);
+
+struct seesaw_gamepad {
+	char physical_path[32];
+	unsigned char hardware_id;
+	struct input_dev *input_dev;
+	struct i2c_client *i2c_client;
+};
+
+struct seesaw_data {
+	__be16 x;
+	__be16 y;
+	u8 button_a, button_b, button_x, button_y, button_start, button_select;
+};
+
+static int seesaw_read_data(struct i2c_client *client, struct seesaw_data *data)
+{
+	int err;
+	unsigned char write_buf[2] = { SEESAW_GPIO_BASE, SEESAW_GPIO_BULK };
+	unsigned char read_buf[4];
+
+	err = i2c_master_send(client, write_buf, sizeof(write_buf));
+	if (err < 0)
+		return err;
+	if (err != sizeof(write_buf))
+		return -EIO;
+	err = i2c_master_recv(client, read_buf, sizeof(read_buf));
+	if (err < 0)
+		return err;
+	if (err != sizeof(read_buf))
+		return -EIO;
+	u32 result = ((u32)read_buf[0] << 24) | ((u32)read_buf[1] << 16) |
+		     ((u32)read_buf[2] << 8) | (u32)read_buf[3];
+	data->button_a = !(result & (1UL << BUTTON_A));
+	data->button_b = !(result & (1UL << BUTTON_B));
+	data->button_x = !(result & (1UL << BUTTON_X));
+	data->button_y = !(result & (1UL << BUTTON_Y));
+	data->button_start = !(result & (1UL << BUTTON_START));
+	data->button_select = !(result & (1UL << BUTTON_SELECT));
+
+	write_buf[0] = SEESAW_ADC_BASE;
+	write_buf[1] = SEESAW_ADC_OFFSET + ANALOG_X;
+	err = i2c_master_send(client, write_buf, sizeof(write_buf));
+	if (err < 0)
+		return err;
+	if (err != sizeof(write_buf))
+		return -EIO;
+	err = i2c_master_recv(client, (char *)&data->x, sizeof(data->x));
+	if (err < 0)
+		return err;
+	if (err != sizeof(data->x))
+		return -EIO;
+	/*
+	 * ADC reads left as max and right as 0, must be reversed since kernel
+	 * expects reports in opposite order.
+	 */
+	data->x = SEESAW_JOYSTICK_MAX_AXIS - be16_to_cpu(data->x);
+
+	write_buf[1] = SEESAW_ADC_OFFSET + ANALOG_Y;
+	err = i2c_master_send(client, write_buf, 2);
+	if (err < 0)
+		return err;
+	if (err != sizeof(write_buf))
+		return -EIO;
+	err = i2c_master_recv(client, (char *)&data->y, data->y);
+	if (err < 0)
+		return err;
+	if (err != data->y)
+		return -EIO;
+	data->y = be16_to_cpu(data->y);
+
+	return 0;
+}
+
+static void seesaw_poll(struct input_dev *input)
+{
+	struct seesaw_gamepad *private = input_get_drvdata(input);
+	struct seesaw_data data;
+	int err;
+
+	err = seesaw_read_data(private->i2c_client, &data);
+	if (err != 0)
+		return;
+
+	input_report_abs(input, ABS_X, data.x);
+	input_report_abs(input, ABS_Y, data.y);
+	input_report_key(input, BTN_A, data.button_a);
+	input_report_key(input, BTN_B, data.button_b);
+	input_report_key(input, BTN_X, data.button_x);
+	input_report_key(input, BTN_Y, data.button_y);
+	input_report_key(input, BTN_START, data.button_start);
+	input_report_key(input, BTN_SELECT, data.button_select);
+	input_sync(input);
+}
+
+static int seesaw_probe(struct i2c_client *client)
+{
+	int err;
+	struct seesaw_gamepad *private;
+	unsigned char register_reset[] = { SEESAW_STATUS_BASE,
+					   SEESAW_STATUS_SWRST, 0xFF };
+	unsigned char get_hw_id[] = { SEESAW_STATUS_BASE, SEESAW_STATUS_HW_ID };
+
+	err = i2c_master_send(client, register_reset, sizeof(register_reset));
+	if (err < 0)
+		return err;
+	if (err != sizeof(register_reset))
+		return -EIO;
+	mdelay(10);
+
+	private = devm_kzalloc(&client->dev, sizeof(*private), GFP_KERNEL);
+	if (!private)
+		return -ENOMEM;
+
+	err = i2c_master_send(client, get_hw_id, sizeof(get_hw_id));
+	if (err < 0)
+		return err;
+	if (err != sizeof(get_hw_id))
+		return -EIO;
+	err = i2c_master_recv(client, &private->hardware_id, 1);
+	if (err < 0)
+		return err;
+	if (err != 1)
+		return -EIO;
+
+	dev_dbg(&client->dev, "Adafruit Seesaw Gamepad, Hardware ID: %02x\n",
+		private->hardware_id);
+
+	private->i2c_client = client;
+	scnprintf(private->physical_path, sizeof(private->physical_path),
+		  "i2c/%s", dev_name(&client->dev));
+	i2c_set_clientdata(client, private);
+
+	private->input_dev = devm_input_allocate_device(&client->dev);
+	if (!private->input_dev)
+		return -ENOMEM;
+
+	private->input_dev->id.bustype = BUS_I2C;
+	private->input_dev->name = "Adafruit Seesaw Gamepad";
+	private->input_dev->phys = private->physical_path;
+	input_set_drvdata(private->input_dev, private);
+	input_set_abs_params(private->input_dev, ABS_X, 0,
+			     SEESAW_JOYSTICK_MAX_AXIS, SEESAW_JOYSTICK_FUZZ,
+			     SEESAW_JOYSTICK_FLAT);
+	input_set_abs_params(private->input_dev, ABS_Y, 0,
+			     SEESAW_JOYSTICK_MAX_AXIS, SEESAW_JOYSTICK_FUZZ,
+			     SEESAW_JOYSTICK_FLAT);
+	input_set_capability(private->input_dev, EV_KEY, BTN_A);
+	input_set_capability(private->input_dev, EV_KEY, BTN_B);
+	input_set_capability(private->input_dev, EV_KEY, BTN_X);
+	input_set_capability(private->input_dev, EV_KEY, BTN_Y);
+	input_set_capability(private->input_dev, EV_KEY, BTN_START);
+	input_set_capability(private->input_dev, EV_KEY, BTN_SELECT);
+
+	err = input_setup_polling(private->input_dev, seesaw_poll);
+	if (err) {
+		dev_err(&client->dev, "failed to set up polling: %d\n", err);
+		return err;
+	}
+
+	input_set_poll_interval(private->input_dev,
+				SEESAW_GAMEPAD_POLL_INTERVAL);
+	input_set_max_poll_interval(private->input_dev,
+				    SEESAW_GAMEPAD_POLL_MAX);
+	input_set_min_poll_interval(private->input_dev,
+				    SEESAW_GAMEPAD_POLL_MIN);
+
+	err = input_register_device(private->input_dev);
+	if (err) {
+		dev_err(&client->dev, "failed to register joystick: %d\n", err);
+		return err;
+	}
+
+	/* Set Pin Mode to input and enable pull-up resistors */
+	unsigned char pin_mode[] = { SEESAW_GPIO_BASE,	SEESAW_GPIO_DIRCLR_BULK,
+				     BUTTON_MASK >> 24, BUTTON_MASK >> 16,
+				     BUTTON_MASK >> 8,	BUTTON_MASK };
+	err = i2c_master_send(client, pin_mode, sizeof(pin_mode));
+	pin_mode[1] = SEESAW_GPIO_PULLENSET;
+	err |= i2c_master_send(client, pin_mode, sizeof(pin_mode));
+	pin_mode[1] = SEESAW_GPIO_BULK_SET;
+	err |= i2c_master_send(client, pin_mode, sizeof(pin_mode));
+	if (err < 0)
+		return err;
+	if (err != sizeof(pin_mode))
+		return -EIO;
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id of_seesaw_match[] = {
+	{
+		.compatible = "adafruit,seesaw_gamepad",
+	},
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, of_seesaw_match);
+#endif /* CONFIG_OF */
+
+static const struct i2c_device_id seesaw_id_table[] = { { KBUILD_MODNAME, 0 },
+							{ /* Sentinel */ } };
+MODULE_DEVICE_TABLE(i2c, seesaw_id_table);
+
+static struct i2c_driver seesaw_driver = {
+	.driver = {
+		.name = SEESAW_DEVICE_NAME,
+		.of_match_table = of_match_ptr(of_seesaw_match),
+	},
+	.id_table = seesaw_id_table,
+	.probe		= seesaw_probe,
+};
+module_i2c_driver(seesaw_driver);
+
+MODULE_AUTHOR("Anshul Dalal <anshulusr@gmail.com>");
+MODULE_DESCRIPTION("Adafruit Mini I2C Gamepad driver");
+MODULE_LICENSE("GPL");
-- 
2.42.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
