Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2D535268
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 21:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yod0zUUn"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 789974012E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 21:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 789974012E
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yod0zUUn
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a-xvgj0bmV9z
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 28 Nov 2023 21:36:18 +0000 (UTC)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 87C39400FF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 21:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87C39400FF
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-77d85cf1ff5so226134485a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 13:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701207377; x=1701812177; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+7egZpgbxWlQy7x1pNLLDFc7cb12zF09MZ6gXGVBBI=;
        b=Yod0zUUnnx/bAG9eCw/jZE/WyLPJdLg9lCfGTjwUPcKq3AifH/3h1BWK8xP7tM/GpP
         PtusO8Y1X1IzLfw4qnKXMkHzhBDNFqvBZIV/G3ppVOqRL9IVCAADeY82xX6ek3yHK5Oe
         kepYJgCO9RZB7kLRtvjYwe9ZH0/L+bd0xeBzmjiiV+69wqJXLHmfBVMwV6pnbephJxGA
         AXjN3il8L3uKbNCKIQEZcojOsMZBZSyzpt5dSvGUISjfdm12MXd3U3i5oeoWpJfaoeh8
         Y0DkZcadBTs4bLErdoEITnZGg0LkzuZEfYUuNlhw3qKWxKBCjDM2y34w85ZVmGRyzb+S
         vx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701207377; x=1701812177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+7egZpgbxWlQy7x1pNLLDFc7cb12zF09MZ6gXGVBBI=;
        b=NN8ozt/LrBtaahEV0wmyT7OS0IDJPLJqXWPUbTgzb7/HuBEWcgC5VLguD8ww0PUnCz
         oSs0Bonby/2A6K372IHtuFS+5XtK5jdzgxMG/+NKc0dQwMttmIOnEgh8vJxGqHf9RX5P
         iLwr4/4/WZKMm8I90LzhF9AMy52OaKy40v+0Ja5u/L+OAIW+vrOkEATQLNjHZlJJRfsZ
         zPOdsJbeFkQ6qH0ZUTOA9T8W6N+ZeU5pXFz2FstdswIBJzWt70UXCAfbgUwJPwGqrRH0
         wiNIK8jInVWUwYxGmhScvsDxM9Z0Pph5BHFDUlpju7I/Q7h3RUjv2ahYmhIIsRpj5YtR
         hOXg==
X-Gm-Message-State: AOJu0YwfOAmjqN/3DbnLNYrhbc9QrfLQDdi8mn9DBMXM9qk2GsBJ3OyW
	cTrrOMV/gZs5nepKHPczGdM=
X-Google-Smtp-Source: AGHT+IGezPzPpBB7DD09TuoxH+6HfyyvNO4ke1lW5qOxroc6VuYdtXuB6VytQfYAYI66586Qug016w==
X-Received: by 2002:a05:620a:852f:b0:778:9156:3f07 with SMTP id pe47-20020a05620a852f00b0077891563f07mr16334065qkn.24.1701207377382;
        Tue, 28 Nov 2023 13:36:17 -0800 (PST)
Received: from angquan-linux.. ([72.36.119.4])
        by smtp.gmail.com with ESMTPSA id q5-20020a05620a0c8500b00775bb02893esm4819851qki.96.2023.11.28.13.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 13:36:17 -0800 (PST)
From: angquan yu <angquan21@gmail.com>
X-Google-Original-From: angquan yu
To: skhan@linuxfoundation.org
Cc: shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	angquan yu <angquan21@gmail.com>
Subject: [PATCH] Fix Format String Warning in breakpoint_test
Date: Tue, 28 Nov 2023 15:36:07 -0600
Message-Id: <20231128213607.59587-1-angquan21@gmail.com>
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

