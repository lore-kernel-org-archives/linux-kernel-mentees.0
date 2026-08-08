Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F0B3B8D76
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  8 Aug 2026 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786179678; cv=none; b=fvWhFMXoimJ18t5sGIKZunCbUglYnAsiVcRYXJ5IG1/W5Z4CjwFoWva0odk2Swe6pgsx/vSaDWg/5HjvXDs180VCPxMiQe1yNxl8aX3RDhLlEpIfRgoq+KULBG7BhE/kU2wHXhahIz2VsmK8psQbJ0hJu+DUIJp2cCzaYVOvFg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786179678; c=relaxed/simple;
	bh=l8Qv18UovxownEXrOfGdKkbDuZk8btA6NtUxQm/Mqi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PzAotN/l8GzZHpN0cfOqejSyLOdNxXHGHHhziisZiONfq9jWXucyd2OJnYlhDyv8dySnZwPKt2JhZB+zV+PiIRGEbhkOkkGF+ACvAWsUjmsS/yT3Gcaz8CmJnr296Da2CB4cliEiSEyQBnBwRBHl0T0xaTw/ugvBAPcINNfBmZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjaMRaH/; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjaMRaH/"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84a2dcede83so429716b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 08 Aug 2026 02:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179673; x=1786784473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhrwdZr63D/YjEj/MiL58RSc/8ReOPlilFBlib5Rh+o=;
        b=GjaMRaH/tE4voM7BOnw5XjQkxl4gVlMHT3RnG4/2MAgDNrSINVQJ3GHU1C4coCxCnu
         3gphcu33Q1eRxPkieCn4qIXvPbSwOlhcqi76dtIajOTOXZ7rqFyQX29I9hlkmIQFwTAo
         Q8ig6T000vSQxp7ak+SV2NnyrXrDZ7da/u/zw87CML39T+klLiNvsJKfBo4Th6yLp4nF
         BmX/ppeJyyhmtc9iR+35yjfNAbdYD96CP45StZI7En7QcPIYnAXoaa0QrxEdbW41MA26
         IyJ6q1ffJIaI3hLEXUuzbSuEN4c42djevbuDrUvkUqaL0j38GhterblTXw2sRDkQODow
         Fo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179673; x=1786784473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dhrwdZr63D/YjEj/MiL58RSc/8ReOPlilFBlib5Rh+o=;
        b=HHKrDtIvLiKRGQ+rLTjJkrqmrxjqymKyO3BYS1VL4iQ7x9qOBsx7Dwehgn++BTDlCm
         9YHophtrSsiFyXFXwdf8pU5ROq4qu82x5M6TbFU0FcER1kE+a/qO5MgkJXSdS+FU8oNO
         rfeetb1EOKsa3psS6cAhx8bimUxBNCxY7GBxcBv6gyqYENZ6ycU7dk60VS/KIETQIuj4
         R8LwqfluHvzLQXyya7AucJxA1U/Tzc2iLwsg8Ev47KmjGNRIJQ1MI3krU2BX7lRFnvrn
         BFArWKp8lM3RZocWInOhVGNsR0aPjUlPPxbrs4P4Zh9qlFUsK8TTtYFTbGFSlt63Ne/I
         nZ0Q==
X-Gm-Message-State: AOJu0YwgKq96mkGnJSWwC+XBS5e/b7pn5vnlCvGOJF5Ejb19Kl2kJa7W
	+gFM864S72GpYnbGeZq8+LJWFaoXJ3odgwheevaGuB+6alLqFVsH8YV6
X-Gm-Gg: AR+sD1257/x2bW1AUfi3ONYtYIPFng5lfUh+6+zie5hLh1/F9XmtUDop8jRcBTSvYRt
	DSqBV01HH+EOTm9bAJ1cxu3JukkqQFpxvkKYPwD7q0bH55MlVrpzmmeSRGNbME/MPSNWCysvy+V
	FzjCZcYZClvEfnD5A60icLFD1qVPHwhFg0eCrq3YLf8UBgYDRcqYIz2HAEo9jeuuOQADgdgsn4v
	MHZOT6mATeQJHIf5EPGggbvKbroXo04k9QRDOwisGxm9Guh8SXsi/ojtXncc2cIbz27aIBNP6Sl
	0gEcdpxhFx8WddQskrvlBwxjdsIHZ6sAOZ0KDpKGpZTpI2lxA+DoLsSPquP99ErVEqvB0Cw+90O
	9pXIzA02ASSfXws4ccp+pOYgq2EoufE/U0tIuCZxDh5hrV7gf/7v7A8iNY3YYwytFK0CyM+tYuO
	8OXgRtic8MKH2mXcMYjJQPr07yT4sG5bB9jUiTy9wHiBIpLRPj0QDVYGjaRDpwZrPEx1uG8ySXd
	53vyTJGUHmNHJ2OI2oOG4dSvqagtDTdYvAWC/3baXQbtW4nxYswULeEfUKEeA==
X-Received: by 2002:a05:6a00:f03:b0:848:56d4:3288 with SMTP id d2e1a72fcca58-84f5df36ec9mr11268071b3a.4.1786179672941;
        Sat, 08 Aug 2026 02:01:12 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e9f0sm1973871b3a.28.2026.08.08.02.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:01:12 -0700 (PDT)
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
Subject: [PATCH 4/5] iio: humidity: hts221: use dev_err_probe() in probe paths
Date: Sat,  8 Aug 2026 17:00:25 +0800
Message-ID: <20260808090026.34187-5-adinata.softwareengineer@gmail.com>
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

Convert remaining probe-time error logs to dev_err_probe() so the
errno is included and deferred probe failures stay quiet.

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/humidity/hts221_core.c | 30 ++++++++++++------------------
 drivers/iio/humidity/hts221_i2c.c  |  8 +++-----
 drivers/iio/humidity/hts221_spi.c  |  8 +++-----
 3 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
index da773d2edc80..313c80df3f6e 100644
--- a/drivers/iio/humidity/hts221_core.c
+++ b/drivers/iio/humidity/hts221_core.c
@@ -579,33 +579,27 @@ int hts221_probe(struct device *dev, int irq, const char *name,
 
 	/* configure humidity sensor */
 	err = hts221_parse_rh_caldata(hw);
-	if (err < 0) {
-		dev_err(hw->dev, "failed to get rh calibration data\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(hw->dev, err,
+				     "failed to get rh calibration data\n");
 
 	data = hts221_avg_list[HTS221_SENSOR_H].avg_avl[3];
 	err = hts221_update_avg(hw, HTS221_SENSOR_H, data);
-	if (err < 0) {
-		dev_err(hw->dev, "failed to set rh oversampling ratio\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(hw->dev, err,
+				     "failed to set rh oversampling ratio\n");
 
 	/* configure temperature sensor */
 	err = hts221_parse_temp_caldata(hw);
-	if (err < 0) {
-		dev_err(hw->dev,
-			"failed to get temperature calibration data\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(hw->dev, err,
+				     "failed to get temperature calibration data\n");
 
 	data = hts221_avg_list[HTS221_SENSOR_T].avg_avl[3];
 	err = hts221_update_avg(hw, HTS221_SENSOR_T, data);
-	if (err < 0) {
-		dev_err(hw->dev,
-			"failed to set temperature oversampling ratio\n");
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(hw->dev, err,
+				     "failed to set temperature oversampling ratio\n");
 
 	if (hw->irq > 0) {
 		err = hts221_allocate_buffers(iio_dev);
diff --git a/drivers/iio/humidity/hts221_i2c.c b/drivers/iio/humidity/hts221_i2c.c
index 40276abc5d2e..8f5fa7d3eaf5 100644
--- a/drivers/iio/humidity/hts221_i2c.c
+++ b/drivers/iio/humidity/hts221_i2c.c
@@ -29,11 +29,9 @@ static int hts221_i2c_probe(struct i2c_client *client)
 	struct regmap *regmap;
 
 	regmap = devm_regmap_init_i2c(client, &hts221_i2c_regmap_config);
-	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "Failed to register i2c regmap %ld\n",
-			PTR_ERR(regmap));
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(regmap),
+				     "Failed to register i2c regmap\n");
 
 	return hts221_probe(&client->dev, client->irq,
 			    client->name, regmap);
diff --git a/drivers/iio/humidity/hts221_spi.c b/drivers/iio/humidity/hts221_spi.c
index e6fef2acd523..916fe8481c4a 100644
--- a/drivers/iio/humidity/hts221_spi.c
+++ b/drivers/iio/humidity/hts221_spi.c
@@ -30,11 +30,9 @@ static int hts221_spi_probe(struct spi_device *spi)
 	struct regmap *regmap;
 
 	regmap = devm_regmap_init_spi(spi, &hts221_spi_regmap_config);
-	if (IS_ERR(regmap)) {
-		dev_err(&spi->dev, "Failed to register spi regmap %ld\n",
-			PTR_ERR(regmap));
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&spi->dev, PTR_ERR(regmap),
+				     "Failed to register spi regmap\n");
 
 	return hts221_probe(&spi->dev, spi->irq,
 			    spi->modalias, regmap);
-- 
2.47.3

