Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4090714F70
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 06:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753856276; cv=none; b=a1FIDnmyEqo7SZOcA5nODG/+2X4Rzm9Bu4N0cPJJ7lkPNkITxLbBc9MpViNhIw6IxaOugWGryINcZJIVtMGGqAYJNrBp9xXDptXxMg8zJvhd8BZFMnq2LNu5e2RD5vnMIH1OywnduKqfHONiSOXfWvFkQrN3tdUrCiZjm6Q2F0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753856276; c=relaxed/simple;
	bh=XryLpjGqYYDV+FEX/ps+tCDjjYLBaSr57eRaMtgBXsg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NBmziQIa6VuIoKsFcIELd6fEswHovgBl9wfljwntGKFiL0HZ1EE5MsK+D5otnXsMpOW0NWPOfNEgf/GosPkmYzC/BfmzMkqnn4yL8O9n3ClotuYBpij83+TLYPPgrCNxwEtRNq045Qb9TW+ib3pggmIgWcHztnZ2LPEx8iQNI2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=YFsAP1q5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="YFsAP1q5"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-24049d1643aso19002815ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 23:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753856274; x=1754461074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=52xEfYQKRs8hJ1j3pgv2iCPTOPncEtEYrZ8Fw+FLizE=;
        b=YFsAP1q5IPuq8UHFd3uYr9MsDQ7qWmkp+vBka52RbX+U9vWnfWhJw/8mDy/s0k8eN/
         /+m3q7wolzZDmw/H7OqQQd7ZlTYhXmEpYf4XP1i62uDUhuf8LuYskFFmPjCjvRRRn0u2
         tEh3Zs9ctLWrzsQY+ujBSiDP63abLku65IBVyZugv7CscV3WiJSgVffN6sSdGtEXC9oI
         rYbt/HC9ctRHsWmJYlGAY3NxQ55AGhfN+00WZYBxxmvuT58FG+Fr2NKD+Y1mcfRm96Ra
         bagdqK6plW2J5h9x1DjxyWEf3SO01PYbuH4t1cEpnSq98KMY21U8wkC3oEeR2UaZppeJ
         ffJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753856274; x=1754461074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52xEfYQKRs8hJ1j3pgv2iCPTOPncEtEYrZ8Fw+FLizE=;
        b=EFGXPKnuXz7KZE+u6jRyUgDyBEqI3zYRwr5NU/tlwFuTpGvRrz7ULe32WaDQCD+lo3
         QDUxwQViBqJW1qVhD0OEeXADY1x9Yf0O/i7gDYZbEyFlkjPnG8MAI/WNkOoH14Mb1tsp
         xV4LfN8VRB5+UXqX9dlhux2Hu7SWX+7nMO3MCxX+vn8uIUb1vBqEN8rvpGGiFoa8CRWy
         Ho48mMktUPW44zzXjzuTcT8OmVpOMMQXin/NvaPtJKozJWw1mROL0tJbXWOfKXZLi53K
         MQ3yoBxNT0avQRjZa758F9HSAkQe9ysF2HLfglEpfaljnm5+gPm6vJAoiTlBNx/PU99j
         nHvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlkk4QKtKRBVfTKTWAs1RkA1aBHJQka1f9enOiuRF/rpLRxOuvHcgkCxlfK4De5zEnExqP3OvsQQ+frb0Tb/lKHv8Jbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEFFlq5jOo74e7wFeu+VTE+yuXDTwqen0Ql8N+MpTS47uBNTCz
	8c7rtglvGSXm8en1rxESxqcy4eS5eJty2Qz2Lwd8yHPSeIgSlGwzFb27HTphWq/cx/A=
X-Gm-Gg: ASbGncv0A1Zmlm4jmbCS3RX3J7EAlEET1kYq1oF/2pZvbvxABgVGEVT8lOFzLcy7hk1
	LKpXzZKxQWumd+uSi8aP8nd+SGoLBM8CF3L1+7x9ZMU3QKqeOqIlIop3ETro6zNEdY3rJssEOm/
	HhVaRo7Q8UfdKlhlKeOFcNN8GL57Xoh5DuXfcGPc/uLBCTBHaGMWM4fVvpTrPUHPMHWW6JKmCRE
	qNOqhenBhiFlsxEUONiTb+XTx8qID1NO8S03QhCpxN8FM01etJrLxPW9WM7XiTOy5COYHWj9k4r
	6EC+sFZxjlh4WiZ40iPmUZ41bQhuwk3XU07biD6rg0r+hKYqJFRGxxgsxVfcirKzaCx93jokrPL
	sZmdWJYtIRhkamijBsPjqBg3imF4TB5dV6vK9ZRhKUAqDZlO4OA==
X-Google-Smtp-Source: AGHT+IHyEWFTQDnTXUtR2Jyv+AM6C4D4XNrd6963rDHySiItD68akYv1yW4JeDtRX9x0xFCJT4X5Uw==
X-Received: by 2002:a17:903:1aa3:b0:240:8cec:4803 with SMTP id d9443c01a7336-24096a68233mr26935725ad.7.1753856274216;
        Tue, 29 Jul 2025 23:17:54 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ffa37f078sm75017815ad.115.2025.07.29.23.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 23:17:53 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	linus.walleij@linaro.org,
	neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com,
	sam@ravnborg.org
Cc: dianders@chromium.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 0/3] drm/panel: novatek-nt35560: Fix bug and clean up
Date: Wed, 30 Jul 2025 00:17:45 -0600
Message-ID: <20250730061748.1227643-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix bug in novatek-nt35560 driver's nt35560_set_brightness() which
causes the driver to incorrectly report that it "failed to disable
display backlight".

Add mipi_dsi_dcs_read_multi() to drm_mipi_dsi.c for improved error
handling in drivers which use mipi_dsi_dcs_read() multiple times in a
row. Add mipi_dsi_dcs_write_var_seq_multi() and
mipi_dsi_generic_write_var_seq_multi() to drm_mipi_dsi.h to allow
drivers to more conveniently construct MIPI payloads at runtime.

Clean up novatek-nt35560 driver to use "multi" variants of MIPI.

Changes to v3:
 - Fix incorrect Fixes tag. The bug was introduced by an earlier commit.
 - Minor formatting improvements.

Changes to v2:
 - Separate bug fix into its own commit for backporting.
 - Add var_seq_multi() variants of MIPI write macros for sending
   non-static MIPI messages.
 - Minor formatting improvements.

Brigham Campbell (3):
  drm/panel: novatek-nt35560: Fix invalid return value
  drm: Add MIPI read_multi func and two write macros
  drm/panel: novatek-nt35560: Clean up driver

 drivers/gpu/drm/drm_mipi_dsi.c                |  37 ++++
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 198 ++++++------------
 include/drm/drm_mipi_dsi.h                    |  35 ++++
 3 files changed, 132 insertions(+), 138 deletions(-)


base-commit: 33f8f321e7aa7715ce19560801ee5223ba8b9a7d
-- 
2.50.1

