Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0FB29ACDA
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  8 Jul 2025 07:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751960354; cv=none; b=IKW3iLX/lhEffa+HSz2IQFaN1UhQa+QcKt7yThPgzRt6nL8gwUTb8auQ4zKwrPg8sgxkc4YfhlPHJ+Q2AiHP1K5c6dMrkMqbyYrm8epb2PhdUJo37Yi5/ZfHxins/K93rSHghknMOJ83eIige7r7NrJAdFZGiiYoAwBKY7ViMGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751960354; c=relaxed/simple;
	bh=K49WJ9x7l3EnNvQfnQzsEUFr9wWh/GX1Tv+cJukjR4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CNyPM7K5t2i1mTKvwblEze0qtz03QVefnQlGHqRVOb1xrt8cHPY56sa5zB+Vaxd/D9ljvm1nKIpqnIMW9BGNOf0JGb+OBHIWXElIG4wcEamwGz5NCNPQag6PJ71ev9NWei4F/rZQWOKFDBEXJb5Vi5Kx6naif89R3Sx2nhv6+UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=XqtzKd8o; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="XqtzKd8o"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-748d982e97cso3628981b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 08 Jul 2025 00:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751960351; x=1752565151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFUiRqJ8ldtxTynjrbllEzn54iuQyuslXMfdn6+3Zb8=;
        b=XqtzKd8o1slJD8Q66RkeT6Y5PdDJooh0Wt6DN/PiD26y7h4QSedbKrsokehmz9ZqV/
         R8jUDYOUpR2MJo0JvlAoDVJFUiAukIudz/enK5hdexZsRRcPyt51Zv3mAOxwdk1WaKr+
         3CObHjRWxRG8i6SulXHVoqbmggl4bS8oOvIeWVcKO1aRPSA7JGbpPBgy4ceNla8nfPyR
         T0DjCJqaVN0S4vyfBPi9JpqSSVYyoLkCGHlKgQZRnFjufVOD6dlK5FUspJ74i1zFQVvB
         BVL7bzx1e6hPGQVcvgbTQFWlU6N4qo57i/QKgywGzLJXS0EYUXR4yuwokAvIG1uCx0la
         tYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751960351; x=1752565151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFUiRqJ8ldtxTynjrbllEzn54iuQyuslXMfdn6+3Zb8=;
        b=sPYkuJc5osYrIy2xabkhntSuEadX+dKMfo3N0nRvhEfFUs3PGZPrYDEBofc+aQTjWv
         PNnXkJQRbSDThp9kUqnlbR86++hsdXzVITPz+QU4wkcZhqa7pFhcEYkVTaUpnzzWje6d
         pz2QcwhiCmXCgViAk0Qa430Fh6HSCFU/L33/b3Lrj+CcDdfC3dJUF3G62HmHQbG4NiO6
         BVxl5oj5OO2i4aE2MbdcUjzgJYIlsmJUEMAOCemGZhovWhDcoLtyiNTYmimvtXwp8LEt
         c4eQKunkiegYPgCkg+G4osYtMreilv+MAvgHZWoJlW77azmIrtmgXCs6d0EzKms17+yg
         o+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDuAhG9t7c/HRCntGBIKqu+OG26ItFR+Eblr0gHGgqDWOhPC40ud3RYC9OQE1KvGKSKs8XQ9gRFgglbCWJin9ZJhfdmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqezA+oQ0LLEJPeYGYwU/jWTBFA1g3A3ZIzcpDOGURa+PU+dr+
	g5DJ6KEGSk6tuLIUYv/5SYI/Y7UcFRcvRi983qtlCthsZ0PiHZ7IhMfNe6HTxGPxEFA=
X-Gm-Gg: ASbGnctvIxFTZF0BSGxr4jvDnZX9Q/OjdN68PJeWwp2SG7XMKMn2lKJ6eEZgr2WckAO
	iOJ7CbCoELNOWefsi4NbKBcXPlws6NmP0OGvCvi8WZKZvSoZgMtkB7DUso0LBAqaTbmqvCdSiYD
	A9IPD6D1FCuFZtkU6WIvoaNb6djK6aROjP8BYkj12psMHM4De9eUKCK00kKIbjubBu6256P8ylf
	sggcXnP/amNJ3Oc5qRtEuNAChYo0+8X5tMM6RPPDUJjPBeCf9SXHiM8XMVP4N2CiJObCgcRMUPc
	Vrm08TGnXoxLyHVitwh06rM9qas3jjk7mugLxrQLP92G0bwAm6UmTQVy+hnn9/SPm96lesLLHYZ
	nt1DA4sSakqmUENhZV3EuHf9dE9Gu
X-Google-Smtp-Source: AGHT+IEjjvMwCxlNvfS65ducwO3zjwiKKWiiOevnyebt6KaT7pnYdCus6N5MscGP8SruBVriyB/gpg==
X-Received: by 2002:a05:6a00:2e17:b0:749:472:d3a7 with SMTP id d2e1a72fcca58-74ce6689123mr24357739b3a.18.1751960351056;
        Tue, 08 Jul 2025 00:39:11 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a540bsm11633523b3a.140.2025.07.08.00.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:39:10 -0700 (PDT)
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
Subject: [PATCH v2 2/3] drm: Remove unused MIPI write seq and chatty functions
Date: Tue,  8 Jul 2025 01:38:59 -0600
Message-ID: <20250708073901.90027-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708073901.90027-1-me@brighamcampbell.com>
References: <20250708073901.90027-1-me@brighamcampbell.com>
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

