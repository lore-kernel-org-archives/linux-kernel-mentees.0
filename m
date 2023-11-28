Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9C04438A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 21:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJaVm3fo"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4BB160C23
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 21:02:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4BB160C23
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UJaVm3fo
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dnsCNmpE3Del
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 28 Nov 2023 21:02:32 +0000 (UTC)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0B15760C13
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 21:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B15760C13
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-77dbb976149so71037685a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 13:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701205351; x=1701810151; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+7egZpgbxWlQy7x1pNLLDFc7cb12zF09MZ6gXGVBBI=;
        b=UJaVm3foJU5cOEKT9zmrhJW1IJZBE6ii4z54aBksSbjeSt3srk0a6XGrH8/85DcZNw
         aE3XXbOBYV49U9qxqh9vdSxvjgphCFmdMRGbeGFszyAlyEz8vB0jF3Df6cTqeSwXbeHI
         FMil8+b1hph04pwSUB9kEech5ZAdFAOb6bUibNbWZIhlGno3pLDUiauexIZ2c3Xnr1qx
         PnQaA7jwpYa2aIA2KAbnDJCAXEBRfNr2oV/YNnHuZ1vm/xBKiwdVlt78xvg08c/p9g7H
         6oEpmgXGwcM49BeieYr1m3bGqSCQ6yNpt2Uu+IjQnl4y/mW6Tu884jW7/+OSTj1PX6eX
         Yf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701205351; x=1701810151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+7egZpgbxWlQy7x1pNLLDFc7cb12zF09MZ6gXGVBBI=;
        b=S1Ami96JPcfJoknLxHknvRCZcXFhESRDgt+84+RSlUOVMpTaQpCOFFFXWgDdSZdd/P
         Zf44IWHLMfW7h+gTo5nPSWq9ZN5rNtkXXMvS+ThYVd5z6l7/H/YbnI/iYfmAAk/tEbfO
         F94BWorF2y3GEcKFSyPJ5oMbNM5DlD0JhOfjG/pR3Bi4K/C6mJ/yPBJA17CmTb1RjJpF
         sLeNveZGtM50tVqdp5Ho9cHFDwlvPOfqUluC8Krz2287eVcwwYIKw0Ymqv/GwB+dKnaN
         SirB+9S458CN1JKGcz3HK9kuLi2PRmcB2VW44SkpL7gdAQANRi1O49raHzyMafeS2pAk
         4BpQ==
X-Gm-Message-State: AOJu0YxlHsu9mOBXeKj0cfXwvlXjfgPGTjJN8fxCDE5iNix2NWCcFbuw
	GAE8GlyjH1KbPUILfcJXS3vQQX4+YtRSxg==
X-Google-Smtp-Source: AGHT+IHvdIQ4P2xpE4t9kourHMRIG+9XmyoLK1o6I3iLJdpNg5Ta7hWYSNzjXm+dS0DJM+V4QqLfbg==
X-Received: by 2002:ad4:5cc7:0:b0:67a:4da4:e23c with SMTP id iu7-20020ad45cc7000000b0067a4da4e23cmr8302455qvb.56.1701205350707;
        Tue, 28 Nov 2023 13:02:30 -0800 (PST)
Received: from angquan-linux.. ([72.36.119.4])
        by smtp.gmail.com with ESMTPSA id ee17-20020a05620a801100b0077d84ad9744sm3748037qkb.36.2023.11.28.13.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 13:02:30 -0800 (PST)
From: angquan yu <angquan21@gmail.com>
X-Google-Original-From: angquan yu
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	angquan yu <angquan21@gmail.com>
Subject: [PATCH] Fix Format String Warning in breakpoint_test
Date: Tue, 28 Nov 2023 15:02:06 -0600
Message-Id: <20231128210206.56868-1-angquan21@gmail.com>
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

