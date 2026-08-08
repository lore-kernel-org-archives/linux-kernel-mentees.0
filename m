Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D8817BED0
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  8 Aug 2026 09:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786179648; cv=none; b=FatbgbuxZC5lbsovyTrfaoIFHzuJv/LCQjtWCvSsMl0iNA9HH34qKD7EH76FTikwgX+F/aEpYQssL7xppFOoc4pIhGxHerN5B7EYdoO7hQsPI6PQTSr6zHUwNyNd81r1qsH8oxfjKeHOU/DsVJnWQDg9XVTQMwHQHdt6QOjKRis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786179648; c=relaxed/simple;
	bh=qxWTv8ASCjnCZ6TSATakBcbHMCZGrem2cbfSEhGoUeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XIeRkuEmHUIHbqXJuZMHvo7hXuVtwE3+A4SEOe3YXAK+OYWLWVne2jK9F3ZIJF/+4iXIUaT6a8uxIAmtHqiWcW1cFpfRz/BySGauAud2orYmsujI+sKmjSvBazs269K8omAoD85s+XRfwbYWlr0s1OBJrQoMNLgnamijn+zME1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JH5VYGCj; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JH5VYGCj"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84847482584so210079b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 08 Aug 2026 02:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179646; x=1786784446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yt88+cQt+lLHD2Jf2jU1wGbeT/wb1MRSKM+kEtCms9Y=;
        b=JH5VYGCjJEm5Eq4mmL6fpUcmAptXSvhs8oLEEZz5Mb+Zdy54MuzvDyoGZfSK4jfmXr
         NhKimfXVSXNY+Rly17iSysJPJmF4qDR59p7rytZnZ91Z+ayKdCHQP895K4h4kS+20ow5
         VCEIStH7ArsCdQGInOkfBZ2o3eqxJTJBK7B6QGQ089EkAFLHi2SzW1jXrPoH4dFIGDZV
         BHegwpCuWd6D/qTf8fWaL3JBpl9iErr2KuhxTRaoovJ8ENb2fnqh8U/7ec95JDjEHf6O
         89rrhxUhLKc7OElQsnHsCJzI8GGfnUWjCJaK3kTaGonLX1P/gsLRR+9Gf5EsraSMc+fT
         F2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179646; x=1786784446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yt88+cQt+lLHD2Jf2jU1wGbeT/wb1MRSKM+kEtCms9Y=;
        b=Lf4S0RQBjwjwFA9PnW7L9m2MDu5MHqX7ZiBFbEKewGDWCtzr6IxQlli4/ZTh4uFfCu
         I5VTamitPsH7V8XfX7V6vpijUTFJEdM6BzjnmjtD1pod5kq7lVqolPLQsqpCnT/IWZ1r
         67BKIkdj2tUSYxBXpzFkr4n2cQEFvm7zX2cUgjrBS8cQjY77WMSh4pDwFoFqIRRbbm9f
         s+YrPpxlwoUDt7hjlhOKRRkFKLaxw2unUYKeAdsec1RHvmBgpsVHT2QJlSnnRSAeEhLZ
         9a5AdXykV3p7BvS/nCToMyPzFuQId5CdMWPgcLCF7/Mc64TWZ8iyZbtuUyuX0zIkIAdr
         10Ng==
X-Gm-Message-State: AOJu0YwbxImg5AURebz9VhYqTOi2HVhWZAiZWSuBS7W0K9DF4YGY+RlA
	XHpsORDqMLVkWS3qm3VjtqVLzs4UXerDGq1jbIzV5CgcGSSb+MrjT/r+
X-Gm-Gg: AR+sD12l7c3/alnpVt5bp00mYmC9753FtIiV86C9cY5xTe/i1vHRAB+RN1IQHref9Sd
	oM1ucg/eql4oRGrr05Ma2zDSS4k0DUfcFrRfc/5yzzd/5nxxC3SviD3lnIQ5WoX+8lYh8GiQU16
	d1aKRqewY913BfEhJ5VWueaPyGUe4IQb7EeR0AyIZbEPVAtHkC29gOTnC+6st1ihaIyuIVCH1x1
	kayPoTnS1s1zHVdwQdDX7GowDi/sAv4IZr6nfGxVBwTAbY7OHwh1K+4OMQxKay7MINTk/TVsINW
	hUr9F3g4Rd2Zg51f4+42QyZKWLuxxEsIQ3ZB5JlMhlqNxzGRcl+SmusX4m9OS5z2fcVYj9mHRcv
	D5Lisz+ju1iyDgORHH/lG8XVaCsMRuy7EwTRTChB6o9S8J7IAOR3Tnkeh4EP338v+2qKvEFTEvM
	i3qEW/C2xAMSUXscK6zM26xPnLFqNjYzd4b/+uhbP19cXYWUycsBGMbvblyFOrw8JXIqbXtl0mE
	iUebcwDm5rliKDZE+6pufPe+WFpkWwEeWBkqAfNUu89rxvwOeA+++yahkL7TA==
X-Received: by 2002:a05:6a00:3d0a:b0:847:9d6c:a56d with SMTP id d2e1a72fcca58-84f6b78b1bamr3840408b3a.12.1786179646272;
        Sat, 08 Aug 2026 02:00:46 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e9f0sm1973871b3a.28.2026.08.08.02.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:00:45 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: lorenzo@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Adi Nata <adinata.softwareengineer@gmail.com>
Subject: [PATCH 0/5] iio: humidity: hts221: update probe and logging implementations
Date: Sat,  8 Aug 2026 17:00:21 +0800
Message-ID: <20260808090026.34187-1-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HTS221 is an older driver. This series groups a few small modernizations
based on current development practices.

- Report available values via read_avail()
- Add a blank line after variable declarations (style)
- Allow unknown whoami for DT fallback instead of erroring out
- Use dev_err_probe() in probe paths
- Reject calibration data that would cause division by zero

No HTS221 hardware was available. Verified with checkpatch --strict and
builds of hts221, hts221_i2c and hts221_spi. Probe and calibration
error paths were exercised against i2c-stub with register contents
pre-loaded via i2cset.

Adi Nata (5):
  iio: humidity: hts221: report available values via read_avail()
  iio: humidity: hts221: Add a blank line after variable declarations
  iio: humidity: hts221: Allow unknown whoami for DT fallback
  iio: humidity: hts221: use dev_err_probe() in probe paths
  iio: humidity: hts221: fix division by zero in calibration parsing

 drivers/iio/humidity/hts221_buffer.c |   1 +
 drivers/iio/humidity/hts221_core.c   | 171 ++++++++++++---------------
 drivers/iio/humidity/hts221_i2c.c    |   8 +-
 drivers/iio/humidity/hts221_spi.c    |   8 +-
 4 files changed, 85 insertions(+), 103 deletions(-)

-- 
2.47.3

