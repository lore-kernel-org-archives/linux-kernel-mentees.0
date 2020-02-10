Return-Path: <SRS0=BMuY=36=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507C4C352A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 15:41:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E96320715
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Feb 2020 15:41:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pU78M0Eh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E96320715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 16BF084718;
	Mon, 10 Feb 2020 15:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9MvzXyQVmsR7; Mon, 10 Feb 2020 15:41:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 098CF821AE;
	Mon, 10 Feb 2020 15:41:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 006FCC1796;
	Mon, 10 Feb 2020 15:41:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F706C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 15:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7CC7A86DB0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 15:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Usfhwl6vLICw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 15:41:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E233B86D92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 15:41:15 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id c5so5422105qtj.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2020 07:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2FDisvFilGkLNKAU9kZMMkGdDwmPOlju/miCfI8aD0c=;
 b=pU78M0EhG5Vb1ixykOh/u+uc2+oo5wsdbkf8BnMff9NlrjjPcjueiZKoThz6arlm6h
 NcKtF+j+0z/83lGeWBG3raTxov2x3aY8ZNgkFsQZFxE8eEmZlIpnDW0isLvl07qI9l32
 ggH4bFnwIPBz6CN95wNk2hnrIZ274CSKR7WHdgloXqMvV6/Kf9gXPE9f7Je1nPQ664g4
 qU3x2hQKc7my2OzU4Km52p+d4tgOp/gbvkPM0KGEDUvRPldrE1up10iEJRm7eWnBvYL2
 DuokSBFPnJv0PwE0rPe6EnID6ORElHZTISxiw4itw3079Bw3qEEmtEbSap1RUz3cQxij
 2l6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2FDisvFilGkLNKAU9kZMMkGdDwmPOlju/miCfI8aD0c=;
 b=HKLFRV1r1kQZw/DsakTS2aQa7x/D/mlocyrcQeULEjwMwoMGwx1izTeeWLk/6JmjPt
 2zlyUTcwzX2l6sKX8rjsJ+GfdfOuXzhDRThOjVAMAkye3VLpK4kozZuqDPLZiRUMYphm
 kxRfGHax6JsI3qGRiVOQXjau2LDZiZEdw4Sv2Y/JYfa8Ss01lWKXwqtGeSEDU8n/o8jC
 bf2ssX4bZNqzLWJPZrh6a189YpHjcfz/a1rAYY73ryU4U2xcljGnplLJGGdCNghOXK7H
 4cb7PGEo6Vuoi99teG/vkvKIj7Ybtmo82szwNcWWPxKVRLa6c3ZD5WUpir49G4y2aVnP
 DGSw==
X-Gm-Message-State: APjAAAVDfKU+ls4qrwmi+p9iJo479ocPTrQCFuhQsf1xNJ22+G5FNjAO
 y+uS3+hI9IhaqQW04vscrLk=
X-Google-Smtp-Source: APXvYqxkGdvhldW8dU6BXryQU8E/bUH9fp3Mgl9KjQRFYr6RLZIQ4sgGgWGQAkkZ5rypPhBbRXwk9Q==
X-Received: by 2002:aed:2e02:: with SMTP id j2mr10135178qtd.370.1581349274467; 
 Mon, 10 Feb 2020 07:41:14 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id w41sm340794qtj.49.2020.02.10.07.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 07:41:13 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, sean@mess.org, tglx@linutronix.de,
 gregkh@linuxfoundation.org
Date: Mon, 10 Feb 2020 12:41:02 -0300
Message-Id: <20200210154102.118166-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v5] media: dvb_dummy_tuner: implement
	driver skeleton
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

The virtual DVB test driver serves as a reference DVB driver and helps
validate the existing APIs in the media subsystem. It can also aid developers
working on userspace applications.

This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
ISDB-T and ATSC when completed.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
-----------------------------------------------------------

Changes in v5:
	use the signal strength measurement to tell the virtual demod if
	the signal is good enough by comparing 'frequency' against a table
	of valid frequencies. The returned SNR value is taken from libdvbv5.
	
Changes in v4:
	dvb_dummy_tuner.c:
		implement the remaining functions for the tuner
		remove #include "dvb_dummy_tuner.h"
		remove "release" callback, since this driver does not use dvb_attach()

Changes in v3:
	KConfig:
		change config name to "Dummy DVB Media Tuner"
		remove useless 'default n'
		add module name on help, same as other drivers

	dvb_dummy_tuner.c:
		change license from GPL2+ to GPLv2.
		Remove LKMP reference from the source file
		Move the copyright notice to the top
		remove useless goto in dvb_tuner_i2c_probe
		only call i2c_set_clientdata after the pointer is ready

	remove dvb_dummy_tuner.h as it was not needed

	Fix this error:
		WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
		#15:
		validate the existing APIs in the media subsystem. It can also aid developers

	Remove LKMP reference from commit message


Changes in v2:
	Commit message was rewritten
	Added better description in KConfig
	Added better description in .h and .c
	Added copyright notice in .h and .c
	Kconfig dummy tuner option now defaults to 'n'
	Removed calls to pr_err, pr_debug
---------------------------------------------------------

 drivers/media/tuners/Kconfig           |   9 +
 drivers/media/tuners/Makefile          |   1 +
 drivers/media/tuners/dvb_dummy_tuner.c | 421 +++++++++++++++++++++++++
 3 files changed, 431 insertions(+)
 create mode 100644 drivers/media/tuners/dvb_dummy_tuner.c

diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
index e104bb7766e1..8ad54339ceee 100644
--- a/drivers/media/tuners/Kconfig
+++ b/drivers/media/tuners/Kconfig
@@ -296,4 +296,13 @@ config MEDIA_TUNER_QM1D1B0004
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Sharp QM1D1B0004 ISDB-S tuner driver.
+
+config MEDIA_TUNER_DVB_DUMMY_TUNER
+	tristate "Dummy DVB Media Tuner"
+	depends on MEDIA_SUPPORT && I2C
+	help
+	  Dummy DVB media tuner driver
+	  The virtual DVB test driver serves as a reference DVB driver and helps
+	  validate the existing APIs in the media subsystem. It can also aid
+	  developers working on userspace applications.
 endmenu
diff --git a/drivers/media/tuners/Makefile b/drivers/media/tuners/Makefile
index 7b4f8423501e..f98de1cf2e19 100644
--- a/drivers/media/tuners/Makefile
+++ b/drivers/media/tuners/Makefile
@@ -44,5 +44,6 @@ obj-$(CONFIG_MEDIA_TUNER_QM1D1C0042) += qm1d1c0042.o
 obj-$(CONFIG_MEDIA_TUNER_QM1D1B0004) += qm1d1b0004.o
 obj-$(CONFIG_MEDIA_TUNER_M88RS6000T) += m88rs6000t.o
 obj-$(CONFIG_MEDIA_TUNER_TDA18250) += tda18250.o
+obj-$(CONFIG_MEDIA_TUNER_DVB_DUMMY_TUNER) += dvb_dummy_tuner.o
 
 ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
diff --git a/drivers/media/tuners/dvb_dummy_tuner.c b/drivers/media/tuners/dvb_dummy_tuner.c
new file mode 100644
index 000000000000..1408a8c84be2
--- /dev/null
+++ b/drivers/media/tuners/dvb_dummy_tuner.c
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ *
+ * The virtual DVB test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * This dummy tuner should support common TV standards such as
+ * DVB-T/T2/S/S2, ISDB-T and ATSC when completed.
+ *
+ */
+
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+
+struct dvb_dummy_tuner_config {
+	struct dvb_frontend *fe;
+	u32 mock_power_up_delay_msec;
+	u32 mock_tune_delay_msec;
+	u32 mock_sleep_delay_msec;
+	u32 mock_resume_delay_msec;
+	u32 dummy_valid_dvb_t_frequencies[8];
+	u32 dummy_valid_dvb_c_frequencies[8];
+	u32 dummy_valid_dvb_s_frequencies[8];
+	u8  max_frequency_shift_hz;
+};
+
+struct dvb_dummy_tuner_cnr_to_qual_s {
+	/* attempt to use the same values as libdvbv5 */
+	u32 modulation;
+	u32 fec;
+	u32 cnr_ok, cnr_good;
+};
+
+struct dvb_dummy_tuner_cnr_to_qual_s dvb_c_cnr_2_qual[] = {
+	/* from libdvbv5 source code */
+	{ QAM_256, FEC_NONE,  34., 38.},
+	{ QAM_64,  FEC_NONE,  30., 34.},
+};
+
+struct dvb_dummy_tuner_cnr_to_qual_s dvb_s_cnr_2_qual[] = {
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
+struct dvb_dummy_tuner_cnr_to_qual_s dvb_s2_cnr_2_qual[] = {
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
+static struct dvb_dummy_tuner_cnr_to_qual_s dvb_t_cnr_2_qual[] = {
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
+enum dvb_dummy_tuner_lock_status {
+	STATUS_NO_LOCK = 0,
+	STATUS_LOCKED = TUNER_STATUS_LOCKED,
+};
+
+enum dvb_dummy_tuner_power_status {
+	STATUS_UNKNOWN,
+	STATUS_ASLEEP,
+	STATUS_ACTIVE
+};
+
+enum dvb_dummy_tuner_frequency_shift_status {
+	EXACT_MATCH,
+	CLOSE_MATCH,
+	TOO_FAR_OFF
+};
+
+struct dvb_dummy_tuner_hardware_state {
+	enum dvb_dummy_tuner_power_status power_status;
+	enum dvb_dummy_tuner_lock_status lock_status;
+	u32 if_frequency;
+	u32 tuned_frequency;
+	u32 bandwidth;
+};
+
+struct dvb_dummy_tuner_dev {
+	struct dvb_frontend *fe;
+	struct dvb_dummy_tuner_hardware_state hw_state;
+	struct dvb_dummy_tuner_config config;
+};
+
+static struct dvb_dummy_tuner_dev*
+dvb_dummy_tuner_get_dev(struct dvb_frontend *fe)
+{
+	struct i2c_client *client = fe->tuner_priv;
+
+	return (struct dvb_dummy_tuner_dev *)i2c_get_clientdata(client);
+}
+
+static bool dvb_dummy_tuner_check_frequency_shift(struct dvb_frontend *fe)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	struct dvb_dummy_tuner_config config = tuner_dev->config;
+	u32 *valid_frequencies = NULL;
+	u32 array_sz = 0;
+	u32 i;
+
+	switch (c->delivery_system) {
+	case SYS_DVBT:
+	case SYS_DVBT2:
+		valid_frequencies =
+			config.dummy_valid_dvb_t_frequencies;
+		array_sz = ARRAY_SIZE(config.dummy_valid_dvb_t_frequencies);
+		break;
+	case SYS_DVBS:
+	case SYS_DVBS2:
+		valid_frequencies =
+			config.dummy_valid_dvb_s_frequencies;
+		array_sz = ARRAY_SIZE(config.dummy_valid_dvb_s_frequencies);
+		break;
+	case SYS_DVBC_ANNEX_A:
+		valid_frequencies =
+			config.dummy_valid_dvb_c_frequencies;
+		array_sz = ARRAY_SIZE(config.dummy_valid_dvb_c_frequencies);
+		break;
+
+	default:
+		pr_warn("%s: unsupported delivery system: %u\n",
+			__func__,
+			c->delivery_system);
+		break;
+	}
+
+	for (i = 0; i < array_sz; i++) {
+		if (c->frequency == valid_frequencies[i])
+			return EXACT_MATCH;
+		else if (c->frequency >= valid_frequencies[i] -
+			 config.max_frequency_shift_hz &&
+			 c->frequency <= valid_frequencies[i] +
+			 config.max_frequency_shift_hz)
+			return CLOSE_MATCH;
+	}
+
+	return TOO_FAR_OFF;
+}
+
+static int
+dvb_dummy_tuner_get_signal_strength(struct dvb_frontend *fe, u16 *strength)
+{
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	struct dvb_dummy_tuner_cnr_to_qual_s *cnr2qual = NULL;
+	u32 array_size = 0;
+	enum dvb_dummy_tuner_frequency_shift_status shift_status;
+	u32 i;
+
+	shift_status = dvb_dummy_tuner_check_frequency_shift(fe);
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
+		return -EINVAL;
+	}
+
+	for (i = 0; i <= array_size; i++) {
+		if (cnr2qual[i].modulation == c->modulation &&
+		    cnr2qual[i].fec == c->fec_inner) {
+			*strength = (shift_status == EXACT_MATCH) ?
+				    cnr2qual[i].cnr_good :
+				    (shift_status == CLOSE_MATCH) ?
+				    cnr2qual[i].cnr_ok :
+				    cnr2qual[i].cnr_ok -
+				    (cnr2qual[i].cnr_good - cnr2qual[i].cnr_ok);
+			return 0;
+		}
+
+	}
+
+	/* default to some random values if we can't match against the table */
+	*strength = (shift_status == EXACT_MATCH) ? 34 : 10;
+	return 0;
+}
+
+static int dvb_dummy_tuner_init(struct dvb_frontend *fe)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+	struct dvb_dummy_tuner_config config = tuner_dev->config;
+
+	msleep_interruptible(config.mock_power_up_delay_msec);
+
+	tuner_dev->hw_state.power_status = STATUS_ACTIVE;
+	tuner_dev->hw_state.if_frequency = 5000;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_sleep(struct dvb_frontend *fe)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+	struct dvb_dummy_tuner_config config = tuner_dev->config;
+
+	msleep_interruptible(config.mock_sleep_delay_msec);
+	tuner_dev->hw_state.power_status = STATUS_ASLEEP;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_suspend(struct dvb_frontend *fe)
+{
+	return dvb_dummy_tuner_sleep(fe);
+}
+
+static int dvb_dummy_tuner_resume(struct dvb_frontend *fe)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+	struct dvb_dummy_tuner_config config = tuner_dev->config;
+
+	msleep_interruptible(config.mock_resume_delay_msec);
+	tuner_dev->hw_state.power_status = STATUS_ACTIVE;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_set_params(struct dvb_frontend *fe)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+	struct dvb_dummy_tuner_config config = tuner_dev->config;
+	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
+	u32 min_freq = fe->ops.tuner_ops.info.frequency_min_hz;
+	u32 max_freq = fe->ops.tuner_ops.info.frequency_max_hz;
+	u32 min_bw = fe->ops.tuner_ops.info.bandwidth_min;
+	u32 max_bw = fe->ops.tuner_ops.info.bandwidth_max;
+
+	msleep_interruptible(config.mock_tune_delay_msec);
+
+	if (c->frequency < min_freq  || c->frequency > max_freq  ||
+	    c->bandwidth_hz < min_bw || c->bandwidth_hz > max_bw) {
+		tuner_dev->hw_state.lock_status = STATUS_NO_LOCK;
+		return -EINVAL;
+	}
+
+	tuner_dev->hw_state.tuned_frequency = c->frequency;
+	tuner_dev->hw_state.bandwidth = c->bandwidth_hz;
+	tuner_dev->hw_state.lock_status = STATUS_LOCKED;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_set_config(struct dvb_frontend *fe,
+				      void *priv_cfg)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+
+	WARN_ON(sizeof(tuner_dev->config) != sizeof(*priv_cfg));
+	memcpy(&tuner_dev->config, priv_cfg, sizeof(*priv_cfg));
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_frequency(struct dvb_frontend *fe,
+					 u32 *frequency)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+
+	*frequency = tuner_dev->hw_state.tuned_frequency;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_bandwidth(struct dvb_frontend *fe,
+					 u32 *bandwidth)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+
+	*bandwidth = tuner_dev->hw_state.bandwidth;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_if_frequency(struct dvb_frontend *fe,
+					    u32 *frequency)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+
+	*frequency = tuner_dev->hw_state.if_frequency;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_get_status(struct dvb_frontend *fe, u32 *status)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = dvb_dummy_tuner_get_dev(fe);
+
+	*status = tuner_dev->hw_state.lock_status;
+
+	return 0;
+}
+
+static const struct dvb_tuner_ops dvb_dummy_tuner_ops = {
+	.init = dvb_dummy_tuner_init,
+	.sleep = dvb_dummy_tuner_sleep,
+	.suspend = dvb_dummy_tuner_suspend,
+	.resume = dvb_dummy_tuner_resume,
+	.set_params = dvb_dummy_tuner_set_params,
+	.set_config = dvb_dummy_tuner_set_config,
+	.get_bandwidth = dvb_dummy_tuner_get_bandwidth,
+	.get_frequency = dvb_dummy_tuner_get_frequency,
+	.get_if_frequency = dvb_dummy_tuner_get_if_frequency,
+	.get_status = dvb_dummy_tuner_get_status,
+	.get_rf_strength = dvb_dummy_tuner_get_signal_strength
+};
+
+static const struct i2c_device_id dvb_dummy_tuner_i2c_id_table[] = {
+	{"dvb_dummy_tuner", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, dvb_dummy_tuner_i2c_id_table);
+
+static int dvb_dummy_tuner_i2c_probe(struct i2c_client *client,
+				     const struct i2c_device_id *id)
+{
+	struct dvb_dummy_tuner_config *config = client->dev.platform_data;
+	struct dvb_frontend *fe = config->fe;
+	struct dvb_dummy_tuner_dev *tuner_dev = NULL;
+
+	tuner_dev = kzalloc(sizeof(*tuner_dev), GFP_KERNEL);
+	if (!tuner_dev)
+		return -ENOMEM;
+
+	tuner_dev->fe = config->fe;
+	i2c_set_clientdata(client, tuner_dev);
+
+	memcpy(&fe->ops.tuner_ops,
+	       &dvb_dummy_tuner_ops,
+	       sizeof(struct dvb_tuner_ops));
+
+	fe->tuner_priv = client;
+
+	return 0;
+}
+
+static int dvb_dummy_tuner_i2c_remove(struct i2c_client *client)
+{
+	struct dvb_dummy_tuner_dev *tuner_dev = i2c_get_clientdata(client);
+	struct dvb_frontend *fe = tuner_dev->fe;
+
+	memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
+	fe->tuner_priv = NULL;
+	kfree(tuner_dev);
+
+	return 0;
+}
+
+static struct i2c_driver dvb_dummy_tuner_i2c_driver = {
+	.driver = {
+		.name = "dvb_dummy_tuner",
+		.suppress_bind_attrs = true,
+	},
+	.probe		= dvb_dummy_tuner_i2c_probe,
+	.remove		= dvb_dummy_tuner_i2c_remove,
+	.id_table	= dvb_dummy_tuner_i2c_id_table,
+};
+module_i2c_driver(dvb_dummy_tuner_i2c_driver);
+
+MODULE_DESCRIPTION("DVB Dummy Tuner");
+MODULE_AUTHOR("Daniel W. S. Almeida");
+MODULE_LICENSE("GPL");
-- 
2.25.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
