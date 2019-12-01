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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B93DC432C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:23:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5256120725
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:23:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6S/xT+H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5256120725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 385618651C;
	Sun,  1 Dec 2019 16:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXJzlP-qdvOF; Sun,  1 Dec 2019 16:23:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B84286501;
	Sun,  1 Dec 2019 16:23:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8AC89C1DDC;
	Sun,  1 Dec 2019 16:23:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CDC0C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3AF4020493
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0D1Rti1-+s5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 223FD203E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:52 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id w47so34510330qtk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Dec 2019 08:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nhZaFdBnqe6R3qJPe92ATUEtEyOTSuOuCSUMZwuBZ3A=;
 b=e6S/xT+H8zmwtiyG7Vr7x5AJz0DPrhlbjelFUkFq9RZ3yldSmwKHKlcNbmJqdfPnWJ
 FoOPwhDU02CsblM9RMyn3BEgBuz84IL3nfL+NcXDsj/RKUzzY6GLfcI7SH/reScpDJ1b
 p9SNbmFLJpm4sib+PZ7vdYNwhKlv+klX2wTZCbEnFqRQz6DGZ6wMne/ecb+S0HG7uL0m
 fcp1VPmrk/PMrffjlpFi3MROqlICE3SUsYgx8qsXvnElWWb5fBeG2KH8fjrgbBjSyhr3
 vXo0tAbTc7QZunGLLw2cKibWNhZ3JVNMse9VyfXtbDsMtc1SACCFzL0S7n5h6WPrUdT5
 zmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nhZaFdBnqe6R3qJPe92ATUEtEyOTSuOuCSUMZwuBZ3A=;
 b=jmlHqfJce4moapPZ0brlPpgjimkzRD0HA6KYBmKoEnp82Hi4blij5x393qj1G11Z6C
 pz4L8z0W/Jb5c4JJ8ruGsiCJo2TBKCAiSedOF6Oqlfcz84c2Qg831DZ4cbWAJaDlHoO/
 S6t5WVdKhh9mam08JoEDYn6s/RQoJGYQIws6hMUkBmhhYqtX/yTR+tR/+Tdh1FQhEWGE
 h4cy8uSTiuiuCyYnGxWaqnm4w2ZMKPCAugJ52RL2KTuu5GXf6FgbEkl4RCOEgUlABjHq
 i7NEixmddTgPl/aO3blCVIsewiPjLiMbQALNoQahldUmrEf8cqVycLE+gcggsdWC3zxg
 WAfQ==
X-Gm-Message-State: APjAAAXjSlqOFPhcUzve7JwnPSNpnWggVSHoBHe/x4qAKUcYX0Vd0T4A
 UnrqVAG3DXZYfiXOJzCZAb8=
X-Google-Smtp-Source: APXvYqwlCS1WdeXCggit3ddtB/7sVmzGkyBarw0qoYJ1khzdADk3wue8cuOPYKkgS/BJsV1kE82GAg==
X-Received: by 2002:ac8:4901:: with SMTP id e1mr51389902qtq.280.1575217431015; 
 Sun, 01 Dec 2019 08:23:51 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id y10sm5171195qky.6.2019.12.01.08.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2019 08:23:50 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
 kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Sun,  1 Dec 2019 13:15:39 -0300
Message-Id: <20191201161542.69535-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201161542.69535-1-dwlsalmeida@gmail.com>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH 3/6] media: dvb_dummy_fe: Fix ERROR:
	POINTER_LOCATION
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

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 24 +++++++++++-----------
 drivers/media/dvb-frontends/dvb_dummy_fe.h |  6 +++---
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 987c3488fe6c..209e7ac0de33 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -31,25 +31,25 @@ static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
 	return 0;
 }
 
-static int dvb_dummy_fe_read_ber(struct dvb_frontend* fe, u32* ber)
+static int dvb_dummy_fe_read_ber(struct dvb_frontend *fe, u32 *ber)
 {
 	*ber = 0;
 	return 0;
 }
 
-static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend* fe, u16* strength)
+static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe, u16 *strength)
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
@@ -77,12 +77,12 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
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
@@ -99,17 +99,17 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
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
@@ -131,7 +131,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
 
 struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
 {
-	struct dvb_dummy_fe_state* state = NULL;
+	struct dvb_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
@@ -153,7 +153,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
 
 struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
 {
-	struct dvb_dummy_fe_state* state = NULL;
+	struct dvb_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.h b/drivers/media/dvb-frontends/dvb_dummy_fe.h
index 526fabd7751f..35efe2ce1a88 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.h
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.h
@@ -12,9 +12,9 @@
 #include <media/dvb_frontend.h>
 
 #if IS_REACHABLE(CONFIG_DVB_DUMMY_FE)
-extern struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void);
-extern struct dvb_frontend* dvb_dummy_fe_qpsk_attach(void);
-extern struct dvb_frontend* dvb_dummy_fe_qam_attach(void);
+extern struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);
+extern struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);
+extern struct dvb_frontend *dvb_dummy_fe_qam_attach(void);
 #else
 static inline struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
 {
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
