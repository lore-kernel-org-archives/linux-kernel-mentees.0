Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5AB48C403
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635108; cv=none; b=c58rXPbR93D4/bq3vIGYDYJYye5toLZtARBoDeeX6V1095Z0o4yLOfjE2TJGWXL8dFR0e1+i/K2dl7D9DjBL5tFfoeEXNTdh+1FWd0fxoCgUKfeF7yf2OgXDm8sad1cPGw5EAGJTMbwkpcbMAI8os761LerPMGJdQHA/abe0Xck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635108; c=relaxed/simple;
	bh=3V58kFwXBYHTqu/lknOdvlSejNFDj4QsTgxXWJELNe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rbqr/ku9UH1UqcWG53CfiUTljOGcnOP0xGRCtIQTlWfm/L5n/AK5db1CprQF6pAAAmjLIvCqCwpxyWX4mh65Y+0+sVU4bMQgAgg9CExwP/aTcUcNAqNbjdC/PuUWNjGlf6HYf7L43+RvCtH3C5j+7pAsPTTdY4c0lvfQ4VZqeNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIOf9pan; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIOf9pan"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cea3004256so1076055ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635104; x=1787239904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mMrmCE/vqNNHJNQcz/hlB7uwFXJ2DVitmBQZAYXHgA=;
        b=YIOf9panc2Pk2quCMGGTj8kJyJeVPtNgwTEKqRuyTAQvxnY4kVRVMACQY+16QlRvUN
         n8k4TyP6NuKDCExJ+DGGrY96B3ho2Rv6YtosKrzRdppl03tAJY8KPUEbKpQ7vrc+EIUL
         tQdMNX4K/H7M9KCbRmXx82hIcQfrYOaYiMtjid3k87b7nW8268nxcj3TuRfdHipyBNyj
         oht0cVNGZV5nripSY26NqwL5wVk4WH1WlDDtlxWyOsQec4TQK+LWX1LZesY088Z9J/kJ
         Kb9YsQeb8ggc50CjmVFphxdmBZru13raX5dZHdgqR8RKU2Fdy7PmzgiSnC+InzfmPpEx
         uV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635104; x=1787239904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mMrmCE/vqNNHJNQcz/hlB7uwFXJ2DVitmBQZAYXHgA=;
        b=hvJCtXtFtdgle+OuHLciwi2c+gxkCMABxsNZm31Mj1cdDyuV6kZkDJ8dk5d7nf8kGO
         te1d0HnWHWg4e3EYG1IWPvkHAuyix6F3fiNw2tv4v+h2SV0oZkc5FFSvWp+4pfz+pAbG
         pvttvDOSW1tLqE3hy7V+LbsAwr3D5EOFVtn4LDmfXDtAJB4Rut1pcPOf8YR2xCYGwtWJ
         Pffey8Qz62CUDQdsWkFPeJ7OXetNTp3m1EhZw2JJQQhH2im32H05ATOGZJntwuUN4SLJ
         0UzOPXKW3gE1R2Sykh6h5pKAad3LHMWV/yBgZ8AHXfElbRhdSIE8oPFOa3OoebLLvnkq
         qpew==
X-Gm-Message-State: AOJu0Yx0QEibdYZ4+vRn8R1FfXIuJ8I/PWaZCAaI55riqEinwUluTgZQ
	3pmfPV85I6QqM7cC9w3avcwH9zS20lx92UGzDdIxWZLZhsKN0S6e49Su
X-Gm-Gg: AR+sD13J7jyUk1G5jPxtwKhTP/KhajGk/VcrRaNLXLEnQsrxtVo0u37KW/wYaJiU94x
	m/8h8yCWlEBhrUVlArER3wE4su/R+x1ZbTgpQJODrQ8KYVSL+N+/0XAUr6JzUVkOAbNrKIBJSow
	K8UOzUWpTbYpefg7AYvWC1gMcHOpzoQ2j+vX9F/fLxP8UHgjWYyBhYjYf57HyplN3nhbykH8sqi
	gcSgrXrkyz95Rc+pZSUAk8/zGCUk9ZVtzR3NipAedGp1tOUsZTxqwcPTvUABnCAeiW0Y7UyHu/O
	ZH4uG8XZYULBeRCJCt0JQQqLqV9dv/TrNMSuHnz/gERXlO8Z9fYg+4TXq8w8FpLBKnhKPmr2lo1
	l+UJCcZQ1nBM/C2Qf0D0oYNqdUyFwAHK3/gcSi6pXTvbIV87AwFF8cj7sjSFADzh6rU7ECx9VAO
	kdZy49KZP9xQGBK4ChMIBF3XyDERM+/bEp/PEu7wMyQjyIdzJrgVPo5FtVTxxapO/KUCL9pcEcs
	AdPwjuW9iFtdwjf/j47QZcww7qTs7qO+rlY+oCDy02phs6+LLDO9RbCT+jRGg==
X-Received: by 2002:a17:902:f647:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2d37ebb797bmr82446625ad.16.1786635103822;
        Thu, 13 Aug 2026 08:31:43 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec082943fsm7960604eec.29.2026.08.13.08.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:31:43 -0700 (PDT)
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
Subject: [PATCH v2 0/5] iio: humidity: hts221: update probe and logging implementations
Date: Thu, 13 Aug 2026 23:31:24 +0800
Message-ID: <20260813153129.12423-1-adinata.softwareengineer@gmail.com>
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

---
Changes in v2:
- Use a local 'dev' pointer instead of hw->dev in error logging helpers
- Fix punctuation in the commit message of patch 2/5
- Adjust commit message for patch 1/5 to include fixes due to ABI change 
of in_humidityrelative_oversampling_ratio_available

v1: https://lore.kernel.org/all/20260808090026.34187-1-adinata.softwareengineer@gmail.com/

Thanks to the reviewers for all the time you spent going through the
code and the comments.

Adi Nata (5):
  iio: humidity: hts221: report available values via read_avail()
  iio: humidity: hts221: Add a blank line after variable declarations
  iio: humidity: hts221: Allow unknown whoami for DT fallback
  iio: humidity: hts221: use dev_err_probe() in probe paths
  iio: humidity: hts221: fix division by zero in calibration parsing

 drivers/iio/humidity/hts221_buffer.c |   1 +
 drivers/iio/humidity/hts221_core.c   | 168 ++++++++++++---------------
 drivers/iio/humidity/hts221_i2c.c    |  11 +-
 drivers/iio/humidity/hts221_spi.c    |  11 +-
 4 files changed, 84 insertions(+), 107 deletions(-)

-- 
2.47.3

