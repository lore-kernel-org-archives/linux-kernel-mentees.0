Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C073623770D
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Jul 2025 08:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752913630; cv=none; b=sNmJj91/gtI1Aji+zSRZrpD9kKSKqNjIzAfZhEAF+NMQ1fAXEwwSPJQiYK/o3mAOllaJw2OS0edmDURrZ6D9O5fOwTCLIrcgDJYBHTn58KKvM2PFeUHKaWxeDYU+CP7FdKgysueSGCA8OHAyzpRKcDMQjoejH8E96sD4Dn4omMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752913630; c=relaxed/simple;
	bh=bd+E0gQII7XeyGUMZUuFdsAUXKc9B1flbUYFWuIacjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taSoW91gCXWcPSvB1TuS4PvyuQzLOOU+EEaQRVwGkz1J1Hq3CDgV7eiquTW9RxYmL3uBddPy7V9PtUKxYX9qM68hHvmvv8GfApNhXnqaRvauTPyZQItw3+viKR5b5YLzSHogfYIRUH4wEbkK5sYGxuRzllUxEwxFkWyndd8iRgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=N8prFRjJ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="N8prFRjJ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso3111679a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Jul 2025 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752913628; x=1753518428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJeA0ZOH8c7XggE0U2uw5Qes21v9D2XQPKfKpRuKve4=;
        b=N8prFRjJI444/AEfeKMzNGYDSmEEOoETK20TXyUfd4EMhiVLGpy4iKf3YOd9eutN/t
         yVqItYhoagNG1953Sp9OFe5vAPf+3Eo+kkbDgZa24q4rWR2H2OMW8GVmtZ+nPHnVDh6x
         HzsNCqoi4if0Q2GUN/PW5j/ViaozhKpOBxaaGmrD4msgqvwrhyR7XEEZku3bePOsSCfg
         BGo9bMBArsgRwYw6iINtkdaCihDMKcWF6P+GJYHZhRxYQzPS2w5ONdgSF373VMd7wCyJ
         8Ku++bQ7y8FvYJEWUsFxmBG8GUT53fiLRb2LMFunufp/twLANY2mDi9HViD8e/C/Sljz
         ksgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752913628; x=1753518428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJeA0ZOH8c7XggE0U2uw5Qes21v9D2XQPKfKpRuKve4=;
        b=HB4Z+tpIf75KumKOjfRm88WCX8C7y/ElFAdJrgDchZaa6tumu6bVhmvl8Jo03Hp33G
         /8hoKtyCkds9KIKvHBqMBPlpxqZvb6vvbR8KaAE6D9CkLi9yaclOIDocIOKFK1CIMTj0
         fUxVnP70Fz0HfmpSei3CN1qaKtsfSbNxjQjijAnIIN4gUaApst1GQFi/7o4jnNSSInMZ
         dQ2qkiYfIuqeyelSQyYGBCX7jHDqi0SM6XsEhJrWEYiS32Q4QCch2OkpKtnPSax4A1ZR
         0Wre/yA4W/sZIHurvf9cgLZpYxrXGFLN1HO6ow7HrBusA/gnoET0gCuFGjcZSYe6v1+5
         1RjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxyE2xxJyPOnUk293cF+4X8YdZ13Sc+xFMptqAmr2lFzeM+jUX28kEFEiUI8+KnsRASCBFGNF0m5P9+HUexDalViWY/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUc84W6PE7Sf7rmb2V18x+A35PlziDJ5X0mfy8knoieetC7s+Z
	wugwjtW7iPgLR6yXMMWltHnb17dTq7W79laosw53GuBbaCXT/RnrfgafQ2FWC/LTy8w=
X-Gm-Gg: ASbGncs4UsI5B9k/uaMxB4wZ1KLevxFVREoQZerS+aKQiWRr1UnQs/nNrPH+V9yNlLq
	gz54/AjpnEu9Owg0RwKxt+KIghPY/SXA0RVuXohw+aVcVQl66Xv2KWyaDKF8fRYHjJvLYqgUos8
	kt00spoXJt2vVjf8QhbTp6Qs2KNgTOWI6QMavlJ9izc3JBCYXYUqn7PCT1sjVDpF95Fyqwl6XsZ
	VKJ5owxQA5H6y9KqGngdNacL0jfmyk5q9O3/NZpQyzMQDTTel0xCUigfdpQMNW4dNLlP3xOTMxb
	zuZ1+ZgvAfe6zGnGk2Pfa/lX+vMOBk+44iRBA42UN8rAbA91p+4Q+h2TdnT0v1uy6Bo9X2XsLz1
	bA54hUsTEOY35imHHYj4I//Oovo1yBkGIokP93o8tA44THv21Uw==
X-Google-Smtp-Source: AGHT+IEtGHThs3c5zaWTIBYa9eDjBCvzdPq04CWI3MnLdXSZNpbYivBg67p870OLCeNcYRQCUXTizw==
X-Received: by 2002:a05:6a20:729b:b0:235:d4a:1318 with SMTP id adf61e73a8af0-2390dc6512emr16725964637.38.1752913628137;
        Sat, 19 Jul 2025 01:27:08 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb157635sm2475260b3a.83.2025.07.19.01.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:27:07 -0700 (PDT)
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
Subject: [PATCH v5 3/4] drm: Remove unused MIPI write seq and chatty functions
Date: Sat, 19 Jul 2025 02:26:37 -0600
Message-ID: <20250719082639.307545-4-me@brighamcampbell.com>
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

Remove the deprecated mipi_dsi_generic_write_seq() and
mipi_dsi_generic_write_chatty() functions now that they are no longer
used.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 34 +++-------------------------------
 include/drm/drm_mipi_dsi.h     | 23 -----------------------
 2 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 4a7ca1261105..dff00d725236 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -772,41 +772,13 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 EXPORT_SYMBOL(mipi_dsi_generic_write);
 
 /**
- * mipi_dsi_generic_write_chatty() - mipi_dsi_generic_write() w/ an error log
- * @dsi: DSI peripheral device
- * @payload: buffer containing the payload
- * @size: size of payload buffer
- *
- * Like mipi_dsi_generic_write() but includes a dev_err()
- * call for you and returns 0 upon success, not the number of bytes sent.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size)
-{
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	ret = mipi_dsi_generic_write(dsi, payload, size);
-	if (ret < 0) {
-		dev_err(dev, "sending generic data %*ph failed: %zd\n",
-			(int)size, payload, ret);
-		return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(mipi_dsi_generic_write_chatty);
-
-/**
- * mipi_dsi_generic_write_multi() - mipi_dsi_generic_write_chatty() w/ accum_err
+ * mipi_dsi_generic_write_multi() - mipi_dsi_generic_write() w/ accum_err
  * @ctx: Context for multiple DSI transactions
  * @payload: buffer containing the payload
  * @size: size of payload buffer
  *
- * Like mipi_dsi_generic_write_chatty() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
+ * A wrapper around mipi_dsi_generic_write() that deals with errors in a way
+ * that makes it convenient to make several calls in a row.
  */
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size)
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index ffdfcb57cbd4..528b5979ab8b 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -285,8 +285,6 @@ void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
 void mipi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,
@@ -387,27 +385,6 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
 					  u16 scanline);
 void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 
-/**
- * mipi_dsi_generic_write_seq - transmit data using a generic write packet
- *
- * This macro will print errors for you and will RETURN FROM THE CALLING
- * FUNCTION (yes this is non-intuitive) upon error.
- *
- * Because of the non-intuitive return behavior, THIS MACRO IS DEPRECATED.
- * Please replace calls of it with mipi_dsi_generic_write_seq_multi().
- *
- * @dsi: DSI peripheral device
- * @seq: buffer containing the payload
- */
-#define mipi_dsi_generic_write_seq(dsi, seq...)                                \
-	do {                                                                   \
-		static const u8 d[] = { seq };                                 \
-		int ret;                                                       \
-		ret = mipi_dsi_generic_write_chatty(dsi, d, ARRAY_SIZE(d));    \
-		if (ret < 0)                                                   \
-			return ret;                                            \
-	} while (0)
-
 /**
  * mipi_dsi_generic_write_seq_multi - transmit data using a generic write packet
  *
-- 
2.50.1

