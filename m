Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1085D30AD10
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  4 Apr 2026 20:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336341; cv=none; b=Dps3WcqRrPW2Au95JRrNKRtv36k4likiRF8rMNsbXznKOIFa4mO1TelqnkA3JUDlup1qpHBDhbU0JvnKGW/CgxCcEKKaZwqGC04l9gIHfG1x30qCgVyHj6MYvK0TtxqO2AjwFvL8gr/h0gidRRQAsrAX+trn4BSuF4ch4vFF3ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336341; c=relaxed/simple;
	bh=07X/+r4FQs5VHXmMzGcuGWaMDeBFQZZjjZ/2izXOFQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpyi27EhY8V4fAVILblKWco+nqmthTkGCxYOqolLMzNgwfoT23NIbhztlLNa1dW6NCoJIswscTPIE3f1ARg3n+bq1q0ZEcmwpPbPMoCYSRtJOvff5zlQCZu9vh+E0qdq/ejEDEcCkiHJb55uttYeT4s+OGcvSosj5jxYfEGu29Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrFrnEYi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrFrnEYi"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso25865845e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 04 Apr 2026 13:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775336338; x=1775941138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byIWEtWcr/ZkucG4RN4fe8hAaX3tjSZ5r8jwT3XAMSQ=;
        b=NrFrnEYi32JZp9FKHTApkUBqKMCkRqmvE2GzJ4dZslKBE8YV+3ODCD5HRJC9m6fvoW
         lOv1c9oiinVt+jj3tkDlLDVYtbrZfZRY5+ejL6eIYzv7py5Xu+fkRLmF3gSpEfkBR8jI
         K/1GSoRGJLaokhjYJANO9zArmCDuWQRlHnH3vvSzLmcbWdN9fEKMz6qZeTGfRwSQnhfx
         5yywNEXCrBYEGk/qD+rWISbSzEMcUSY1M/XgHrgxuEnDzRkAaG+6GpzbQAhBBGBr0Iac
         7+B5ZPsXaRg4kepeDVVKkQdOKRIsdgeHThkfnBH1paQnJ+vG2BKdwfcjQiwwHWN9hauG
         EnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336338; x=1775941138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=byIWEtWcr/ZkucG4RN4fe8hAaX3tjSZ5r8jwT3XAMSQ=;
        b=Gk17+Jy7ODebC+6JeKLVLE4J3lNT8FTia3b5T1NG8Dea/CI1g+ZgiC/wvR7d8dNQbP
         mBa8WnqGR4Q4H6bXbC7MsOdmP+DgVKFsjxSknrG3o4VnWu+lircCND0kpD9WVMLX6IRi
         xoHOBG241esQ/Sbnqgg9tqlw2bxUhDs+2WxMOa6R7Sq48EY8L1Xrp6SgDp4RLjt025or
         pp+DuX74yhahl4sYngBZFXTpTRYUimm+4cN3vt6O3Fncz+3Fzwi/QnC0pBqKLVfLk47y
         5TPgZAQ5VCLRHzV0e5t/OCQ07z5Y+0fejCgY/HE5R2sefl+WspYtjztqo+vF5DZAxqyx
         IwNg==
X-Forwarded-Encrypted: i=1; AJvYcCWu129wTvRf2T4t/9LODmaNdtr8Zb/kfH/6h7JsOMWF/2yJFvTicqkHjf/2N/qOAsS0UnO7hod5zDnW3J0YbFJht3i1og==@lists.linux.dev
X-Gm-Message-State: AOJu0YytdL/BkDe8/d9S02Pe5rPuuKodO+VyqK4Vo7xQszJ2F2EaF4I/
	CWzyHjt0xHnA+t7gw2pyimCtE6K/BF6RcqKBmvYQkwTfOSsJnuoVhIYc
X-Gm-Gg: AeBDietFKFPJBtjXP3Vt5OGTjz6A5BzvMxmmvAVOKCfxiXtx8MGc5+cooLCZXtUiq/L
	DVsigkQhZbfyn/Pk67OHm4O5NaTYCP7E38oB4of9k23UgcVtPlC6gVVy7wsG0YcTQWik5v35zxD
	2AmBF6y+l9iT4vgGvaPXZH01g4KPtX6LHF+9dJ6GATrVEb0EYKBZVxuH62q4VPeaAId3IzDyrSR
	dV2YsTnnmSiiCpAQQlbazsFOuIcXV7EEfzsvma6c5Updj6nV1CQ5C6/L8Ch7SKRZ4c0nvDLSm/I
	E5PiRMdMkzJwJSBbeCSXRAn6wY8XpnMxmCrlJqhg6WDB3fxm+5YaT2wT8Yh3Vk+PALgvRZtIJuA
	Rj/a9o3klDUAmtJSDs1JIEzINgCDayaR0Vsyh5837hQ2YRZjZMdDxkChE1cPHtvtTjPSlCJKv2N
	m11qrCavq3dyq3R7BD80HQTa7TiAe3Gjfw4TToIIu7bT1AuX1bE1Q6
X-Received: by 2002:a05:600c:4593:b0:485:3b00:f93b with SMTP id 5b1f17b1804b1-488997e7b16mr123898775e9.31.1775336338349;
        Sat, 04 Apr 2026 13:58:58 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([94.164.143.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a36f22b1sm84749535e9.10.2026.04.04.13.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 13:58:58 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: ktsai@capellamicro.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	daniel.baluta@intel.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2 2/2] iio: light: cm3323: use dev_err_probe() in probe path
Date: Sat,  4 Apr 2026 22:58:52 +0200
Message-ID: <20260404205853.18559-3-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404205853.18559-1-aldocontelk@gmail.com>
References: <20260404205853.18559-1-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace dev_err() calls with dev_err_probe() in cm3323_init() and
cm3323_probe(). cm3323_init() is called by cm3323_probe(),  so using
dev_err_probe() ensures that deferred probing is handled
correctly and simplifies error paths.

Remove the redundant error message in cm3323_probe().

Tested on a Raspberry Pi 3B using i2c-stub. The driver probes
successfully and successfully read integration_time after this change.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
Changes in v2:
- Add struct device *dev local variable to shorten dev_err_probe()
  calls to one-liners (suggested by Andy Shevchenko)
  
 drivers/iio/light/cm3323.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/light/cm3323.c b/drivers/iio/light/cm3323.c
index 0fe61b8a7029..5b36fc265c6c 100644
--- a/drivers/iio/light/cm3323.c
+++ b/drivers/iio/light/cm3323.c
@@ -80,22 +80,19 @@ static int cm3323_init(struct iio_dev *indio_dev)
 {
 	int ret;
 	struct cm3323_data *data = iio_priv(indio_dev);
+	struct device *dev = &data->client->dev;
 
 	ret = i2c_smbus_read_word_data(data->client, CM3323_CMD_CONF);
-	if (ret < 0) {
-		dev_err(&data->client->dev, "Error reading reg_conf\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Error reading reg_conf\n");
 
 	/* enable sensor and set auto force mode */
 	ret &= ~(CM3323_CONF_SD_BIT | CM3323_CONF_AF_BIT);
 	data->reg_conf = ret;
 
 	ret = i2c_smbus_write_word_data(data->client, CM3323_CMD_CONF, data->reg_conf);
-	if (ret < 0) {
-		dev_err(&data->client->dev, "Error writing reg_conf\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Error writing reg_conf\n");
 
 	return 0;
 }
@@ -236,10 +233,9 @@ static int cm3323_probe(struct i2c_client *client)
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	ret = cm3323_init(indio_dev);
-	if (ret < 0) {
-		dev_err(&client->dev, "cm3323 chip init failed\n");
+	if (ret < 0)
 		return ret;
-	}
+
 
 	ret = devm_add_action_or_reset(&client->dev, cm3323_disable, indio_dev);
 	if (ret < 0)
-- 
2.53.0

