Return-Path: <SRS0=D7LL=ZE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB41C17441
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 12:58:01 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70D3F2084F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 12:58:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="olrYlMOf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70D3F2084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 43124128D;
	Tue, 12 Nov 2019 12:58:01 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D6BBD1277
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 12:57:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 42B578B3
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 12:57:59 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id y18so6306302qve.2
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 04:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NjWk4TEYN8vBI+EZudhtgsQBzRXhxKSR/VvC8eztl2Q=;
	b=olrYlMOfGyc8ZLOn40CL3KqyOmUV5bZadSmnuHPqjQFMImWWYKDgqbTdEr5PxK/MqC
	+0rwCrarnoYYmYxEDZV/6IFf5rD7m5/R8hvdGIAlHlFoTr0KQfnY67oty8TtVjdZUgFl
	uERzayd/tyCjT9fWkXf1HI1j/b018Vse3bEL/QQL/2CmlJAEzPETM24ZzrcQrC3603Ta
	T2A+w8lFrlR8STUrgnVLoMvoU420KIWlGfhnCBAkkIlWkimnXoJlAz6UTUNYiCp8tY76
	TuRpRQCwyJFgzsqIYgWt5jHwpI6T2bXUh4i3i4AvLqWDLiiJTlxGblWGcQq8oxZ9HD41
	MV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NjWk4TEYN8vBI+EZudhtgsQBzRXhxKSR/VvC8eztl2Q=;
	b=Ldchr5bkiXbLmyllLpBVBcozyUvcIdIUy+VOcXWZikjR6/xog5GrL5hR6a7DQyEnfD
	nk/PcbKwCHrEZwfqhojcmJzK834i1rWGkeL4uOafvu6vLaBoEb7/xj7yYWRSgGSFDotv
	lnD312i9gAxJIhPOYakZ2YB5vQ+N0aRdig+dzyiTbwAfOyaTxnq2wiveNvYwoa05zswX
	Se3VMnZBIm+LpQ0LW0gUQNT45cyai0VncGzff9EijKU6DhH0nQJQVWywawERY8DcjGY3
	YXpamhY6ANG0t0fUVy3fzbW0r6e5kggWIyiPNp0VJKtLadZ8c4R7L54JB5ISArf/IVVH
	f3bQ==
X-Gm-Message-State: APjAAAWUueZkXrVeuxkeyhkIwanvargqDsVwklLrlhpEqDmCYht4ZHMD
	C/SVvis452v7zkpNRra+wk4=
X-Google-Smtp-Source: APXvYqzO55gCJ/uVMy0KkNfkBLsXnKAsyVWjq7p7P4ENoa5s6jvlMQs8jfmzBt5uc6UVFCv/QU24Qg==
X-Received: by 2002:ad4:50c6:: with SMTP id e6mr1963882qvq.220.1573563478120; 
	Tue, 12 Nov 2019 04:57:58 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
	by smtp.gmail.com with ESMTPSA id
	q17sm12081804qtq.58.2019.11.12.04.57.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 04:57:57 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
	kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Tue, 12 Nov 2019 09:50:14 -0300
Message-Id: <20191112125014.5604-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2] media: dvb_dummy_fe: Fix ERROR:
	POINTER_LOCATION
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

------------------------------------------------------------
Changes in v2:

-Added checkpatch.pl previous output so it's more clear what
is being fixed by this patch.

---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 24 +++++++++++-----------
 drivers/media/dvb-frontends/dvb_dummy_fe.h |  6 +++---
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 4db679cb70ad..8413038aa30b 100644
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
@@ -126,7 +126,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
 
 struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
 {
-	struct dvb_dummy_fe_state* state = NULL;
+	struct dvb_dummy_fe_state *state = NULL;
 
 	/* allocate memory for the internal state */
 	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
@@ -143,7 +143,7 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
 
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
