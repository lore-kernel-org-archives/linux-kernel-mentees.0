Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A1420A5DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 07:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631865; cv=none; b=lH+A+dILQTdOQtIq3mJM2f7EuaMDBEXRSf/bDZUnptOWGZh895imYhqaUGa1yoLbyssbPR8IxFfbSROdS/ZSW92JqAmcQhg3KGvnz28AZHNYyGK9eg5gBWJR8QGTUDJqv/b+ZMIHHEf/PgHn2gf+tWBcXlV2anf77iowygTIIf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631865; c=relaxed/simple;
	bh=MLKVj5mIGtKe2lmA8uZuUkbaKPXRlkwhLj+qZGlP1IQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gTC7nSOok6jo+oryRD0OvB5mpnM/rMPoawj2qSr03nVHoVviKqraeJfEhjkBosnuOJ9nEFbS/v/B6tY1WHXZIiVRBoGr0+Qqjc6kHrix1dKJeEpU2YnLM+neGOI3AUZwMKxwaf8JaOY6smg/K2g6jt/CCZ1DMWeuoG2Ud0iJDpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yLJbdSpB; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yLJbdSpB"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A2BC41E74
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 07:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -9.601
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6j9fOVF2wHd9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Oct 2024 07:31:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3nnqizwgkad8ebwjehpxhpphmf.dpn@flex--davidgow.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F053241E6F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F053241E6F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yLJbdSpB
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F053241E6F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 07:31:01 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e28ef71f0d8so2730521276.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728631861; x=1729236661; darn=lists.linuxfoundation.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p2/wWiYYGPs+6qkE7fTq8up8gyUggtyfyady5a+MRp8=;
        b=yLJbdSpBtlU05fw9wtnMshd3ElOk0hyGNHBGMMsBn6vtmM4A2rd74D7N4Q2PkMpzCO
         9UWl81XI2fEnoksBay80RMP5gquxNA3wXxdy8866Rk9/QWq7SNH8bIogP4quF4NaBwIs
         dJuZufyiol5gNluu3MBb2Gd4o7qS79IZ55SoVo9gjB/lqcnsrIY/XfcnpgATKFdHAXRV
         KwgFonwXhHsynK0cfGSMH3PEsxLmjFfyrZ37I71E/CLPRnErtv7bbuYfbK0uhv6+Ibe2
         qhe2TVyui8MGTaqHZX/BeVa8Hfx0Drb+EcW96bGwlwxBAH88+O6n5BzKPSjK9bNxLFFq
         SEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728631861; x=1729236661;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p2/wWiYYGPs+6qkE7fTq8up8gyUggtyfyady5a+MRp8=;
        b=swxPXvDKgR/X+PKX8Q0+I88vn9etrjw0mlgdcmIsj4JsNeVL0qXeRmbpgM0trPbaSG
         lGAZcYLrmPkLq1HMB2n0xT9RHgrzQP/qd3NqJDId9snGDQFmrCs8OCjHIqTrm6cd2rHm
         Xft9yIHITwx2kvk8KBuNLandVF0+NtZ+fz5DbmyfCu3UI3jsWnkEkUS9gfY2w9i5g/GI
         YUsP+MfBqqBfKcxVslfEYtbeJwcfbP6SmK8O19M1k+84ygSr/uF6y+1HIn4AWb9RFJ+u
         zgBgxzsVa4aQnKZCH37xqvO1gJIvOCuh4VW5SDbf0tjcgt41PMlyyN//dQKdopsylCEG
         3UMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXimqeWFfvbS3gV9ZG3OgkET7ou3dCTSfVCzKaqNAdQMfwPurSIFvEwcVOWj2rsa8YU6JDn8N5vPJjX+O+9+QTIluvWRQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx9UWSJtwS+LQkVVJYK21D+KzgSWPfEdjbKzv88g95XYuzlc+9/
	F0R8QW462ETGs3G3nquEps0CNQ3Hfhew4leCqC8q+gw8aNgrdWBZqT3PM4yAt2sIHTfx1MDbodI
	XuJoZ5p4COA==
X-Google-Smtp-Source: AGHT+IGg8zwYdpqTc4hwks/F2yxEDRYUPiypRoSyjyZWBgBdCoyywn0K+Zem/S5QXprlyw+K62or1As/8fQ1Rg==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:b1:7045:ac11:6237])
 (user=davidgow job=sendgmr) by 2002:a25:d084:0:b0:e25:cea9:b0e with SMTP id
 3f1490d57ef6-e2919fe8406mr1099276.9.1728631860588; Fri, 11 Oct 2024 00:31:00
 -0700 (PDT)
Date: Fri, 11 Oct 2024 15:25:05 +0800
In-Reply-To: <20241011072509.3068328-2-davidgow@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241011072509.3068328-2-davidgow@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241011072509.3068328-3-davidgow@google.com>
Subject: [PATCH 1/6] lib: math: Move kunit tests into tests/ subdir
From: David Gow <davidgow@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Brendan Higgins <brendanhiggins@google.com>, Rae Moar <rmoar@google.com>, 
	Kees Cook <kees@kernel.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Luis Felipe Hernandez <luis.hernandez093@gmail.com>, quic_jjohnson@quicinc.com, macro@orcam.me.uk, 
	tpiepho@gmail.com, ricardo@marliere.net, 
	linux-kernel-mentees@lists.linuxfoundation.org, 
	Nicolas Pitre <npitre@baylibre.com>, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>

This patch is a follow-up task from a discussion stemming from point 3
in a recent patch introducing the int_pow kunit test [1] and
documentation regarding kunit test style and nomenclature [2].

Colocate all kunit test suites in lib/math/tests/ and
follow recommended naming convention for files <suite>_kunit.c
and kconfig entries CONFIG_<name>_KUNIT_TEST.

Link: https://lore.kernel.org/all/CABVgOS=-vh5TqHFCq_jo=ffq8v_nGgr6JsPnOZag3e6+19ysxQ@mail.gmail.com/ [1]
Link: https://docs.kernel.org/dev-tools/kunit/style.html [2]

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Acked-by: Nicolas Pitre <npitre@baylibre.com>
[Rebased on top of mm-nonmm-unstable.]
Signed-off-by: David Gow <davidgow@google.com>
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
index 856bc9f9c069..3ed6cf950f04 100644
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
@@ -2993,7 +2993,7 @@ config TEST_OBJPOOL
 
 	  If unsure, say N.
 
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
2.47.0.rc1.288.g06298d1525-goog

