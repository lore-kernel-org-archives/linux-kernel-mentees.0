Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265B735839E
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Jul 2026 13:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898745; cv=none; b=XsVZ+dnB7/0GO8Cmm72RnDmS8VsjgwNKrsunkLMSVcowTWeINgtl/rPLSHb4Gcs/w2fo0jISUznryEigMIAVLEgMbsvVWsuj1qmVa++oYD6O3lJRKL0HbGoig6gZ3lZkPgBeaaT9WNVs1bF3Sz9QBe5t3EJOEP5rj4wvBagtB1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898745; c=relaxed/simple;
	bh=S7Y8t4dcIthKykzBNL2s+eXrDh6GtFtLucUjWpYDR94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jmtoQa9cKHW4/ix5c9Fg9d8lHYrOpTjNoKhHGuJ7tlGIbBYYWlz9K+PyEkQnBR86ZPl2uPTIrEp/v9KUu0sXYwgkvOL1SwMvdTLYYX9OSnaUjAFN+AxDwskjuf9yNhc78JzOVveHCMJaWCBqalsiFd4ZrItMqQs+pcBNiQeP1yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iq18MoDD; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq18MoDD"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84864086bfeso367268b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Jul 2026 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784898742; x=1785503542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFKNVa2uScHavigTP/Jv9UBdhKrx9CJ9eCeBI3gBJk4=;
        b=iq18MoDDXowvp0odM4CU3ZCJwE5eoeDE5eOPRjVuNWCInRPnLRJ5ctn4HsjJZgWZx5
         8Uo6VKnB4vJjz2fyZXWJUiSe0D3yCmBJxFH47Euy3mmxdmJ7lEmW3ikYlNrxgER3yvI6
         JLd3GulAmEimOhkUUFQz/DJ08jzvFe/LLJ48pV0qgr9fRD3NK02Cp9nBS+nMz3/W8rkP
         dK2r/+hJlFhMRzYDIYXuk0lJYnb1di8F7BTG0oiCmyz81bTgNzlL4GYBVG7Fq9eJSgGA
         WBiI9N/U1Z/QvlPQbUUp27lDXEu0aTtok3RbxBjQ+jH1atDX/JlHygn7Q0WKb/uFsyUp
         2TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784898742; x=1785503542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFKNVa2uScHavigTP/Jv9UBdhKrx9CJ9eCeBI3gBJk4=;
        b=bHqQX3tzMBBNWp7H6RhlGxdZ4nHGj+DnRpZSm9GFOp1kdU0WZZhk2UdwoSVpxmDuH5
         CVPPK2s7ToSZHnqYcw81TLRM2IA3OiyjrThaL/VTIOTiYXrt+L71pxIHvCQznaEgIA1h
         q6GbS0Dkb9qOBUJSU/IfYbl763N9GBiL5ABdk5zBGhbmTd+HseWOoAcbUc1mQ3B+DZvx
         gpcmAajxEwj+zkcgi6pcB/kMS8Dlla9pJ66WhRbOclVdp0YmoPC+Si0P8io4fb6PVjp8
         JktOsRnaBjDu75o5lxtJ2ScFAArcftRx5XLsTs6c3veLNPIo4fVyo+Z7mczsf+w3qn3M
         GDNQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLTuaHddBnpUaY78EowwYVx4lLgd7WAaEwFnjIx3s6tCSe+iziEyEs48ukaFwmPxmBmV6b6yqH4Q2iAoh+3c5yLOpVmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhwG2g2Ut3m3lnH2IyRB6qDSgy7IvZenEOOo5yX/A76QpeI1j6
	jkPZsMtoJtuMyw/+TYQNDh10o/26jcC4C9IMTJP+hjvGVHXogqBOeiHN
X-Gm-Gg: AR+sD12v3n+7ncsuVTXPIC2Qb5ItGbAww4eZlT9osJG4LzaZtgX2+v2Vnc+S13+Y7dp
	UpZeDnbfwE7AYyUTTvgNFThifpDhulcpbdoImUO6YzOAe/acOGDhTiDUG52jDPaDFfmTR8pc8gK
	N+fc1hotIHDH09aegxBV8oMFJtKEoJjp0jwQ1eZnmFsMU5mn7s+5XYTbgg2D2gU9QgRwwgnXOAg
	rmhxp76DQzj+dQPo9EjEEBMS3XTf8Sz624y+xAqYuTC4BbnNAaoQgtE5S3oDyEGeooX+4FuxnFv
	6Ux5dunk7IspbNsUDRJx6JqX+U402LWwIafpBvxBORbD+dODExy/ITK7J2tJ+q5ICOA4dCZ07Re
	hgjzaC2ak6Q3FTEOSCUSSyzgxO1e12mCn9Gw6DnXngHKL/7T9XIa4fYMPi3oNReFZmkJTkPBDUC
	P5GK5YreiCCZ8DXHWiRyi5FbCw4Wjv/HdbTkzGCMK/ByAz2hvGV4oL2nuKaBhG
X-Received: by 2002:a05:6a00:139c:b0:848:4c3d:659f with SMTP id d2e1a72fcca58-84e2c29b83fmr8147681b3a.75.1784898742361;
        Fri, 24 Jul 2026 06:12:22 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([184.22.139.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ce455sm4666968b3a.48.2026.07.24.06.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:12:21 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v2] media: hantro: release runtime resources when device_run fails
Date: Fri, 24 Jul 2026 13:12:08 +0000
Message-ID: <20260724131208.2315-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CACak8wN-Y=oDbEVbou+RetS9X-Lca_MZHSY2NJFaGWR3LoVBKQ@mail.gmail.com>
References: <CACak8wN-Y=oDbEVbou+RetS9X-Lca_MZHSY2NJFaGWR3LoVBKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

device_run() acquires a runtime PM reference and enables the VPU clocks
before invoking the codec-specific run callback.

If clk_bulk_enable() fails, the runtime PM reference is left held. If
the codec-specific run callback fails, both the enabled clocks and the
runtime PM reference are left held.

Add separate error paths to release the resources acquired by
device_run(). Disable the clocks when the codec run callback fails, and
drop the runtime PM reference when either clock enabling or the codec
run callback fails.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Changes in v2:
	- Fix the codec run failure path to disable the clocks before dropping
	  the runtime PM reference.
	- Use a local vpu variable in device_run().

Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
  H.264 (JVT-AVC_V1):	     129/135, unchanged
  MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged
  VP8 (VP8-TEST-VECTORS):    61/61, unchanged

 drivers/media/platform/verisilicon/hantro_drv.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..72250bb56872 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -170,29 +170,34 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 static void device_run(void *priv)
 {
 	struct hantro_ctx *ctx = priv;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
 
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
 
-	ret = pm_runtime_resume_and_get(ctx->dev->dev);
+	ret = pm_runtime_resume_and_get(vpu->dev);
 	if (ret < 0)
 		goto err_cancel_job;
 
-	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
+	ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
 	if (ret)
-		goto err_cancel_job;
+		goto err_pm_put_autosuspend;
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
 	if (ctx->codec_ops->run(ctx))
-		goto err_cancel_job;
+		goto err_disable_clock;
 
 	return;
 
+err_disable_clock:
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+err_pm_put_autosuspend:
+	pm_runtime_put_autosuspend(vpu->dev);
 err_cancel_job:
-	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+	hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {
-- 
2.47.3

