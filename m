Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87902356D9
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Jul 2025 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752913632; cv=none; b=i2B+9cjzYArHKHcAtP3sU1YHfBmKuTERJ0ZC1ruWUbxtbDtiRc7lX46+AG+Vo6qMnuUy9kO5xgnmv8Y99BWNYfZWt3kzhfjf3vzIpptvXRf9iwOa4yLd6ZBjIoBe3saE7eaALbRGUQZNppxW6/Zb196xjVvLJaV0jfoZf+7aCRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752913632; c=relaxed/simple;
	bh=7Eifg3KSSA5Jt2qx/3hzXf0HaiUdAumge8P2aIN3a9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5P15bDlLCtEDWWUsk5iN1/+XKBMP1gr2HMtv/KYl5rUb8wTk0Y1jahAmBbW1M7nwzROo+rXwSijhGVrHhgV+LHLxyr+7DSDwfymkVdPJ0Xk7znsJzt+9BqOFHuWwqieq7Q1uzY/KBSPt/lQhooXp6qOwKze1vVdkPiRyUa957c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=U4bYT8Zt; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="U4bYT8Zt"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74af4af04fdso2727782b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Jul 2025 01:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752913630; x=1753518430; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
        b=U4bYT8ZtRDfaJ2qiyQCZom3/y6roFCxp3TbmeF4JzJCgbZ4iyXiunkgEMHGwPGLUjG
         nuAoLO2Y3pj9yUtmqKACTrxOdWCrW/BxnhweaAJkKY1iBnOphMOhq4zotB1tsRSLSRtB
         j7ceXflHXc+Y55vlepBmvleOrpvN3XtArQB704LMpnpOlrF+r3kYJNfo+gA2l+IPTL8Y
         QbBlCW90CNyhoNYoxnuBbPzx9VskZlyoPiAnin88a8q29qwpXL5eSeJGgn+zlkHoPUCt
         wbF04rks5sQojbR5YFS80VPW4SHFFa4GvgWce1Xha3DlOFuLAnNJG0Bdwb1GEvaHYzsN
         LrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752913630; x=1753518430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
        b=huxqPv8KYjmi4XhrhWbv8kTtUTaocvJ3fobFJBsA4Ich51+WotztPB+Xmq9Gme1jFM
         iVfxMxmOqL8PbT1/cFtTZwOhQD5xDbg7MahCdArPP+GvGnoT67BgdGcryL/KvPckYfoP
         +hCzrlOa51Gw+bSR0RXI1U1ml4hKmni2xkGnfrEqLLe7v3sJ3RZaimAYsTd1Iuj4tNHq
         ETsLIulqDrg8MBJrIpF9eQuLkRtyqPTSikbcoJyTwvFTEDbVo7ERtBpTNZRxW45+v+WJ
         zL1UpyDHpzRu3A75f7XXvIFgGNbmiodyzw5dhC7sZXrG20hCSAfmTKsuYh0U+07O0s74
         kqKA==
X-Forwarded-Encrypted: i=1; AJvYcCWs1oZNMUl+tpGkjgOLd5+y5Nx+IQiiN/mDm5Xt6sDky2yMxxNXtoVlsObYAyEFDwPQXY1SMBIk+uwy96JyvNR0iHeTaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO27OjrxbxW8hSSB1rIQ9kaZXtCHQY5D3pqyUY5b7B+K45GhC9
	oo4wixiz53fDB3BF+sRFIjjc5DXH/VglL1WV8zFiT3LHpngMN55V/sGdBq+qrZUxJiM=
X-Gm-Gg: ASbGncszlurPcwn+ky1Y7e4mqS6ZKFG715bePu2V/y0qFL9BPxWg0+cB4jyc3zvKM/j
	tBJitbf66ljertV+HN5YMWFI0eedg8YGQwaffmmi/f5pPNa1mEuwqdx+zNQbLqaWfFHuy0Xr/2O
	fs2lYHi5/Ly15k0snssyUfZLlNbbgmRp8MNYG/t9NNc3s4oRtAyerL139tLRPXD7gD4PLbOAkeN
	9nU68sNIfPrdeBU58R/K0vOiyXFahRYW4WyGngX9W9cfft5sCzhZ7UHARoXvApLd1zZjs4P1epx
	Ae0u4JCD7GqcYmgeOZZpnJ89qZjsRG46MDZcwQ/+lLZkTiPrJlIO5959vNn4kqOSxhnWUtCTtwl
	LpBcYpph65l5QFOFBf7wC5tGlklPCOyKX54hA3aNQQmwD2m6t7Q==
X-Google-Smtp-Source: AGHT+IGatphEHSAKw7z/xW0LGtlPVyO0W6ZIkOclORHs8NjYT1LzsjnDPk9buZ2iABOLqZ0brWLSNw==
X-Received: by 2002:a05:6a00:4c93:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-75837586b17mr13305132b3a.6.1752913630098;
        Sat, 19 Jul 2025 01:27:10 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb157635sm2475260b3a.83.2025.07.19.01.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:27:09 -0700 (PDT)
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
Subject: [PATCH v5 4/4] drm: docs: Update task from drm TODO list
Date: Sat, 19 Jul 2025 02:26:38 -0600
Message-ID: <20250719082639.307545-5-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250719082639.307545-1-me@brighamcampbell.com>
References: <20250719082639.307545-1-me@brighamcampbell.com>
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

