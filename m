Return-Path: <SRS0=nM8m=Y7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1169AFC6197
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 01:45:19 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D47972187F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 01:45:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtTKLwu4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D47972187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B1D6CB79;
	Thu,  7 Nov 2019 01:45:18 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6622FAE0
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 01:45:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E9C48189
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 01:45:16 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id t20so595573qtn.9
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 06 Nov 2019 17:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sT9JhCsm7ji7ANGvO8aOX9ZWgfUj6JLCR9TWfO6QprI=;
	b=XtTKLwu4bHiLHqcm4xyDss30UijRbtv8JirrGKJsiZ0bsGk2pvsaYtKCXSLBThlpA1
	NwwxGXNUzfBsGkU45VjO1qj7DEhh/0FjRE/PdjdZEBYBAelAyBosPAtv9K7dG9aubMdi
	YqKQixTNl3OIU1VdUS3wKEuSKM3QWXnh1PMOdPkoQXbsdFQbpVZ+ZvZmyelRttDweQIV
	Pfh3vth7QDS5Z1xgPvvrAikxhVOqkhThI0wF4WAugEmY794C+MxknPKc5uKSEMsgyjQW
	zWH66Gse0C23wp+aOrVwr2vuyahnEehEtZcwnHwWWSn/9SHOs85WV9/sa/qY+sV37iup
	Tsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sT9JhCsm7ji7ANGvO8aOX9ZWgfUj6JLCR9TWfO6QprI=;
	b=KkOMzCuUH9nfx0/f+X5A9w8fAaYjQVYjYc/XI5wwalkmmDIRMP8vFjuP+/keMdrvcN
	luGO4wLTyGLHWocz4gmfHg/S46m3QnCEtNigl1+VJ9RYywsmJfqP8r9cfMl3h+VJJ4Av
	qLkyQxOdYIi8sML45WKBH3RDWG5gJ27EHerMK8YZIUazz7SBxHvyAySxiTdVkYeVCgZo
	okhQF98jFcJTmxxlo2uwJFPDdokBrccdo12jUUgyGGRlM7aRub+bm+UwnV2AHUwDMmlT
	PtXA/X13r2BP+Ym97Rdc5rR1yRU4Ep6fI4bqETufJG0qeoKwPCS/JIfAX3AVM2vomh1u
	FD8A==
X-Gm-Message-State: APjAAAUcAaN677hjiD4kT0FAh3wxRD6CRmHqqK8bh6h52VHn0P/4ji08
	7EciwI9xJ852nM6KWgOKqqo=
X-Google-Smtp-Source: APXvYqyUk/PO1CBION0aoWcHxLD0lwe3UjcGIiPjoWQdyHpIYi35jCEX+J4uoUa92p3JqbLbqyZoVQ==
X-Received: by 2002:ac8:344a:: with SMTP id v10mr1198317qtb.323.1573091116010; 
	Wed, 06 Nov 2019 17:45:16 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
	by smtp.gmail.com with ESMTPSA id w24sm579224qta.44.2019.11.06.17.45.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Nov 2019 17:45:15 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
	kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Wed,  6 Nov 2019 22:37:45 -0300
Message-Id: <20191107013745.22147-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] media: dvb_dummy_fe: Add error
	messages in case of attach failure
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Complain if the attach functions fail, for any reason. This is helpful
when debugging.

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 4db679cb70ad..ca86857c3667 100644
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
 
 static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
@@ -131,12 +135,16 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
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
 
 static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
@@ -148,12 +156,16 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
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
 
 static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
