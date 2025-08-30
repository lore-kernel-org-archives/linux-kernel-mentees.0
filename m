Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13F72DCF50
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 Aug 2025 18:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756579419; cv=none; b=a3bMNwE2lptBKXnYhDR6Cm9UBK/NqzwHnjOKXZpy6tPC5C4eKo+d61DveAj01RBellfZrnRvI8CdxXq/MKmMhRgBQGx0qd4TF2oSjmilt+JrEkdQin12WY6SR2XUaeX0uiSWf0c36udoKAYkeV+F1E2n5eC3RUbpiAFpF2aU2C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756579419; c=relaxed/simple;
	bh=YtIGNLXaQcmkc4Bi2x5bHdVSJylHl4+GAVTUbZPrAjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rSmxxkcKvzH4i4o9WlaBFwR6x8L1NJzLWPRlS64y9Cm8mgcfJRIJ3vnNMma7+a+K5iNDsg24FDsRl7Z6rGlj03vgSnlYOxwNh0wKawU96TsAv5VxtAMAzR/H+PXCdZhtBhozySbBvl0TjU1WUrvAE1+yFDCnu2uR1uA+Qle0xAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyL6N+sp; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyL6N+sp"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b49b56a3f27so2028747a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 Aug 2025 11:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756579417; x=1757184217; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPo8Q3Bu4jk8j+Uw+RLNhPXNNzhpQ7JonMOG41K09VA=;
        b=KyL6N+spMD7SbH7KmEU9GpCCb8gm0odpP4E4KOy0/b7CnfdfIhO3TUibEjdoQjZuKk
         JFwFhougU2uvuNqdntj2X/A7sO+LZelH9STxDKgZ7Nlf42b/QliOCxTGsrNaEUVLpY6x
         OMdkPWLzaM/LB0yyVd5kfRT+yBV6D/kltR2HbUQpXktW7oHpsbbwI2UyBoZUZwiJxuJH
         49WapuXtksHlL8EFyK7XYrVUdFUg6i2Jr3QQ5+pG6cEVmRhJNjA9jG8QvJ8B+hteyV3w
         8rZcJgROmtP+H0tyRlFnd7J9+JnNvufTSug8236t85AYEQVeWnbvb3YxLnKLlY5g2oG7
         3/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756579417; x=1757184217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPo8Q3Bu4jk8j+Uw+RLNhPXNNzhpQ7JonMOG41K09VA=;
        b=ncvwF+9SMv2k99R96VW/mCAfa8Q41tN+vntJTb6HHQnoy1BcSqrfyREEAk2DBI6+LC
         yNMdEdDpevSa8MN4zXJLMPFY/o/B3lYQcEhxWa6xVAjk73hXSEHF2h2Q1gjOayT99pC9
         a19b/r7fM1eTn6UlRjAlr6RSP9WG6ocHBYrXyw+vs7W5RkiccgLF/tpU9ZdzPjzWUHH0
         NQ+7VakABnmR+lT4Iqs88syvPLY0hXHlNAZeqjPVpdt3CCvB5N2xMuO8NfbFTwqE5zZN
         hljT8M2HA1uNwiTYTS2Ya7LflWp1DJfMc37UZYwXk/DZygeQHYZAAUiFar6el1fL/hSL
         Na4A==
X-Forwarded-Encrypted: i=1; AJvYcCVku2Gx2Q7FR2lvS6vzvP4MYZ6BW9B5HKaVvOLDsh0ueTYDPNYiDHDweduMK1xKtr8eZWbUpn01ePKbbMwPqssfkjvq3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPsbfhr2ZEjK40bHEBFd0ry4JHPi9Dn2TMYx3Oh6QmHJgwdnRU
	/Z73zk/oj8zSosAZnDfBkLBNH+Zw2q4U+GR2MqYjMwO1l/poU3tTuMcSQRSq0oaJ
X-Gm-Gg: ASbGncuYAR6MaC4xYop8u+Ct0Bih8n4L+f9ShEQScvo+VMb3nhAsQtl2ZGOf5MIQcKW
	7f91ajfbev79I3BJsifQy0WUkcnFUTB7CGxrrmwc19UFAwwCSzgVSjyFUaTw33rPTjEpac6t6cY
	6C/cgcq1oBV11IYL+JwbWYw801TsmHm/8MG9AWpJbqyM6ZZjfmw5gVp1F1SPC/NjIXtHE0soreo
	yKNXR4SNW2DWBYYEf5X9dbDB8OBwk7KTxHbhWgjy6DU4Pe3gBam/yS0AwFN2PxlRRSzTS4X9gy4
	Hpz92h3b+ILJegFOdCzajhKduur8JFNQQNp5eoaO0zEOUsQgavEcQ2T9VLJ2aSq0QQbW9RDWUUI
	8gqM56ftBfsoL0/zvgScRpaVfAtDxKjmvmuutqxGSXUDL1FcMlDhF1uDfO/U=
X-Google-Smtp-Source: AGHT+IGatw6wqMSc9flLFH26sU9wlID4+2HyjBNw0BsJSxIrSeTya3p2EMyW+F3Cs0eWgDVkPaYYkg==
X-Received: by 2002:a17:903:380f:b0:246:de71:1839 with SMTP id d9443c01a7336-24944b64760mr36733385ad.50.1756579416680;
        Sat, 30 Aug 2025 11:43:36 -0700 (PDT)
Received: from [192.168.1.19] ([122.177.240.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490658999fsm56821665ad.112.2025.08.30.11.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 11:43:36 -0700 (PDT)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Date: Sun, 31 Aug 2025 00:12:49 +0530
Subject: [PATCH 5/5] iio: imu: icm20948: add runtime power management
 support
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-icm20948-v1-5-1fe560a38de4@gmail.com>
References: <20250831-icm20948-v1-0-1fe560a38de4@gmail.com>
In-Reply-To: <20250831-icm20948-v1-0-1fe560a38de4@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, shuah@kernel.org, 
 linux-kernel-mentees@lists.linux.dev, 
 Bharadwaj Raju <bharadwaj.raju777@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756579380; l=9361;
 i=bharadwaj.raju777@gmail.com; s=20250830; h=from:subject:message-id;
 bh=YtIGNLXaQcmkc4Bi2x5bHdVSJylHl4+GAVTUbZPrAjo=;
 b=yj+v3a5GPXh26ZZOPJo4IfImx0oV3vCZhKBkPDgy5xpF0Plr/GhZS5aIqV+ZZKLqyYJX4fxKW
 eIrvJwehusNCpooAon7s0K1Ky2slKs4/K9XoxSmWZJBacQ5iOCXG3b7
X-Developer-Key: i=bharadwaj.raju777@gmail.com; a=ed25519;
 pk=s+pP76EgUCC/7pyu4E6Q5AizWQ1T6hUf1jUWrQRl040=

Implement runtime power management support for the ICM20948
sensor. The device autosuspends after 2 seconds of idle time.

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 drivers/iio/imu/inv_icm20948/Makefile             |  1 +
 drivers/iio/imu/inv_icm20948/inv_icm20948.h       |  7 +++
 drivers/iio/imu/inv_icm20948/inv_icm20948_core.c  |  3 +-
 drivers/iio/imu/inv_icm20948/inv_icm20948_gyro.c  | 28 ++++++---
 drivers/iio/imu/inv_icm20948/inv_icm20948_power.c | 73 +++++++++++++++++++++++
 drivers/iio/imu/inv_icm20948/inv_icm20948_temp.c  | 15 +++--
 6 files changed, 114 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/imu/inv_icm20948/Makefile b/drivers/iio/imu/inv_icm20948/Makefile
index 88a37be159e1d6f575da1c070c84ac94cd963020..0a17ad1c003e6a93f3431f7a998e56cdf975d245 100644
--- a/drivers/iio/imu/inv_icm20948/Makefile
+++ b/drivers/iio/imu/inv_icm20948/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_INV_ICM20948) += inv-icm20948.o
 inv-icm20948-y += inv_icm20948_core.o
 inv-icm20948-y += inv_icm20948_temp.o
 inv-icm20948-y += inv_icm20948_gyro.o
+inv-icm20948-y += inv_icm20948_power.o
 
 obj-$(CONFIG_INV_ICM20948_I2C) += inv-icm20948-i2c.o
 inv-icm20948-i2c-y += inv_icm20948_i2c.o
diff --git a/drivers/iio/imu/inv_icm20948/inv_icm20948.h b/drivers/iio/imu/inv_icm20948/inv_icm20948.h
index ca2513114378cdcba5bc315fc94cd61f930b4dfa..194dcccabc2162334779b285320187c7ff1f5236 100644
--- a/drivers/iio/imu/inv_icm20948/inv_icm20948.h
+++ b/drivers/iio/imu/inv_icm20948/inv_icm20948.h
@@ -13,10 +13,13 @@
  #include <linux/i2c.h>
  #include <linux/iio/iio.h>
  #include <linux/err.h>
+ #include <linux/pm_runtime.h>
 
 /* accel takes 20ms, gyro takes 35ms to wake from full-chip sleep */
  #define INV_ICM20948_SLEEP_WAKEUP_MS 35
 
+ #define INV_ICM20948_SUSPEND_DELAY_MS 2000
+
  #define INV_ICM20948_REG_BANK_SEL 0x7F
  #define INV_ICM20948_BANK_SEL_MASK GENMASK(5, 4)
 
@@ -46,6 +49,8 @@
 
 extern const struct regmap_config inv_icm20948_regmap_config;
 
+extern const struct dev_pm_ops inv_icm20948_pm_ops;
+
 enum inv_icm20948_gyro_fs {
 	INV_ICM20948_GYRO_FS_250 = 0,
 	INV_ICM20948_GYRO_FS_500 = 1,
@@ -82,4 +87,6 @@ extern int inv_icm20948_core_probe(struct regmap *regmap);
 struct iio_dev *inv_icm20948_temp_init(struct inv_icm20948_state *state);
 struct iio_dev *inv_icm20948_gyro_init(struct inv_icm20948_state *state);
 
+int inv_icm20948_pm_setup(struct inv_icm20948_state *state);
+
  #endif
diff --git a/drivers/iio/imu/inv_icm20948/inv_icm20948_core.c b/drivers/iio/imu/inv_icm20948/inv_icm20948_core.c
index eb4f940de7013bf4ddeb69b6380a60fbde49964a..e6e670d96e40c3663e55d1545b52f609603a02ed 100644
--- a/drivers/iio/imu/inv_icm20948/inv_icm20948_core.c
+++ b/drivers/iio/imu/inv_icm20948/inv_icm20948_core.c
@@ -101,7 +101,7 @@ static int inv_icm20948_setup(struct inv_icm20948_state *state)
 	if (IS_ERR(state->gyro_dev))
 		return PTR_ERR(state->gyro_dev);
 
-	return 0;
+	return inv_icm20948_pm_setup(state);
 }
 
 int inv_icm20948_core_probe(struct regmap *regmap)
@@ -113,6 +113,7 @@ int inv_icm20948_core_probe(struct regmap *regmap)
 	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return -ENOMEM;
+	dev_set_drvdata(dev, state);
 
 	state->regmap = regmap;
 	state->dev = dev;
diff --git a/drivers/iio/imu/inv_icm20948/inv_icm20948_gyro.c b/drivers/iio/imu/inv_icm20948/inv_icm20948_gyro.c
index 2d4d598eb21c8ce98d4ee3c72504554ab49ea596..9cefb47a46b1a323202aa84f0de647d7b7b89728 100644
--- a/drivers/iio/imu/inv_icm20948/inv_icm20948_gyro.c
+++ b/drivers/iio/imu/inv_icm20948/inv_icm20948_gyro.c
@@ -73,10 +73,14 @@ static const struct iio_chan_spec inv_icm20948_gyro_channels[] = {
 static int inv_icm20948_gyro_apply_config(struct inv_icm20948_state *state)
 {
 	guard(mutex)(&state->lock);
+	pm_runtime_get_sync(state->dev);
 
-	return regmap_write_bits(state->regmap, INV_ICM20948_REG_GYRO_CONFIG_1,
+	int ret = regmap_write_bits(state->regmap, INV_ICM20948_REG_GYRO_CONFIG_1,
 				 INV_ICM20948_GYRO_CONFIG_FULLSCALE,
 				 state->gyro_conf->fsr << 1);
+
+	pm_runtime_put_autosuspend(state->dev);
+	return ret;
 }
 
 static int inv_icm20948_gyro_read_sensor(struct inv_icm20948_state *state,
@@ -99,23 +103,25 @@ static int inv_icm20948_gyro_read_sensor(struct inv_icm20948_state *state,
 		return -EINVAL;
 	}
 
+	pm_runtime_get_sync(state->dev);
+
 	__be16 raw;
 	int ret = regmap_bulk_read(state->regmap, reg, &raw, sizeof(raw));
 
 	if (ret)
-		return ret;
+		goto out;
 
 	*val = (s16)be16_to_cpu(raw);
 
-	return 0;
+out:
+	pm_runtime_put_autosuspend(state->dev);
+	return ret;
 }
 
 static int inv_icm20948_gyro_read_calibbias(struct inv_icm20948_state *state,
 					    struct iio_chan_spec const *chan,
 					    int *val, int *val2)
 {
-	guard(mutex)(&state->lock);
-
 	unsigned int reg;
 
 	switch (chan->channel2) {
@@ -133,8 +139,11 @@ static int inv_icm20948_gyro_read_calibbias(struct inv_icm20948_state *state,
 	}
 
 	__be16 offset_raw;
+
+	pm_runtime_get_sync(state->dev);
 	int ret = regmap_bulk_read(state->regmap, reg, &offset_raw,
 				   sizeof(offset_raw));
+	pm_runtime_put_autosuspend(state->dev);
 
 	if (ret)
 		return ret;
@@ -216,8 +225,6 @@ static int inv_icm20948_write_calibbias(struct inv_icm20948_state *state,
 					struct iio_chan_spec const *chan,
 					int val, int val2)
 {
-	guard(mutex)(&state->lock);
-
 	unsigned int reg;
 
 	switch (chan->channel2) {
@@ -246,8 +253,13 @@ static int inv_icm20948_write_calibbias(struct inv_icm20948_state *state,
 	s16 offset = clamp(offset64, (s64)S16_MIN, (s64)S16_MAX);
 	__be16 offset_write = cpu_to_be16(offset);
 
-	return regmap_bulk_write(state->regmap, reg, &offset_write,
+	pm_runtime_get_sync(state->dev);
+	mutex_lock(&state->lock);
+	int ret = regmap_bulk_write(state->regmap, reg, &offset_write,
 				 sizeof(offset_write));
+	mutex_unlock(&state->lock);
+	pm_runtime_put_autosuspend(state->dev);
+	return ret;
 }
 
 static int inv_icm20948_gyro_write_raw(struct iio_dev *gyro_dev,
diff --git a/drivers/iio/imu/inv_icm20948/inv_icm20948_power.c b/drivers/iio/imu/inv_icm20948/inv_icm20948_power.c
new file mode 100644
index 0000000000000000000000000000000000000000..1281a5e5acb539cd3f91ca8ed8d52371f330b60a
--- /dev/null
+++ b/drivers/iio/imu/inv_icm20948/inv_icm20948_power.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Bharadwaj Raju <bharadwaj.raju777@gmail.com>
+ */
+
+#include "inv_icm20948.h"
+
+static int inv_icm20948_suspend(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	struct inv_icm20948_state *state = dev_get_drvdata(dev);
+
+	guard(mutex)(&state->lock);
+
+	return regmap_write_bits(state->regmap, INV_ICM20948_REG_PWR_MGMT_1,
+				 INV_ICM20948_PWR_MGMT_1_SLEEP,
+				 INV_ICM20948_PWR_MGMT_1_SLEEP);
+}
+
+static int inv_icm20948_resume(struct device *dev)
+{
+	struct inv_icm20948_state *state = dev_get_drvdata(dev);
+
+	guard(mutex)(&state->lock);
+
+	pm_runtime_disable(state->dev);
+	pm_runtime_set_active(state->dev);
+	pm_runtime_enable(state->dev);
+
+	int ret = regmap_write_bits(state->regmap, INV_ICM20948_REG_PWR_MGMT_1,
+				    INV_ICM20948_PWR_MGMT_1_SLEEP, 0);
+	if (ret)
+		return ret;
+
+	msleep(INV_ICM20948_SLEEP_WAKEUP_MS);
+
+	return 0;
+}
+
+static void inv_icm20948_pm_disable(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+}
+
+int inv_icm20948_pm_setup(struct inv_icm20948_state *state)
+{
+	struct device *dev = state->dev;
+
+	guard(mutex)(&state->lock);
+
+	int ret;
+
+	ret = pm_runtime_set_active(dev);
+	if (ret)
+		return ret;
+	pm_runtime_get_noresume(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, INV_ICM20948_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_put(dev);
+
+	return devm_add_action_or_reset(dev, inv_icm20948_pm_disable, dev);
+}
+
+EXPORT_NS_GPL_DEV_PM_OPS(inv_icm20948_pm_ops, IIO_ICM20948) = {
+	SYSTEM_SLEEP_PM_OPS(inv_icm20948_suspend, inv_icm20948_resume)
+	RUNTIME_PM_OPS(inv_icm20948_suspend, inv_icm20948_resume, NULL)
+};
diff --git a/drivers/iio/imu/inv_icm20948/inv_icm20948_temp.c b/drivers/iio/imu/inv_icm20948/inv_icm20948_temp.c
index 916053740cc5acda0316c76504d4086eff5ec7f0..6e17b3719301d6d7f005d545587f558fcadd2f40 100644
--- a/drivers/iio/imu/inv_icm20948/inv_icm20948_temp.c
+++ b/drivers/iio/imu/inv_icm20948/inv_icm20948_temp.c
@@ -24,17 +24,24 @@ static const struct iio_chan_spec
 static int inv_icm20948_temp_read_sensor(struct inv_icm20948_state *state,
 					 s16 *temp)
 {
-	guard(mutex)(&state->lock);
+	int ret;
+
+	pm_runtime_get_sync(state->dev);
+	mutex_lock(&state->lock);
 
 	__be16 raw;
-	int ret = regmap_bulk_read(state->regmap, INV_ICM20948_REG_TEMP_DATA,
+	ret = regmap_bulk_read(state->regmap, INV_ICM20948_REG_TEMP_DATA,
 				   &raw, sizeof(raw));
 	if (ret)
-		return ret;
+		goto out;
 
 	*temp = __be16_to_cpu(raw);
+	ret = 0;
 
-	return 0;
+out:
+	mutex_unlock(&state->lock);
+	pm_runtime_put_autosuspend(state->dev);
+	return ret;
 }
 
 static int inv_icm20948_temp_read_raw(struct iio_dev *temp_dev,

-- 
2.51.0

