Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA8633D515
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  2 Apr 2026 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775143058; cv=none; b=L1o4pJHF7WHYUtRs+EIXmYwsRXtE9QhNbTROtkyxkfnWGiJjUKZn7zIc7ErIUWwsq6DYm+kHwDrxM1TSZkm5ffnaOgIlRlgG/85i0yWnzcwOIOSuiAGDvWOGwvUkIL7Z5lr7Igp1DqP5QPA4+5jaI2Nxs//Q0o17DUhTLwWM7ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775143058; c=relaxed/simple;
	bh=3kdxjSUeVf/FuGDAAytGCSHU0OdWoSD8W7W/mC21/jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pa1ijQBQpF95FdpVy5daF7auDxz/aDC35FvxOkn6VUuLIw6QWACUKIGzWg84KTNDWJH1zpJb3ZsWVoQ3L8geJceCqvIiPh/hEPnna2F3/zlNh1V9Cx4wY27rUY4CCHwuMCtjQS5OAYfyFlnEwuq1FA3JSISgIOj96lyqJ/TUx4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSGkm6by; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSGkm6by"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so11961935e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 02 Apr 2026 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775143056; x=1775747856; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdvV3uoZ82XkebWsgkeF8rl2q6Pk7QwD6xIvmUVJSs0=;
        b=KSGkm6byGokprkqXsUuIcG4HvRL+G029KLb7340z3PV8jqCbvZRlw2xuVA/zmvq/BR
         7sPSELv5jK0KGZMXAej4nNJHXAbpcMulgazuwyRzpWHQTUCHsvMqo8grIwhT5lvXlFeh
         vDXWPvKksxza74IzRjy8HXtCeuiu6m5yHe0pUUPolnzVp/uLwdIUeaj34Lg38eNys2a3
         5fFnM/IHyVxfu2H15b1JJixxmgb59LypbvFSijeK0sv1ZVlskAgZwK61BP3vjnO72e5i
         00zDvM5AX5l3NBv9Xv/Vyr12VtGDygaqhLRpibW1PBX/rAj8g1ToALIPVnv6LNwMzCBT
         tu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775143056; x=1775747856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FdvV3uoZ82XkebWsgkeF8rl2q6Pk7QwD6xIvmUVJSs0=;
        b=XgN8aRttJhAB1CcoUQ6dzlQMUdI4Q5DetpAIFQ7qdwOHpDPrUdyw08lg2/Dwahq1BI
         24qHTmdtAgxPigc/zyzBqzwFOmV34oL+stT6jTtFmMkEsqhJkoadtx+WB2dbISRjTsy3
         xOMViaqqDT+nOioofTEqqAuwCVN+QPxzs2QhaGwy4iKdmOTZ0052nVIHS4kZsyywruxX
         vrJ+nXkY/9uuqf9ho4W1AdsbUcjiluwezqwxWaFw3LYBU8mwKGrK3uIZQ7b6EqeI/VIU
         BJfoGNrlSYlmRbWKIB8zKh7epPUuPhOIKAv/oRXjiM72K1bx6/O6IRdkd2yselsQNfn8
         6dYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjf1/czPoVFNgr5b9H4j174gkD7eD7jMQDigzb0QyBwe7Cum7GlaOPPCyhAoQd3j1ev08ESEalw00mrf7hm5G0YR37OQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQUb2Nkyc7dgEDMhslNgN4nUW0DRTXOpDP+dh2cRE2vn4Q9q7W
	U28xWnkqcyElR4mp9nl+hF++wXHqYWh7VNIOmRLg3NbtmNS/b3qbRAIb
X-Gm-Gg: ATEYQzyJ8pKNEIhRAievFbJ4Z53U+AdHw6nXUPyiqFr3QRmQmhq+WFszmK17u/Xo51s
	2Vu5YNvHYQH3EXVB09uzt3lePkKJ7mstv6Wi7ZG93jKnw+4OpTewNv6KYdEltzmQwYb9rsgSL0n
	WorgWCvE3GfCsNkYjL8vhO6fgIDgBWRvNv1+501jTE8l7FPrQmRSQdGWmrPDjs5nR+AFePyVfzz
	8IZp5k8ybZM1eVHb0z1PgaXcK9bICMw+Nt85q8PtXrFBrjhdrw4fJ/VvqxB9Zud2AfUOImX+EDQ
	EBiHbesQDRJqXnENF+PIlnXaDtLKZ1Uix27PoajpnlKw9WkxImSTnfgYUHUD+VQF03qMZ+nCW36
	TTav0fND2RyrhxkUz9cBe2RbCe3MGrFf+Vej3rn9W7QI2P4dVWNn1sepgnDmnLD9XpreLgrVfMK
	MqpD72606o/0KYj7+LWR9EqcjkDePwVfRAHNQnn8moM+MG6mwhOVHy
X-Received: by 2002:a05:600c:c107:b0:487:59c:2bad with SMTP id 5b1f17b1804b1-488835954f3mr96635585e9.24.1775143055669;
        Thu, 02 Apr 2026 08:17:35 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm327405075e9.2.2026.04.02.08.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 08:17:34 -0700 (PDT)
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
Subject: [PATCH 2/2] iio: light: cm3323: use dev_err_probe() in probe path
Date: Thu,  2 Apr 2026 17:17:30 +0200
Message-ID: <20260402151730.18901-3-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402151730.18901-1-aldocontelk@gmail.com>
References: <20260402151730.18901-1-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace dev_err() calls with dev_err_probe() in cm3323_init() and
cm3323_probe(). cm3323_init() is called by cm3323_probe() ,  so using
dev_err_probe() ensures that deferred probing is handled
correctly and simplifies error paths.

Remove the redundant error message in cm3323_probe().

Tested on a Raspberry Pi 3B using i2c-stub. The driver probes
successfully and successfully read integration_time after this change.

Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
 drivers/iio/light/cm3323.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/light/cm3323.c b/drivers/iio/light/cm3323.c
index 0fe61b8a7029..43c2929fc724 100644
--- a/drivers/iio/light/cm3323.c
+++ b/drivers/iio/light/cm3323.c
@@ -82,20 +82,18 @@ static int cm3323_init(struct iio_dev *indio_dev)
 	struct cm3323_data *data = iio_priv(indio_dev);
 
 	ret = i2c_smbus_read_word_data(data->client, CM3323_CMD_CONF);
-	if (ret < 0) {
-		dev_err(&data->client->dev, "Error reading reg_conf\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&data->client->dev, ret,
+				     "Error reading reg_conf\n");
 
 	/* enable sensor and set auto force mode */
 	ret &= ~(CM3323_CONF_SD_BIT | CM3323_CONF_AF_BIT);
 	data->reg_conf = ret;
 
 	ret = i2c_smbus_write_word_data(data->client, CM3323_CMD_CONF, data->reg_conf);
-	if (ret < 0) {
-		dev_err(&data->client->dev, "Error writing reg_conf\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&data->client->dev, ret,
+				     "Error writing reg_conf\n");
 
 	return 0;
 }
@@ -236,10 +234,9 @@ static int cm3323_probe(struct i2c_client *client)
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

