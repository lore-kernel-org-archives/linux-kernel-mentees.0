Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36D21D435F
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241358; cv=none; b=tKnkjnwCw50RiGrHPoVjhKqFAvnTCG6umkQMiuNEJxMi8/kfUOGjs4PcnvUgKtpLQg4Du2noYuLbqMJ8s9oby2n7+Lb9zlcxVG0EVjNoM6gEA6zix5APCrXDPxHHw88ZzhrWhutlJ8H2N9FIURGDusDL+Y13SgHCrwJg78vpYWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241358; c=relaxed/simple;
	bh=vqIN4spBQeK7QHzc7uNdXC3miJFucfrtR29H2awIC94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h99Ok0TGmxxo7oOt+XFe4s9JajUtoBkzFXWAhep8SzU5dsC3DIB6nCeBKtDloATG84LS4EWzkLq/csLOS+HfFM2zMt/A+MyC2jQ5pHmW0177NPHHhChwDQDkpCQS2JYcbuIXV8y1PehAOgT17n16o20XQrTTHeMTUdst2htcZoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGfLjbBf; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGfLjbBf"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ecfc7fb2aaso38141516d6.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 06:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745241356; x=1745846156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o004w6PxOK9088i8LiB4BRrBgsNqHpUt0xgvZEh56tg=;
        b=eGfLjbBfxPNBduxZ5WPNgS5mhHjd68NUxCp8GqucVjuO5uBH2nut/mha0FszMCOhxD
         jNDq0uMQTJp8gy7DL4Eb/J7KVp31SUKaDZb8c8gTBpPDBikrneWqfPyOgVWMMhsLvJPF
         EQDvpChpxaZ6hHwvy46cg3GzKQ/8W7acsC1gkoXDYds+zYkFcLxMNZ/BpaNU0ou1+Zgc
         9m2zuk3TXp4T0jCL36+pr6ByLdRMQzirP+dHWBD0Zl1X8W/07+l8rZ+/Ac30slMRErLX
         Q+kJo9oY2dGUvoey8dfG8GXQNTq1o8c17kAWPwEowK6xM6BcRaUljnbYVbNUHwoou3IV
         7Gnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745241356; x=1745846156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o004w6PxOK9088i8LiB4BRrBgsNqHpUt0xgvZEh56tg=;
        b=VMxqNGZJJy25rF134gCXASigoB0dR7vV1vJ297YaA9O+3hb5Po8rBSdzi+5yqbOv8Q
         1+Pd1ZbOegxn7f2C6Q6DZJh3QR6EwK439f98ca4Ewt/JeOUmqRWSrJU+KZjZqvDiSXh2
         b/OOPWYLyZTMjXmTbEfXrF4uQ+AySw/2V2wLK4HWmWanDBOGcbR+fCALvGyPkcL1lL4F
         UiZK4porlr4iB7glqfM1wTAFK/AxGqpg0rqK4me3fddC+12WjQT0XG6HcHxESsHZ8JTR
         tjM2iU8fxZ+lvsdAqGs1lltt2A4bRRR0YwSmsN0NXuTSmQWREKe5rZZ6SsqAj2R9z0cr
         gW8g==
X-Forwarded-Encrypted: i=1; AJvYcCXG+GhWvtEQIapMlyhFyGhxDjOeO98lixe1TJJhrmad6PJPnX0le9YAKmhFnRyn9yWletsP5wxocCQl/oOkgdjFo2enaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoAZ7+pvExSmngmPhWEqSpHF2HRPM5WbMayJK88ngZtS1OhRD9
	osXZcZ/NdD7DhE/OirtvSVVWGrabupmGj/h6ZArDTOyBD3uZ0676
X-Gm-Gg: ASbGnctzi2gUVdWZrAg1wBroGnAO05Zbxu0lUdXJSSJY7HU8/zpksDZph5YnVp6YKtO
	8fuPVKYlKWu2JPJh74i63kBnCHgSm9A7hnG6GMpu6Em3t22RKHabZkskZWFR1cTJQcEP4aTgNhW
	NRBnlmuWDcS7LvkFAiBLi8TD+cIv1O2jHwg9I1ETBJRPB82uCU3PdkWTZjrf7FAfb3f+BOEvCJA
	HyCYSN/x31t+fbHXb5ZEt2wEIuoBv290msr44C916kTHQWvHRyuXn6ulVatU4QBTqDiLRnJA1/l
	XkABZwEo3ZbQylL7v+gHcFPlD5nEqhwCJ34AW7vJ7JsZj2qa99qo/RH9ME9mXah1wg==
X-Google-Smtp-Source: AGHT+IEWBfCVAOXcUeFF/010CnRUb7fPPxCRQbrwrjJ+7VllZ6Ahm19o/N9f/euG42Wg9GTMhpL5NQ==
X-Received: by 2002:ad4:5d43:0:b0:6e6:602f:ef68 with SMTP id 6a1803df08f44-6f2c455698bmr277444346d6.10.1745241355667;
        Mon, 21 Apr 2025 06:15:55 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c21d3asm43579276d6.100.2025.04.21.06.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 06:15:55 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	marcelo.schmitt1@gmail.com,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] iio: adis16201: Correct inclinometer channel resolution
Date: Mon, 21 Apr 2025 09:15:39 -0400
Message-ID: <20250421131539.912966-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250421124915.32a18d36@jic23-huawei>
References: <20250421124915.32a18d36@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The inclinometer channels were previously defined with 14 realbits.
However, the ADIS16201 datasheet states the resolution for these output
channels is 12 bits (Page 14, text description; Page 15, table 7).

Correct the realbits value to 12 to accurately reflect the hardware.

Fixes: f7fe1d1dd5a5 ("staging: iio: new adis16201 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/iio/accel/adis16201.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index 982b33f6eccac..dcc8d9f2ee0f1 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -211,9 +211,9 @@ static const struct iio_chan_spec adis16201_channels[] = {
 			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
 	ADIS_AUX_ADC_CHAN(ADIS16201_AUX_ADC_REG, ADIS16201_SCAN_AUX_ADC, 0, 12),
 	ADIS_INCLI_CHAN(X, ADIS16201_XINCL_OUT_REG, ADIS16201_SCAN_INCLI_X,
-			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
+			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 12),
 	ADIS_INCLI_CHAN(Y, ADIS16201_YINCL_OUT_REG, ADIS16201_SCAN_INCLI_Y,
-			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
+			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 12),
 	IIO_CHAN_SOFT_TIMESTAMP(7)
 };
 
-- 
2.43.0

