Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0053DC77B7E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 29 Apr 2023 06:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63B0160E87;
	Sat, 29 Apr 2023 06:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63B0160E87
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=c0z9/N3s
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XuV9ITDZhirn; Sat, 29 Apr 2023 06:49:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5389D60E3E;
	Sat, 29 Apr 2023 06:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5389D60E3E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33474C0036;
	Sat, 29 Apr 2023 06:49:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6DCFC002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Apr 2023 06:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CEF54091A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Apr 2023 06:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CEF54091A
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=c0z9/N3s
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id waLwnLlaEMFY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Apr 2023 06:49:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B4AE40918
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B4AE40918
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Apr 2023 06:49:29 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-63b5465fb99so659245b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Apr 2023 23:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682750969; x=1685342969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e4bDzV0lLhdnU/5RNH175pUAjmfdzaJV0OIwecl930c=;
 b=c0z9/N3sLEYMbxbjtbgQQ0xrTofRsqKqpd56WomUiNL4VxpBzcmDqNzWbtMHEO2/Dn
 7bA56jBi/zLjLyFdGlQymI1Am9qPT+V+pW1siPWavF4u5DcCOsoO7Xv1BBHyX9xXJPg9
 bnhSv4tFFVT5ePiBLnWBqJHs/J4TolTrhjCrQDS++mCD8rZezxE2a60QCO+pENwtbvlo
 /ZXwAcAu/JW9UYWJc4Ntt6Icazu+2pPaaW6Cv5rsvyx/NJM8BLEHD/y57FOAlCWOm7Yc
 uRvqfeJ9W1we1A9yi9JwbfKmF7B9k0oTyNKNMDZqi+Y/PC38sfbBajaJ35af3AdXdC8+
 GMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682750969; x=1685342969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e4bDzV0lLhdnU/5RNH175pUAjmfdzaJV0OIwecl930c=;
 b=R/I4F5iDPenllFQJDtxmRCQTTsCfOINP+mnfXBRpMwYLN/6dghp/CSIymAHkYzne6h
 +QBFZHe+T6UuRn4YmehwfrhpK9D2/d07keF2pOTkzo9jF9g42VYiXgSehPTTDdgGJrr/
 QZHuoWvcR5021uJZ0IY1iHP+ustXAeXFfg+XIomRVVV9OKczOiFTRxGu2aLnI1CSpBQh
 BJ/PXol8ZJz3vbeB0tvwcgm2LvwSWYg/n3BzwyY4tXQh0YLhY9jG55GlwQyjBCbpwb/i
 lqTulVZmAflem25yMIvZl+AvtsTdKScD3BROlHG7wCaP4G9mj5Yts4fQq/xGPZaYifJl
 7waQ==
X-Gm-Message-State: AC+VfDw1iSGOgo+41cQbM4/vsZOSmtNrR7Z7zODDE9b4ybVvw++iERVj
 3k4xreJICZHpz4wma89HOK4=
X-Google-Smtp-Source: ACHHUZ4/YbaWsomzPTc3IhNQVKJo/i82W4D8vjb+bnOYQWr2+bYWka87NoOPTXwt+qItliRSnq0CXw==
X-Received: by 2002:a17:902:dac2:b0:1aa:ce4d:c779 with SMTP id
 q2-20020a170902dac200b001aace4dc779mr2336179plx.39.1682750968881; 
 Fri, 28 Apr 2023 23:49:28 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4070:2d3b:5a4f:be4f:9ffa:373f:f0b8])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a170902a71800b001a64dbfc5d7sm14121122plq.145.2023.04.28.23.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 23:49:28 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com
Subject: [PATCH v2] selftests: rtc: Improves rtctest error handling.
Date: Sat, 29 Apr 2023 12:19:17 +0530
Message-Id: <20230429064917.97153-1-atulpant.linux@gmail.com>
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

changes since v1:
    Removed check for uid=0
    If rtc file is invalid, then exit the test.

 tools/testing/selftests/rtc/rtctest.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
index 2b9d929a24ed..07f7dcd47102 100644
--- a/tools/testing/selftests/rtc/rtctest.c
+++ b/tools/testing/selftests/rtc/rtctest.c
@@ -17,6 +17,7 @@
 #include <unistd.h>
 
 #include "../kselftest_harness.h"
+#include "../kselftest.h"
 
 #define NUM_UIE 3
 #define ALARM_DELTA 3
@@ -388,6 +389,8 @@ __constructor_order_last(void)
 
 int main(int argc, char **argv)
 {
+	int ret = -1;
+
 	switch (argc) {
 	case 2:
 		rtc_file = argv[1];
@@ -399,5 +402,11 @@ int main(int argc, char **argv)
 		return 1;
 	}
 
-	return test_harness_run(argc, argv);
+	// Run the test if rtc_file is valid
+	if (access(rtc_file, F_OK) == 0)
+		ret = test_harness_run(argc, argv);
+	else
+		ksft_exit_fail_msg("[ERROR]: %s : File does not exists - Exiting\n", rtc_file);
+
+	return ret;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
