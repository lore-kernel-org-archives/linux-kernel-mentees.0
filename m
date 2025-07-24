Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CED23A9B0
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 20:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753388628; cv=none; b=iKIxlMgvjmTFiLTm1xq76tbf5J9UGqozmTNJzzymiZ1NCXtajhkkIZ5+wpixPdg8mKsZSO2moT40TO11cLoZ5ZFBqr+pHML5wdxiO/6lt0xq+RWkRCARiJUnAboPgBlW4DxPWLsaRgpf7C8u+/yCMjFYi8ftuxHpzowP4Pa58Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753388628; c=relaxed/simple;
	bh=dOzIfOlfdE8v4g6Un7FNFy8FVfvT/2CSsf2AjeqPRX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iUqaEJGJsdO1IGvfnlHULKhBTxUawBL+JajuHKSVEFUfS5JBprt7ajTlxp/6pEeSOGTjGiTpwDAICDPxCftnnUqtsmXb/fSejmHz6/7FJVEBIEFS6j+PU+CIGWCtNnWAlp7BTpD5RTkLHbqNn4gg+7Tej/qIJn7vQqOpvbsJ/Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=Ea7+duct; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Ea7+duct"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2350fc2591dso17879875ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Jul 2025 13:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753388625; x=1753993425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4zUj/idKOirKhzudfRqBBLM0pFf8X+XkqCIOZ++mo4=;
        b=Ea7+ductWWDrdBjxt1RHgQCkqiqewByV8uOZYyxeZO4QVc+6w2SX46nIMssGhRkYMr
         gwu9JVEv/vrZlyPlQqGJqIaCPuJ6AU5kMrTEMy9Czer46K/lHRySePb1Nta0zqoxwS32
         VPXB4MEmFy382gXDTm4X6UKQKwVomen+4Xu5AT/Gu/aIMZH23v7Li8gqQDs/DmFbfkLf
         DllGudW6ezuvL2biXoWGukPx3CfTqqZTQnznSmlYG+w8nzclmLzQhBkCeYEIjbrZm9zG
         TJXbkrrBYIoDBqfL+SXRDO0RzfaeEMoI6XyWUW6WFcZdz9qyNYMOWVkKp1dNHSCRUxSG
         q9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388625; x=1753993425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4zUj/idKOirKhzudfRqBBLM0pFf8X+XkqCIOZ++mo4=;
        b=FrS0qSCD6e71Ei2shPDOJgy+c50qXRGyMA1dmt+kdy2GRIbzJGXxyk/Sg1Dn0x94Pq
         sE1ufBKl9ckiN8PL20IXgp3j4r/JrRHcx1+GMWj569gpq2jK35rqFNce/1j1xTZdZoqp
         sA5oyDtFBcURaLPG6/PCfhcDibwIQY2jepLQ/tHa1dncs0k83fRqxbvA+s5/KiW6o9mo
         2QdELJDhp9eo7HhpVjC3OSIXb963FmdW/25tQmz9BS0J1J5pEchCkXSqsotZubV82zX+
         iHvvYa2c7fvyKFr4m7aEJ/UG8j9Ps95yOTCT21eXHwJA9aWJjt3Vuf/aK6OJdE0oJbMu
         oBZg==
X-Forwarded-Encrypted: i=1; AJvYcCVxKW0ozSlgLOA6ZRdCSjo4OHoy7ZP+DSZjl02B5bbTX3bhRxXDMsUIuh8IYMV85NvsuGvrTRcrXDk1KDHBD0LReMFMUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnb7Y/+ISx0pon39GdSSXinUZEztVmquPEMKD5H+P3OeVNHO1q
	Ct3iSjYWo0zlA8+gM4FFTJGfn+N4sH2LUU1U3eQnvMVAZ1G8iHLEkwGhVnGt9mBqTgw=
X-Gm-Gg: ASbGncus18vdottInt4BC0vwjwjnqr25PpEcsF4r1yT+xDIRelkej2YT5wBBTzcTVsA
	qix/xE0HuR9hN2Srxp84ghluednGzUZunrjbHyrcY/HipSaQure1do27gJS6mxLlFDw97bl6rym
	SfzM/tPIIYuyymE86WhiTqZns1CvLA2ivwzsv0hDFvmb0JVmhIIfO/6uKgj1HrV25cgLEIQC5QE
	QnUn/lqepg3ooBVusdCXw7GuBEiriStwzZTPYu6My8iEoMEK+pqmU9Amn4VeYCgyGJ0XzE+bNJY
	uwsThDcqFVwDKRVXma63rnFixaCFZtuFUPSatKTks6Hvu9psaaXHPwbYSrF0Ol1ynsoA10xcDuF
	N6feqmOlVLI+w0NyvY0erwanYmjsk0vbPo8TFB3rjybh7D9tTXJZhJr4qc0zG
X-Google-Smtp-Source: AGHT+IHd+bt4vHJ39l4CpLf5WhIwZLQkiEEpVe8TOKkAb1COeGQGReplWtQ1IyJKNtoQWNlr1/1dZA==
X-Received: by 2002:a17:903:b8c:b0:21f:5063:d3ca with SMTP id d9443c01a7336-23fa5d73fc6mr46051295ad.16.1753388624999;
        Thu, 24 Jul 2025 13:23:44 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48dbfccsm22077815ad.138.2025.07.24.13.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:23:44 -0700 (PDT)
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
Subject: [PATCH 1/2] drm: Create mipi_dsi_dcs_read_multi()
Date: Thu, 24 Jul 2025 14:23:37 -0600
Message-ID: <20250724202338.648499-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724202338.648499-1-me@brighamcampbell.com>
References: <20250724202338.648499-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create mipi_dsi_dcs_read_multi(), which accepts a mipi_dsi_multi_context
struct for improved error handling and cleaner panel driver code.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 37 ++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a00d76443128..227b28555174 100644
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
+		dev_err(dev, "transferring dcs message %xh failed: %d\n", cmd,
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_read_multi);
+
 /**
  * mipi_dsi_dcs_nop() - send DCS nop packet
  * @dsi: DSI peripheral device
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..d17c00d299c8 100644
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
-- 
2.50.1

