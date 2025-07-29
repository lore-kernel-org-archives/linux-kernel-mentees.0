Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC01237180
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 05:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753767888; cv=none; b=FJ1FN9ZNIx9TvrnqoBw2E95hWSNjAkfeglKGH3UKfr8foW8oBQMME2O5mXcEEaVmaatasCnE9gdIUptoS5qZa23z2buuj6/Yo+f5q5MoBiyfaU7Jw2tnIbCTejQ5SqVbjk1c2fpAeUuwSIT7Jusgp0cvSF1Hmu9w8GQtg16wQgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753767888; c=relaxed/simple;
	bh=wn6aIVhT5uYy+9pKOugbqhAK3ZKulr32QnRr6e2nGO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qnkiDBUZ2pCMicGnH9uXW+9kMEIOa4dLLNQUz/1JoUcHxoKAPnVcuMs73V8Hx//8o85IMUEKYYvB5pDESWgVLm9a/DhZJVyhEiOt5kiFbUWunw9h8Pd7BzpzOS00MvNqFjQoL97pcuFoUTOyfLaI+gzmx75soZ2prW5EaPILWVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=DD3YlM4j; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="DD3YlM4j"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-75bd436d970so3224896b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 28 Jul 2025 22:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753767886; x=1754372686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dyl9k/+GgCioEtou2dmlzc7vsavwZ2MlrAwTUSd5lFc=;
        b=DD3YlM4jHRkkQefftd0k+2y+/CIy+McoBM3w89wrxK5MWbx2sS4g0zbZi7LIBE5Uso
         zIV+dTfHSO7htz6QgFU8X74rFvmju14JVC4X9p38vDwDOfzG7ZoLiDq9eKz6CxoK6yig
         jlln7qDStaIg+VrEHDjTGZ2qbE/G4nhaOARGyFgYifbrJ/DAryhXpZbmsv4oYHAzDNkY
         Nu+9G+kGB2pOWXffdpcXasx6+nHBUOBNces+kXrE1aPf4ZKaAHiEb2foa9Px4GSb4W0R
         5iubl57boZpt67NZRvmhyPWWzkqc+UlpkFpiLSzvnAPSkHEnbVObHJQq+MnZk/zovY3I
         N66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753767886; x=1754372686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dyl9k/+GgCioEtou2dmlzc7vsavwZ2MlrAwTUSd5lFc=;
        b=eZ8q/1ZeMXM/nZLx6I0ZB3kZ2bkedW2t3brmdKC2vrH8RdBqbndfnEh9KqPDLWOYwu
         uLTDMi9jb/pJkyCwfCUrhfHKsztIaiDsp9XqzksBzfufA8md58D6yzKQlaWjPXsXposb
         WQL5phfOkusYc3JvC92cb+riEmB354cgKTfuxD+XeTCy4O2zuH2cXmGlxOoO9btgh5n9
         lY0aqdDewN3CDA3uqCzkZS8lW87Qjf+l0fHcHv37OaILWpcOrzcsin8axLZMCxYu8sqd
         p9bAn6152YLkidFk7zOxqaTIBOV6JRz0+EwdGkx0327ra1Zq/V41icJiKLQ6iRo/pAUZ
         Hovw==
X-Forwarded-Encrypted: i=1; AJvYcCX6g3j9122WuKvQt4FxFuGwGo4XHoscYAY1ZQZaz7993fLNYJEO8RECau+67OJZi3iGguVLkP+7HfbXcSxMpF68pzOCsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKZxhOjtP9UttF7Y2zPw8+L74U4ef+00wFBIxtI63RSfO8QM4w
	ix09uJHivOYoac5u+9vFZpiCYkGIO8yDu0ch+bSe2wypw36uPRCczo2Sijv+/Cykb94=
X-Gm-Gg: ASbGncvMOy8MlZo2ZwEnnennRvzDGse4/WGshvl88wKUBxScwlzA8ON0osfepS07cyP
	FGQB0bQkYZMvQYgZ7SxUGFqhknY0aC15jwzC3DcSU9kseUiK+nGLpmEdBvK7/FhkHfc5TuGarn2
	Omlj+rr1wsWZraQ6epH8dUQrwNA9z+XN6vpuLTjmtWksjbY/l7VOFayUbFy1JzQ5zzuYuTRkpXh
	/R1qYEl1pcgoNRu9pFExgJ/n5J5mgJhBsBjhijyBugcQPsvQniK39bdSddeBUWqO5dhfQnE35wH
	S7Bj4D+sq7QNEFUG/D9qcjyVOzF7ldgnh7gNfSlBcjmA59cu6up0ispicQHjW6Jrfub1XUFfp4A
	9Z08cV9pBuCOHHF7C5MtD/8s8zLVGI55qLZjjahQoJECI351rTA==
X-Google-Smtp-Source: AGHT+IEXjHtUpb2buMY+5CWdYbI8oH6HrpCcTJ3ZyV6pv+VA6IOFmuXaOileu5xjs8foum5R3PGMSQ==
X-Received: by 2002:a05:6a00:b52:b0:748:f74f:6d27 with SMTP id d2e1a72fcca58-76334fa7565mr21727897b3a.24.1753767885652;
        Mon, 28 Jul 2025 22:44:45 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640872a500sm6972462b3a.22.2025.07.28.22.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:44:44 -0700 (PDT)
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
Subject: [PATCH v2 0/3] drm/panel: novatek-nt35560: Fix bug and clean up
Date: Mon, 28 Jul 2025 23:44:32 -0600
Message-ID: <20250729054435.1209156-1-me@brighamcampbell.com>
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
row. It seems like although this feature may be useful for the nt35560,
we don't expect many drivers to use it. Once again, I am happy to remove
this change if it's not worth maintaining.

Add mipi_dsi_dcs_write_var_seq_multi() and
mipi_dsi_generic_write_var_seq_multi() to drm_mipi_dsi.h to allow
drivers to more conveniently construct MIPI payloads at runtime.

Clean up novatek-nt35560 driver to use "multi" variants of MIPI
functions which promote cleaner code.

Brigham Campbell (3):
  drm/panel: novatek-nt35560: Fix invalid return value
  drm: Add MIPI support function and macros
  drm/panel: novatek-nt35560: Clean up driver

 drivers/gpu/drm/drm_mipi_dsi.c                |  37 ++++
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 198 ++++++------------
 include/drm/drm_mipi_dsi.h                    |  35 ++++
 3 files changed, 132 insertions(+), 138 deletions(-)


base-commit: 33f8f321e7aa7715ce19560801ee5223ba8b9a7d
-- 
2.50.1

