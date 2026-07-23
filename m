Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562D038E8DC
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Jul 2026 15:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821026; cv=none; b=SK65qL+yK5m08p0r/6zGXnYyYow3eZz05wTBRhetx5jNQLoSTnPAY0R0NZOJh/rTgG+fL/W5Jeg3/X611et5l9iwS4ZYs1tgrWZQe5UaUhcFpmNAUTlV6j92gquxguZAz9EwRLpngtpz8+wStYaCOfFVeQXxq2pMkSiF1//b3Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821026; c=relaxed/simple;
	bh=N4kUSU4o8AKluWDZEqHZBA5NgJOPOPim6YXMd4c1hiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LmMRIsRlPRIK6m95qM7WnqkvfWUHajwHPmsVvrQHBakztQholjjhR2jDW+9gkw0I3tgMi0LSx22Wmpf3K7mb/whlx09W2hi6E0WGpAzdmV51e+Kv53deWvkmfqUngczaZkeAPE5kNQ5OeRGK6yIL/rAcVM77BymrikwRHqYnifk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k47TMsBF; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k47TMsBF"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8485ef63b68so798286b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Jul 2026 08:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784821025; x=1785425825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y/CrixQ3EkxP2WoSCLt7vnc1mcHljZIG3GR5HRF0Syc=;
        b=k47TMsBFN/N+dVkiyL6JPNNiYpNBZ2oFrN1f/Mg9c7dvkx9eRuPZp1RxHkU+fLSEIm
         0AkNn2QsqQSxiPDevNlrcWHSLjKX2SFjQH0rWffv38uggDe7vCcuj4ZLlY2EZUpf6d0/
         1ClOHao0bqYG2W94EMzNZTIL5vJAA5StKMYlTagr0EA7QJhJLheP4cPhjMYnnMmuDaw4
         RKa2f0NW9nzxhXikl3AGZKE7QfZUPiODGyNENlnviGsDC1q8NVebCLLbGtoqviwXuBuU
         XX3FmnE2Ftzo/+Xv1ct6i9NCkr/utpXrSCzN3hAU16MSx4aguXgiPtRkz6Waiy4w3que
         d8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821025; x=1785425825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/CrixQ3EkxP2WoSCLt7vnc1mcHljZIG3GR5HRF0Syc=;
        b=XI4INA7o9JefoC7hyTn/OB8MskR1sIyvA3NICA/qE2N0F0NSNb6FpR13rh8Bbl5cMe
         qwlKfzymr/G94VX8XZwC3eG7oYYJCkrba5heesfPl/ZbRclHyXfd9AwuJMQ2rN9KNFZP
         1jIBlV0WRkka7eQ/UFDWwBPUc455ofzI2Mui7gHqR22866sfSxzZxMd9vdPvBTPbeMIc
         sY2dKvbAg6KTUHUsEaR678oftqwg45FQBXZVvFYdV9284v9YF5D26IbaSfDsHuglvak9
         uW50UtEi6Yf6ZvoCaWJIDPLSyifldWY21eza2udzkDsUwX96nyZ9dXZn7IBBiHNzryEb
         QHpg==
X-Gm-Message-State: AOJu0YxpJ1LnkSjAbl1ii+GTG2UedEfiViTisVJpOcPEBupp/5wDStxE
	CNfo9Lb2YvZdbWpOHFkhBbfukmuDIMKAybNT62p8JwlulANN5Q4ZOA4b
X-Gm-Gg: AR+sD12fkVeo+Uph9gW2eC1i9fyZkowqfm15GsVCWcWw0vw+HCgInWrOIRIgmQDQym+
	b6Sa+8krFcyRgAtBTiBf0VpZDwdWh5L7wTVWd4JA36BeriySiQgOfN96Q1cFTQbFuK2aem2MNiN
	yiDY548ERDiGn6+E7/Owkb0sm/jQmJQf7CYgmPnbeIhiD82ItIlbw2HIUuEy7hE6OHEb+DtIycA
	A7ClgNx3asCOSOYVv5bsyPbsT4jhXEJU/vD0OYUWMuIXm0Ns0lMjrl1guwdBDa0bX65uTD2of2G
	4PPx7qtoEaSXLiXVEt4TWCMe+wqBeGxGKVN5ot23CrXTdygg6GMSwXctcXTeNgKNuLGTXjkkGSF
	vJzvS3dzeq2gfeiDO+bQOIKPps6R8xLcWlC7zhDA98jeVd6HsLt9K0o+k59eP3wt4PPRRn0EN70
	c6W2j30BOmQBHEYlRU0vSyYrOLiCufR2KVbZNvuulnltBWyrL2sKMS9sWnfInx
X-Received: by 2002:a05:6a00:181d:b0:84c:4d9a:ae42 with SMTP id d2e1a72fcca58-84e2b8bf838mr4448206b3a.27.1784821024558;
        Thu, 23 Jul 2026 08:37:04 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([184.22.136.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e1723643esm3212522b3a.3.2026.07.23.08.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:37:04 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcamplbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: verisilicon: vp9: do not arm watchdog on preparation failure
Date: Thu, 23 Jul 2026 15:36:56 +0000
Message-ID: <20260723153656.2167-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hantro_g2_vp9_dec_run() calls hantro_end_prepare_run() when
start_prepare_run() fails to find one of the required VP9 controls.

hantro_end_prepare_run() completes the control request, but also schedules
the hardware watchdog. Since the decode operation has not been started on
this error path, the watchdog should not be scheduled.

Factor the control-request completion out of hantro_end_prepare_run() and
call it directly from the VP9 preparation error path. This preserves the
pairing with hantro_start_prepare_run() without scheduling the watchdog.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Testing:

- Built with the Verisilicon Hantro driver enabled.
- Not runtime-tested: the available RK3588 board does not expose a Hantro
  G2 VP9 decoder.

 drivers/media/platform/verisilicon/hantro_drv.c    | 13 +++++++++----
 .../media/platform/verisilicon/hantro_g2_vp9_dec.c | 14 +++++++++-----
 drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..04167e4be003 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -147,10 +147,17 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
 	}
 }
 
-void hantro_end_prepare_run(struct hantro_ctx *ctx)
+void hantro_complete_ctrl_request(struct hantro_ctx *ctx)
 {
 	struct vb2_v4l2_buffer *src_buf;
 
+	src_buf = hantro_get_src_buf(ctx);
+	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
+				   &ctx->ctrl_handler);
+}
+
+void hantro_end_prepare_run(struct hantro_ctx *ctx)
+{
 	if (!ctx->is_encoder && ctx->dev->variant->late_postproc) {
 		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
 			hantro_postproc_enable(ctx);
@@ -158,9 +165,7 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 			hantro_postproc_disable(ctx);
 	}
 
-	src_buf = hantro_get_src_buf(ctx);
-	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
-				   &ctx->ctrl_handler);
+	hantro_complete_ctrl_request(ctx);
 
 	/* Kick the watchdog. */
 	schedule_delayed_work(&ctx->dev->watchdog_work,
diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
index 56c79e339030..e08db6e3f6f9 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
@@ -36,12 +36,14 @@ static int start_prepare_run(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_
 
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_handler, V4L2_CID_STATELESS_VP9_FRAME);
 	if (WARN_ON(!ctrl))
-		return -EINVAL;
+		goto err_complete_request;
+
 	*dec_params = ctrl->p_cur.p;
 
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_handler, V4L2_CID_STATELESS_VP9_COMPRESSED_HDR);
 	if (WARN_ON(!ctrl))
-		return -EINVAL;
+		goto err_complete_request;
+
 	prob_updates = ctrl->p_cur.p;
 	vp9_ctx->cur.tx_mode = prob_updates->tx_mode;
 
@@ -86,6 +88,10 @@ static int start_prepare_run(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_
 	v4l2_vp9_fw_update_probs(&vp9_ctx->probability_tables, prob_updates, *dec_params);
 
 	return 0;
+
+err_complete_request:
+	hantro_complete_ctrl_request(ctx);
+	return -EINVAL;
 }
 
 static struct hantro_decoded_buffer *
@@ -894,10 +900,8 @@ int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx)
 	int ret;
 
 	ret = start_prepare_run(ctx, &decode_params);
-	if (ret) {
-		hantro_end_prepare_run(ctx);
+	if (ret)
 		return ret;
-	}
 
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 13e573f1f19d..9d4e858f17c7 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -430,6 +430,7 @@ void hantro_watchdog(struct work_struct *work);
 void hantro_irq_done(struct hantro_dev *vpu,
 		     enum vb2_buffer_state result);
 void hantro_start_prepare_run(struct hantro_ctx *ctx);
+void hantro_complete_ctrl_request(struct hantro_ctx *ctx);
 void hantro_end_prepare_run(struct hantro_ctx *ctx);
 
 irqreturn_t hantro_g1_irq(int irq, void *dev_id);

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.3

