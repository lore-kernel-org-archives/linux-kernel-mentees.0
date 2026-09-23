Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82E14A6887
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163563; cv=none; b=QOnM8WfDbvmzaqZGxzVTiTI9pFKj6uahT4SHd2s8Y8gQo4vwNkGUSLy/8YHnBy00qViHL/e3y4+oScERCtsVDd9sGky2e1yjl5CgEJs0a7fRcY9RYYocf+FXmZZorwKJM11O6j4SuNGc5x9XR4u0HUuETW7zWZUkyUkYdy12EMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163563; c=relaxed/simple;
	bh=sT3f5CSowAx+WsW39V1WrOSwBm0jKQKK9E8vUOutaIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YQpIVV/onhKhwbmjYn2VOXIDbQBS8kTiRtcPLsaN1GGNGPHA/f9NqOwGE5v4zEPNk9LRSyEn7IN2UFznOxUIIQAlv5dJXItAqYEVqk26egHZ9O/jngmrtJqBlyEqecWyJSRHvn2mz11M00hQiOykZuS2ijgZC48byhwY/7eTHLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fq6cN/gH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fq6cN/gH"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so545306a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 23 Sep 2026 04:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790163553; x=1790768353; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=byz42tnH1aP31XpuO9qZLa1U10ksdFNPyaGh5na7j6c=;
        b=fq6cN/gHLlaNnaFLes+BXywqhv9reGsd1vZfk+2Bp3QbIelaPpO8yBnLgQs765ODzw
         uRiq2leC4rP73J3T5bmmSMXgf/vYJcejbXtccWKepQY2CG17Fn/bi9lEnJZyvdyC3IOm
         yryz5BxInXkymUeX2xrH1oAqIhQ/ZXEqNlwT+MvybyF0LBqs002ZjP4Mv6o/WvQxEnqT
         a3z5caoBll78VAoGlPsjMTEwOTNH1sjk/Vi+0sOlFiVr62HFLDEAoRHj4+HVbmNVqs81
         nGHfBF82/gvBVJWsFtf5k6c2uawQBfCB1VdOCAyLHNXm3i6H5DC7wqjlQEgRu4DfNdcA
         DQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163553; x=1790768353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=byz42tnH1aP31XpuO9qZLa1U10ksdFNPyaGh5na7j6c=;
        b=uTZbEWR4eeg6zFLjfoYUrUr47gDAOkA1EQ1pOdwZmvSidvswVITbHdf16uvEO4ozNb
         DcmtYOeCfvmCfXMlE5qaDKAuqWoIY/3c7DIRu5YnZJpXXRSPI6x+E18/2OwhFnOx39yT
         nnZwyxjr7ZmWM7WEqpQY0uTrVoKnx2locMONHUDOrv+qi4RG2Z36rjP6gQ/nHu454Ns6
         UZNN3SfcbvU83Ft213pfmZo/uw7DvZ5CDJgAkmgNk7f7RHACJ5Yb39Y/JqLzLeQ9dUua
         2SKXmmtboi5cICO/NalHZNgTFECnYN9slb8pz3Ulj4x1Q4x7WxRbHEuNnUwujRQrNlJf
         RkxQ==
X-Forwarded-Encrypted: i=1; AKwUvByclX0haKyqf2arcx8Q9bntBYed1UMyEf5CopndclaYUtULrW4Q06+iREseTU8Szrk7g6eTcnuB5EpiNlkMDFWDmwqHuA==@lists.linux.dev
X-Gm-Message-State: AFuF++lRuX3pzvwkOP9dE58ISdjLdsUp0YS5fHZuO5sbMUCb4ZZm2QkW
	wwW9/3Pwyk0ICncJqdFaHAzOBI99Xh9PhgMJ+5+cLdR5I9c6lPIzpUqI
X-Gm-Gg: AYBFou2BzxydBXuYFHiLKNO5y9ApU1lnlklIQQVVByutOIYorsBUIySwcW9qBLBS7Pk
	UX4uf0/ZRVc9KjUzjuc3V4DQJIoGfzZOVvB0d2yBVL19x7Gkc8xKk5klzFa4KIKb6bu3F3RNV8x
	1V8/NQ3l84KgmXHVZC0weHGkSVIVJjQCsf+SIfUIubkn7NWNlmMa31aq0SiXLPiTLUnYDRTOkpI
	qZT1Qpg5UYtzg6snvYEdc5ruTVV4aRsHHhOPiRqQuvYE5KH2UfbpPc2PDiJxZBUGILJ0rbMcWlY
	4pDPpuoGoAGH80e+lelW7DNNakSKDrzn6k5wlFFmJaWv5limSxUWeRms/X1PmKBjZ5cYNK722i5
	/Oja49yx0zuM563sznS+f0BI7xpQEb5kgbrq5hvex80PKl7tKO86/p1tJjRK4PeM4MAimF+3/Jz
	o8o0owZQWVuHzFveXv+r7QwCg3m/dw9GX6buA+uJTcJgbF87rdwip753fMXQeFH8uNP6LTXmqdL
	kT2xYATY//LIUMZ7Z1K
X-Received: by 2002:a17:90a:c886:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-3a07e5373camr2045004a91.9.1790163553103;
        Wed, 23 Sep 2026 04:39:13 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4easm4654288a91.6.2026.09.23.04.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:39:12 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: xilinx: fix runtime PM leak on request error path
Date: Wed, 23 Sep 2026 11:39:02 +0000
Message-ID: <20260923113905.1409290-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_get_sync() leaves the usage counter incremented even when it
fails, and xgpio_request() returns the error without dropping it.

gpiolib does not call ->free() when ->request() fails, so xgpio_free(),
which holds the only matching pm_runtime_put(), never runs. The reference
is leaked and the controller can no longer runtime-suspend, so its clock
stays enabled.

Switch to pm_runtime_resume_and_get(), which only increments the usage
counter on success.

Fixes: 26b04774621e ("gpio: gpio-xilinx: Add support for suspend and resume")
Cc: stable@vger.kernel.org
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 with CONFIG_GPIO_XILINX=m. Not tested on hardware.
 drivers/gpio/gpio-xilinx.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 532205175827..9406ce85f933 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -271,14 +271,7 @@ static void xgpio_save_regs(struct xgpio_instance *chip)
 
 static int xgpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	int ret;
-
-	ret = pm_runtime_get_sync(chip->parent);
-	/*
-	 * If the device is already active pm_runtime_get() will return 1 on
-	 * success, but gpio_request still needs to return 0.
-	 */
-	return ret < 0 ? ret : 0;
+	return pm_runtime_resume_and_get(chip->parent);
 }
 
 static void xgpio_free(struct gpio_chip *chip, unsigned int offset)
-- 
2.47.3

