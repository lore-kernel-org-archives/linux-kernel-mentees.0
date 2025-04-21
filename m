Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D394263F32
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745238508; cv=none; b=CtJ+hnKrEGjU2NLgAple6PoaXWF+Y1VV8mkHp3gubbcdz5dq2udwiwRqfeduwIyTgS2V7eVQaTcM5F0peo9wPkgXN8QtCy/lXPU9oRec3C//z7Tx9zrZt8OEPuaHBIPb5QsRsfWYiOhbpzXd97upAFgpzp8NLs/reHUWMC4HUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745238508; c=relaxed/simple;
	bh=e+WN91nPHLRESKaOGAavp3iu6QDsieZbWsN29aZj1Z8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KmYdwiwTSE9Kpe+gWrHj5hkdn61BmcmmsynMqcaFAVq0kTTWEbM7toPiGlICXrQ6FyPitXj10xBNwFKho9ZG5F3mpRDN68yEzHXbGxVajtZeV1WrtCfkoqhMwa7Z4AWf4i4gH2sg48xF2Q6JUYXTfbjugmVT2rRh8b0AmAUTw4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHORw+mf; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHORw+mf"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c54a9d3fcaso382171985a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 05:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745238506; x=1745843306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c2wIp4O5aFba/VFIEdYS6vzun+UYuyoA/BMDFjUKnEU=;
        b=OHORw+mfXLMcOc0AcZtbFXmykmCKTBpviInwahXV9kL7VGZLCZwtkrI5bcBBSu+qdP
         JOEYHavBH0rVa0di2JKwUOB/suV5OcxiBrajbbBdRsDF6nVTX3HDkNDNVLSqFz4GEr+v
         ytmhzwCXYCMS0RvMZEb3T/iaosJajexqhL7YjZcg2OjrMzOI40ECnifAbjQSPTIuTjbw
         cUBJeTIFjc0ZYQMdYXyNHgHqZ9yg6mZXAj5QDC4d15S7i5MBfGWjlTAQQpgJyNhQZdKP
         ilZQdxEzV/VkCG/DY3NYS3B4PKoj2kFTHRi2E/dikHCKvOyqjNhoiSkuZbjSBtAJrE0G
         2TFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745238506; x=1745843306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2wIp4O5aFba/VFIEdYS6vzun+UYuyoA/BMDFjUKnEU=;
        b=FvlhIYN65MAhAeIAwuMEYklgMxEPV8yOXQCfmXtkMDh3D3YuNVNcFyivNNcD9eoXNx
         pWVhMxuxgorR/KA1k/nLAUZJN50Zllxs4s2AWD1rJ7SIDE6VfcRT97OAP9IujCcezo88
         U5y2XL6Gf33TcZr95zVR2KUqsDvNQoaD5G5CEiAEhj2Vr7G8x1uFtW79D24Z9riJtaHM
         dGzCwzR8WM9RhHbEjmwmknG3OmpCdn9Dtv73UorkV//6U212UpXXovMnVuWFc1GL6Iyk
         qAclyZFd9+6QJvM4Kj9F0D8XLkAmEpKOChvK9JMKDbzTRJNtkidjLe5aFZcCkdw4/vQN
         pkdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV5IRV3Mf1dqU8PKnZsKD96r7tibDnEwMJmckYcwB45YJ50JtjUI+Aezt6WnsTNY1Q/V9nNLlS/niP1YiJluWZAWepsg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw0o7H2FYa2nU1HejHpdyF6WOmGYFFXsnbdZ7cqmRIFcPpqZzJ
	zREPQpjfhEWgFKe+3UwUVp4T0d1tUfR8kwRVmGQflU4OSfxUGR3h
X-Gm-Gg: ASbGncuSb63FR1yoXf+7oHkZBTJL/VMuNQtdqd9XEjwOTs/kvi3dHI91VmRFvEnHz8E
	322Zg2Wx/vO4EKvXV8crrUgimlFgmUpk4c88o8lZbEqrR6Q9oo8JDJkvtRIgaF25+xTfSlKi1q1
	JRDXcZ0VcjPvXJugjOkO6iuvs5WJBE/gYKKltRx1HBOSDmy6g9m3+xeBFurs3XE64lXRGz6aYig
	BAzmGeuyUS/rYIwWAukf3ZQcnsGmeU/OaOCHNZdlz6nVE9K44EgMP4hUWE5E6szDXljUQU3DIlz
	wR/3DRelVSEHFEFt3j5bWGrWLsIP5ipfPtHBkqriddFfa4x2otClKUktj7+XeQxa0XJxVcFHGlH
	uULBLgnx3myRJ35Aw2bQ=
X-Google-Smtp-Source: AGHT+IFiW3P7e10p3XKaEoJEdAV43qnaCDOH2uR8uU6ICsm90RmKmXLfKhA2kcISDnvAu8nqURfE6w==
X-Received: by 2002:a05:620a:2911:b0:7c5:4d2e:4d2d with SMTP id af79cd13be357-7c92805fb68mr2053018385a.50.1745238505835;
        Mon, 21 Apr 2025 05:28:25 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925ac2f27sm412267685a.54.2025.04.21.05.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 05:28:25 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@suse.de,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael.Hennerich@analog.com
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] iio: accel: adis16201: Use IIO_VAL_INT for temperature scale
Date: Mon, 21 Apr 2025 08:28:19 -0400
Message-ID: <20250421122819.907735-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a leftover from the patch: commit cf96ffd8c2ed
("staging:iio:accel:adis16201 move to chan_spec based setup.").
Initially *val = 0 and *val2 = -470000.  However, they were later
changed to -470 and 0 respectively but their return type was not
updated.

Use correct type as -470 is an integer in the base units.

Fixes: cf96ffd8c2ed ("staging:iio:accel:adis16201 move to chan_spec based setup.")
Cc: stable@vger.kernel.org
Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/iio/accel/adis16201.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index dcc8d9f2ee0f1..1f27386edcc4e 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -125,7 +125,7 @@ static int adis16201_read_raw(struct iio_dev *indio_dev,
 		case IIO_TEMP:
 			*val = -470;
 			*val2 = 0;
-			return IIO_VAL_INT_PLUS_MICRO;
+			return IIO_VAL_INT;
 		case IIO_ACCEL:
 			/*
 			 * IIO base unit for sensitivity of accelerometer
-- 
2.43.0

