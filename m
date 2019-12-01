Return-Path: <SRS0=yDVd=ZX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23023C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:23:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBA8820725
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:23:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dv3AiXyj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBA8820725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C6BC48579E;
	Sun,  1 Dec 2019 16:23:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2CT6i57pxLMt; Sun,  1 Dec 2019 16:23:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6547385775;
	Sun,  1 Dec 2019 16:23:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6284EC1DDC;
	Sun,  1 Dec 2019 16:23:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6611CC087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6046C204B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CwX2ROR7rAFs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 47B8F203E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:48 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id q28so11214881qkn.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Dec 2019 08:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=px5mGVSkvshDLcx6vUKr4u5NGx6h5wRvenyALNaHoq8=;
 b=dv3AiXyjBZOfDb5hL0Bs07CIE7as6PtU4Udo4wFLWcTnptGe01yYao2NT+HwO3uT6B
 Gwfxm0rjzE0iu9SEs8wmHU1Kzaqs1lw/m9f+if35dIXCUzIlCG73IKXIrKMwHN3goE5S
 AvvhkPU/QEKjMd4fLfYRKMN4eMUCffEq3Gb6Zr3HegNUla6ZVRM+TwB30n477/g4PFMR
 SwhKPIhhgHk4tzVYmSO1rk9Td1r9E0BL+XvAg+vLMWA0myWvgSDVrA7aBwziT2edRM6o
 TBol1B9u5P4Y1CYZSj7rS0lvwCCLnWJBhe/bcCmvYYWL7m8YQa4T5h8I4MIZubxwJ+Xv
 U1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=px5mGVSkvshDLcx6vUKr4u5NGx6h5wRvenyALNaHoq8=;
 b=qzVxFcT4i4KDXViYh+2hSn16CrI2gTK3WM03cf0XQXkMEjnPr4QljM1sYcedD9y2C/
 k3jgaKhP2n7ROosBbR6GOQlhyV/1trYtrhpFEJSnC/k7w8O4zrMtnomRx7S8nKgmPzwj
 yQG5yIpBHZ+zmKRqyms8goXZLFMOKm/bukOYpPw/UESQpBUCa+M96J4E9fVACO2XNIad
 PpI9otEt27R6XCHIV2WCwy13J2jJir0kmfQ60fD7MVCYl6fGrL9d1gszmL9gwPWjybhf
 eigtBVT3HnUmmOVlh1E8omAMbwuVboSJp+pQIrqdqOd1Z1/3hPFC+LsYd2b8r3q2ILaE
 EIQQ==
X-Gm-Message-State: APjAAAU6H8EwjqTw+dzxAVg9A4pMrZO7EUNdahfRID43rDxze7iy3Ew1
 YBQSZ/isk3iZVYrPTILeF/8=
X-Google-Smtp-Source: APXvYqwB12RAlEqU8XxPNqL2hJc/ukSHUGY4zndLxZ4diNZyUL0abcl4ObAp7mDpeTLRn4j4qOXxFg==
X-Received: by 2002:a37:a58e:: with SMTP id
 o136mr20538199qke.300.1575217427151; 
 Sun, 01 Dec 2019 08:23:47 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id y10sm5171195qky.6.2019.12.01.08.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2019 08:23:46 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
 kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Sun,  1 Dec 2019 13:15:38 -0300
Message-Id: <20191201161542.69535-3-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201161542.69535-1-dwlsalmeida@gmail.com>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH 2/6] media: dvb_dummy_fe: Add error
	messages in case of attach failure
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

Complain if the attach functions fail, for any reason. This is helpful
when debugging.

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 909dac2345c4..987c3488fe6c 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -114,12 +114,16 @@ struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
 	if (!state)
-		return NULL;
+		goto err;
 
 	/* create dvb_frontend */
 	memcpy(&state->frontend.ops, &dvb_dummy_fe_ofdm_ops, sizeof(struct dvb_frontend_ops));
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
+
+err:
+	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
+	return NULL;
 }
 EXPORT_SYMBOL(dvb_dummy_fe_ofdm_attach);
 
@@ -132,12 +136,16 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
 	if (!state)
-		return NULL;
+		goto err;
 
 	/* create dvb_frontend */
 	memcpy(&state->frontend.ops, &dvb_dummy_fe_qpsk_ops, sizeof(struct dvb_frontend_ops));
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
+
+err:
+	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
+	return NULL;
 }
 EXPORT_SYMBOL(dvb_dummy_fe_qpsk_attach);
 
@@ -150,12 +158,16 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
 	if (!state)
-		return NULL;
+		goto err;
 
 	/* create dvb_frontend */
 	memcpy(&state->frontend.ops, &dvb_dummy_fe_qam_ops, sizeof(struct dvb_frontend_ops));
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
+
+err:
+	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
+	return NULL;
 }
 EXPORT_SYMBOL(dvb_dummy_fe_qam_attach);
 
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
