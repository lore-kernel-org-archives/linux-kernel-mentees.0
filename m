Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0113BC673
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  7 May 2026 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148792; cv=none; b=Bds2psS14ztttRpdfhEp8Orui7DjkIkkHOrKgnlDuFIE4/jOGs5/k0cJq37oy+c8hFsQuxrSqo1bJMlVUW22lcMrXBQry3VdN+/xrKAKUSp5j3N8RYkTYsJ+0Uez2FqPxy++GYBnMipBZYLTlKWbInAOdywdcIlOwtgMg+5d9hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148792; c=relaxed/simple;
	bh=6KYWZrOtJuCtmkc6oXa80aIw5oQTa7O99g3ALeNngJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X22vFnb6bNpVfqCSSgBFEfp4D1vUQE85GJ5fOC1n1QFOI4ll6YOTTedbLvKx4qvOFCW9DV8TR35Qp21rphCHUHIE43XPkPHTkFDwl6JbMLtIZlFDOwGjbIe09eoWBxjq/TZPHoJAo1rU+U2UnI0ceIS8y611esadV9OCc0Tc0v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J62ikcrF; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J62ikcrF"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-835c98b659eso406915b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 07 May 2026 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778148790; x=1778753590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxZbT380K0M24w7y1BCiVavbwUG7hQkkQTnQDue/tio=;
        b=J62ikcrFSQI8IlSZw0cNWNb5xueIOTJSIR73YHHWgKyZez+pq6M351t+WzrNQ8fh9a
         yJOTSzFxRTI6Qq3N+lDTD2KiNC71CfYhaVVATfdgq6Ma6h+nwzQrsRNI/jgy4UVCpt+D
         r5HZyBhjrnakrBXW6zwiB3ZkcDjHmdwiTJl8r3XnzrnZrbFx+8LMd0RLuNCrdvxXLSzI
         gyoDHfpfoTC0jY18W9YkKMfvaJeTvdL39EV1kBubiyBwcwA+WtwpisoRXPR8YTkeumBU
         AJ0B2frubTRZWuebldH0RDifefnnfuZ9DY9U7pZ89sgrsRtF4aHklTFcWb9QLxU8ZUjZ
         BvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148790; x=1778753590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxZbT380K0M24w7y1BCiVavbwUG7hQkkQTnQDue/tio=;
        b=NQXM8Bwh2qnVeaLO6Cwpnm+Fb6E9zfZqIus2KTLzt0HdbYZqEJl6ZptZC/NP6Ejg73
         Tq3avBNKQU/yQF4gxvlCl3gKxBbr6QMVZgTjJqQPY5pcpFrf4Tn0GyErR80Hj4i4s3pX
         DrJwWfuuOLFvhVH+b2y2PaeWO8iNSUq+jyoRgkghBwxpWdRtJMPdfHmrWkD1QDbgXst8
         wrZvQOMf0WioU/d5aHbcKO+DON5hioQR6jT4WOa3nerw1Sy/bkwpJRRV5d/wuhCQJG0m
         3+a13gvwjyffbY8wZqZpSI779UWevj/Qbklssz8u6hNnlK8YpkiRUugSduyVsHbE9M7L
         dxhw==
X-Forwarded-Encrypted: i=1; AFNElJ8DN0ATX5kNCqoUocf7gNS9GkFRPF0CPLKQYJRW4Qc+GS5p8N2TxTqqi7Z/rtkkACA3ZJt5eGJu5vMoh7D/mQ9pD7eWpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXwRqsjWKetUkPxtLvqXcOIMQIns5TpfZjiSl5lI+LBuPJdcBc
	I3wJ10IgIwiT+IJZoc2RyolnMcS3S1Vs0XHOnyoaAVSGQa+2ZbrS5i1r
X-Gm-Gg: AeBDieusHSkj0MddQ5ov9j8OloYHtk+aVYJMKlAyx+tttZTbG4OvVhSkkE+LaKfnzzt
	5URyJZ2eNcpj/qjrhCLzidBrPoIZxGm6RFL/08UgY/7f6mDI1cHjYXebT40W2y01m7Hzx2d4fXj
	MUPuJmwmPlM+UJzVbIqmFcvAxvM4CYA1lEmJjjTTkPkM9m9w+hSEr2SXRiQw54ypNN/3ilWzfNo
	LQaUf64CJsG3XNQ8lpFx4eCuepC6xUb4zaiiXRRnPtwhlltYH4ijomTwFbxTg881XuJDvcPTVNS
	H+TUU/h1kk+cxDvyP2kQ6EyYaZBarougX4gBev+A7g8vTRxa7ZQbq+RH2V5215x70J2Cj84f52X
	e3rEFqM2mFfXp7KKjtIphEkDJucmsj1GNK7oNumqZReuIDzJARD+FY6vW8zGC40m7flgFtqRYpn
	Q20m5hICnTq6tmnNp74J24SJcEY6y0STCR5CZClGinDSI0j922o60crzu77PkGcXYbJG+6dSMYQ
	T3pR+LP8RBvuDA7p2E=
X-Received: by 2002:a05:6a00:3695:b0:835:cc47:6ff9 with SMTP id d2e1a72fcca58-83a5dd5c829mr7121074b3a.28.1778148789864;
        Thu, 07 May 2026 03:13:09 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm9797998b3a.40.2026.05.07.03.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:13:09 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH 1/3] hwmon: lm93: Add missing blank lines after declarations
Date: Thu,  7 May 2026 15:41:41 +0530
Message-ID: <20260507101143.559475-2-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507101143.559475-1-ninadnaik07@gmail.com>
References: <20260507101143.559475-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning by adding blank lines after variable declaration.
No functional changes are made.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 drivers/hwmon/lm93.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
index be4853fad80f..c15e2a02dd86 100644
--- a/drivers/hwmon/lm93.c
+++ b/drivers/hwmon/lm93.c
@@ -372,6 +372,7 @@ static u8 LM93_IN_TO_REG(int nr, unsigned val)
 	const long intercept = uv_min - slope * lm93_vin_reg_min[nr];
 
 	u8 result = ((uv - intercept + (slope/2)) / slope);
+
 	result = clamp_val(result,
 			   lm93_vin_reg_min[nr], lm93_vin_reg_max[nr]);
 	return result;
@@ -383,6 +384,7 @@ static unsigned LM93_IN_REL_FROM_REG(u8 reg, int upper, int vid)
 	const long uv_offset = upper ? (((reg >> 4 & 0x0f) + 1) * 12500) :
 				(((reg >> 0 & 0x0f) + 1) * -25000);
 	const long uv_vid = vid * 1000;
+
 	return (uv_vid + uv_offset + 5000) / 10000;
 }
 
@@ -397,6 +399,7 @@ static unsigned LM93_IN_REL_FROM_REG(u8 reg, int upper, int vid)
 static u8 LM93_IN_REL_TO_REG(unsigned val, int upper, int vid)
 {
 	long uv_offset = vid * 1000 - val * 10000;
+
 	if (upper) {
 		uv_offset = clamp_val(uv_offset, 12500, 200000);
 		return (u8)((uv_offset /  12500 - 1) << 4);
@@ -425,6 +428,7 @@ static int LM93_TEMP_FROM_REG(u8 reg)
 static u8 LM93_TEMP_TO_REG(long temp)
 {
 	int ntemp = clamp_val(temp, LM93_TEMP_MIN, LM93_TEMP_MAX);
+
 	ntemp += (ntemp < 0 ? -500 : 500);
 	return (u8)(ntemp / 1000);
 }
@@ -582,6 +586,7 @@ static int LM93_PWM_FROM_REG(u8 reg, enum pwm_freq freq)
 static u8 LM93_PWM_TO_REG(int pwm, enum pwm_freq freq)
 {
 	int i;
+
 	for (i = 0; i < 13; i++)
 		if (pwm <= lm93_pwm_map[freq][i])
 			break;
@@ -632,6 +637,7 @@ static int LM93_PWM_FREQ_FROM_REG(u8 reg)
 static u8 LM93_PWM_FREQ_TO_REG(int freq)
 {
 	int i;
+
 	for (i = 7; i > 0; i--)
 		if (freq <= lm93_pwm_freq_map[i])
 			break;
@@ -657,6 +663,7 @@ static int LM93_SPINUP_TIME_FROM_REG(u8 reg)
 static u8 LM93_SPINUP_TIME_TO_REG(int time)
 {
 	int i;
+
 	for (i = 0; i < 7; i++)
 		if (time <= lm93_spinup_time_map[i])
 			break;
@@ -710,6 +717,7 @@ static int LM93_INTERVAL_FROM_REG(u8 reg)
 static u8 LM93_INTERVAL_TO_REG(long interval)
 {
 	int i;
+
 	for (i = 0; i < 9; i++)
 		if (interval <= lm93_interval_map[i])
 			break;
@@ -772,6 +780,7 @@ static unsigned LM93_GPI_FROM_REG(u8 reg)
 static unsigned LM93_ALARMS_FROM_REG(struct block1_t b1)
 {
 	unsigned result;
+
 	result  = b1.host_status_2 & 0x3f;
 
 	if (vccp_limit_type[0])
@@ -1104,6 +1113,7 @@ static ssize_t in_show(struct device *dev, struct device_attribute *attr,
 	int nr = (to_sensor_dev_attr(attr))->index;
 
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", LM93_IN_FROM_REG(nr, data->block3[nr]));
 }
 
@@ -1259,6 +1269,7 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", LM93_TEMP_FROM_REG(data->block2[nr]));
 }
 
@@ -1271,6 +1282,7 @@ static ssize_t temp_min_show(struct device *dev,
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", LM93_TEMP_FROM_REG(data->temp_lim[nr].min));
 }
 
@@ -1304,6 +1316,7 @@ static ssize_t temp_max_show(struct device *dev,
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", LM93_TEMP_FROM_REG(data->temp_lim[nr].max));
 }
 
@@ -1337,6 +1350,7 @@ static ssize_t temp_auto_base_show(struct device *dev,
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", LM93_TEMP_FROM_REG(data->block10.base[nr]));
 }
 
@@ -1370,6 +1384,7 @@ static ssize_t temp_auto_boost_show(struct device *dev,
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", LM93_TEMP_FROM_REG(data->boost[nr]));
 }
 
@@ -1405,6 +1420,7 @@ static ssize_t temp_auto_boost_hyst_show(struct device *dev,
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
 	int mode = LM93_TEMP_OFFSET_MODE_FROM_REG(data->sfc2, nr);
+
 	return sprintf(buf, "%d\n",
 		       LM93_AUTO_BOOST_HYST_FROM_REGS(data, nr, mode));
 }
@@ -1447,6 +1463,7 @@ static ssize_t temp_auto_offset_show(struct device *dev,
 	int ofs = s_attr->nr;
 	struct lm93_data *data = lm93_update_device(dev);
 	int mode = LM93_TEMP_OFFSET_MODE_FROM_REG(data->sfc2, nr);
+
 	return sprintf(buf, "%d\n",
 	       LM93_TEMP_AUTO_OFFSET_FROM_REG(data->block10.offset[ofs],
 					      nr, mode));
@@ -1525,6 +1542,7 @@ static ssize_t temp_auto_pwm_min_show(struct device *dev,
 	int nr = (to_sensor_dev_attr(attr))->index;
 	u8 reg, ctl4;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	reg = data->auto_pwm_min_hyst[nr/2] >> 4 & 0x0f;
 	ctl4 = data->block9[nr][LM93_PWM_CTL4];
 	return sprintf(buf, "%d\n", LM93_PWM_FROM_REG(reg, (ctl4 & 0x07) ?
@@ -1570,6 +1588,7 @@ static ssize_t temp_auto_offset_hyst_show(struct device *dev,
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
 	int mode = LM93_TEMP_OFFSET_MODE_FROM_REG(data->sfc2, nr);
+
 	return sprintf(buf, "%d\n", LM93_TEMP_OFFSET_FROM_REG(
 					data->auto_pwm_min_hyst[nr / 2], mode));
 }
@@ -1921,6 +1940,7 @@ static ssize_t pwm_auto_channels_show(struct device *dev,
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", data->block9[nr][LM93_PWM_CTL1]);
 }
 
@@ -2000,6 +2020,7 @@ static ssize_t pwm_auto_spinup_time_show(struct device *dev,
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", LM93_SPINUP_TIME_FROM_REG(
 				data->block9[nr][LM93_PWM_CTL3]));
 }
@@ -2035,6 +2056,7 @@ static ssize_t pwm_auto_prochot_ramp_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		       LM93_RAMP_FROM_REG(data->pwm_ramp_ctl >> 4 & 0x0f));
 }
@@ -2067,6 +2089,7 @@ static ssize_t pwm_auto_vrdhot_ramp_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		       LM93_RAMP_FROM_REG(data->pwm_ramp_ctl & 0x0f));
 }
@@ -2100,6 +2123,7 @@ static ssize_t vid_show(struct device *dev, struct device_attribute *attr,
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", LM93_VID_FROM_REG(data->vid[nr]));
 }
 
@@ -2111,6 +2135,7 @@ static ssize_t prochot_show(struct device *dev, struct device_attribute *attr,
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", data->block4[nr].cur);
 }
 
@@ -2122,6 +2147,7 @@ static ssize_t prochot_avg_show(struct device *dev,
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", data->block4[nr].avg);
 }
 
@@ -2133,6 +2159,7 @@ static ssize_t prochot_max_show(struct device *dev,
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", data->prochot_max[nr]);
 }
 
@@ -2168,6 +2195,7 @@ static ssize_t prochot_override_show(struct device *dev,
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		(data->prochot_override & prochot_override_mask[nr]) ? 1 : 0);
 }
@@ -2206,6 +2234,7 @@ static ssize_t prochot_interval_show(struct device *dev,
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
 	u8 tmp;
+
 	if (nr == 1)
 		tmp = (data->prochot_interval & 0xf0) >> 4;
 	else
@@ -2248,6 +2277,7 @@ static ssize_t prochot_override_duty_cycle_show(struct device *dev,
 						char *buf)
 {
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", data->prochot_override & 0x0f);
 }
 
@@ -2279,6 +2309,7 @@ static ssize_t prochot_short_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", (data->config & 0x10) ? 1 : 0);
 }
 
@@ -2312,6 +2343,7 @@ static ssize_t vrdhot_show(struct device *dev, struct device_attribute *attr,
 {
 	int nr = (to_sensor_dev_attr(attr))->index;
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n",
 		       data->block1.host_status_1 & (1 << (nr + 4)) ? 1 : 0);
 }
@@ -2323,6 +2355,7 @@ static ssize_t gpio_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
 {
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", LM93_GPI_FROM_REG(data->gpi));
 }
 
@@ -2332,6 +2365,7 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
 {
 	struct lm93_data *data = lm93_update_device(dev);
+
 	return sprintf(buf, "%d\n", LM93_ALARMS_FROM_REG(data->block1));
 }
 
-- 
2.54.0

