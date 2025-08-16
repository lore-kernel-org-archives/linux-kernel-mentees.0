Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF902E5D02
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 Aug 2025 13:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755351496; cv=none; b=gKL42YmRElKakxPu/AWkMWYJNqswHTJmdgmhOvRgpR2v59l5ZIWPAMHcfCJfMfjSVMRtKZkpJ6nWpA5qi5mnGAdG4VM+GSg9lSBQJIltGD0W2JIDoLSWQXitprl4rKaPlHjepUBPmnnpRHgUwEf6b9XHkamiDB/q6AuH9Puc5ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755351496; c=relaxed/simple;
	bh=7UbQKDN1GEFhBsxxmxfizY7Ssvu0Moj8dhGuUyQptOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZujslxP6HXaAYlZP5gELeyKVhTkJ6XewXrguxcwLJ3rJmqMfJR/x2vDN69QlLNAB5pANDvMMf2aEkJGbORb4nljmGyHYCbLWZFOMUBpBr/zPEu91YHkP/XLlPGL6eP5aW3rn099Gmgqp1vBJBKKmLfe4vQy/76JVw12ozh7i7EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNoSM0L1; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNoSM0L1"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so2499011b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 Aug 2025 06:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755351494; x=1755956294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2J2iSSCaNNvRGZwQ/4i2aG5ul+1gTH3QhJIp9bBktMk=;
        b=WNoSM0L1pM1v7XwlCOO36pol4RUrcfo9wcKtW/GSUqiw3/cA5MDZB9HuYfqwLcQzBE
         /4xg2hLm86HNmxk1speANjLjxUT86LWna3Qg8Wd9Vrbb9Z3ZK28rrUasFdrt0cfA+Thl
         CAA/SVthHWMlF/FHw/JJgunlIO/+Hcr16pL88rswMp92I820kj1H5l0jJcYmn0eMD/Zp
         66IgFu1Y5slKr9VEhJvkptjHLHA+CYhao3Pft5OczQJh7l0yE7UFff2C4gdCl3IJ8KD7
         elKtqCWEAcyswc4vFdo5xGlFVPxLKvyzjqF19WzIngc1me1qbojjTq8zC4l5AwBCtecj
         e1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755351494; x=1755956294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2J2iSSCaNNvRGZwQ/4i2aG5ul+1gTH3QhJIp9bBktMk=;
        b=ZmCjgDYil1qYcdUoZ22yuM02dib0i9Fz+u586syMGsl5Lw5GRvMHH9zkMeicWlCI/F
         aqzoc9pruXzSitRy1ZpA68eLnutUe7Yz7kg/PWFsU0lOue+zqWJWf1FBue5KSBEm1P2Q
         ccCTpFfQYUDN17G1LwTV2gK4MvCTuWdJbYZCfqjJxEnZqBmkl4A9JJKWJhCintgzGLDh
         sEJi75JsAJB63nEgFHVQgmZcdki7WV4zaMO+ukfr5+XD0BvqJc/Uk5oUQo2kVviOiP1I
         ABt9gli643RFHo1YESj0sAtAdSlECH/h3bEPrzGSuoUx2IogoW8rLqOcDYEqSZyQb0yS
         dv7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXck3UBpQbg0neCWeZSosm4UWj0c2H48E/hYVrkBgbDn/91W6canw8BxnSsMs9AOCPF+vyuzqoiMHw7rUwLUmFF4MdLTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCdahdTwX+cHfDYPCzwTNvo7iQIZxiicRSCmOsLxV2dOj/GAsQ
	o7ibVZE4RLuARWUGI0W71hE1ZNDDzpROWrK5rAtNl+eRD8y9LXJR7QqZ
X-Gm-Gg: ASbGncvaGAz5M9f31Fli4688qAzwnA0HBNUutg6/bMaqeSs+Dn/BeFXXsl3M0SblLJg
	dspeoCjvhR56e7b9kKIDFCxYud1zOCtiYFp+mb0YHb/ZXhHCrjj2gxgcv8H0b5t3nFuvKDpbaLE
	6zMOAbvbxANiC+4UKP0ZcTgZICyYx1AyRPzChJqIIXFPDdu8PYL3kVP/RnP89Tej3KqO+vuKg9G
	BSqucSLUXrxFp73c3DZqrGxvTbxjMsRd/k4gzIuBQCEqrHcm+VHeroTRPTes1yfk6qAkVu4kdFM
	ddADUm50+7+Kl4Dhzfa6rC2jdGLOV9hDx2/XB5FqZZuHnlqRYQLc6Aiu2vZXjvtaaPlgGmenI8V
	wLxwmLxhVPGYNP/EKmm2xMVsM6No8dr4mvzz5ewj6EcTaBoRpwHCh/w==
X-Google-Smtp-Source: AGHT+IFTHcbP9aHD8Nb5BFtiVW24xICOOoY85jJsclKqcExAllJZ4AeqSU09r1U55OQXNwokZ6LSTQ==
X-Received: by 2002:a05:6a20:1592:b0:240:1d69:9cc9 with SMTP id adf61e73a8af0-240bdb9b540mr17807581637.16.1755351494274;
        Sat, 16 Aug 2025 06:38:14 -0700 (PDT)
Received: from chandra-mohan-sundar.. ([2401:4900:1cb8:7b85:8034:5810:5a19:318])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d77338dsm3812707a12.47.2025.08.16.06.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 06:38:13 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	shuah@kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] iio: adc: ad7768-1: Remove logically dead code
Date: Sat, 16 Aug 2025 19:07:55 +0530
Message-ID: <20250816133757.98624-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clamp macro returns a value within the specified range.

In ad7768_set_freq(), the value returned from clamp() is checked against
zero, which is not possible since the value would always be between
50 and 1024000.

Removed the 'if' check.

This issue was reported by static coverity analyser as logically
dead code.

Fixes: fb1d3b24ebf5c ("iio: adc: ad7768-1: add filter type and oversampling ratio attributes")
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
 drivers/iio/adc/ad7768-1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/adc/ad7768-1.c b/drivers/iio/adc/ad7768-1.c
index ca8fa91796ca..a27591bbf7df 100644
--- a/drivers/iio/adc/ad7768-1.c
+++ b/drivers/iio/adc/ad7768-1.c
@@ -687,8 +687,6 @@ static int ad7768_set_freq(struct ad7768_state *st,
 	int ret;
 
 	freq = clamp(freq, 50, 1024000);
-	if (freq == 0)
-		return -EINVAL;
 
 	mclk_div = DIV_ROUND_CLOSEST(st->mclk_freq, freq * st->oversampling_ratio);
 	/* Find the closest match for the desired sampling frequency */
-- 
2.43.0

