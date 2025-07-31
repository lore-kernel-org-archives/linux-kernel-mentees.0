Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790CF23E325
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 31 Jul 2025 03:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753932235; cv=none; b=oQOFFn2H26/F1oWLWg0+IF8feFe6YM/16O+IlNgQzSnejyEyRRQpqDfjf9YVr+DCtKiP6OXE3L4NeQDnITz6O1eFfF/Q6Qf/DxKXv4ZjN+95+89i2URjnC19Ra+YLOfgL7H8wRQUYDLmwnh/ukn421AyiG26sjoRx8GE5sfu0EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753932235; c=relaxed/simple;
	bh=LLFmmNUX/DfeDumtfAPB0PNqG1IDii9NIMiRI2MPg3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XEf7RVcJ6SjrqRzk/9YO9EfbnK7x3ZKvA78OeWMUyH6QjF6UIshzRd1PnBthcA+OY4UmmaBrukG8Trk5m2Fc5z1JWE07IwNtPY+emnrjsM2m91O0zPja6jnB9xpru3pklvDnF22bWebWCOnSW7Kp+mlZtzbRe2Hyr18Feumvud0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=R3ATp8vR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="R3ATp8vR"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-240763b322fso5809275ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 20:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753932233; x=1754537033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO3wVwEDuSYhrQ+FF5y/l5gPvVgHJtS+tEfRcRSUajo=;
        b=R3ATp8vRx3HRA3o/zk6S4Y9GIF2HtbtdmThrn5fLP53rsTpPnUt3XBMz9/UpNQh1Nb
         yfu0KoqHlJYT+JRGvgSt650bEKRwGljKcqLQvzPLDD218vnQHtElH5mHqn9vedmjv9so
         YSNvCJMNFjbMaMvbWk5EsJcRq0Db6Fgc62lIoxxR3CI2Iyp51w4QB8JKd+ETqbv1mEH1
         APjdTehFGsZaVmU6uhXpt2ncIbDCDo7diyRFxpXm+ONG2A+oNiZ5I9N2Eq4gVZtuiUzb
         7Z9p05wZb0NnHDpswvtdjBYiz93K4txqbdcUPi0Qtn6vASofHNdr5N38HJzMeYp3hwfC
         cyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753932233; x=1754537033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YO3wVwEDuSYhrQ+FF5y/l5gPvVgHJtS+tEfRcRSUajo=;
        b=pEo/nxrpyyuc01CLiN/+/Tm2PZiQW2k8S0cjtUwWpyPAy+wdsex45O5lnFER5KOJX8
         HJxzG1c9jsmUkmg86yYGdzZHYGWAQ+IGvtJJIUxbEiHyRe3MX4LXcVDx0YRYwDnE69O0
         jtuATRLRvp4o1peZGzUCzgFH2UM1TgK/jpLTUjwbYx7q8eOEQ1GdljJLsyxRhhmUNrXP
         ipSVFhkblVyWh9EpvNvi5J54jSG3CgRr9q7ZuTbeHpo5XsSZGOTT8S8IC6e0ObpGuSC9
         u8BHiKvmsOLQmcVy6uZ1q/Kx0oxY/SXHGbixwCmpJilENzM0SEJio2KmRfSqRyN71GiG
         SmcA==
X-Forwarded-Encrypted: i=1; AJvYcCX+Kb/xGPZN5X0MDrU31xWsnVyv7mVsci8AZvUyevYAIwS5mwTB8n1Rp0GW3EiEEZOdd0Z0uc7kHARNYknPVHEdT775/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvrWwpXBkX79pRUWK1AjIrT1bojD1e0DlY/Q6LBQEw1k1CjbxT
	02Vvv6V0N7KK+Hht++59AtBh2Hpc1rfySDwP7+P+ia5j28goUbGK1za/lJ/7nJwZjzW10gDfY0j
	NnAALGWBfEg==
X-Gm-Gg: ASbGncsX1VFnoCmocxwJdRhHuEBdLvc5/mWXtLc7JqlIh6FUJP9RxW6me28SY9PDQPI
	Eu9Vmm8DzZLvWou2JQaqF3LVekfgfeWhb4IjIPY1IMqXBhoeOvwqeJF5g82Us6jsJ71VvSWf/il
	wOaLJ/Y8q3/G2u82N+avCY9UefgJidapders2tZASws6luROeWN5eQAce4lg7RxA59MP2LCfcx7
	ulvP1/BNFO9+8c/gADzXpwAGycXtwkJxkRfJtFBogUiKPDETP5IFp+3dzRuZfehoFW7dadUDMLS
	sPIV7OANPCce3PmQVF6IFTuCgKDOk6ktr8yoIIadqg8wdxyLt+9Fy/gLcF1Rtwu27l8FXgutLiv
	NYYhmB0nMA/Byc3KXMyujpd1ZkVnK5vkJOBsqFrguFvCflK5xKNHhsKEo+Ogp
X-Google-Smtp-Source: AGHT+IE18gcw1L9AiSBmhHHznkEqWPINFS1vbZ9/Dmhaw4XfpgJGvjyRPijQawkyMW2EZS4l0LoVIg==
X-Received: by 2002:a17:903:3bcb:b0:23d:fa9a:80ac with SMTP id d9443c01a7336-24096a9ddcdmr85611615ad.16.1753932232544;
        Wed, 30 Jul 2025 20:23:52 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f15092sm4854795ad.66.2025.07.30.20.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 20:23:52 -0700 (PDT)
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
Subject: [PATCH v4 2/3] drm: Add MIPI read_multi func and two write macros
Date: Wed, 30 Jul 2025 21:23:42 -0600
Message-ID: <20250731032343.1258366-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731032343.1258366-1-me@brighamcampbell.com>
References: <20250731032343.1258366-1-me@brighamcampbell.com>
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
drivers to write non-constant data to display controllers.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
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
index 369b0d8830c3..f06c753603ba 100644
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
+ * mipi_dsi_dcs_write_var_seq_multi - transmit a DCS command with non-constant
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

