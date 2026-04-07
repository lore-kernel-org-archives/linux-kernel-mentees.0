Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65314364022
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Apr 2026 15:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575031; cv=none; b=uPDGs5M7TZBxwcKe40FOltS0GQ4+Xjyy0ikjkDBoGlX2ud6Ccxz+aNflRWm0lSgawZIhdP08/QdOCiYMH2On5Ua/zP4qT84nhxeohHSrAaddQDSFtWunVfI5+Z1762/Mpab/o1OC0IjM1sU0lGV6QSIEoY53TLasUtyvuUtAJmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575031; c=relaxed/simple;
	bh=UpzQeOIgo32bTfZF9bCVO05d7AFWMI6EAflnf4kcCto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=De9fsZZW0y5qBB92p6BxzZgWWTHGGQwd3QbYvJrUemT0pwgQH6ikoaAP03QlRTaG99Sm5M3wR6/mJ/4h+v93FjUhk0RBKRsMNmacApka0WXPcL4y47K+MbiJMxQXyCFRm06OdX5m9bz/NOtvli3NexCAPFMQ14bJRN9tJ1gDLyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8++OQNY; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8++OQNY"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d029f346eso4420887f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Apr 2026 08:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775575029; x=1776179829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDXxiHNfIFx/blBavOrxi008CsS+1VUvxTy8fmtLmJo=;
        b=d8++OQNYNojUlSnpPSedGT/kxMUiJDO9aUTFoqqgQmxZQPj/mPcijK8pg7VJmmPHtb
         yH/fTf/J4PTKdsO161aBhT4sX7kEs4c3QovwSEOvPzIgsaio1Wr5mGQu63shOy2cemqq
         QoY1scUbdipsiDo1F+N5iC031WB/7eQhgENWkWdAwsZ6VT5MAz5vcIAsBFiLB0yoEVV2
         QyaPf+KughM+RtQyy7ud0pX3Z8Z5lkCeI+Z6kp6/7ESP6Y88n8Dr7vo922RH5hI6+XM+
         cPLlnWgG3DHilxHirOdA2lpYsoouRHeMRJFB/0kGZJ8MG7hfd43LSa1YUzolVFSOWkkW
         CA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575029; x=1776179829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WDXxiHNfIFx/blBavOrxi008CsS+1VUvxTy8fmtLmJo=;
        b=lm2/RrLKKuFdmjJYyibT1aCP095hGXQFFzteYuAboQhIKZTKUsdk44qQ1r9ZxYu2Nb
         7etkcgx/oMTAVrrJk0XLl4FULSkZS1PlFHgQNiInkatd+wYfdNvlMPXxpS0qhTr50L2O
         wMfH0oXPn0mWdVQtBEjTuYbg9tnlK01oHKO2tfucSMU435fdDv6/RNgpj2KfwYhjOgdE
         ENUNrUPjtnponIyWKYW70XDVtSkGvzdzHPveO9liieMswBfCs1y2MPCjnf6UJxfePxJN
         /Ze20Lk6bZsnBmJ2p68hOzxQaP3yawxuVlF4kv6E06FUEEE5S/chVYV+E27hOJ8C/wca
         jjaA==
X-Forwarded-Encrypted: i=1; AJvYcCX/OniQ6RPubivCFwHgdJvF8b5xc/rLGEQq5EJf3OagsgGejkQ9RKroFYGF6IMWVxd+ZoJ5zGLJhyhvxrXvB24MPueIDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKJQZdPBLmzeVgNAtirsc/d0W5CTILPVibYcRIggUeAW2n5XRy
	Qy7gsPIxfCWTcdeLvL8ebq3/MXSOHGUSY6Cue5G7BeSB8YCNG06QODAVfB9NCx1z
X-Gm-Gg: AeBDieum9CChNuqoys2Hrlo0vpTFP+1BagF1v4lQ/HTlbcEAs3CX3LQ7O2LxVe0D8ix
	X7wBGnKVbBsTxfbVBHvlTeMA0B6dbHnXVvrWDpgo6F6kyBrTTEno9g58w7ZC33GN7gdBXMtwfup
	u4j/MBrE9muSahxEhVjjgz+Pukp7bos2iAi+7u/omMRwgP4AkBS0/FB8dCi/yimEUw6H+AZ3Fuw
	HiDMV+1BhSEP0aU4yTiOzGGQD1+XAVETJQIdsWkQQSgs/ie78vmuySUZkG6jscT31vhzfBCuUoo
	PDDYh3YC61mW7K8Y7mp06uNPit6OHw90RLyv+LjWo6V0fNHaX7Q1YMgJhQAI38WZOuqe6ja4Eo4
	JCTLYZXT9oc5GpWcbQQ9/6JUpMr8SuRdGd3WCu3EhuAWR1BU6D9sKSTB9Ll/lPThW92vDjwC0lc
	b+XmB9ihmOXpnMxyfWy96L6mXr8wLLDz1UD1ykB88HRYJf5xIGdNo=
X-Received: by 2002:a05:6000:2303:b0:439:bd70:6114 with SMTP id ffacd0b85a97d-43d292ec01cmr23778032f8f.38.1775575028749;
        Tue, 07 Apr 2026 08:17:08 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([37.163.52.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm51924922f8f.3.2026.04.07.08.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:17:08 -0700 (PDT)
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
Subject: [PATCH v4 2/2] iio: light: cm3323: use dev_err_probe() in probe path
Date: Tue,  7 Apr 2026 17:17:02 +0200
Message-ID: <20260407151702.15208-3-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407151702.15208-1-aldocontelk@gmail.com>
References: <20260407151702.15208-1-aldocontelk@gmail.com>
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

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
Changes in v4:
- Add Reviewed-by tag from Andy Shevchenko

Changes in v3:
- Remove extra blank line after cm3323_init() error path
  in cm3323_probe()
  
Changes in v2:
- Add struct device *dev local variable to shorten dev_err_probe()
  calls to one-liners (suggested by Andy Shevchenko)
  
 drivers/iio/light/cm3323.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/light/cm3323.c b/drivers/iio/light/cm3323.c
index 0fe61b8a7029..c8112685e415 100644
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
@@ -236,10 +233,8 @@ static int cm3323_probe(struct i2c_client *client)
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	ret = cm3323_init(indio_dev);
-	if (ret < 0) {
-		dev_err(&client->dev, "cm3323 chip init failed\n");
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = devm_add_action_or_reset(&client->dev, cm3323_disable, indio_dev);
 	if (ret < 0)
-- 
2.53.0

