Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46321C001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Jul 2023 18:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB08D404E1;
	Sun, 16 Jul 2023 18:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB08D404E1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GaaYjzKL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2U-o9NdxqV-S; Sun, 16 Jul 2023 18:18:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 664BF4029B;
	Sun, 16 Jul 2023 18:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 664BF4029B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DC15C0072;
	Sun, 16 Jul 2023 18:18:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9CD1C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 18:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F3A860B27
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 18:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F3A860B27
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GaaYjzKL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4HRLmUI97xMB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 18:18:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA75A60A47
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA75A60A47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 18:18:36 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1b8ad356f03so21965565ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 11:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689531516; x=1692123516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uRr4t72OqG7bbsdSQp36s5QmJpiGmQDwT7OtOfgVJAs=;
 b=GaaYjzKLGGS1UieotsqzLzc8zg49fL2l6LbQTq3nbfRE+3kPmSrdRXeC5u7qg1VvXB
 ruuwP3vXsuw7i7PcoixYO4rTMutHMuhoAoT3wQ5lO0TZi5uBCYh/B1j8b1Tkuh+p1Jw5
 GMyOpBuH6+TcBxZYOBO7/F0bG+EraHMrDfGydgkurseGk/ofa92an7A/FhERLpHr4pte
 OwQINR0kLvSSLFs9k4ApiPmnIGKO79f9d38yBzjXvL6Cj1FNF3U3Trp8ZGs/fSG1hzdK
 A8pZkBlstHyHiWzs/QntkFLl6bp9ddzq4TpFicx12n3wumpjmvzZaC1DUudpjgA9OeVg
 EzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689531516; x=1692123516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uRr4t72OqG7bbsdSQp36s5QmJpiGmQDwT7OtOfgVJAs=;
 b=adHasmbkcgxnePDEkXNYLiMZEsT8Vssi91hayOIxhFHNEjogTGxaQa/qvyycvPJNcz
 WTR2FmkemKdEoWIqMtfiEt/uVZtgEISB1TIJx/zAhShLt9lLvvQyjohwzo0RZs1YJl3f
 9vuFLqnanDZ7WmRaFyi6zpPVqouvbS96B9j6TFCI8fsBttCI5cpThMTmMjMEqdtYoZqA
 38pp1uA9aUIDgYhAq6GvSAA5WHJPbrPZiL+PresZoY7PgNMF3QC3Nt7DoNj+REcUzpNC
 iRJB+CPYO9HgnaiIPfwCazwPChuAWFXaDOmCJwn0RfYYGp4JaCwwffILLLquX06wunJ9
 +p5w==
X-Gm-Message-State: ABy/qLZ0nsnudrchEm1ocw7xFJDrpPekw1iPQKW+nIisNuHPRUzOnXhI
 lNGVUOIu1qCyPtfilD4+JSA=
X-Google-Smtp-Source: APBJJlGeSVnKgr9IYi96OpeUoLCDTdox4GFlFamj0ylUDg3pvZD2cublCV/5BfUn/SiWjyUynohRiw==
X-Received: by 2002:a17:903:182:b0:1b8:944a:a932 with SMTP id
 z2-20020a170903018200b001b8944aa932mr10984982plg.2.1689531516055; 
 Sun, 16 Jul 2023 11:18:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:58ea:65e4:f662:2536:5ba8])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a17090301cf00b001b87d3e845bsm11242422plh.149.2023.07.16.11.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jul 2023 11:18:35 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com
Subject: [PATCH v4] selftests: rtc: Improves rtctest error handling.
Date: Sun, 16 Jul 2023 23:48:25 +0530
Message-Id: <20230716181825.44337-1-atulpant.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-rtc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Atul Kumar Pant <atulpant.linux@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, shuah@kernel.org
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

When running the rtctest if we pass wrong rtc device file as an argument
the test fails expectedly, but prints the logs that are not useful
to point out the issue.
To handle this, the patch adds a checks to verify if the rtc_file is valid.

Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
---

changes since v3:
    Added Linux-kselftest and Linux-kernel mailing lists.

changes since v2:
    Changed error message when rtc file does not exist.

changes since v1:
    Removed check for uid=0
    If rtc file is invalid, then exit the test.

 tools/testing/selftests/rtc/rtctest.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
index 63ce02d1d5cc..630fef735c7e 100644
--- a/tools/testing/selftests/rtc/rtctest.c
+++ b/tools/testing/selftests/rtc/rtctest.c
@@ -17,6 +17,7 @@
 #include <unistd.h>
 
 #include "../kselftest_harness.h"
+#include "../kselftest.h"
 
 #define NUM_UIE 3
 #define ALARM_DELTA 3
@@ -419,6 +420,8 @@ __constructor_order_last(void)
 
 int main(int argc, char **argv)
 {
+	int ret = -1;
+
 	switch (argc) {
 	case 2:
 		rtc_file = argv[1];
@@ -430,5 +433,11 @@ int main(int argc, char **argv)
 		return 1;
 	}
 
-	return test_harness_run(argc, argv);
+	// Run the test if rtc_file is valid
+	if (access(rtc_file, F_OK) == 0)
+		ret = test_harness_run(argc, argv);
+	else
+		ksft_exit_fail_msg("[ERROR]: Cannot access rtc file %s - Exiting\n", rtc_file);
+
+	return ret;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
