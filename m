Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4827BEB64DC
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Jun 2023 16:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7856414CC;
	Sun, 25 Jun 2023 16:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7856414CC
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g532fHFZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gaYM1Be51X4k; Sun, 25 Jun 2023 16:48:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8F128414A2;
	Sun, 25 Jun 2023 16:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F128414A2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68CDDC0037;
	Sun, 25 Jun 2023 16:48:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78C7FC0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Jun 2023 16:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BFA4414C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Jun 2023 16:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BFA4414C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qaBifYwO1puU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Jun 2023 16:47:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13EE7414A2
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13EE7414A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Jun 2023 16:47:56 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1b5251e5774so10137405ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Jun 2023 09:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687711676; x=1690303676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JrHw4mRW5A/vgYoezf5xq+fZgApytnvIL9YpisNFqHc=;
 b=g532fHFZgHUsSpIxFLja3h8N737kCVFMnMfUErCYP4Z/Q7nhUzlunqQntzH/rggYUD
 VSkWtKqH+1CJtofIA/hYu7fzuO4aEJp+6jCeADEuPp+lMRuHULp+1kJjMDNpG3bKI4Rp
 /rTGlUcxSjEoXobvEV9FhkavLsN+GJx0hQ4ykgHcbTVBy+XrEBLQSby4EULKIL8HbVfH
 euBYzYiaLVAagUQUyvY5ZBdvmBgFdO8v4WwPXwiQRdHLKJvuiy5rC0Qkyc0pjloypbhc
 5DIHYtHjpB1/itZPc3UyDdmfKWoa2wx2mCiqfc0NLvOrcyzcB5ClW8aWzddI5AJ+qSg4
 NG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687711676; x=1690303676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JrHw4mRW5A/vgYoezf5xq+fZgApytnvIL9YpisNFqHc=;
 b=DcsHUJnbG+A65AkAKs9TaUDZHU9qnTlz8iMRqLD9YbGhnSEO+/DZqpWsAv+3QTUjcJ
 3df0UZk54GEB+2K1jqHltYLb/CjULes0QTLEVuHdp4YKzpXFezu1ETGskVjXaOz19Y+c
 oPO5PHqrf8au1nSe75NA94cy2ax7ddiadoUQkdRWeqqlr3U9fRFDk3RB7JVlPhulEnBz
 XQU9Gqzakf6C2r8LF1mp70+V9SjjYVHlafgJe2svBGSLKeppK5ghF5ZGKS/KubsyGlDo
 ZLt550KqwNo38otsPw70QQWqi+8ze6MRynbE2fwr3Ym7gOFfaia41GLL/pGHv05X/AzH
 n3tA==
X-Gm-Message-State: AC+VfDwLuYOqK7SM0gMlYrx4VialvIriR964GMN2cQqZ/lXeJ5Zpctua
 EP77I1LV8Gba9yL/bxYLrXY=
X-Google-Smtp-Source: ACHHUZ6tgfRXj5zugS1jS5XtzDLiBPwRLvacMNtk608W9LfGyk4dOf+8aea3oiZ0vXJuw2pDueO+iw==
X-Received: by 2002:a17:902:e844:b0:1b1:f617:d184 with SMTP id
 t4-20020a170902e84400b001b1f617d184mr2189553plg.11.1687711676368; 
 Sun, 25 Jun 2023 09:47:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:5fde:9337:b934:e095:7b66])
 by smtp.gmail.com with ESMTPSA id
 iw5-20020a170903044500b001b0603829a0sm2649607plb.199.2023.06.25.09.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 09:47:56 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com
Subject: [PATCH v3] selftests: rtc: Improves rtctest error handling.
Date: Sun, 25 Jun 2023 22:17:48 +0530
Message-Id: <20230625164748.22458-1-atulpant.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: shuah@kernel.org, Atul Kumar Pant <atulpant.linux@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
