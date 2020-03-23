Return-Path: <SRS0=FCUG=5I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BBCC3F2CD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Mar 2020 12:58:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B86A020719
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Mar 2020 12:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIsd8vMg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B86A020719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 934EF22B20;
	Mon, 23 Mar 2020 12:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hWgL1dNZA6jE; Mon, 23 Mar 2020 12:58:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 28D96229D4;
	Mon, 23 Mar 2020 12:58:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18956C089F;
	Mon, 23 Mar 2020 12:58:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 617DCC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Mar 2020 12:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 48E9A228DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Mar 2020 12:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LsHsnMW4JAXn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Mar 2020 12:58:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by silver.osuosl.org (Postfix) with ESMTPS id BD311229D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Mar 2020 12:58:31 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id i6so5950600qke.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Mar 2020 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GfZH3nIwWj00Sd7ZVGok9RvoBpDTdg7XTsl3mgCATU8=;
 b=GIsd8vMgiGh9ul5qBSmsYcO1qHjH8FI/dfwpZFuol7mkXM7+swQvJNPELatzMPbj09
 J9s/2dPeEr1C2tckjZiipoG9pHcR7YlFExcodB+RnxwcvJyDuUI7b5S1exWyZfO0uqoX
 f3OqWcUqsAHCaEaFTdVbdOTN4MT1Oqdu6vOyJuK+oJiD4u7K+3mJsyswFpTX04oDpGK9
 k633wmqK5d0lhIcQ41HjD7PnSR5VCuGDMqeud3gufcbg9ltZvpy4wULqUVGZMt+ydrSr
 bHRftnPSizAjPJSJyq/dcnUZX2bNHZtGn9tpRGehSfpbHLOWrdYflVBdgB8lSJWiymEg
 I4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GfZH3nIwWj00Sd7ZVGok9RvoBpDTdg7XTsl3mgCATU8=;
 b=iqiowgutMlOz1E604aOfl91DDAAZA6KzNnSe3klb7TMFBbOSa5bKX4a3s7VwaQjmUj
 kkeddUBzgvJ9lsbG1V2GGYk38cTeoUpNMHCywSwtSDggqFiMr42JX3JBIX4iopSKdNxX
 bsyMB2K1x3b7ymTPLcdwtWuioX5uAj6UCQUL7lXNoWvyyZIFh6i3f9gwKzqrkGvpL0zb
 NTImrjqXAbdCsiTIxgORg4AqSi9x08Cr+c3YCWp9l9JlJP/FExzXBaINDhWiZpGEMm7r
 T7GHAT6ADMaaCMs03W6YMXCdK6mOxOstLhFvIBGQQzfVR0Ht23jvjAQUx+dzrOpC5h/6
 Ms+A==
X-Gm-Message-State: ANhLgQ0hHbsU6s6ioVcfAocJbeCOpIjcN5JtMof5vqIYI9ooT15LwjFg
 c2xPK21vxsqDa1cOsN5jL+M=
X-Google-Smtp-Source: ADFU+vtphizTS1p42txZo1XuKxTJF3REykx8FdlFRfFz++jrskATYLvB/a/UNvDwZwI9vgIsCfIXQw==
X-Received: by 2002:a37:5044:: with SMTP id e65mr19584907qkb.294.1584968310706; 
 Mon, 23 Mar 2020 05:58:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id 16sm11075800qkk.79.2020.03.23.05.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 05:58:30 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Mon, 23 Mar 2020 09:57:31 -0300
Message-Id: <20200323125732.281976-3-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200323125732.281976-1-dwlsalmeida@gmail.com>
References: <20200323125732.281976-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v2 2/3] media: dvb_dummy_fe.c: lose TS lock on bad snr
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Periodically check the signal quality and eventually lose the lock if
the quality is sub-par. A fake tuner can return a bad quality signal to
the demod if the frequency is too far off from a valid frequency.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 160 ++++++++++++++++++++-
 1 file changed, 155 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 9ff1ebaa5e04..14446f2bdcde 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -9,24 +9,166 @@
 #include <linux/init.h>
 #include <linux/string.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
+#include <linux/random.h>
 
 #include <media/dvb_frontend.h>
 #include "dvb_dummy_fe.h"
 
 
+struct dvb_dummy_fe_cnr_to_qual_s {
+	/* attempt to use the same values as libdvbv5 */
+	u32 modulation;
+	u32 fec;
+	u32 cnr_ok, cnr_good;
+};
+
+struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_c_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QAM_256, FEC_NONE,  34000, 38000},
+	{ QAM_64,  FEC_NONE,  30000, 34000},
+};
+
+struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_s_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QPSK, FEC_1_2,  7000, 10000},
+	{ QPSK, FEC_2_3,  9000, 12000},
+	{ QPSK, FEC_3_4, 10000, 13000},
+	{ QPSK, FEC_5_6, 11000, 14000},
+	{ QPSK, FEC_7_8, 12000, 15000},
+};
+
+struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_s2_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db */
+	{ QPSK,  FEC_1_2,   9000,  12000},
+	{ QPSK,  FEC_2_3,  11000,  14000},
+	{ QPSK,  FEC_3_4,  12000,  15000},
+	{ QPSK,  FEC_5_6,  12000,  15000},
+	{ QPSK,  FEC_8_9,  13000,  16000},
+	{ QPSK,  FEC_9_10, 13500, 16500},
+	{ PSK_8, FEC_2_3,  14500, 17500},
+	{ PSK_8, FEC_3_4,  16000,  19000},
+	{ PSK_8, FEC_5_6,  17500, 20500},
+	{ PSK_8, FEC_8_9,  19000,  22000},
+};
+
+static struct dvb_dummy_fe_cnr_to_qual_s dvb_dummy_fe_t_cnr_2_qual[] = {
+	/* from libdvbv5 source code, in milli db*/
+	{   QPSK, FEC_1_2,  4100,  5900},
+	{   QPSK, FEC_2_3,  6100,  9600},
+	{   QPSK, FEC_3_4,  7200, 12400},
+	{   QPSK, FEC_5_6,  8500, 15600},
+	{   QPSK, FEC_7_8,  9200, 17500},
+
+	{ QAM_16, FEC_1_2,  9800, 11800},
+	{ QAM_16, FEC_2_3, 12100, 15300},
+	{ QAM_16, FEC_3_4, 13400, 18100},
+	{ QAM_16, FEC_5_6, 14800, 21300},
+	{ QAM_16, FEC_7_8, 15700, 23600},
+
+	{ QAM_64, FEC_1_2, 14000, 16000},
+	{ QAM_64, FEC_2_3, 19900, 25400},
+	{ QAM_64, FEC_3_4, 24900, 27900},
+	{ QAM_64, FEC_5_6, 21300, 23300},
+	{ QAM_64, FEC_7_8, 22000, 24000},
+};
+
+struct dvb_dummy_fe_config {
+	/* probability of losing the lock due to low snr */
+	u8 drop_tslock_prob_on_low_snr;
+	u8 recover_tslock_prob_on_good_snr;
+};
+
 struct dvb_dummy_fe_state {
 	struct dvb_frontend frontend;
+	struct dvb_dummy_fe_config config;
+	struct delayed_work poll_snr;
+	enum fe_status status;
 };
 
+static void poll_snr_handler(struct work_struct *work)
+{
+	/*
+	 * periodically check the signal quality and eventually
+	 * lose the TS lock if it dips too low
+	 */
+	struct dvb_dummy_fe_state *state;
+	struct dtv_frontend_properties *c;
+	struct dvb_dummy_fe_cnr_to_qual_s *cnr2qual = NULL;
+	struct dvb_dummy_fe_config *config;
+	u32 array_size = 0;
+	u16 snr = 0;
+	u32 i;
+
+	state = container_of(work, struct dvb_dummy_fe_state, poll_snr.work);
+	c = &state->frontend.dtv_property_cache;
+	config = &state->config;
+
+	if (!state->frontend.ops.tuner_ops.get_rf_strength)
+		return;
+
+	state->frontend.ops.tuner_ops.get_rf_strength(&state->frontend, &snr);
+
+	switch (c->delivery_system) {
+	case SYS_DVBT:
+	case SYS_DVBT2:
+		cnr2qual = dvb_dummy_fe_t_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_dummy_fe_t_cnr_2_qual);
+		break;
+
+	case SYS_DVBS:
+		cnr2qual = dvb_dummy_fe_s_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_dummy_fe_s_cnr_2_qual);
+		break;
+
+	case SYS_DVBS2:
+		cnr2qual = dvb_dummy_fe_s2_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_dummy_fe_s2_cnr_2_qual);
+		break;
+
+	case SYS_DVBC_ANNEX_A:
+		cnr2qual = dvb_dummy_fe_c_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_dummy_fe_c_cnr_2_qual);
+		break;
+
+	default:
+		pr_warn("%s: unsupported delivery system: %u\n",
+			__func__,
+			c->delivery_system);
+		break;
+	}
+
+	for (i = 0; i <= array_size; i++) {
+		if (cnr2qual[i].modulation == c->modulation &&
+		    cnr2qual[i].fec == c->fec_inner) {
+			if (snr < cnr2qual[i].cnr_ok) {
+				/* eventually lose the TS lock */
+				if (prandom_u32_max(100) <
+				    config->drop_tslock_prob_on_low_snr)
+					state->status = 0;
+			} else {
+				/* recover if the signal improves */
+				if (prandom_u32_max(100) <
+				    config->recover_tslock_prob_on_good_snr)
+					state->status = FE_HAS_SIGNAL  |
+							FE_HAS_CARRIER |
+							FE_HAS_VITERBI |
+							FE_HAS_SYNC    |
+							FE_HAS_LOCK;
+			}
+		}
+	}
+
+	schedule_delayed_work(&state->poll_snr, msecs_to_jiffies(2000));
+}
 
 static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
 				    enum fe_status *status)
 {
-	*status = FE_HAS_SIGNAL
-		| FE_HAS_CARRIER
-		| FE_HAS_VITERBI
-		| FE_HAS_SYNC
-		| FE_HAS_LOCK;
+
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	*status = state->status;
 
 	return 0;
 }
@@ -80,11 +222,18 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
 
 static int dvb_dummy_fe_sleep(struct dvb_frontend *fe)
 {
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	cancel_delayed_work_sync(&state->poll_snr);
 	return 0;
 }
 
 static int dvb_dummy_fe_init(struct dvb_frontend *fe)
 {
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	INIT_DELAYED_WORK(&state->poll_snr, &poll_snr_handler);
+	schedule_delayed_work(&state->poll_snr, msecs_to_jiffies(2000));
 	return 0;
 }
 
@@ -104,6 +253,7 @@ static void dvb_dummy_fe_release(struct dvb_frontend *fe)
 {
 	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
 
+	cancel_delayed_work_sync(&state->poll_snr);
 	kfree(state);
 }
 
-- 
2.25.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
