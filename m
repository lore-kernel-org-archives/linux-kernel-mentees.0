Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DFB43C7DF
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Jul 2026 10:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110269; cv=none; b=NyD7JLWZmykY8FIqz7vMGhEsX9doXLUwyNie/WYW2zNXB/zDWu0XIDseUtuZOHaa6h7Y9CPmyfjVpnj4GDxtbWaA+w4Wxa0GpDN/1tXnesWexVZrMzEkXVFBpcKruTkdB/46X4k8pDRxd6o4mfwDncEoosnb1uBogPS+xBt7i5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110269; c=relaxed/simple;
	bh=td8hsDBlRWSg1I0yceKl73dTjjAo8acQBy8lu2qEcxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJYRuA+I/DHxHM/or6+86xSHYspGPjKo9TXNmMPzMsvzmRqt88Nz6G/FqzlX146bwcn9AfmZN6Lz0eqnaObTobeFh5GqQS8jinWihS/fO9DqYZWon0X78x1b18U9FQORRKH3tPserhnuxL6yTHJy5CMUFdH+IphG5lCnBfwtOQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncKyPIkq; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncKyPIkq"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2312998a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Jul 2026 03:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784110267; x=1784715067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AtJCx4n0Ha80Zli2eWFQ1VWt2rCUOGYpij+i9kLvvo=;
        b=ncKyPIkqzG8ME9YLQyypd56TCbbbZPiKWQdFq4dB9ciTo4k3yegcnUU0O/xFueT5bI
         v75NDnyfUmlYrt/LlpGHi1knBvsTqromh6iOO4QCdiFv3AwK6Sf+omD0AsremBixNgw6
         y73CzFpVSI+tlBwp6jFgYy7WIy44D3yloS+DdkA/ri/6AaXWDv9z2gJYBCZqSjzJqmck
         y3txveZgyQpLN+tyztc+8WlFBvMrng4Kyt3awvGsA+KuHDX6Vehp7ZbRrAHHy7/m5jsl
         8hPKKQZ7gZmOx6fqe/aYxnYynjKdh7Udhvy46WVOIkQ38ayZKicRGc657PthXJuvoJ1e
         kW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110267; x=1784715067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AtJCx4n0Ha80Zli2eWFQ1VWt2rCUOGYpij+i9kLvvo=;
        b=E8Me9M1s2AQiOTlheDFMO0pDSBa8BBaRSoYCU7GSkPqbE99OjiKKbVzGzT1sG/0t9R
         Y1qWbYNdYJ6eJCeG+/aRz5vC2LZuw7UGyJR0v51iLLGY0pQjo0lwCwJRb6mqNV5kpRss
         VgWSu4v2UfBNdk3UzBw2QlMr7V09D3JD8ubYpbB44Oq7cLyXjp86JKktIaB5y9PNhZCI
         VwqcIo8KdkYSSWDUcvAUouQ8GpJOrKyslBhSPSrJmhcosfzmMlYslBMj32rjUfmlV18U
         lkcPE3boebCjeLNRRitwR+zHSbRdc0hbaV/0x6GYnpvYj0/KJcu/OSoco8qIVhd4GCFX
         E92g==
X-Forwarded-Encrypted: i=1; AHgh+RrXAkl0LA5SmfZUCo2c3dIVgR0BElPXX4Y4uKiMT6YotMCBTzOKu2G0DliYmfNFqIB+kSRLLJa02OrXoKvJpm9kjv58Vw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4al3435u+GFQinXU5MCC9VClCYpLgUgECti8kp68VxP5cN05P
	P1TqNfi+dI+mpliNYBgMV3WScz0TdSsuNyGAR/AJaVudECpdpCCyxiTs
X-Gm-Gg: AfdE7cm8tR+T66g68xV9pYwqVbspi5+k6QGzSFkM8kjZ5QnBsqt34K/9QMOCtfqmVrl
	U+YfTZXJO45rap3xnOGBfjhHkNaed7wkRpgzFi/GuHK6jlMnVSqpp2ffDMmUndhCsY40HX/WVQ/
	sYpLSmC7618Ea69N2gIHHlbYXOqWJbfvrJEzaFzjmwchT20Dyyz57+ZaUWh862PrAbfR6KXRRsd
	3Q2gnXKLebWASOzsLsJXmtIBv11tAhAYnBg4ZBagyXY/Jcauk9IUM+DQh0dKu5WnWOXxWuOCk0y
	CYPvhKZiVL2Ie/lSuzw/g22tYZOWsvpnAPCzeeru29uE5g4lrUHP5qjMgsF0InAMpow9ePrEvVw
	CfwTTGDHD6x0Z7uUf/W2F5JOgy6k6X1T4/94RsWHqg6734aSFUAv0FoSMhoBvLKmDmS5kXCF4Mb
	0nxu2pSI7fOq2vI2ZOnfsfUeLH2fVyKT+b+/rNB/w/
X-Received: by 2002:a17:90b:498f:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38dc77384c6mr15626367a91.23.1784110267074;
        Wed, 15 Jul 2026 03:11:07 -0700 (PDT)
Received: from primary ([223.181.23.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm62079757eec.25.2026.07.15.03.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 03:11:06 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Per-Daniel Olsson <perdaniel.olsson@axis.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH 3/3] iio: light: opt4060: Fix incorrect register name in threshold read error message
Date: Wed, 15 Jul 2026 06:45:44 +0530
Message-ID: <20260715011544.281148-4-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715011544.281148-1-vidhu.linux@gmail.com>
References: <20260715011544.281148-1-vidhu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

opt4060_get_thresholds() correctly reads OPT4060_THRESHOLD_HIGH, but
logs "Failed to read THRESHOLD_LOW." if the read fails. This is a
copy-and-paste mistake, as the preceding low-threshold read already uses
the correct error message.

Update the error message to reference OPT4060_THRESHOLD_HIGH.

Fixes: 0c6db4506ad0 ("iio: light: Add support for TI OPT4060 color sensor")
Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
 drivers/iio/light/opt4060.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
index e3aabfb14d5d..f79dd342937d 100644
--- a/drivers/iio/light/opt4060.c
+++ b/drivers/iio/light/opt4060.c
@@ -810,7 +810,7 @@ static int opt4060_get_thresholds(struct opt4060_chip *chip, u32 *th_lo, u32 *th
 
 	ret = regmap_read(chip->regmap, OPT4060_THRESHOLD_HIGH, &regval);
 	if (ret) {
-		dev_err(chip->dev, "Failed to read THRESHOLD_LOW.\n");
+		dev_err(chip->dev, "Failed to read THRESHOLD_HIGH.\n");
 		return ret;
 	}
 	*th_hi = opt4060_calc_val_from_th_reg(regval);
-- 
2.53.0

