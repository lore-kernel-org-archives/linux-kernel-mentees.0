Return-Path: <SRS0=CDUK=EG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED6CC4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 15:06:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4442020702
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 15:06:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSChu41J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4442020702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BF35C8725C;
	Sat, 31 Oct 2020 15:06:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DfNNGO28qgcr; Sat, 31 Oct 2020 15:06:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C3D687239;
	Sat, 31 Oct 2020 15:06:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28767C0859;
	Sat, 31 Oct 2020 15:06:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85152C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8121B86C78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1AXio9l-SZM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B8E61865C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:17 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id f93so6267084qtb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 08:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PCvO/PPPP7+nQ6uwQgtk8mFv9Z7qqn+sP+8PJKc6iJE=;
 b=iSChu41JRrmskRgcLjxKMag877VQynA9iS3oa/QPcNgb5YWsm697eH6QSkTS6sYe+n
 czJyDuGBVC0rde0XDthGO54sF374XndP6WbiX0pmFZbcBnzqWayv4bXSx3vBzU99I4JC
 5uvkgRrGlFdZzP94jcNNWGVUJ10x9HnB7idIqTBcfgMP1dZvjTK2uY0RfLIlD4xFa2zw
 OcPuZZEnAIRn4Jg3zMslYU3jj8hAbV2DPafkugDEm5YYuLG5pYGW0frL+sCtTXi4IeF5
 SVr01J+csH7LhOrgnvf6+fGqzjtZQ+784RksBz68eExZbe5TqdzZkbJL7y9+DGE6vP3D
 xXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PCvO/PPPP7+nQ6uwQgtk8mFv9Z7qqn+sP+8PJKc6iJE=;
 b=U+OE7tZ4JBT4JiDhQk2tkRsiBv4EbqLaRxD8GhNlcxj+Z8+f10PBal17f0K2TgDfKJ
 HpOxOq1cqt94TqEMUPrnZ7BYWDAZDl0XdQz2hYYufX0D3FYx30lEVa/TBIlHkV2rt+uq
 j6PUWolZgc+k4hD7qklJ2hDMGYg1OsJ+FOTSbVyZB+ZW7+ShdOOGVkGx56bivmHR5Div
 gsSVShN6syrYDxz8v/lu1JDC9MfVVtc0iOz205lfyjL1glDZrCHNM6ijS1sO/JtgLt6O
 iFOA0MVnAZEOo8b7a01QIBPNBvjod/LIohLq1bxJSdDxKXUG5LEAq42/TdekZUUBFR9s
 DrKg==
X-Gm-Message-State: AOAM5334hP7JQ93qXwSo5wOm0CipX3yOqOb5Dt7XguvTvuOw7tXE76qj
 2LpgZs2QxCJ+Oo8z+oZQYxE=
X-Google-Smtp-Source: ABdhPJzFOj4nmGsPPa6pVjMDfBC5xphXVmxjJ6IlIYFHn2WAkWk7hH3BW25Nq8X0mtxgpSygo4EVSA==
X-Received: by 2002:aed:2982:: with SMTP id o2mr6958014qtd.73.1604156776831;
 Sat, 31 Oct 2020 08:06:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id z125sm2317030qke.54.2020.10.31.08.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 08:06:16 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org,
	r.verdejo@samsung.com,
	nicolas@ndufresne.ca
Date: Sat, 31 Oct 2020 12:05:51 -0300
Message-Id: <20201031150552.663598-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201031150552.663598-1-dwlsalmeida@gmail.com>
References: <20201031150552.663598-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 5/6] media: vidtv: Move s302m
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
 .../media/test-drivers/vidtv/vidtv_encoder.h  |  3 ---
 .../media/test-drivers/vidtv/vidtv_s302m.c    | 25 +++++++++++--------
 .../media/test-drivers/vidtv/vidtv_s302m.h    |  3 +++
 3 files changed, 17 insertions(+), 14 deletions(-)

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
index a447ccbd68d5..aacf8110d874 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -230,36 +230,38 @@ static u16 vidtv_s302m_get_sample(struct vidtv_encoder *e)
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
@@ -442,6 +444,7 @@ struct vidtv_encoder
 {
 	struct vidtv_encoder *e = kzalloc(sizeof(*e), GFP_KERNEL);
 	u32 priv_sz = sizeof(struct vidtv_s302m_ctx);
+	struct vidtv_s302m_ctx *ctx = kzalloc(priv_sz, GFP_KERNEL);
 
 	e->id = S302M;
 
@@ -453,14 +456,14 @@ struct vidtv_encoder
 	e->encoder_buf_offset = 0;
 
 	e->sample_count = 0;
-	e->last_duration = 0;
 
 	e->src_buf = (args.src_buf) ? args.src_buf : NULL;
 	e->src_buf_sz = (args.src_buf) ? args.src_buf_sz : 0;
 	e->src_buf_offset = 0;
 
 	e->is_video_encoder = false;
-	e->ctx = kzalloc(priv_sz, GFP_KERNEL);
+	e->ctx = ctx;
+	ctx->last_duration = 0;
 
 	e->encode = vidtv_s302m_encode;
 	e->clear = vidtv_s302m_clear;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.h b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
index eca5e3150ede..b1bbe521e766 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
@@ -39,6 +39,9 @@ struct vidtv_s302m_ctx {
 	struct vidtv_encoder *enc;
 	u32 frame_index;
 	u32 au_count;
+	int last_duration;
+	int note_offset;
+	enum musical_notes last_tone;
 };
 
 /**
-- 
2.29.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
