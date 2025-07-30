Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694E91EB5DB
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 06:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753856279; cv=none; b=FJjVHbugvTipf3N0zAd9ZUeJ56EVvwZdac5qXGHhZA5H8Vpl9erJ8YKWykXQ7YIPLo5zMqKLioi4VVSey19tznUZvjY4wlcRBauBmZ9hqZOzIUWSQeOF8P9+s47LnABPOOanVC6KgvbSIzUwpUd6HQOOzu2GJoRTRGVBlJlSOVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753856279; c=relaxed/simple;
	bh=rn+F75Q915wmAwk9yOieQK+TRpHwahuag+EZMKYFW9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPnOgBj8NNa64o4UHCFOjS+6PljCfUAhP1cu0HAtfbI05CDb3ck0ljcN5IcC3I3dfsz93qHsRf0xYT7CK0RqI61etYOaCRMu7VIEE8b1Lm2LhmqyTpAPuv/JCh7KmwDTWIexZYGFEMT/gPXTZOJCNEhcK4wYYhSDqfR0O0aJHgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=T7JLsGz4; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="T7JLsGz4"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af51596da56so4567325a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 23:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753856278; x=1754461078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTa7ttMugFu1yCj4YKK1TgSGh01SfTxQdJKN90Hkmps=;
        b=T7JLsGz4g9t+SVa6HsKc+CtSZeSzh6XtqSYN/1HhqHKQgBBuDTBxa1k9D+QESFOZTq
         T1RcpkfVdd7qK8cKuQvLv1+RyTLsYiEfMjFxzush1pMT0sL1NHjwdxZFCqnd+4DcLfTZ
         Yud3PnRxguGjbdzcMI6FDmgc6QMjXkaNQ0BEfyWYGOsm6DWJGaMgLVQbBvijkxfyZ1Fy
         PomUa2WfM6Kz5ieX08s5to9SPv3r22R3dOzbl6QLWT7slFqHCwl2MufjfEbABwRJXKkB
         rka95FrScUXMy4ykGMTXe5IP6001tHw3h6ezJ3iH8dNzmBZ/ee7Z5v6UeHf/J6/4epPi
         9sjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753856278; x=1754461078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QTa7ttMugFu1yCj4YKK1TgSGh01SfTxQdJKN90Hkmps=;
        b=K/J+yi8vZtfpBi1n/mFWpDHCXdTd+QAzTeieh5RuYt16+cY5+PT+MQ0DVagq6FkNoD
         B8EFLoJ1b8/FJuysbEX6EN342VvG8GgXBm4ujEGEbvY63Aa8uJCMCBngfgQybvqq+b4T
         7ZA2XL90oSuMbELXxKrZ054s72/bgbT3GINK76a1XHgEkxxqoM3BoLyD3pJnq/FEVVfh
         PxpXUG3W8zWKiwYpCYRFXJA6FnIIdpWjSZcOVyhxbw8A6Hi5FEf9rUmtt/PRSCimqabW
         ROhqfD/9yiXUkL28kP/F1aq0ptFFu+WrAykPXjmo9SD4LzpRr6hAQmvpYLtE6vXrMLH7
         lMCg==
X-Forwarded-Encrypted: i=1; AJvYcCXCs4rr+D8f0YWAf40hhngJ7T1cy6uPowqw8jjSX5P+V3UWdLsg85O5YQkGSzBO5po+RWTStOIbsdS797SuhUKM5fZy/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTrlREeA+ekdBLRYFe1pIp4PGqzKDEi7Z3jycyxzB2/skN0JSr
	aM4MTNPsZSYcnxjaDDL67A/yssq9Oy4TFn742HyVmss4bIP5FDJBXorNMvafN73+AjQ=
X-Gm-Gg: ASbGncs8gcxIG3cmGmUwFapZl0BGRXSUFDtnvk1bgxJSCOMxbTxrzVygOnc986hYd0P
	T806SU7MQUbXHQTPY91aF6YPlrBj0Vn6C+eqYx7Jn/LGtWYTg7XmWYR2v72t69FOC9TokXIV9n3
	G9wtPco4rEslp84rr2mW+z/JdGdUBphVc6Jl51thxaGnmTgoIxILeXGrq6Cwq6CSwN0eG3MJUcR
	YZ63WO6K/AYUbYpm27vkZ6ViAnu+Cd2ddHwi2WCf3C8BXoRR5/8c28EUdR88tZW7Dg7vfOxtOYg
	gg7ubLJsuqJyNgNAwRM52GMiibuJ5BnEtKseY14CRvcyXrUvltLbIehCuwYGwcujIIHJHESv5FT
	PThFQl2eqZHaIY+76ZbsUteI4+tv6yyTIGfCljn/YMV2t9JF4wgLR3+Iec/0H
X-Google-Smtp-Source: AGHT+IG0UujJqciGiZSHs2MLJH0uOtfTc3Y0Ak8pUJ72jExypcRAeZTfDeAiGFaPBnABeOJag3a8BQ==
X-Received: by 2002:a17:903:2412:b0:240:468c:83f1 with SMTP id d9443c01a7336-24096bec816mr37844195ad.44.1753856277729;
        Tue, 29 Jul 2025 23:17:57 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ffa37f078sm75017815ad.115.2025.07.29.23.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 23:17:57 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	linus.walleij@linaro.org,
	neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com,
	sam@ravnborg.org
Cc: dianders@chromium.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 2/3] drm: Add MIPI read_multi func and two write macros
Date: Wed, 30 Jul 2025 00:17:47 -0600
Message-ID: <20250730061748.1227643-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730061748.1227643-1-me@brighamcampbell.com>
References: <20250730061748.1227643-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create mipi_dsi_dcs_read_multi(), which accepts a mipi_dsi_multi_context
struct for improved error handling and cleaner panel driver code.

Create mipi_dsi_dcs_write_var_seq_multi() and
mipi_dsi_generic_write_var_seq_multi() macros which allow MIPI panel
drivers to write non-static data to display controllers.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

Doug, you had suggested a slightly different shortlog for this patch. I
adjusted your suggestion to fit within the canonical recommended
shortlog length of 50 characters. I understand that the 50 character
limit isn't a rule as much as it is a guideline, but the current
shortlog seems to me like a good compromise.

 drivers/gpu/drm/drm_mipi_dsi.c | 37 ++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     | 35 ++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a00d76443128..0f2c3be98212 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1075,6 +1075,43 @@ ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_read);
 
+/**
+ * mipi_dsi_dcs_read_multi() - mipi_dsi_dcs_read() w/ accum_err
+ * @ctx: Context for multiple DSI transactions
+ * @cmd: DCS command
+ * @data: buffer in which to receive data
+ * @len: size of receive buffer
+ *
+ * Like mipi_dsi_dcs_read() but deals with errors in a way that makes it
+ * convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_read_multi(struct mipi_dsi_multi_context *ctx, u8 cmd,
+			     void *data, size_t len)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	struct mipi_dsi_msg msg = {
+		.channel = dsi->channel,
+		.type = MIPI_DSI_DCS_READ,
+		.tx_buf = &cmd,
+		.tx_len = 1,
+		.rx_buf = data,
+		.rx_len = len
+	};
+	ssize_t ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_device_transfer(dsi, &msg);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "dcs read with command %#x failed: %d\n", cmd,
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_read_multi);
+
 /**
  * mipi_dsi_dcs_nop() - send DCS nop packet
  * @dsi: DSI peripheral device
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..296ffdc9cd02 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -333,6 +333,8 @@ ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
 			   const void *data, size_t len);
 ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
 			  size_t len);
+void mipi_dsi_dcs_read_multi(struct mipi_dsi_multi_context *ctx, u8 cmd,
+			     void *data, size_t len);
 int mipi_dsi_dcs_nop(struct mipi_dsi_device *dsi);
 int mipi_dsi_dcs_soft_reset(struct mipi_dsi_device *dsi);
 int mipi_dsi_dcs_get_power_mode(struct mipi_dsi_device *dsi, u8 *mode);
@@ -415,6 +417,22 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_generic_write_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_generic_write_var_seq_multi - transmit non-constant data using a
+ * generic write packet
+ *
+ * This macro will print errors for you and error handling is optimized for
+ * callers that call this multiple times in a row.
+ *
+ * @ctx: Context for multiple DSI transactions
+ * @seq: buffer containing the payload
+ */
+#define mipi_dsi_generic_write_var_seq_multi(ctx, seq...)	     \
+	do {							     \
+		const u8 d[] = { seq };				     \
+		mipi_dsi_generic_write_multi(ctx, d, ARRAY_SIZE(d)); \
+	} while (0)
+
 /**
  * mipi_dsi_dcs_write_seq_multi - transmit a DCS command with payload
  *
@@ -431,6 +449,23 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dcs_write_var_seq_multi - transmit a DCS command with non-static
+ * payload
+ *
+ * This macro will print errors for you and error handling is optimized for
+ * callers that call this multiple times in a row.
+ *
+ * @ctx: Context for multiple DSI transactions
+ * @cmd: Command
+ * @seq: buffer containing data to be transmitted
+ */
+#define mipi_dsi_dcs_write_var_seq_multi(ctx, cmd, seq...)		\
+	do {								\
+		const u8 d[] = { cmd, seq };				\
+		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d));	\
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.50.1

