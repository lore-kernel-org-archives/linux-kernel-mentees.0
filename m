Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DE322CBCB
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 Aug 2025 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756579394; cv=none; b=Zll1a877lpt2RkHmrwP+SDKc8TNPmU6o34fuGf4Y50n4zMEWPN2eVbwPwG4Dy5L9fxN8k9aRKMr2QDIFTeFDJQT6dlbacncDw2uz9/bNk8GSq9GcMJ4JR8ssrNEjtPFQ1aNe/8BjBgKj2uxyC7dZyBvIP9TX8I9zgeMKQlpnSTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756579394; c=relaxed/simple;
	bh=NuigVOEZ/cYqOt8OMOvaJK9qIh6+nyF9VkvmUAda2Ew=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uJlMR+Cjyg8tRBBY0T6pqtV4Tj5M4Vfpt2j5HhTmDcFJdGuKrj01rXngWbhK9aySt6mVGp4r+NTFcCAipviRPjYCeF9+f4vKBqiHRiN2e88LRUUXKON36tkqGSz8ncKraedCOJtknjMbmryEMM6NyuEbgBJgU6lbYL2tQpRHhP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kxk7xZ0U; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kxk7xZ0U"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-24458272c00so33605695ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 Aug 2025 11:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756579392; x=1757184192; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lYREeVlOdDs9rQ2KO1/3o8IfJt1R8n4X9aqIPV4hwak=;
        b=Kxk7xZ0UcHIu+SE9QymTJwuVGcADFYOZxZGC10fXYMjkSctxp6aBz3Xuy12Db1zHm9
         bo3yskb75HS7TudOEBP/iy25cc+esCOOZArEX+aJae4b4u/IsqclWaqQKyU9gWJPhZOT
         tLqW/x1e+ii25c7AZ/x2fUA13eYwd9Bn7fpADiLxnpVu1B7fsH3JaywrT+hALDQL8gJL
         zhsy0mfn/CmVMOF3wFKlTetUGJgDcdkWWZRES8BCDaejidGH1zsl4x63ltZjwIqKQljq
         1IJmNvUgG43Yq0BVur3bIkxcilThXGJvp24Vp6eeZCICm4xykLTDcmgQ0YQhuKo7bPi1
         IRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756579392; x=1757184192;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYREeVlOdDs9rQ2KO1/3o8IfJt1R8n4X9aqIPV4hwak=;
        b=C2G1c1R9rU6aQK0Utz6TX/3D7DmuU+wKajAxVvhSHappaqbShubsb0aJ5AGw+ugdv3
         JdG7Ae1ff2NL5FOPN/Kpy1Jk9gPtVnWaWxaFC8m9pitcPSsgA+9eovUSHCnW8tP/0OmA
         HPr8iLUaj96R8W9IS0SUEl3+SqbyWN71ljPm+hPmVLCSFRaqi0T7hK0+M/0oOSFbo9LT
         9RE9LehD3di8H944jOcz17SeabzuTrGYM4Oa4iOgMDovchZzWUoY9RK70qBDP+zuYs3h
         uD6ajgWVtRuec8bf5xkiCP3njVqdpYRbOSddZYBPWmNBmGodYeoyjYsh0j4ADVs4o+rx
         8pcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO/gV34j+/2q33mTpFNDHdXzKYn9Rv93DYbNwkGs+7uhcPVBChZY2JyQD8L3xdZkOrKtxT0KA+FtdYz1GciiGDcI9Z0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6eG8CIi1FHfvYypfyTPm1Hn4y4nRpX8KjJu+ZQHx7fSfnfhMb
	6EQcq9pVvZwMeb+LU45jiNn41BWGeDcnLrYsGTkToErogU8gcqpiyOJL
X-Gm-Gg: ASbGnctvkVILg5sguhcVy2xDS8SVnnChWHvwHV0rgp8Kb5K7fUgjMLOhpEr4Mf8F0Xf
	0UYkGBRh4yheqhwtW+ddx8gj+/Ux6BGRsgO5f7mMxh+3c6NMXWiZ8aCkjx6nnOqYtoWWmFlksT/
	c2MH++FMzDmySLreAKlFJmw+l/TdMNJsJx6GtZWf9bqHfPXzokgGagkGln6PbcZqOh1u2VqJzxA
	AuB5XYkg5TFvsd2H6HRfl90+iefqY8uXAAcuXUw25vj100thjmyw9f77cnJ6K+UjoQpqIi/B+y3
	0dcSgodZdURt5jOTRl+ukqfYB6fNAaph9MHc/J1oR1Hfh00b+V17CY4KRkCFNmBn+wK7H6q/Mdx
	qjaEyjHQ3/U4FgPYwY1eoN5HQqFnxdnpDxh+JiAS+S8p2vI6tsqJMoFTRnGc=
X-Google-Smtp-Source: AGHT+IHT4nSra45cYGgNoSfIe6PhXzKr9iGUKs+Jrx6ss6kBH7JdX9bqMR4ggGI0HK1hOye7ql4ZGw==
X-Received: by 2002:a17:902:f642:b0:240:11ba:3842 with SMTP id d9443c01a7336-24944a9a70emr37334285ad.35.1756579391915;
        Sat, 30 Aug 2025 11:43:11 -0700 (PDT)
Received: from [192.168.1.19] ([122.177.240.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490658999fsm56821665ad.112.2025.08.30.11.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 11:43:11 -0700 (PDT)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Subject: [PATCH 0/5] iio: imu: New driver for InvenSense ICM-20948 9-Axis
 sensor
Date: Sun, 31 Aug 2025 00:12:44 +0530
Message-Id: <20250831-icm20948-v1-0-1fe560a38de4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACRGs2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyNT3czkXCMDSxMLXQPztORkE2OjRBNTCyWg8oKi1LTMCrBR0bG1tQB
 0jghIWgAAAA==
X-Change-ID: 20250825-icm20948-07fcc432a458
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, shuah@kernel.org, 
 linux-kernel-mentees@lists.linux.dev, 
 Bharadwaj Raju <bharadwaj.raju777@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756579380; l=1612;
 i=bharadwaj.raju777@gmail.com; s=20250830; h=from:subject:message-id;
 bh=NuigVOEZ/cYqOt8OMOvaJK9qIh6+nyF9VkvmUAda2Ew=;
 b=ysbnyq7dGiZI9VE+RUh68FNyPZxL3DBVSpDPI+ewUk7bIYyc71WGdZJvCMF8IN0D4BnO3JYZB
 W+FvLF+g6KVA1fu9NhT2nSTOD5kR+pDGR1Xv+Vijq3UPLM03O2nwnU7
X-Developer-Key: i=bharadwaj.raju777@gmail.com; a=ed25519;
 pk=s+pP76EgUCC/7pyu4E6Q5AizWQ1T6hUf1jUWrQRl040=

This series adds a driver for the InvenSense ICM-20948 9-axis IMU.

The IMU includes a gyrometer, accelerometer, magnetometer, and a
temperature sensor.

For now, this series only adds support for the gyrometer and temperature
sensor, and doesn't yet support the FIFO features.

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
Bharadwaj Raju (5):
      dt-bindings: iio: imu: Add ICM-20948
      iio: imu: add inv_icm20948
      iio: imu: icm20948: add support for gyroscope
      MAINTAINERS: add entry for inv_icm20948 driver
      iio: imu: icm20948: add runtime power management support

 .../bindings/iio/imu/invensense,icm20948.yaml      |  36 +++
 MAINTAINERS                                        |   7 +
 drivers/iio/imu/Kconfig                            |   1 +
 drivers/iio/imu/Makefile                           |   1 +
 drivers/iio/imu/inv_icm20948/Kconfig               |  17 +
 drivers/iio/imu/inv_icm20948/Makefile              |  10 +
 drivers/iio/imu/inv_icm20948/inv_icm20948.h        |  92 ++++++
 drivers/iio/imu/inv_icm20948/inv_icm20948_core.c   | 128 ++++++++
 drivers/iio/imu/inv_icm20948/inv_icm20948_gyro.c   | 355 +++++++++++++++++++++
 drivers/iio/imu/inv_icm20948/inv_icm20948_i2c.c    |  48 +++
 drivers/iio/imu/inv_icm20948/inv_icm20948_power.c  |  73 +++++
 drivers/iio/imu/inv_icm20948/inv_icm20948_temp.c   | 115 +++++++
 12 files changed, 883 insertions(+)
---
base-commit: 8742b2d8935f476449ef37e263bc4da3295c7b58
change-id: 20250825-icm20948-07fcc432a458

Best regards,
-- 
Bharadwaj Raju <bharadwaj.raju777@gmail.com>

