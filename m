Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA79286885
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Jul 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875040; cv=none; b=jpBmFWfKHXNTRTE+5Cw9wFRoQq9n2flFO9pFMWi/Vlp6NCvToKnXYBvVro+xjT5aK9djisrbUrfAbyBKSRm6kAr0qn2RxZ6+JKpk5yeyUa8Zrr3nDaTbv5FYgTTb6jcN5SQAHPxjSWJHBRxWJv4FcShwGnTMPw2yQjSdU+7Bj7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875040; c=relaxed/simple;
	bh=3jDMpGyu6tKmKZCNbOyYSDDf/AFtsCO10XzjbaachO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h8IZjIss4KBw6jBaZla3Y1V19RCV7VOXNRAUy/xzZ3/YeX0SVbECiJXRvye1hZVCuEcKOtXDSXw5pDwXUDEvOgMSqomMapA5PU8BS9Gdm6WOr1wwYDQi8j90cUWex3hak7L/g+RZE4enCPdA4K/B3vUW7akemVvrDzLS+QLnjhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=ZGST4f2r; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="ZGST4f2r"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7490cb9a892so1580113b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Jul 2025 00:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751875038; x=1752479838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQK/9TljJT68jk0i2VGXxC4KsVLmbF/aNC235kAq204=;
        b=ZGST4f2rzkpnrJy6WYDeOIeI3fYdg/3rImiUK1SnOQkHTZ6CWFq6J80rICcCiSF9v8
         sdGh4gk/BnCwhImRXSRI2j28LwGFMnfgvltGXsDctk909RhI0ujKP3rOZujDf58wp2wJ
         R0vG9+Q8DNihbHIfFC1KGTLbSKoa9iR2Odnb2Jqzn9LwVXy4geO5qAZZqaYq2GYhxNz3
         7o2vrEyq+s0RoGGnrGg9wIjPEMxxclWuyqWqyyFtqEBEcbKRKlBkaGrdBwKbYoNO2T33
         UsY7hXQwGNo12kNalIp+FtNuGgxsvIjAct91c8tP0tPwNN7g4yxKMpmSqQmiMneVeZsF
         /mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875038; x=1752479838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQK/9TljJT68jk0i2VGXxC4KsVLmbF/aNC235kAq204=;
        b=oTK9SJgGzif7B7MIuXndHOkMeaMAFu2yJlwKw1IpFD+stYyi9IvxVaNVpVqO/WarBH
         g4sGDE84p01g/W83YpuYzK9MZ1GHvG29K9SgWuPI3yiSWFENVDYXvb/ojfmHDM1YdWC/
         YCW+vsa+WuO5ECGjfZWuAF80Arx927jkyBmw/ITiAE8I3ZqmDeA90gJ9Q5oH2RM3ey33
         i/F9Q8UyNqw1Rx7jIs/jFMO+uzmO5xfq3XsfqqakDKrOfts4Soz8993nRYngp1O1uNon
         WGVUWTdeb0N0yWxWr+QnNIhHosZNBh7wd+hc8EsSErVngEfA5CxdDptsZomc0A9AYDqb
         D4lw==
X-Forwarded-Encrypted: i=1; AJvYcCVAI+15hLIBPjo08w9pA7mzViHa2MLFyPhnNJzC2fhUox8UI+3oyKKlCtDuyLALE8cCMKwOuLN4FCywQRyf2LT7/E+Pvw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/ejGxTI0qOoyS0idfiwdjEsG7aydR0davSE/UnTxYoj70F14C
	Ouo28D3wBC6Bcoa8s7BdvTZRuf2qQYMVjty1bQZkBd7Ij0HSDAoUSoCsh0aJ+OTybOE=
X-Gm-Gg: ASbGncv/ZLSwfjkRc9Z4DHRocBdy6oNY4gMm7MLv+KoZv8o2lyAeZXO26QcaYojgpp7
	Q+O82YADNDvmLeUFuhHOJ6ScvAiF+RhMFUexOigumEOCGTLROFDBKenZZBEtE0ITmrDt3H9prge
	UmwX+VNpoYcLWA5njUpn6THZtXebghasjf6VgaRGafOQ5qgdXRjc4oRTJQEhdZm0SFronauwGPI
	gL6ROSb0rG+ts8RDrxSt6qOW3NcBZXIxiAjvB8RM6dEoZ/W8KL3zrbdd4bY2mBzlS2sRG8x4CNz
	SxswJ1B+4W1N65YCpP9QUhSKbwUToo7QOUV0KLmZYBfZyw3W2g6jeqg2No2roRVeOBu04qIXhB0
	sxUSJCDUkAVfMByp+uw==
X-Google-Smtp-Source: AGHT+IE2lbn1qBhh8KgJDxKX2gey0GXo1rH+SaJuo7y82wLYHSPHk5Utp4cnQZCTDw+CPsMhqqQlfw==
X-Received: by 2002:a05:6a20:9189:b0:21f:5aa1:3102 with SMTP id adf61e73a8af0-2272235311bmr12458991637.37.1751875037995;
        Mon, 07 Jul 2025 00:57:17 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:57:17 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 0/3] drm: docs: Remove deprecated MIPI DSI macro
Date: Mon,  7 Jul 2025 01:56:55 -0600
Message-ID: <20250707075659.75810-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the unintuitive mipi_dsi_generic_write_seq() macro
and related mipi_dsi_generic_write_chatty() method from the drm
subsystem. This is in accordance with a TODO item from Douglas Anderson
in the drm subsystem documentation. Tejas Vipin (among others) has
largely spearheaded this effort up until now, converting MIPI panel
drivers one at a time.

The first patch of the series converts the last remaining driver to use
the preferred _multi() variant of mipi_dsi_generic_write_seq(). This
work likely hasn't been completed until now because the panel's usage of
two separate MIPI DSI interfaces at once requires special treatment. Any
behavioral modification to the jdi lpm102a188a panel driver by this
series is unintentional.

Brigham Campbell (3):
  Replace usage of deprecated MIPI function
  Remove unused MIPI write seq and chatty functions
  Remove completed task from drm TODO list

 Documentation/gpu/todo.rst                    | 18 ----------
 drivers/gpu/drm/drm_mipi_dsi.c                | 34 ++-----------------
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 18 ++++++----
 include/drm/drm_mipi_dsi.h                    | 23 -------------
 4 files changed, 15 insertions(+), 78 deletions(-)


base-commit: e33f256dbc293a1a3a31f18d56f659e7a27a491a
-- 
2.49.0

