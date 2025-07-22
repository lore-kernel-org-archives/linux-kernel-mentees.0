Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0731DFD86
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 01:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753149209; cv=none; b=WqF46Vaj1PnY4wC1HvKI25c4PJ7L9ysExA28EmgNE3FkZLUm2B7IUi46LZiy2+8RA7lmOvUUvhhwT33Hgfsq0vSUbA9wgKf2HrvuN8DqK08uX0yLQVtqtTk1CcJdBlSRslEEaMaXaInPTsLDhYwCkzqAOU6ND6yvRJp5wG4gb7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753149209; c=relaxed/simple;
	bh=7Eifg3KSSA5Jt2qx/3hzXf0HaiUdAumge8P2aIN3a9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7JY1FrwzDGWQdTYAiJQa0TMp25Gx5OU9c+AOX70Eqkn3R6NHrvSj+At4fS2dUUtSJYoAi5VXBy/GP9/ul2Prz+unNnZnXuSyE946Qo5G3YWcjxlLCHsRnfBwsoGRzpaCZ6UGaL3Ye9yH2PhItw1gakRJ3Tyjq6EGeidl40TTpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=cMTu1vsM; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="cMTu1vsM"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748e378ba4fso5795373b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Jul 2025 18:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753149208; x=1753754008; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
        b=cMTu1vsM3W2UQfm/FjGrnzcqjVct/SDFOl79QwI/VNhwxLPL0mdg+fxl/xM92ds2dB
         QF3dHIJMv2X2ihi5xIgh3T7zZHuwV4FwD8Xc76JGvjn76dMYJoBXP8fqtlwcqRdY8P8d
         KIgv7v1XgL2up4Zm+PWd3dUPPTK3MRdXQjF72OXlMYUpmRPt+PgF8/rfU34d1IGaergl
         mUFYhybAjk0ZJpFe+Vg5UGcFcoC6T9G5yTgeCUy3ScdF8dkeSEa4gnBzK26f8kpcF5L5
         jWjYmZZMmgSP+OoH9lBd2SU4EKCYFxIq3v6wYFOWMaqgrH5G2qyL6C2JZpQ9IGv4qsHI
         Pwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753149208; x=1753754008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
        b=wYkOjUz52Kr71Azp/spGXmVmDpAL2XMvV3qugo7q92rLBw8UTzleAXVR87XMYpzdMb
         U9FdFzBSZV6jzQx6zPX8hsJBCt5i5DV5pD5tWZIRTFvHjujoAn1CCOMdhpn3lahaN7bV
         QUBPE2u+ITcbH0A/gW63qCcaOAaGD5B7XlNTYIldduz2ErIjg4MoXz+IP+sCcWFwatjp
         rgej+m9E/xotAUvKMT8KH+ksiRBYqZwt20acCxbfgU1T9GcYtET1uC6zc3xPQfU3rabm
         JXwGOelOMuHDrJgCWxr5mRtxOIKdeWBiDfW2wnNwKfPSVQ+wFIVhRxx1I+4cZF5W0sLH
         TudA==
X-Forwarded-Encrypted: i=1; AJvYcCV2NUYry8xJHLnto449o0e6BlgcXVJK0FpxUzeMFaoD1MkbgUf5YMsce80QqWDUjqM7SQB+z2EzD4DK76RG5HbwALeEIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhJu4gQpjciMzwt3I9VQVTKkwuT4ny0dgOT7W6Rl+o6fD5jF0k
	2shwBPVpbGkihtTRmmWDMEPbpWb7Ss2Qsw0xA/7Jv9mBUCkdaBibPg4LgbhOSfuP4bU=
X-Gm-Gg: ASbGnctssCG8XrYvXYPSa44B4KQvecT8Y7n6Pk/Be5TMHSKYCyzUqESD4x5w70HjCpa
	BfPhT/iCFRLBxwPgZeHxNKsLutQO914H+4m+Zg4jYYoHn2yA1T7uDgEX7IhBThiNZ//cRLqllXD
	hZs8Td0g8pNXxG5Zn4cmY6kSedpWH/QVuYX/9jmjtfhW8HByYo+AuVHWnJcCe2TMCjzJRkYzPi+
	NftiN4tqst5EYd2WflRRgfaNGi0ucYnonif0kgDTfRcOhrKd3tVQlVb+DTlOhIsWxcHMTteQe1+
	5QYnzmx45VxDPW/IS98PlrobKRpIXZsOGmEWuv+nZ5vIG1cqDHuaIVbr4gtmTtlCFnilNBQBooc
	dwZSzc0BeA1cW3NO5Z0xtyZdBfBpzYuX21MyUk9XLdPR8oXz9Ng==
X-Google-Smtp-Source: AGHT+IE6DV4AnVW0+4Gsag1rZoVLI3l8Jq88LM8p0J3ZdDdDROI+eXGNgt3ap9Wn8cOMjGOum41DxA==
X-Received: by 2002:a05:6a00:2e0d:b0:740:67aa:94ab with SMTP id d2e1a72fcca58-758462d74b4mr25646084b3a.0.1753149207483;
        Mon, 21 Jul 2025 18:53:27 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe62d9fsm6017441a12.1.2025.07.21.18.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 18:53:27 -0700 (PDT)
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
Subject: [PATCH v6 4/4] drm: docs: Update task from drm TODO list
Date: Mon, 21 Jul 2025 19:53:11 -0600
Message-ID: <20250722015313.561966-5-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722015313.561966-1-me@brighamcampbell.com>
References: <20250722015313.561966-1-me@brighamcampbell.com>
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

