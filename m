Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBE12D9EF0
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 Aug 2025 18:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756579413; cv=none; b=po/ueXYzqe02knpWRK6PJNRw6mv+hJ8ZcZrL96erb07vbwqL7rG+PJeKyleXAjcs93ysBFwCazZ7JkShwLBz+R55lNfI/rCQVj8uJF4vbxT8UZT3S13bi+Dko75pxAR/FwsCHpSKolUunufALbLW20aO1/Ks4Pr/ZsfxvHfKoiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756579413; c=relaxed/simple;
	bh=S+oKo2tgTYiLtkAAs/iP4uzBUDKP2L0uoFWdETTsrIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lOHGgeoFLu2+gdKk12Zc8lD+VXD++qTwkTntaxFCocZFuVN4EMcomsz0gRv+AbDmfoPobaQZFE0mtXBIJ09OIHuFY3lN9HpDGmny4x5hiH6mOoePtr83jzPMVhiJoByl6NUtK7jcUQJcJC2eUj5N9aMems0m9uEwixsjVhcy8QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWkoRmhR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWkoRmhR"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2489c65330aso29836325ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 30 Aug 2025 11:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756579412; x=1757184212; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZOnwZekOaDbGKj3yK05lCuGyy6Vu2QerK6bAmRqEcs=;
        b=gWkoRmhREccgWb2pXe7kLbBKHTcoAg6YJQAVHY20rIYoZrvTOddA9kD40umt1jl2r5
         91+2i7iiygHnIo84m0Lq36BTnjtL90AKSzTpc9BYwfVu0u0vx59JYdjtPQej/h9VFhxF
         YXyQvapTK7dntOqdw9DDMZxfUx05m5ZW4J8sd1LgVcO9hXPeLWpfvo4qYctVqUcEoV1D
         8ZshBRkARlOJeV6UAC+UAPEAg60IQv6h+7soPw+yS9DjAJopuzkwXyO6Lc6FS/8GgGL+
         uy2WXjkkfW0gA9qZoXU1oswEyn2L65H7kIgXid4yMG3y8a7f9dbIPp0ubd6OHj7ZwG2/
         ra9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756579412; x=1757184212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZOnwZekOaDbGKj3yK05lCuGyy6Vu2QerK6bAmRqEcs=;
        b=oZbENfyzNp/ClB8xdnktl71qbj3+0i+9E8S3yFJOhgso/NrF+WO2nZsuCLyq+mYQ3u
         dXl25IhlYteU9heHrgCOThYdnu9G/4l4q+ljEWuBnvvixtvY+D/EqaZfHgkKzzL8kiZ/
         J74Hi0U6IGdp5dg2uE74QXDEY4MllnT7KSXz3AWinAJlNFwUmWicazwOujPwakC2aCv6
         0j3AmLjqVLamScUNcE90pBZLfPW/G81Jt1Kk/wmEXuI82XcyhqaXomMxNIUEHBYsG8Lq
         DUzTtKL1MH0+3ENq2PEn0R8jou4WvDQg4b3tL0IA9t0e+mco9nuFxiXKnT7+IodYTP1H
         aDDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBUe6jGAYRCY4RRBWu33Ao1gwiTHVbhtIQEVoZ51GN5xwPwftyAV17p+3Vu4+Jn2DZ0pMfYjUEDimDFLpqD1B6CYLyvA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzyu1Y02ABqn+sM1ncCDMOGtlZmjrVO9R9dXeKi10JUadH5hu6B
	IZ/JgSI//j0DHHEyT3dP5hkjw5hPqozxWbtiyfvU7yL2IuqUl2JYsIhUseE4jCjA
X-Gm-Gg: ASbGncvWhba86G7TMSM1dFCw01aVOeLw5yzTLDErV7JhmmCOxCDgEZcL3jO71j6lQO3
	S7QEnnhVXzhiDkbtN1uqevNT+DFAPK6ym5dnibEpGbcF0HY/G/2j+VBjw31j73c0kZoeD11DgnR
	EPoNybPguhFoiNhNgOIOYVD2y1jTwI86/zcHgxqeS0NJDKRQyKOcjNnBX2ShTOsZMv9cc3+adaY
	8bVKzOpVB8N3ylVulYKzot5YGDklJIC1idQa8NWGwGeWovZcGqW5MfVEA1B2hPk1gRh4oKTThlC
	C6Q5gurSCoZpE7VeX01Cw04PcUMtqMEYdI4FJvlX3tgqacg6Nxgn3T1E45lPTpE2eU66tgBbyKd
	Azixolj2pJ2JW9Se7QZ1JHJPUJ8WUrE3UXk6AzYaYwFf5QK7u
X-Google-Smtp-Source: AGHT+IHYGOm5+YbIns6Gdfpp1RfTrqSBfQ1d0sSMr46tzjRBEaCKJ+Lss28VIdCdoXY0y+NbqqF78Q==
X-Received: by 2002:a17:903:2302:b0:24a:a724:717f with SMTP id d9443c01a7336-24aa7247fd3mr7687955ad.47.1756579411724;
        Sat, 30 Aug 2025 11:43:31 -0700 (PDT)
Received: from [192.168.1.19] ([122.177.240.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490658999fsm56821665ad.112.2025.08.30.11.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 11:43:31 -0700 (PDT)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Date: Sun, 31 Aug 2025 00:12:48 +0530
Subject: [PATCH 4/5] MAINTAINERS: add entry for inv_icm20948 driver
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-icm20948-v1-4-1fe560a38de4@gmail.com>
References: <20250831-icm20948-v1-0-1fe560a38de4@gmail.com>
In-Reply-To: <20250831-icm20948-v1-0-1fe560a38de4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756579380; l=899;
 i=bharadwaj.raju777@gmail.com; s=20250830; h=from:subject:message-id;
 bh=S+oKo2tgTYiLtkAAs/iP4uzBUDKP2L0uoFWdETTsrIo=;
 b=6z849XXWAt7R7rAf/Yg/X3SR9rpCOP6A4q9xnBBV8HCU9Hnwm+pGJNaXiAK1ltmo7PYZD+5a0
 wTwk6br0iv1DUfwZl6UqcHQf9G7tzzNloftBTO/ert414NRKjoMKtgl
X-Developer-Key: i=bharadwaj.raju777@gmail.com; a=ed25519;
 pk=s+pP76EgUCC/7pyu4E6Q5AizWQ1T6hUf1jUWrQRl040=

Add MAINTAINERS entry for the InvenSense ICM-20948 driver in IIO.

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa45799dfe07de2f54de6d6a1ce0615..930c80c1cc40a4cfb4bf270e1ab7680b88d97ff3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12783,6 +12783,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
 F:	drivers/media/i2c/isl7998x.c
 
+INVENSENSE ICM-20948 IMU DRIVER
+M:	Bharadwaj Raju <bharadwaj.raju777@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/imu/invensense,icm20948.yaml
+F:	drivers/iio/imu/inv_icm20948/
+
 INVENSENSE ICM-426xx IMU DRIVER
 M:	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>
 L:	linux-iio@vger.kernel.org

-- 
2.51.0

