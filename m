Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F18B2B9A6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Oct 2024 22:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728167113; cv=none; b=Tb9PxNim0GR4Yi0EWKKx7LUWkLrFvloyxkHYmrDmWJ57nLe7bRRKoHCBJtN/wWMBYU092H+2UrFFLcIiLW7WG4n4rpgywDv/0/t+IfXYxGZRAszmN+Ugvo79kx/cP6kIKhSvQYCLZIQWY1L6+PKBkzxRgyUv1aBAAWWlENkDvfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728167113; c=relaxed/simple;
	bh=q82pZifR1W2blH4N/+nd55gnwNOI6BUTGrkjzF+o/b0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FLX0V5+6zDDgxIAKEQbEoHEFegEjHGSeLdgmDL1a2EIQBOAF25tPw0ijksfv+LsfsCwdOvSubkjFK1WPJhHUVW3q6s+ziffxCgbj3fzQX+ygVJnfjMTnTvrxSTFEIYE5TVe0uo3/7IM/DYd9VwVqW/FYr0qswl4dChjxS5ryFXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOEJIjbx; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOEJIjbx"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44F204026A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Oct 2024 22:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4cbjB0ZxgfP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Oct 2024 22:25:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6ACE2400E5
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ACE2400E5
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jOEJIjbx
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6ACE2400E5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  5 Oct 2024 22:25:10 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-84ea658b647so1031433241.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 05 Oct 2024 15:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728167109; x=1728771909; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TDfiCHkM6iRNBN2C/aIKKCpm5M7jUVZxqO9j658Fvlo=;
        b=jOEJIjbx7yLhHEIGDGdYHZhOXVP+IdKM5NHmxG+TCqjZRrzaqhsz6nwNB1W0iIkfS5
         cCS2GbNhJfcKWXtOtX3Hb/N84P8ZgpLQu7JiTJ0pE66sJwsjkYK65ggKm+jhDO4kumRX
         dcd7gBIwjZT/CNh3cMiuuyDK0ZLIMrK2J5hY14GCF84jnpqHHGnP1q1648Mg0bw2DrvV
         2AXPWvMiaeUIQtesnIuM9hPXaNHTxir8tZkNgmtuS6yIS3s2Ibkx9qN/KYJzr/7g8G3+
         etDu2mregp41IkDL8ZhMF+IjXa8SZtFg5jdp0poppBjAtXGvGmFvmead/2lt1sFOmNVj
         P3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728167109; x=1728771909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDfiCHkM6iRNBN2C/aIKKCpm5M7jUVZxqO9j658Fvlo=;
        b=Qx0ePgMaoyIitlM6Y9I4eg/PvBngmYHyqMzHX1EwABjXMBhqlSliJEUzYBbw74QFUF
         PjIkr/D69Lvv5BlIXpJlVyUHJU+lVqb+MtOPqoFaAinpjDuLPoN5vtiNCIpjWhYgc8lm
         9eskaILeHk7IvnbOCLoM7hgoon4ujjmyP/mKRpEKVZ7YWxD3eClDaqilVqjp06tpYmYy
         gAZ5LSzL/stSzOz546b0INOMmlvnKcyoHbm3bntAdNW8K8IeapPrf4Wv27YWWzKwkcYh
         YAAVeqhtAcx3OwooWncZMa1SeebryYxDd93Q9bWVXB3IiovFhX690fMYEDI5onF40d6y
         CmKg==
X-Forwarded-Encrypted: i=1; AJvYcCXSDBt73IKHd/El9GA+h7AhciKQKOzVEb05UeC/Ldz6WEbcjeGN+fno4rhQSuxXozk8gqCfQhjtWmvEHNLdGQnxnJbQdQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yy4KwtvfQE4Y+56CRw4gNFHht9sbtiKZat6yvvL6fL3qLvaaNsK
	g+emlYPHZYwRIUi+tBUJwlPhrYlYHb7zwo0Ua4OWuBHs8OpVDQqa
X-Google-Smtp-Source: AGHT+IG9IC6wXOdmrb4x8YrDY/Q2PgIvr82+BNrG5moIFbBBl6jXPRRtTozwbv0WiOmFCmnNv7bmPg==
X-Received: by 2002:a05:6122:3126:b0:50a:12e4:2618 with SMTP id 71dfb90a1353d-50c85448878mr6747290e0c.2.1728167108805;
        Sat, 05 Oct 2024 15:25:08 -0700 (PDT)
Received: from x13.. ([186.1.186.79])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-50c9ae365c3sm383791e0c.44.2024.10.05.15.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 15:25:07 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: brendan.higgins@linux.dev,
	davidgow@google.com,
	rmoar@google.com,
	quic_jjohnson@quicinc.com,
	macro@orcam.me.uk,
	npitre@baylibre.com,
	tpiepho@gmail.com
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	ricardo@marliere.net,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3] lib: math: Move kunit tests into tests/ subdir
Date: Sat,  5 Oct 2024 18:24:45 -0400
Message-ID: <20241005222446.10471-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is a follow-up task from a discussion stemming from point 3
in a recent patch introducing the int_pow kunit test [1] and
documentation regarding kunit test style and nomenclature [2].

Colocate all kunit test suites in lib/math/tests/ and
follow recommended naming convention for files <suite>_kunit.c
and kconfig entries CONFIG_<name>_KUNIT_TEST.

Link: https://lore.kernel.org/all/CABVgOS=-vh5TqHFCq_jo=ffq8v_nGgr6JsPnOZag3e6+19ysxQ@mail.gmail.com/ [1]
Link: https://docs.kernel.org/dev-tools/kunit/style.html [2]

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
Changes in v2: Fix cc recipient list inclusion in cover letter
Changes in v3: Update mul_u64_u64_div_u64_kunit.c path in comment describing shell script
---
 arch/m68k/configs/amiga_defconfig                           | 2 +-
 arch/m68k/configs/apollo_defconfig                          | 2 +-
 arch/m68k/configs/atari_defconfig                           | 2 +-
 arch/m68k/configs/bvme6000_defconfig                        | 2 +-
 arch/m68k/configs/hp300_defconfig                           | 2 +-
 arch/m68k/configs/mac_defconfig                             | 2 +-
 arch/m68k/configs/multi_defconfig                           | 2 +-
 arch/m68k/configs/mvme147_defconfig                         | 2 +-
 arch/m68k/configs/mvme16x_defconfig                         | 2 +-
 arch/m68k/configs/q40_defconfig                             | 2 +-
 arch/m68k/configs/sun3_defconfig                            | 2 +-
 arch/m68k/configs/sun3x_defconfig                           | 2 +-
 arch/powerpc/configs/ppc64_defconfig                        | 2 +-
 lib/Kconfig.debug                                           | 6 +++---
 lib/math/Makefile                                           | 5 +----
 lib/math/tests/Makefile                                     | 5 ++++-
 lib/math/{test_div64.c => tests/div64_kunit.c}              | 0
 .../mul_u64_u64_div_u64_kunit.c}                            | 2 +-
 lib/math/{rational-test.c => tests/rational_kunit.c}        | 0
 19 files changed, 22 insertions(+), 22 deletions(-)
 rename lib/math/{test_div64.c => tests/div64_kunit.c} (100%)
 rename lib/math/{test_mul_u64_u64_div_u64.c => tests/mul_u64_u64_div_u64_kunit.c} (98%)
 rename lib/math/{rational-test.c => tests/rational_kunit.c} (100%)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index d01dc47d52ea..7ba9311c084c 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -619,7 +619,7 @@ CONFIG_KUNIT=m
 CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
-CONFIG_TEST_DIV64=m
+CONFIG_DIV64_KUNIT_TEST=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 46808e581d7b..273fe4032b85 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -576,7 +576,7 @@ CONFIG_KUNIT=m
 CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
-CONFIG_TEST_DIV64=m
+CONFIG_DIV64_KUNIT_TEST=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 4469a7839c9d..9976cda99fc1 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -596,7 +596,7 @@ CONFIG_KUNIT=m
 CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
-CONFIG_TEST_DIV64=m
+CONFIG_DIV64_KUNIT_TEST=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index c0719322c028..f59082c8fe06 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -568,7 +568,7 @@ CONFIG_KUNIT=m
 CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
-CONFIG_TEST_DIV64=m
+CONFIG_DIV64_KUNIT_TEST=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 8d429e63f8f2..6db3556da9ac 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -578,7 +578,7 @@ CONFIG_KUNIT=m
 CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
-CONFIG_TEST_DIV64=m
+CONFIG_DIV64_KUNIT_TEST=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index bafd33da27c1..25c06b5c83ee 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -595,7 +595,7 @@ CONFIG_KUNIT=m
 CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
-CONFIG_TEST_DIV64=m
+CONFIG_DIV64_KUNIT_TEST=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 6f5ca3f85ea1..35e57e0ee139 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -681,7 +681,7 @@ CONFIG_KUNIT=m
 CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
-CONFIG_TEST_DIV64=m
+CONFIG_DIV64_KUNIT_TEST=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index d16b328c7136..d253b686119a 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -567,7 +567,7 @@ CONFIG_KUNIT=m
 CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
-CONFIG_TEST_DIV64=m
+CONFIG_DIV64_KUNIT_TEST=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 80f6c15a5ed5..62bc6ad63783 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -568,7 +568,7 @@ CONFIG_KUNIT=m
 CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
-CONFIG_TEST_DIV64=m
+CONFIG_DIV64_KUNIT_TEST=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 0e81589f0ee2..caba39c61bac 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -585,7 +585,7 @@ CONFIG_KUNIT=m
 CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
-CONFIG_TEST_DIV64=m
+CONFIG_DIV64_KUNIT_TEST=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 8cd785290339..a348f645ed55 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -565,7 +565,7 @@ CONFIG_KUNIT=m
 CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
-CONFIG_TEST_DIV64=m
+CONFIG_DIV64_KUNIT_TEST=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 78035369f60f..f8b3cfc3275b 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -566,7 +566,7 @@ CONFIG_KUNIT=m
 CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_TEST_DHRY=m
 CONFIG_TEST_MIN_HEAP=m
-CONFIG_TEST_DIV64=m
+CONFIG_DIV64_KUNIT_TEST=m
 CONFIG_REED_SOLOMON_TEST=m
 CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index a5e3e7f97f4d..f1f21765c0c1 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -435,7 +435,7 @@ CONFIG_KUNIT=m
 CONFIG_KUNIT_ALL_TESTS=m
 CONFIG_LKDTM=m
 CONFIG_TEST_MIN_HEAP=m
-CONFIG_TEST_DIV64=m
+CONFIG_DIV64_KUNIT_TEST=m
 CONFIG_BACKTRACE_SELF_TEST=m
 CONFIG_TEST_REF_TRACKER=m
 CONFIG_RBTREE_TEST=m
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 7315f643817a..0d6c979f0bfd 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2296,7 +2296,7 @@ config TEST_SORT
 
 	  If unsure, say N.
 
-config TEST_DIV64
+config DIV64_KUNIT_TEST
 	tristate "64bit/32bit division and modulo test"
 	depends on DEBUG_KERNEL || m
 	help
@@ -2306,7 +2306,7 @@ config TEST_DIV64
 
 	  If unsure, say N.
 
-config TEST_MULDIV64
+config MULDIV64_KUNIT_TEST
 	tristate "mul_u64_u64_div_u64() test"
 	depends on DEBUG_KERNEL || m
 	help
@@ -3089,7 +3089,7 @@ endmenu # "Rust"
 
 endmenu # Kernel hacking
 
-config INT_POW_TEST
+config INT_POW_KUNIT_TEST
 	tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
diff --git a/lib/math/Makefile b/lib/math/Makefile
index 3ef11305f8d2..1c489501ff57 100644
--- a/lib/math/Makefile
+++ b/lib/math/Makefile
@@ -5,7 +5,4 @@ obj-$(CONFIG_CORDIC)		+= cordic.o
 obj-$(CONFIG_PRIME_NUMBERS)	+= prime_numbers.o
 obj-$(CONFIG_RATIONAL)		+= rational.o
 
-obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
-obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
-obj-$(CONFIG_TEST_MULDIV64)	+= test_mul_u64_u64_div_u64.o
-obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
+obj-y  += tests/
diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
index 6a169123320a..f9a0a0e6b73a 100644
--- a/lib/math/tests/Makefile
+++ b/lib/math/tests/Makefile
@@ -1,3 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-obj-$(CONFIG_INT_POW_TEST) += int_pow_kunit.o
+obj-$(CONFIG_DIV64_KUNIT_TEST)    += div64_kunit.o
+obj-$(CONFIG_INT_POW_KUNIT_TEST)  += int_pow_kunit.o
+obj-$(CONFIG_MULDIV64_KUNIT_TEST) += mul_u64_u64_div_u64_kunit.o
+obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational_kunit.o
diff --git a/lib/math/test_div64.c b/lib/math/tests/div64_kunit.c
similarity index 100%
rename from lib/math/test_div64.c
rename to lib/math/tests/div64_kunit.c
diff --git a/lib/math/test_mul_u64_u64_div_u64.c b/lib/math/tests/mul_u64_u64_div_u64_kunit.c
similarity index 98%
rename from lib/math/test_mul_u64_u64_div_u64.c
rename to lib/math/tests/mul_u64_u64_div_u64_kunit.c
index 58d058de4e73..f61f571a0a2e 100644
--- a/lib/math/test_mul_u64_u64_div_u64.c
+++ b/lib/math/tests/mul_u64_u64_div_u64_kunit.c
@@ -49,7 +49,7 @@ static test_params test_values[] = {
  *
  * #!/bin/sh
  * sed -ne 's/^{ \+\(.*\), \+\(.*\), \+\(.*\), \+\(.*\) },$/\1 \2 \3 \4/p' \
- *     lib/math/test_mul_u64_u64_div_u64.c |
+ *     lib/math/tests/mul_u64_u64_div_u64_kunit.c |
  * while read a b c r; do
  *   expected=$( printf "obase=16; ibase=16; %X * %X / %X\n" $a $b $c | bc )
  *   given=$( printf "%X\n" $r )
diff --git a/lib/math/rational-test.c b/lib/math/tests/rational_kunit.c
similarity index 100%
rename from lib/math/rational-test.c
rename to lib/math/tests/rational_kunit.c
-- 
2.46.2

