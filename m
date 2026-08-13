Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0667648A2C5
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 15:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635131; cv=none; b=GB+J1pJkESdQxkhhq8QRjWEOR843qBhsnkxl7RiEbhfhRh/SAhznL5ClppnAa8KmU00ybGBv+1poNwSopbRCzWXflQI2YAM+FQZ0VlChujiQ948L8bEiLerEYuxC5O+hXadujzje6c7g0c7GeyTAmNvuqRxeen5tQIml/S6LmFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635131; c=relaxed/simple;
	bh=sfBAezaRbgRTasTkRdf7Yl4IPx6PAR6DvqI2G38FvDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cIWVuDyUl4wq21MXnV0QJ7T8A/3hXLmc+9sLatZsFC0ffL2dfRTkRzcN7Mk0iwQbgF9g1aUQKC7STCG3E0BMo+0i3xsUIfsgS6YBmq1/I4fF/H0cnzTVzXw2RMD2p+SNmWPkPAbKisGIyLtFiaUySULVHIgCqJRjaOijAAHRf/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTkT6yFe; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTkT6yFe"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1251075a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635129; x=1787239929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2qdJ72LpMBcvPrJb15/0HrRL2gmcJhiINfNwI4WIvY=;
        b=NTkT6yFekf6o8UTnA6DR6gvceAVNcf0Ow2xOh2X6kNenRftB6CDpeTvJxB9KEdvPaE
         4YJR5cAi8rrbv5k7SqWmmZw784jXxil5mxit5BrT/OpTTfxtpKr8oU4cYeWwMTAL7Mow
         HKdJgqZEC5LiSn6KbcxjP1zzCG9Aqv2nU4J7CioZi38CzoiVlT+Xdm6pPwNrUCQsRBD/
         Riuclr0KH9qyZCWkecG+a159+bN9XnB7vdeq1bw28tXUwKrJNLTEtNkzslIIvjkGPxq1
         ki9C52hKLO1Bk5063oG+HiR6tw43tWjcHz7EamnOhbxltd34V9BBhMaVZUlKBHK5I7F5
         W34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635129; x=1787239929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q2qdJ72LpMBcvPrJb15/0HrRL2gmcJhiINfNwI4WIvY=;
        b=VT3J+8JpdwzTPOWDLXtwuVxdOSFliMawci+MjUo4a25U0S6fj1BpIUA37oshxB0Vuo
         qfXMQzikpebJpEJVKi6doM4CLk+0vkGtpeNQq+IdedTXGpTfOOiVU1l5zHbau7bF4cDg
         oTotr1W05MHXbVltEi2cmUotE8gjzZHn6Alkj8nK2G2z+cd7rVIySLRXTD3B1/99G2eU
         /24fzzcaudiKBHdGFcwlrVpPedceZ/Nuz6bKJ/UgW/TuC1w2Brfez6CBws3QQLYkU9Bc
         EBW7jzvDAhODjD0q1q6I5kVewRM6EJ7MSs9TzGaQbWd4rUWmzJNWU5EbaFBamF2rn+f5
         Km3Q==
X-Gm-Message-State: AOJu0YwJKPj19oyVK0YlPcdIuMDHv0s0lS73D7d/xdKKn6YNow3afXte
	j0es7AP/2CWnDjw2bQdaz/79OpXKaKjv/ub3AgML5ol0EFwXJAtDNmHe
X-Gm-Gg: AR+sD104pSv30XeN8ZpOco/2lFsgtyOuH2AqgaNsQxyVbWEm0WUdm+Aqoi5G0aZMWMj
	aZzXmK7zSfAhNphQSA7Vgdty1w/b62kjDLxHMQPqs7IGrGel/nD6TunIDQfQ3/GSXRjMV5xssg0
	1pyz6TyFE8MTFDUaLiP/Xhq16p08V85Erxch+8U6+e3rEvmPqEP71Lxc/1LOiDPBhVqskouTIld
	RF7kZazi2MMTozvdEQNa5J3J591MrCP8RQFvohJ/tf/dKaknE+wPkbg4sfvFj2GFmaM+XlNDBQH
	aoLRtb5uuCG8JAu4UjQ18iRZedkvSBQd5huSlPQgGkDgrmvF2AiDuOE8pTJ+PTRe4bXq6RoFD0f
	MVmgEHaWbqZMd/GHfVzl5Xm5X0SG67WN1dloS3ODX5mQKUX+IOLP6+xCN9d06saQV+qpuky3um+
	I8mlGrCvIH2sNjYrGIKoIybDWQZhN+DVaPRW4VWlOKImx0KEZK3N6oBB3vanGJxo3AMgsUv8kxQ
	bAsd1y92wXsKy+Uz9nOYo35exb7d/raCvlyOVnJNjlnzaswoDog3svGNDuJpg==
X-Received: by 2002:a17:90b:50:b0:38e:7f22:f674 with SMTP id 98e67ed59e1d1-3931f9069femr2991671a91.11.1786635129125;
        Thu, 13 Aug 2026 08:32:09 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec082943fsm7960604eec.29.2026.08.13.08.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:32:08 -0700 (PDT)
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
Subject: [PATCH v2 5/5] iio: humidity: hts221: fix division by zero in calibration parsing
Date: Thu, 13 Aug 2026 23:31:29 +0800
Message-ID: <20260813153129.12423-6-adinata.softwareengineer@gmail.com>
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

hts221_parse_rh_caldata() and hts221_parse_temp_caldata() divide by
(cal_x1 - cal_x0) without checking that the two calibration points
differ can cause division by zero.

Reject zero divisor with -EINVAL, logging the offending calibration
values. A device with such calibration data cannot produce meaningful
scale or offset values anyway.

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/humidity/hts221_core.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
index fda38dfc6742..47a10884d812 100644
--- a/drivers/iio/humidity/hts221_core.c
+++ b/drivers/iio/humidity/hts221_core.c
@@ -245,6 +245,7 @@ int hts221_set_enable(struct hts221_hw *hw, bool enable)
 
 static int hts221_parse_temp_caldata(struct hts221_hw *hw)
 {
+	struct device *dev = hw->dev;
 	int err, *slope, *b_gen, cal0, cal1;
 	s16 cal_x0, cal_x1, cal_y0, cal_y1;
 	__le16 val;
@@ -275,10 +276,20 @@ static int hts221_parse_temp_caldata(struct hts221_hw *hw)
 		return err;
 	cal_x1 = le16_to_cpu(val);
 
+	if (cal_x1 == cal_x0)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid temperature calibration points (x0 %d, x1 %d)\n",
+				     cal_x0, cal_x1);
+
 	slope = &hw->sensors[HTS221_SENSOR_T].slope;
 	b_gen = &hw->sensors[HTS221_SENSOR_T].b_gen;
 
 	*slope = ((cal_y1 - cal_y0) * 8000) / (cal_x1 - cal_x0);
+	if (!*slope)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid temperature calibration slope (y0 %d, y1 %d)\n",
+				     cal_y0, cal_y1);
+
 	*b_gen = (((s32)cal_x1 * cal_y0 - (s32)cal_x0 * cal_y1) * 1000) /
 		 (cal_x1 - cal_x0);
 	*b_gen *= 8;
@@ -288,6 +299,7 @@ static int hts221_parse_temp_caldata(struct hts221_hw *hw)
 
 static int hts221_parse_rh_caldata(struct hts221_hw *hw)
 {
+	struct device *dev = hw->dev;
 	int err, *slope, *b_gen, data;
 	s16 cal_x0, cal_x1, cal_y0, cal_y1;
 	__le16 val;
@@ -314,10 +326,20 @@ static int hts221_parse_rh_caldata(struct hts221_hw *hw)
 		return err;
 	cal_x1 = le16_to_cpu(val);
 
+	if (cal_x1 == cal_x0)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid rh calibration points (x0 %d, x1 %d)\n",
+				     cal_x0, cal_x1);
+
 	slope = &hw->sensors[HTS221_SENSOR_H].slope;
 	b_gen = &hw->sensors[HTS221_SENSOR_H].b_gen;
 
 	*slope = ((cal_y1 - cal_y0) * 8000) / (cal_x1 - cal_x0);
+	if (!*slope)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid rh calibration slope (y0 %d, y1 %d)\n",
+				     cal_y0, cal_y1);
+
 	*b_gen = (((s32)cal_x1 * cal_y0 - (s32)cal_x0 * cal_y1) * 1000) /
 		 (cal_x1 - cal_x0);
 	*b_gen *= 8;
-- 
2.47.3

