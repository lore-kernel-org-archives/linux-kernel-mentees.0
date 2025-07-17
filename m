Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B7A218AAF
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 06:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752735491; cv=none; b=iKfP4toH/K3PuM81n005keIonghp86+XF1oWPEenvZ04R0HhlrFykiM+moFYdMDSXXg7Zlb70VZwGe6wzoeQSE4Zp3XcZ8QQ/NfVy7DJIeupox8bHS4PAYLazv902Gc/VlO36tdvG57LWKLF0voxfxc+F3PhLd03o333Qn2gdIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752735491; c=relaxed/simple;
	bh=GS8FKUFJnXN4vb3m8ja3wGK0qiCPE38bwfUfDE5aU6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7eYSq8DO/q23aTKegMDnSkeKqaGpafuysKrw9JhjFYuF99H1l/mUrQTBhwu9irY/Ve/k2IkF5Al6wEeJyllh/c1O0oYlEv22QUiRI7kmVyfnNCtilbtQaJYyDjqJWpjajit5mvyFcVsB26zcICW4ocQWMkLZcuxxee2aYWxKls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=Hbhdg3l5; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Hbhdg3l5"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-749068b9b63so503500b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 23:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752735489; x=1753340289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/QwaJ6+SV8dLr3sbsgOJRijgIEa6kBPmB3FaWrqGQmI=;
        b=Hbhdg3l5UbEVZZfdxa+fgMCcyWGL2aaWYUtZYi18AE0MtkOcldcFgvN4ee6NEOwKIW
         Fv9XMgiGggz91iHO7A5UFrRcclzeHcag/1SU53OOlAa+gl581OkoqFk+xOeFTyspJNjH
         v3l7xPrG/6626b9zDxmjH+NKU9EDcwjrFwsNe+X0RpjX4YIk63sQ055hG30QTBTRJXBO
         07oJ9gHJa4j1h7pztXZVzIgMTOHJc6C2yR+/FSkbMEU3FQGgtdDwPuXrWyZkDN+DtLea
         NLuUefVd+40Ub7Ex4QZSaK59P+dN/Yk6cvfMbnIHaHCQLiQ2B9wipjtQQm7H5ybto1VV
         WG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735489; x=1753340289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QwaJ6+SV8dLr3sbsgOJRijgIEa6kBPmB3FaWrqGQmI=;
        b=LnRIAKtcpTgtIsteYvzgSJ1oFbRtagAq1JvsdLAqCrcQ6wRDCk4O2WDK0CKwuFelje
         G+TTg8EI/DQsB0+Sj+3fw+zZFasHlsUlhZZIFJha4mnmvITBVP8pBKM9FreQpgXoctTi
         oQ5gTEP2ZeGweD1TF1DVEUpPmuf52rhVDB3J9DfEg9SE+Z03xpbrtHDGT7Rx2tYH+jFs
         dipXjOYHyOMAVQiNQGGFkzI7RRZs0F8QJDeRLfXz4RcE2dlUEedNGPM+7l9YC4PltpgD
         dunWLTpFWICWxoQxDhYloaM74wA8qXS0RzgFD9nSjQTlRhDFbTDX/kHa1aSpWWY32eb8
         2nNg==
X-Forwarded-Encrypted: i=1; AJvYcCXynNQfinJFdA3hrquCOjw8PjcLTpTe82zFiOfyqWu0jwJaEU3O5A6aPUGKiKD5qTuBuH4QSVHaM12CBiOKySPDzz1E0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3VSOR2qnKBX4zogD4DSoTFMkju0np4neCoXbjiBNtuGIXjX8m
	kI18seVyikfkZZr2bqEABuHud1HxP0xTuAIKkH7Ana4By520/gmc2g8Y3BbhjNlrV3s=
X-Gm-Gg: ASbGnctBWDC8iAxNzw3hf1wlVvbNnHnY2SOAmwo3J8+k611gRvp898sPmIH1NDgLuRI
	QxfUvv5lFR0xaXQho+HduzUR+TlF/GeT8DBN+PDlJ4/OiyMRxQg/emZ7POOJ9b4r0S1lvBS9yyh
	b0tBLYI2NfmpuGm9mNbJFynHmRX0b5RDV+r+ZIJhNKqNM5TPeuE3bKw1uSx0ZsI9epXoEfiwi/p
	M0Nmgbtc5shn+n6q0Wva7ZMkub9QNsm4eZnta4LnxW6Ek8VEPQraTsWBra/ls4UYzCqVQdUGYPO
	fbrurfXmYz3cTpR8V54TdQx5K5HhHHZWla6G0S6kxPSsdfTcrQRBuWe4Tch/Uz8Iyer9VMCQMK/
	KcHRAvksxPzvPVDM+YlWTz+GBEO79sVk4CTDim1jDlAgFcWX/FlRtSg==
X-Google-Smtp-Source: AGHT+IEseKIfJqtbOw8gzUyfRbVBbKBWLtecuTXecrmR5KxL8XgEfMZkeKCbA0k+p/mbsZdrQYExAA==
X-Received: by 2002:a05:6a00:1707:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-756e7acf5e2mr8654099b3a.2.1752735488782;
        Wed, 16 Jul 2025 23:58:08 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4bc51sm15157293b3a.116.2025.07.16.23.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 23:58:08 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	diogo.ivo@tecnico.ulisboa.pt,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 0/4] drm: Fix bug in panel driver, update MIPI support macros
Date: Thu, 17 Jul 2025 00:57:52 -0600
Message-ID: <20250717065757.246122-1-me@brighamcampbell.com>
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

The second patch of the series removes the last remaining references to
mipi_dsi_generic_write_seq() in the jdi-lpm102a188a driver and updates
the driver to use the undeprecated _multi variants of MIPI functions. It
fixes a bug in the driver's unprepare function and cleans up duplicated
code using the new mipi_dsi_dual macro introduced in the first patch.

changes to v3:
 - Define new mipi_dsi_dual macro in drm_mipi_dsi.h to reduce code
   duplication.
 - Fix bug in lpm102a188a panel driver's unprepare function which causes
   it to return a nonsensical value.
 - Make lpm102a188a panel driver's unprepare function send "display off"
   and "enter sleep mode" commands to both serial interfaces regardless
   of whether an error occurred when sending the last command.

changes to v2:
 - Remove all usages of deprecated MIPI functions from jdi-lpm102a188a
   driver instead of just mipi_dsi_generic_write_seq().
 - Update TODO item in drm documentation instead of removing it
   entirely.

Brigham Campbell (4):
  drm: Create mipi_dsi_dual macro
  drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
  drm: Remove unused MIPI write seq and chatty functions
  drm: docs: Update task from drm TODO list

 Documentation/gpu/todo.rst                    |  22 +--
 drivers/gpu/drm/drm_mipi_dsi.c                |  34 +---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 187 ++++++------------
 include/drm/drm_mipi_dsi.h                    |  46 ++---
 4 files changed, 92 insertions(+), 197 deletions(-)

v2: https://lore.kernel.org/all/20250708073901.90027-1-me@brighamcampbell.com/
v1: https://lore.kernel.org/all/20250707075659.75810-1-me@brighamcampbell.com/

base-commit: 667efb341917bde19f5d7517b65defcdaed67c9e
-- 
2.49.0

