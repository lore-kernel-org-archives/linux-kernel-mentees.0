Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF652CA6
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 31 Jul 2025 03:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753932231; cv=none; b=bsCkFkWsVa+1hXMU9xuoN6nfPiLP7h5N4JcCcWlyRIB1a6ywlWdXnW7hWeN9uWtC0SWS5KLnOrGV2bJkfzG0PRYBi+Ujk9IeXNAR5cbLSH7eKLpesDPyjjtn/3qQnmvF7VwfvohhD9/adVKNRvezAzEXDo/lAySJLlY3VH6hOX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753932231; c=relaxed/simple;
	bh=vevOqegizmVwG5nsgBWisow3TPz4Yq9bqXkl1EGuUlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bOxfGTkbmgVpqMxfr6rNI+dUuiawaijDfShHtrdC3+JngGU8ak4iYdYU4qGIuOGvDCag7uMW2VnZDyTQ8IE2WHeN1zUUXrI6kOID5VRgiITS3HS1Wy4SfscqD7bkZdLSF08ISsDFc+bCPf8wlbWBVHFsP1+8wlpYhY163xyGtpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=BjBFHCPN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="BjBFHCPN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2403ca0313aso4646425ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 20:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753932229; x=1754537029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/0ay50DHxiyPzyuFZGUiLzFtgNbpo/gDuEWB9tyHxI=;
        b=BjBFHCPNiO26jc8XWgxXF48tXUcOlWSICbFzYgBIjb8uPD9q0m1Ch3a0EEGx/I7tpE
         BQ4tNLqZcI9tT6cTZeBOL8PwU1mILVBkxlhnV+8HsnHj7hBYJr6/JuhgwGxJFnZrl61R
         UH3N4SWC4KEHIQS2vckcNdA8sEfVSgImdr2Nl1w3oxlzNkiU6ogX1K1OyeWitDceaXpQ
         e++YEwldmx8+opjbfbsmay//WjSgTeZRgWckscLxc2ilS6pac70hiU89j7phdSe7/yXO
         FmO/OZ5nTY/+0nweX2+Z2QRwz6pdPolpnjrsDkhqS4RWNYhyBdazmQjMIArniKrWuK29
         0f9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753932229; x=1754537029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/0ay50DHxiyPzyuFZGUiLzFtgNbpo/gDuEWB9tyHxI=;
        b=ubXCTJ3mkGGwnkaKGUCwR6UgD6D2BKJsmfDU9X9U8EgMCo+QXu3I7D4vkab0ixIm7W
         7lH5NKaFIiwi2d4WA6DtlW8lf7Je7K4vMBuiyJhZUaVKxStBqZOW3sBjalAUCpKyxJfi
         JXXTWJpczCaIAU4EV9O9bHGNh6db+TF8dwR76wjvlvDMiJwz6E0JJhDw9BkcbbmmzPxT
         etdaPbdcvstyL02j6BzLyH6ZP+blURnBWdEBEyKmjXbcP+CBtIANimzqD1PeFDNStOYK
         42x7F+u4NF8kkzFkiqxZPZZZL6QVQ0H52gmouliNzkD5Tk4L2y0grOzLnzk4EJynEMm+
         qdOg==
X-Forwarded-Encrypted: i=1; AJvYcCW2xPXOq/syUvcMS3rLSXlf+q8+Owe3XxM4aDjEBdWGZJIY8861uCecl7UAwmKMOiiZaAWKGRPDcBIJQ5+UcJkzyFcUeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXdTrcPMAnY59j1oHpTvB2wdysnMlRRlJlAnV4wnmJe/RZCOef
	58LcKY1cMJ/rLQQeFiXCFsUZf8fpQOT8fF8U2QqLhieaGxHljIrC+sMeAHoQbwyjnf4=
X-Gm-Gg: ASbGncsX5HQAVJFY0eTaN2JZNPpe3AVfYqlwQLm3zLFXcrFIsVUT6FvKettK/sPh4pk
	Co+HaiCcg41MjoO4CWYse9bcyrfRfHD1aN1iT09Uu4HtsO+CIxW4G8pqesnDIo/cbANmaXlLAB2
	v4hdSfDjm0xlVqDGLqoPxw2M7V3opA9lMocSlKVqvlqSgWM3nVxVpBprPFpTHXCD32+z912Ntjq
	5F6/wt7pxYat/goQ9dhhohZNVn+rsWrb641UaF8u/O1PWgF5bJ7aKRVEOgGEqzJ92AmOXAj+eIL
	MuNv7ShV84801kOt5F3ASfcEGBLzXqcitPeMu3eqNJPsJ8/2b4t2k3CS8zsDn5qqjvo5G9xt8t1
	7ixxIa2ejX1EPgxx3T1zwh7jOayP/p8DHSC4nKhj+EX0TZ7B2q1TOsE6KHD9b
X-Google-Smtp-Source: AGHT+IFbmyHUAZjzYXWConGjVtJnP4/KGTKSPvl0mvsildNQPPwPbZ1hL2oDeNwXOjX58/iQ7MIXHg==
X-Received: by 2002:a17:903:1967:b0:237:e3a0:9d63 with SMTP id d9443c01a7336-24096b62eeemr79230975ad.43.1753932228913;
        Wed, 30 Jul 2025 20:23:48 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f15092sm4854795ad.66.2025.07.30.20.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 20:23:48 -0700 (PDT)
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
Subject: [PATCH v4 0/3] drm/panel: novatek-nt35560: Fix bug and clean up
Date: Wed, 30 Jul 2025 21:23:40 -0600
Message-ID: <20250731032343.1258366-1-me@brighamcampbell.com>
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

Changes to v4:
 - Replace "non-static" in kerneldoc comment with "non-constant"

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

