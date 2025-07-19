Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D973C235C01
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Jul 2025 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752913626; cv=none; b=fLc2x27kl88pdAPeCgJIybQnaLy7DpY4+6hwrYGPk65atJW2GBVO2ilR0Adhsj6856ptrSIYI54kCfWtXqSrFaVX27URiqi1Pqw67gVnBn7oTOi1/9/TmR7MZLHVeYZcNYmZiaGpiQVY9FzIuuentDEMqORfqsLomEayCbAgJvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752913626; c=relaxed/simple;
	bh=pmTES+4CkX/QOuHNX+Rkrb431Re78drHxNxUfxOx9dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nqimf9ftVPU0S0P3tAG+b8afC14IEwtE1YajfFD6i4V8+vQ5O4VlXJ1WOKu9BqGczm7KmFiX0mf5Bk3dZ5Z6eVOlTn/CWPcnjyAsCpbwpQK0axlrKRLJFKytrfU+jQmy/ybcl9sCY7++02swRlOKuXOLYOP1WixUlfs6BfqRhVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=hOQcz8Cs; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="hOQcz8Cs"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747c2cc3419so2330975b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Jul 2025 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752913624; x=1753518424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MI/yokjCP1HwI/RReXqohEWfCg7UzwzYJvm86YPBHo=;
        b=hOQcz8CsvqKijgolnEnDO6UfLceKeV8SDvsp/JjBTviGbXvTxxiVMEbKLFXR2kKLhP
         mUQjh5Lf5cAESp7QMTSpW+EF8pNFt6AKPmcLWBPcWmfRp1TbCHuirLn/XtyjrnFjv9L3
         h7DKVTdeQ0MbzPoX8VBpsjQGZpzH7G7DANCaCp0uVEmv4i0Rhva03Kgl8f27qb59Id6O
         kR8yrP05g7jRZCPgvlXgURtSpVx4Ad8WXxjdcKvWBQGB0WDFdjYyKiqhQx/bmU84+Mc0
         vpxMjPPLaw9K3qGrczl5hagXaZBtoMetieYwvV1yY/9nhgW0IiEEcno8uxzar4DlmmWf
         PAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752913624; x=1753518424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MI/yokjCP1HwI/RReXqohEWfCg7UzwzYJvm86YPBHo=;
        b=RohNMT8dZ702xyJWlBcYWiqCXuFmx8TzvO5UI9ZCfibsmqPFJQlQ4cbUGx3x5255G0
         7xVKgLgXrbgJke9bvISoz7KllHJA+SMURhUzok9hNeIdUi+XVCak6GW/uwepGFRVQyfD
         d6e7E2oncEtdlRNpVWbxOq3m0goD2rY0cZzdDRDjRH0GJyU9/prJKoIDukZTrIW6pWWL
         f2x6Y+Yw56gjuUeGudOr+BDxXR3cjEs96w/notZ8TASFFI32qrKwjd2KgGRmY1luy6sw
         QTiYt6QboRhy0AaCqzXtSYXTYdwE9Ph0UC13Ukw296TTE6IxgtFhZG2kqa9gNyffWfNE
         zI1A==
X-Forwarded-Encrypted: i=1; AJvYcCU0d/UQbXlI0fjlN6wg2Rra+0h2m8UOGr1p6cFksprDfBeR422xN//psxrmKIAaO9s+mla17xifELRUt17ulP3gieku7g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyxew65l2JfKpVW09EOH6QIRoYURK3nB5+NdySimFcKMo3Fs0A
	wRn0ET8WjLIPEo+rItonAGlfKG/f20CNIp8cQ9psAiyyFLsyuzp9YP0tbaT48B7KWRk=
X-Gm-Gg: ASbGnctZanDfFWO9OiE04J7Paatc1xKcgOxt9HvrBr2uOSn9PalfxrZwXkSmLTLhHV+
	cWmMs54wWyso4zXcXnYbcZ++/OQLIJmHSTAbYobIN2QByL6ABpeqnt8vA4E6NqDC9IGlhFzRfEu
	YVRqknTqt4uQs+EHwfo8onJzhug50wrl2mSPO3+yIW/XgxCe6r3vmzEVQIkbhgpkxCN5wvYPrkl
	mLJ4gqFxZ8uI9VgP68XDB7/ODFzm6uJxKTwUQNvCKujOiBqQJiVjJcx1437L/TEWCg43MV0mGEQ
	gKdo2CZXV2hk3QEVxTfEcFxw81Xz0ND4ZmXEZQ2C9eFXesN98XUvRJJGWE6AZ83n4zk7Ko4ajPb
	ybr1xpsCZBcn5qDimKetkszz+4AsGE1t+JQGJf92JOAtH6+jh8Q==
X-Google-Smtp-Source: AGHT+IEookr+a3eTQEBmol8DGigr1hM4wxeOxAzpxnN5vNTt7ozZfZj7qFtqjv6WzZYiLjYmaNRGvg==
X-Received: by 2002:a05:6a21:62c9:b0:238:3f54:78ea with SMTP id adf61e73a8af0-2391ca917fcmr7914227637.44.1752913624038;
        Sat, 19 Jul 2025 01:27:04 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb157635sm2475260b3a.83.2025.07.19.01.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:27:03 -0700 (PDT)
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
Subject: [PATCH v5 1/4] drm: Create mipi_dsi_dual* macros
Date: Sat, 19 Jul 2025 02:26:35 -0600
Message-ID: <20250719082639.307545-2-me@brighamcampbell.com>
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

Create mipi_dsi_dual, mipi_dsi_dual_dcs_write_seq_multi, and
mipi_dsi_dual_generic_write_seq_multi macros for panels which are driven
by two parallel serial interfaces. This allows for the reduction of code
duplication in drivers for these panels.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

mipi_dsi_dual_dcs_write_seq_multi goes unused by jdi-lpm102a188a. It's
included in this patch for completeness and in anticipation of its use
in other drivers in the future.

 drivers/gpu/drm/drm_mipi_dsi.c | 48 ++++++++++++++++++
 include/drm/drm_mipi_dsi.h     | 89 ++++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a00d76443128..4a7ca1261105 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -827,6 +827,30 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
 
+/**
+ * mipi_dsi_dual_generic_write_multi() - mipi_dsi_generic_write_multi() for
+ * two dsi channels, one after the other
+ * @dsi1: First dsi channel to write buffer to
+ * @dsi2: Second dsi channel to write buffer to
+ * @ctx: Context for multiple DSI transactions
+ * @payload: Buffer containing the payload
+ * @size: Size of payload buffer
+ *
+ * A wrapper around mipi_dsi_generic_write_multi() that allows the user to
+ * conveniently write to two dsi channels, one after the other.
+ */
+void mpi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,
+				      struct mipi_dsi_device *dsi2,
+				      struct mipi_dsi_multi_context *ctx,
+				      const void *payload, size_t size)
+{
+	ctx->dsi = dsi1;
+	mipi_dsi_generic_write_multi(ctx, data, len);
+	ctx->dsi = dsi2;
+	mipi_dsi_generic_write_multi(ctx, data, len);
+}
+EXPORT_SYMBOL(mipi_dsi_dual_generic_write_multi);
+
 /**
  * mipi_dsi_generic_read() - receive data using a generic read packet
  * @dsi: DSI peripheral device
@@ -1006,6 +1030,30 @@ void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_multi);
 
+/**
+ * mipi_dsi_dual_dcs_write_buffer_multi - mipi_dsi_dcs_write_buffer_multi() for
+ * two dsi channels, one after the other
+ * @dsi1: First dsi channel to write buffer to
+ * @dsi2: Second dsi channel to write buffer to
+ * @ctx: Context for multiple DSI transactions
+ * @data: Buffer containing data to be transmitted
+ * @len: Size of transmission buffer
+ *
+ * A wrapper around mipi_dsi_dcs_write_buffer_multi() that allows the user to
+ * conveniently write to two dsi channels, one after the other.
+ */
+void mipi_dsi_dual_dcs_write_buffer_multi(struct mipi_dsi_device *dsi1,
+					  struct mipi_dsi_device *dsi2,
+					  struct mipi_dsi_multi_context *ctx,
+					  const void *data, size_t len)
+{
+	ctx->dsi = dsi1;
+	mipi_dsi_dcs_write_buffer_multi(ctx, data, len);
+	ctx->dsi = dsi2;
+	mipi_dsi_dcs_write_buffer_multi(ctx, data, len);
+}
+EXPORT_SYMBOL(mipi_dsi_dual_dcs_write_buffer_multi);
+
 /**
  * mipi_dsi_dcs_write() - send DCS write command
  * @dsi: DSI peripheral device
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..ffdfcb57cbd4 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -289,6 +289,10 @@ int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
 				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
+void mipi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,
+				       struct mipi_dsi_device *dsi2,
+				       struct mipi_dsi_multi_context *ctx,
+				       const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 			      size_t num_params, void *data, size_t size);
 u32 drm_mipi_dsi_get_input_bus_fmt(enum mipi_dsi_pixel_format dsi_format);
@@ -329,6 +333,10 @@ int mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
 				     const void *data, size_t len);
 void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
 				     const void *data, size_t len);
+void mipi_dsi_dual_dcs_write_buffer_multi(struct mipi_dsi_device *dsi1,
+					  struct mipi_dsi_device *dsi2,
+					  struct mipi_dsi_multi_context *ctx,
+					  const void *data, size_t len);
 ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
 			   const void *data, size_t len);
 ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
@@ -431,6 +439,87 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
+ *
+ * This macro will send the specified MIPI DSI command twice, once per each of
+ * the two interfaces supplied. This is useful for reducing duplication of code
+ * in panel drivers which use two parallel serial interfaces.
+ *
+ * WARNING: This macro reuses the _func argument and the optional trailing
+ * arguments twice each, which may cause unintended side effects. For example,
+ * adding the postfix increment ++ operator to one of the arguments to be
+ * passed to _func will cause the variable to be incremented twice instead of
+ * once and the variable will be its original value + 1 when sent to _dsi2.
+ *
+ * @_func: MIPI DSI function or macro to pass context and arguments into
+ * @_dsi1: First DSI interface to act as recipient of the MIPI DSI command
+ * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI command
+ * @_ctx: Context for multiple DSI transactions
+ * @...: Arguments to pass to MIPI DSI function or macro
+ */
+#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)		 \
+	do {							 \
+		struct mipi_dsi_multi_context *_ctxcpy = (_ctx); \
+		(_ctxcpy)->dsi = (_dsi1);			 \
+		(_func)((_ctxcpy), ##__VA_ARGS__);		 \
+		(_ctxcpy)->dsi = (_dsi2);			 \
+		(_func)((_ctxcpy), ##__VA_ARGS__);		 \
+	} while (0)
+
+/**
+ * mipi_dsi_dual_generic_write_seq_multi - transmit data using a generic write
+ * packet to two dsi interfaces, one after the other
+ *
+ * This macro will send the specified generic packet twice, once per each of
+ * the two interfaces supplied. This is useful for reducing duplication of code
+ * in panel drivers which use two parallel serial interfaces.
+ *
+ * Note that if an error occurs while transmitting the packet to the first DSI
+ * interface, the packet will not be sent to the second DSI interface.
+ *
+ * This macro will print errors for you and error handling is optimized for
+ * callers that call this multiple times in a row.
+ *
+ * @_dsi1: First DSI interface to act as recipient of packet
+ * @_dsi2: Second DSI interface to act as recipient of packet
+ * @_ctx: Context for multiple DSI transactions
+ * @_seq: buffer containing the payload
+ */
+#define mipi_dsi_dual_generic_write_seq_multi(_dsi1, _dsi2, _ctx, _seq...)	\
+	do {									\
+		static const u8 d[] = { _seq };					\
+		mipi_dsi_dual_generic_write_multi(_dsi1, _dsi2, _ctx, d,	\
+							 ARRAY_SIZE(d));	\
+	} while (0)
+
+/**
+ * mipi_dsi_dual_dcs_write_seq_multi - transmit a DCS command with payload to
+ * two dsi interfaces, one after the other
+ *
+ * This macro will send the specified DCS command with payload twice, once per
+ * each of the two interfaces supplied. This is useful for reducing duplication
+ * of code in panel drivers which use two parallel serial interfaces.
+ *
+ * Note that if an error occurs while transmitting the payload to the first DSI
+ * interface, the payload will not be sent to the second DSI interface.
+ *
+ * This macro will print errors for you and error handling is optimized for
+ * callers that call this multiple times in a row.
+ *
+ * @_dsi1: First DSI interface to act as recipient of packet
+ * @_dsi2: Second DSI interface to act as recipient of packet
+ * @_ctx: Context for multiple DSI transactions
+ * @_cmd: Command
+ * @_seq: buffer containing the payload
+ */
+#define mipi_dsi_dual_dcs_write_seq_multi(_dsi1, _dsi2, _ctx, _cmd, _seq)   \
+	do {								    \
+		static const u8 d[] = { _cmd, _seq };			    \
+		mipi_dsi_dual_dcs_write_buffer_multi(_dsi1, _dsi2, _ctx, d, \
+						     ARRAY_SIZE(d));	    \
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.50.1

