Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B87D1DDC33
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 01:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753149207; cv=none; b=T0KKIfYVFWXSe+FLzC8heb2rh7yA4CXrAlj1Qcys/b1d+mpCe7IDDRSABVbwKZyuiVnVypGkJPtja8XuE+xAdN7bBLJFrdiUsYuuYdhLXkHES+P6lkvLx/vFhGawFtdzv500F9HRmSNc/A3dWZJplGZr9411R0P1RFNK7CqFmOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753149207; c=relaxed/simple;
	bh=UGjriME1ipcli1o9i6srAJ2jQYa/wzdVFweQP30jMJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFcQjEpEef6Ew5/AhB4chE7gcuF10E9mfGDLbegLld3Q5m4m57KzS6ksw7zdiXoUNRD0eQNlRfgZrIO8OmUDbLnUudBSwVLAx3piRgy3OF8uKN/T/8cSSyAImj9kHXQ8iZDgsP3YDRF79aX76AY+1o1k8X7/MRhCrj64d5BZIGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=UbHQCUUd; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="UbHQCUUd"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748d982e97cso4430670b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Jul 2025 18:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753149206; x=1753754006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdRj+I88N+R+RVdcFm7ubWhFSooeArA2NulQ8/PI04M=;
        b=UbHQCUUdIrbFXewFXr9kjeKNcL/jA85W4aZRWq3Uo+r9MNScPlesst+t+CSNtuDnEF
         bkl4vw9QJq+3fjemGZ/61DaDlHWzA2dE6n6KSHHKXCiJGfcyuElP04iaHz7ySagvtsK3
         LDp+v9c1Ch2Mgmw7Dl+7c4yiFAQrvq0AqJTIihUc35sQD7379cMkFKiTxiNv9jtWWaMv
         HZWNlDD79mU4dxp2KW3jE8yKYvrZxyo6EgdaAbhVIJ/LCRFcdVIOOkZ5M0ERmpSK/p6Z
         j8QLO/s0BG8JJzJBdeuIfq+MHMC2XxnTSSPNdvmoDrCmJ08i59l5jreAPBcF7s47+tu0
         i+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753149206; x=1753754006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdRj+I88N+R+RVdcFm7ubWhFSooeArA2NulQ8/PI04M=;
        b=jidVMwWANI+p7uFB7Eh0eoAjTDvIctXryFYLteQDRtAjjyc5rKmz8vIj7NrWumbDc6
         tBSC+eE6hTX9NQsLVS8n/jx4GUxFMC2yWRgH1yA/qQ4xYK2DI/gCxT3rhacrhgdAevGL
         Yq8URuNNY8227yXLxzIaUJ6owncLCyEgROj9zheT+7OPWX5waWPaMyLhxQ9+ayu+aPTJ
         m1jG2nV2I7HhI0X/SQ5FAmKfklm+JSic59BXxHJ5NX5ijt1/5TGBHYQYsikrOdxRElhI
         9PLvX1EOzIOSRWw7uz2lpC2zt4rLhz6uADfV3lMRf519BDBPIkHnmIDXEqC3q/RZ3tbQ
         xarg==
X-Forwarded-Encrypted: i=1; AJvYcCUO+BHDAbE+gmG0CYzx/aeJYtxXycYQY/95aOVNMmT2EEceOSmazLIFoSLH57mc71SfW/YuHebyAgy433MqlnKBZoG7MQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRdWFQiDMBBrUX1745VjP/Or0/oHtABeMA6pmECGEiXA8Ildwt
	tB1zvVzsZU8Md8p+RR66rQUnZnH+996d4IyVB5XYhLtMZE7xvEtUMz2S9Y2He9wVeKo=
X-Gm-Gg: ASbGncu+0Cr7KwAu8nERmL4nlbXZ37RVHcWZYe8x+V2jTB1aeXCUQbPUE2TAzCGfY4Q
	G/gGEIEi9E5Ohn6ye5bsRpbYITkdhh13cSOoPClmiKhTXzYBcSAuXivUxnfIqG4RO12cQSRxcsc
	b8m7yg9itbAf72S9QeU6rOYR/3jdR/XM3jhMr0buFL/g0NUh5IHK/b4ykolU1LiNTi5TwXuRMR6
	mm9xBXGto+0+zj/1o/Nlh8JW/5WZK9bMkoZ9fTRjzDCzfk9g/XC+OOkukUbVVDizL/PYY16DBJW
	7cNvyQuTmf38f1GYoUIrxeXwW/gvpmNEDbQn5vdeanObFKefBLup/TXzKrAxV/QhFObU+t7Qh8j
	41TOiiYTm/sFR7jLjOCJw44NEO1OA6Tz2dTAqsxem3Dh8Q8/Mmg==
X-Google-Smtp-Source: AGHT+IG6tNXplzhOlO9KMayA+8YKZtftV5rzHK8TvneHGceF0dD/1zLLjMy0L2fZ+upC9WT9XqLSug==
X-Received: by 2002:a05:6a00:1945:b0:747:bd28:1ca1 with SMTP id d2e1a72fcca58-75722771f31mr32750586b3a.3.1753149205584;
        Mon, 21 Jul 2025 18:53:25 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe62d9fsm6017441a12.1.2025.07.21.18.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 18:53:25 -0700 (PDT)
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
Subject: [PATCH v6 3/4] drm: Remove unused MIPI write seq and chatty functions
Date: Mon, 21 Jul 2025 19:53:10 -0600
Message-ID: <20250722015313.561966-4-me@brighamcampbell.com>
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
index 5b387543de28..ca77f152404a 100644
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
index f1dc822f69d6..ea523eb35b08 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -285,8 +285,6 @@ void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
 void mipi_dsi_dual_generic_write_multi(struct mipi_dsi_multi_context *ctx,
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

