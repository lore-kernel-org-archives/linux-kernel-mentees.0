Return-Path: <SRS0=+n2V=LO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78577C49EA3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Jun 2021 19:47:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C89961001
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Jun 2021 19:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C89961001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6AF0834F4;
	Sun, 20 Jun 2021 19:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mWiblSmD1Zu; Sun, 20 Jun 2021 19:47:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 28BF88356C;
	Sun, 20 Jun 2021 19:47:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05D19C000E;
	Sun, 20 Jun 2021 19:47:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B86DC000C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 19:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D12D400C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 19:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEn5BP64Du01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 19:47:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57B8040025
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 19:47:01 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id d16so18999485lfn.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 12:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJJTRUSYjIQLxUFD4qYl8I2m6+/94h3/V5V1FUIXn7g=;
 b=b8acL7uZ5TxeRsArHX8WqS6j0/RXMgOHE91CxKAydAh8kONnLql2O6OxzNYeiq+r2d
 GWgNUWVrGpBeJE1dSX4gXBpo1zJHTkg//m2hWzxFx9+G7PLZFz/OeeSCoEkF6vjp++fM
 fP/gldhOLvEkONnEFKJAPoQ0zDmlXrEEFHyiT6OqSzYoBx3V+J91tikhXItSd2oAMsMR
 xeEK4OdNfCEu97KiT3HgALveb++g7gUauRVaQLtybw4AyxKTI9EGH6pW4BC5yb/mTAwQ
 jRy7FccBZrIsMlAeLAI012bexOTDE8WXJDHWKvD/IEt+Jphd7ASgoSL9TPoudN2xogLZ
 gWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJJTRUSYjIQLxUFD4qYl8I2m6+/94h3/V5V1FUIXn7g=;
 b=jaIqzZGIv7Rd89+zCalLhIhA85rb15ONPrkfGO3rqtxPyrqrC2DFohVfggKnJxZ9F+
 8DBtDitNQtVNVeLVHl6cAIiXcTMWTyq7yJXWqk0Xk8EuUB02xS+gVBvpNFUnbHAAo2PV
 JFPOBZdlFqFmMbbhYEVkMHfamglogdF1WQqUCBek47zLyl4g7WT5LbuwuxQP/AbrZBAJ
 r3SL88fqTr+VpL552W8M2bK2SFfg/AHgYCPaa1/TIIciXmbJ+Xprjci9WOgbl3P0+QBu
 KuG5D5Bp+6jJngFrIvpQCMz6NiPq6ks4LaPoXZS8/7wjZZw9xKGahP8jlCwhqSB230SC
 4epg==
X-Gm-Message-State: AOAM530AhIOO8hqb1GHTkyrjFBX8gVDIHFXcHbWDHSRQuGPiD6Ns/jD9
 AFIIRySJnwpcfzDGozwXGhE=
X-Google-Smtp-Source: ABdhPJwzYshMhSsoaGotMT/TySkoxzGc91M+bm7SwyHt2W60/WTUbBMK0DVzN2UO49EI9B7madp+GA==
X-Received: by 2002:a05:6512:1326:: with SMTP id
 x38mr11199748lfu.62.1624218419263; 
 Sun, 20 Jun 2021 12:46:59 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
 by smtp.gmail.com with ESMTPSA id z13sm1031271ljn.92.2021.06.20.12.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 12:46:58 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: hverkuil-cisco@xs4all.nl, mchehab@kernel.org, oneukum@suse.com,
 gregkh@suse.de
Subject: [PATCH 2/2] media: go7007: remove redundant initialization
Date: Sun, 20 Jun 2021 22:45:42 +0300
Message-Id: <dc1bd4f8df4e07263e7c3ff7e1853ee3dec95df8.1624217907.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1624217907.git.paskripkin@gmail.com>
References: <cover.1624217907.git.paskripkin@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
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

In go7007_alloc() kzalloc() is used for struct go7007
allocation. It means that there is no need in zeroing
any members, because kzalloc will take care of it.

Removing these reduntant initialization steps increases
execution speed a lot:

	Before:
		+ 86.802 us   |    go7007_alloc();
	After:
		+ 29.595 us   |    go7007_alloc();

Fixes: 866b8695d67e8 ("Staging: add the go7007 video driver")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/go7007/go7007-driver.c | 26 ------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-driver.c b/drivers/media/usb/go7007/go7007-driver.c
index f1767be9d868..6650eab913d8 100644
--- a/drivers/media/usb/go7007/go7007-driver.c
+++ b/drivers/media/usb/go7007/go7007-driver.c
@@ -691,49 +691,23 @@ struct go7007 *go7007_alloc(const struct go7007_board_info *board,
 						struct device *dev)
 {
 	struct go7007 *go;
-	int i;
 
 	go = kzalloc(sizeof(struct go7007), GFP_KERNEL);
 	if (go == NULL)
 		return NULL;
 	go->dev = dev;
 	go->board_info = board;
-	go->board_id = 0;
 	go->tuner_type = -1;
-	go->channel_number = 0;
-	go->name[0] = 0;
 	mutex_init(&go->hw_lock);
 	init_waitqueue_head(&go->frame_waitq);
 	spin_lock_init(&go->spinlock);
 	go->status = STATUS_INIT;
-	memset(&go->i2c_adapter, 0, sizeof(go->i2c_adapter));
-	go->i2c_adapter_online = 0;
-	go->interrupt_available = 0;
 	init_waitqueue_head(&go->interrupt_waitq);
-	go->input = 0;
 	go7007_update_board(go);
-	go->encoder_h_halve = 0;
-	go->encoder_v_halve = 0;
-	go->encoder_subsample = 0;
 	go->format = V4L2_PIX_FMT_MJPEG;
 	go->bitrate = 1500000;
 	go->fps_scale = 1;
-	go->pali = 0;
 	go->aspect_ratio = GO7007_RATIO_1_1;
-	go->gop_size = 0;
-	go->ipb = 0;
-	go->closed_gop = 0;
-	go->repeat_seqhead = 0;
-	go->seq_header_enable = 0;
-	go->gop_header_enable = 0;
-	go->dvd_mode = 0;
-	go->interlace_coding = 0;
-	for (i = 0; i < 4; ++i)
-		go->modet[i].enable = 0;
-	for (i = 0; i < 1624; ++i)
-		go->modet_map[i] = 0;
-	go->audio_deliver = NULL;
-	go->audio_enabled = 0;
 
 	return go;
 }
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
