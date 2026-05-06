Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA4E3E928E
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 May 2026 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060596; cv=none; b=ajbd7zMM10cmgEv9kyHXvgSpYpk573tWWee+F9UOX6NET3V1a8h1tpZbSW5FeT1W5AjWhoSnEcbuWGmRgHshhtAx4AUhF8qDaWo5WpWZp9ypwlEI13+KmFzbbGeCKFOgmOibwJIk0qbQFWCo5pxAE5dvDK7rpxGpm8owByvEMzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060596; c=relaxed/simple;
	bh=Nv1xwcnvyqjs7pqTcxQ4zpMubfy5AOP7O2MfpHqK5jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qxfG1OPh9TEhizWe1fLUG6b+O3NMaS08g4oBTa0bCHM/ia3HFwP7VI6GRZfsp809EAl5Srpy8GQZSfrllMC/Dic4sGKerBy1j9C/AQ63BJrB8s6HMU64J1K0Cj1WdtL+YQVhXU8dqQbXh2J84k1UJyO88zzWHXQ3kYs63BAAwOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHBLOXjd; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHBLOXjd"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso3212456f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 May 2026 02:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778060594; x=1778665394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GAOl0kR6W7sAznR0JiC5Bm1rQ3NPZN/T/tRfS2z1WJo=;
        b=iHBLOXjdgxe3YJ2L0M8dl1k4ZvpLQOWxXdaQnD340cBaqKTQPEluaO4Hqysm+I5OER
         XLlgyF/juvqGMtfBriKCYKAMVooVwe0fOMihXkzVym4dVbnBlAsQKSJWeHnshmVwl5/U
         Fpq4NjPbDouWjIPsZmZxXSCDzzOrirRKJt/vBRK48pyqoLNUQClpM6rFeWHttt1FUoSq
         R3f6djJGE2nX5XnrYWJoCKTkDmtUM1qSkjp7l0+4Jhrsvp/LIr3p5HdpHS9QIUG831oS
         pLDYCm8jcbiiSzAX9XwMKu9wPU+19NKPZ73f57dztT9a33pijlq1pgluCxOth84XLW1S
         ZMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778060594; x=1778665394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAOl0kR6W7sAznR0JiC5Bm1rQ3NPZN/T/tRfS2z1WJo=;
        b=DgccLJzj80mRoP2Utwb64v/Vo8iXn3vXVW6oufsElMjVWrAaQuXWy5Vclg4+8Y5aFc
         pet7cjYCGt7lYHWXqtRdo4X9tD4w1KMiTjIn/S9R2o3NEHxsl1ETBtOMs8Y1amN+GmWp
         CXoINA/duzckhji/me3n2WyKauhbIWa0EcLv0yL2EP0y5eoaHfY8KUgFMJzseda67eJM
         JQt0bDc2YggM4WrfkczrRs4IV6JKE3jwZvk53SL+OMWqgQLxtqwcGgfDE8MxTQb+S8L9
         KIwyd2Bt6wvG835nwwAFgkXHfyvtG1GYz7lGrEUoxXHDF53MPkaXW6qMcsG4tvDNgjl/
         49jg==
X-Forwarded-Encrypted: i=1; AFNElJ/hi4HCS7UkEkqbfrcStIM6iHnjsfeP70t4OK2V3eDoQqePt+qN0h9Ns0LhyouDMf1xIAcf/4GK0diA5oMXlc9tE2Iw6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpgwuJfwgUcwzigYlMSNru1rjRPX8Bvv+o7nUJPO3ZvjhXElrp
	XAiQukdEupK5XS40v5iE7aROn9Jredv/nrIJxI1b/OWSibd0RwWTyyg8
X-Gm-Gg: AeBDieuuoXxD81F5mPmEjh4WiDePZ4uz7YzD/7jpj4F7fkp25vyoqfp/Q3ic5kCu+6p
	zZpsurfk+ZosTHPJoiH31hV9yq/N43LxUkaYjZdbEE8QQECsBP4kdE5UBt6RbHzKmoqCbJvzYzX
	altkzyzPsETPDlYu2iiVDGW+FZ6c5npoUBNwRx6LkRglv1MFX4H6sd/MaK85ym+45g1oYK6a+f0
	KTJFAlTDk/pRHUQyprjLndhG99U8nfE5HYMQzZLg9mO/7ZzIaqlr4dSr6bf7ywRbkhxXeVrj2hq
	jg3KC5ve2j7vPt3S3+gN77Ezja5CcCWkoWZR7KecOluWs5BJICWU5YkmYTxS1i647mRspVCYMZ5
	nRriGYGGP2Jk2D9VKkdg33RSSWkH5CNkDQlTHlialokIq6AGjWtsB3Y3mBN+EuA0rxGibjNmSnh
	RsuBRY4Hf0kFlTJnhP399vPevuUhuBA4rBtY3v8dVHEfW+KvmuJ3MMRfxUEi6fGZs=
X-Received: by 2002:a05:6000:2211:b0:43d:76d8:5794 with SMTP id ffacd0b85a97d-4515da95cbdmr4328563f8f.36.1778060593646;
        Wed, 06 May 2026 02:43:13 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-450524831cdsm12362230f8f.5.2026.05.06.02.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 02:43:13 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	shuah@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 0/3] iio: light: tcs3472: devm conversion, wait time, locking cleanup
Date: Wed,  6 May 2026 11:43:08 +0200
Message-ID: <20260506094311.222500-1-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series of changes modernizes the tcs3472 driver by completing the
devm conversion and updating the locking style to use an automatic
guard (mutex). Furthermore, it implement control of the WAIT state,
resolving a TODO.

Patch1: Converts the driver to use device-managed resource allocation.
This removes the need for an explicit remove() callback, since cleanup
is now handled automatically. It also adds a new function called
tcs3472_powerdown_action() that powers down the chip when the driver is 
unloaded, removed or when probe fails after the chip has been enabled.

Patch2: adds support for the wait time resolving the old TODO comment.
The user can control the WTIME indirectly by writing to the
sampling_frequency attribute. Changing the sampling
frequency attribute results in a change to the wtime while preserving
the current integration time.
Similarly, if the user has previously set a sampling frequency and
then changes the integration time, the driver re-computes WTIME so the 
previous frequency is preserved. The patch also handles the deactivation
of wtime when the requested frequency is very high, as well as the
extension of wtime to its maximum values (by enabling the use of WLONG)
when the requested frequency is very low.

Patch3: converts the remaining mutex_lock()/mutex_unlock() pairs to
guard(mutex).

All patches have been tested on a Raspberry Pi 3B with a TCS3472
connected to I2C-1 at address 0x29. Sampling frequency and integration
time changes have been exercised checking the value of WTIME and
consequently WEN and WLONG. Raw RGBC reads, calibscale, integration_time
and threshold events continue to work as before.

Aldo Conte (3):
  iio: light: tcs3472: use devm for resource management
  iio: light: tcs3472: implement wait time and sampling frequency
  iio: light: tcs3472: Use guard(mutex)() family over manual locking

 drivers/iio/light/tcs3472.c | 287 ++++++++++++++++++++++++++----------
 1 file changed, 206 insertions(+), 81 deletions(-)

-- 
2.54.0

