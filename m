Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBF6437447
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Aug 2026 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386841; cv=none; b=bWD9MqC+ivvfxxQCjh7jlmJ8boMWRRGsbtCGVNnY4RFyAW9uZcVOEYvM7YJ6qq3Vv0C/BgumYxcC1zzGwG7fwGKjS6MRqN+xOYQDiwV7jRw+KXRrlk2vfh6sl2iKfR6k1BB9DBFBcblaVzbSc5mS+lKmN4i5ugU0b9/gWrKFDO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386841; c=relaxed/simple;
	bh=SqcgA4LJuoWFHZgSuIGEdqOlMctmYEWvqDTQVUq2iwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gtPBNk2rG3yGtbnxCPjJyUYS1QgHlGnolY1wklhRNHYGFzZUtvSSJh4QjjTs8gp57AuMSLoyY+g6xc2UHtqa7pDu62RWuC2k82QtnE6YoXXuFZFmVPQkS5Kr7ow4kMo+nuh/Xy4v99t1Y1hKTht8xEV3UIWuHj0RZBHa0UktgsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2N04jdX; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2N04jdX"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-caf45fc5202so1853978a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Aug 2026 11:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786386839; x=1786991639; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKUjBVCjl00/cCCAjLM5qqAoQDkenE2Pgtyp/CT8tOo=;
        b=F2N04jdXGydXBZo5RzJuxdQxMuZISjVXvZUKiAYDYyhgUkH3J9oUNrc6krcdNepnuj
         /Xr4u+AhxF1tYVl+6qwl5iLV6NP1VgGMWTo3xpO+WxaC+3Tu7SzoUd/J9vq2sBCGLMZ7
         MPPkE5fs7PPO+lbH3gFaOvQsqsZuIb01oayIx7UYH3a6oWXxaO6NT4OCEACCGqq5xRjS
         0D9SmERpUT4HjhlSA15lzDoHhSuvIx6Z6R3m8pBj9LxmVRMO5jlmzctbWHMVPGNdzcKl
         bLRQIZZbsQW4HUdHyQdoISjkvJcxVJhmfQOD1fpBFYy9PSXqGRPy4spviMlkbvXq8IiX
         4/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786386839; x=1786991639;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKUjBVCjl00/cCCAjLM5qqAoQDkenE2Pgtyp/CT8tOo=;
        b=gHEcFuAgxVtFrC9zDQvw8icJUNa0a78fguKYD5Mrn/nTgdOzVu/VNxF3MDnCc3Qb5T
         K2T7TLLREEV5rLVzPayLOn0WxdeZnN2RxOGivpriJg8hCCzaXx1QrD9QRYn4EPi8uB9z
         hENqKbV8MV+C2uM77Az0+kEabGHfXt2YSsZEWqhKq0pvM5xc7q6tAwtEC5TtbpRFPu2h
         PFopOJVfm32WLdPHsqMDLVbpIvtGXB8VOCoNzUeLz7+X/oCTdrxe9XhgnlVNg3h3bGjv
         O8y6D0eHkx4GdTAidKfdIix+EkD2tFXUlaBoenKPXT6mIZ+Gg98AWRNY4Okj00R3u8cQ
         6E1w==
X-Forwarded-Encrypted: i=1; AHgh+RrcktTocEQe5/AhKJphkjC6gzcvRokfaeKj7EjU6EqI4F0GO9SE1hJePn8eykMOoHYzBoElhuiIB6xF//dhoP0Ck+Kfhg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj5ndzy8wBoutB3zbRM9mdSGKtCt2CoyY4PCPBletwbex0i3IH
	WLxHtcoJvNnL7PLFxj8xRpkoMF8vv1UDbgGXdgk70okxJsKm1Fa9k2A=
X-Gm-Gg: AR+sD13Y3ACvB/sdaOGVd9PXcoEVYuYvvY+F4Lw/RqIluM13Vgrap03pij64vFf/ExM
	5R6lr5fgcudfUjCsUJ+Z5bOUHVleL0TZx9pkKVGKa+29354O7UXArsaCByFYoa2HbYG0Kg9gt17
	lPlCzAkGENI3YxIJbXiGjMPWJuaYTdlq9v2zU043UUNXpWkldjcttYN+3bT+HPKAZLRJ5kSNYV9
	vAuYEjvsBBjVK5ovGLGMwZOQZyuq5SH/Dm7rlGh8BOo27bPa1rG28DaZt3olScUYuqKHm9LvjA9
	BUQQFBjsWLnvnBm5oPyDVsEEuB4Cf7FJLt2EQFpm8wRwg8d+zw1yiTGhDnDXh6mfn2SC4ScWrnD
	Ir6kCzVshf1wk5HP7LIdpwSCc0jUUOQ1o463znD7EvH1Dr6NTNGRXWTENXUJday9MnQtY/Vw9rg
	fm+kayJHShJmsz2l6tqEsOfDYf8eXntfsT3FuhfB9trOPc+/9u2ww7IDxt8jkBVRLjCEqXxx1I+
	aRz4eoz0/WPFjwALtiDjbarRKHz6dnkH1icyEk/
X-Received: by 2002:a05:6a21:3392:b0:3c3:9595:57ef with SMTP id adf61e73a8af0-3cb85ffd1cemr50581343637.31.1786386839340;
        Mon, 10 Aug 2026 11:33:59 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a9220sm48209020eec.7.2026.08.10.11.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:33:58 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	David Lechner <dlechner@baylibre.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] iio: humidity: am2315: add am2320 to i2c_device_id table
Date: Mon, 10 Aug 2026 15:32:31 -0300
Message-ID: <20260810183337.451812-1-nico.antinori.7@gmail.com>
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
v2:
- Adapted KConfig text using the suggestions from v1 by Nuno Sá and Andy
  Shevchenko

v1: https://lore.kernel.org/all/20260805183733.1000550-1-nico.antinori.7@gmail.com/T/#u

 drivers/iio/humidity/Kconfig  | 8 +++++---
 drivers/iio/humidity/am2315.c | 3 ++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/humidity/Kconfig b/drivers/iio/humidity/Kconfig
index 54f11f000b6f..10598a0b15bc 100644
--- a/drivers/iio/humidity/Kconfig
+++ b/drivers/iio/humidity/Kconfig
@@ -5,13 +5,15 @@
 menu "Humidity sensors"

 config AM2315
-	tristate "Aosong AM2315 relative humidity and temperature sensor"
+	tristate "Aosong AM2315 and similar relative humidity and temperature sensor"
 	depends on I2C
 	select IIO_BUFFER
 	select IIO_TRIGGERED_BUFFER
 	help
-	  If you say yes here you get support for the Aosong AM2315
-	  relative humidity and ambient temperature sensor.
+	  If you say yes here you get support for the Aosong relative
+	  humidity and ambient temperature sensors:
+	  - AM2315
+	  - AM2320

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
+ * Aosong AM2315 and similar relative humidity and temperature
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

