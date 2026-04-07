Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B92D38A71E
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Apr 2026 07:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545277; cv=none; b=KZJdhscFAhAX/YKQq+PbE2nFTB3WurvMQkWcL1xJ/RhoKQfeel5SQctuCedMuP1Vyg4yDsguEqsFG7A5raKjLbMQFZHtw5+Njd+kj1jFKZ+1V8wHYv865UPrsNe+cF40RPOy8baxuhWYFNaDElLBec3cYDB1+P1Wb8QkCO0jfX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545277; c=relaxed/simple;
	bh=iwbsvmn3sjRQhDJhAvMknBCPz/j6ukdKjlnQ+9EnffU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Au7GCt2PU5J67c43NOT4ZhecHgUJklgzDWy6HWCTSYh+tOfOaSeVCt8w1PJCgGcYYr3mL59xgQKZjoyMchBUYKGk7YSYsqUty1vQtZXxkIAFlEW38Vd0AWmE7LGSGJI+6vmcU5K5urIkzDMHJNMxOMCaV8gfjD4fx2dMAXqeD+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuSrYhdf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuSrYhdf"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso4367514f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Apr 2026 00:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775545274; x=1776150074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pbshjy6ArGT5S+r1Sisv2NuM+Q/whiMd15xYasDn+5I=;
        b=RuSrYhdfinVQ7yVQmJRgJuswF4bmVLfLYzJUTO9Uepr7RKVfTGGyZe6JG8hb3QkzRx
         kcAJC+LggN7D4GMTMbh4wBb2FLDX/Wf9Zz9HZWFOSUh1dgs82Z19SpQdVSea9d/HfsKM
         0yWpBveX2T+OaWJANv6lKAkhqOo+rIfUT+auWf7UZnHeR3o4+/hA2GKaQg0I5YUChHNz
         dJ3VT0YL5c3oY6MAHZ3pvDElTbygHWfcWMfjeuelNrn/H8kDUa42RZWbCxjEU902WZO7
         ztUEaKOliMawP1CFG/YYdApNFeEh64DRAPc4GHjzD+rpa6iei5xbDJTzODBtvj2layOH
         Ic/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775545274; x=1776150074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pbshjy6ArGT5S+r1Sisv2NuM+Q/whiMd15xYasDn+5I=;
        b=dk7sj0eSVsXwaM0jHOZqGL8voXTxEbZqkyVcdGtyq3oBNAWyn/E6rpivve/+0uGaEx
         wgKCYgEZrnAeKNSfjoCoKlxy8/6Py47Lmh9J7TSD1bY35N7vQUhq8FopquGqsxnIHWC4
         5TqXTVc9/5Z8gjK+Y3/rEodjcx+7DUdH9Q8aKrN1OdRbxNE2B7TNfPkQyYTZ5KOVhPDf
         kts2Aa4R+xYlCMM+KmzaRxc2RMlVMY7IOSyeZxStEXSCTaLvIvut6pYPVLg9KkVjzJy2
         nzlM7/KXAF4Ggo6iQH7YlRVXGZVPDTlWTiIuNJEGBH4yAIgKTBkFVoZC7DAgj/sAoJv8
         Jx3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVV37rZzAEHL2Ay/r6s3e8zNfRPFP7Yg1ZZS1znyY/WBMDhZ5vfrAmR53uER51R+MHT5uZm6KSZK9jtvZMUsSIbaf6pbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YypzKziSQXcfJLUetl9H//ZiDPd6DA5/8DYdlgz1SCC8fw4eCd9
	W+KPYmg6XYtep98xFzpqIzxEHjZFTYo2BZdAakGoljmlGcM/AYmVFN4u
X-Gm-Gg: AeBDievMkJ3MUNr/4Te5h6B2h7Ou/Sp4BQZQWG7fwTEcAeMhppY8zXPmn9sDP4dtxxF
	LeLHqEKms1QqTVv6aA0N/xXA9YrKcGsgcUji/s/IWAOleos5W7Jfqk7vQM4JGpsDGT69ag+Oo81
	IAStHl1fomN52pyiMzDgrOl92Saxt0yOJhkFjJnN+tKqKDQjJm5gNRNXKgyxnTRvFYTn3ra5/Av
	pQdo0yn/Xv/wHWP5zX0TurAd3O8c06JAXCNZy/7JmrQUs22/d8Xn3C/cNaGONThwkOXFzARbUP2
	HV0EutpfKOoGuj63izszD9sCnsRGqBQb/lyevzq7plA4Abnn71Fsu47AghB+MzDSP6bE79B7Yz0
	svwYzr5DzXiDrL9VUV7b1SxqsCRUiaE3nl8VIX0N0tYv4da2VnWWY3vHniA/+0IabB7eFabLzfS
	x/n4bCCAMhda3tC9/2fC7iRngB/v2Qx3iZSG1zAG+dhvZ6IzRzGQ6quS6S5SYHqTo=
X-Received: by 2002:adf:fc4d:0:b0:43d:3083:4ea0 with SMTP id ffacd0b85a97d-43d30834f01mr11736517f8f.8.1775545273582;
        Tue, 07 Apr 2026 00:01:13 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5253sm42167576f8f.9.2026.04.07.00.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:01:13 -0700 (PDT)
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
Subject: [PATCH v3 2/2] iio: light: cm3323: use dev_err_probe() in probe path
Date: Tue,  7 Apr 2026 09:00:53 +0200
Message-ID: <20260407070053.9359-3-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407070053.9359-1-aldocontelk@gmail.com>
References: <20260407070053.9359-1-aldocontelk@gmail.com>
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

