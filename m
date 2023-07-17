Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9004BEB64DC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Jul 2023 17:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 274B260EC2;
	Mon, 17 Jul 2023 17:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 274B260EC2
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=I610iZ7p
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THcQSYDsQN-h; Mon, 17 Jul 2023 17:53:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0BF7560B00;
	Mon, 17 Jul 2023 17:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BF7560B00
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4336C0072;
	Mon, 17 Jul 2023 17:53:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DED1CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 17:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C559D40997
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 17:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C559D40997
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=I610iZ7p
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5yXMHIlhDjN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 17:53:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F292F40994
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F292F40994
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 17:53:01 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1b8a44ee159so28919015ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Jul 2023 10:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689616381; x=1692208381;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5tYEoMOLm/mIuBIhnH5hvMExYrOHr41KyvUDfsyubA4=;
 b=I610iZ7puRZvI+aUPm6JVT0dUWkBr3MTu4xvOwRBstjV0TF5f0x8XaPiSALfqFBbqM
 dq50Oy2VSixBwIgHaPOAsRoQk3tXHlBR4VNJ+2hKoduHsI0FfsVSr9WtOzXoOtdLy+a/
 amFKicpj+oCr0f3pca8erDuiaCYXQw5nn11b9++W2VBN0HxfEddFqtHYnuOrK76LIu18
 vHGIVUS2DKYekCR9g1cHPJh4fGy8yzrS5hHC2BLVqbJ9s2nTNDIbrAm6tM32e/Ua0Uu2
 QsA1kN9g5/ZrIks+bm/3DkeVq28dk/Tdlc7ZHbkA01h7WLbnJQLKbmTceS/OQLA/fEW5
 Vbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689616381; x=1692208381;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5tYEoMOLm/mIuBIhnH5hvMExYrOHr41KyvUDfsyubA4=;
 b=V9zxP2qpi+UZ6ZGR1WLGVDHVxRzM4PpT4mvpAnMJ1D0nmp7b5/FRB8XAw7zua4xqsJ
 bmXbhXRRiycJoPr85oysQZRTNRRmmnphkuvazscJvJZ4bnXm4Ln2dCA2kE03WCsc7D6K
 FG97a4FUurHDgv2VHHROwolLD7S2BDeTVlgzM/8PAB8HQMgQQzJj4gZyFjXK1V6r8atM
 bWtnQTYcw+NDv4IjltWpW2MCUFMERy9u3PZ2shd1A2S/cwOpYKLyjSvPnRnsGVURPaEi
 LoIhHIkQBTHPUTzmh6XvNrtROfhYCm8Ig6n6QyrDnCeI7QglR0Yqe1QxnlCez6fUMz8Z
 hyaA==
X-Gm-Message-State: ABy/qLaOddV6oRbWV+J3OHux6FP1QPCYbQU30n83L4+kUV1w1No7AcIB
 qDYNDrfiEu6k3d6NmiUJ7FU=
X-Google-Smtp-Source: APBJJlH9GFTB1GX/3XF09GHgj4tbHjuW07ilNWgS+K2qPVPVLx1MwqHs+N8oVGSFHP8+/sOryWoVxw==
X-Received: by 2002:a17:902:be0f:b0:1b8:7483:d481 with SMTP id
 r15-20020a170902be0f00b001b87483d481mr10786269pls.8.1689616381291; 
 Mon, 17 Jul 2023 10:53:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:58ea:6a1e:612b:7001:f9bd])
 by smtp.gmail.com with ESMTPSA id
 jk11-20020a170903330b00b001b8896cd57bsm148971plb.269.2023.07.17.10.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 10:53:00 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com
Subject: [PATCH v5] selftests: rtc: Fixes rtctest error handling.
Date: Mon, 17 Jul 2023 23:22:51 +0530
Message-Id: <20230717175251.54390-1-atulpant.linux@gmail.com>
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

Adds a check to verify if the rtc device file is valid or not
and prints a useful error message if the file is not accessible.

Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
---

changes since v4:
    Updated the commit message.

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
