Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA63219A9E
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 06:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752735498; cv=none; b=UX74Su6NjCyvAfziD44rs6CC8swQ4Jrf8Kdql9bv5Y3+VZhGVjZYj4AWzYN8ALEmsAfPtV/xYCrt7iepMD1DeUtpY/15yShBdQG/YsyA+x4+yXxtWeUfeSGcvaiWn+FyiCVv9Qv4rsvyiCIRlpzu95HC5oXiFRePILVs0rX0org=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752735498; c=relaxed/simple;
	bh=x5tLs/vytXfpBM/X8/ZZ8tUWpkDQaZkbiuvJuIXmb/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YqgimQMmJDCGr6Hi2Op7UR1BfcRmSqheRjvIEMfn/vO/85xmWYolIYGJEf5mGtBG7lKsNYrVPgKY8FhWkPhHzC7miHT/l1XdDtnqCftGdsJ2uIaAy0OAaCZqLaYOpeWvWpO837Dgq0j9n9dKj/qbtsgPOS9WpX6y+allaezK2YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=XwbMu1yL; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="XwbMu1yL"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74264d1832eso909874b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 23:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752735495; x=1753340295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcDUtidcIz4q2tNw/LqIMZV2WGjfWu8YabyIVvd6cck=;
        b=XwbMu1yL7SQ/p59qZtF/bdcGpTHtgTIx297r4iACnZfn42l+IY/JpJeWOiWBpn+7fi
         BrDSffvB97T0d0J4ezVhe+ttQnf7lH/JlGxH7klFupi1Ht93yZaypeQA/8kokFavT8yy
         5rk+b0Miv7YpzGkmg9RrSIrPPkw5c9DU7A1yZtcQQUtfSyF7t15/wm6tmt+trPCusu9g
         efkj8seZsYptKf9ekJfRd+53cfCS/IkVPWD+QlNAyqn4Hm1PGnKoYOLnjRKP351EJxhK
         pWfrXWkwwwgO3lbooMKplVTnZM2HbVh5BwBcaVSYmnPiAH+hQ9YcepcbyF9cmLL7fcHh
         Jagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735495; x=1753340295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcDUtidcIz4q2tNw/LqIMZV2WGjfWu8YabyIVvd6cck=;
        b=egfpebe8OqXlo6vnYKGzv6AO7sCcQR90S78uS2cVx1ObQlgkHh7oClSoh15xHDMYvL
         UPe68Prm6YKfnR+R2V/9v+0fsVRBhJh6gKQQp1QTuIEzAvWnvwCE2kytPuezM8QiNfmh
         wZZ73TwNHLpaFQw6PAYx80kS7AWiGjPUNvkXUYVAo4h3cQnjKpJcF8ayNCUM66YJ8OUZ
         ssULVDK6sRk5Nzm2yCYYnN39cKfoML2ZyMMb4Edg44jnGnxT/WiZdHKih8O4gYprmcpS
         w+Ixqw4Az8LzsB6ybRxhqUZkCeJsccP9YmazrN0IAwhwK3//9G3uPAnxdlXQnINcSFiM
         Vf9g==
X-Forwarded-Encrypted: i=1; AJvYcCXoT2KMZAKPtJJnuUf4iAs/arhTZrgU9yCQyhWUp9IM7vtY7g8pPiAXEeW7SYtn8g7rUaourbCLSH0YG4Aaz5jIl46eag==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy/R1Ev/bvFizBHds+87YIyLJOkx3xQ3XyIv4CIKNd2XT8O79o
	VnWAlhLaKM9F6oVyF14ptv/n8Nbc5geHXfafs/g4SXCatWKBaUaTQFHFQ1yLsRPxm7E=
X-Gm-Gg: ASbGncviCOx0zvhyCqvdv8jg3LAAY/BHJILnOE0soMkehxD5V/zbqDXfKFuLkIt14Ab
	hmP0vBMbs2H3eeYc5mkUcpResa2OOP3jB3pMJG3t63QRo/hJ4p5qHI09hrrK9B00IFPeAPQXogX
	FdvX40BEZEa2WZ+TPxVjr0Gw0FcdWI+yfvlsmz/axMZSUp4FPDOmkFklRyCNmCWe3zZd0pRIP5n
	jT33xl7FTXxSfeevqFSSxw19HInRMlTqT1JOhows9wSg3vM1hELwz888GyS/TwTPzVmouQ3UFnf
	NT0q8jzODxnWFLKHgUlyXSOwV3PlGki8j06kIlCGOcjDq4tf2mWpfdScsq7hWrQWmmLXCBtfGXW
	nF04p6dfyTky2BcITiUzwZqxwAEVg6nFiGhT3FGsGlZXSvaj4evv+EQ==
X-Google-Smtp-Source: AGHT+IHtXjv1j8/b35hlWwb7zAfmQUs+V6Fqss1rT4O/h1FVsmO78slSmyNXzYvHuFstjqrEM2uOFg==
X-Received: by 2002:a05:6a00:188f:b0:740:9d7c:8f5c with SMTP id d2e1a72fcca58-75725589c70mr7614496b3a.18.1752735494900;
        Wed, 16 Jul 2025 23:58:14 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4bc51sm15157293b3a.116.2025.07.16.23.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 23:58:14 -0700 (PDT)
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
Subject: [PATCH v3 3/4] drm: Remove unused MIPI write seq and chatty functions
Date: Thu, 17 Jul 2025 00:57:55 -0600
Message-ID: <20250717065757.246122-4-me@brighamcampbell.com>
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
index 32da8861f9de..526308e24f6c 100644
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

