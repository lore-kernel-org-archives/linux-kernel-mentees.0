Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373343A6B88
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 May 2026 22:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778625141; cv=none; b=iRDSI50Hraux35JReBgddUZwH/ixnQY0X+68SwW9jD+aPqV4hb/uH2JNfBpWVV9TsjQHR3pLVEckBbe0uW39ETQqlSGxrAktt4gLwoBpBX1hWwb/QFP+Ia96+Nav2TbG1eugYryCrUTIWecYq+9qIhXt4t3tHDUBoZoTIJ8Bod8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778625141; c=relaxed/simple;
	bh=NzPSdUf6T+ORUNm6PzVWnjy3jXA+qpDxvB4jvR8BSlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ju46KvIRyG2zLS/J7f2Q2afTwZjqrAIVx7HHO04h2hc6t0M2/pJ+R6afu2pQXZRLgwED4IitGoxMCV/Qh51BCLsncVQjCOvT08j9/YkkgvdV4v4A896D9dGVp/O9hh70gPMmGL5+s10lDXJMgGXy1pRCy/MyrMMNDtFsse8eB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kK0bKLXO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kK0bKLXO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso67566525e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 May 2026 15:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625138; x=1779229938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gld2CLWnRnPqjxg7OzSmNjNiyBF8uhbwEKKeGB5tZE0=;
        b=kK0bKLXOPGXJbmWqxiPaRSDdAMUdZZ5s1HHvizWIj+sdPNnuVy3iQOzqymc4Kf0SN6
         yIAK4oyIv2g/kyztba/TMj5A+cRB1qpD2wNZQK/rILBGHpkJSoAeJzntQIxC15wbR6DA
         N5nLa3qnXEWVCA/s71tvul0fo48AioTSXbGhSDgK06hcYbpkdK6od1ftUd1eUsOQoGiq
         3evzqR4qXogz/erDmCf5NLZ+7RZnr2agmdCwJr6ni+lcN6rJqmYRR50VJVGpLaqhqOEJ
         uAQwDLddCRXN2munOM+yAKTZAjMqDUofKo88UGTFP0jhyOUpPEGQ5rIP54jk4pBMRsfl
         P31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625138; x=1779229938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gld2CLWnRnPqjxg7OzSmNjNiyBF8uhbwEKKeGB5tZE0=;
        b=pwM9dTpl6aO0aauNmEN0WfuX+oru45xC9ZtTN1ud4OAb94NcDNuH4oWXJl8dLcauRj
         Vqx925qf8hX4x+LJAZnRADKEbK5borKzA0Xtu9cKc3Kk6JuvX9lP7l8xcMBwFa7/Ny7B
         yY94hqFz6Yni/nXCSeyhY0g2PhOmKeiiqXVHphQSfN5VEcCprpIzYowjxHk9OpxWeJUU
         14pTiDn3BCCG2l+1p4eJV0bjiDjvTS5GWllIpAM0KQgdF401aUmEy8R6BEwI+yKj8f+D
         X/UgNt24JA5bcXt6QTawwkjc63hhGI56JHlSPqXxAbfzzDNTIS1Ckl3uQCnvTC7D4j/k
         GO8Q==
X-Forwarded-Encrypted: i=1; AFNElJ88MgI5mNJGYvfKm54TXo7pg7DMzfABnYGN6g7f81N3wpIPF5nAx6ErEDv7rzdv6+HV2UbnNUrJnLcQeug5i6xnsaGNCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjAQ0W9diwcZckQ9MOno2reqYDeSygrS3+wlBXNoRYNEKKsrtC
	elJkgj1KHyWIznqPeZMikT3zFC2iIdGsiNhhablVgjtVBb74xssEKDoJ
X-Gm-Gg: Acq92OEi0jnzmck4oM4cpe/L0H8fES8pyXFXW/WJ+FERVIOpwGK+6SSFJVx9IV2YJXC
	psbwA4OFh9AoB9rj84x3gi3iEp76DB7PHm7V5R+do5FXz6gLQatLswHaXcsxk5/nWCgn1vstDfJ
	9veeLrPBL1H/qU2BXYm8wbWHxwexOBefyFTlz+ohNX6jeGp3RjUfhUNIN6eCsVh57qHwlym0wfG
	+OZrxc0D497r8jqcFpj+3iKVXY1BbJam443wp09xMv2ieK8sTaY/Qz73wdxh70aT0rZzksiDZRO
	5+ve8CSQBt2ssb4xoN0bWFsXTV9B5T5jVtXuQXuYpTObkqLFryWoObWaiSt6qjWmYVSxGsDmiTA
	4Yyqa8QSS4hNqGDfUFxT9osc7xAZ5unRIg9L1cbsPFVCdf1yiOBlGfJXq6c9sH7WLGbxUwZJGfS
	tyNalP7BoINNx7Vr1SyRK4g6iOCqLTBsZKcWbf7z89az+PSBMGJGPsFeM=
X-Received: by 2002:a05:600c:4e55:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48fc99275d3mr10977985e9.8.1778625137467;
        Tue, 12 May 2026 15:32:17 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([2a01:e11:5402:d840:f1ee:c5d:74e4:6e19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3c65f2sm47377375e9.1.2026.05.12.15.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:32:17 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	shuah@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2 0/5] devm conversion, wait time, locking cleanup
Date: Wed, 13 May 2026 00:32:10 +0200
Message-ID: <20260512223215.25596-1-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the TCS3472 series, addressing the review comments from
Andy Shevchenko on v1. The series modernizes the tcs3472 driver by
converting it to use devm for resource management, switching to
guard(mutex) for locking, implementing wait time support exposed
through sampling_frequency (which was a long-standing TODO).

Patch 1: sorts the #include block alphabetically.
         v2:
         - New in v2 (suggested by Andy).

Patch 2: converts the remaining mutex_lock/unlock pairs to
         guard(mutex).
         v2: (suggested by Andy).
         - Moved earlier in the series; dropped "Found by code inspection".

Patch 3: converts the driver to devm for resource allocation, drops
         the explicit remove() callback, and adds 
         tcs3472_powerdown_action()
         to power down the chip on cleanup or probe failure.
         v2: (suggested by Andy).
         - Read-modify-write in powerdown/resume rewritten as 
           "compute, write, commit on success".
         - Use local 'struct device *dev = &client->dev' in probe.

Patch 4: implements wait time support, closing a long-standing TODO.
         The user controls WTIME indirectly via sampling_frequency.
         WTIME is recomputed when integration_time changes, preserving 
         the requested frequency.
         WEN is disabled when the frequency is too high; WLONG is
         enabled when the period exceeds the WTIME range.
         v2: (suggested by Andy).
         - validation tightened (rejects val > 0 with val2 < 0).
         - target_freq_uhz uses div_u64() for 32-bit portability.
         - TCS3472_ENABLE_RUN introduced here with AEN | PON | WEN,
           no longer redefined between patches.

Patch 5: moves the trailing return -EINVAL in tcs3472_read_raw() and
         tcs3472_write_raw() into explicit default: cases.
         v2:
         - New in v2 (suggested by Andy).

Testing:

All five patches were tested individually on a Raspberry Pi 3B with
an Adafruit TCS3472 breakout connected to I2C-1 at address 0x29.
Each patch was checked out and built separately to ensure the driver
remains functional in every intermediate state of the series.

Patch 1 (sort headers):
  - Driver loads cleanly; RGBC channel reads return reasonable values.
  - No warnings in dmesg.

Patch 2 (guard(mutex)):
  - Threshold value writes (RISING=1000, FALLING=200) read back
    correctly; AIHT/AILT registers on the chip mirror the values.
  - Threshold enable toggles the AIEN bit in ENABLE
    (sysfs '1' -> 0x13, sysfs '0' -> 0x03).
  - rmmod completes with no lock leak in dmesg.

Patch 3 (devm conversion):
  - Probe completes with ENABLE = 0x03 (PON|AEN, WEN not yet
    introduced).
  - RGBC reads return sensible values (e.g. clear=525, red=269,
    green=151, blue=97).
  - calibscale, integration_time, threshold value/period, and
    threshold enable all work as before.
  - After echo 0x29 to delete_device, ENABLE reads back as 0x00,
    confirming that devm_add_action_or_reset() invokes
    tcs3472_powerdown() on cleanup.
  - rmmod completes with no warning.

Patch 4 (wait time / sampling_frequency):
  - Initial state after probe: ATIME=0x00, WTIME=0xff, CONFIG=0x00,
    ENABLE=0x0b (PON|AEN|WEN), sampling_frequency=1.614987 Hz.
  - Write 1 Hz: WTIME=0x60, CONFIG=0x00, ENABLE=0x0b,
    sampling_frequency reads back 0.999200 Hz.
  - Write 5 Hz (too high for any wait time): WEN cleared,
    ENABLE=0x03, sampling_frequency reads back 1.621271 Hz (cycle
    with ATIME alone).
  - Write 0.5 Hz (period exceeds WTIME range): WLONG enabled,
    CONFIG=0x02, WTIME=0xd0, WEN re-enabled, ENABLE=0x0b,
    sampling_frequency reads back 0.500200 Hz.
  - After setting 0.5 Hz, changing integration_time to 0.024000 s:
    WTIME automatically recomputed to 0xbb, sampling_frequency reads
    back 0.496622 Hz (closest achievable to 0.5 Hz at the new ATIME).
  - Invalid inputs (-1.0, 0.0) rejected with -EINVAL; chip state
    unchanged.
  - After rmmod, ENABLE reads back as 0x00 (PON, AEN and WEN all
    cleared by powerdown via devm).

Patch 5 (default case):
  - All read_raw and write_raw cases (raw RGBC, calibscale,
    integration_time, sampling_frequency) handle attributes
    identically to the previous patch.
  - Invalid inputs still rejected with -EINVAL through the explicit
    default: case.
  - rmmod completes cleanly with ENABLE = 0x00

Aldo Conte (5):
  iio: light: tcs3472: sort headers alphabetically
  iio: light: tcs3472: convert remaining locking to guard(mutex)
  iio: light: tcs3472: use devm for resource management
  iio: light: tcs3472: implement wait time and sampling frequency
  iio: light: tcs3472: move standalone return to default case

 drivers/iio/light/tcs3472.c | 357 +++++++++++++++++++++++++-----------
 1 file changed, 249 insertions(+), 108 deletions(-)

-- 
2.54.0

