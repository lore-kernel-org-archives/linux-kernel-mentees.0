Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C5048C8CB
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635110; cv=none; b=pwH2xiPT5dVTJw0Haari3IoDCf9MFbrtsMD3HSVf08QUALc8qFJmfer6EXHJwMCAehjiFWBJu/L3km8+LnsoO8jNdX+Fe88LRwAu1XKTffIGWe/Yw0Rxg4Tyb+hw3ycrdiuVUflVE1H9oRm1dA0wdm5aiEbK3gIwjM/CPLFvYWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635110; c=relaxed/simple;
	bh=lF29cWX1tHGjImIaJT5dMIBt9ZzlqVZT0rak3Y5g1HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mow2RmTcrUh8OCA0zx4C3Ujc3fQx7dSjKfXobeSrlJUBzGPJQvTCHUBASF9fc6fQXK3kyIFyOG8c66v2ZlVQGGDwWs535qYcWIqAOqceUg49i1NnTis2/vYC2UdOqjsGmKguMGJ8H5tFZUDiVnUWfWyPq+BQ+gMJzJi5tzgG8aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyGwuuhg; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyGwuuhg"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbee846deecso2193164a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635108; x=1787239908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3+9o3R/kRPttqUDwWN7jjdrSbSX27cMxLLa8OmPEoE=;
        b=cyGwuuhgGNlY7FD4tOD9jr3WUZFl7pu3YljkjB+EvGYdFcov3e7QIJkZAvHT4EceBW
         JHNyCsFowaaqe5SIMy555gPCzamPwvWNuNyqjwU7mb2sAbbnY7L/DTzB+UeK4RsOSXyP
         lHVIEaf/ks+pAiV7KjdNOfBWP23CQ55Ng6SxJwA7aQl5+nJQDnAVhd81fUbUhSfu/Cy8
         SbOvq9lVE6a+lNk4IWXJNXkDHJHXivbyUS9oNGW55CVi5BqtrK90IrNq0udSILzbgEnV
         exGDDWSv8OLk7b4B7dShLLF3z8v4/QpUxUELB8eCDau0SzuvIGf19ACy7rbZE8RZoc76
         ua1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635108; x=1787239908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B3+9o3R/kRPttqUDwWN7jjdrSbSX27cMxLLa8OmPEoE=;
        b=fqm7nCjw/SanlRp3OqDxim8matQFwqlBqqEnXe+0b/gixd0lV7wA9GTfkzfF1gf5Hr
         3ycZJIl6d9uDqbOoKMNwHYLppB3SU2K+CCSbeJxwcBNXBKX7NOiuoro22WaGXGs4gWXI
         OwzimTl2WDIpUGm1ukl3p36AvHlSaD1GZJXldKKSkHpwmfubQ3SJ0eWGuUo0LZpa8QBN
         e71yG5HOizyv3UjmlML3NRtjS20sxh7ZACSZyPs96EOxI8pfr2g1JVYSbRIRq7dTH3vS
         PptoHzkq9ZDlhYeFm+gxrDs0tAqYkB0rHEO+IC6/7XvFuydpZ0C/1buBRVJnIKAySkrp
         Ne2g==
X-Gm-Message-State: AOJu0YxD83s2tHL0eiGFsO5zUKnN9qSeDJscxMBhVeHbo8OT23+Qrr+x
	x4vm4yf1JsmY4147vhloPOaPH1h+lUssG/c7P5Ir2YFkvc/dIMAzKsuy
X-Gm-Gg: AR+sD13ymNa9GO1GqrDE4SGC4RtqhbKUlwvyvWIvsLtICbnfjKBBXMJacekoleCV3Oy
	AGOfA3pmdusRDXN9KhgXUY9eyn3U4/Tt48B7tGFmDhLX8NH19XbVSNRXTfqcaHz97bnhy0t2A6j
	JYhYUEazc2YmLei1avEY2J0eN+CT+AQb7XuZhtWCS0VTRCnSqUk3rA2xeLcvxah3oI5H+HNJDQS
	WmEAeASZLa8G8MxsZHAw/JB5zUNkvw/H3ZpWzHuqOKoVxF4wQNt4Az7AyhQdWN1jnAuhsy8Wx59
	8u3U9Prv+roa99UHjeqclAFjj1ZzSaqRCqYs0Fokc+T2VBsbj18Rccs1AhJofFuId9a1MxdIjJf
	2CR0WgQsKWhfZrEbwJLopFdFss+yNjQUoyzqohkO3zTQGfHQ9KHygzF/AlFcERWttfiU9ZJDB5Y
	mLwBqA1SzPteSlrO0PtuQDEAk/lPsRDBEnc3S6ss0CJCl9U7KlNWbqzurbUNgEv+Z0F8D9FwEEc
	jy4hWk0uf4ptf5YY97/AMjGVWwI+eXRU6xugQjiQqvt7wCQkqcaBBhHRftlEDuO/Ep9dLqB
X-Received: by 2002:a05:6a21:2d4c:b0:3b2:a809:ffe with SMTP id adf61e73a8af0-3cc5504409bmr9635887637.14.1786635107720;
        Thu, 13 Aug 2026 08:31:47 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec082943fsm7960604eec.29.2026.08.13.08.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:31:47 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: lorenzo@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Adi Nata <adinata.softwareengineer@gmail.com>
Subject: [PATCH v2 1/5] iio: humidity: hts221: report available values via read_avail()
Date: Thu, 13 Aug 2026 23:31:25 +0800
Message-ID: <20260813153129.12423-2-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813153129.12423-1-adinata.softwareengineer@gmail.com>
References: <20260813153129.12423-1-adinata.softwareengineer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the custom oversampling_ratio_available sysfs attributes with
the standard IIO read_avail() callback. This lets the IIO core create
and format *_available attributes and exposes the lists to
in-kernel consumers.

As a consequence, the incorrectly named
in_humidity_oversampling_ratio_available attribute is replaced by the
standard in_humidityrelative_oversampling_ratio_available name for the
IIO_HUMIDITYRELATIVE channel. The temperature oversampling and sampling
frequency available attribute names are unchanged.

Fixes: e4a70e3e7d84 ("iio: humidity: add support to hts221 rh/temp combo device")
Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/humidity/hts221_core.c | 106 +++++++++++------------------
 1 file changed, 40 insertions(+), 66 deletions(-)

diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
index bfeb0a60d3af..76a391f421f5 100644
--- a/drivers/iio/humidity/hts221_core.c
+++ b/drivers/iio/humidity/hts221_core.c
@@ -10,7 +10,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
-#include <linux/iio/sysfs.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
@@ -49,7 +48,7 @@ struct hts221_odr {
 struct hts221_avg {
 	u8 addr;
 	u8 mask;
-	u16 avg_avl[HTS221_AVG_DEPTH];
+	int avg_avl[HTS221_AVG_DEPTH];
 };
 
 static const struct hts221_odr hts221_odr_table[] = {
@@ -58,6 +57,8 @@ static const struct hts221_odr hts221_odr_table[] = {
 	{ 13, 0x03 },	/* 12.5Hz */
 };
 
+static const int hts221_odr_avail[] = { 1, 7, 13 };
+
 static const struct hts221_avg hts221_avg_list[] = {
 	{
 		.addr = 0x10,
@@ -97,7 +98,11 @@ static const struct iio_chan_spec hts221_channels[] = {
 				      BIT(IIO_CHAN_INFO_OFFSET) |
 				      BIT(IIO_CHAN_INFO_SCALE) |
 				      BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
+		.info_mask_separate_available =
+				BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
+		.info_mask_shared_by_all_available =
+				BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = 0,
 		.scan_type = {
 			.sign = 's',
@@ -113,7 +118,11 @@ static const struct iio_chan_spec hts221_channels[] = {
 				      BIT(IIO_CHAN_INFO_OFFSET) |
 				      BIT(IIO_CHAN_INFO_SCALE) |
 				      BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
+		.info_mask_separate_available =
+				BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
 		.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),
+		.info_mask_shared_by_all_available =
+				BIT(IIO_CHAN_INFO_SAMP_FREQ),
 		.scan_index = 1,
 		.scan_type = {
 			.sign = 's',
@@ -192,53 +201,35 @@ static int hts221_update_avg(struct hts221_hw *hw,
 	return 0;
 }
 
-static ssize_t hts221_sysfs_sampling_freq(struct device *dev,
-					  struct device_attribute *attr,
-					  char *buf)
-{
-	int i;
-	ssize_t len = 0;
-
-	for (i = 0; i < ARRAY_SIZE(hts221_odr_table); i++)
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d ",
-				 hts221_odr_table[i].hz);
-	buf[len - 1] = '\n';
-
-	return len;
-}
-
-static ssize_t
-hts221_sysfs_rh_oversampling_avail(struct device *dev,
-				   struct device_attribute *attr,
-				   char *buf)
-{
-	const struct hts221_avg *avg = &hts221_avg_list[HTS221_SENSOR_H];
-	ssize_t len = 0;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(avg->avg_avl); i++)
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d ",
-				 avg->avg_avl[i]);
-	buf[len - 1] = '\n';
-
-	return len;
-}
-
-static ssize_t
-hts221_sysfs_temp_oversampling_avail(struct device *dev,
-				     struct device_attribute *attr,
-				     char *buf)
+static int hts221_read_avail(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     const int **vals, int *type, int *length,
+			     long mask)
 {
-	const struct hts221_avg *avg = &hts221_avg_list[HTS221_SENSOR_T];
-	ssize_t len = 0;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(avg->avg_avl); i++)
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d ",
-				 avg->avg_avl[i]);
-	buf[len - 1] = '\n';
-
-	return len;
+	switch (mask) {
+	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
+		switch (chan->type) {
+		case IIO_HUMIDITYRELATIVE:
+			*vals = hts221_avg_list[HTS221_SENSOR_H].avg_avl;
+			*length = ARRAY_SIZE(hts221_avg_list[HTS221_SENSOR_H].avg_avl);
+			break;
+		case IIO_TEMP:
+			*vals = hts221_avg_list[HTS221_SENSOR_T].avg_avl;
+			*length = ARRAY_SIZE(hts221_avg_list[HTS221_SENSOR_T].avg_avl);
+			break;
+		default:
+			return -EINVAL;
+		}
+		*type = IIO_VAL_INT;
+		return IIO_AVAIL_LIST;
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		*vals = hts221_odr_avail;
+		*type = IIO_VAL_INT;
+		*length = ARRAY_SIZE(hts221_odr_avail);
+		return IIO_AVAIL_LIST;
+	default:
+		return -EINVAL;
+	}
 }
 
 int hts221_set_enable(struct hts221_hw *hw, bool enable)
@@ -521,27 +512,10 @@ static int hts221_validate_trigger(struct iio_dev *iio_dev,
 	return hw->trig == trig ? 0 : -EINVAL;
 }
 
-static IIO_DEVICE_ATTR(in_humidity_oversampling_ratio_available, S_IRUGO,
-		       hts221_sysfs_rh_oversampling_avail, NULL, 0);
-static IIO_DEVICE_ATTR(in_temp_oversampling_ratio_available, S_IRUGO,
-		       hts221_sysfs_temp_oversampling_avail, NULL, 0);
-static IIO_DEV_ATTR_SAMP_FREQ_AVAIL(hts221_sysfs_sampling_freq);
-
-static struct attribute *hts221_attributes[] = {
-	&iio_dev_attr_sampling_frequency_available.dev_attr.attr,
-	&iio_dev_attr_in_humidity_oversampling_ratio_available.dev_attr.attr,
-	&iio_dev_attr_in_temp_oversampling_ratio_available.dev_attr.attr,
-	NULL,
-};
-
-static const struct attribute_group hts221_attribute_group = {
-	.attrs = hts221_attributes,
-};
-
 static const struct iio_info hts221_info = {
-	.attrs = &hts221_attribute_group,
 	.read_raw = hts221_read_raw,
 	.write_raw = hts221_write_raw,
+	.read_avail = hts221_read_avail,
 	.validate_trigger = hts221_validate_trigger,
 };
 
-- 
2.47.3

