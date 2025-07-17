Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D822FCFEA
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 16:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770507; cv=none; b=ncXwz1yUygu8as0lBdYh9oKHzpPsBvwo6Ztx3Gw1/ArnuK7kGtTsk/8mFQN8W0xzdfGT89bes1FHUMw+0mdMljqmQC0xCC14Bs7+1WDD9mUrQryEyeUWBbCJgSZd6okFwYz+7PgKq4ju/9p+ZOBFl8qhupHOpuV+W/gziPcssmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770507; c=relaxed/simple;
	bh=7Eifg3KSSA5Jt2qx/3hzXf0HaiUdAumge8P2aIN3a9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c8vDXJ4YSc/BJSrXJbbpAXRTiC7piVh+inA5CF+/9Fd/zWKDFTd6eKEYoyx3yIEnJqIdsUwBBNaFIMNbIl8yBSIiLGlT7/W89wJT1iBYpc1QBBKqQga9G/wfU9TcA1jjHwbgLWOO3ElSaix5pVs7B4vElwTGbiPC5BAu5pEoDsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=njY9RZUk; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="njY9RZUk"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso1207763a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752770505; x=1753375305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
        b=njY9RZUkpRMns7YYGHs/P+K6nAwD6rCta8Q7QPCu9MVqV1icnLdmVTU9op5dsZQ6PB
         N1/N9+ogzMiQOb3MKg1WqffxgEDgWES/YABig23i4a2KPL++J09xYzTRz1ao5IC7ecpB
         t/TT1zmBrA2t3OOqXyE2nixY4lvqFl6nLnMav7iIy1Arhy8nJe9dySaPtHJOio5G4ags
         QEHxBXeOgKqWjnJjLC8w7+4fHL7+Wyw6Mjgo0T1UQ0iDuXJPb6UaAV4jlS0nFqK296X0
         j7J/kD9JJGirFA0xA10QEeNf2VtpGGe+a8ZmL3ffk8j0FsecfXCAv4AZPxcN9q2JQtrT
         BkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770505; x=1753375305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
        b=CiLn5zjiAVChlzqvh5+VrA4YQJG93C9JCxZsdaGBHVqX/EFIN079Tk2ZmjAZOtl4ev
         x9ACBQSVbxpTkqxzPX9Tj3kWkYRXiDUlvVe1lKtgY3rVVz87Z2R1SfDlDPFUTi7VwQGZ
         qfZP+qi7XKomyB7VCY8bxKr/5KtEdjHV4lc8Mu3AVboIHxH12bAVc2J5h7/hREHf/eOL
         L9pUHnSLnxeXthLKCyyTlRxrwa241qW3KBvkNbsr3gdtW2SNLCa2GiChoftQFcC4A9bH
         zHCvyVH4oGq8XTsmHam72YPerH+/FyHriku/0n4bZyH57kH/dBBPEsf68IMP183NR5b5
         kZmg==
X-Forwarded-Encrypted: i=1; AJvYcCV7Xk8AtFpSKXrc40rEPcZ3tQsSTi1ovQAbrVikJ/CmwzyICVcVRXPRsZREuT3FTuf1ng86AO5Tb3yIeiflKuHv5iHmeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwiCzY1fF7CRtdsXHD5Z3PhGqM28c1ikuJk/K9AwOVpnal7lZId
	otCOByX9CQF9FN5VfvBR+d8a8uCPAjoTvYbX/dXSlcC6/2jqebkO5h4m2Ej2UJ7udmA=
X-Gm-Gg: ASbGncs+qHuOV9rSvh7KafEjoIu6F1S3Tx3oArE/bdFi1V00LVRl3EUZADR/Ko+OP3T
	HOGD6VLB4bc+2//TECbCfmKFOqDWXHRy5h2SVS4s+fmoSxHQ1wEVNi4LGLsLgA7Oxa5oHWR/bgK
	w7393urVUmIpIo5RYPdJKfKErJ2yVQL0XZrSbaNzBfP/xckvdHiMDas9cycm50Q0zzrCZ5EsgOo
	A0OnFRHuMe/0lVcgz2V+dsfxOTa5Hl88KeTZYQj/176O5+Sl7bDmFDMraAy0PB8tvZOV3/dh4Mr
	WY+7jKXZMtbeod+hNjmLqO1hPxT5Ysvx9j0bhzf6mR9lglglfc+ETLNWztqHypFKPLtG/LkRNGg
	gtuvHMrA/FwM3Ef22FKg/5PdeQKulTexCBiBNQxsQlh5aExPbmw==
X-Google-Smtp-Source: AGHT+IHrQlGV1Z7kY2qfK70zL4oggkzABvGWlF/G0WdpxXkZbFgRb1/eSGO9ppbowS9YeBigJnqdWA==
X-Received: by 2002:a17:90b:4985:b0:312:25dd:1c99 with SMTP id 98e67ed59e1d1-31c9f45e1d0mr10064867a91.19.1752770505309;
        Thu, 17 Jul 2025 09:41:45 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7e8ae4sm1821750a91.24.2025.07.17.09.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 09:41:44 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	diogo.ivo@tecnico.ulisboa.pt,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v4 4/4] drm: docs: Update task from drm TODO list
Date: Thu, 17 Jul 2025 10:40:52 -0600
Message-ID: <20250717164053.284969-5-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717164053.284969-1-me@brighamcampbell.com>
References: <20250717164053.284969-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update TODO item from drm documentation to contain more applicable
information regarding the removal of deprecated MIPI DSI functions and
no longer reference functions which have already been removed from the
kernel.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 Documentation/gpu/todo.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..92db80793bba 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -497,19 +497,19 @@ Contact: Douglas Anderson <dianders@chromium.org>
 
 Level: Intermediate
 
-Transition away from using mipi_dsi_*_write_seq()
--------------------------------------------------
+Transition away from using deprecated MIPI DSI functions
+--------------------------------------------------------
 
-The macros mipi_dsi_generic_write_seq() and mipi_dsi_dcs_write_seq() are
-non-intuitive because, if there are errors, they return out of the *caller's*
-function. We should move all callers to use mipi_dsi_generic_write_seq_multi()
-and mipi_dsi_dcs_write_seq_multi() macros instead.
+There are many functions defined in ``drm_mipi_dsi.c`` which have been
+deprecated. Each deprecated function was deprecated in favor of its `multi`
+variant (e.g. `mipi_dsi_generic_write()` and `mipi_dsi_generic_write_multi()`).
+The `multi` variant of a function includes improved error handling and logic
+which makes it more convenient to make several calls in a row, as most MIPI
+drivers do.
 
-Once all callers are transitioned, the macros and the functions that they call,
-mipi_dsi_generic_write_chatty() and mipi_dsi_dcs_write_buffer_chatty(), can
-probably be removed. Alternatively, if people feel like the _multi() variants
-are overkill for some use cases, we could keep the mipi_dsi_*_write_seq()
-variants but change them not to return out of the caller.
+Drivers should be updated to use undeprecated functions. Once all usages of the
+deprecated MIPI DSI functions have been removed, their definitions may be
+removed from ``drm_mipi_dsi.c``.
 
 Contact: Douglas Anderson <dianders@chromium.org>
 
-- 
2.50.1

