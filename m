Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D243B2D00
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453268; cv=none; b=DJc2usexFswEj/Td7Bbe8lhFnIeBuSUu1kHvv7nsgVRFKS+13ilcPxDyBgGO4LRzgjx0yAE2onXVMo+8AhKWzFzZPT9uzI79uSBJ7/L53andoYO+jyI2llJE3hCtdSUOwu911v6JPzwnlNQJFPcyAB7/nCTXihpdW5luyb9doYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453268; c=relaxed/simple;
	bh=QTwwIZ3daKW2YIE9q8isjc7HvcH9QXJgTw7t9zS73yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6FVzZcFvhrUbjAb/PDgWFMMboZRwNsPrBCe4DaSlFqInnnH5aRbDkzeQHyozznHlRf/3tjLlJEpV+GyGkZaB5tXyBznE/E2C5ebLTwJ9Xpd8UwBZc32JoaDG8AH8/RDY9hd9iqJOZxyJHp5hf8W/K97YldArnA7O3Iorw4RAgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnWMNhPv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnWMNhPv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-453903ee4adso3835147f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 05:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779453264; x=1780058064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvWYIXbd/e0R7bVN4oKYfFF/4Yc8ZEWPnmStsVTHPPg=;
        b=UnWMNhPvl9rrh6vBcGmPDLP8C3uWVCI7rcNS3AH01F+b320WGrvftIAnpyHn43zPDD
         tARBrapwfBqKgOqf0SIGItloxKSLf4ppALeFcM7GLErUZOF5yS3vgjTsGoYjcoSTKitH
         f75USEkDeYcLU/vB2JQuXhlnn8gzRBKrAdhuf+iAVmDB6Z4DVP8ZAN2hkd4S083yYKFr
         WBLEMLr9sy2/2FCJqPwAnhq2UM3kLyVwaBGiKQCBsreL7NXyEPtVFFIN3vot1sw3T+lz
         rFfFeyAtyJtGXTAaUawLdVkTDpNSqzbNwAal5cIosraZH5m+dfeFyHsmZICeXttf+9l5
         xmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453264; x=1780058064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvWYIXbd/e0R7bVN4oKYfFF/4Yc8ZEWPnmStsVTHPPg=;
        b=Uk2AnzBxVDhohUuPfqN40WdfL2qAPJHloa9oMKET6US3+a1feVMzA8jxqKNT3kKyDC
         UUFJ5IHCuV/R+QnCZkIkJ6KMeI7sK9GZ5jVpQJoF2657IX01+IJKTSGVkRI9WOSD0u5m
         hZqwA7QfMiLbt1xDARDBPhJLhZ7do5fYcl1nwsMhY/sxDLIKmO1yWrrTYpY2E6Tm//b7
         Qp1FEjCt2Wwcf8wv30+jZp+qZzV03G3Yif9oP3Aqg5brnK3in6MGrWDYZy8RogZ//IrH
         Ucf+D5o43Lu/un1kHf+6xFThW9+tm8/t2qUOAOpCAgbn/mA5OmqR/G+DdbSXbXSFEgan
         ElIw==
X-Forwarded-Encrypted: i=1; AFNElJ84VUWVylpei2tWuZRWEVKGD6/Rmklvckv9MPPGbK5oTrr6HYBmQPIs8v/qx9NJ31lb0dd9x+lIQgPWlz3v5nBz46bHSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfcLvZCsIquY0exyjZeRRbpsARqKl3PrZmSnrt8CMUdks9ygGu
	Jj3DEtOIK3/EpWul7vS7sqD/tlRATW1HcBaMu4469nxYiZun6SCXHbPRyWA6ZoGv
X-Gm-Gg: Acq92OGuzvVZuZBdVH2HEZ1zb0+DhYKVAf6Rc8Pa07tXSuY+maYSR1mbcrG8QFpyHr2
	S3yD6ejhE1MQ0vz4pbV2TwFTQ+VbFARNwkUnj836nK3ge6icX7jHppXUEw+gFon1u1iY9XJtP+g
	7CsyqAmZis2nlbmevm0L/i+TTegFEiNBt6nXna2l8bTmcXBXD6kH9gNujW+88zir7xk5OTTwzZE
	VvOQPsTIe8yHt/6AG5pbSCOnl+QCqC41QmMwct8VzEAHKjZ7Kd8yIMVU/inRmGsRUhtqeTOw23y
	D/UbcJ1qb8TvEAal09GzWP25IPTh5lzK2IrlJplOe2d1/DLfrwnXdPMeiBixG5zBH2HZFkZoCtd
	GOmlRlcpbCDdBsClYX0VNBXlP3A4jyadW4j3mULdhljtq0FxV9omvmxdkVbgEDdGZOy+dSlJwWp
	rh3wzRxrF19BR/tJ0hU6P0xTwWG0UQWar7KPlzKc+X5EZVWIuiylUP
X-Received: by 2002:a05:600c:35cf:b0:490:3bad:3784 with SMTP id 5b1f17b1804b1-490426bc6demr52827045e9.18.1779453263971;
        Fri, 22 May 2026 05:34:23 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af0ac1sm14760175e9.31.2026.05.22.05.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:34:23 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	shuah@kernel.org,
	joshua.crofts1@gmail.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 3/8] iio: tcs3472: convert remaining locking to guard(mutex)
Date: Fri, 22 May 2026 14:34:14 +0200
Message-ID: <20260522123420.45495-4-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522123420.45495-1-aldocontelk@gmail.com>
References: <20260522123420.45495-1-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert several functions to use guard(mutex)()

This avoids manual unlock calls on each return path, drops the goto
in tcs3472_write_event(), and removes 'ret' variables only needed to
return after the unlock.

While the conversion is in progress, take the opportunity to make a
few small cleanups that guard() enables:

  - In tcs3472_read_event_config(), replace '!!(...)' with
    '(...) ? 1 : 0' for readability.

  - In tcs3472_write_event_config(), tcs3472_powerdown() and
    tcs3472_resume() use an early return on the I2C
    write failure path.

No functional change.

Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
v3:
- Drop Suggested-by: Andy (inappropriate tag).
- In read_event_config(): !! -> ? 1 : 0.
- In write_event_config(): early return on I2C error.
- In powerdown() and resume(): early return on I2C error.
- Remove stray blank line in trigger_handler().

 drivers/iio/light/tcs3472.c | 76 ++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 44 deletions(-)

diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
index 1803bb882804..b31714040a02 100644
--- a/drivers/iio/light/tcs3472.c
+++ b/drivers/iio/light/tcs3472.c
@@ -13,6 +13,7 @@
  * TODO: wait time
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -220,32 +221,24 @@ static int tcs3472_read_event(struct iio_dev *indio_dev,
 	int *val2)
 {
 	struct tcs3472_data *data = iio_priv(indio_dev);
-	int ret;
 	unsigned int period;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 
 	switch (info) {
 	case IIO_EV_INFO_VALUE:
 		*val = (dir == IIO_EV_DIR_RISING) ?
 			data->high_thresh : data->low_thresh;
-		ret = IIO_VAL_INT;
-		break;
+		return IIO_VAL_INT;
 	case IIO_EV_INFO_PERIOD:
 		period = (256 - data->atime) * 2400 *
 			tcs3472_intr_pers[data->apers];
 		*val = period / USEC_PER_SEC;
 		*val2 = period % USEC_PER_SEC;
-		ret = IIO_VAL_INT_PLUS_MICRO;
-		break;
+		return IIO_VAL_INT_PLUS_MICRO;
 	default:
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
-
-	mutex_unlock(&data->lock);
-
-	return ret;
 }
 
 static int tcs3472_write_event(struct iio_dev *indio_dev,
@@ -259,7 +252,8 @@ static int tcs3472_write_event(struct iio_dev *indio_dev,
 	int period;
 	int i;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
+
 	switch (info) {
 	case IIO_EV_INFO_VALUE:
 		switch (dir) {
@@ -270,18 +264,18 @@ static int tcs3472_write_event(struct iio_dev *indio_dev,
 			command = TCS3472_AILT;
 			break;
 		default:
-			ret = -EINVAL;
-			goto error;
+			return -EINVAL;
 		}
 		ret = i2c_smbus_write_word_data(data->client, command, val);
 		if (ret)
-			goto error;
+			return ret;
 
 		if (dir == IIO_EV_DIR_RISING)
 			data->high_thresh = val;
 		else
 			data->low_thresh = val;
-		break;
+
+		return 0;
 	case IIO_EV_INFO_PERIOD:
 		period = val * USEC_PER_SEC + val2;
 		for (i = 1; i < ARRAY_SIZE(tcs3472_intr_pers) - 1; i++) {
@@ -291,18 +285,14 @@ static int tcs3472_write_event(struct iio_dev *indio_dev,
 		}
 		ret = i2c_smbus_write_byte_data(data->client, TCS3472_PERS, i);
 		if (ret)
-			goto error;
+			return ret;
 
 		data->apers = i;
-		break;
+
+		return 0;
 	default:
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
-error:
-	mutex_unlock(&data->lock);
-
-	return ret;
 }
 
 static int tcs3472_read_event_config(struct iio_dev *indio_dev,
@@ -310,13 +300,10 @@ static int tcs3472_read_event_config(struct iio_dev *indio_dev,
 	enum iio_event_direction dir)
 {
 	struct tcs3472_data *data = iio_priv(indio_dev);
-	int ret;
 
-	mutex_lock(&data->lock);
-	ret = !!(data->enable & TCS3472_ENABLE_AIEN);
-	mutex_unlock(&data->lock);
+	guard(mutex)(&data->lock);
 
-	return ret;
+	return (data->enable & TCS3472_ENABLE_AIEN) ? 1 : 0;
 }
 
 static int tcs3472_write_event_config(struct iio_dev *indio_dev,
@@ -327,7 +314,7 @@ static int tcs3472_write_event_config(struct iio_dev *indio_dev,
 	int ret = 0;
 	u8 enable_old;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 
 	enable_old = data->enable;
 
@@ -339,12 +326,13 @@ static int tcs3472_write_event_config(struct iio_dev *indio_dev,
 	if (enable_old != data->enable) {
 		ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
 						data->enable);
-		if (ret)
+		if (ret) {
 			data->enable = enable_old;
+			return ret;
+		}
 	}
-	mutex_unlock(&data->lock);
 
-	return ret;
+	return 0;
 }
 
 static irqreturn_t tcs3472_event_handler(int irq, void *priv)
@@ -445,16 +433,16 @@ static int tcs3472_powerdown(struct tcs3472_data *data)
 	int ret;
 	u8 enable_mask = TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 
 	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
 					data->enable & ~enable_mask);
-	if (!ret)
-		data->enable &= ~enable_mask;
+	if (ret)
+		return ret;
 
-	mutex_unlock(&data->lock);
+	data->enable &= ~enable_mask;
 
-	return ret;
+	return 0;
 }
 
 static int tcs3472_probe(struct i2c_client *client)
@@ -583,16 +571,16 @@ static int tcs3472_resume(struct device *dev)
 	int ret;
 	u8 enable_mask = TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 
 	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
 		data->enable | enable_mask);
-	if (!ret)
-		data->enable |= enable_mask;
+	if (ret)
+		return ret;
 
-	mutex_unlock(&data->lock);
+	data->enable |= enable_mask;
 
-	return ret;
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(tcs3472_pm_ops, tcs3472_suspend,
-- 
2.54.0

