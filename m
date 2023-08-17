Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3713C2FC14
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 09:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A0783AAB;
	Thu, 17 Aug 2023 09:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24A0783AAB
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fwKiamlC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeC7i-6v2IhT; Thu, 17 Aug 2023 09:14:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2ACA983AA5;
	Thu, 17 Aug 2023 09:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ACA983AA5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09DD7C0071;
	Thu, 17 Aug 2023 09:14:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BCC7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5988841811
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5988841811
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fwKiamlC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDc7BGiVt2Et
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:14:10 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B76904180A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 09:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B76904180A
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1bf092a16c9so7001495ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 02:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692263650; x=1692868450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e04hSPseH7pUtZ8Q4dNZi4YT1I9WSaKa5frJZEb/LHQ=;
 b=fwKiamlCWmajJvC2NbSMZpt/3IOu6EhqkeaupS1E/8NArhiX/pRCbqcAyTGoqmrOre
 tVpNXRe7/h8fefJwhvMwU6lAnvcmGZKiBqj0Hb80HApSA45il0wPc1JJmz8FkCxfmNSO
 ar6aspeGewsr9TIWXU0adNv+Gk1sd13aPi8SQdxfKKJtlmlkEsW0Fqm6sOOY33276t+Q
 eULKk2s54DByZxpqhvACtwygyEWIOxh5kpscOdRt+qD878+Ck+EwRsvuyaWlmphgZJuy
 5BYD4rh0UHchbyIDloCpqhteW4QrB27/FT+eVihQJUdvTqxKaBt1V1c5HrrLCPU47L5H
 LwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692263650; x=1692868450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e04hSPseH7pUtZ8Q4dNZi4YT1I9WSaKa5frJZEb/LHQ=;
 b=J4dtf1fwW5AiWmYVmvRMSeLcXVXQxw1GJWf3kYGYY2EVntJrIYuiiHXOMRtxDEDB4Y
 oDsKN514QxUQCWH9n/GJadEHxURFDNSb4m3dtqzBVJWkee3VubtxhxpwWpF57UjTfXbJ
 Nk1XD+DA2v1WNbcTMy9R+nRdzUxvQicBTiNdB7OZ7HMLk/1wajmAjuOOWxbegehhrn/V
 v/tomFf1yQNzSuSLX1N54GTmC8861XippM7IiNnTchNvTbeg9pmgSZHo5FfDTLWQ9drR
 vx2cwkHmkfRboFRM7rV5nArCOvt0R9U21Tq8EgV/FVt2Jl3keJ1JBgd5ifp9Xl/HRK+B
 jeDA==
X-Gm-Message-State: AOJu0Yyj4lYECRwUGslSbUdJzJdgla5x5f/JKFb4C6+YIZAX5K3hfg0z
 EKZfYj0X9+ml01wJ/Zq/kgU=
X-Google-Smtp-Source: AGHT+IG+fTqswvdCEIhpfK2tXpwnLGPY1Hn2+4eU7euHhpyG6hJUIVFgdEdfUueMRgW1rOXVOjaWtA==
X-Received: by 2002:a17:903:2310:b0:1bc:5e50:9337 with SMTP id
 d16-20020a170903231000b001bc5e509337mr5845311plh.53.1692263649918; 
 Thu, 17 Aug 2023 02:14:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:58e9:1afa:cf81:3a3:6ec8])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a170903228d00b001ab2b4105ddsm14669575plh.60.2023.08.17.02.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 02:14:09 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com
Subject: [PATCH v6] selftests: rtc: Fixes rtctest error handling.
Date: Thu, 17 Aug 2023 14:44:01 +0530
Message-Id: <20230817091401.72674-1-atulpant.linux@gmail.com>
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

changes since v5:
    Updated error message to use strerror().
	If the rtc file is invalid, the skip the test.

changes since v4:
    Updated the commit message.

changes since v3:
    Added Linux-kselftest and Linux-kernel mailing lists.

changes since v2:
    Changed error message when rtc file does not exist.

changes since v1:
    Removed check for uid=0
    If rtc file is invalid, then exit the test.

 tools/testing/selftests/rtc/rtctest.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
index 630fef735c7e..27b466111885 100644
--- a/tools/testing/selftests/rtc/rtctest.c
+++ b/tools/testing/selftests/rtc/rtctest.c
@@ -15,6 +15,7 @@
 #include <sys/types.h>
 #include <time.h>
 #include <unistd.h>
+#include <error.h>
 
 #include "../kselftest_harness.h"
 #include "../kselftest.h"
@@ -437,7 +438,7 @@ int main(int argc, char **argv)
 	if (access(rtc_file, F_OK) == 0)
 		ret = test_harness_run(argc, argv);
 	else
-		ksft_exit_fail_msg("[ERROR]: Cannot access rtc file %s - Exiting\n", rtc_file);
+		ksft_exit_skip("%s: %s\n", rtc_file, strerror(errno));
 
 	return ret;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
