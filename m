Return-Path: <SRS0=BMuY=36=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AB5C352A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 15:46:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ADA220733
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 15:46:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqERrv01"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ADA220733
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 55ABA8448B;
	Mon, 10 Feb 2020 15:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NrmMtwy0d0QU; Mon, 10 Feb 2020 15:46:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B472184549;
	Mon, 10 Feb 2020 15:46:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B162EC1796;
	Mon, 10 Feb 2020 15:46:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEEF8C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 15:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DA66187009
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 15:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWyo6c0kQxXm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 15:46:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0D7A486E2C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 15:46:04 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id t13so5461034qto.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 07:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qZzSV/Cejb8UpV/HQ8108YbaF0V/lqCH3FWdetQ8Pow=;
 b=bqERrv018aofLOYbac08392BfAcTQe7clJ9OzDV8jgahYWVeT/NaaOy4J0qiQoFYS8
 hWw56aB3drHyzueud0IF/eHl4IkoW9XF918irUpRxhd1D30SPtzQxR9QK//nu6JnuBTB
 bk7Q+tPz7ZXtddEnVtgut02cdTOrxfQ+7NqJcGgmlRas2y7v5a/iwnj8aimT3OSEHmRr
 vQK8jVUuUqrC3Ama2VrTA5wfu2gZ6SNCze3g80sl5vlvBqZ+kBE/hvn1Ulju1/Yt9nPY
 TzKKecjCD3TkF9Ak+v09esvykMrddDwMSh5Mp+Fx27mRYuOG7w8Gu8iKWvlr98WqgreF
 /PtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qZzSV/Cejb8UpV/HQ8108YbaF0V/lqCH3FWdetQ8Pow=;
 b=a4/G6pFbJZfIidkwegOQfoBMqlKVYPLrCokBjENeEzyARM8+PyXYe36rgFIw2kiBxL
 wf0pToWk5q30S1wRQdhQE4K64StgR50jn/h1D3/SyV9uG1I24buROXam4YVGg2A7C8Ux
 yemQmDA4tCsKc/+PufAZ3AzEVxQkTORzTTdzat4Kk+WPhBOYWNFFQzDZl/e9MqF47Emm
 EUc0QU84XPh9UaSBziONEQNaaN/CSztsU/R+WnrmSwROTH4XHuL1FksT+Et28JBJofHY
 tpYLQ2oMfQN/UEt3VO+rE3zpEztftq8CBUoi04R3gqkEtY1H0IZX36SPZrDvxfhy0sXz
 A7TA==
X-Gm-Message-State: APjAAAXMSBiCCBhMcDMDmc8wVrIlXsFKQpxWX3JrF5clJLssN0E8O9S4
 NyVKHZj96tREYzrdT267FV4=
X-Google-Smtp-Source: APXvYqzPHFzNJtUhodxDnU6Bj7FldHbeHXQeKlnr9o6VdHUlF3LzXjc8bCXUcUrxDmM6665aYZqaNA==
X-Received: by 2002:ac8:33f8:: with SMTP id d53mr10423304qtb.86.1581349562868; 
 Mon, 10 Feb 2020 07:46:02 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id c45sm350510qtd.43.2020.02.10.07.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 07:46:02 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, sean@mess.org, tglx@linutronix.de,
 gregkh@linuxfoundation.org
Date: Mon, 10 Feb 2020 12:45:55 -0300
Message-Id: <20200210154555.156283-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] media: dvb_dummy_fe.c: lose TS lock
	on bad snr
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
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 149 ++++++++++++++++++++-
 1 file changed, 144 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 9ff1ebaa5e04..726c964a523d 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -9,24 +9,155 @@
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
+struct dvb_dummy_fe_cnr_to_qual_s dvb_c_cnr_2_qual[] = {
+	/* from libdvbv5 source code */
+	{ QAM_256, FEC_NONE,  34., 38.},
+	{ QAM_64,  FEC_NONE,  30., 34.},
+};
+
+struct dvb_dummy_fe_cnr_to_qual_s dvb_s_cnr_2_qual[] = {
+	/* from libdvbv5 source code */
+	{ QPSK, FEC_1_2,  7., 10.},
+
+	{ QPSK, FEC_2_3,  9., 12.},
+	{ QPSK, FEC_3_4, 10., 13.},
+	{ QPSK, FEC_5_6, 11., 14.},
+
+	{ QPSK, FEC_7_8, 12., 15.},
+};
+
+struct dvb_dummy_fe_cnr_to_qual_s dvb_s2_cnr_2_qual[] = {
+	/* from libdvbv5 source code */
+	{ QPSK,  FEC_1_2,   9.,  12.},
+	{ QPSK,  FEC_2_3,  11.,  14.},
+	{ QPSK,  FEC_3_4,  12.,  15.},
+	{ QPSK,  FEC_5_6,  12.,  15.},
+	{ QPSK,  FEC_8_9,  13.,  16.},
+	{ QPSK,  FEC_9_10, 13.5, 16.5},
+	{ PSK_8, FEC_2_3,  14.5, 17.5},
+	{ PSK_8, FEC_3_4,  16.,  19.},
+	{ PSK_8, FEC_5_6,  17.5, 20.5},
+	{ PSK_8, FEC_8_9,  19.,  22.},
+};
+
+static struct dvb_dummy_fe_cnr_to_qual_s dvb_t_cnr_2_qual[] = {
+	/* from libdvbv5 source code */
+	{   QPSK, FEC_1_2,  4.1,  5.9},
+	{   QPSK, FEC_2_3,  6.1,  9.6},
+	{   QPSK, FEC_3_4,  7.2, 12.4},
+	{   QPSK, FEC_5_6,  8.5, 15.6},
+	{   QPSK, FEC_7_8,  9.2, 17.5},
+
+	{ QAM_16, FEC_1_2,  9.8, 11.8},
+	{ QAM_16, FEC_2_3, 12.1, 15.3},
+	{ QAM_16, FEC_3_4, 13.4, 18.1},
+	{ QAM_16, FEC_5_6, 14.8, 21.3},
+	{ QAM_16, FEC_7_8, 15.7, 23.6},
+
+	{ QAM_64, FEC_1_2, 14.0, 16.0},
+	{ QAM_64, FEC_2_3, 19.9, 25.4},
+	{ QAM_64, FEC_3_4, 24.9, 27.9},
+	{ QAM_64, FEC_5_6, 21.3, 23.3},
+	{ QAM_64, FEC_7_8, 22.0, 24.0},
+};
+
+struct dvb_dummy_fe_config {
+	/* probability of losing the lock due to low snr */
+	u8 drop_tslock_probability_on_low_snr;
+};
+
 struct dvb_dummy_fe_state {
 	struct dvb_frontend frontend;
+	struct dvb_dummy_fe_config config;
+	struct delayed_work poll_snr;
+	enum fe_status status;
 };
 
+void poll_snr_handler(struct work_struct *work)
+{
+	/* periodically check the signal quality and eventually
+	 * lose the TS lock if it dips too low
+	 */
+	struct dvb_dummy_fe_state *state =
+		container_of(work, struct dvb_dummy_fe_state, poll_snr.work);
+	struct dtv_frontend_properties *c = &state->frontend.dtv_property_cache;
+	struct dvb_dummy_fe_cnr_to_qual_s *cnr2qual = NULL;
+	struct dvb_dummy_fe_config *config = &state->config;
+	u32 array_size = 0;
+	u16 snr = 0;
+	u32 i;
+
+	if (!state->frontend.ops.tuner_ops.get_rf_strength)
+		return;
+
+	state->frontend.ops.tuner_ops.get_rf_strength(&state->frontend, &snr);
+
+	switch (c->delivery_system) {
+	case SYS_DVBT:
+	case SYS_DVBT2:
+		cnr2qual = dvb_t_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_t_cnr_2_qual);
+		break;
+
+	case SYS_DVBS:
+		cnr2qual = dvb_s_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_s_cnr_2_qual);
+		break;
+
+	case SYS_DVBS2:
+		cnr2qual = dvb_s2_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_s2_cnr_2_qual);
+		break;
+
+	case SYS_DVBC_ANNEX_A:
+		cnr2qual = dvb_c_cnr_2_qual;
+		array_size = ARRAY_SIZE(dvb_c_cnr_2_qual);
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
+
+			if (snr < cnr2qual[i].cnr_ok) {
+				/* eventually lose the TS lock */
+				if (prandom_u32_max(100) <
+				    config->drop_tslock_probability_on_low_snr)
+					state->status = 0;
+			}
+		}
+	}
+
+	schedule_delayed_work(&(state->poll_snr), msecs_to_jiffies(2000));
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
@@ -80,11 +211,18 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
 
 static int dvb_dummy_fe_sleep(struct dvb_frontend *fe)
 {
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	cancel_delayed_work_sync(&(state->poll_snr));
 	return 0;
 }
 
 static int dvb_dummy_fe_init(struct dvb_frontend *fe)
 {
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	INIT_DELAYED_WORK(&(state->poll_snr), &poll_snr_handler);
+	schedule_delayed_work(&(state->poll_snr), msecs_to_jiffies(2000));
 	return 0;
 }
 
@@ -104,6 +242,7 @@ static void dvb_dummy_fe_release(struct dvb_frontend *fe)
 {
 	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
 
+	cancel_delayed_work_sync(&(state->poll_snr));
 	kfree(state);
 }
 
-- 
2.25.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
