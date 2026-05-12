Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8913A759E
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 May 2026 22:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778625143; cv=none; b=L6Jirrjn1w/032DMTi/YX9sV0lGNBtcUfk+3HiuPA4WC3evYXZy1Tobj0u24zQ8JxG7AGwF0uleP6seCYnuk6sPZQyprHZ9kSuSbexWgWYUmnl6wrK8eBoYdCI+sdSgQ06Ir/8IY8TgoBZ9RWKmL0gYLITapKc2c0l7dTlA/ZzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778625143; c=relaxed/simple;
	bh=DNK7inRudWsaUqBHPSR45m/wvD/5KEr6IJFBUid8Gko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJzAva8WV4F53TGT5ijS4HL226p4t/Uo/L4hsGo9nXAU2CgV5K5C0Z68yYYUtDlZWbbIbZlev5jQUG7Ywu54DWE+S9xhG8LHn3HP9Q0W4YE1r564ur+IVoxHAYRZ+ZB6Jq3Wqi4qY61lvxIuVfiKMf9/542iZmQ46cjUjaag1Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lg5tzfzq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lg5tzfzq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso69645935e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 May 2026 15:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625140; x=1779229940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETFxcyR7YLkUpkcr49E9UXvV2AmU/9yjySW5RDZ5mvo=;
        b=Lg5tzfzqWrE+086JBFaNziX6nncaNbDYhMewc/PE7rrBihy+3gaSoe6cxodCgHn7eT
         HXohv4GMd1KGb9OzXZX6RXkRAPUG1m/mgsCXa7MTTZw4+LQ3/LX7589Z2rodiBLokp0Q
         HlYPGFlbc39NyqC2fOMI+pf4ztd/fvy2NR51nKzSnl43g7amWfdUsSvk9DhqPU+xsjk7
         D0ICPyP34rnhpp1/pUsCBfBUYfbIv4M3/v3KZsXrRnAqUDc6y1vePOQME5MZVvi7R0C9
         T5P5elq8q7HW2SulvrOhl3WRkbHiemJvoTbS+rKFE32Lj8UFJ9/1NjVzW1Z/CJ75d7dq
         pIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625140; x=1779229940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ETFxcyR7YLkUpkcr49E9UXvV2AmU/9yjySW5RDZ5mvo=;
        b=YSFyru7fBfjayn8GOXkuj0v4VjF+uHhyFfjqQPWoXrJfDkwWctK9Gmy/LdgzZSPLTC
         H5EPc4dFSVWjYkWJczZuhlP/cOskdNMZGr6vxbWlu2rpB2xOpm+MwcPMuYAnpne9cAxl
         qq3I1eO7VN1Wg150zUJdsh8URvnBm8mfNSEL4JyEgf03RH99VtqbrO9n0QW4iab5qNJY
         uiT1mmkAapy853QrU8D/byeFdKR6t3Vned/D9fSlYW68BMRGh1RqcQCbdrCIuRQjNJ9U
         RromrQgVv8JL6oD2hrtap6zjdPQFn9D/4r3vGw4mTf+pLr3d+KHTy9fDwbBZyLTDzm79
         y6Fw==
X-Forwarded-Encrypted: i=1; AFNElJ8hudHcTW78ZqGLcwPhyXDHXEJUFA4WnDCzo0gAI54MEBRLbl1e6vjMiwAq/ogR6VEG5l1XyVphrFWuebKQamJF66iZ+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIYipsHPRM88Be45joOdFAaei7gHAxDf9ZZ3b8KM6hdWUr7KcC
	ulf5KNXN/wOD9ZmOWAAMmNkcj2HRmahRIvkq1qQO7sv9KdVHJg5rbRDy
X-Gm-Gg: Acq92OEc3O/LnqEOLioG2Ybg8ravV2cV/MjtBlHiFYuVpC6ai+hKM79ssYFFGN5jFKj
	wG280BxxdSXWULO9q85z2drJbm8+ykY4JgaKjFepWVTcQR0M3jZJT92uqInoeKbYA7i1BjWGlCr
	aWCGKs6DOK4zEC/mxFTG7Ok5tuDabjqTXlPTXPZY4aVwv8JrCrZMVwGpPXUNYAW62b5VfCGi9sx
	JZoJon+qUCoOMtbAFCCZNp/4G+QM96K5b5y1/xEUyiM5Rf3JYEvqcX/A4XL1VBI0rhLR3V7ht3u
	yxTArF6EOEg37/mdAYag137cJ8lweAWrTV8MxNVv5nu2Rte/rbLXn7ISIyFx2bA7xpYGY1XswuE
	oWcuQXujUvlpds20TjbynB3aMGkipXpbvwQNRCdcNRy9pZDOJU+7r4NEeJYyWmjoOTx5WUAO9fx
	f/yDdaFFaf7GreFEDJOxVcTr29h7XYJyI6fosRkdOhaJy1M4o3kXKxH/I=
X-Received: by 2002:a05:600c:154a:b0:48d:1a94:56c with SMTP id 5b1f17b1804b1-48fce9da5e0mr508025e9.18.1778625140226;
        Tue, 12 May 2026 15:32:20 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([2a01:e11:5402:d840:f1ee:c5d:74e4:6e19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3c65f2sm47377375e9.1.2026.05.12.15.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:32:19 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	shuah@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2 2/5] iio: light: tcs3472: convert remaining locking to guard(mutex)
Date: Wed, 13 May 2026 00:32:12 +0200
Message-ID: <20260512223215.25596-3-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512223215.25596-1-aldocontelk@gmail.com>
References: <20260512223215.25596-1-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the locking in tcs3472_read_event(), tcs3472_write_event(),
tcs3472_read_event_config(), tcs3472_write_event_config(),
tcs3472_powerdown() and tcs3472_resume() to use guard(mutex)
instead of explicit mutex_lock()/mutex_unlock() pairs.

This avoids manual unlock calls on each return path, drops the goto
in tcs3472_write_event(), and removes 'ret' variables only needed to
return after the unlock.

No functional change.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
v2:
(Suggested by Andy)
- Moved earlier in the series to avoid introducing manual locking in the devm
  patch that would then be converted here.
- Dropped "found by code inspection" (this is a cleanup, not a bug)
- Test details moved to cover letter

 drivers/iio/light/tcs3472.c | 59 +++++++++++++------------------------
 1 file changed, 21 insertions(+), 38 deletions(-)

diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
index 9b0f64cd9c50..4fd4fd74d0d6 100644
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
+	return !!(data->enable & TCS3472_ENABLE_AIEN);
 }
 
 static int tcs3472_write_event_config(struct iio_dev *indio_dev,
@@ -327,7 +314,7 @@ static int tcs3472_write_event_config(struct iio_dev *indio_dev,
 	int ret = 0;
 	u8 enable_old;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 
 	enable_old = data->enable;
 
@@ -342,7 +329,6 @@ static int tcs3472_write_event_config(struct iio_dev *indio_dev,
 		if (ret)
 			data->enable = enable_old;
 	}
-	mutex_unlock(&data->lock);
 
 	return ret;
 }
@@ -379,6 +365,7 @@ static irqreturn_t tcs3472_trigger_handler(int irq, void *p)
 	} scan = { };
 
 	int ret = tcs3472_req_data(data);
+
 	if (ret < 0)
 		goto done;
 
@@ -544,15 +531,13 @@ static int tcs3472_powerdown(struct tcs3472_data *data)
 	int ret;
 	u8 enable_mask = TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 
 	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
 		data->enable & ~enable_mask);
 	if (!ret)
 		data->enable &= ~enable_mask;
 
-	mutex_unlock(&data->lock);
-
 	return ret;
 }
 
@@ -581,15 +566,13 @@ static int tcs3472_resume(struct device *dev)
 	int ret;
 	u8 enable_mask = TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON;
 
-	mutex_lock(&data->lock);
+	guard(mutex)(&data->lock);
 
 	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
 		data->enable | enable_mask);
 	if (!ret)
 		data->enable |= enable_mask;
 
-	mutex_unlock(&data->lock);
-
 	return ret;
 }
 
-- 
2.54.0

