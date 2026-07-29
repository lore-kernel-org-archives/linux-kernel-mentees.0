Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C02E3B71BD
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 29 Jul 2026 06:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305254; cv=none; b=RZk4KgL3WqTBWj/3Sh0xQPTzOEIX4bDqTXENggfQcHVJkj0GBnOC8mqGP66hGjoCPWnjWNTKQlVRAOTrEW/fElCUP1CXdbVAr2a6FaWLyol0oAlXJ6k+UBu91DStDqZkTrDtKoI7XMjS9yGdPkbMVvK92ZsLBwHeTLZuQ2NcObs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305254; c=relaxed/simple;
	bh=BPHiLpsWld1Ew5XUZl5sR5LEspPsATRgJZe6tzn6vfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugFkh0AbtHLxlkBgXUT1Q91gP0xNgRFS/76s980EPurVVKYfua2Zq1HS8Tx7z0FBt5i5IkNwAi1hudlbdiC6T5/QN/0UuazEZ2ZpUJc9FRPfzCZTpWj5z0PFo/O6zXEWeJerRYOUw4FwuNrlj7nPoOaFI5grKuGpvzJv4mHFPyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJ2UCJgy; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJ2UCJgy"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848593533cbso249944b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Jul 2026 23:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305252; x=1785910052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hu86WNjJ+kA/XeSuM7zN7dq8Faj07B8lKH5Il6BqR+4=;
        b=QJ2UCJgyeQcRAGxEulPbfgk7wAEWxLcIdmIde0IdVDulrBCSXXPZZ3y+1lSEYsZ6wX
         4IuR3JQ3SdmBCCdY+RBUZj+Kzx+D7hFljiNn68uRNklnV5ajiYVoKKhc1uRSHnvxsi1K
         UOjJEEMKlr3nlTAkyQDKQuhg/WiKLCiiE/fV1w4ZUzbzQpGbv0MI03v1Eg766u9AdGTl
         nMfLZNGhJrfW6Wn/qbCMifp8Khz0tYXIBb7FpLoPHsuXRhiohn++lTGjCcPVcz4m20lE
         A51LH22toO9ORxQTAPeAj09R2t254LrGqiotMP/WiTWtvNEutSv+79nH9dUJK8qDbwwL
         EcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305252; x=1785910052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hu86WNjJ+kA/XeSuM7zN7dq8Faj07B8lKH5Il6BqR+4=;
        b=d9kLpsXLGvIGO3I96fx1ktJlvzGyvXojxlklzjn5xIbT07ijXbYs/doRGPlCzApucu
         J8onUvhAMgiNwk8VaVXee24wfHLJGRD3VRWBWlZ1Q+BiFYLzBkzyV/MwzbC0rhbp9gwo
         FdIU26fxyC9r46xBWg9Yhu3kgLHMXziV8teoFYv+tb/euMxvteede37bnlXPIfXj69im
         t1Ca/ShN66TJOKZ4yrJCPtPBs9W4cEkUVyYoQB9FiKw1XqzLBaDTH1ZghMTN/L7BJhRr
         TG45XFjLWom8tqVNbYIZl8SBo9D0Y1qxIsrjcsJ5QdiEiAddb8VaybZ9FI9ZEgWTSA1o
         h8LA==
X-Forwarded-Encrypted: i=1; AHgh+RqfNNpVzg8QbouG1sk+YEqmKMHwmfWeueUCQxoOG2GUXG2FXG/D3pW7yHkJ5frzRmkMsENJvWJmVQ9IAjmh6yc7PkDlww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9GNkVUrdFvBUxgZFfavKQ9TuVraoSNRmvCUxoCXAgP49P/0pk
	Yb/PMJ2PfUem/uAEd/ucDgNZXTRBIwVTXqd0T2XTmBav/EsNkmcDokhV
X-Gm-Gg: AR+sD11sH/puuaNPs8dD59xnf+8mnFbcaN94gNaVVjEdQWslpvYMtGVIUOA0+Q3i0jk
	PV0coshSy/ubyXgp5/eGdxn/jVj+n5nXe0cjDOmle27OdGafWtygCJmM5XlQHXqCFSqVqb36Hcr
	elHe6lF3A7SHYgi6IQ+HhuVclfUUhu3OuHro78DjMJnZ7hBYhs1OOPywZaqXHjwY8MaQC4stnJ4
	oss1cfu3jffklL/Kdl7NGF+17/V+MJ6kmIOOhkOnmDhmmuLD/rigcRGsPo5cfSHLJ6TB5AAAEd9
	G+UPgITGQtKmx/hNxYXkuGwbPKdWD3cdPIPLE7YBN7DA6v1aVYRttNU5GoHvQ8UqFOHObQ3ny5J
	pu6pVJg4+ENxWWLLydeAOyw4Al8VqtNst8M2R5/6nr2KXUlANUK1TkC6d64L8d3D3L97vJip/0q
	qApcs8zJ34OJm6GwdOZVfLhFSm+k1a82ZvaL5X6re4OlY3yQSqbd5aAuagToIsks27o6L94G0B8
	ocEhsDYrAL1NFBpa3YDir+7sucdeEm0kYUheSvPhpeTvUSCqZM=
X-Received: by 2002:a05:6a00:b91:b0:82f:38df:681c with SMTP id d2e1a72fcca58-84e931ec99amr5885268b3a.6.1785305251710;
        Tue, 28 Jul 2026 23:07:31 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([2405:9800:b670:b64b:1c6e:95da:41c0:e7b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm805504b3a.31.2026.07.28.23.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:07:31 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
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
	Frank.li@oss.nxp.com,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v5 1/2] media: hantro: release runtime resources when device_run fails
Date: Wed, 29 Jul 2026 06:04:39 +0000
Message-ID: <20260729060440.2092-2-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729060440.2092-1-tharitt97@gmail.com>
References: <20260729060440.2092-1-tharitt97@gmail.com>
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

Make the clocks part of the device's runtime PM state by enabling them
from the runtime-resume callback and disabling them from the
runtime-suspend callback.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 .../media/platform/verisilicon/hantro_drv.c   | 66 +++++++++++--------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..d6fcd4f7f9da 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -59,8 +59,7 @@ static const struct v4l2_event hantro_eos_event = {
 	.type = V4L2_EVENT_EOS
 };
 
-static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
-				    struct hantro_ctx *ctx,
+static void hantro_job_finish_no_pm(struct hantro_ctx *ctx,
 				    enum vb2_buffer_state result)
 {
 	struct vb2_v4l2_buffer *src, *dst;
@@ -86,15 +85,13 @@ static void hantro_job_finish_no_pm(struct hantro_dev *vpu,
 					 result);
 }
 
-static void hantro_job_finish(struct hantro_dev *vpu,
-			      struct hantro_ctx *ctx,
+static void hantro_job_finish(struct hantro_ctx *ctx,
 			      enum vb2_buffer_state result)
 {
-	pm_runtime_put_autosuspend(vpu->dev);
-
-	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+	struct hantro_dev *vpu = ctx->dev;
 
-	hantro_job_finish_no_pm(vpu, ctx, result);
+	pm_runtime_put_autosuspend(vpu->dev);
+	hantro_job_finish_no_pm(ctx, result);
 }
 
 void hantro_irq_done(struct hantro_dev *vpu,
@@ -111,7 +108,7 @@ void hantro_irq_done(struct hantro_dev *vpu,
 	if (cancel_delayed_work(&vpu->watchdog_work)) {
 		if (result == VB2_BUF_STATE_DONE && ctx->codec_ops->done)
 			ctx->codec_ops->done(ctx);
-		hantro_job_finish(vpu, ctx, result);
+		hantro_job_finish(ctx, result);
 	}
 }
 
@@ -127,7 +124,7 @@ void hantro_watchdog(struct work_struct *work)
 		vpu_err("frame processing timed out!\n");
 		if (ctx->codec_ops->reset)
 			ctx->codec_ops->reset(ctx);
-		hantro_job_finish(vpu, ctx, VB2_BUF_STATE_ERROR);
+		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
 	}
 }
 
@@ -170,29 +167,24 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 static void device_run(void *priv)
 {
 	struct hantro_ctx *ctx = priv;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
 
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
 
-	ret = pm_runtime_resume_and_get(ctx->dev->dev);
-	if (ret < 0)
-		goto err_cancel_job;
-
-	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
-	if (ret)
-		goto err_cancel_job;
+	ret = pm_runtime_resume_and_get(vpu->dev);
+	if (ret < 0) {
+		hantro_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
+		return;
+	}
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
-	if (ctx->codec_ops->run(ctx))
-		goto err_cancel_job;
-
-	return;
-
-err_cancel_job:
-	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+	ret = ctx->codec_ops->run(ctx);
+	if (ret)
+		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {
@@ -1296,10 +1288,30 @@ static void hantro_remove(struct platform_device *pdev)
 static int hantro_runtime_resume(struct device *dev)
 {
 	struct hantro_dev *vpu = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
+	if (ret)
+		return ret;
+
+	if (vpu->variant->runtime_resume) {
+		ret = vpu->variant->runtime_resume(vpu);
+		if (ret)
+			goto err_disable_clocks;
+	}
+
+	return 0;
 
-	if (vpu->variant->runtime_resume)
-		return vpu->variant->runtime_resume(vpu);
+err_disable_clocks:
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+	return ret;
+}
 
+static int hantro_runtime_suspend(struct device *dev)
+{
+	struct hantro_dev *vpu = dev_get_drvdata(dev);
+
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
 	return 0;
 }
 #endif
@@ -1307,7 +1319,7 @@ static int hantro_runtime_resume(struct device *dev)
 static const struct dev_pm_ops hantro_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(NULL, hantro_runtime_resume, NULL)
+	SET_RUNTIME_PM_OPS(hantro_runtime_suspend, hantro_runtime_resume, NULL)
 };
 
 static struct platform_driver hantro_driver = {
-- 
2.47.3

