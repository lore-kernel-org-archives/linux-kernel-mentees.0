Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB12A128395
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 22:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174492; cv=none; b=biaDGoj+bcxtfN0SYcE03fhRWNu+AS1NWRgQg/IsefjGnXg6kv4jZEjhXT2537ZL4kdZAeecSDA9qDx0At38dtpzIw5S/4wq1kwq44atjoz9kQ8RTcJfVgxkEzs2fJWvZl+qqTOOowhtPBz442nuzbzl4EU7FYdBF/el3hQo8ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174492; c=relaxed/simple;
	bh=maKoMyNUptWEACg33q1vpy/GSFWTvEqnX6P66Eb3NJE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WMkr9/G7ULCweHEfu+RdrXnx01I7zxnw3Fv2U+TvGdcalYQ2uEgDiJvMMWvLs9m0lhgP7HVltj4APuH6tm9uvWQG1CUMPF629t6lNKMCxEgQANo3ArgiAwCBkI+Rgk+/cPD0pJxHocMErNL1UGH0boVoh448Ip7ViRjRlOmUHfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvxGEYLp; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvxGEYLp"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a0b4907a28so915211f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 15:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747174489; x=1747779289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z6twoJszxPLDnRSsZ54kwRwjtDyPeTyb0lPKYWaATxI=;
        b=cvxGEYLpNV7kMqCts0ttGVSk+An9EwROkGo9MBu83HaH0J5lOyq6P3jkY3Xbhh9BKC
         GgDIMAFMU42JZ86ndXWjJ7KnExxZCLaqB4j4jNVin/3+c2cPwWuyJooWkS/ngVEPcuJR
         Fc/3EBKxu+Muvpo5X8WWhGYUtq+j177F72qby20hfili9zDwXp/69SuPwY1XoopQVzmb
         um9POWuGGNNj4sCJsuskZwjXtrwQnZRugtGQTkffUFbW9caehQXVPkFKpzmE9yMHidjI
         CjIKxoErIaThVkcUL2IxMfVw8zaQ2fMT1n2GUWnmiIEi6B7VsEGCGV7wRRbXb3uPCzuf
         2q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747174489; x=1747779289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z6twoJszxPLDnRSsZ54kwRwjtDyPeTyb0lPKYWaATxI=;
        b=m5OPqyt9jHMCrI6KeqvxqiIu3xZIgebuyt8AL3OtfFYmJqTR3ypikoY0vZmzGPuEl1
         wAMuXNzSmwjGlcDUkeXX3hIKD4Mg3qdkeOCG9cfVJJsBlOkUZDJyOa+6Tpf36jny81Ir
         GyPu+ivGyEirgSFtxwZqbXh7hlLJLv7aAdTtaqQXAE3kDU6f3/5JhRwW39qrYfr4B441
         U+w9nOBO6FyiXmSVtp9Vt3pdWjxmDRXWcoad7IO5xD+0lU5B2cJQZOV6CZiFdMvwhQmM
         czD90YkVyupNwAxyNukh+JG3Xxw/TgKBUyMGuLR56wUeW+eeBshwD3J9fxtejRcA2WpJ
         61eA==
X-Forwarded-Encrypted: i=1; AJvYcCV5LFnxna6K2BwbWc7dCGFYRBuHZcZbhcDVxesk4lCwFG301+e0YmLSy3mED+srMxlD+3WcdJwSp6OxsGSLceFnF8y2zg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMt+fsVzZZzjOXiD2dIZBhCVW/sK0BtDheR3uz8s9mA00doa+k
	egRb1rpe5+ez11shBo/CchiwtpnygvRxeZGMADm09HhSISMILMpL
X-Gm-Gg: ASbGncuusEsPRCU1QnVRl9RYoUMNmtAGuOYdIrJ/7xPu7C4RFTwJmw6da2Nd6DutZ9o
	SbrgzVd/eHPVDfmHxEmx46iwqxEX51kVBmr2rMOoa/F4uS0At4ZOEhC+dze3yGnnFCfEd9MYycw
	CNaDVDf0qNRSkBGhEDc1KKOFxSuYR7GXuqKLE15N7tm/FoOYrP1iiVmf7i36nDtCKUjwlSqJV3p
	mKsog3Nalodpd2RELBc+eeU9Gg1gscSvCOfnXDLQDNdxpK5L2ruSIiipAD3WBt9FYK9DdbZ1jws
	J7Dut4oZZcO8GT9NaQz0MX2e4TPAJvzSokLRVll8SBckhe302kGeTKyC5bWmroAtGacPjMSryse
	+Inpc4vdP/FI8
X-Google-Smtp-Source: AGHT+IHgrMjW9Ba1gwxGTJLcFIR6YYXzawIfwNKz16y8Eau2B+r2Bk5p9TNdYT7x/IbG5+ngKJe5SQ==
X-Received: by 2002:a05:6000:240a:b0:3a2:133:b1a4 with SMTP id ffacd0b85a97d-3a3499454c3mr257125f8f.13.1747174488910;
        Tue, 13 May 2025 15:14:48 -0700 (PDT)
Received: from localhost.localdomain ([102.44.114.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951a97sm3194375e9.23.2025.05.13.15.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 15:14:48 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
X-Google-Original-From: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
To: shuah@Kernel.org,
	skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
Subject: [PATCH] selftests: acct: fix grammar and clarify output messages
Date: Wed, 14 May 2025 01:14:26 +0300
Message-Id: <20250513221426.303691-1-Abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch improves the clarity and grammar of output messages in the acct()
selftest. Minor changes were made to user-facing strings and comments to make
them easier to understand and more consistent with the kselftest style.

Changes include:
- Fixing grammar in printed messages and comments.
- Rewording error and success outputs for clarity and professionalism.
- Making the "root check" message more direct.

These updates improve readability without affecting test logic or behavior.

Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
---
 tools/testing/selftests/acct/acct_syscall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/acct/acct_syscall.c b/tools/testing/selftests/acct/acct_syscall.c
index 87c044fb9293..2c120a527574 100644
--- a/tools/testing/selftests/acct/acct_syscall.c
+++ b/tools/testing/selftests/acct/acct_syscall.c
@@ -22,9 +22,9 @@ int main(void)
 	ksft_print_header();
 	ksft_set_plan(1);
 
-	// Check if test is run a root
+	// Check if test is run as root
 	if (geteuid()) {
-		ksft_exit_skip("This test needs root to run!\n");
+		ksft_exit_skip("This test must be run as root!\n");
 		return 1;
 	}
 
@@ -52,7 +52,7 @@ int main(void)
 	child_pid = fork();
 
 	if (child_pid < 0) {
-		ksft_test_result_error("Creating a child process to log failed\n");
+		ksft_test_result_error("Failed to create child process for logging\n");
 		acct(NULL);
 		return 1;
 	} else if (child_pid > 0) {
-- 
2.25.1

