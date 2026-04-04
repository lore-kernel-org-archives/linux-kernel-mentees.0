Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49C632C957
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  4 Apr 2026 20:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336340; cv=none; b=QFJZNVuM2G+sbQFWdpOfLmYZCBSv/SJo5E6XtBJinJC3j6PxzApwIEZnrHHU32lrwLsq9zL2jClth8Wjfg18iuwLKywRT1SX3SZKUR+iEmG4yNyoAj8MXQX8THGzdnpvVCz6HPLp79l6KLWaVQIj3KvXRLEdqZIl2Yi+Hxh9eEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336340; c=relaxed/simple;
	bh=PQurDO6OXhnVPnvpUtqOGS5FT+WIsaPPR8yY5aKiW/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+9sSQa69GDx9UUd/6NNQRvSow2MpM6YfII0A2LsnF652sy0ygwfOod5StbcIgdl47b2yNFiE1AABVaYv4IQVeg+aKoSiHK1Z7Nd+/LljRsyVv/KNuXVvAi/uOMmlhRP3E3iTzA6XHPSquM3EPZtC1uxRvptX5XuOeBrYZhFPZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDATh99L; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDATh99L"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a04f39d2so11579115e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 04 Apr 2026 13:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775336337; x=1775941137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPUiQBF9d8UvPDKEpZeV7b1Q9KHNeEe04jRYcpwMjow=;
        b=oDATh99LAmyZ0Uot9lLX6g1Q2VZvYAgYTIZC0XEc1nysjS4XThIV8xtg8OaeyVzvzx
         tVAQn86EAvnly1aqJX6nCNr+UCvZm2SYy8Wh6a8+isfH7l+Go30ZZOOe8jckxBHXmwgj
         JxrrM6OUqV9dakFHDSEld3nuhIo+LheNtKlEOT0KvE1ukUHBcBsmqS42gOO50uGGNx6k
         t29yC8b9ycYnmo4wK7EFE7WBhsCSYZk/jGh4zqkEy57mz6VmRaObv/dkivwGw5O1bJ8G
         /Oer8vDukknwgKdYJCpL+Uy03TyTFpmfpJ2hvjTwO0Io5rXEezkQRlcFzvmJ4kWQh0zt
         r4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336337; x=1775941137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iPUiQBF9d8UvPDKEpZeV7b1Q9KHNeEe04jRYcpwMjow=;
        b=NzLH1/yb6zsaEjjINeHWh/puvRvkkmky7RmxVo/Ybb0NSIC1cdtAY4uJmRznYtAGGk
         Q/rN/1Q2tp4vFL2fwn9LdPXRRYCE4zI5JuLR3b5SMliOSSzzcYEOSFaTdr9nIWsg81WH
         kJcvX6HfdbxMvOTcJpG+/3deS7v8Atvyh8UCoM6MNrX1LE+jmI3mlKYxiS0DhVq/85wA
         Ai3oaWcqFYL+afm0iYvRctkSJBZ+IDaUMFMCk1j7naMJueSgCqWB3ZcsxVYCcL/75NzJ
         uqgDsTfox4fB4h2HSNtOqEFm5m0FAuk94brDKMl///8ZL82YyElhVzwB1d7q43YsGDXc
         qWEg==
X-Forwarded-Encrypted: i=1; AJvYcCUJBjmYVvy5AMuQLNXVTnvgDah0DrOVdjdpO3uesJufUmydajtz88page4f+axBvVuPcFWimRorDQks2Q+jGzuczcjH0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7LnuKib/25G/Xv2LOVig0yfArVVgo5fgULSY5/uj9wvlnMagD
	dA6uT7qdoVrIXB8LpIeumIGwE5EghSMLp1swClMp5pJAtVRY3HIPA7p3
X-Gm-Gg: AeBDietwUeZtF8G7ryiwcY8Le96IE/0raGy3UwbZLPYEpQPOu7rj3c+OCIpyS2IZEe2
	UnPIZ9qYK8KfZqgaw96ozvb/cwi67TxR/H6CakhmAk/ubOj4M2FiRsR+aCrcL07fyVmNQ/2kkZM
	+7BzyeD4bESuo96hnQWKMbv0fQNJhdV/LFk6mrQdkhJLWjyoV7Uz+ewCk5ri7kcVZEI34jZ12kG
	cryDGk6gtmO+gzp3hqfhw9nI/MfZOyjkHQWsZA6dESnNzc2ZtRie/oFTJOaCvl3bthoMFGUK/me
	1+RZ1CIEViZ6yKA2p0IP0/Ks993lwZ1pB47+WBF0kJUOJsB46psUIwUJBHMfwWCfC3EIbcqCdll
	Fqs8u7qL/1RBT37XbGSvwNIpKHPJqj5koB1EuFUfa+L/LyttpBx6CEzgUInzagrJFrPX/oNE7+y
	ITtjKFvxVaGC5bBQLV2I1j409FKmzhDiFJDOUEB5E+oauHxzXDzQWU
X-Received: by 2002:a05:600c:64c7:b0:488:a8f0:35bd with SMTP id 5b1f17b1804b1-488a8f037c4mr30177285e9.8.1775336337032;
        Sat, 04 Apr 2026 13:58:57 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([94.164.143.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a36f22b1sm84749535e9.10.2026.04.04.13.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 13:58:56 -0700 (PDT)
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
Subject: [PATCH v2 1/2] iio: light: cm3323: fix reg_conf not being initialized correctly
Date: Sat,  4 Apr 2026 22:58:51 +0200
Message-ID: <20260404205853.18559-2-aldocontelk@gmail.com>
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

The code stores the return value of i2c_smbus_write_word_data()
in data->reg_conf; however, this value represents the result
of the write operation and not the value actually written to
the configuration register. This meant that the contents of
data->reg_conf did not truly reflect the contents
of the hardware register.

Instead, save the value of the register before the write
and use this value in the I2C write.

The bug was found by code inspection: i2c_smbus_write_word_data()
returns 0 on success, not the value written to the register.

Tested using i2c-stub on a Raspberry Pi 3B running a custom 6.19.10
kernel. Before loading the driver, the configuration register 0x00
CM3323_CMD_CONF was populated with 0x0030 using
`i2cset -y 11 0x10 0x00 0x0030 w`, encoding an integration time of 320ms
in bits[6:4].

Due to incorrect initialization of data->reg_conf in
cm3323_init(), the print of integration_time returns 0.040000
instead of the expected 0.320000. This happens because the read of the
integration_time depends on cm3323_get_it_bits() that is based on the
value of data->reg_conf, which is erroneously set to 0.

With this fix applied, data->reg_conf correctly saves 0x0030 after init
and the successive integration_time reports 0.320000 as expected.

Fixes: 8b0544263761 ("iio: light: Add support for Capella CM3323 color sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
Changes in v2:
- fix typos in commit message

 drivers/iio/light/cm3323.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/light/cm3323.c b/drivers/iio/light/cm3323.c
index 79ad6e2209ca..0fe61b8a7029 100644
--- a/drivers/iio/light/cm3323.c
+++ b/drivers/iio/light/cm3323.c
@@ -89,15 +89,14 @@ static int cm3323_init(struct iio_dev *indio_dev)
 
 	/* enable sensor and set auto force mode */
 	ret &= ~(CM3323_CONF_SD_BIT | CM3323_CONF_AF_BIT);
+	data->reg_conf = ret;
 
-	ret = i2c_smbus_write_word_data(data->client, CM3323_CMD_CONF, ret);
+	ret = i2c_smbus_write_word_data(data->client, CM3323_CMD_CONF, data->reg_conf);
 	if (ret < 0) {
 		dev_err(&data->client->dev, "Error writing reg_conf\n");
 		return ret;
 	}
 
-	data->reg_conf = ret;
-
 	return 0;
 }
 
-- 
2.53.0

