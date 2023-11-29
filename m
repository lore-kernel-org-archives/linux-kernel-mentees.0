Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A9D53B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 03:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaA8p3D3"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE2CF60BDB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 03:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE2CF60BDB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DaA8p3D3
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JigCpFu6RIM6
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 29 Nov 2023 03:57:49 +0000 (UTC)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0A52260BD8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 03:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A52260BD8
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-41cc537ed54so34170971cf.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 19:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701230268; x=1701835068; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+7egZpgbxWlQy7x1pNLLDFc7cb12zF09MZ6gXGVBBI=;
        b=DaA8p3D3wxy3GJ4rrL/oc8QZ6Tr5p/vGq5+PMGHuPmjpPpZFnS1SimHQwG9eoeU0+0
         0ScA7HqF/Ww9ptvU1mN1ILecr1ip/WC52EQBR4FX4/Xdt5GrfREk+jYVu9t5co3ktvHO
         kqfheJhzH1YCIWHlIxHTGRATvDhoTPmzw+yFCSonXPOkaLW+Rl4ZIlzg2iWEBIa9sPPO
         gQlRIRirTeB9yvgjPoRKJMavkTM736gZLuONefPQi5HMPDDY5GGKEDraoDCZ2ScUkUqC
         Sv5uXUrkXijGtTEdAV/HJK3m2CP6f/wMIslUldcuySgg9/smL3G5nKp+A3Ohjk6yk5Jf
         DA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701230268; x=1701835068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+7egZpgbxWlQy7x1pNLLDFc7cb12zF09MZ6gXGVBBI=;
        b=wVCEcVkPfUYwITuKMnkyfF5wdOQMty3i0HzYjkNqeYiHlGQX6ILhDIkSy+KwfXs7+0
         w6Z40lWuFd7IBUDIfnNpxyZfy4Dd1bWBjxPc3pOO+q7BecybFLGPyQ7o2QIAiRoqKHrn
         grye0xBbJMuAvIpkdlOBC9XQAiESpjP3NBBsTlOKwr6kereWrFaHOqmxbnGSjXCyisdE
         R7DD1biq/iTLbch+ZhUD1B+AAEyjeYOfM42gysOwT/LLLMEY6k/7Lr3fhLhvih9G1uqJ
         6AEnnGs6kA/uf5W/JeIiFfj8c/N7065bFy7q/+wTbf7xS+a+SbReuPlzk7q1mpcqCQ/V
         og0w==
X-Gm-Message-State: AOJu0Yz2TV3Uma1dWxt0Q/01I37xZ/uMLUkw62aAa4iWSqn+k7eQv343
	fttDFl3u5eOXZaLzaH/Trq8=
X-Google-Smtp-Source: AGHT+IH2nerrAbR4UKFseuAz9tLLm1UezMyHgCtiGQv6I9Y3LrgtI+O5AtNwduG/CvW9qzCpzSFXtg==
X-Received: by 2002:ac8:4e81:0:b0:423:852e:8273 with SMTP id 1-20020ac84e81000000b00423852e8273mr21762989qtp.61.1701230267865;
        Tue, 28 Nov 2023 19:57:47 -0800 (PST)
Received: from angquan-linux.. ([72.36.119.4])
        by smtp.gmail.com with ESMTPSA id i10-20020ac860ca000000b004199c98f87dsm5139943qtm.74.2023.11.28.19.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 19:57:47 -0800 (PST)
From: angquan yu <angquan21@gmail.com>
X-Google-Original-From: angquan yu
To: skhan@linuxfoundation.org
Cc: shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	angquan yu <angquan21@gmail.com>
Subject: [PATCH] selftests:breakpoints: Fix Format String Warning in breakpoint_test
Date: Tue, 28 Nov 2023 21:57:26 -0600
Message-Id: <20231129035726.6273-1-angquan21@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: angquan yu <angquan21@gmail.com>

This commit resolves a compiler warning regardingthe
use of non-literal format strings in breakpoint_test.c.

The functions `ksft_test_result_pass` and `ksft_test_result_fail`
were previously called with a variable `msg` directly, which could
potentially lead to format string vulnerabilities.

Changes made:
- Modified the calls to `ksft_test_result_pass` and `ksft_test_result_fail`
by adding a "%s" format specifier. This explicitly declares `msg` as a
string argument, adhering to safer coding practices and resolving
the compiler warning.

This change does not affect the functional behavior of the code but ensures
better code safety and compliance with recommended C programming standards.

The previous warning is "breakpoint_test.c:287:17:
warning: format not a string literal and no format arguments
[-Wformat-security]
  287 |                 ksft_test_result_pass(msg);
      |                 ^~~~~~~~~~~~~~~~~~~~~
breakpoint_test.c:289:17: warning: format not a string literal
and no format arguments [-Wformat-security]
  289 |                 ksft_test_result_fail(msg);
      |    "

Signed-off-by: angquan yu <angquan21@gmail.com>
---
 tools/testing/selftests/breakpoints/breakpoint_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/breakpoints/breakpoint_test.c b/tools/testing/selftests/breakpoints/breakpoint_test.c
index 3266cc929..d46962a24 100644
--- a/tools/testing/selftests/breakpoints/breakpoint_test.c
+++ b/tools/testing/selftests/breakpoints/breakpoint_test.c
@@ -284,9 +284,9 @@ static void check_success(const char *msg)
 	nr_tests++;
 
 	if (ret)
-		ksft_test_result_pass(msg);
+		ksft_test_result_pass("%s", msg);
 	else
-		ksft_test_result_fail(msg);
+		ksft_test_result_fail("%s", msg);
 }
 
 static void launch_instruction_breakpoints(char *buf, int local, int global)
-- 
2.39.2

