Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018A2223DCC
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 20:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388625; cv=none; b=HXn23nrrXwsKMyyj/a7LDxv8R2GnsoNiqmtilMXP5hJR1r6j/+YSnKRD05ltabphLfeG3Zhj7L3HLLD+YDVMzDSnQ5xGyM6jFesHWAdRrnuhlPjZ405EVr/YaR6qrJbVW3BH1gvyfbtIlP5338uPHbnEBM74wbSUul0feqwtKVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388625; c=relaxed/simple;
	bh=CPSldl5hqRKOFHGgVldI2p+/nx7cULLJ0sN3T0HMf3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oRI+zX6bfSqUy02SHiabMCXWLu3UZwoezrT6ado/ECFTDsbppA9taxRlfB8LL4TkhwLVA3n1zv4WFLAql+ZCzmRUS56mNQn/a/26fm7iUa3HuxzBj3nNdb7lb7LCbYWIvRSDI2ZG8PHijgdjk6/jzrStIWTT638CFckI8XKEhB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=MSTavEqN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="MSTavEqN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235a3dd4f0dso9091325ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 13:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753388623; x=1753993423; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNZbwQw5iHEb9CKajVAO1swZ1MthUYrqZ1xdxET+ZZU=;
        b=MSTavEqN3LAb+LH7HnasyH2aK73UaPKiHYHYh28uY02V3diqu0qbU4Q5jeAodI8Ldn
         +KZFiA/pmWiv6X/5TuMPfLXdiYWCVSKQkVx9psGX3BNN1EOJd3jMOf6Cp/V2hATsTG5N
         RF1XscWaRJPOZqf466dfTT5Vc+MXjw5X3s+fjuooR5pUNJ6Y6cO5DLZYeu7xHZrD5s7e
         aNqEzv+4pD3MUyiCN87WhaLQ0nkm2ivk7koTOpyyETaoH43r04LeltUwrXXPHgAu29r+
         EUD+r7kEg+jHQp4WTeNXUdIaQ5Ie0ft0110tEob4T+sEgdWs0rx8L1KApWd1beTXglpj
         rFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388623; x=1753993423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNZbwQw5iHEb9CKajVAO1swZ1MthUYrqZ1xdxET+ZZU=;
        b=lX8h4Q3JGLdrbl7XlTOGsfuORVSStaGNYpMYjop+X4bZKM06SRg92MTRjrQ2dqre+m
         Xz80LLxDxZBxizm/JdFyVR3EATTn5J3cnAO1ZVpggk71v1yaMS8jSJceOr/I9r7LutwZ
         7wBasMtzIJUTOWlisk5nsIjlmPfrhoGwfpUywnkEs3sgnCacqn6cxe8KARH6nyH8Jm1y
         6fwyTxmGoFBikCnUbeM/2JgFQ/G2QaYvL/dC3sgWhPY+r3ERgwrLg9FpS+Z7J7q7DTd1
         aXuFKlzBNvmbfme3+c6IidByN5ZU9MJJT22C5jl8jvj8YPlQxZiFxCZml1wHZDN++Cx7
         6T5g==
X-Forwarded-Encrypted: i=1; AJvYcCUPtAuEHwCgtafMXopfuQBGu7y0Swd3XvJgmnCHjTDCVp+op5sGyQB1Ci3kF+/ObiwYYIxu0D+zxRzzK1SpdLO3Ytppvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWHi1NfvJoeWjV+37bkE5wM2Ia5vaosIoub+mv2NFyVBXcvPl/
	dAoKp+sebpyKHVJIHyZjRLruk1xy1Bq4dMK2tiai8lsr/etOQxuT0I9hy0yjO5/wSbA=
X-Gm-Gg: ASbGncsaRIVgc134xjDzpFi6nwv7BKLB+XArN32ZA6eEi0+XT3anVYvYgPQ4LY1Aghv
	mdnXVjQTA8B6m+xeQX/tY8l8MHIlBfhDOifuqXfBUdvJDDumUmdifOXoPRPuUIA22qQgJG/Efa9
	DpkZjWxU/j+RfB5NLwu+oCcNuSryYKOR2N3rLirDSQC97Vm6xj13qVctKAkOwdUfLKIZLyir4hJ
	s7117dqQpekkjik/SkFbvDaI6cbtorFsWH8tTWbuXAkF404H/yV1GM++IwNBUgrbF7rr/buu/0E
	mWnsrudcsHFpwcgyiEkP1kfyaSxHHGP4YNJprRyfHuvrUl9iHj4ikkdcN0+R9suAw8nZpM0Lahe
	tXPcyi3TSEf1WzSuhPf0QH08tRSdMgsQjvOReAgolnruZkGBLSg==
X-Google-Smtp-Source: AGHT+IGPSLo7EaVXZqu37vUKdjxS3cia3ql+tqXEMZ48FC5JJP2rAz+cHkmUkDzlL3JzUsZOXDC49Q==
X-Received: by 2002:a17:903:8c8:b0:23f:6fa4:1567 with SMTP id d9443c01a7336-23f98146861mr98965735ad.8.1753388623215;
        Thu, 24 Jul 2025 13:23:43 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48dbfccsm22077815ad.138.2025.07.24.13.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:23:42 -0700 (PDT)
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
Subject: [PATCH 0/2] drm/panel: novatek-nt35560: Fix bug and clean up
Date: Thu, 24 Jul 2025 14:23:36 -0600
Message-ID: <20250724202338.648499-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series does the following:
 - Add mipi_dsi_dcs_read_multi() to drm_mipi_dsi.c for improved error
   handling in drivers which use mipi_dsi_dcs_read() such as the
   novatek-nt35560 driver.
 - Fix a bug in nt35560_set_brightness() which causes the driver to
   incorrectly report that it "failed to disable display backlight".
 - Clean up novatek-nt35560 driver to use "multi" variants of MIPI
   functions which promote cleaner code.

If there's a reason that mipi_dsi_dcs_read_multi doesn't exist, I'm
happy to drop it.

Brigham Campbell (2):
  drm: Create mipi_dsi_dcs_read_multi()
  drm/panel: novatek-nt35560: Fix bug and clean up

 drivers/gpu/drm/drm_mipi_dsi.c                |  37 +++
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 212 ++++++------------
 include/drm/drm_mipi_dsi.h                    |   2 +
 3 files changed, 105 insertions(+), 146 deletions(-)


base-commit: 1511d3c4d2bb30f784924a877f3cef518bb73077
-- 
2.50.1

