Return-Path: <SRS0=N6Le=6Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10DDC47259
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 03:22:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A70D208DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 03:22:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmE/5Zgi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A70D208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4B221873F0;
	Sat,  2 May 2020 03:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RGN7Jht8W19r; Sat,  2 May 2020 03:22:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D6BA87286;
	Sat,  2 May 2020 03:22:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29A33C0864;
	Sat,  2 May 2020 03:22:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EEB27C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DE29B873F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JvWZLlJilD2a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 09EFD87286
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:45 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id i68so9546573qtb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 01 May 2020 20:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M9aiXFxkkHzWycdBKzVgypNSiFv5YUSEcCj5fU/dHuw=;
 b=JmE/5ZgiMPx9+UBCjBmgrwStyLpG/LE6GYrB4oYYDLTaD/Jz2PePLbEm7ECxNKqs1N
 0q8B4o8aH/+z4dAyLO+vzwtxoPsgk+8zwJCVDZM66ffREpzgI+kI7dSuqlJMONz+XsZd
 hO7RhWnWmcvSkDVG5w4KhLPFKIFsGrz0Vpf5gEg1eJjXuv5Agn8Nx1qj4JJ6cTnykENp
 N6BFgL4oM8ySj+C8/2w8m8QnEd6McSP3qlY25+YeKEZNrbT+Cpzpk7fnu1PnRgG46Qpe
 of9te20HNiuTlKNRwxX4aD9RccAKqCuU4S6E95pOnrkknlwd5Hg1Ifmc79lXO26O72BC
 MI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M9aiXFxkkHzWycdBKzVgypNSiFv5YUSEcCj5fU/dHuw=;
 b=Ww7bdmzVVXGjew9fjLBjO/38kqnPJko/lr9TMp4e4KoHdqFCEEQbtVxqY2JhmD221O
 pwapn4uklUgcPlnFktKtfRlGy1oHtmCk7MhVDSMKvSJB/vwt8Fr+ARtcmdf0gi352PIX
 rbBm11fDWF2ZugohquNWyUAjxMWywhv44rjDmp2EM/hk/h4qmEeDYtujc9cTk3XlwuU8
 mYVN17OH5Qe0mDzO1US47aiQMwfdERWQWrh/8zdpMEoDFJVKItlKTyU4k8xFrM5bIbly
 0AhB76IrGmFLeks8j7hgjYWqV8EF0NxPzmRh0Gcza6/hvY5PxTh+QcHD2+LlJq+YAaHG
 yNhQ==
X-Gm-Message-State: AGi0PuZ2VaiLUT6THSi2Vbk06PEAQVj2lhwd6m9grMpYX1raEtuJ9mJl
 5AYOzgZnsq499pmlTY0QlQY=
X-Google-Smtp-Source: APiQypIiceR1T8wkFb1LYT7VxbFeuyiaZkDwvF0YepOqRKrdB8mltj7qJA8UdOMUzUh6zDl2s7bqYw==
X-Received: by 2002:aed:3e27:: with SMTP id l36mr6945915qtf.192.1588389764042; 
 Fri, 01 May 2020 20:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:602b:723a:1b2a:57a1:a611:34ed])
 by smtp.gmail.com with ESMTPSA id
 c41sm4410399qta.96.2020.05.01.20.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 20:22:43 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Sat,  2 May 2020 00:22:09 -0300
Message-Id: <20200502032216.197977-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502032216.197977-1-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v4 04/11] media: vidtv: move config structs into a separate header
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

Move config structs to a common header so they can be used by the bridge
driver and by their respective drivers.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 .../media/test-drivers/vidtv/vidtv_config.h   | 35 +++++++++++++++++++
 .../media/test-drivers/vidtv/vidtv_demod.c    |  1 +
 .../media/test-drivers/vidtv/vidtv_demod.h    |  9 -----
 .../media/test-drivers/vidtv/vidtv_tuner.c    | 12 ++-----
 4 files changed, 38 insertions(+), 19 deletions(-)
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_config.h

diff --git a/drivers/media/test-drivers/vidtv/vidtv_config.h b/drivers/media/test-drivers/vidtv/vidtv_config.h
new file mode 100644
index 0000000000000..7b95bf2444556
--- /dev/null
+++ b/drivers/media/test-drivers/vidtv/vidtv_config.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The Virtual DTV test driver serves as a reference DVB driver and helps
+ * validate the existing APIs in the media subsystem. It can also aid
+ * developers working on userspace applications.
+ *
+ * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
+ */
+
+#ifndef VIDTV_CONFIG_H
+#define VIDTV_CONFIG_H
+
+#include <linux/types.h>
+#include <media/dvb_frontend.h>
+
+struct vidtv_tuner_config {
+	struct dvb_frontend *fe;
+	u32 mock_power_up_delay_msec;
+	u32 mock_tune_delay_msec;
+	u32 vidtv_valid_dvb_t_freqs[8];
+	u32 vidtv_valid_dvb_c_freqs[8];
+	u32 vidtv_valid_dvb_s_freqs[8];
+	u8  max_frequency_shift_hz;
+};
+
+struct vidtv_demod_config {
+	struct dvb_frontend *frontend;
+	/* probability of losing the lock due to low snr */
+	u8 drop_tslock_prob_on_low_snr;
+	/* probability of recovering when the signal improves */
+	u8 recover_tslock_prob_on_good_snr;
+	u8 chosen_delsys;
+};
+
+#endif //VIDTV_CONFIG_H
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index e5f157e4bbe48..15436e565a7b0 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -19,6 +19,7 @@
 #include <linux/i2c.h>
 #include <media/dvb_frontend.h>
 #include "vidtv_demod.h"
+#include "vidtv_config.h"
 
 MODULE_DESCRIPTION("Virtual DVB Demodulator Driver");
 MODULE_AUTHOR("Daniel W. S. Almeida");
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.h b/drivers/media/test-drivers/vidtv/vidtv_demod.h
index 49c2a43f71661..269855efb77f3 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.h
@@ -21,15 +21,6 @@ struct vidtv_demod_cnr_to_qual_s {
 	u32 cnr_ok, cnr_good;
 };
 
-struct vidtv_demod_config {
-	struct dvb_frontend *frontend;
-	/* probability of losing the lock due to low snr */
-	u8 drop_tslock_prob_on_low_snr;
-	/* probability of recovering when the signal improves */
-	u8 recover_tslock_prob_on_good_snr;
-	u8 chosen_delsys;
-};
-
 struct vidtv_demod_state {
 	struct dvb_frontend frontend;
 	struct vidtv_demod_config config;
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
index a790508f935b3..ece4a94b0c3ac 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -17,20 +17,12 @@
 #include <linux/types.h>
 #include <media/dvb_frontend.h>
 
+#include "vidtv_config.h"
+
 MODULE_DESCRIPTION("Virtual DTV Tuner");
 MODULE_AUTHOR("Daniel W. S. Almeida");
 MODULE_LICENSE("GPL");
 
-struct vidtv_tuner_config {
-	struct dvb_frontend *fe;
-	u32 mock_power_up_delay_msec;
-	u32 mock_tune_delay_msec;
-	u32 vidtv_valid_dvb_t_freqs[8];
-	u32 vidtv_valid_dvb_c_freqs[8];
-	u32 vidtv_valid_dvb_s_freqs[8];
-	u8  max_frequency_shift_hz;
-};
-
 struct vidtv_tuner_cnr_to_qual_s {
 	/* attempt to use the same values as libdvbv5 */
 	u32 modulation;
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
