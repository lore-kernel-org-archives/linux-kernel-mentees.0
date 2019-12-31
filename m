Return-Path: <SRS0=22Qo=2V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09F4C2D0C2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 19:11:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 787DF206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 19:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ttYTtR/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 787DF206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5737F2042C;
	Tue, 31 Dec 2019 19:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDCJfjZS2pHf; Tue, 31 Dec 2019 19:11:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0CE3C20360;
	Tue, 31 Dec 2019 19:11:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 015A1C1D81;
	Tue, 31 Dec 2019 19:11:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AD3BC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 67B9B84DDD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tBmQFaYAG8Mi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:11:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5A6FA838B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 19:11:41 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id r11so19873695pgf.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 11:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G9QI4PrbeWqroS6tAxBy0bK45gx6KDWGGHt4P5wamwM=;
 b=ttYTtR/iOEbRlwhR9N4JDNACG8n0csT8FfkuRfy+t66SHKNSbkiCppcgah9SnHctuJ
 khumpLXfONuAySvfnjYr36lRYZXaq4iqzzD+HBSjCLsOYtMJLEVEkO1V3c5qBVKDBT1z
 vPi5H031qhxh/gZo+pJzd15ftbxwCfZcB7DZWbAfuAHZodptgsAc0Pmh+Qo7ioVAvaND
 AlzSxrIU0WmiiXKLFBwcOtI8GAr1bpscWqNmmN0xIcRHMJbiCP5UaR2/l/VjlW4j+PyY
 jlLnHmcsqVxQlhGPO8NXlcjrvZGWNRQLt+hQ599gBKrt/zavxK7eob38bJbjmZKCKGpd
 hAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G9QI4PrbeWqroS6tAxBy0bK45gx6KDWGGHt4P5wamwM=;
 b=T8pZd0D2ftKe/tGnSYFgtzoisaWjS+vDoi86r3ktX9KRr4CDsksvHwAYAgXs8pjLp6
 enT3oHGV6ol4O0bnmJsTGIJFdAcoZnKsssJ/pCpbgOfZkx5JyGb3tBwvy+I5slc7skDG
 ZMVAk1UalJom0LKzL8S4BgwZCttRUKJBP1Ky5ZkWJgiLmLu9XZHl5s0GE+EGV7NFjKN7
 JbNBVD8hcj808urmEdbB8bkwG3FDkBSUKMnBWWLDhgllpsuI0r8JMD+dpQd+aPz1VE98
 hZzCEyIUnw1YzDcLDsDh9naj1/GhCjDny5BNomdfA80r9mLC/hKVVEqexy6SBz6KKBk7
 KZuA==
X-Gm-Message-State: APjAAAUhi413Vr2chEZMgqYSufOibD2RW7eaOrxFqPDysqOn1u9K5MSd
 a+JWJgOWFX8/AD6YTanlzPGDStNEpco=
X-Google-Smtp-Source: APXvYqwN/e3wUCIa2i8bgq3dmzMxgj4T2Z0Fae/ArNBL4psGpGe9ae3rgUKzfwv9zwkRkF+fEs7Y7A==
X-Received: by 2002:a63:f551:: with SMTP id e17mr78374246pgk.162.1577819500891; 
 Tue, 31 Dec 2019 11:11:40 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id s24sm4366134pjp.17.2019.12.31.11.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 11:11:40 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
 kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Tue, 31 Dec 2019 16:11:21 -0300
Message-Id: <d8118a478102be96b7b3f595f789583a25ba5845.1577819245.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577819245.git.dwlsalmeida@gmail.com>
References: <cover.1577819245.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3 2/4] media: dvb_dummy_fe: Fix
	ERROR: POINTER_LOCATION, AVOID_EXTERN and long lines
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

Change foo* bar to foo *bar to avoid ERROR: POINTER_LOCATION in checkpatch.pl

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_read_snr(struct dvb_frontend* fe, u16* snr)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_read_snr(struct dvb_frontend* fe, u16* snr)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend* fe, u32* ucblocks)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend* fe, u32* ucblocks)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)

ERROR: "foo* bar" should be "foo *bar"
+static int dvb_dummy_fe_init(struct dvb_frontend* fe)

ERROR: "foo* bar" should be "foo *bar"
+static void dvb_dummy_fe_release(struct dvb_frontend* fe)

ERROR: "foo* bar" should be "foo *bar"
+	struct dvb_dummy_fe_state* state = fe->demodulator_priv;

ERROR: "foo* bar" should be "foo *bar"
+struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)

ERROR: "foo* bar" should be "foo *bar"
+	struct dvb_dummy_fe_state* state = NULL;

ERROR: "foo* bar" should be "foo *bar"
+	struct dvb_dummy_fe_state* state = NULL;

ERROR: "foo* bar" should be "foo *bar"
+	struct dvb_dummy_fe_state* state = NULL;

remove 'extern' keyword from declaration

Fix CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
by removing it.

Fix long lines

Break long lines into smaller ones to improve readability.

WARNING: line over 80 characters
+	memcpy(&state->frontend.ops, &dvb_dummy_fe_ofdm_ops, sizeof(struct dvb_frontend_ops));

WARNING: line over 80 characters
+	memcpy(&state->frontend.ops, &dvb_dummy_fe_qpsk_ops, sizeof(struct dvb_frontend_ops));
WARNING: line over 80 characters
+	memcpy(&state->frontend.ops, &dvb_dummy_fe_qam_ops, sizeof(struct dvb_frontend_ops));

WARNING: line over 80 characters
+				FE_CAN_FEC_4_5 | FE_CAN_FEC_5_6 | FE_CAN_FEC_6_7 |

WARNING: line over 80 characters
+				FE_CAN_FEC_7_8 | FE_CAN_FEC_8_9 | FE_CAN_FEC_AUTO |

WARNING: line over 80 characters
+				FE_CAN_QAM_16 | FE_CAN_QAM_64 | FE_CAN_QAM_AUTO |

WARNING: line over 80 characters
+		.symbol_rate_min	= (57840000 / 2) / 6

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 83 ++++++++++++++--------
 drivers/media/dvb-frontends/dvb_dummy_fe.h |  6 +-
 2 files changed, 58 insertions(+), 31 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 909dac2345c4..e7f51d581d63 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -31,25 +31,26 @@ static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
 	return 0;
 }
 
-static int dvb_dummy_fe_read_ber(struct dvb_frontend* fe, u32* ber)
+static int dvb_dummy_fe_read_ber(struct dvb_frontend *fe, u32 *ber)
 {
 	*ber = 0;
 	return 0;
 }
 
-static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)
+static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe,
+					     u16 *strength)
 {
 	*strength = 0;
 	return 0;
 }
 
-static int dvb_dummy_fe_read_snr(struct dvb_frontend* fe, u16* snr)
+static int dvb_dummy_fe_read_snr(struct dvb_frontend *fe, u16 *snr)
 {
 	*snr = 0;
 	return 0;
 }
 
-static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend* fe, u32* ucblocks)
+static int dvb_dummy_fe_read_ucblocks(struct dvb_frontend *fe, u32 *ucblocks)
 {
 	*ucblocks = 0;
 	return 0;
@@ -77,12 +78,12 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
 	return 0;
 }
 
-static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
+static int dvb_dummy_fe_sleep(struct dvb_frontend *fe)
 {
 	return 0;
 }
 
-static int dvb_dummy_fe_init(struct dvb_frontend* fe)
+static int dvb_dummy_fe_init(struct dvb_frontend *fe)
 {
 	return 0;
 }
@@ -99,17 +100,17 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
 	return 0;
 }
 
-static void dvb_dummy_fe_release(struct dvb_frontend* fe)
+static void dvb_dummy_fe_release(struct dvb_frontend *fe)
 {
-	struct dvb_dummy_fe_state* state = fe->demodulator_priv;
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
 	kfree(state);
 }
 
 static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops;
 
-struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
+struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
 {
-	struct dvb_dummy_fe_state* state = NULL;
+	struct dvb_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
@@ -117,7 +118,10 @@ struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
 		return NULL;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &dvb_dummy_fe_ofdm_ops, sizeof(struct dvb_frontend_ops));
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_ofdm_ops,
+	       sizeof(struct dvb_frontend_ops));
+
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
@@ -127,7 +131,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
 
 struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
 {
-	struct dvb_dummy_fe_state* state = NULL;
+	struct dvb_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
@@ -135,7 +139,10 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
 		return NULL;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &dvb_dummy_fe_qpsk_ops, sizeof(struct dvb_frontend_ops));
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_qpsk_ops,
+	       sizeof(struct dvb_frontend_ops));
+
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
@@ -145,7 +152,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
 
 struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
 {
-	struct dvb_dummy_fe_state* state = NULL;
+	struct dvb_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
@@ -153,7 +160,10 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
 		return NULL;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &dvb_dummy_fe_qam_ops, sizeof(struct dvb_frontend_ops));
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_qam_ops,
+	       sizeof(struct dvb_frontend_ops));
+
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
@@ -166,13 +176,21 @@ static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
 		.frequency_min_hz	= 0,
 		.frequency_max_hz	= 863250 * kHz,
 		.frequency_stepsize_hz	= 62500,
-		.caps = FE_CAN_FEC_1_2 | FE_CAN_FEC_2_3 | FE_CAN_FEC_3_4 |
-				FE_CAN_FEC_4_5 | FE_CAN_FEC_5_6 | FE_CAN_FEC_6_7 |
-				FE_CAN_FEC_7_8 | FE_CAN_FEC_8_9 | FE_CAN_FEC_AUTO |
-				FE_CAN_QAM_16 | FE_CAN_QAM_64 | FE_CAN_QAM_AUTO |
-				FE_CAN_TRANSMISSION_MODE_AUTO |
-				FE_CAN_GUARD_INTERVAL_AUTO |
-				FE_CAN_HIERARCHY_AUTO,
+		.caps = FE_CAN_FEC_1_2 |
+			FE_CAN_FEC_2_3 |
+			FE_CAN_FEC_3_4 |
+			FE_CAN_FEC_4_5 |
+			FE_CAN_FEC_5_6 |
+			FE_CAN_FEC_6_7 |
+			FE_CAN_FEC_7_8 |
+			FE_CAN_FEC_8_9 |
+			FE_CAN_FEC_AUTO |
+			FE_CAN_QAM_16 |
+			FE_CAN_QAM_64 |
+			FE_CAN_QAM_AUTO |
+			FE_CAN_TRANSMISSION_MODE_AUTO |
+			FE_CAN_GUARD_INTERVAL_AUTO |
+			FE_CAN_HIERARCHY_AUTO,
 	},
 
 	.release = dvb_dummy_fe_release,
@@ -197,11 +215,16 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops = {
 		.frequency_min_hz	=  51 * MHz,
 		.frequency_max_hz	= 858 * MHz,
 		.frequency_stepsize_hz	= 62500,
-		.symbol_rate_min	= (57840000 / 2) / 64,  /* SACLK/64 == (XIN/2)/64 */
+		/* symbol_rate_min: SACLK/64 == (XIN/2)/64 */
+		.symbol_rate_min	= (57840000 / 2) / 64,
 		.symbol_rate_max	= (57840000 / 2) / 4,   /* SACLK/4 */
-		.caps = FE_CAN_QAM_16 | FE_CAN_QAM_32 | FE_CAN_QAM_64 |
-			FE_CAN_QAM_128 | FE_CAN_QAM_256 |
-			FE_CAN_FEC_AUTO | FE_CAN_INVERSION_AUTO
+		.caps = FE_CAN_QAM_16 |
+			FE_CAN_QAM_32 |
+			FE_CAN_QAM_64 |
+			FE_CAN_QAM_128 |
+			FE_CAN_QAM_256 |
+			FE_CAN_FEC_AUTO |
+			FE_CAN_INVERSION_AUTO
 	},
 
 	.release = dvb_dummy_fe_release,
@@ -230,8 +253,12 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops = {
 		.symbol_rate_min	= 1000000,
 		.symbol_rate_max	= 45000000,
 		.caps = FE_CAN_INVERSION_AUTO |
-			FE_CAN_FEC_1_2 | FE_CAN_FEC_2_3 | FE_CAN_FEC_3_4 |
-			FE_CAN_FEC_5_6 | FE_CAN_FEC_7_8 | FE_CAN_FEC_AUTO |
+			FE_CAN_FEC_1_2 |
+			FE_CAN_FEC_2_3 |
+			FE_CAN_FEC_3_4 |
+			FE_CAN_FEC_5_6 |
+			FE_CAN_FEC_7_8 |
+			FE_CAN_FEC_AUTO |
 			FE_CAN_QPSK
 	},
 
diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.h b/drivers/media/dvb-frontends/dvb_dummy_fe.h
index 526fabd7751f..1c82338e0c8a 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.h
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.h
@@ -12,9 +12,9 @@
 #include <media/dvb_frontend.h>
 
 #if IS_REACHABLE(CONFIG_DVB_DUMMY_FE)
-extern struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void);
-extern struct dvb_frontend* dvb_dummy_fe_qpsk_attach(void);
-extern struct dvb_frontend* dvb_dummy_fe_qam_attach(void);
+struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);
+struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);
+struct dvb_frontend *dvb_dummy_fe_qam_attach(void);
 #else
 static inline struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
 {
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
