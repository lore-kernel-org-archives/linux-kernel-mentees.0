Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E89C28C5C7
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Jul 2025 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875058; cv=none; b=YSsnk4Wc6zsb1fSjaMaThFxrztsy/XoXaNsGKN2/EQ5P5ercPfiIznAMlpQ/5RBi7Mczeprlq6DW6mLyF1Tjwv2x7D1x08VoviZWz6DMyY9SFvRXwuwr547TBGwQmjrARsfzbBxzrVzmgvaE5OB/bMNwk4lmlNjYt6xjpkqESIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875058; c=relaxed/simple;
	bh=TIYvoKfMMCjlv2uIdTylizwMRIdwqTIRMTgS9s8saVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+GQ4WAy63wRzyGXjbMwmD28GMyQOWARSIOuW70IOiCwNQJ1wxTKRzHOxNMqS5TmyiHfwK79GQFVr03gQ7uord0OtZJPDKj5AqOPWxgvmMKgJkOISMtUVpFpMWS7tGC7wKFW7PdZlnDmQSKUlkgqNG35t6fkFLwv6J8FMovi+Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=P49QcLuH; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="P49QcLuH"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-748f5a4a423so1534364b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Jul 2025 00:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751875055; x=1752479855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MC/xohKHOcg+vnOOSNCEDTYlZuTz6zJxo6U8fkD0yY=;
        b=P49QcLuH7dhT/bBT+SuqZu+BT7NZSAucmZwum8a13RnqtiMU/sXaSofwCP6oeCC1y5
         gKp60hY8qWq9xGCRGMCQtFR5QHps2DUyXCUAZgd5KnSq69BN6S8kvPseKfsQlTFpwcge
         9VIa8GPyCdxo5UprGHQypoi+YME1bPJOK4B9jZ6xFshdC71isMqE8AggLIyjCOfga7NY
         ELxCoHIGSe1YbzS2tpK5RFwZuSdOr8wmMOhm5BN7AaCUSYC7o0FSySyDKPFUvd6nz5l5
         qG9uR00oWVq1nHEwBiOs2hDYeJ/1HRyXQohJ/5GWdKhJym9D5u6Y2g0zfKqE5Fif1kgJ
         ZEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875055; x=1752479855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MC/xohKHOcg+vnOOSNCEDTYlZuTz6zJxo6U8fkD0yY=;
        b=Pi0YMXqAoVTMvkL6+BkGFXBw2Za3kB4TV2l9iS+AWCGGCFg9nz+xjJTRiHlNowMKzr
         PCJFEg3kbGzBsz837UJHOszr8bmWUi1dMh71z8hk5te8gJPIDqyn4Oc7AMl4QAFIulQW
         EFd5920OZX/z/1T2MOrFRR9hWQxq19YfqRBN4hCsXn39RQGBkkZ7GxkYkGpesz4Ubwkb
         mO0QTDN+RWbZrl513rsvRUjIAyZUWHugidgvOfWPzD82xBKuFro3gek06Z8n26E4THKJ
         6nPnuinbrtdWyWv7reApPVOa9vSasCGXvdOWXcfaM9fbuu2f2KO7/yD4NeF4Y2wR9iC1
         cEwg==
X-Forwarded-Encrypted: i=1; AJvYcCUPw9duXPCFehbtc6EUsCQOa3L1WRnQwKEEqkPkUhfI+d5btCu2ZJHS430xuUbqMvCwerVPlmD6vkrJeMMiTx1IsJuhuw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2jx3FMqCNzJPAjkR9jrAht+FU1U+PBIGE9OxjojgOPBQDRBXV
	TKYenL9sIBc2eo38wgjlQXSjcmv6Gkw3vma9WTZQ9wWuWc5L3QJU6WnEkFhkQrJZBMo=
X-Gm-Gg: ASbGnctdnuqq2ohYpmjEQz0Vw46ElBnAM3KpKLuL3niR0+YWXUetSN7A9n39Btqbbv8
	XbfPUjrktMjeS60HeGoiKU+5TRKE6HvuLTBWhIfMb5ZrZO71O2EbOzOXz3m0tWfj9levHPotkdb
	hKDHfgscMDSzKwukrc3YJ7ggGPG+eNnOrMa+wvPjGafK0BmkyhbfJ3zeIC1Se9pW2kImajsvRaG
	I3G+t0pDPXtHOTtLVcw05jNeRL+oJ1rSSi2Mdcq1Aju+hB7I0N57DPAdvXnkqRmQcVACW1o1pjE
	1Ko3AYnuEVxOYElnROTJuiMhWY4jv0zbz/uDgjaf75a8HcRBxbGMIeGxz9E8dgBHfb7BBI0V21Z
	9dhq+Bm4N5giabkTnYg==
X-Google-Smtp-Source: AGHT+IEG3rUVLj/sU9Sc3cCmT/rktoO/r9+WAKUWx4b+U8GR+jBcTNhe69ooHHcJV8ngN58Oe5tUvA==
X-Received: by 2002:a05:6a20:2583:b0:21f:54f0:3b84 with SMTP id adf61e73a8af0-2260b96873fmr18892440637.35.1751875054860;
        Mon, 07 Jul 2025 00:57:34 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:57:34 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
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
Subject: [PATCH 3/3] drm: docs: Remove completed task from drm TODO list
Date: Mon,  7 Jul 2025 01:56:58 -0600
Message-ID: <20250707075659.75810-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707075659.75810-1-me@brighamcampbell.com>
References: <20250707075659.75810-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove TODO item from drm documentation to transition away from using
mipi_dsi_*_write_seq() macros now that the work is complete.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 Documentation/gpu/todo.rst | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..76afb8a784e3 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -497,24 +497,6 @@ Contact: Douglas Anderson <dianders@chromium.org>
 
 Level: Intermediate
 
-Transition away from using mipi_dsi_*_write_seq()
--------------------------------------------------
-
-The macros mipi_dsi_generic_write_seq() and mipi_dsi_dcs_write_seq() are
-non-intuitive because, if there are errors, they return out of the *caller's*
-function. We should move all callers to use mipi_dsi_generic_write_seq_multi()
-and mipi_dsi_dcs_write_seq_multi() macros instead.
-
-Once all callers are transitioned, the macros and the functions that they call,
-mipi_dsi_generic_write_chatty() and mipi_dsi_dcs_write_buffer_chatty(), can
-probably be removed. Alternatively, if people feel like the _multi() variants
-are overkill for some use cases, we could keep the mipi_dsi_*_write_seq()
-variants but change them not to return out of the caller.
-
-Contact: Douglas Anderson <dianders@chromium.org>
-
-Level: Starter
-
 Remove devm_drm_put_bridge()
 ----------------------------
 
-- 
2.49.0

