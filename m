Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3E91C1F2F
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 21 Feb 2025 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740133339; cv=none; b=MtjAGYPQrPNpNYGH0TAyhnV69NbgdssfJV4h7XMb9uhcG7qJr16Fcaa6w5B9snx05aDxUYt8fVNClUn5C6f6q2QQ2utIMRHtN/AtXrUNLaWSUOJcgMaHdRnMaDdOWAzYbO5ngLcjWImdCkjmrOFIW/CSH4fEuVrflEYppVuCDjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740133339; c=relaxed/simple;
	bh=Sjc1BaSMeJRPeCcL/epzdtctw6/nuuB3OAwal9CBkZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HJ5vA6M3p2sQupnYwGnv8GtOjY0PXUZsZvCLsdzK2d7v/dZAbIRklAknb3+VQWifcIw4eACJ0AJbv3CgNXJ2fAefLyZKb+VlDqPnmAz3PorEMqyfiVeIi+aXhs6oREpiZGDTs3V0RsGEhgrlzmZge9dNX8YnLnlwBZaJMl6AKgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EY4L3sGD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EY4L3sGD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-221050f3f00so40659275ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 21 Feb 2025 02:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740133335; x=1740738135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BUiInESylQ443K1PbNMFuTYC6xpLt2zG6UzEqWDU58A=;
        b=EY4L3sGDHBJMpxxwSS0K7p5YLs9XjY1gw7LmYa7WhdfXOO5lRVOEWXoyIenSnwuTnW
         tYQrGhaGajUtDlLJK1KK+JPlyMPxn4LdGvgTgpN/fIwKiwg7KKcpCYC9yyWAmmforn3Z
         qwVNHUaJ97UXRnVwc4AMzH5CPS82FNdelPQC9e3L9tptw4qFu/Fx1dcOLUKoXmZY1AIQ
         K3UXjsnBoCGFRkym7JIxdingjDpxHvPR7gC4X/zu/U1KWXa4vX41ep2hyL9Lv+7SqsUT
         5BBqAigZU+CFItYhMiVLNrS0RKIL9+7VClg9JSYR1fUlHnmx+6tAiC9wU/5YaBlMY0I0
         kl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740133335; x=1740738135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUiInESylQ443K1PbNMFuTYC6xpLt2zG6UzEqWDU58A=;
        b=lojGn5fq4RYLTmf0YPf9YdLOBy6M1hSnMGw4CXx4a8Ysv3aUMHcrJPkZ984kAW8bad
         E1ETL6WFcMM919HCHA4GYut9DBve9zN3UpPZZ3U2HIXwlIsOJw7rc4aDjQMGwatAbXuB
         JI50jSUuxR0HHo56potYyZpxAuDBj6coSket3EZhootVF8w4sj+zZBqr0B5jTGNSXamm
         AsjHSy4GHx9MaAcNA4+CACyOswIeolDsBYYvHt0OGM4hX3rx6KjWUicSKcfGFxZhY7nP
         R+YJKW3+MDvsbZh/7tUpzYHUELcQYcQWCgJGlH7H38d2mBX/Ax2xWAn/PLGQfgx4vH99
         LRYA==
X-Forwarded-Encrypted: i=1; AJvYcCWcld+db7lurS+KzcINlB1lf1UWxcTpkt55Zehn5EL7DDcJ7yzUFsCnXNYYsc5CwRa57YMeBAK3Yt1dkgpc63QhTRDKWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ7vNervie78Hbc86lDzzvUJ+fbiMna3u5ObscS5KjRb3mpU/v
	a+e91WpUM5hRG2+L26aGZR5KSMoslA82SDdRK5e31WB96KXGyaNc
X-Gm-Gg: ASbGncuPBmdLsua+ikkFEhWFdF5jXWGjKJpGEQb5ysCIDPqieVqTX/3YGtxouAvGmTM
	bGDlxmbMYOZm+offml8uQCMwK1evZ1Z3CG+95GJIs3y48OhrI3lr3vV5D/aEvI24uJJMbImg+F1
	3Kz2rl/dlO81WcnFpRUH3fq5PLuD//qsu14LaKSYdJYvugrFGRnEKGn396wXiiYvi9WSCudyt4L
	bkUwCizVZbudKBdjBg3ceS8kRGIxp4rZOuj734bKGzFcU+gW2VGqBp3DFsq2QtkD8qiBMuDdvt4
	IGLxYsTzzjH4JZVevwhw/dI/TdW178AH7nhwPScq+lTYfRw=
X-Google-Smtp-Source: AGHT+IHDNNa9+STTHVJu9rG3iYk4wdYRkirFxgdhDuCzUpvTXWsEe5U1+ypJwPqU6S1lu1S8FtE5Xw==
X-Received: by 2002:a17:902:e5d0:b0:21f:9107:fca3 with SMTP id d9443c01a7336-2219ff5efccmr36540465ad.30.1740133334784;
        Fri, 21 Feb 2025 02:22:14 -0800 (PST)
Received: from localhost.localdomain ([14.139.69.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2211d4c9c64sm87690365ad.214.2025.02.21.02.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 02:22:14 -0800 (PST)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: kees@kernel.org
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
	joel.granados@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH sysctl-next v2] selftests/sysctl: fix wording of help messages
Date: Fri, 21 Feb 2025 15:51:49 +0530
Message-ID: <20250221102151.5593-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix grammar such as "number amount of times is
recommended" etc -> "the recommended number of
times".

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 tools/testing/selftests/sysctl/sysctl.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/sysctl/sysctl.sh b/tools/testing/selftests/sysctl/sysctl.sh
index f6e129a82ffd..db1616857d89 100755
--- a/tools/testing/selftests/sysctl/sysctl.sh
+++ b/tools/testing/selftests/sysctl/sysctl.sh
@@ -857,7 +857,7 @@ list_tests()
 	echo
 	echo "TEST_ID x NUM_TEST"
 	echo "TEST_ID:   Test ID"
-	echo "NUM_TESTS: Number of recommended times to run the test"
+	echo "NUM_TESTS: Recommended number of times to run the test"
 	echo
 	echo "0001 x $(get_test_count 0001) - tests proc_dointvec_minmax()"
 	echo "0002 x $(get_test_count 0002) - tests proc_dostring()"
@@ -884,7 +884,7 @@ usage()
 	echo "Valid tests: 0001-$MAX_TEST"
 	echo ""
 	echo "    all     Runs all tests (default)"
-	echo "    -t      Run test ID the number amount of times is recommended"
+	echo "    -t      Run test ID the recommended number of times"
 	echo "    -w      Watch test ID run until it runs into an error"
 	echo "    -c      Run test ID once"
 	echo "    -s      Run test ID x test-count number of times"
@@ -898,7 +898,7 @@ usage()
 	echo Example uses:
 	echo
 	echo "$TEST_NAME.sh            -- executes all tests"
-	echo "$TEST_NAME.sh -t 0002    -- Executes test ID 0002 number of times is recommended"
+	echo "$TEST_NAME.sh -t 0002    -- Executes test ID 0002 the recommended number of times"
 	echo "$TEST_NAME.sh -w 0002    -- Watch test ID 0002 run until an error occurs"
 	echo "$TEST_NAME.sh -s 0002    -- Run test ID 0002 once"
 	echo "$TEST_NAME.sh -c 0002 3  -- Run test ID 0002 three times"
-- 
2.48.1

