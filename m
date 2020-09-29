Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C60C4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 03:26:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 860F021D41
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 03:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnOecMsx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 860F021D41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 573EC864B2;
	Tue, 29 Sep 2020 03:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kVrnYVVJw+Ax; Tue, 29 Sep 2020 03:26:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6938C86174;
	Tue, 29 Sep 2020 03:26:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5877FC0891;
	Tue, 29 Sep 2020 03:26:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 868C2C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 767658709E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hko2TsYrlvhX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7985286FBB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:49 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id b2so2524728qtp.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 20:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1FVuww3IJdd2UIE1fj72kz5GKbYIyP+dhptpK1ApVa8=;
 b=AnOecMsxAMsOnhOnQJM5pCUBPq7uGBeSsYp605AF6kNReyi63O0zOIrh+SOl/ktSHA
 0g7MYOi0IGSFbhxxi49zhvEsyPl3iyOyN6v1Amn4wxptHvNP/bqWrmsqcBU8wPoly/Nr
 JIMbY3pIug4IQ2gaMYTFiWdq3IybL243TOPPe2YtUtxcsB3GaiHptxwAPcMHK9RUhmfA
 YjwyVaUAwN6WHFKKnjO76FBqQMooOaWzXn5vLcKjbh/r7d3wHyLmwBdtf9E2ODpk9S3A
 dyeHejZLv3NLbIJysA+WnDtfAwLJZwghuBA63IH0OfRYQHF/LhW7Uc9/0b/O2COcDOTy
 sx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1FVuww3IJdd2UIE1fj72kz5GKbYIyP+dhptpK1ApVa8=;
 b=hM4Wb3bnD8jPrwTNriqgY63BsC2Sdsclnk8+Ufgh019BdzaXE5FUAEBwku8re/U0PL
 ZIjvGqsEo9Ovb+m+1Jzv/YVaVJvrjJ5Dvg59LWUL8HcMNQokH2PviZuty9LEMbd6Fvpc
 NBX5RAc9ishkrDPJKT7rKTM2viUr129yHZvPo/oyzGx7V8LmilbKPq/AmijQjHFq2bCt
 82Np6DCwITSJU54cCsEKGcjgxVdKWGEwh3VuDM/WGifViek1XWuPUK/oWNk+XAkmoTcr
 lW6NN+zU5XwNlG7FPachKpGvO99lB+z7oAP7FHqqAK+DlItaINsowveqtE2mRSH2N1Ge
 l59g==
X-Gm-Message-State: AOAM531pHmtp/i0sSonvJXSeGnlKhNRUB6dm8b8MSWSgxj9SRtIz86KH
 gP8c9LHBazvWRZ/l23JfNt4=
X-Google-Smtp-Source: ABdhPJwbilXRi5Vs/95F6hpaZRpvDfsndwWWDFehkLggNHUJE1lmVxCwXGw6UwdEWUjBtuA194fNBQ==
X-Received: by 2002:ac8:66da:: with SMTP id m26mr1369965qtp.111.1601350008501; 
 Mon, 28 Sep 2020 20:26:48 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id c40sm4010313qtb.72.2020.09.28.20.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 20:26:48 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org,
	r.verdejo@samsung.com,
	nicolas@ndufresne.ca
Date: Tue, 29 Sep 2020 00:26:24 -0300
Message-Id: <20200929032625.1548909-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
References: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH WIP 5/6] media: vidtv: Move s302m
	specific fields into encoder context
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

A few fields used only by the tone generator in the s302m encoder
are stored in struct vidtv_encoder. Move them into
struct vidtv_s302m_ctx instead. While we are at it: fix a
checkpatch warning for long lines.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 .../media/test-drivers/vidtv/vidtv_encoder.h  |  3 --
 .../media/test-drivers/vidtv/vidtv_s302m.c    | 30 +++++++++++--------
 .../media/test-drivers/vidtv/vidtv_s302m.h    |  3 ++
 3 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_encoder.h b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
index 65d81daef4c3..f742d566fbcb 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_encoder.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_encoder.h
@@ -131,9 +131,6 @@ struct vidtv_encoder {
 	u32 encoder_buf_offset;
 
 	u64 sample_count;
-	int last_duration;
-	int note_offset;
-	enum musical_notes last_tone;
 
 	struct vidtv_access_unit *access_units;
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index 6e5e72ce90d0..f7afbda6335d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -233,36 +233,38 @@ static u16 vidtv_s302m_get_sample(struct vidtv_encoder *e)
 {
 	u16 sample;
 	int pos;
+	struct vidtv_s302m_ctx *ctx = e->ctx;
 
 	if (!e->src_buf) {
 		/*
 		 * Simple tone generator: play the tones at the
 		 * beethoven_5th_symphony array.
 		 */
-		if (e->last_duration <= 0) {
+		if (ctx->last_duration <= 0) {
 			if (e->src_buf_offset >= ARRAY_SIZE(beethoven_5th_symphony))
 				e->src_buf_offset = 0;
 
-			e->last_tone = beethoven_5th_symphony[e->src_buf_offset].note;
-			e->last_duration = beethoven_5th_symphony[e->src_buf_offset].duration * S302M_SAMPLING_RATE_HZ / COMPASS / 5;
+			ctx->last_tone = beethoven_5th_symphony[e->src_buf_offset].note;
+			ctx->last_duration = beethoven_5th_symphony[e->src_buf_offset].duration *
+					     S302M_SAMPLING_RATE_HZ / COMPASS / 5;
 			e->src_buf_offset++;
-			e->note_offset = 0;
+			ctx->note_offset = 0;
 		} else {
-			e->last_duration--;
+			ctx->last_duration--;
 		}
 
 		/* Handle silent */
-		if (!e->last_tone) {
+		if (!ctx->last_tone) {
 			e->src_buf_offset = 0;
 			return 0x8000;
 		}
 
-		pos = (2 * PI * e->note_offset * e->last_tone / S302M_SAMPLING_RATE_HZ);
+		pos = (2 * PI * ctx->note_offset * ctx->last_tone / S302M_SAMPLING_RATE_HZ);
 
 		if (pos == 360)
-			e->note_offset = 0;
+			ctx->note_offset = 0;
 		else
-			e->note_offset++;
+			ctx->note_offset++;
 
 		return (fixp_sin32(pos % (2 * PI)) >> 16) + 0x8000;
 	}
@@ -445,6 +447,10 @@ struct vidtv_encoder
 {
 	struct vidtv_encoder *e;
 	u32 priv_sz = sizeof(struct vidtv_s302m_ctx);
+	struct vidtv_s302m_ctx *ctx = kzalloc(priv_sz, GFP_KERNEL);
+
+	if (!ctx)
+		return NULL;
 
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
 	if (!e)
@@ -460,16 +466,14 @@ struct vidtv_encoder
 	e->encoder_buf_offset = 0;
 
 	e->sample_count = 0;
-	e->last_duration = 0;
 
 	e->src_buf = (args.src_buf) ? args.src_buf : NULL;
 	e->src_buf_sz = (args.src_buf) ? args.src_buf_sz : 0;
 	e->src_buf_offset = 0;
 
 	e->is_video_encoder = false;
-	e->ctx = kzalloc(priv_sz, GFP_KERNEL);
-	if (!e->ctx)
-		return NULL;
+	e->ctx = ctx;
+	ctx->last_duration = 0;
 
 	e->encode = vidtv_s302m_encode;
 	e->clear = vidtv_s302m_clear;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.h b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
index eafe457e761d..a0101734e758 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
@@ -38,6 +38,9 @@ struct vidtv_s302m_ctx {
 	struct vidtv_encoder *enc;
 	u32 frame_index;
 	u32 au_count;
+	int last_duration;
+	int note_offset;
+	enum musical_notes last_tone;
 };
 
 /**
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
