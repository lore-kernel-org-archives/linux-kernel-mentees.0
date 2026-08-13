Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D761248F83B
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635125; cv=none; b=XGJjNlP6Nhf1jU+soYIlV5CRunFjMcPFlyi4ecRrlnbtpS9e4KIyBzElgJzQMAQMsRcHA77DwczSeAyNTnkjgX0NiKYLovOIkG6khuEMC/axeLXyeqWnzgDh86ObCuZZQ2A7n/kAEEnND3NTDROzF4CEJmTPJ6mqI+aEfRXMpsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635125; c=relaxed/simple;
	bh=0weGnRdWwgswxJ4W5rEhhfCRwov11YGiMGfnVZ1X3gA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgDCjSMRxOwh8PDp92a11VpHPBZw913TrN1p7cV4OCJBZ19COY0z3wc723zlm7lHZkZ+GqfDrkXDhgmGgZuJLK8RXjuO0JInZ2+/l1IyLhESBPl4vGLq56sVKXFXxiEgMuWidgMVME9tYznlxaqwT+cI90NiJdACwx0UozK7j/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2wQxgOY; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2wQxgOY"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca80d708489so788852a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635122; x=1787239922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRBl9QkRiwpLHI9/rNlYzWl0ldnHScwdP87IIdtHCSI=;
        b=S2wQxgOYEUUQfdFeC78flQJHipX94FN0bDg6UVhoGKZJQWxNb4srv9RI5offXEM89h
         QIJ+3485OtdjPwt0KOP/oKJ3h3A/Ma0B0SHyOR/y97JJCAggmKgEyDTPra5U0pi6D6CA
         0I92+2YgpsrAEfEJ/jU6L1azK/IxUY3KYi3JlSM+Ee2GKgTvXWkZajx4XWg3OMLp32cB
         n3g4SerVOR8Mcw14R/8XDYzvXYaqW7ijmBHqPWs6WF2AJco/5CEzN2vxsZ3poe94E/og
         PSqOzm8Hz3R2s7IdbwQSTZvdyxosVad3atrvDJToXzsxXl0tp1EjhIz3Ek1fEW3Ji5Kr
         BiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635122; x=1787239922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRBl9QkRiwpLHI9/rNlYzWl0ldnHScwdP87IIdtHCSI=;
        b=nkY5hD4iTphAG4nT0x9YxerfVX8LUpWj6OPbWzvF65IbtnePL4BqsF8Z4JDH8PswzV
         mv4l6pBxnFwhqQODa/RE02aPGOxJ2LsgSDrmiP61CCGSDG4D3i93ZhpG31mQBkH2F9pj
         Ta4CurUXKLzJn28p+a/WFYa4SCAL8TYX8WnN1hKCeLM2XahSbcePW0eqDy8HAJ3YZIbd
         9mZJD5qhYrToBf6Ks7z631Ik43+vh75Dz/YX24wbl4kYfwQv2CJL/LhtXTsiNALMvAyg
         ZtmFQHnQ1hL2mPXuVyNV6M8afECW/BECRnjNYg21ZYqcvR9ILlyHq3Hj2KXnhZg9fqt2
         +Q1A==
X-Gm-Message-State: AOJu0Yx1EdYUB9dtr6KzVI8ZA2vZZ6NJpTUOjpvQe7bpnqsSyVgI4f1w
	w0kB07Q3XRr1aRNaebu5X7shGauMF5dRdTKSzlGb+1l/sjo0vhcUDxYj
X-Gm-Gg: AR+sD115SnOIE7JlVbLroUGeRXMquqY0PX81QuKE9foNLcYDcfMgOjzQtA1lZSIL5wO
	DgvGiz0bijOm6ly54cMdcyImzZgF7yEr8frZNAAgEHG1UU2nxr2lOj6hiwrYJfyt4Q4Jsxjhg8z
	wuxlJ8baxZEjI9sLa8W5Bd4RpreW65G6VCDBbmcO7s0zzlWkxBu+2I7U3wda12FCtX9zygwM16+
	4gYtnMeqKEpuBAGNBs57mpBqC8lN6LmpyUfCUho6Hiv03+RCIusVrAsA3b1tsRLyv1+thoG5TrK
	OR3nxiiYP4lb7/HGEcjfhmM7cGS7Ex968Zih7+67Eqy0Fuw3kO1vu+dfBRPzMeDpqO/GYIWJbWa
	sUkIy1aSWsBuk4U0xGd0+0pdrJh3WZos4QEbBVZVILDmqNB+z28VdIBK3Sr/x/CoA4x0kkd1xDA
	z4TZPsXc5fxx+0ZSELLYHP7z1YXTarVPKjvYMW9kchuVl4PtnAJSaNWvzNlh1EtRjO4T8/DP4kn
	PQOlu2pKN/xTy1SK2N6OqnEqXEgqHHt7nfl5LVe7rp5JiXMxXL+QDXEEUWeqQ==
X-Received: by 2002:a05:6a20:3c8f:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3cc5769db39mr7615107637.15.1786635122196;
        Thu, 13 Aug 2026 08:32:02 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec082943fsm7960604eec.29.2026.08.13.08.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:32:01 -0700 (PDT)
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
Subject: [PATCH v2 4/5] iio: humidity: hts221: use dev_err_probe() in probe paths
Date: Thu, 13 Aug 2026 23:31:28 +0800
Message-ID: <20260813153129.12423-5-adinata.softwareengineer@gmail.com>
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

Convert remaining probe-time error logs to dev_err_probe() so the
errno is included and deferred probe failures stay quiet.

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/humidity/hts221_core.c | 26 ++++++++------------------
 drivers/iio/humidity/hts221_i2c.c  | 11 ++++-------
 drivers/iio/humidity/hts221_spi.c  | 11 ++++-------
 3 files changed, 16 insertions(+), 32 deletions(-)

diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
index b73c26aae9ec..fda38dfc6742 100644
--- a/drivers/iio/humidity/hts221_core.c
+++ b/drivers/iio/humidity/hts221_core.c
@@ -578,33 +578,23 @@ int hts221_probe(struct device *dev, int irq, const char *name,
 
 	/* configure humidity sensor */
 	err = hts221_parse_rh_caldata(hw);
-	if (err < 0) {
-		dev_err(hw->dev, "failed to get rh calibration data\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(dev, err, "failed to get rh calibration data\n");
 
 	data = hts221_avg_list[HTS221_SENSOR_H].avg_avl[3];
 	err = hts221_update_avg(hw, HTS221_SENSOR_H, data);
-	if (err < 0) {
-		dev_err(hw->dev, "failed to set rh oversampling ratio\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(dev, err, "failed to set rh oversampling ratio\n");
 
 	/* configure temperature sensor */
 	err = hts221_parse_temp_caldata(hw);
-	if (err < 0) {
-		dev_err(hw->dev,
-			"failed to get temperature calibration data\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(dev, err, "failed to get temperature calibration data\n");
 
 	data = hts221_avg_list[HTS221_SENSOR_T].avg_avl[3];
 	err = hts221_update_avg(hw, HTS221_SENSOR_T, data);
-	if (err < 0) {
-		dev_err(hw->dev,
-			"failed to set temperature oversampling ratio\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(dev, err, "failed to set temperature oversampling ratio\n");
 
 	if (hw->irq > 0) {
 		err = hts221_allocate_buffers(iio_dev);
diff --git a/drivers/iio/humidity/hts221_i2c.c b/drivers/iio/humidity/hts221_i2c.c
index 40276abc5d2e..e6dc9532cfbd 100644
--- a/drivers/iio/humidity/hts221_i2c.c
+++ b/drivers/iio/humidity/hts221_i2c.c
@@ -26,17 +26,14 @@ static const struct regmap_config hts221_i2c_regmap_config = {
 
 static int hts221_i2c_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	struct regmap *regmap;
 
 	regmap = devm_regmap_init_i2c(client, &hts221_i2c_regmap_config);
-	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "Failed to register i2c regmap %ld\n",
-			PTR_ERR(regmap));
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to register i2c regmap\n");
 
-	return hts221_probe(&client->dev, client->irq,
-			    client->name, regmap);
+	return hts221_probe(dev, client->irq, client->name, regmap);
 }
 
 static const struct acpi_device_id hts221_acpi_match[] = {
diff --git a/drivers/iio/humidity/hts221_spi.c b/drivers/iio/humidity/hts221_spi.c
index e6fef2acd523..8bcc1b5d150e 100644
--- a/drivers/iio/humidity/hts221_spi.c
+++ b/drivers/iio/humidity/hts221_spi.c
@@ -27,17 +27,14 @@ static const struct regmap_config hts221_spi_regmap_config = {
 
 static int hts221_spi_probe(struct spi_device *spi)
 {
+	struct device *dev = &spi->dev;
 	struct regmap *regmap;
 
 	regmap = devm_regmap_init_spi(spi, &hts221_spi_regmap_config);
-	if (IS_ERR(regmap)) {
-		dev_err(&spi->dev, "Failed to register spi regmap %ld\n",
-			PTR_ERR(regmap));
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to register spi regmap\n");
 
-	return hts221_probe(&spi->dev, spi->irq,
-			    spi->modalias, regmap);
+	return hts221_probe(dev, spi->irq, spi->modalias, regmap);
 }
 
 static const struct of_device_id hts221_spi_of_match[] = {
-- 
2.47.3

