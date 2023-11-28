Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C80444C9B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 21:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewK5XUWu"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 223034012B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 21:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 223034012B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ewK5XUWu
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBymEXsKTRlp
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 28 Nov 2023 21:49:04 +0000 (UTC)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1FB9D400FF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 21:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB9D400FF
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-77d84f8808dso241036185a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 13:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701208143; x=1701812943; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9gRjgH2cK5ajZRSCUmFV/9aCVUL7685vwmsd3v9kOPs=;
        b=ewK5XUWukGOJF9ZrK2RpKsdFT8aVAaPMAXuJypnYpLy8YkryGP4GUlb1foG7UfiZ4C
         IH05HSryywzyfC0jHVUFxY+ImOhNddJnyc2uiaI5JqEBBUNFeLH8aTin5b9QmF/KcvrL
         jfOmwASguMYp/SFFWe50CX5pyDs5Im/DNdEgh43WiG84o4Bv+tZR4jOFBkVX6SXyTaGG
         LswAjH0YGUZl1GiuJlOmOdurCFO5XQSB3HK07E97HyVTaFMU2JxoCQqyILF8cpfTNa+q
         843rPDICqqvrzoISYDtueofTtiS2gJ3E4+4k+qgLeEI9E5C+0b7qu/PSnniAPal0Q9/h
         QJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701208143; x=1701812943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gRjgH2cK5ajZRSCUmFV/9aCVUL7685vwmsd3v9kOPs=;
        b=UCUp9m5OBQHG7KQ02WLdW6WIMAwTDWOKxPSOpqbYzMSJE2MlEw57htElPJLmABYUd4
         88RL4w4Nouq1eSQfkmosFUPJFzd50ahq8rJWcVBQcYL/NEkCtHYsjwOzqbQUaU55pRmN
         OU82wo/G0nSfdgTuUoJd178WsmdsqayVFKw/n2Pzmj+aPNnxLoiIjGw37LNdwHh3xE+H
         5oyLIYpv6NLLzys2m+FJf/PfjDLmMUQ9BAvV/uwVBsjlrhINcWO13YX5p94CSsr7yVzI
         Bi/r1jI32HF9u2ow9YgEZHQTse0bVSUMT8f4VcO5q5sj6jKtqtR4GKKgd3rnTvFgz+vO
         QVlw==
X-Gm-Message-State: AOJu0YzNpHtYPdha0zbQ1G5lkMbYrC19Mg6BuniZtWCN8llzgiTQ46Bp
	gkBmEq1wdhPukI2qhSK5eM8=
X-Google-Smtp-Source: AGHT+IF0QxaAgFEtr+edYeVMZIhTSIblAJXMe9mRtYqbJ1nR/ptVUp8eCqEDMQecAM9siqeXFXzZUQ==
X-Received: by 2002:a05:620a:2d89:b0:77b:9bf8:b0e3 with SMTP id tr9-20020a05620a2d8900b0077b9bf8b0e3mr14237057qkn.27.1701208142987;
        Tue, 28 Nov 2023 13:49:02 -0800 (PST)
Received: from angquan-linux.. ([72.36.119.4])
        by smtp.gmail.com with ESMTPSA id ea11-20020a05620a488b00b0077d93c7c785sm3131141qkb.119.2023.11.28.13.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 13:49:02 -0800 (PST)
From: angquan yu <angquan21@gmail.com>
X-Google-Original-From: angquan yu
To: skhan@linuxfoundation.org
Cc: shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	angquan yu <angquan21@gmail.com>
Subject: [PATCH] selftests/breakpoints: Fix format specifier in ksft_print_msg in step_after_suspend_test.c
Date: Tue, 28 Nov 2023 15:48:54 -0600
Message-Id: <20231128214854.60362-1-angquan21@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: angquan yu <angquan21@gmail.com>

In the function 'tools/testing/selftests/breakpoints/run_test' within
step_after_suspend_test.c, the ksft_print_msg function call incorrectly
used '$s' as a format specifier. This commit corrects this typo to use the
proper '%s' format specifier, ensuring the error message from
waitpid() is correctly displayed.

The issue manifested as a compilation warning (too many arguments
for format [-Wformat-extra-args]), potentially obscuring actual
runtime errors and complicating debugging processes.

This fix enhances the clarity of error messages during test failures
and ensures compliance with standard C format string conventions.

Signed-off-by: angquan yu <angquan21@gmail.com>
---
 tools/testing/selftests/breakpoints/step_after_suspend_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/breakpoints/step_after_suspend_test.c b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
index 2cf6f10ab..b8703c499 100644
--- a/tools/testing/selftests/breakpoints/step_after_suspend_test.c
+++ b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
@@ -89,7 +89,7 @@ int run_test(int cpu)
 
 	wpid = waitpid(pid, &status, __WALL);
 	if (wpid != pid) {
-		ksft_print_msg("waitpid() failed: $s\n", strerror(errno));
+		ksft_print_msg("waitpid() failed: %s\n", strerror(errno));
 		return KSFT_FAIL;
 	}
 	if (WIFEXITED(status)) {
-- 
2.39.2

