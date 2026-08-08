Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D633B4E83
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  8 Aug 2026 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786179659; cv=none; b=YNUbPv387fxiwMstYTlvX7UbVi0HcYA2WpnIHPiFLyrJAkz4l3ibosDTDJJE0OtMxc/z0EqpqR/wwRTpXrbihYIhhiqxeaCyGAF4CMVYTpGANGyVWxbEehVquM+xTuLsRnBbgXiDIVX40daAqrcm8Dt9qxKVVkk950S4IQwwm+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786179659; c=relaxed/simple;
	bh=IKD1gKaNsgaVAcBRxbLjFsH0xtEpv4azMpvN9XRWifk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EmoiOPdh1uk/knkmt9LJRZN3OiK1APo5hK/o0yE/seT0Thkee9UY+sM4Iy7gYHLPU4lzFZ9wjoFieFcl84FbWKbPdHIWjZHxwc+Dt6JyZ7r6bRNVKKHYJF5WQoaNhE9koM+ys2DzE6gLZrDia0mljww5QDRD2yfFFSDk+XxYhns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXekNr5X; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXekNr5X"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so214151b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 08 Aug 2026 02:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179656; x=1786784456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ge2ItlSoH59iRKQvJyLrgo1nbfxoN8NfgLJkyxe+oXw=;
        b=dXekNr5Xvm4fXVn2V2lSMpYVy0WSS5mu6CwxRw9lz6LChftGkyN4l3UgroqQqDMEKS
         pGUvzzroAJJOEi0Zes26zXJLaW4x8rqTawjuvx6J2ang9kmkPzyBVUxYWHyX8DzO6aj9
         r74a1TLegFHyVUl+mGWSkXxzczZy2RpqNdKbYYvX568Q+oOKWsuqyD4bk0uI+oFhCcxP
         hvL1V2+tRQvFWXaflENP6AR/71N2nyqZdwYiXCgQ4HrkRHQbMwYzYXWjkiW7dxR1QtSa
         CwSgEb2x7lic9uDy9p+cs/5DE2Inx3/T4QuQg6HbXdCRxJkAb19GESDadqOF1hxaPhb1
         x4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179656; x=1786784456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ge2ItlSoH59iRKQvJyLrgo1nbfxoN8NfgLJkyxe+oXw=;
        b=XlEPKCnGV59ia9y+aIGEZzNZN9DRoGKVs0BubjqOyAmGrwzedtwro2FT4sQtOcB43K
         Mj/ADESXPovuBtJs/7OfojN68tDzJTDuTK2TlI4WoP0JyfJtlFol4c+IZeedd1lafRKM
         S2WSlegvb59RhhvS3vppJ7VOhrfibv5/+lKbAvEPq/tNBCebuZBdjpJTwN/6h8MMpSSY
         M941Yu1gue7A7nwvnkU9cSen1mTQxybeFS/YsKDYw1eu6Okfu+OU8fDZwUGKDiVj4lcj
         VSrYutiaPNiFiWc8+slAWp/nCJE0Cmc08vT4k56HRfzRXtbHr3noNMwvv+3NEu6LDqRo
         FCVA==
X-Gm-Message-State: AOJu0YwqWD/ziLJGdptK0WdxpWuuaImdae/LTQSexeuPb+kiAHhEOtR3
	GEPu8eCAAQF0ylDZPpynsWgZs6pwN9VuaGUvqlZ20SJKnfdYv31O2YSS
X-Gm-Gg: AR+sD137Yt4OfTj226VeDTo1MDE6Y+H91yMeDUVmNEAm3BHb8Z/6VwT+6RfC0c4NuwE
	FPmBBoJ7feNt8imX/I93cQ8rj0FK/ZhmWjc7/3vuSjTRRy35ixdFROkji5ZhZCV9g/C5OKZNnJ2
	xt00I4E/Dsh39P3AEBAKfprfhjS9VHo/OxxqrWAKyFbzNgjOj79+YtldMDERKgkBuCIIYOPoTLR
	w/xomIvWH0uUVGCaS1oMpbhb4wYQtjgHsDGo6/2vBTekR0Az9JX9pciqExYhFVBNlwA22DklIF+
	MOM+kYAB0BJUxvvlTra8RPhTKA55uAM2Fl29mL4JzQ7mGeJIL17vFp8Z/U9T40XM24XrAWrWPZl
	d+f3t1RbqjctsTzl9XsCqvjSFDKZZ4OBffPcdN058roV9rz9p4o3ufUl5v2Um8w/NR1P4tlu2mp
	K0NNI6LWrn+2w7VIKqaARBhm+EBu33sEHnqL7ArqNZPQjufeTaCtcXff1mq4xHrHl20dDBvKLPW
	sL1IkTyH43/jei5jLZUktOSxYLIvZYTASzJUJJw0HoJI0RfCiy6YLfXex+oEj0=
X-Received: by 2002:a05:6a00:1391:b0:845:dfef:75b8 with SMTP id d2e1a72fcca58-84f4fdbfe20mr15922860b3a.15.1786179655627;
        Sat, 08 Aug 2026 02:00:55 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e9f0sm1973871b3a.28.2026.08.08.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:00:55 -0700 (PDT)
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
Subject: [PATCH 1/5] iio: humidity: hts221: report available values via read_avail()
Date: Sat,  8 Aug 2026 17:00:22 +0800
Message-ID: <20260808090026.34187-2-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260808090026.34187-1-adinata.softwareengineer@gmail.com>
References: <20260808090026.34187-1-adinata.softwareengineer@gmail.com>
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

