Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7A8C4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Oct 2023 06:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8D7F854A3;
	Mon, 30 Oct 2023 06:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8D7F854A3
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GeLIqzAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHVzKiU7GCGS; Mon, 30 Oct 2023 06:56:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9CD39854A1;
	Mon, 30 Oct 2023 06:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CD39854A1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 893A1C0071;
	Mon, 30 Oct 2023 06:56:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6225DC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 06:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D3454F451
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 06:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D3454F451
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GeLIqzAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hsNgNaky4E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 06:56:48 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9103E4F44E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Oct 2023 06:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9103E4F44E
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6b497c8575aso4151109b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Oct 2023 23:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698649008; x=1699253808;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZiFerh/XwL7PsvERHAY8ofZPplQ5GlqVYtWHtGZmL5E=;
 b=GeLIqzABrRYI6nha55v7BolJ4E8xvfJEsFeoO7xGVcM31Z6hGfD4mD7b/IVdoTSHx7
 xH2+xZzVphLfocu4cYx8+guHtKJmwfKf2MiJLtprLty/2roVpKMJUq9I+HX4CqtjQCde
 9fe7rCk1IfyAzzo+fZFXCk+zyumyR5wS83OnR+kgL4SpigngU0OLOPBzJJDm/P4UBAb2
 QZYRFX+pYM1lKLz9Ur4PyCHd1Kd5Etgd7bEHgzkMhXD8Hob/4WdnTWj8zs17s1hNfc6J
 6RVEkuUbgBFqWqmeR9TeH4Re9s4yCF4oZZ7vo9ZWSE4FbvMj2FHo0FIXkS5dHcRvgBgc
 g5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698649008; x=1699253808;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZiFerh/XwL7PsvERHAY8ofZPplQ5GlqVYtWHtGZmL5E=;
 b=kWWpzxbvWgWLIttt1HJLkE4RY1Al1giRoTiriJP6IrEDv+6UC6qpAg5mAcnivtjwn3
 gWeKAK97eQZ8LJvPxwOq1YPlpS+MBsKRaaP4nybrLOwWvkkJ8uKkiw5QD27ZWTprg9oY
 1UEloKk5SotM+dBHNGp7OO9QSJZpaOtZ+viBLU4zcpctOkG0O7YOSbh2eWChi0B+Ha4/
 fmZGA8TzLqS1IT/+4oyn/Ui6AdTVeZn9bjGiCwQNgYfvX5V6rkcNpcOeXTRHgkB2fxlT
 +zyIRtJ7l40F84hqy9CIObOv2hBg0SYqpiGLsBzjoAhSnAsUHMsrJw+sCtyJ5SYP8aMA
 MVZw==
X-Gm-Message-State: AOJu0YwgGyuOBwTHQGoOGNjBMTGn9ut43mhxqph9X+wHUlQgr792ZHOL
 Yn8B1bYHIdrlISygC5CFXUY=
X-Google-Smtp-Source: AGHT+IHspHXvnE8BtSvkTBerfRIDKnGaH9ZVLU5P8T9b1YDTAXi8wHfUZkdN6i7j621iASbxj1N45g==
X-Received: by 2002:a05:6a21:7983:b0:179:f761:4348 with SMTP id
 bh3-20020a056a21798300b00179f7614348mr9722714pzc.34.1698649007565; 
 Sun, 29 Oct 2023 23:56:47 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:201:88e7:6b5a:6c82:8310])
 by smtp.gmail.com with ESMTPSA id
 e21-20020aa78c55000000b0069ee4242f89sm5401810pfd.13.2023.10.29.23.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 23:56:47 -0700 (PDT)
Date: Mon, 30 Oct 2023 06:56:41 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Anshul Dalal <anshulusr@gmail.com>
Subject: Re: [PATCH v6 2/2] input: joystick: driver for Adafruit Seesaw Gamepad
Message-ID: <ZT9TqX0tfEKpHPV9@google.com>
References: <20231027051819.81333-1-anshulusr@gmail.com>
 <20231027051819.81333-2-anshulusr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027051819.81333-2-anshulusr@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Anshul,

On Fri, Oct 27, 2023 at 10:48:11AM +0530, Anshul Dalal wrote:
> Adds a driver for a mini gamepad that communicates over i2c, the gamepad
> has bidirectional thumb stick input and six buttons.
> =

> The gamepad chip utilizes the open framework from Adafruit called 'Seesaw'
> to transmit the ADC data for the joystick and digital pin state for the
> buttons. I have only implemented the functionality required to receive the
> thumb stick and button state.
> =

> Steps in reading the gamepad state over i2c:
>   1. Reset the registers
>   2. Set the pin mode of the pins specified by the `BUTTON_MASK` to input
>       `BUTTON_MASK`: A bit-map for the six digital pins internally
>        connected to the joystick buttons.
>   3. Enable internal pullup resistors for the `BUTTON_MASK`
>   4. Bulk set the pin state HIGH for `BUTTON_MASK`
>   5. Poll the device for button and joystick state done by:
>       `seesaw_read_data(struct i2c_client *client, struct seesaw_data *da=
ta)`
> =

> Product page:
>   https://www.adafruit.com/product/5743
> Arduino driver:
>   https://github.com/adafruit/Adafruit_Seesaw
> =

> Driver tested on RPi Zero 2W
> =

> Reviewed-by: Thomas Wei=DFschuh <linux@weissschuh.net>
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> ---
> Changes for v6:
> - Added TODO
> - Removed `clang-format` directives
> - Namespaced device buttons
> - Removed `char physical_path[32]` field from `struct seesaw_gamepad`
> - Added `packed` attribute to `struct seesaw_data`
> - Moved from having booleans per button to single `u32 button_state`
> - Added `seesaw_button_description` array to directly associate device
>   buttons with respective keycodes
> - Added wrapper functions `seesaw_register_` around `i2c_master_` API
> - Ratelimited input error reporting with `dev_err_ratelimited`
> - Removed `of_device_id`
> =

> Changes for v5:
> - Added link to the datasheet
> - Added debug log message when `seesaw_read_data` fails
> =

> Changes for v4:
> - Changed `1UL << BUTTON_` to BIT(BUTTON_)
> - Removed `hardware_id` field from `struct seesaw_gamepad`
> - Removed redundant checks for the number of bytes written and received by
>   `i2c_master_send` and `i2c_master_recv`
> - Used `get_unaligned_be32` to instantiate `u32 result` from `read_buf`
> - Changed  `result & (1UL << BUTTON_)` to
>   `test_bit(BUTTON_, (long *)&result)`
> - Changed `KBUILD_MODNAME` in id-tables to `SEESAW_DEVICE_NAME`
> - Fixed formatting issues
> - Changed button reporting:
>     Since the gamepad had the action buttons in a non-standard layout:
>          (X)
>       (Y)   (A)
>          (B)
>     Therefore moved to using generic directional action button event codes
>     instead of BTN_[ABXY].
> =

> Changes for v3:
> - no updates
> =

> Changes for v2:
> adafruit-seesaw.c:
> - Renamed file from 'adafruit_seesaw.c'
> - Changed device name from 'seesaw_gamepad' to 'seesaw-gamepad'
> - Changed count parameter for receiving joystick x on line 118:
>     `2` to `sizeof(write_buf)`
> - Fixed invalid buffer size on line 123 and 126:
>     `data->y` to `sizeof(data->y)`
> - Added comment for the `mdelay(10)` on line 169
> - Changed inconsistent indentation on line 271
> Kconfig:
> - Fixed indentation for the help text
> - Updated module name
> Makefile:
> - Updated module object file name
> MAINTAINERS:
> - Updated file name for the driver and bindings
> =

>  MAINTAINERS                              |   7 +
>  drivers/input/joystick/Kconfig           |   9 +
>  drivers/input/joystick/Makefile          |   1 +
>  drivers/input/joystick/adafruit-seesaw.c | 310 +++++++++++++++++++++++
>  4 files changed, 327 insertions(+)
>  create mode 100644 drivers/input/joystick/adafruit-seesaw.c
> =

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4cc6bf79fdd8..0595c832c248 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -441,6 +441,13 @@ W:	http://wiki.analog.com/AD7879
>  W:	https://ez.analog.com/linux-software-drivers
>  F:	drivers/input/touchscreen/ad7879.c
>  =

> +ADAFRUIT MINI I2C GAMEPAD
> +M:	Anshul Dalal <anshulusr@gmail.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
> +F:	drivers/input/joystick/adafruit-seesaw.c
> +
>  ADDRESS SPACE LAYOUT RANDOMIZATION (ASLR)
>  M:	Jiri Kosina <jikos@kernel.org>
>  S:	Maintained
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kcon=
fig
> index ac6925ce8366..df9cd1830b29 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -412,4 +412,13 @@ config JOYSTICK_SENSEHAT
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called sensehat_joystick.
>  =

> +config JOYSTICK_SEESAW
> +	tristate "Adafruit Mini I2C Gamepad with Seesaw"
> +	depends on I2C
> +	help
> +	  Say Y here if you want to use the Adafruit Mini I2C Gamepad.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called adafruit-seesaw.
> +
>  endif
> diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Mak=
efile
> index 3937535f0098..9976f596a920 100644
> --- a/drivers/input/joystick/Makefile
> +++ b/drivers/input/joystick/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_JOYSTICK_N64)		+=3D n64joy.o
>  obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+=3D psxpad-spi.o
>  obj-$(CONFIG_JOYSTICK_PXRC)		+=3D pxrc.o
>  obj-$(CONFIG_JOYSTICK_QWIIC)		+=3D qwiic-joystick.o
> +obj-$(CONFIG_JOYSTICK_SEESAW)		+=3D adafruit-seesaw.o
>  obj-$(CONFIG_JOYSTICK_SENSEHAT)	+=3D sensehat-joystick.o
>  obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+=3D sidewinder.o
>  obj-$(CONFIG_JOYSTICK_SPACEBALL)	+=3D spaceball.o
> diff --git a/drivers/input/joystick/adafruit-seesaw.c b/drivers/input/joy=
stick/adafruit-seesaw.c
> new file mode 100644
> index 000000000000..1aa6fbe4fda4
> --- /dev/null
> +++ b/drivers/input/joystick/adafruit-seesaw.c
> @@ -0,0 +1,310 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2023 Anshul Dalal <anshulusr@gmail.com>
> + *
> + * Driver for Adafruit Mini I2C Gamepad
> + *
> + * Based on the work of:
> + *	Oleh Kravchenko (Sparkfun Qwiic Joystick driver)
> + *
> + * Datasheet: https://cdn-learn.adafruit.com/downloads/pdf/gamepad-qt.pdf
> + * Product page: https://www.adafruit.com/product/5743
> + * Firmware and hardware sources: https://github.com/adafruit/Adafruit_S=
eesaw
> + *
> + * TODO:
> + *	- Add interrupt support
> + */
> +
> +#include <asm-generic/unaligned.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#define SEESAW_DEVICE_NAME	"seesaw-gamepad"
> +
> +#define SEESAW_STATUS_BASE	0
> +#define SEESAW_GPIO_BASE	1
> +#define SEESAW_ADC_BASE		9
> +
> +#define SEESAW_GPIO_DIRCLR_BULK	3
> +#define SEESAW_GPIO_BULK	4
> +#define SEESAW_GPIO_BULK_SET	5
> +#define SEESAW_GPIO_PULLENSET	11
> +
> +#define SEESAW_STATUS_HW_ID	1
> +#define SEESAW_STATUS_SWRST	127
> +
> +#define SEESAW_ADC_OFFSET	7
> +
> +#define SEESAW_BUTTON_A		5
> +#define SEESAW_BUTTON_B		1
> +#define SEESAW_BUTTON_X		6
> +#define SEESAW_BUTTON_Y		2
> +#define SEESAW_BUTTON_START	16
> +#define SEESAW_BUTTON_SELECT	0
> +
> +#define SEESAW_ANALOG_X		14
> +#define SEESAW_ANALOG_Y		15
> +
> +#define SEESAW_JOYSTICK_MAX_AXIS	1023
> +#define SEESAW_JOYSTICK_FUZZ		2
> +#define SEESAW_JOYSTICK_FLAT		4
> +
> +#define SEESAW_GAMEPAD_POLL_INTERVAL	16
> +#define SEESAW_GAMEPAD_POLL_MIN		8
> +#define SEESAW_GAMEPAD_POLL_MAX		32
> +
> +u32 SEESAW_BUTTON_MASK =3D BIT(SEESAW_BUTTON_A) | BIT(SEESAW_BUTTON_B) |
> +			 BIT(SEESAW_BUTTON_X) | BIT(SEESAW_BUTTON_Y) |
> +			 BIT(SEESAW_BUTTON_START) | BIT(SEESAW_BUTTON_SELECT);
> +
> +struct seesaw_gamepad {
> +	struct input_dev *input_dev;
> +	struct i2c_client *i2c_client;
> +};
> +
> +struct seesaw_data {
> +	__be16 x;
> +	__be16 y;
> +	u32 button_state;
> +} __packed;
> +
> +struct seesaw_button_description {
> +	unsigned int code;
> +	unsigned int bit;
> +};
> +
> +static const struct seesaw_button_description seesaw_buttons[] =3D {
> +	{
> +		.code =3D BTN_EAST,
> +		.bit =3D SEESAW_BUTTON_A,
> +	},
> +	{
> +		.code =3D BTN_SOUTH,
> +		.bit =3D SEESAW_BUTTON_B,
> +	},
> +	{
> +		.code =3D BTN_NORTH,
> +		.bit =3D SEESAW_BUTTON_X,
> +	},
> +	{
> +		.code =3D BTN_WEST,
> +		.bit =3D SEESAW_BUTTON_Y,
> +	},
> +	{
> +		.code =3D BTN_START,
> +		.bit =3D SEESAW_BUTTON_START,
> +	},
> +	{
> +		.code =3D BTN_SELECT,
> +		.bit =3D SEESAW_BUTTON_SELECT,
> +	},
> +};
> +
> +static int seesaw_register_read(struct i2c_client *client, u8 register_h=
igh,
> +				u8 register_low, char *buf, int count)

I am curious why we have 2 u8s instead of u16 that we send as __be16?

> +{
> +	int ret;
> +	u8 register_buf[2] =3D { register_high, register_low };
> +
> +	ret =3D i2c_master_send(client, register_buf, sizeof(register_buf));
> +	if (ret < 0)
> +		return ret;
> +	ret =3D i2c_master_recv(client, buf, count);

I am curious can this be an i2c_transfer() with read/write messages
instead (so 1 transaction)?

> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int seesaw_register_write_u8(struct i2c_client *client, u8 regist=
er_high,
> +				    u8 register_low, u8 value)
> +{
> +	int ret;
> +	u8 write_buf[3] =3D { register_high, register_low, value };
> +
> +	ret =3D i2c_master_send(client, write_buf, sizeof(write_buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int seesaw_register_write_u32(struct i2c_client *client,
> +				     u8 register_high, u8 register_low,
> +				     u32 value)
> +{
> +	int ret;
> +	u8 write_buf[6] =3D { register_high, register_low };
> +
> +	put_unaligned_be32(value, write_buf + 2);
> +	ret =3D i2c_master_send(client, write_buf, sizeof(write_buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int seesaw_read_data(struct i2c_client *client, struct seesaw_dat=
a *data)
> +{
> +	int ret;
> +	u8 read_buf[4];

Why is this u8 buffer and not __be32?

> +
> +	ret =3D seesaw_register_read(client, SEESAW_GPIO_BASE, SEESAW_GPIO_BULK,
> +				   read_buf, sizeof(read_buf));
> +	if (ret)
> +		return ret;
> +
> +	data->button_state =3D ~get_unaligned_be32(&read_buf);

If you use __be32 you would not need to use get_unaligned_be32.


> +
> +	ret =3D seesaw_register_read(client, SEESAW_ADC_BASE,
> +				   SEESAW_ADC_OFFSET + SEESAW_ANALOG_X,
> +				   (char *)&data->x, sizeof(data->x));
> +	if (ret)
> +		return ret;
> +	/*
> +	 * ADC reads left as max and right as 0, must be reversed since kernel
> +	 * expects reports in opposite order.
> +	 */
> +	data->x =3D SEESAW_JOYSTICK_MAX_AXIS - be16_to_cpu(data->x);
> +
> +	ret =3D seesaw_register_read(client, SEESAW_ADC_BASE,
> +				   SEESAW_ADC_OFFSET + SEESAW_ANALOG_Y,
> +				   (char *)&data->y, sizeof(data->y));
> +	if (ret)
> +		return ret;
> +	data->y =3D be16_to_cpu(data->y);

This is endianness violation and sparse should have warned you about
this. A variable can either carry BE data, LE data, or CPU-endianness
data, but not both. I'd recommend combining seesaw_read_data() with
seesaw_poll() into something like seesaw_report_events() and using
temporaries for x and y and button data, and do not store them in the
private structure at all. =


> +
> +	return 0;
> +}
> +
> +static void seesaw_poll(struct input_dev *input)
> +{
> +	int err, i;
> +	struct seesaw_gamepad *private =3D input_get_drvdata(input);
> +	struct seesaw_data data;
> +
> +	err =3D seesaw_read_data(private->i2c_client, &data);
> +	if (err !=3D 0) {
> +		dev_err_ratelimited(&input->dev,
> +				    "failed to read joystick state: %d\n", err);
> +		return;
> +	}
> +
> +	input_report_abs(input, ABS_X, data.x);
> +	input_report_abs(input, ABS_Y, data.y);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(seesaw_buttons); i++) {
> +		input_report_key(input, seesaw_buttons[i].code,
> +				 data.button_state &
> +					 BIT(seesaw_buttons[i].bit));
> +	}
> +	input_sync(input);
> +}
> +
> +static int seesaw_probe(struct i2c_client *client)
> +{
> +	int err, i;
> +	u8 hardware_id;
> +	struct seesaw_gamepad *seesaw;
> +
> +	err =3D seesaw_register_write_u8(client, SEESAW_STATUS_BASE,
> +				       SEESAW_STATUS_SWRST, 0xFF);
> +	if (err)
> +		return err;
> +
> +	/* Wait for the registers to reset before proceeding */
> +	mdelay(10);

Can this be usleep_range() instead? No need to block CPU.

> +
> +	seesaw =3D devm_kzalloc(&client->dev, sizeof(*seesaw), GFP_KERNEL);
> +	if (!seesaw)
> +		return -ENOMEM;
> +
> +	err =3D seesaw_register_read(client, SEESAW_STATUS_BASE,
> +				   SEESAW_STATUS_HW_ID, &hardware_id, 1);

sizeof(hardware_id)

> +	if (err)
> +		return err;
> +
> +	dev_dbg(&client->dev, "Adafruit Seesaw Gamepad, Hardware ID: %02x\n",
> +		hardware_id);
> +
> +	/* Set Pin Mode to input and enable pull-up resistors */
> +	err =3D seesaw_register_write_u32(client, SEESAW_GPIO_BASE,
> +					SEESAW_GPIO_DIRCLR_BULK,
> +					SEESAW_BUTTON_MASK);
> +	if (err)
> +		return err;
> +	err =3D seesaw_register_write_u32(client, SEESAW_GPIO_BASE,
> +					SEESAW_GPIO_PULLENSET,
> +					SEESAW_BUTTON_MASK);
> +	if (err)
> +		return err;
> +	err =3D seesaw_register_write_u32(client, SEESAW_GPIO_BASE,
> +					SEESAW_GPIO_BULK_SET,
> +					SEESAW_BUTTON_MASK);
> +	if (err)
> +		return err;
> +
> +	seesaw->i2c_client =3D client;
> +	i2c_set_clientdata(client, seesaw);
> +
> +	seesaw->input_dev =3D devm_input_allocate_device(&client->dev);
> +	if (!seesaw->input_dev)
> +		return -ENOMEM;
> +
> +	seesaw->input_dev->id.bustype =3D BUS_I2C;
> +	seesaw->input_dev->name =3D "Adafruit Seesaw Gamepad";
> +	seesaw->input_dev->phys =3D "i2c/" SEESAW_DEVICE_NAME;
> +	input_set_drvdata(seesaw->input_dev, seesaw);
> +	input_set_abs_params(seesaw->input_dev, ABS_X, 0,
> +			     SEESAW_JOYSTICK_MAX_AXIS, SEESAW_JOYSTICK_FUZZ,
> +			     SEESAW_JOYSTICK_FLAT);
> +	input_set_abs_params(seesaw->input_dev, ABS_Y, 0,
> +			     SEESAW_JOYSTICK_MAX_AXIS, SEESAW_JOYSTICK_FUZZ,
> +			     SEESAW_JOYSTICK_FLAT);
> +	for (i =3D 0; i < ARRAY_SIZE(seesaw_buttons); i++) {
> +		input_set_capability(seesaw->input_dev, EV_KEY,
> +				     seesaw_buttons[i].code);
> +	}
> +
> +	err =3D input_setup_polling(seesaw->input_dev, seesaw_poll);
> +	if (err) {
> +		dev_err(&client->dev, "failed to set up polling: %d\n", err);
> +		return err;
> +	}
> +
> +	input_set_poll_interval(seesaw->input_dev,
> +				SEESAW_GAMEPAD_POLL_INTERVAL);
> +	input_set_max_poll_interval(seesaw->input_dev, SEESAW_GAMEPAD_POLL_MAX);
> +	input_set_min_poll_interval(seesaw->input_dev, SEESAW_GAMEPAD_POLL_MIN);
> +
> +	err =3D input_register_device(seesaw->input_dev);
> +	if (err) {
> +		dev_err(&client->dev, "failed to register joystick: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id seesaw_id_table[] =3D {
> +	{ SEESAW_DEVICE_NAME, 0 },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, seesaw_id_table);
> +
> +static struct i2c_driver seesaw_driver =3D {
> +	.driver =3D {
> +		.name =3D SEESAW_DEVICE_NAME,
> +	},
> +	.id_table =3D seesaw_id_table,
> +	.probe =3D seesaw_probe,
> +};
> +module_i2c_driver(seesaw_driver);
> +
> +MODULE_AUTHOR("Anshul Dalal <anshulusr@gmail.com>");
> +MODULE_DESCRIPTION("Adafruit Mini I2C Gamepad driver");
> +MODULE_LICENSE("GPL");
> -- =

> 2.42.0
> =


Thanks.

-- =

Dmitry
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
