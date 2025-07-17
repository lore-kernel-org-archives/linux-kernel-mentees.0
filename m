Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD77D2FBFE9
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770501; cv=none; b=P8LS4zNq944nrQ9znkxgFJm7j5V+jtO72gZW6k2UAgyvBQPOwdnjaqPkruvYI5uQeATyWweOHWsDRJzIRLyyu+5JH53/4AOKOArtXsBfA/gcF8sdLFPJZjak9pzXJgFXr7j1j4b850p9+qX1h4LohRBQiFzz1M24sMXkI/3o6FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770501; c=relaxed/simple;
	bh=YLKILSjo4gQh4BZ0qx0l+2zG73ZqW4nHbnOsQdg4SY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gy/tX6o26GzYCjUipbQOUbhmIJCMrzSVYWLYTkP9lb1X7FwJ/Zpk9f+JBGA8vcE8lKgxqs7contFesb8nlBAsUMQC3KEYy9kM6yDwXcr272zBnqMxSiPZq5on4peG7XVtiZUa4b1cA5noMjEfIsVSyTP1ZtiJBChB0rWbCOx5nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=I34jK5Po; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="I34jK5Po"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-236470b2dceso10253745ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 09:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752770499; x=1753375299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXRb/auSmvjfek8uJ1YIyvtZo0QCAaoEdhxcCrHaPWM=;
        b=I34jK5Po2fzPupZlWxSHslG8MbDxeJ+y4fstPA5DkJLadFxxHE86SpqGbygcaMo8Qb
         XBLYbgZz74r3sdz9mE2vIqh5PKkng8t58FwD738RrqvFhfazPKHAw9wHo8j0MtbLLRu0
         f3KbOpyy3rEIVio+Vk+PLTBjYXsSO3pUp1gYDqSKMj1XDtZNEIP+9rmkI2GEIIeSFynm
         +mzRr2Ro4xjpG1bKmuNRC2ftddWdcB0V/QZMQ00yJqllCQuHJnsYrylaL4t8cwOtXOUy
         arUTvb7i5Ph4wTriwmf4A/vQcyhWu+2rJv1ZLkzmnGG8OmlKj4gZ3zvHgBlSoUkEbw0N
         EuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770499; x=1753375299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXRb/auSmvjfek8uJ1YIyvtZo0QCAaoEdhxcCrHaPWM=;
        b=GJ3MBHDVnC20nxSlhacTSxGxiadgF6926FeV2dIMW8jk7iCZYccXE/67SeMPrhf6k4
         UTS+X9TQ2+z7bMrQbIwXCUPFepp0gsSs4kVE8kDFezWOH1luu8xC/GHVyNPHRyu8uqgY
         xbnZ/rTIg3R2hzKhFRt+i57b0lb6bO9aQl/oUnLFr1JotjLoyN3VM2ddhW3KnUB7ZXTI
         xSjwDgmeFefMqz+ZXw/YBy5eP/mIQtGiJk2sYRxtiqEuc+bZ9U+qtKGGuGDQlAyrcFEr
         b1BMLZnH4QMWP7jofm/1kQTU/Vv2jUtmc/gWNDL8L6UYfH3ki5CzcJ+YnEg46tjekDR2
         CLPg==
X-Forwarded-Encrypted: i=1; AJvYcCX3BB1qy8tab8/YIi0FpOXF4JC9zuqo39vtuxNHwO63IWIjpm1T8VADMEUSKNht6CVUaVxidUpy6Lsmhw4LRYmvtKncSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9ITTYOUcop92txMP0BM4K+lRBtQaeqwQCONeTaHkwEzaXjxl4
	BnijyEbQYRVGfZ+B6aPmU895BEiHE79whtjpiBJF4+Y62gZJIF3LyT8Kz3PgnsAkKuY=
X-Gm-Gg: ASbGnct+bP/BLX5vOAhClILnKCJ7g/lvp5/7J3N0TVgdvg9mGYq0ActWwtDg9QQRQG5
	XRRqBJcs0n2N4hbEDqGLmR8T7R7CirIx5lNUgWVU2SXNsoXxyFXciNgpm1g6AaGOEN6WrFJcTrr
	PIBYShS22KDo84oO67/5nxvFRqF2qfzYE4K2cSuxB6Z5VJ8ndZOUDU04g0PPPNRRmMMs8wykYEP
	CJ9r2ArSksb9tsGkskRW4bc7E5dQeJhcpQctw07WlY54QS32FP7asDBLVdMGMbTLRvn4jykDccq
	3AvOvjZomeTL9WH7ebLYM6TOFitm+7JT0hOXFEb9IWEsJwg5oj7R3Ia3PKA8mdiyHQ+p6W0gK6w
	T/7sa9kNJL67P8v3ab2UTi1B8nNPwx0R5WlqhSpjKsYDd4wF0RefELGCU6Mhm
X-Google-Smtp-Source: AGHT+IHQUhEP8RVdomUjbzwvcSpmkLRrN2k+b3W2P/yZEwrE1afYAZj5NI3TgnCfzxILvDYUugHslQ==
X-Received: by 2002:a17:90b:4e:b0:31c:15da:2175 with SMTP id 98e67ed59e1d1-31c9f47c6e9mr10439506a91.9.1752770499083;
        Thu, 17 Jul 2025 09:41:39 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7e8ae4sm1821750a91.24.2025.07.17.09.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 09:41:38 -0700 (PDT)
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
	Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v4 1/4] drm: Create mipi_dsi_dual macro
Date: Thu, 17 Jul 2025 10:40:49 -0600
Message-ID: <20250717164053.284969-2-me@brighamcampbell.com>
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

Create mipi_dsi_dual macro for panels which are driven by two parallel
serial interfaces. This allows for the reduction of code duplication in
drivers for these panels.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 include/drm/drm_mipi_dsi.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..03199c966ea5 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -431,6 +431,30 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
+ *
+ * This macro will send the specified MIPI DSI command twice, once per each of
+ * the two interfaces supplied. This is useful for reducing duplication of code
+ * in panel drivers which use two parallel serial interfaces.
+ *
+ * @_func: MIPI DSI function or macro to pass context and arguments into
+ * @_dsi1: First DSI interface to act as recipient of the MIPI DSI command
+ * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI command
+ * @_ctx: Context for multiple DSI transactions
+ * @...: Arguments to pass to MIPI DSI function or macro
+ */
+#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)		 \
+	_mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
+
+#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
+	do {					       \
+		(_ctx)->dsi = (_dsi1);		       \
+		_func((_ctx), ##__VA_ARGS__);	       \
+		(_ctx)->dsi = (_dsi2);		       \
+		_func((_ctx), ##__VA_ARGS__);	       \
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.50.1

