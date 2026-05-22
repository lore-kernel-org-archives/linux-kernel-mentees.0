Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F41383980
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453265; cv=none; b=Jk6viPZsi6QHEORROE519GUyCdD3uEnLsyp/2aEQ/tHmYurhoXLQW3sHvzSEmhEgQCLj6Qt9PtqcGHXH6QVEqhEGTa0myUevW12ndDKjhxXSc6lcftBwlVK8YcGZmsLzbRqnbpDzbX7lgqxW2jD5yFfNpw/KHmfxnkNOzFbKS5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453265; c=relaxed/simple;
	bh=6x/W/+1FMvzalUP9YkUTxoZY/OLusc+9ObuPrJil0Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r+YeS98Q36iEjroOvekbnlSBAxBs/4HOQGYKcgBfiR9ahPlC652GzH4mnnBtQKPmUGAt0tp+Ru6VxlLMLrZM5MSKkaEjhZgKeOHn1R1ojy47B/DdqCcHaGxTybQIFEPqvVUwpqLDHU4M16kX8WQ3UevLDYXy1H0aK7VXGF9TWok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o29UvddH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o29UvddH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so6730465e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 05:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779453262; x=1780058062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4IylE1HgbW1KZOaeOKndRSwri0GzRfWTsNyUhkTKQaQ=;
        b=o29UvddHwiUxUlms6a6TnRod36WHvnx7Y7+1mH5Jif0YEkoDXa9PRqifWTWsPeYCZ0
         Iu4wj+h1UozD1jEcKoXKTcFsnuvtpQl/i+E821/1NekjS877QmfF8XNsVzMQryqLrRIz
         uyASCc/Gf5n6694/Qg6+8wJ7SJvY4+lOQUo0vGbi6IxyiLwgeLjB/TdJveYOTk6IPwIw
         hpeHbXyIQWv3g3cBl3pwjeOWEau565uV0JdThuGDN+U0WZ9QJiL6ORGHgHdmq6rS4EuQ
         QQAIGFY0sUzoIkQjmvxUwNR8R+zwXC+WyGMu528sgGM3jBt7Ih4AV1yUvelq70cfCWw+
         FrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453262; x=1780058062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IylE1HgbW1KZOaeOKndRSwri0GzRfWTsNyUhkTKQaQ=;
        b=B62B++mdWgEtViLEWNF9GzQEutR/Elv920E0UwerAtK3qsFSya1PWl92Sn/FBB9Yaa
         Dtt3Y2Xrg6RtXolEi/V59w7lRwCseIkyOcIh3TTfuRtKAEynZUP4z+48G7uloIKCkL5m
         JCTSFz2z2r1onWnwSDCJkAHRvGUZBKEn/KwGQUEapYVdVN023UwmtuAHVnOs9DPoeizI
         aBGpTZs63D3fOWJpFiQP6knvKQG02eWEPZmE5mGqqnLP8teQJtIW8UAzC4jziRO4V5T4
         u599S+XeNXRj6tUhD96OVmg5FRfw1nmtohFVlEEDzZfV7sqVNPjUhTRXPWFGK3NkC9g6
         80sg==
X-Forwarded-Encrypted: i=1; AFNElJ+I/tUQBWjBj6u5gC9SDS45cA9BYfCg7B8eOGdOx9ubEOmDytmGlRb/qMqzHcvKsmos8d10w/Hb2wi+OoItai//56uMUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVk5EMQsISKm/f2waNapeTVQfI7FCCePlhCyZRZxzm7DOf2ThX
	60x1Px1sqCjLkQcDh3sOBFuj0azDVWjBeTzTRJx8MIymM9ho2+zah/hd
X-Gm-Gg: Acq92OHVwbzEZCXEx/O4Jr2yV8Ls4Erja5pvRUpeboLI8rD4QjnbVeQcFOgfRmgEs1G
	+VAdn7127H3U7R44f3/4FgYvNef8P8OWw+MbImAlq+DGIfsCE8JdOVqSC6HrLdcxByB1KNEyiGi
	OVn7JvXdIWVCF4S1CbuRfcBbgcdviSVtneWOehIG9XjX+gpUpKrutlFc7WIzNhFoQp8NQHvQnZe
	AYjjleqcqy5n/OTLkqtiTuP63FXx37cE1d/gDWgYaTHBndOCx7mvwTgSFP0w/R57nNVJ4hETcQU
	AyQdlkbDhRiaIfSxpskwbe/0CRYaHXUmrpZsSt6lNB+8o3RydJiD75j9UWUn75+iCT4K2iziDtf
	/ahWRo3IO3HM6vNqmZRTCOz6/AQxLmf9ft1eEChHX8edzdcIposgOPpTMnNka9+p0nEB0an63eT
	yCm/NgUWDnyyoYiOH0uV9u38zoBjABiGwtK3bB2DBvzROQxm2AiEVR6iWoJUr5ByY=
X-Received: by 2002:a05:600c:888b:b0:490:3df8:65cb with SMTP id 5b1f17b1804b1-490428cb050mr34711395e9.18.1779453261555;
        Fri, 22 May 2026 05:34:21 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af0ac1sm14760175e9.31.2026.05.22.05.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:34:21 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	shuah@kernel.org,
	joshua.crofts1@gmail.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 0/8] iio: tcs3472: cleanups, devm conversion and wait time
Date: Fri, 22 May 2026 14:34:11 +0200
Message-ID: <20260522123420.45495-1-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v3 of the TCS3472 series, addressing the review comments from
Andy Shevchenko, Jonathan Cameron and Joshua Crofts on v2.

The series has been reorganized into 8 patches as
requested by the reviewers: cleanup/bug-fix patches separated from
refactors, dev_info() conversion split out of the devm patch, and a
new precursor bug fix for powerdown on probe failure.

Patch 1: powers down the chip if probe fails after the chip has been
         enabled. Pre-existing bug, found by code inspection.
         v3:
         - New patch in v3, split out as a precursor bug fix.

Patch 2: sorts the #include block alphabetically.
         v3:
         - No changes since v2.

Patch 3: converts the remaining mutex_lock/unlock pairs to
         guard(mutex)(), with small cleanups that guard() enables
         (early returns on I2C error, !! -> ? 1 : 0).
         v3:
         - In write_event_config, powerdown, resume: early return on
           I2C error.
         - In read_event_config: !! -> ? 1 : 0.
         - Removed stray blank line in trigger_handler.
         - Subject shortened (no function list).

Patch 4: uses ! instead of explicit NULL check in probe.
         v3:
         - New patch (suggested by Joshua).

Patch 5: converts the driver to devm for resource allocation, drops
         the explicit remove() callback, and adds
         tcs3472_powerdown_action() to power down the chip on cleanup.
         v3:
         - Powerdown bug fix moved to patch 1.
         - Powerdown/resume RMW refactor moved to guard patch.
         - TCS3472_ENABLE_RUN define moved to wait time patch.
         - dev_info() conversion split into patch 6.
         - devm_mutex_init() used for the lock (suggested by Joshua).

Patch 6: uses the local 'struct device *dev' for the remaining
         dev_info() calls in probe.
         v3:
         - New patch, split out from the devm conversion.

Patch 7: moves the trailing return -EINVAL in tcs3472_read_raw() and
         tcs3472_write_raw() into explicit default: cases.
         v3:
         - No code changes since v2.
         - Carried over Reviewed-by tags from Andy and Joshua.

Patch 8: implements wait time support exposed through
         sampling_frequency, closing a long-standing TODO. WTIME is
         recomputed when integration_time changes to preserve the
         requested frequency. WEN is disabled when the frequency is
         too high; WLONG is enabled when the period exceeds WTIME
         range.
         v3:
         - TCS3472_ENABLE_RUN: new macro style (name+tab+backslash).
         - cycle_us: div64_u64() and (u64)val cast for 32-bit safety.
         - wait_us: kept s64 with comment explaining the range.
         - 'if (ret)' instead of 'if (ret < 0)' after i2c writes.
         - New helper tcs3472_cycle_to_freq() deduplicates val/val2.
         - !! -> ? 1 : 0 in probe (WLONG extraction).
         - Fix in tcs3472_resume: preserve WEN from data->enable
           instead of forcing TCS3472_ENABLE_RUN, so a user-set
           sampling_frequency that disabled WEN is honored.

Testing:

All eight patches were tested individually on a Raspberry Pi 3B with
an Adafruit TCS3472 breakout connected to I2C-1 at address 0x29.
Each patch was checked out and built separately to ensure the driver
remains functional in every intermediate state of the series.

Patch 2 (sort headers):
  - Driver loads cleanly; RGBC channel reads return reasonable values.
  - No warnings in dmesg.

Patch 3 (guard(mutex)):
  - Threshold value writes (RISING=1000, FALLING=200) read back
    correctly; AIHT/AILT registers on the chip mirror the values.
  - Threshold enable toggles the AIEN bit in ENABLE
    (sysfs '1' -> 0x13, sysfs '0' -> 0x03).
  - rmmod completes with no lock leak in dmesg.

Patch 4 (! instead of NULL check):
  - Driver loads cleanly; behavior identical to previous patch.

Patch 5 (devm conversion):
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

Patch 6 (use 'dev' for dev_info):
  - Driver loads cleanly; "TCS34721/34725 found" or "TCS34723/34727
    found" appears in dmesg as before.

Patch 7 (default case):
  - All read_raw and write_raw cases handle attributes identically
    to the previous patch.
  - Invalid inputs still rejected with -EINVAL through the explicit
    default: case.

Patch 8 (wait time / sampling_frequency):
  - Initial state after probe: ATIME=0x00, WTIME=0xff, CONFIG=0x00,
    ENABLE=0x0b (PON|AEN|WEN), sampling_frequency=1.614987 Hz.
  - Write 1 Hz: WTIME=0x60, CONFIG=0x00, ENABLE=0x0b,
    sampling_frequency reads back 0.999200 Hz.
  - Write 5 Hz (too high for any wait time): WEN cleared,
    ENABLE=0x03, sampling_frequency reads back 1.621271 Hz.
  - Write 0.5 Hz (period exceeds WTIME range): WLONG enabled,
    CONFIG=0x02, WTIME=0xd0, WEN re-enabled, ENABLE=0x0b,
    sampling_frequency reads back 0.500200 Hz.
  - After setting 0.5 Hz, changing integration_time to 0.024 s:
    WTIME automatically recomputed to 0xbb, sampling_frequency reads
    back 0.496622 Hz (closest achievable to 0.5 Hz at the new ATIME).
  - Invalid inputs (-1.0, 0.0) rejected with -EINVAL; chip state
    unchanged.
  - Suspend/resume cycle preserves WEN state: after disabling WEN
    via high sampling_frequency, suspend then resume leaves ENABLE
    at 0x03 (WEN not forced back on).
  - After rmmod, ENABLE reads back as 0x00.

Aldo Conte (8):
  iio: tcs3472: power down chip on probe failure
  iio: tcs3472: sort headers alphabetically
  iio: tcs3472: convert remaining locking to guard(mutex)
  iio: tcs3472: use ! instead of explicit NULL check
  iio: tcs3472: use devm for resource management
  iio: tcs3472: use local struct device * for remaining cases
  iio: tcs3472: move standalone return to default case
  iio: tcs3472: implement wait time and sampling frequency

 drivers/iio/light/tcs3472.c | 416 ++++++++++++++++++++++++++----------
 1 file changed, 303 insertions(+), 113 deletions(-)

-- 
2.54.0

