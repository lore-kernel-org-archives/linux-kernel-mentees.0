Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCED433C1BD
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Apr 2026 15:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575028; cv=none; b=TE1o/aMzR17ptSgiTC5qEg1186CeR5YNgo2gtej8/EHEuLPHhtXX5k16wWKioyqA9ZGxMwWKAQsXTpDnbJOZ1AJK5uAeaCmggGWKxAyWZf5OaVLhrN4ynK3ZFBGp+7Khamfv4mWRdvNHO/9UD8x24FrH1tFFUT1FgF8rqdKpR3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575028; c=relaxed/simple;
	bh=BN2pG+ggdHeNF5nMAlMlL8UpqqNMmhM7u8s4CviSu9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZDBbOHhgDKHMqJxUOjYjsYYjlslgkbf3rNF0HvXFUdFfdjVCsLK8J0AbKOjwYPkKNBTdVtQIYoT5JTZEj/Y6epnn+9jt+o9+CKa8+5wDLzxO8BuvNhxRO86fpAmEVrYxhogEGOXW8Bv3niynmNDx6byup2824p4TW1M81139ftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s1Ax5hxu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s1Ax5hxu"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d23305225so4044707f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Apr 2026 08:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775575025; x=1776179825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rnxS0m7DOJUnPu1WgBcCkLSOJWSnp+7wrzdW4TpX8Gc=;
        b=s1Ax5hxup9jt1Yg2326r81Etq2vmPwFxH3RGv04BJCMDy7gdJjG8cBDVaJBjx4yk+z
         YMFt3XRzhOh7j1yXI7pAcv7VT9TFgBuZKj4/QhmfU8j+V42rZTqifCKLJ7z/2JEHP4fH
         j6wi8SSAdp/X98FJ4yBcnCg7f7kxXaMOsA0y6mGlhnuA93u0vCUQ57cnExQicQpVM7X+
         WbAYnIW/N77cFG0G+N/Sk5xuG0gMKIrddcUyk9K6ldDo0DyePT8FUtBmu0eVQxV4+P1x
         0bWsDMtc6LZFtxSW7kget81LwjYLeyo2TcYeKPkejHFhd0qwFeenhmEcRpIRlO1eLeNw
         eWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575025; x=1776179825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnxS0m7DOJUnPu1WgBcCkLSOJWSnp+7wrzdW4TpX8Gc=;
        b=KWlT9qqX91uHiPcGYUAAKNbZcDRaLrWonXP8iGJlq4H8lSgIjqUuBCEonZuEbKDsAm
         YtYePp9PNhlTKkGSraftMYw6mVftzkxxFLXWtPckPdgDjgMAs/YCFcTTMES00/yRZdcS
         A2bcXcp1TyXSVZijcugNX4qkwT9TlM6HrgXWA6+oL6OTOxWp3f5xQXNFHL0yVBs72SGb
         sbKYFANAAYzZQfO9j5wSxCV525TjP15Dfvl4eKGDi3ya4NtoBT/RsWkibQgmpjCrjgoh
         gmKuvOvrAT9H5Tz205nSCHX27bCiqjBSrGF9CLB+KxV55E26WQ3nMaXKiwuTqmJF+E4K
         m4zg==
X-Forwarded-Encrypted: i=1; AJvYcCVrpdi+ZNGgmy9R0vG2TTr0L0zj+fDqTk/+vyDvipOVjyjMqYu6lfCQhezRIw04BVZ30mJaTJ7aWPCECwLbPp9Xd0T5Sg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmQ1YQFmw4+nmBjWpqFHtMpMeA9AHtjL7zLxjs2xBYjWY6n0Pt
	SIm9Y0THJdFhVdyNBeJx3Rt3uEUx14cdrdYKcWXjgFIcta+SOKpdyWXW
X-Gm-Gg: AeBDievUExSmiYsJ1A8DaxQ0CKiKqV95L1dRN8oFxfZEiEWW2R+EX76bod0KDOdwgPR
	Q17UT7Jqn8wLN2Hmo/Je7xmdHz7H/NixzBhEMFDbFM44/FIpT//0MzDPc0+LcYwh9Im8Z5CxCrb
	XSrl9DMsVEleUryb4Mw6EXnQCrI80c0XJyzilunDR74Xjw8hgBT9OXin48kU+/mOt1/2Vz6m/MN
	003G7VZt1aD7O3K01eHawEMK7l3sSaFX4qo5MqJD6J++rLUnGxVw2M0RNa6AJT5QhYC5G3xhwoJ
	fVh7ehuk8jTCI1XA/OHJ+ZFWxWSLIpDginnJ0cfVMkwSs/2RCw+gpW5qibkdE5JEK4L2JMUAwMQ
	auco6SXJ581ZVUMNJz2hZiE3ZCeVFmQWK4SZj/EMhs+3WZdsY6wK5I5RJmmJQWVkjNJLqyOXkcB
	l1/FfPn6b1XoZsFJosQ9NvJYqmckqxAQ4KBKEfxxAEbo4oI/0jsgc=
X-Received: by 2002:a05:6000:400a:b0:43d:4c:229f with SMTP id ffacd0b85a97d-43d292e27admr25354253f8f.44.1775575025059;
        Tue, 07 Apr 2026 08:17:05 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([37.163.52.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm51924922f8f.3.2026.04.07.08.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:17:04 -0700 (PDT)
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
Subject: [PATCH v4 0/2] iio: light: cm3323: fix and cleanup
Date: Tue,  7 Apr 2026 17:17:00 +0200
Message-ID: <20260407151702.15208-1-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Series fixes a bug and does a cleanup of the CM3323 
color light sensor driver.

Patch 1 fixes data->reg_conf being incorrectly initialized with the 
return value of the i2c_smbus_write_word_data() instead of the actual 	
register value. Tested with i2c-stub on a Raspberri Pi 3B.

Patch 2 converts dev_err() to dev_err_probe() in the probe path.

Changes in v4:
- Patch 2: Add Reviewed-by tag from Andy Shevchenko

Changes in v3:
- Patch 2: remove extra blank line after cm3323_init() error path
  in cm3323_probe()
  
Changes in v2:
- Patch 1: fix typos in commit message
- Patch 2: add struct device *dev to shorten dev_err_probe() calls
  to one-liners (suggested by Andy Shevchenko)

Aldo Conte (2):
  iio: light: cm3323: fix reg_conf not being initialized correctly
  iio: light: cm3323: use dev_err_probe() in probe path

 drivers/iio/light/cm3323.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

-- 
2.53.0

