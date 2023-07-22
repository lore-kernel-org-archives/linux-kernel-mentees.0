Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8B1C0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Jul 2023 06:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A80E40960;
	Sat, 22 Jul 2023 06:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A80E40960
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DoBw3Me1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sgogi3Vmve-R; Sat, 22 Jul 2023 06:07:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 27B314000B;
	Sat, 22 Jul 2023 06:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27B314000B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01336C0071;
	Sat, 22 Jul 2023 06:07:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F13E2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Jul 2023 06:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1DB383984
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Jul 2023 06:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1DB383984
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DoBw3Me1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BR8DxF434N_X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Jul 2023 06:07:18 +0000 (UTC)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5DDB83955
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Jul 2023 06:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5DDB83955
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1b730eb017bso2065663fac.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Jul 2023 23:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690006037; x=1690610837;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rW6GM0YOKgtl8KRMmye9ZDjg4JN8bbrjMVuMmk40jik=;
 b=DoBw3Me1QOOkU/J1GVBk5SaEYGjZnik2o7BnISvlBySPxczy5lmYzvOCcxWqQYxb1N
 NcgDMNi+jaKY6uI1eqHyRlE0ugCo1Gnhlw2RNAVeQswQ202G2D+OtrzWvU9IvH1nQjTC
 Bbsms1KXORTHkB591U+nMfZIGXO7twpzOMR4YEeKk45fAyAG4vSpWppYDPNTNOCqy1E1
 L2L8XC92xts5DmJySbJTIpxki27QNH8SFTt9dfBoR9ANQ1ZRWVGbM5EAQG94yzo53tQ/
 ryPh2g3T98RbYr/JoNCPYZ7szaUIfMkibSE7AD76BOVKuAvSv8xxF+EUnJ+NvjmKC21j
 Mc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690006037; x=1690610837;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rW6GM0YOKgtl8KRMmye9ZDjg4JN8bbrjMVuMmk40jik=;
 b=RgButAc+I7w7hxf/NXKi+pqryRi/tZvEwNly7gJBMRWUqztUhWyhRsr8OFKstUGoeX
 JTNdG12Ug0aGxNDujxNyXLFjQlIhq7q5GsZgpps0wyE/PguDSr7QRTb1JIrAzFybBMuM
 tr4QfftyMQmc1RhgaME1jPSbrhus7hHoB5VVWWk8zSV2CtPhWV3Gkhrybl2ky/VpBIPZ
 WgWV9WwgmRLAw5J0VFPwm0IhGWSx/wYb6QwCbtYyagLmCD3in25bAMiHis34h8WIAZkO
 EneNKkgwZdAi/5mQl1UaKiEJDcroCT22S2O1QCh2ai5XebvjPDlZzlzUK0aURX4pO+az
 fLDw==
X-Gm-Message-State: ABy/qLZpeUJ4B0LJxfJm9hUJdmCa65rZrdT0n42OVTy4pQIcroeAgPO9
 4Yc2jQw1V947x5UKOYnkLWs=
X-Google-Smtp-Source: APBJJlHCe0dYIQRNUPOiWsNip1lqerBaA6M371j3mQZBtlg6icpfQ1ao2XrDcq24IliOaCsmOVeg6A==
X-Received: by 2002:a05:6870:a40a:b0:1b4:4a2e:b698 with SMTP id
 m10-20020a056870a40a00b001b44a2eb698mr4386468oal.47.1690006036749; 
 Fri, 21 Jul 2023 23:07:16 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:58e9:afd6:100a:624c:cf38])
 by smtp.gmail.com with ESMTPSA id
 y12-20020aa7804c000000b0063b898b3502sm3886060pfm.153.2023.07.21.23.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 23:07:16 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com
Subject: [PATCH v5] selftests: rtc: Fixes rtctest error handling.
Date: Sat, 22 Jul 2023 11:37:06 +0530
Message-Id: <20230722060706.79759-1-atulpant.linux@gmail.com>
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
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
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
