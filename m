Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B35337649D
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  7 Aug 2026 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112546; cv=none; b=VV5eIcI6N6zgpuu1DRkglSCcvHTjydwVccmcBkKSOgKEmW+fOt+gJ9Ppk8Sk3NxQtJLf9AZzU56zxBr8I31JRezXJqWEZjaFYmGJOoVP1H6ssB3Y+Wt29vDhnay/tX0GPV9RE1MJqbTz9lunDHRbjLAOo2FvPqOMaq8ayqvyyiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112546; c=relaxed/simple;
	bh=eVGpKe+EcdJ7XUC4Ncud5DVc1/hqhzgbLaaXCx88ABQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=plAPKFqwiYWGe68TaxkI5uQz04kA9EyX8v5Sf7G+KV4284CQoyFn8M3ey41Z+qXF2tYi70+t5V/lrDo1d4Wy7zInxhzQJhHsImL+AMgPLoIpVdZEZli2nNkOOBqg7TBlqgvVDzWZdeMLIvMdAwCsRcYWL2r7P7vwvsezGp5Bcig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkB9z+0l; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkB9z+0l"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc97653887so40311925ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 07 Aug 2026 07:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786112544; x=1786717344; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4jrqSj3opeMMbFpu/4FeQ4O+rDHnQsZg3TOVpbai7E=;
        b=DkB9z+0lBtug7Gea3gDhedY45xbo0wbb24LRr1VHggqMLlzgrkr6lTIauID8mNUdIb
         wakrxfdrmu5aZkoZfgilQNKfwWWtkKuSM8FlDdXDkzfAaVIgToBJtkdbRUpbQixQyTEm
         OvIplQIFMvG6QioTl6MQVi1Sammt9yNmlE4H5x87pGUNUp3kvi+nPJIWAy3BhLegrg7n
         kY7wLG2IGJbAFqmEjID2ggq2Ha5ao6VdBDOK/6QRsNW43rXSlcTU9bti27sBRmP3iqym
         Ukv0SVs2uJNAR+Ho0dPeMKA8RDDd15mO/0aczUydAAReGbwdMqEyfz2III4AXGjEENPh
         BN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786112544; x=1786717344;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4jrqSj3opeMMbFpu/4FeQ4O+rDHnQsZg3TOVpbai7E=;
        b=Zei/0j2neupi45j/Dlx527w0xjubpORzyN5L0n3ZPwZVf6zT7YFYAwv2PicyWQjce7
         NyYE8dK0BvF5qLbSwZNkbmNXaYepB6f7lDPDaTKOhtJjCaCpFGTK0EatXGLGARjlA8Hg
         MKaDOvHxCsAKrAd9RhJXpW2fh+V3L8CEn/+iDgsOs3efHMzu7BE0gDEJxr3nloDWETvi
         5QXLx/OsareaeNlZX++GBIJvDhvPEUP3o8ZbPObL2etyFjgT4zOcGjj5o6i1iXDJsCr4
         0TiQ/0ehPhWie5YX5DGtcTyVtOmLolnGH6edVglpFzllXntD4hlr6OGMsNkntRsjVi7e
         QEXA==
X-Forwarded-Encrypted: i=1; AHgh+RruRrpX8R6R3gDNzuaIQ21YuEQsmqZtGi0D9/sdfY3c3z6ud8c7Pd8mz1yDYRs5U8GOBhn8ZMWNk1bhN3JRvhvB5FPkKg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy13lcJD3gJDdWQOkfK8WvbrJ8eLlUqqaBwefWFM8EvZY3eiqhq
	aWUKHDOQnsfPqhwNV0X+J8xpw/WNdzm7TSdkUKxxFfYQGJiiwj33Ydc=
X-Gm-Gg: AR+sD10wI6uUzkUVDLyENxh0rSksIn1gdtuWA/+0O7uZiGA+NPufdURcMhS+10nPU9v
	X8G03LNjcF1E5lw+fXoluV+NB2DwsYtkrBu6iVlKYxBYslTCsbgc9eNeAOwL5PoTri2oak/eRaP
	4fxVxIs2tHckGslFqN5FMg/vl/aX4dbi+SisqTuC0bic+vFuOx2Mflvk0dO0QEzRi/L1iFcUH7r
	bIRnqXP7R5+O0/eAmmRcAcfiZZi1YGrXDmEG/IMbHCmOvgYiiu0UvFhXzYRvuJSFYfKrHfKNdkP
	ROaduKH5Ipo6zHMTTxMlc/kd2it3dI0joO7fcT5sYbNSK0R07EXIDLZao8cfi49IdEVYd7INs4i
	mm9t2f+ZUG6Z6aoAH7HKisBWxYeZn+sfB3kY9LYUFR8v0e5ibB46nvBC+tBQM+ZPLGfNGanmqdC
	9cbWadXHdpuKhKawvczZ2PpbEV9mx8ss7VRF6qSlpTmEqG2apUggym2XF2YpPwCk3V7I2mfsJtH
	iyyW/vLA1ZqbkBs/9KuiIZHKm92SXPmXcPUTZNmQw==
X-Received: by 2002:a17:902:da82:b0:2cf:7bfe:6043 with SMTP id d9443c01a7336-2d0ca949b71mr207130955ad.19.1786112543799;
        Fri, 07 Aug 2026 07:22:23 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a7395sm8521868eec.9.2026.08.07.07.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:22:23 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 0/3] Add support for CH1115 Controller
Date: Fri,  7 Aug 2026 11:19:49 -0300
Message-ID: <cover.1786110720.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series add support for the CH1115 Controller [1].
It is a monochrome dot matrix OLED controller that supports several
interfaces such as SPI and I2C.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

This is the first driver I write. The work is based on the driver
located at:
- drivers/gpu/drm/sitronix/st7571-i2c.c
- drivers/gpu/drm/sitronix/st7571.c

Tested with Raspberry Pi 3b+.

Thanks,
Nicolás

[1] https://datasheet4u.com/download/1576606/CH1115.html

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  73 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/chipwealth/Kconfig            |  16 +
 drivers/gpu/drm/chipwealth/Makefile           |   3 +
 drivers/gpu/drm/chipwealth/ch1115.c           | 828 ++++++++++++++++++
 8 files changed, 930 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/chipwealth/Kconfig
 create mode 100644 drivers/gpu/drm/chipwealth/Makefile
 create mode 100644 drivers/gpu/drm/chipwealth/ch1115.c

--
2.47.3

