Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48BB28B3F9
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Jul 2025 07:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875054; cv=none; b=cabU1Q8arZizxK54/ACFOkeigl8Tsd8HSCNsAdQ9FAaLDvvwi1dr7YYJGNbhkoaapSScnaIbwksiRbUBNgN/+IzFEptMQ7qfeQ+7ek0BTa/fy9i+SPMBR6c4G1bXR8VMUflRWu0TvB81pXQiADS7fBUlEl5u0jSz5F+Fi9aaGhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875054; c=relaxed/simple;
	bh=ShU8yklGcE2Nn5vs6gIvPaLoQyjIaXH2iJ09CEBsak8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1f+ABuwH15qUOqxdcJOq1bDD6Bss2ZLRqIRKckKIYpd+HjZrIFpajfP82Qow7AczvqtroiBMhUJcKmDQDjsYLoo5Yatxw6OC8YS/UnHCVKDfLzzfgPBPlZb1B7w3PTzOUIe9h9cuPfTUIVJJwRS+VUHkmIO9mxYVcwTa86q/sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=EYhkp+0V; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="EYhkp+0V"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7490cb9a892so1580264b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Jul 2025 00:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751875051; x=1752479851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoWchHvEvGdP5Z/q0UzERLxYZuvcNkSip61qcq1I2gk=;
        b=EYhkp+0VBGCrQK9ycHTVehzNbXDOcWgL4O5MHvtVCi3v8D21T1RTUQhUe+ZK4mYHbS
         f5p5KjjOyrKiyFf32q/Bd4HkftHWa3TJ8om1ydn3ucNmZdfmfW2hluynBGJagQIZ6x6W
         V5LasPrbuRacGAekXXtk9wAiIWYy2fPmwh235M0Gn8k/jm654z6mdKvFUrjAuJAKh5Px
         nXVIrg74D/lQOqbgjZ4uG0wdXFILqhh4zqWOAjB/EEiRjYUV1u4af4iroOUb5AomOSFN
         vanYiLoZRUXl5EigaUomDcZqNeYpASvcgLqrgxfGj3ZrPqYCjLQI7TdXEquy8uusTesF
         IzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875051; x=1752479851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PoWchHvEvGdP5Z/q0UzERLxYZuvcNkSip61qcq1I2gk=;
        b=bE9nvDTGKZGv93RWbbfYaYJKh+UYNKwjsFfG4M83eCX0P7L1iMmgiNfUnr2ce3cYJr
         gyo5qHWzq40tm/XomuwmA5casmhga7DVpCc+vMfSpoi1+5ipIlfrJd0PAzU9MdzdbNMN
         txgDHIbZq4SHytsl1/H6b6aIXeA86GLoCME3s6Tk2ifWmuEYalW47RrePg4TbteKWj8/
         OY+eunZhIhsbgcrBAgLBJO1ko0tLUy+34zo7gYHUshiBn0irJoRpTLueB91R8ewx8BIs
         +WCKZ8hh2HszoLi0SgHOl1e0a7w028ienqn3erg17uApHg4NmhDwxDIwyo81YbAC+fe8
         feGw==
X-Forwarded-Encrypted: i=1; AJvYcCWRr3KrGbA1yMCiGGQxjkDTwgR6l7J6hVyQ5cUih+lETbXBjhCLmkko5bZjtIevvTA9f1tF4vtSNjIJE8Xy9eCyaCo2Jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWF3DxjV1hxpiehi50c8BIjiSEt/uryzqDgfSEI0ielx6U8Eor
	JYRQa4AtKNwfvW9ghSQ3hkfqwgt8DVUA3ilBcWaMuQhPveChH+BAtS85RDf6I+RO3Y0=
X-Gm-Gg: ASbGncuMf4IG9ZMqIX4zXpAelfbdAPzl+jhX1zcVkhAl6rRmCueuGRqZl6glSEg+Y0l
	oL6VnUxI3OE+yhyUa5N1aXuiX8bVKM7wvul9wO9QK3zqMBdNCkS9ep94G+fLztCRz9giKQvyOVD
	KpFPytP01cmm15893niqm0/S4TgOrNlDQC8Yb4GnfmMXVw2dT+7aIg9yXNSRqPTpDWQT8Nfnw/l
	0yQ9FFAy6vkldpNwvnzdQiCaIwilmZlNwUbZIzzqup3SRXb9UtjntttM7QRMhhgEiNYhpDuZsSi
	deGqRujuL1hJoSeFOPA9EcdddWZwS4LjKDxZsy/5bN6Q+WlPC3wctlqVV+SNTW9P+8kb95AMcML
	WL9mDHbhFRqo2y8ruIA==
X-Google-Smtp-Source: AGHT+IEItjQ5pli2AJ0rBOKHmZ7rfFk3/t/CL1j/RMQ2Bp4Fe+1XZFqzMaA4o2gCpzZkugK6AWVtuQ==
X-Received: by 2002:a05:6a00:2195:b0:748:33f3:8da3 with SMTP id d2e1a72fcca58-74cf6fd0ad9mr11173295b3a.19.1751875051077;
        Mon, 07 Jul 2025 00:57:31 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:57:30 -0700 (PDT)
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
	Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 2/3] drm: Remove unused MIPI write seq and chatty functions
Date: Mon,  7 Jul 2025 01:56:57 -0600
Message-ID: <20250707075659.75810-3-me@brighamcampbell.com>
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

Remove the deprecated mipi_dsi_generic_write_seq() macro and
mipi_dsi_generic_write_chatty() function now that they are no longer
used.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 34 +++-------------------------------
 include/drm/drm_mipi_dsi.h     | 23 -----------------------
 2 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a00d76443128..3b8ff24980b4 100644
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
index 369b0d8830c3..f9cc106c8eb6 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -285,8 +285,6 @@ void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
@@ -379,27 +377,6 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
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
2.49.0

