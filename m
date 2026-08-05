Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EEB3859F7
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  5 Aug 2026 18:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785955106; cv=none; b=ZBOyXDlkzBgrZpMTxXuZ9ksik8kTb+TCLiEUPC77ZAj6eoVAf2FkybgHWEkCkC2+3HNl3cOSF4LV5GlkGx4UJoo/4vP9bARm2xRYM+lnuwaGAxDVOFcEc5wHu+rJjEj6LX3Hld7wxfBAMqWOXg9face8WjkS5Gvb7DAXOfdEGYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785955106; c=relaxed/simple;
	bh=Kg2Kxv6fzc0scOsXjrgF6Ue/IrPuOnHYB2EMECrfbUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rkr9vFvF016YC82BiY1mm0JJXMBfgLF+V4y4KtihZrWdWV3ueOvtBDrbhqx4MRHf8bsbzZcXKXf7UmX4ZCb9C6nL5ZTonu9nq6xrgofp2+tfOyBE9TrqEJygpXhbe+EkBUVNOk3k9/fyr00xnVu7yFJvTbog8n/c5XxZrX2E+JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPzLBhfp; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPzLBhfp"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so1355934b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 05 Aug 2026 11:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785955104; x=1786559904; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IcI3jVVavG4O7m6ymsDhUgAeGCONzrnZZCZc1GCzkcM=;
        b=YPzLBhfpLE7ugxJfAc5sEQx9nQwp7fZkeaVRE1cWvRzqzsOgmA1xOIlX3+hq9hPFn3
         wuMezUoKSXlvi+24wstgvRGnBD4dNyU72hMlobeAXGmJpmzbSpC9OboCqtrjwR+d5JGQ
         6GkFXiuQC5Q7vge+rWE6nXGjY6984jNOrXYxh/HtlE+pRPGRJdRHdsJwxRYwDNWR2fzA
         tdbmo6a9/+MEssD3aCgxztp9pXF2585ONFkj5xdNTkje7tOPIHldDb6NFuP17VkFgU/H
         Wvg0mE/5eE3rbrv7gVfKV/mF8dw2BqJe7wXLJCkRh48HKSM5Q1J5V7kjcYq1LAqWdc4n
         T+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785955104; x=1786559904;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IcI3jVVavG4O7m6ymsDhUgAeGCONzrnZZCZc1GCzkcM=;
        b=RVn58mlGUaCBq27nlvBFvkIiqwLbPevCoWM0nZV5xhUTwiOH204g5lslds94wfrHnl
         Wah+5k7k1vvyMMEzCR2p9mMjDBTU7IeuAwh6xl6k/Z/3HJbOdGHn/dIVykkLL4LxoEvB
         fU5J0b175dVLSIWfJ8BmBS0DSUFIEtIf9XsSKWrXqj75CjyBm3Qoa+xrFLpEJ//LP4dm
         micaREBshE0MfIbrLcXjHXaL+fidOekW+eWppy7TtkwRmyVbrtkiC6piNbkgTxH81ibS
         EkMtvQS+vdF6WeK84OyxNYAP3YI6hkkc3sB4nNN3lnixkuxyKt5u0OIICjYiEoOLbVuU
         mReA==
X-Forwarded-Encrypted: i=1; AHgh+RrSLWtLIfJmFqjDq0JiohdSvuMGXnkLpJ8QAJxd+7ZD5lKCWsu7g7azsJYReeHAalv3RLrL8mRalRR2eYhSwbPk5AJZ2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj9z8jkV5BDaTQgaCDqmS9qs14cuByjyhnJ0nCGvQD+jsX6Ob4
	vI11ElY2CjyW8QXHzqeotUJ3M4w4QhcYd1zOAitEn1DTdez/qvuNVHG2ngpQ/yM=
X-Gm-Gg: AR+sD10xO3v81W9YkUyZfGedKs0zrejKbtRJFuhY2ec3uF3lHBY3vsc8gF0oGJrXl60
	jWX6sjf1J4CDHk7RgCCQTamuCVtMnchxWh8lYWUF4h2/x+qSP6O3Nu9hORtLRQRdXfBKRJn0Q+Z
	/7ihvUQ3IdNt1Fwk69eu3aujthiQfdan63QSNGTT6pPaZvdQitvI5gBX7ZYcfVOi+iU6Y1d373e
	F9pf3SkvNtnuHoLTQj3O50WNcLGwZmNIK1PtNtjrUHIwpHz35vPIt098xa8HkWkD6iYV0dRn15p
	sWckAOEEVUB+Bs74ZNvliyCBkwLZLgBQ1wCXHKibVSTo3z8G9It0zPw0oJIgGtx6nM+YzcoHH+F
	w/OwuYe9vcGPr5hUIpGwPuf9R9d2ktbkvfEQsivmfJM/OXfiWOjnpanJJTCBRKtLK9soO8YqDHy
	dH9h7rxq1LVUPK5tMIAEPnhhi6rNznROhM/1hrxrmUpg0C1Gw9zVZ7y5ioFLYa3FUCLr3HDdjci
	hfOip6I0Xju7krqrlZbD8LaaFM190x45FNOMhk3QGh2ZdxW37Y=
X-Received: by 2002:a05:6a20:7f86:b0:3bf:9c93:ac44 with SMTP id adf61e73a8af0-3cb85ea363cmr7925125637.19.1785955104544;
        Wed, 05 Aug 2026 11:38:24 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7b2sm19156631eec.19.2026.08.05.11.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:38:24 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	David Lechner <dlechner@baylibre.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] iio: humidity: am2315: add am2320 to i2c_device_id table
Date: Wed,  5 Aug 2026 15:37:26 -0300
Message-ID: <20260805183733.1000550-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
communication protocol and measurement conversions.

Add the "am2320" entry to the i2c_device_id table.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Tested with Raspberry Pi 3b+

Used as reference AM2315 Datasheet [1] and AM2320 datasheet [2]

[1] https://cdn-shop.adafruit.com/datasheets/AM2315.pdf
[2] https://cdn-shop.adafruit.com/product-files/3721/AM2320.pdf

 drivers/iio/humidity/Kconfig  | 4 ++--
 drivers/iio/humidity/am2315.c | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/humidity/Kconfig b/drivers/iio/humidity/Kconfig
index 54f11f000b6f..6907805945f3 100644
--- a/drivers/iio/humidity/Kconfig
+++ b/drivers/iio/humidity/Kconfig
@@ -5,13 +5,13 @@
 menu "Humidity sensors"

 config AM2315
-	tristate "Aosong AM2315 relative humidity and temperature sensor"
+	tristate "Aosong AM2315/AM2320 relative humidity and temperature sensor"
 	depends on I2C
 	select IIO_BUFFER
 	select IIO_TRIGGERED_BUFFER
 	help
 	  If you say yes here you get support for the Aosong AM2315
-	  relative humidity and ambient temperature sensor.
+	  and AM2320 relative humidity and ambient temperature sensors.

 	  This driver can also be built as a module. If so, the module will
 	  be called am2315.
diff --git a/drivers/iio/humidity/am2315.c b/drivers/iio/humidity/am2315.c
index f29baa251f9f..5bce5eec45cc 100644
--- a/drivers/iio/humidity/am2315.c
+++ b/drivers/iio/humidity/am2315.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Aosong AM2315 relative humidity and temperature
+ * Aosong AM2315/AM2320 relative humidity and temperature
  *
  * Copyright (c) 2016, Intel Corporation.
  *
@@ -251,6 +251,7 @@ static int am2315_probe(struct i2c_client *client)

 static const struct i2c_device_id am2315_i2c_id[] = {
 	{ .name = "am2315" },
+	{ .name = "am2320" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, am2315_i2c_id);
--
2.47.3

