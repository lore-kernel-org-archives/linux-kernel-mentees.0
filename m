Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5604630C608
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  2 Jul 2026 19:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783021366; cv=none; b=TlkfQLL0Vr9dhygz2qpOa+MuNAYVJjqhlqCWNVBbz32zwmARC5u4Tj7GNtW6yp58V5QuVbdbmeFATvrVBCueGER8Qki9OX1GzPmXkpTBc3JUa05w6hUSRzj6kvZwVS9TGBVs6q7mf8RWqxE8gafNKVAWbfGz66M2ket2guf65Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783021366; c=relaxed/simple;
	bh=KrVMx7MHyN7L5OlsHax1tIjTlObnyayd4exTm7/iVlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B5bX7cFXWJhPUU55qPMq7khJtDxS8qep+FKNwz7gKBn+BofMJ35DqC0ChoDeJ2RkKXmrFc8874zP5/KxKJWBqneQKKUPoBgz7PTa0TUQBF6HTpF7RKnjhjiRRhfMeUtAaDv6cXe9kH6R0Ea7wYPXo0ZuK7UFjf6/JqMEf/G1LcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1k37Knc; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1k37Knc"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38005a36edbso1684465a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 02 Jul 2026 12:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783021365; x=1783626165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tm4bDoApmpWrd6k5Z19j/I/Eof7hJXg6y8wwhqvnFu8=;
        b=F1k37Kncls3mePUVVdg4ATvCEXHoHx2PEhvF/MYl/S7b0NAmfZlTL0O047PK3nd+14
         N+mLEC9k7wwqyZoV12CRH3V+YjYDoRHowKY1eRQV4CvlFmqPdXTopJc60Oi4BwNYVstS
         ZXKeEq71qobG45Aj9rGWxXF7X0tWlROxfYgHrJXNr8cJJerW0u+hguDA1TBnqZwXP2MN
         D92nDGPHN+iryjquwF52R31RzGDLlQsqdhpWIBk7a2t3BkGwzYHBK5oQYfUwmT70T98a
         A0qeJEz2Z+H+uGqM/ylyefeJ8+wjbggiLLHUG1+MKdqnhRo6gS9tzlKyPOMFcR7tSGTZ
         33/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783021365; x=1783626165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tm4bDoApmpWrd6k5Z19j/I/Eof7hJXg6y8wwhqvnFu8=;
        b=NJQ2wRbL0BrZBPLSoE4pt0s3AdkegjaDF9SoCLQu6IKzJYu2r2Jb/DKW2q6+ohRnG1
         2b4NSbczvzaqGmaBtZPX09YITc/xOfKrW0JSgnaftSY6IMeP4MqzSCBUvbPRB9s1/n4q
         T2tYfeKBua9GEKDSrtiNGbdFvXAzNU/6pVt/FPjpdACkSN2ReYYFGx+WFM1zfbvxjUXF
         3pSaGp/ZwNNMuS7DClnIYIjiZJT1gjckujw4YEIFfXfNln3quHDjuQZ6hZJYlghy9I8C
         3VyOZjQohJ+6bZZOvuugjcbyzwd8gSGvnTrfzSA59ILPCAfV2DtvSWHrCf3Pwqxv1NsC
         W9pw==
X-Forwarded-Encrypted: i=1; AHgh+RoVnclYYjgQZH8oBAJVnev/kIsb9+mtqRO0Lwwt3e0C4GY2ynKfIoPgO860G7ZLyK0IO7EHWnRT1JaZ/XctqhHKJoF48w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhAlIinlZ5PcWJ2R79xHn06a/oHoxQa6FnOsCgmRdbBk73tj2D
	7GzWscMdrNQVs3QC6c3GXc+Uqd1Sfh/URxlGM+/MArrJmHHa4F2jfT8=
X-Gm-Gg: AfdE7ck/r4k9cGOd00VFlPhOsjxY7RyvM+fgRJRWDsjBihc4J/mrbOwDcO+Et44j/mA
	dzty/DM96HXSGgIv/UtFFnAmiqyhjyb7pi7aD88NjAHAyXEsJ+igkdevT9aNxlqalTnguvfifv/
	euqy8G4IgMVklV3srfTxC1DD7otIZwQQNIByWMiOCNudMwYXR/o2LHxH9nGoVQjg/j3V92DrRdN
	xqkPoq++zsNsPLh3qN6Sw4Lu/e6fjMwPcZI6vloI6UqOAT/I8uG6keH2i5XdH4dOTSYzk87kWXi
	m6L+kKoDQ9dVRQgkPgTwBrGU8uYXEo5Jwu/gDdnAUwkAVWlE+miYDwJKagIl4ar4qbDYkP72p5g
	fQ5ehJcKRwrLUvBgaIFOpxq3pXmzWWlel6V1Ie4nOvhwYVGtbY5Qrmpmt8ay9aSrHFISDyXemJr
	TX8dWpxXuZsZAmXgy7O63tpxp1ab7SQD7FsMLGZWFZQiHKWDb9Bpf/oZ38vZzzpVjz
X-Received: by 2002:a17:90b:3b4d:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-380aa1cad55mr7849058a91.16.1783021364547;
        Thu, 02 Jul 2026 12:42:44 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm12923165eec.2.2026.07.02.12.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 12:42:44 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mipi-dsi: docs: Mark mipi_dsi_compression_mode() as deprecated
Date: Thu,  2 Jul 2026 16:42:18 -0300
Message-ID: <20260702194223.290763-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The mipi_dsi_compression_mode() function is a thin wrapper around
mipi_dsi_compression_mode_ext(), which is already marked as deprecated.
Additionally, the non-deprecated mipi_dsi_compression_mode_multi()
alternative exists.

Document this deprecation to encourage developers to use the multi variant.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 3ac1dd5ad640..9e20818f2de0 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -699,6 +699,8 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode_ext);
  * Enable or disable Display Stream Compression on the peripheral using the
  * default Picture Parameter Set and VESA DSC 1.1 algorithm.
  *
+ * This function is deprecated. Use mipi_dsi_compression_mode_multi() instead.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
--
2.47.3

