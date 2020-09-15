Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976A9C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 18:05:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18A52206B2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 18:05:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hav9Nr1Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18A52206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B856D86435;
	Tue, 15 Sep 2020 18:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YScz2FadhGTg; Tue, 15 Sep 2020 18:05:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 42F358574B;
	Tue, 15 Sep 2020 18:05:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AE75C0864;
	Tue, 15 Sep 2020 18:05:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49874C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 18:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2E71D86398
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 18:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gve6NCXsH-49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 18:05:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EEF7D8574B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 18:05:23 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id o16so5188009qkj.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZLmSNoQM7+jjlnQIow8a+BqWm7XXJW35Z9CfcXxfl/4=;
 b=hav9Nr1QbVJ3BlehRb/RqjACjFYrsIPLG1+I2UOClKfAp5+7ngG3IJmvKwICB5lzdq
 WGV93nHyISl5cDRkAVdXhbwRwGpn0BDD6iIE1RISAzntc0zLsJhLKhSGksmHGxQxM0Nq
 a7JAAzV0h50v//u8XuyeHoX0jmJ1pcffrlRm4cyLKojSIGPU8TrMQvCVT+9MIrzCWzdC
 LaqUwVU6TF9DYqE1qTtH1/PMOSPjsMueBhLyxdfL5muRWfGnTfCN9j4Vf+Pd0vcdCBm9
 vikEFqlZLseCYyLftc/+1VK3YrI36DtDcSwHB5DelgZyFAU2ssYsKOIMeff/y6H+0BUV
 q2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZLmSNoQM7+jjlnQIow8a+BqWm7XXJW35Z9CfcXxfl/4=;
 b=dnfwNhaavPVl51M7VLEr/daqb8hSVCJs/2vYNxPJXaR9v7dnlggHiWycC1Sqc/dELa
 f39qIR9twWDC2R/pBljRJUo8MbciIECudjfDd0S0iMkd2OZkjoxQqjFueidPpNHjMKUS
 21RY5GwK2lZm+YoxLuJ7o4lfG+rK5JDtyhi+od98Nk8WzIuJO1tjzfQu/FTzY/uk/Nju
 vhzhdNN3bM4FvG2WlbmWjGuNvyUO4Z/B7lJdR/7W0Rraq099gX2esxoG3WCfqrR8YuuX
 De0s4VxIwIu+3oe/u8H2cJHkN4lrYYBGfUhuGjz49eSOpqeSo16R5UW7juijZVx60MMc
 bo/Q==
X-Gm-Message-State: AOAM5319zOals65REtNiOISls+Wt35MHvJ2o0qOxI6w7v98a5gYqIlux
 YBCqKSYbQAjGdCwUE8vQKik=
X-Google-Smtp-Source: ABdhPJwwaZSFKtq7HxhR0p4tMkY/hLtYbTyG5VeqvlQKvebKtBQ2ObXdgMNFu+CfVTX9eKpx83hzUw==
X-Received: by 2002:a05:620a:2225:: with SMTP id
 n5mr18523930qkh.171.1600193122843; 
 Tue, 15 Sep 2020 11:05:22 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id u66sm18969306qka.136.2020.09.15.11.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 11:05:22 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org
Date: Tue, 15 Sep 2020 15:05:09 -0300
Message-Id: <20200915180509.2661572-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: rdunlap@infradead.org, r.verdejo@samsung.com, linux-kernel@vger.kernel.org,
 nicolas@ndufresne.ca, geert@linux-m68k.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] media: vidtv: fix build on 32bit
	architectures
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

Fix the following error for builds on 32bit architectures:

ERROR: modpost: "__udivdi3"
[drivers/media/test-drivers/vidtv/dvb-vidtv-bridge.ko] undefined!

Which is due to 64bit divisions that did not go through the helpers
in linux/math64.h

As vidtv_mux_check_mux_rate was not operational in its current form,
drop the entire function  while it is not fixed properly.

For now, call vidtv_mux_pad_with_nulls with a constant number of packets
to avoid warnings due to unused functions when building this driver.

Fixes: f90cf6079bf67988 ("media: vidtv: add a bridge driver")
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c  | 34 +------------------
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  4 +--
 2 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 5d1a275d504b..6e402a880fdc 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -336,38 +336,6 @@ static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux *m, u32 npkts)
 	return nbytes;
 }
 
-static u32 vidtv_mux_check_mux_rate(struct vidtv_mux *m)
-{
-	/*
-	 * attempt to maintain a constant mux rate, padding with null packets
-	 * if needed
-	 */
-
-	u32 nbytes = 0;  /* the number of bytes written by this function */
-
-	u64 nbytes_expected; /* the number of bytes we should have written */
-	u64 nbytes_streamed; /* the number of bytes we actually wrote */
-	u32 num_null_pkts; /* number of null packets to bridge the gap */
-
-	u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
-						  m->timing.past_jiffies);
-
-	elapsed_time_msecs = min(elapsed_time_msecs, (u64)VIDTV_MAX_SLEEP_USECS / 1000);
-	nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);
-	nbytes_expected *= elapsed_time_msecs;
-
-	nbytes_streamed = m->mux_buf_offset;
-
-	if (nbytes_streamed < nbytes_expected) {
-		/* can't write half a packet: roundup to a 188 multiple */
-		nbytes_expected  = roundup(nbytes_expected - nbytes_streamed, TS_PACKET_LEN);
-		num_null_pkts    = nbytes_expected / TS_PACKET_LEN;
-		nbytes          += vidtv_mux_pad_with_nulls(m, num_null_pkts);
-	}
-
-	return nbytes;
-}
-
 static void vidtv_mux_clear(struct vidtv_mux *m)
 {
 	/* clear the packets currently in the mux */
@@ -397,7 +365,7 @@ static void vidtv_mux_tick(struct work_struct *work)
 			nbytes += vidtv_mux_push_si(m);
 
 		nbytes += vidtv_mux_poll_encoders(m);
-		nbytes += vidtv_mux_check_mux_rate(m);
+		nbytes += vidtv_mux_pad_with_nulls(m, 256);
 
 		npkts = nbytes / TS_PACKET_LEN;
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index f8049cdf564a..e3290facf57b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -285,12 +285,12 @@ static void vidtv_s302m_compute_pts(struct vidtv_encoder *e)
 {
 	u64 count = e->sample_count;
 	struct vidtv_access_unit *au = e->access_units;
+	u32 duration = CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
 
 	while (au) {
 		count += au->num_samples;
 
-		au->pts = count *
-			  CLOCK_UNIT_90KHZ / e->sampling_rate_hz;
+		au->pts = count * duration;
 
 		au = au->next;
 	}
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
