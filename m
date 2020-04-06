Return-Path: <SRS0=pM+b=5W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FA2C2BB54
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 23:21:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D65E20753
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 23:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u6C+F8Hx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D65E20753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EC4A7883A4;
	Mon,  6 Apr 2020 23:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ORw0sQitczVy; Mon,  6 Apr 2020 23:21:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1DE58884D9;
	Mon,  6 Apr 2020 23:21:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B392C1AE2;
	Mon,  6 Apr 2020 23:21:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56A92C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 23:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 522EF22739
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 23:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tKZWwdI+tLf6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 23:21:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 8BD2B231F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 23:21:27 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id c14so1356535qtp.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Apr 2020 16:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OaKLagKkBXSlUggDF7Q3Hul7FW0QuHIxEa1ITJQXhiM=;
 b=u6C+F8HxVrCGoXEr+POxhMSGbQuO5uamUz8SuihoKeW60L7JOw8gBldwwXhVS2xe5O
 xdYQK120VYk7HrHHvo1k7Ak5fLLASA5R+t+cRxYHJJ9IZvgKg5QZASj4xQUFOX1BG52Y
 aZ35nxwzdd5+Woc1qx0sfQN37AoT5upfIcjbPWqPmZiy4C4EeOw7xPAE1yKER13gbNdw
 UcFuZyKMaxeYL4qqKJo8B3JS4InbSykT83nm0JHDii/XIBtZN1encFXlg/0HR2condsf
 1F1Ogzut5RR2bKRa2XdJEjsBwVOMAwm7Hu8KNKW5hqCU4QxauGizsc10XdQbQcPI96g5
 mYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OaKLagKkBXSlUggDF7Q3Hul7FW0QuHIxEa1ITJQXhiM=;
 b=Yv3e+aVtFZ7oozgX5ac3NMRRhJQr8Q8V0kUFcI8yp4Ks5pfJ81tembjU8ggVhgwNDA
 AO/a5QL1dTxQ/4BhGE93LzYfic5tqWrLw+cp81/UDXIhV0KpzrrNhVwGIDJFYZTJk04w
 pf+L8EL2UDaQItlPqnj6MSGctE3dA3a718GP2ELNi+3O7XKCDBq9RMuuRkgk/ihAogsK
 PoXfgxkcV+0fF9JYCUTuALsnKqQLslQfDFFyTG52nICi5BXb5jSMdzppJglp3riyG3O8
 jFTqk9hRUhV9aucatCEXQ+wl8xMyaJZicqEQGX4TEggJwo+YBZM2q1egb6OJyembk2n6
 JWtw==
X-Gm-Message-State: AGi0Pua3zlTGmk6Kg/y0q68fRjTPAwa7FsZ7dEBLipEmPpmbpjaMBVvn
 K1PdFvPo3OB82i3Ie2eokZg=
X-Google-Smtp-Source: APiQypKIMzGPMnyM6M/gB4c56C+5YWQnNPvoaJcP4Nep+NhXWW08QMvd1RS7NBLpPunHLyKhw7KNIw==
X-Received: by 2002:ac8:224c:: with SMTP id p12mr2021756qtp.32.1586215286610; 
 Mon, 06 Apr 2020 16:21:26 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id u26sm1490978qku.54.2020.04.06.16.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 16:21:26 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Mon,  6 Apr 2020 20:20:54 -0300
Message-Id: <20200406232055.1023946-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
References: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v3 5/6] media: vidtv: move config structs into a common header
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
 .../media/test_drivers/vidtv/vidtv_common.h   | 19 +++++++++++++++++++
 .../media/test_drivers/vidtv/vidtv_demod.h    |  9 ---------
 .../media/test_drivers/vidtv/vidtv_tuner.c    | 12 ++----------
 3 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/media/test_drivers/vidtv/vidtv_common.h b/drivers/media/test_drivers/vidtv/vidtv_common.h
index 43269833ee866..e6b36429cc8de 100644
--- a/drivers/media/test_drivers/vidtv/vidtv_common.h
+++ b/drivers/media/test_drivers/vidtv/vidtv_common.h
@@ -56,6 +56,25 @@ struct vidtv_mpeg_ts {
 	struct vidtv_mpeg_ts_adaption adaption[];
 } __packed;
 
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
 u32 vidtv_memcpy(void *to,
 		 const void *from,
 		 size_t len,
diff --git a/drivers/media/test_drivers/vidtv/vidtv_demod.h b/drivers/media/test_drivers/vidtv/vidtv_demod.h
index 49c2a43f71661..269855efb77f3 100644
--- a/drivers/media/test_drivers/vidtv/vidtv_demod.h
+++ b/drivers/media/test_drivers/vidtv/vidtv_demod.h
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
diff --git a/drivers/media/test_drivers/vidtv/vidtv_tuner.c b/drivers/media/test_drivers/vidtv/vidtv_tuner.c
index c948daa66ec73..8b1befc861e33 100644
--- a/drivers/media/test_drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test_drivers/vidtv/vidtv_tuner.c
@@ -17,20 +17,12 @@
 #include <linux/types.h>
 #include <media/dvb_frontend.h>
 
+#include "vidtv_common.h"
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
2.26.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
