Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90A921A421
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 06:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752735501; cv=none; b=N2rwvTq2ys3//qIpPr9mlXT197m046QvoBhuW5dSIPvZXAf7wHStyPbk+YTapMzGYrCzJOE7eeXO3l6ezA3yDRbJJ4YdGDVMjrXxVzV9BRlRuTEtllkTFRWgBMNGGRmRw5tymDv6jSlsdAE/6M5wBpu0HughgGAsxXIX8QMDwVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752735501; c=relaxed/simple;
	bh=8gILEV2wshZruF7SjKc8/Her8leo7VCCobv+IxEo+ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNE+ouQjXgC2w1+yuJUwBPXeweom+hK6zKFrPgz4GZWxZKw85likQff/JaYLRVW4MSJYORPbdiu+OC+tq65RM4xrpQjsvCbC7PbdEYrULaCMAHefmPR487hG8pubaqc8Y4xRsEmsQz63hiVwQUSMwwURZVdLXZOb7WLjpHL9inY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=QqpoE+xO; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="QqpoE+xO"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-748e378ba4fso845147b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 23:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752735497; x=1753340297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D4Zj64qlLFOiqXv/wSX0OcGR87OOiTqr+HfIllhQOk=;
        b=QqpoE+xO3KHDRQgYOWNLsIb6npsmQXouzB6st1TWFY7EuL25TG+3IX4I8iUqrmXjTT
         nPZMBLJcpoEOBFnTKLj7RH8efe3MAQiJbqgqiC7OWf+swv1jnXOHAsW53xBaq4YegHsX
         5QmVvikpWwZjDfKgMMJrXGL3ab9Mg6YA8H2V2kpaJxAcmQAgXUOmLiZNyKH8TsBiukMp
         AMg4CHZJulxUbv/Pf0I0/5sFi0WZZqGjwxKcuSRz7rpxYzM/499SyUQIYp5frnQq0Kch
         /niSG/j3/xX2kSJf5EJpQHsOZiND3Z3PL0qsC3G05V8lyGejEg+gLrumio4P4KE4/2Lb
         U9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735497; x=1753340297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5D4Zj64qlLFOiqXv/wSX0OcGR87OOiTqr+HfIllhQOk=;
        b=bjckiy5Cg1qsk6DV1FdPxsJFq7tUiQXhwkF8NtzSrJC2gQQTO3FV5LCN6BlzGmU+gd
         BfhCVQhEHn378sQjzfxk8l7QVzOY6A3/mUAjP6uYKXoGJQyl/zjtj3VU0PeEMDOwOrs1
         tYfaJR1X/Xt25ug8KUUlKDDiWimn0sBC1qZelHxM7/pAkGsJ3ppcRpSDKEAh1qKwf7Vr
         5RHBo6Dem+9Vh9vfPx8qVIcICfiwo/fDtT4kpTL64cYgLlbJMEc217OtiaypwbeH8IXh
         YBw+ItOjqwqoGy3RMwc63SnHBT/ceqG/oRYV9FZuAn24k1jdmoNvBnxfryE5WOaUVcHy
         z+wg==
X-Forwarded-Encrypted: i=1; AJvYcCXID9wU7hJSBf/muD6ImabDHIyLqOV+HSeK3bENJMfrMCM00VGY12pshJhmA2Cx5UpsCdIczM8KAj3iygHUyvmR3P6I7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPU+TPmh5J/fo+fFyHQSP+len+VSXvXqYKgj0RGDFfpX4ny1++
	ZglDAmhy3Gx50g8AcSzYskDdqJF7uxNZj9h85n6pr2eoVkbcjGKKZ+NcUugt5eyXDpA=
X-Gm-Gg: ASbGncvialpRYgsVe5LS96NTNSrnrs2ZnNFt1BLA4Mz9e6e6iRwu5ZfWVIyWMZsCmhg
	PA1i9BVpctag2s2/I2EWyVijHR0/xWMR6GDSCW8KiJockOZqs0VUolJjay0z8cfEdDj7JsY454c
	713UZdlRicUj5EL4e7lhNe2gr/C8a9Bl1uuNhtQKbiWdfROCSl9/P0dl4WEml04GgGEVaNfRyFq
	Qnjfm2Ak5wp6GnYMX/j0Cpj55ngajc397onVxA5V1OJe6TvvgnKaPqEBjsc9xpl84+IT0fQoZq+
	IKCnDR7hyahyJXEmRTF0TIsHT4h8B5G4oi5iO3jmwT5syn37hEt+grvSfvmxwpZTIj7+k8TB/f9
	luQrI6Ov9HwYdDgDZDu3MVfIksH3n0f2s5TjsbE+Y7P7tBHesKflMOg==
X-Google-Smtp-Source: AGHT+IF4uL0UE6/IVMLL8a5IBc0w9BS0oX81DCNFSPt471frTtvJ5jahdDuVoKlFV7+0mFnbfKekmA==
X-Received: by 2002:a05:6a20:6a10:b0:203:bb65:995a with SMTP id adf61e73a8af0-2390dc51b64mr2966437637.30.1752735496874;
        Wed, 16 Jul 2025 23:58:16 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4bc51sm15157293b3a.116.2025.07.16.23.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 23:58:16 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	diogo.ivo@tecnico.ulisboa.pt,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 4/4] drm: docs: Update task from drm TODO list
Date: Thu, 17 Jul 2025 00:57:56 -0600
Message-ID: <20250717065757.246122-5-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717065757.246122-1-me@brighamcampbell.com>
References: <20250717065757.246122-1-me@brighamcampbell.com>
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
2.49.0

