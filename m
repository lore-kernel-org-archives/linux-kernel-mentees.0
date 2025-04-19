Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D2ADF60
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Apr 2025 14:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745073927; cv=none; b=urCUAkALRcuv65k2UP8HNIIkjgkacokj7zTvVvvJlsLFoNHdS+OIe8DtOMFCuOCccbWtbAgzMj9kWkrrWuTdwcfRClYVbGT/BzbxClBv6dfQxvoTJ8SwJc7MCEbun9mLNbjfW7pBU0qE6fz8Wl9cwPBidHqc0VblL8jdfQ+leFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745073927; c=relaxed/simple;
	bh=/iRpNdeJshI3L30q214V68a98a6RN866jsxqHPWRnZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DofhnMq59AuLJg/DFP3HcUGLnTBPavxwa4Z76fp7PEidy+JwCn6Q+FsCqCXjvEtgfR6gTvKSD42maSVzhsL6x0XZXytPTQ8jdSbItR7DzQ+vQl8m4htb3nJr8NGQd1ggRDPJjOEXZfqdfA1wuxETD8v1Dc6iXeKUBaLu7AmMAeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3Yxb2ZP; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3Yxb2ZP"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47688ae873fso27780581cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Apr 2025 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745073924; x=1745678724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TZwskAex2BRKK/3gla3QPoANYGHWeVyAoradRHdAXwM=;
        b=l3Yxb2ZPl/gM3i2d123Pfv6TTg9djTr2Zv7s8xSO5+oPmWtCgLUd9MGGmoNI6Oj1So
         rYOt8Mywu/VH7utp105MQkv6Blm+sW2m5Y29UajAjKFoqj7uj8j3Dk324jKIuMGYeyXL
         IQM/9P14CGCD2/Cjlb2MBRiQmSTa1/3tsyQ/zQDNw8NPRfJL++kzOrE4Lk3g/GM8baTB
         hAfN9klZIMedYiE8pogS/drBQrnucr33HNl5HtUamHsiZs5C125hZtxs5MSbpskD8lze
         9Ts5ekbW5qGZBvO5tEfkr3VagNZHi0NdP3Z+bG5w+lQNcg/eQyMHl5h3YZyLTG4PpEZE
         sJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745073924; x=1745678724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZwskAex2BRKK/3gla3QPoANYGHWeVyAoradRHdAXwM=;
        b=jpx0d0aseEM12qHFRy2zS2HDllnZZa/DfLfguFUATblp6Q276H7SVsuG3mA8+t2feR
         4CAf0rd5kfA0p9B0w9XTpICSWlw5ZmLg1Hbyu0wADbmeyMEAcEZyNPB0ruw35zkbJUuY
         6cGpbv/NNGxo7reL/vB5l3xpkq0aNks3UzR73VMqoMJs0w6cwxNGPZ5Q18ZLM9RB/ExW
         KODbGRAbUzAHAxwKsQG6kbFhb941wdJcVUrSMcQdvBlGVGB8i0QuzRGpmLzXbbCyZC7e
         1ThYa1QoawgN93xkcDcgUAwbzmAy7YTQ9CZYjDE1Lj9qTPgmkrIC1EJgaTv8hYOAdVHQ
         8gcw==
X-Forwarded-Encrypted: i=1; AJvYcCWNUsduLS6p9AOa2FmpWH2i7cLuSJ9zQsUDpgqHtHyJJJbGRq65NpKCQGqCOExuadtQEJU8ax7APh/kNLfveD7QK1t1SQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnmHGT7/JtYfjCX1SjXmC20xIVZ4EFbZAh33d7uscWiDT5dX9P
	MZ4u60y+N1vLCsWcZk7Vg7d8wOf1r/ELPGEZrBwbym4YvKaCQ/WB
X-Gm-Gg: ASbGnct+LK4Qo6MGr+YchMqwhTdlqXNtrIkpUodNAWkYvcVfIv/ne+ogoFnHgroHpyv
	EEmvpA3nH9+1m9BfWwzDmqVTxsJoUHny4V9Jl8kLPxiG8S6dBCVAIgyWi5lcp+XeglaPezqfhyn
	LDFy1g8jH84+QBa5N205SwcKrh1LwltpTbyCRGkKM3a3NRvkecRF4fW4BAIGU9cXHf02vyhH56c
	IuYtw0yaMLdP1xxAg+HbsE0+KLFO/Z3Oko7MezpdDfyRZx0lkp2b4OyuGBgZbQM6JPeIROX9uVa
	8iDUCG2TdXfgzvqwttqV46L6ovaMHNJwXIXtqNl2NNSHz6Qr+AQ3DnI=
X-Google-Smtp-Source: AGHT+IFknOo8FgIOBC/pX7zqREnS6alYIVbQbHq3b3MI+c5P0yy/6AQL2yR1JeK4EVgs7lffsPJP6A==
X-Received: by 2002:a05:622a:1349:b0:476:8917:5efe with SMTP id d75a77b69052e-47aec4a117emr101307731cf.42.1745073924534;
        Sat, 19 Apr 2025 07:45:24 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9cf9f29sm21856141cf.71.2025.04.19.07.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 07:45:24 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael.Hennerich@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] iio: adis16201: Correct inclinometer channel resolution
Date: Sat, 19 Apr 2025 10:45:20 -0400
Message-ID: <20250419144520.815198-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Omit fixes tag because it targets driver before it moved out of staging.
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

