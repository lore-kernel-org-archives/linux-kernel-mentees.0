Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CC33B8D79
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  8 Aug 2026 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786179682; cv=none; b=MHz1uxSoU3PSlXtf4pe5BMno3Vhs39YaohIjbxW5EfqpDr7hHJpDS3Pk9VUUyyRm/v2cd66kjJFtEwIABO4+BaEM3l0wv5BJ0bdPFLIPxcKNAOhtWSbZ/fmV0eqSPpx+Akm0qvp5iwq2+hKjsw/gGoEaFDCq4ZImUDvICpfpM94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786179682; c=relaxed/simple;
	bh=qk/kOYORym5I+8ya8cWHEEAmCjE1vOB3NM+RASUrorQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ojgtm3vwPZA2GmjmEb/XqkArbtoTz6R2Al9+SpeAPz9rpmw5VvHMTP8nGELC2JKITLcQskRROb7sG4Q4Ao+u/tmWiGQSKZ6/EKQAMsajWQFAaeRUxTozzXQCbqqCbn8KIsgD6h4co9zCnT5LJRzeA30xE/SjYrl0i3dfw7bmZXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAMM/7z3; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAMM/7z3"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so281075a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 08 Aug 2026 02:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179677; x=1786784477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1Lu5z40VaFQBmnLoOwaqvwm+6VvtbjWSO8Fgi8tuuA=;
        b=QAMM/7z3PSYfoU9UhEGX48/seirjVkWqCy9ngod/ib4trE+rqcwkAULp0UDjeYRT6J
         RikJq9AKBdVqKV9ug7bSksAmcF26f8Bi0I2R2HhtR5QqsZpMJPW4MT9nloYm5NoE0c2M
         3LtmJ5Htxn9+qGc0NZMZywLA5ad4qapgrxYVbDc4El+psdAu18KnwZZFhUxu0fyf6J17
         HuzPd0g2gT96hiB+Cw8L1/VT70dNDz7d/LbgeQD33MsJ4xftY2h+6mNX1N9cZJdJBZVE
         bh1YMFmPMy4LqVwAOY4MehUVC5Beu0l9t6rc8YlFZ1rojcAdCwI4brN5IyTcG0NaBs6h
         1cFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179677; x=1786784477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v1Lu5z40VaFQBmnLoOwaqvwm+6VvtbjWSO8Fgi8tuuA=;
        b=cscVXzQlrLfIxZzIOFsbQJ/GbLPU5jVZtVkhetivVbQt3fCIuwibNCqSAHNtrzWaix
         z9sjNnIsVbWzXS7EAvtJb+1ksTnruHjKnO+uWoZcazpZEhyhhlQK5Rp3DuAgg9rNQSgm
         NGrYuhgPWXNO0C0h6yHJxMtyC/L4k8gSwE5iBH4JDHJfvr9FdGKxcVwMYIa3nDk9eVgx
         VTJ1XlcjOPRLp6kM24iSQT4hJG8j8T4yX75+A1Ah80G4/EONnuxW02aaymUgLkiLCpD4
         BEwcCFIcsrLQoELUmJokG0Elt93JLa8bnWOzPFteEl7/q1ypqPwStkBLCEXBMqfRpCxT
         +llg==
X-Gm-Message-State: AOJu0YxHwmed5nj2r5S9pxThqwndlF56SHNDLR+20rgvEL1gAumKq1PV
	z2l53xN4yGmlhEqYpb1iaTrldsov6PV89ZuHfZQVrnVGmtVaQo0yFvcs
X-Gm-Gg: AR+sD13UAAMOu8oeQhibxTXfR/P5gGK2QA3H+PJLgyQvFIRInk6tpGNW6bML1LxU0H8
	yStS90KyMfkcTeE6Slnv/88O1Lyy/HyY1c7DAnJpvgnJ3JZG3aKLVFFZ0FTKRa+Zs+5Z++//iu1
	Fcnt8g3jTmHUDvT7pB0yccMR2McJOUXS+p+QaRkEBD3C1ufm8PaR2MrCmzrjuIOPq7pKWKPkeQG
	CdLcqLeqlr/73Y683HbA8/S4nQC44GXn+oNaTqPddwrHFSrTMH1TmGWCXz7NtBmpzugFdrqNncx
	S+0Lm8Dd4mqtTxS+uY7u/0w21I2AKq7d3D4b7y38vKv5fkp543kDhQ5mfTLW6zs8HNzD5Bz2U2r
	hLZ9j04ty3IMQHGyphGoXog+QVZiUEPj9igUDzMtLaeeM3Fuo05EypW4YRCbO07fzS8sJvFT7rq
	WNcMr/YD3W8d/yj+hPr83XaplkoOZXQSqlElv9Xu2jWB59bud8ee1LbAokzt/Iip/JnQ8/llZfS
	5BVUKfbsFhNB8F0Mw9783bw/Jwt0wRNae3KFj+dQbaxf8ZpxnXjNDf5r3gv4g==
X-Received: by 2002:a05:6a00:1daa:b0:846:8b21:6304 with SMTP id d2e1a72fcca58-84f2dfd2c03mr32330956b3a.14.1786179677117;
        Sat, 08 Aug 2026 02:01:17 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e9f0sm1973871b3a.28.2026.08.08.02.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:01:16 -0700 (PDT)
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
Subject: [PATCH 5/5] iio: humidity: hts221: fix division by zero in calibration parsing
Date: Sat,  8 Aug 2026 17:00:26 +0800
Message-ID: <20260808090026.34187-6-adinata.softwareengineer@gmail.com>
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

hts221_parse_rh_caldata() and hts221_parse_temp_caldata() divide by
(cal_x1 - cal_x0) without checking that the two calibration points
differ can cause division by zero.

Reject zero divisor with -EINVAL, logging the offending calibration
values. A device with such calibration data cannot produce meaningful
scale or offset values anyway.

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/humidity/hts221_core.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
index 313c80df3f6e..fd11cc881dbf 100644
--- a/drivers/iio/humidity/hts221_core.c
+++ b/drivers/iio/humidity/hts221_core.c
@@ -276,10 +276,20 @@ static int hts221_parse_temp_caldata(struct hts221_hw *hw)
 		return err;
 	cal_x1 = le16_to_cpu(val);
 
+	if (cal_x1 == cal_x0)
+		return dev_err_probe(hw->dev, -EINVAL,
+				     "invalid temperature calibration points (x0 %d, x1 %d)\n",
+				     cal_x0, cal_x1);
+
 	slope = &hw->sensors[HTS221_SENSOR_T].slope;
 	b_gen = &hw->sensors[HTS221_SENSOR_T].b_gen;
 
 	*slope = ((cal_y1 - cal_y0) * 8000) / (cal_x1 - cal_x0);
+	if (!*slope)
+		return dev_err_probe(hw->dev, -EINVAL,
+				     "invalid temperature calibration slope (y0 %d, y1 %d)\n",
+				     cal_y0, cal_y1);
+
 	*b_gen = (((s32)cal_x1 * cal_y0 - (s32)cal_x0 * cal_y1) * 1000) /
 		 (cal_x1 - cal_x0);
 	*b_gen *= 8;
@@ -315,10 +325,20 @@ static int hts221_parse_rh_caldata(struct hts221_hw *hw)
 		return err;
 	cal_x1 = le16_to_cpu(val);
 
+	if (cal_x1 == cal_x0)
+		return dev_err_probe(hw->dev, -EINVAL,
+				     "invalid rh calibration points (x0 %d, x1 %d)\n",
+				     cal_x0, cal_x1);
+
 	slope = &hw->sensors[HTS221_SENSOR_H].slope;
 	b_gen = &hw->sensors[HTS221_SENSOR_H].b_gen;
 
 	*slope = ((cal_y1 - cal_y0) * 8000) / (cal_x1 - cal_x0);
+	if (!*slope)
+		return dev_err_probe(hw->dev, -EINVAL,
+				     "invalid rh calibration slope (y0 %d, y1 %d)\n",
+				     cal_y0, cal_y1);
+
 	*b_gen = (((s32)cal_x1 * cal_y0 - (s32)cal_x0 * cal_y1) * 1000) /
 		 (cal_x1 - cal_x0);
 	*b_gen *= 8;
-- 
2.47.3

