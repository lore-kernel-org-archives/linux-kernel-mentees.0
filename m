Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D6B3A3807
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 11:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141213; cv=none; b=uNwSMROFdTxi/XKRhbSO2AmN1z259ZDlfqqfuvDzwUFJ4FWHfD+ufJN2zi9G31mKNgZumNTs6iFS1Tfj0Qugp0veOlAtF+f2sz3gWNbc3az3DWR+LvmqwMegYHnP8l+V7Xjthd/6X8t9kwvqxzWdLd9MJeJJ34mjCqqDD0sr+uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141213; c=relaxed/simple;
	bh=Mhx0z+syGJL8iXj8CfFuAcr5tavxGM1AgsSsS7jC6w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pqsfiLPQwq/Yprhe7C/M9/dFshfdKnrQdjBZX8WXDLtuw1esO16NWqBdiOrAtXiAMsqDwZFMHZM7bVssGVz1xx++HXvfbmGbSA8+fruSexTyTYsqrS+MwYZCRyZ7mJVzGhtPXcLiSLkdAkHVEhTo1CAZ60XjOzOrogQq/cPE9Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kF8/tpev; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kF8/tpev"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-842358aaf36so68508b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 May 2026 04:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780141211; x=1780746011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIIyDr6/RBY3rTp7heBCHwFxNkq7nFTnyDyon55fD+Q=;
        b=kF8/tpevz7gJUokQ4YkFF9Pe1XpzjiQ5glJQCy0AhuZELskNm321UsbOKkQ8yPvgZO
         f4I64HaHpVR6rDt9K6knuhH4q562Ueely23Bhc7V3cPKrdJrsjLawY9HbQ+aRGyDMyS1
         8SoU/EaxwVkKIj3Fwb8kmc8dsMb4+Wrjdj5g1ZV3b87SbIkNYi2GX744vz21HAL9EHqo
         y2b+L7ZyFUnZ86h4dyLSd9MhhfWD5jcLXfDk1c77AyKAYb4icoNuZYcvYiJMoO7IcXHF
         fbeQ+tL6gYdkEtyey7v4j9v5DbDOPgAz6K3weCnbco9m9F5yjpovKhmaP81wcwAskNf5
         ZDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780141211; x=1780746011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GIIyDr6/RBY3rTp7heBCHwFxNkq7nFTnyDyon55fD+Q=;
        b=U2tbnKVzQgLWycfzbVfnbbGZdcsjdAy6JSzCxRDA0bWRHbTTewXrhnaQqfVMa3bPXK
         EFfcbNRD2nWBWPZUJdoX9wvEysTJDkEfao0m/5ofit5+USPi+KrhfsSPXWJjKFHHUnc5
         Qxz2ySaCPlhrOb3QZcFjI3ol3Nb1nr5DSrK/Qq3P4Pdd3uAuPHJzN+90TCoEWHe2Z6J8
         UxgjK3jv/l+BqAHdpy5wAf8m171ckh99qGUk2uZBeVl30SK2zMZKvY7UtEQ/wF+Ymm6I
         yXnlVRSdulHR0sA1m/QDuO9SEErlibkIypVSfq7UoRYnozD17Ixpr4Jj5frk02/gr+6V
         4XqA==
X-Forwarded-Encrypted: i=1; AFNElJ+7+rEb+Cc6k6pzlEQcReuAE+/ABF29PmLmMuysdFjd7BLlrF1OA5pSRs3CP9R6sRV94y2Juz1WWgdYJsHk8CSag2o9DQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGp3do8hm4JlBGQGxJPX68E/A1CboaA6q3KL+Y+Tq7s94Mf8zl
	tVdC7iStBDicRGYTwXgx5IEdozrsXLBCEujK0WeorPgve/NegDHah/wZ
X-Gm-Gg: Acq92OEHaef+CZDbEHe+HOfXFz5SIBdU015q93QcfyZJJ57ST9923MjZk6xIVSLXJBs
	0P8p5fLUnLRSwlhwDjOMJDvx3DFLL5xWgTRuh3dlIq2DuaGfWW255vAgafNpN/fNmXsovT5ts9M
	XjftUEoMRydGr6Cm9cqZjI/Wtd6ufynvKZNHpwW7vLhHrO2sy+EvbltzNLfpitXg9419a+zTSys
	iAyeNuuG3jo2xaY87YxQ8XxuVxiJw/UEVmQ3EPQH8dHithv5Yy8UhUs1BhY9LgFCnXeCCrZZvSE
	dsABpaoOLXvBBRmSktpMhJ2jHTcMDbVURW4njDO5dKTjSig5hnSlgt6XlvloLHcn9u8M7ao9Hvh
	9ks3HK86Y+cvQkL5n9De70z/lPN6taUmZYhdxNzmslXy0spthdDoN75jcwpw+7ykdd1KkZ2uNHJ
	sqyGfrRPvmluoh+0Qo2/1uoJa+nZ8zvRknpEO3BUGdG3QaDC8wmBOHu4aLZw==
X-Received: by 2002:a05:6a00:948b:b0:842:2ddb:e305 with SMTP id d2e1a72fcca58-8422ddbe832mr1655705b3a.43.1780141211102;
        Sat, 30 May 2026 04:40:11 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b6797esm5467518b3a.26.2026.05.30.04.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 04:40:10 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	apokusinski01@gmail.com,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH 1/4] iio: pressure: mpl3115: convert probe to fully devm managed
Date: Sat, 30 May 2026 20:39:35 +0900
Message-ID: <20260530113938.171540-2-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260530113938.171540-1-suunj1331@gmail.com>
References: <20260530113938.171540-1-suunj1331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert probe to use devm-managed resource allocation,
removing the need for an explicit remove callback.

Replace iio_triggered_buffer_setup() and
iio_device_register() with their devm equivalents.
Register a devm action to return the device to standby,
replacing the cleanup previously performed in
mpl3115_remove().

Move mpl3115_standby() and suspend/resume helpers above
probe to satisfy declaration ordering requirements.

No functional change.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 drivers/iio/pressure/mpl3115.c | 81 ++++++++++++++++------------------
 1 file changed, 39 insertions(+), 42 deletions(-)

diff --git a/drivers/iio/pressure/mpl3115.c b/drivers/iio/pressure/mpl3115.c
index aeac1586f12e..befb6d48efa9 100644
--- a/drivers/iio/pressure/mpl3115.c
+++ b/drivers/iio/pressure/mpl3115.c
@@ -691,6 +691,33 @@ static int mpl3115_trigger_probe(struct mpl3115_data *data,
 	return 0;
 }
 
+static int mpl3115_standby(struct mpl3115_data *data)
+{
+	return i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
+		data->ctrl_reg1 & ~MPL3115_CTRL1_ACTIVE);
+}
+
+static void mpl3115_standby_action(void *d)
+{
+	mpl3115_standby(d);
+}
+
+static int mpl3115_suspend(struct device *dev)
+{
+	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
+
+	return mpl3115_standby(iio_priv(indio_dev));
+}
+
+static int mpl3115_resume(struct device *dev)
+{
+	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
+	struct mpl3115_data *data = iio_priv(indio_dev);
+
+	return i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
+					 data->ctrl_reg1);
+}
+
 static int mpl3115_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
@@ -730,53 +757,24 @@ static int mpl3115_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	ret = mpl3115_trigger_probe(data, indio_dev);
+	ret = devm_add_action_or_reset(&client->dev, mpl3115_standby_action,
+				       data);
 	if (ret)
 		return ret;
 
-	ret = iio_triggered_buffer_setup(indio_dev, NULL,
-		mpl3115_trigger_handler, NULL);
-	if (ret < 0)
+	ret = mpl3115_trigger_probe(data, indio_dev);
+	if (ret)
 		return ret;
 
-	ret = iio_device_register(indio_dev);
-	if (ret < 0)
-		goto buffer_cleanup;
-	return 0;
-
-buffer_cleanup:
-	iio_triggered_buffer_cleanup(indio_dev);
-	return ret;
-}
-
-static int mpl3115_standby(struct mpl3115_data *data)
-{
-	return i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
-		data->ctrl_reg1 & ~MPL3115_CTRL1_ACTIVE);
-}
-
-static void mpl3115_remove(struct i2c_client *client)
-{
-	struct iio_dev *indio_dev = i2c_get_clientdata(client);
-
-	iio_device_unregister(indio_dev);
-	iio_triggered_buffer_cleanup(indio_dev);
-	mpl3115_standby(iio_priv(indio_dev));
-}
-
-static int mpl3115_suspend(struct device *dev)
-{
-	return mpl3115_standby(iio_priv(i2c_get_clientdata(
-		to_i2c_client(dev))));
-}
-
-static int mpl3115_resume(struct device *dev)
-{
-	struct mpl3115_data *data = iio_priv(i2c_get_clientdata(
-		to_i2c_client(dev)));
+	ret = devm_iio_triggered_buffer_setup(&client->dev,
+				      indio_dev,
+				      NULL,
+				      mpl3115_trigger_handler,
+				      NULL);
+	if (ret)
+		return ret;
 
-	return i2c_smbus_write_byte_data(data->client, MPL3115_CTRL_REG1,
-		data->ctrl_reg1);
+	return devm_iio_device_register(&client->dev, indio_dev);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(mpl3115_pm_ops, mpl3115_suspend,
@@ -801,7 +799,6 @@ static struct i2c_driver mpl3115_driver = {
 		.pm	= pm_sleep_ptr(&mpl3115_pm_ops),
 	},
 	.probe = mpl3115_probe,
-	.remove = mpl3115_remove,
 	.id_table = mpl3115_id,
 };
 module_i2c_driver(mpl3115_driver);
-- 
2.52.0

