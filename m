Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3319A42AF95
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Jul 2026 11:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891764; cv=none; b=I/qL2MLhvpgaU+hvG5CSmUUVqupRTdLW3WEf1z7ZQ7vqKb/SimzN/XH9BBfOBXLHSQCeCssVED3NkMAU2Ltt6ieT7YP8MCarKh8BT9GamGimJbweGcBJtY47aFynUOl8dA1Sp/gz7ysfgsPfvE5tZ9ojO5sbCC1i4lyue1WYBcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891764; c=relaxed/simple;
	bh=/+UuceguC9yXU3f5M46mFFc4fdT9Z6jZUm6WXImCwBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sosK2WQe7Ak0FHUGpS24JlW2dNwZ7fMMjgse2sKSIDYedMY7MHPsDvKxzoPbeqNdPZdHHR/e4717OynoT+uxrA9BQ3b+wrUl1X+jnnMBrXZGQvs7z0JI+tFrMAQVe4GAmCVJKfaUENmGKxHKr8IrhvOmWNSwDAYzApjgL6fhGiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7AxOVlq; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7AxOVlq"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so206751a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Jul 2026 04:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784891761; x=1785496561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7h17JbhLU+77sg51wrzjO1vG3T/1lQHWX6olvED5GMA=;
        b=b7AxOVlqImmInMHt+uPWYYivVJF7uWZYcKpxJ16bLCGc5Kb50Fh/5DVAFSyQKwqdOe
         rpe/wOzjQJSui5kHYAxEsEw2ndkdLz7a4r013F3btBUL4lWvRZGSe4rYYqAYgPOvxOsV
         bUkgHdqoWkxWy56AbC6HuUwYXpg9OTehoe/+zQenqpQcqjdSKXd/CfLX0u86TWD7Eqj1
         jM8Khoij8RdV58fe/EK7LzCeY+RuBMtZWYX7yUb3YnaWgIEm+60Vd0pAXZOOFdwf+zPC
         baJpKMOs+gdKVFrDT6t9iLSkjhY+iMD9wxmmG0NmTSqlgZrl/RZbdsiNUQ9f4w/6fonE
         wgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784891761; x=1785496561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7h17JbhLU+77sg51wrzjO1vG3T/1lQHWX6olvED5GMA=;
        b=ofe25oPyfOctmyPF/lPehobwHIDxT+pk/gqdWJnZn/CryJBbBcxCiijb0kHgpJ5jq4
         p8SPfAtE38Ls9hMEplg+E/mSG/rs1KVGWPFTs1aWjHP2nbedutXWLSFoZuNcJOhFXgSH
         pQfNV0T6lH7bdakS3p7UMTvn0YH5Yp4zZ4Ywiz8Of4t03GA5JcMYzEP6mPaJ15C32ETk
         2TSxIlNSA54Z6bOxu+AtYp62eM8j24qHX01IXiKwwm8fig2mwDl5JcwejTz/ea9BcuO8
         /0VnhjPAejP1OW7zHc1TbF5aIHVWcJh9b+snbCSithcx/Rzs2AJnwp5VZF97aDe49xBj
         a4vw==
X-Forwarded-Encrypted: i=1; AHgh+RoYE6dnHBs7ZmDpZx0bgIwfL4xw5IPKYi+/Dn1wLKiAhxD8dMWjftqdxTESY9fBczEZFnWigT1IAQtgNbqlFJxRjiTJ8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbKEGnl4D7pyHkGNlASJ4X8c7/8aJcOUf2VslUGdiVAFCYRGTX
	RbfshBEH01JUHXicrGqmQ9dn0dy0yWTEIQ0RNDu3GYCWJ/4YCWACoQFB
X-Gm-Gg: AR+sD13NYdFObuYchPe94CCGcUIak0uILGO88kn+GZmHyVywKlnnou6lEZTfJY5jpC1
	7XFzMXHLMSv89CBWwM+mwIkBiNiGZr8dofTxlzVFLwFBnv4UPfwCzBw/7/lrP6AWGUSJ4TSYIao
	Fes7XsZuFIJlmHb/PhRj22aZk5/grNWKevXlcvPMPxqeUoUuTwAjxcEv8v812FXklP1sP3hnjTE
	gWRULe66Y4J8GwRfKi86IHKpIMBP/5jQIKcHPBly67RWGAtOBXyZX9sFfhvdTXRHcrt8QQiUcl+
	rjLu5eeMHfE15hflTLTnbqDbFzi1Fm+qNfVvefqOpadqyhPEoKGVfgdGTM5xyPLz/l3WJn07ddz
	/mI3epkNoH4tDkJ5+rKUaikkwBQZNyZPFSxtL7YBx1MP+y/dTi8+2+YoQks+uu+96qJdnj92wW7
	njQDLriySlzL5u2elDY9yxfZmMGYAaXQh0zXSRgvC/2SGMR9iVpwwWbW/UcZPe
X-Received: by 2002:a17:90b:4c8c:b0:38e:47e0:3ddd with SMTP id 98e67ed59e1d1-38ec65da07emr7051136a91.34.1784891761291;
        Fri, 24 Jul 2026 04:16:01 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([49.228.106.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03c4580csm1316850a91.15.2026.07.24.04.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 04:16:00 -0700 (PDT)
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
Subject: [PATCH] media: hantro: release runtime resources when device_run fails
Date: Fri, 24 Jul 2026 11:15:48 +0000
Message-ID: <20260724111548.2109-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
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
Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
  H.264 (JVT-AVC_V1):	     129/135, unchanged
  MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged
  VP8 (VP8-TEST-VECTORS):    61/61, unchanged

 drivers/media/platform/verisilicon/hantro_drv.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..9daaf129211d 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -170,6 +170,7 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 static void device_run(void *priv)
 {
 	struct hantro_ctx *ctx = priv;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
 
@@ -178,11 +179,11 @@ static void device_run(void *priv)
 
 	ret = pm_runtime_resume_and_get(ctx->dev->dev);
 	if (ret < 0)
-		goto err_cancel_job;
+		goto err_disable_clock;
 
 	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
 	if (ret)
-		goto err_cancel_job;
+		goto err_pm_put_autosuspend;
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
@@ -191,8 +192,12 @@ static void device_run(void *priv)
 
 	return;
 
+err_disable_clock:
+	clk_bulk_disable(vpu->variant->num_clocks, ctx->dev->clocks);
+err_pm_put_autosuspend:
+	pm_runtime_put_autosuspend(vpu->dev);
 err_cancel_job:
-	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+	hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.3

