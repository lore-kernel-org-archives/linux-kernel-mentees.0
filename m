Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627C622A4D6
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 Aug 2025 20:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756586586; cv=none; b=K3unyndS8t7hT9KpnNLR8UACM6u3Jj3gF0soQBAzBeh0tXc7zhXoRnmzPbSsj6ibe1pP8PCG00EfyVRada3BKvoiLP+GMVOcVATHoA8vFj5vVsMjn4zju7SlAHDQcwpYGjrebOgZl7wWhOcWXa73cojQEnGWh4KVQiFpYlh+OaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756586586; c=relaxed/simple;
	bh=Oc1SfZPRwpPbIA67baTaaoY0Mim5mSLqWxxH+3osxrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXDcwkkYK70YGQx0GEUmWIlF3zoXIZQJOOu0XHugELuKysmkgAJnPhrKF6MmldYRmlUoyIYvz5jRZrvJzLhbOIShfNMAH70cqXhMnw+J96v7KyWlg6Lc/A2RcYoPkh0HFrR4y9l8eQadvMU+7eHiqL+a3GeEqoKoK8wLohdnhpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hp69VW5e; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hp69VW5e"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afedbb49c26so488034866b.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 Aug 2025 13:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756586583; x=1757191383; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+MrdMl6FNd1ZxMPqxCMJ/a2n5M5hiW2ISh619iEIHA=;
        b=hp69VW5edC8mFcwYNHpHQHoHMxeHSkkp5qpAhxh+ZAyXMKR1/bVqbQzB8aCoWy6HQI
         25Z8poUHHwgx1OPUR9k82jwDkKtEFMCNRj6MWgyLEnWURSg5qd39grgq/rtpvQHLV4XO
         nu+TMpo9ABoYx0KTv1oOYTtWAbeuyIFtmKGON/OWMwu5Vcu7HRfS9x63zgvH760C+u+R
         Tto1F+ewDZk9KHQxD0121opzzD6MiyuNRnOG+gv3i7SOsBxK/45+PPP5pPvlJ2zGc72x
         ntSGyykOppYOhUUtSZrcuDmNWY37Y5d8sYZ5kVZALAJm+3OUwZ1R5UA+1GuCONWA5xLi
         kSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756586583; x=1757191383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+MrdMl6FNd1ZxMPqxCMJ/a2n5M5hiW2ISh619iEIHA=;
        b=r1w9WiM7q0z23ympG14hFCY/l2IBIVgP7fbVeDVpP21pl1EOhqH9hKbqkwhQkhxUKQ
         Y0AsgrQMfsdTtyn1O6xrQKeJwxPZr3IuQ+3s9jIXLWf1TbSiR6bQRidIPFWdLgATq53A
         yzrxFU8hffQE2AN1QF+P+S2BUlzwF2sNgsbCE+/cBV9kqrD8Cvwziuzlyv/GQceRjEJs
         8uIc+0iihlek/xgvkqquh9Bar/mK0HTUz9qIw4laixfuQ62al6ebmcspBcq1cNua9up5
         9Z+GB8hptMuOrO3LjmWvOVFc+kK5Wy3kO4K+YNtkh30oGP5GEs76IeO9Z7XuTXp3kYke
         rLpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMV7gkSlMGv7UiMOMVn1lkWaGxEPt6MIEvt7VZaD3tWd4HJFLnZA3fWMSGgND1WXO6WjDK+hsfuih5flhu8MG0Z0TwfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoSXrv9nEMRjHxZcJ6MDYhpFIwHQqotDaolv1VoPNFs/5hJmGi
	ppFKXm760fuPduRTvaFrj30cepjnN0woNNsgbnFld7GSa4YF7gRbSMVqdPj39/GRKSJagtVAnBL
	FNwhWu4UpMT3p03/HB+QFisDAG1Bd3Dk=
X-Gm-Gg: ASbGnctYq06D6OIttMEAfCRPJbKpd0dVD5wwp8XPlPo0QTlVny46cxr9SmLBouXTdpo
	TrXgEEm0KsyYfyRizf+qOAldmOjhTX4yTFCLX41g/gsqeYOllJ0+2BB9CTKwaU6TBKeniDz+wDU
	vhEXmsASZRX1LWmXyxiZfa1y6tKxSVjQnjvgFOlVeMeI48BLeE2Klxq3Nr6VGZ8MLgp8hG/VP1b
	WBNphU=
X-Google-Smtp-Source: AGHT+IFaKr7FnzUn+u/3zAbu74/m+MUS+zy1Z33pn1upAiuuCG6iCNpqUuYU61DihfQubaHis63R6Gf7ZlPQ0g4fhp4=
X-Received: by 2002:a17:907:3f94:b0:afe:7cb6:60f0 with SMTP id
 a640c23a62f3a-b01d8c86d85mr267547466b.29.1756586582493; Sat, 30 Aug 2025
 13:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250831-icm20948-v1-0-1fe560a38de4@gmail.com> <20250831-icm20948-v1-2-1fe560a38de4@gmail.com>
In-Reply-To: <20250831-icm20948-v1-2-1fe560a38de4@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 Aug 2025 23:42:26 +0300
X-Gm-Features: Ac12FXyByc6WY8IgtCHwKu6rFKt3EKG4bJeBI51LQx3fl2seio61SrYeE0Vk-10
Message-ID: <CAHp75VeKfHQH3LMCjVdjd=kJA4s6-Ux1-WHNzOsYA-f4QkkUyw@mail.gmail.com>
Subject: Re: [PATCH 2/5] iio: imu: add inv_icm20948
To: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shuah@kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 30, 2025 at 9:43=E2=80=AFPM Bharadwaj Raju
<bharadwaj.raju777@gmail.com> wrote:
>
> Core parts of the new ICM20948 driver.
>
> Add register definitions, probing, setup, and an IIO device for
> reading the onboard temperature sensor.

...

>  drivers/iio/imu/Kconfig                          |   1 +
>  drivers/iio/imu/Makefile                         |   1 +
>  drivers/iio/imu/inv_icm20948/Kconfig             |  17 ++++
>  drivers/iio/imu/inv_icm20948/Makefile            |   8 ++
>  drivers/iio/imu/inv_icm20948/inv_icm20948.h      |  47 +++++++++
>  drivers/iio/imu/inv_icm20948/inv_icm20948_core.c | 122 +++++++++++++++++=
++++++
>  drivers/iio/imu/inv_icm20948/inv_icm20948_i2c.c  |  48 +++++++++
>  drivers/iio/imu/inv_icm20948/inv_icm20948_temp.c | 108 +++++++++++++++++=
+++
>  8 files changed, 352 insertions(+)

This looks strange. The few files are created here, and there is no
comment like "new file ..."
That said, the MAINTAINER is not updated here and hence the file will
be orphaned till the MAINTAINER changes. So, update incrementally
MAINTAINERS starting from the first patch.

...

> +#ifndef INV_ICM20948_H_
> +#define INV_ICM20948_H_
> +
> +#include <linux/bits.h>

> +#include <linux/bitfield.h>

Unused.

> +#include <linux/mutex.h>

> +#include <linux/regmap.h>

Can be replaced with proper forward declarations.

> +#include <linux/i2c.h>

Unused

> +#include <linux/iio/iio.h>

Forward declaration.

> +#include <linux/err.h>

Unused.

Keep it ordered and follow the IWYU principle (include what you use).
Currently this is a semi-random list of the inclusions. And missed
forward declarations.

...

> +#define INV_ICM20948_REG_BANK_SEL 0x7F

Make all register offsets to be fixed-width, like 0x007F

> +#define INV_ICM20948_BANK_SEL_MASK GENMASK(5, 4)
> +
> +#define INV_ICM20948_REG_WHOAMI 0x0000
> +#define INV_ICM20948_WHOAMI 0xEA
> +
> +#define INV_ICM20948_REG_FIFO_RW 0x0072
> +
> +#define INV_ICM20948_REG_PWR_MGMT_1 0x0006
> +#define INV_ICM20948_PWR_MGMT_1_DEV_RESET BIT(7)
> +#define INV_ICM20948_PWR_MGMT_1_SLEEP BIT(6)
> +
> +#define INV_ICM20948_REG_TEMP_DATA 0x0039
> +
> +extern const struct regmap_config inv_icm20948_regmap_config;
> +
> +struct inv_icm20948_state {
> +       struct device *dev;
> +       struct regmap *regmap;
> +       struct iio_dev *temp_dev;
> +       struct mutex lock;
> +};
> +
> +extern int inv_icm20948_core_probe(struct regmap *regmap);
> +
> +struct iio_dev *inv_icm20948_temp_init(struct inv_icm20948_state *state)=
;
> +
> +#endif

...

> +#include "inv_icm20948.h"

This file uses much more than the private header. Please, fix this properly=
.

...

> +static const struct regmap_range_cfg inv_icm20948_regmap_ranges[] =3D {
> +       {
> +               .name =3D "user banks",
> +               .range_min =3D 0x0000,
> +               .range_max =3D 0x3FFF,

Are you sure about range_min? This will cause circular caching and
unpleasant side-effects.

> +               .selector_reg =3D INV_ICM20948_REG_BANK_SEL,
> +               .selector_mask =3D INV_ICM20948_BANK_SEL_MASK,
> +               .window_start =3D 0,
> +               .window_len =3D 0x1000,
> +       },
> +};
> +
> +static const struct regmap_range inv_icm20948_regmap_volatile_yes_ranges=
[] =3D {
> +       /* WHOAMI */
> +       regmap_reg_range(0x0000, 0x0000),
> +       /* PWR_MGMT_1 */
> +       regmap_reg_range(0x0006, 0x0006),
> +       /* I2C and INT status */
> +       regmap_reg_range(0x0017, 0x001C),
> +       /* Sensor readouts */
> +       regmap_reg_range(0x0028, 0x0052),
> +       /* FIFO count and data */
> +       regmap_reg_range(0x0070, 0x0072),
> +       /* Data ready status */
> +       regmap_reg_range(0x0074, 0x0074),

So, the above are real, the below are virtual? How does it work?

> +       /* GYRO_CONFIG_1 */
> +       regmap_reg_range(0x2001, 0x2001),
> +       /* I2C SLV4 data in */
> +       regmap_reg_range(0x307F, 0x307F),
> +};

...

> +static const struct regmap_range inv_icm20948_rd_noinc_no_ranges[] =3D {
> +       regmap_reg_range(0x0000, INV_ICM20948_REG_FIFO_RW - 1),
> +       regmap_reg_range(INV_ICM20948_REG_FIFO_RW + 1, 0x3FFF),

Make 0x3fff a constant and use it everywhere.

> +};

...

> +const struct regmap_config inv_icm20948_regmap_config =3D {
> +       .name =3D "inv_icm20948",
> +       .reg_bits =3D 8,
> +       .val_bits =3D 8,
> +       .max_register =3D 0x3FFF,

See above.

> +       .ranges =3D inv_icm20948_regmap_ranges,
> +       .num_ranges =3D ARRAY_SIZE(inv_icm20948_regmap_ranges),
> +       .volatile_table =3D &inv_icm20948_regmap_volatile_accesses,
> +       .rd_noinc_table =3D &inv_icm20948_regmap_rd_noinc_table,
> +       .cache_type =3D REGCACHE_MAPLE,
> +};

...

> +static int inv_icm20948_setup(struct inv_icm20948_state *state)
> +{
> +       guard(mutex)(&state->lock);
> +
> +       int reported_whoami;
> +       int ret =3D regmap_read(state->regmap, INV_ICM20948_REG_WHOAMI,
> +                             &reported_whoami);

Just no. We almost do not allow a mixture of the definitions and code.

> +       if (ret)
> +               return ret;
> +       if (reported_whoami !=3D INV_ICM20948_WHOAMI) {
> +               dev_err(state->dev, "invalid whoami %d, expected %d\n",
> +                       reported_whoami, INV_ICM20948_WHOAMI);
> +               return -ENODEV;
> +       }
> +
> +       ret =3D regmap_write_bits(state->regmap, INV_ICM20948_REG_PWR_MGM=
T_1,
> +                               INV_ICM20948_PWR_MGMT_1_DEV_RESET,
> +                               INV_ICM20948_PWR_MGMT_1_DEV_RESET);
> +       if (ret)
> +               return ret;

Any long sleeps (and even 1ms is already long on modern fast CPUs)
must be explained.

> +       msleep(INV_ICM20948_SLEEP_WAKEUP_MS);
> +
> +       ret =3D regmap_write_bits(state->regmap, INV_ICM20948_REG_PWR_MGM=
T_1,
> +                               INV_ICM20948_PWR_MGMT_1_SLEEP, 0);
> +       if (ret)
> +               return ret;

> +       msleep(INV_ICM20948_SLEEP_WAKEUP_MS);

Ditto.

> +       state->temp_dev =3D inv_icm20948_temp_init(state);

> +       if (IS_ERR(state->temp_dev))
> +               return PTR_ERR(state->temp_dev);
> +
> +       return 0;


return PTR_ERR_OR_ZERO(...);

> +}
> +
> +int inv_icm20948_core_probe(struct regmap *regmap)
> +{
> +       struct device *dev =3D regmap_get_device(regmap);

> +

Have you ever run checkpatch.pl? We do not allow blank lines in the
definition blocks.

> +       struct inv_icm20948_state *state;
> +
> +       state =3D devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
> +       if (!state)
> +               return -ENOMEM;
> +
> +       state->regmap =3D regmap;
> +       state->dev =3D dev;

> +       mutex_init(&state->lock);

devm_mutex_init()

> +       return inv_icm20948_setup(state);
> +}

...

> +#include <linux/kernel.h>

This header must not be used in the regular drivers. Follow the IWYU princi=
ple.

> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/property.h>

Keep them ordered.

...

> +static int inv_icm20948_probe(struct i2c_client *client)
> +{
> +       struct regmap *regmap =3D
> +               devm_regmap_init_i2c(client, &inv_icm20948_regmap_config)=
;
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);

This is wrong stylistically.
First of all, there must be a blank line between definition block and
the code, BUT in this case the code will be harder to maintain and it
will be prone to subtle errors, that's why it's recommended to split
definition and the assignment and move assignment closest to the
check.

> +       return inv_icm20948_core_probe(regmap);
> +}
> +
> +static const struct i2c_device_id inv_icm20948_id[] =3D { { "icm20948" }=
, {} };

No, please make it readable.

> +MODULE_DEVICE_TABLE(i2c, inv_icm20948_id);
> +
> +static const struct of_device_id inv_icm20948_of_matches[] =3D {
> +       { .compatible =3D "invensense,icm20948" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, inv_icm20948_of_matches);
> +
> +static struct i2c_driver inv_icm20948_driver =3D {
> +       .driver =3D {
> +               .name =3D "icm20948",
> +               .of_match_table =3D inv_icm20948_of_matches,
> +       },
> +       .probe =3D inv_icm20948_probe,
> +       .id_table =3D inv_icm20948_id,
> +};
> +module_i2c_driver(inv_icm20948_driver);
> +
> +MODULE_AUTHOR("Bharadwaj Raju <bharadwaj.raju777@gmail.com>");
> +MODULE_DESCRIPTION("InvenSense ICM-20948 device driver (I2C)");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("IIO_ICM20948");

I stop here as I believe the whole series needs much more work to
follow IWYU, the style, coding standards, etc...
When you are done with that, come up with a new version.

Thanks!

--
With Best Regards,
Andy Shevchenko
