Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E7A2FCE37
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770505; cv=none; b=iymswVWJqVLJOUytyTv10PmLtorg8AQuAf6npw/A72jCSRonq3ahAf7uy5pfSTpkPZk5XLiessfBv4m1pwkYI4xGgAbAXOrn/iY1drziguqtbIfWgCgQDoVkp1jAnSNcyJf7dnFSQUCfa2V06hiSTBOvMbAZvBS74KA1rzHKRCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770505; c=relaxed/simple;
	bh=qGfGL9bbADl7T/84kq26vlHmw3OgWOMa60LT2BU8GRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQmmN9RyTpHD73kzveVvw69upZz/PXE5jRquFULJCQy9nVuS4pRECJ2/s0NIsrqotQyial31pbNxiYyBMX12FndDGL+TpIL8KhsfYI6qN0/gNDLfaOSyZFUelf1KcZ0DFku9uEiB+JN348bxRZaE8dRVw/QoF2GzY0F3stbkiTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=W5jmkutN; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="W5jmkutN"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso1129153a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 09:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752770503; x=1753375303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6U6F7ktOHhXsfwCj268J79W4P9Jk1oA5CQY0LkezaM=;
        b=W5jmkutNKgi77lZArrC8hWmwd5y87kWQWbPV2mOWwitsRht5C2LMSmSArYubsJL0+J
         Ri3PiZeuIUsheGoKrGBGIKXXmiEnV8tA1sSYZsdFoDipUAJz+6jIJYO7oYtz0BrPHKtG
         2vv9azGiUls+AHgD6oyLEmjnnDMvzjycVhEul474y2Ifl3q0++cHrernt8rY5ZoLzCvz
         uk3S9q+S6jGpyAP8V8RfjXmsLiqjeuF/NxSOOAXrejYtYVQ0ZSIcTFDwHWn2nKVGn8pX
         Gg2EHUZt/V9wSUk0E5Eij1z/q3ErRKn6u2JL/nlfjjl3LptjNqVxxOqrXXMxjVvzwKo6
         9v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770503; x=1753375303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6U6F7ktOHhXsfwCj268J79W4P9Jk1oA5CQY0LkezaM=;
        b=U+WgWuj5QqgA5Q4fC5Ao/ERZjFDkb6up1JBSo5cev8c2DrFL+IFsEKq4LW2kAs3qkn
         FvGCrtLlLr5kkQ0lBfaBBtVQJm65L1Tnw2GSM9AhtuNTmAdcKboZ3yD7GATETGROvUYf
         Ub3FPoOKrH8hV+bWMmZPxl95G6dpoUbJV7xl9Nh1eWyTkRn0fpBpzFxCYGPPWKmabY0c
         iNjYOQ0LfQuhHvR6xeFDhEa24F1+IXGEzQxZKrfLj9tr+GtDnVk5zwx8g0wK2FrNdjMG
         Mb0bZU17yAmFy00O6TkrWSb/kPmqgBzQ5E7Ed1bupDksJpoydphReuNK849KfuXu/kQa
         Cxrg==
X-Forwarded-Encrypted: i=1; AJvYcCVLFs7sflPDXwDcFGYsj7Gx81WhIz9Cg2gBEOjT6ocEZQH2uIqhjD/Fon4dbFE1WbkWL/TwIm5vaSAiyBowFrDcDiT7lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlOqFHCxJ4TO31yJSQyeJ44YaqiIFKhbxNohuXxCVM9alFsPV3
	tzESG5IlJQ+hqefOqe6XAuMZBEPn3RAu4ObKH1quh3CMejR4bs2N1IGOHOxqF+1801I=
X-Gm-Gg: ASbGncvIJs4MTkTQBf12AU9hmV5iYKEECBv8ovKQ8/H5y/pdF6/cTvqf0ubNfBLGr3+
	XCAFZdMjngBQ0q546+LmMT/OOh1kJE746FiFHxU4YuhnlG6fFJsQcFpLSTAVp5q6qzlE2B8+0/L
	onIOwQDG3C/ksjxr6aSAPOt5Bvq1yQf+rnXFXvLzKOxf8xmi0+zhhAGHn/Mo9Zg3oPZMXocRHdB
	6ks022mpeLGRSXdWD6+4W36NZukkI465lxEg+KuhW/4cKhR9F1a1C+Bb7PWlRFVbRmhbfPc6ZxA
	qIMhtjyETBit2PmRg3XSirUeWmRq9C3tDumdGa6uKEF26oS+EtNb5FDpSY1k04mIEbOiph2A44C
	iF+VSbAEG9F5dy8ldxNuNjIioStKWG8nwSYiQPH6r0B2haeMjCQ==
X-Google-Smtp-Source: AGHT+IEtjvc3xhBloO4ZME3CaseiMwB11gSyKFagdHpdQow/ZgQmvELeyGJVwsRPmXNuF5C1d/10Og==
X-Received: by 2002:a17:90b:2542:b0:311:d670:a0e9 with SMTP id 98e67ed59e1d1-31c9e75ba9dmr10555061a91.21.1752770503322;
        Thu, 17 Jul 2025 09:41:43 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7e8ae4sm1821750a91.24.2025.07.17.09.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 09:41:42 -0700 (PDT)
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
Subject: [PATCH v4 3/4] drm: Remove unused MIPI write seq and chatty functions
Date: Thu, 17 Jul 2025 10:40:51 -0600
Message-ID: <20250717164053.284969-4-me@brighamcampbell.com>
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
index 03199c966ea5..1ab28fd70c8a 100644
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
2.50.1

