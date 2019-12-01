Return-Path: <SRS0=yDVd=ZX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9599C432C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:24:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD1882082E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:24:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vNJDZz8X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD1882082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8D28F87B25;
	Sun,  1 Dec 2019 16:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GLR2SeFVqmPd; Sun,  1 Dec 2019 16:23:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B70AF87B45;
	Sun,  1 Dec 2019 16:23:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6B6EC1DDC;
	Sun,  1 Dec 2019 16:23:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C50ABC087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C1B528686A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TmVN27rmjj2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0588286501
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:56 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id e187so30200080qkf.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Dec 2019 08:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mqweMa9Bqk/FYspWjif3MeC3E0h6tyWrHPvZlY2xTv8=;
 b=vNJDZz8XTL6bDdAW6XcIHUN3zsZpgrf+Qff1Sjy39xoXunxGyuXxCVJ5Y3FvVUR4+T
 tLuoX4WYZX6s94uX22gATiYiS/ymhgENEYbcrgu+2OCIOkzqdcVih6YsjAtQadvDhd4g
 rt+oo9YGU4sfTT3bnFWxfuwIGh/d+Y3HORGi5qbrPWjClY3MUvsyu6UwJ+pf4/URnUBO
 RRb7JlsIK5tOwah+BsvR4NoNGgrxug74PUNFVIesUS5GcADWvLsO99kQmfMEGxXZG9Jc
 YcortGIa8yBH4Yvw2c7V2kHpal1gbyD5pmb0hQ+2dS4vREyU2t+MwjmTGhi8aCT5WF+h
 6HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mqweMa9Bqk/FYspWjif3MeC3E0h6tyWrHPvZlY2xTv8=;
 b=nt7JTa8ccwtn5b7dNF6l1sf+hEvaje8H7JZoAwRicLqtZlZNIXvxHvT7eIYFl6kNCh
 mXhIRQiN3mDswRjHFPVxadftu29Fy4+8qBBqkmmqX4e1sKtaYoMhFkEiInTO6RGcY1zM
 r+6l934EPZ9E3Q6c1sWn4i4bLDx9UMY0RkUEsN0+9dpY4x+KBb+XbH2vKjycVzs07m/Q
 m+PjLSNL+0s4qXgLevy2w8Liq2bUeAH5IPFkAZHj6mDL47WYPTeylOrEK3+q3FwJSLk8
 nD/Ni05lxnfAn2rnchY9Ut0J6AYcnTm1VsISZzj2J8oAem4ZJ8zuzVLh28QNgXXht7eJ
 cuTA==
X-Gm-Message-State: APjAAAX8fPvmSWKRfLnL9oCrZ76CUgYMPvU6OQPhH3Mi88d9OqO7YhQn
 xXr/rbKX0kQqLwPp1hkSMQI=
X-Google-Smtp-Source: APXvYqyEw4ORc3mQKnUC28POTzugn2rfgbIEZuZF5mhe1m1C3EXP/nnawxivI5ZKuP1hRAOHbtRugQ==
X-Received: by 2002:a05:620a:143b:: with SMTP id
 k27mr10353223qkj.262.1575217434869; 
 Sun, 01 Dec 2019 08:23:54 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id y10sm5171195qky.6.2019.12.01.08.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2019 08:23:54 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
 kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Sun,  1 Dec 2019 13:15:40 -0300
Message-Id: <20191201161542.69535-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201161542.69535-1-dwlsalmeida@gmail.com>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH 4/6] media: dvb_dummy_fe: Fix long
	lines
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
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 61 ++++++++++++++++------
 1 file changed, 44 insertions(+), 17 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 209e7ac0de33..67a6ed307c1f 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -37,7 +37,8 @@ static int dvb_dummy_fe_read_ber(struct dvb_frontend *fe, u32 *ber)
 	return 0;
 }
 
-static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe, u16 *strength)
+static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe,
+					     u16 *strength)
 {
 	*strength = 0;
 	return 0;
@@ -117,7 +118,10 @@ struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
 		goto err;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &dvb_dummy_fe_ofdm_ops, sizeof(struct dvb_frontend_ops));
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_ofdm_ops,
+	       sizeof(struct dvb_frontend_ops));
+
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 
@@ -139,7 +143,10 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
 		goto err;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &dvb_dummy_fe_qpsk_ops, sizeof(struct dvb_frontend_ops));
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_qpsk_ops,
+	       sizeof(struct dvb_frontend_ops));
+
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 
@@ -161,7 +168,10 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
 		goto err;
 
 	/* create dvb_frontend */
-	memcpy(&state->frontend.ops, &dvb_dummy_fe_qam_ops, sizeof(struct dvb_frontend_ops));
+	memcpy(&state->frontend.ops,
+	       &dvb_dummy_fe_qam_ops,
+	       sizeof(struct dvb_frontend_ops));
+
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 
@@ -178,13 +188,21 @@ static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
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
@@ -209,11 +227,16 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops = {
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
@@ -242,8 +265,12 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops = {
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
 
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
