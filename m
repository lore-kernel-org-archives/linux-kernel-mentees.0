Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D8E8633F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Dec 2024 17:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733851709; cv=none; b=e2cu4G2nWbbrc2shGXZ+dgvluo1/TFXmhIQOb5wFtC+US89OUMS9FPcrOZoR55OItw/whEXkOAWg13rsB2dj6BEcb/1a0gOkB9pQ2ol83nFMns2YmFAsdLrDyCZXmWPRdXL/7MWw7QbYRzVQ+6g0o22bFlBevTZCrlkIKiH93SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733851709; c=relaxed/simple;
	bh=PITXxIvrpP3dd0YiiFrlSJTh8tPjUUf3rGEZ76cpg6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CTc3qcvJf8oQFWkSq0fPfj2G7YzVkkztvxKQV6qPwmjtf5lKP2e2G2NTgpTuCU3GSoHodwSXp/Su5ik4iK9MSt+y7Wvk85qCED2zsLNP9iGbXuPRnIsVvYf8d6fwu40i/alLhQDVfuagHoQavXf5+CmXTLzdXjaCBrUavVYWExE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnxTJkNK; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnxTJkNK"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E558680E30
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Dec 2024 17:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrRRQCvHFDGP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Dec 2024 17:28:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C06D80D59
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C06D80D59
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EnxTJkNK
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0C06D80D59
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Dec 2024 17:28:26 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e3989d27ba3so4505145276.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Dec 2024 09:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733851706; x=1734456506; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lxVhJwl3OLRoogX0vJCyHypohUZXmgGvC215FNUeOwM=;
        b=EnxTJkNKZcS05eAh1RXkX+BfxaGOI6eAKAxHSUK6n4VqCYsWTzymPhkDAKwXyG8Hns
         XPctWBDVuumEzfXsEd0EqSJMT2ZJu1kK1vR976P2uVKnMGgXubTjiymcFBt5N2cYrb2w
         IZbwM+e0GONWsRFcr7c/qpumzmcpG+gHGOoYmdAr1RYyVmNoaBXKtoKfLHCDDYWaMj1v
         Dp+RKdp25fHN7AlB1AeG+YQQizFeP9Mq0rVS8SlccQhSj/PgMlwjRxiVYizD5sz3UBKe
         iGSqEthTzYR5eiSSqWUFZOTEHeSmmxr+rj1QQ5CmxeGsUT7Qro4a3MG6NbnGZ1Pqy1Qx
         QE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851706; x=1734456506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxVhJwl3OLRoogX0vJCyHypohUZXmgGvC215FNUeOwM=;
        b=bBSrZzCvvwAwd4cXxqkGGmlxiHXHPihkOULakVJksEiYhH8fOOs8ExuOfNXENSeJD6
         Goc3CImFtZthxiAXQlukir8EI/vl/ey3Gob28baYCxuv2bVSsR0YZZj+NjxHaRCOBIWC
         2ahtc4NOJ0J8y/ypPooVFw/WEirzmFbfau51noBPkliLt2ZkiErxaGUXEY9Z4hrc9DbE
         a7zOQO2YizVd+ifVQJnpJ0olVITbjQfB6STtdZ0ZDDNYQMRmdkric2waWDIw+Pcw7u3G
         RStklF6V0wpTgePbtvTHz0EoyUSR0SkpymntM5vTRt9xKv0pTrF+ywinJP79AqxGg3Ll
         UAzg==
X-Forwarded-Encrypted: i=1; AJvYcCW/5N8IfalgdGFssMJZ+mbpK9RWBswrOGpgptUxvaW3YwnzN5aXSSLo3F2mC//utG5oGoJN79xOZbdxN09I5ryMGu5zkQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzZ87ysasKoDLTeG9aOLyJQyLD1l+BuSjId++GXc7hSXOnyNgO9
	gZv2qDpyUIqRJQ31PIVkcYlF8tbeG0WcgiMj/L47zRTZmRHUxtWO
X-Gm-Gg: ASbGncvg5tM6w6Iz/KdGXwWhSZhjO1WhxUUMpjx3Pl4kxiLVgXs2afBwyBTvyCxhQsv
	SNJ2kSMWz760EksVmKVsxgxzmxOoSHO48JWYstyMl+cva88+ClVHu2hBFpVmDA5ceIOT9lOKVTv
	PvAiqDI2eLgQFjtOo2N4GAmUMwsyx7zPBatOQdhmKlzlGw2XFHbF7bGVFqyzMZxM4/Ng31vpcIQ
	hTcXyTRe7Nehj2lsconYT+xhiEj1RxH99rxcr3SDrYnfQM+/goUyEs=
X-Google-Smtp-Source: AGHT+IGmppz3mlH9kZHz99Dx7/YsghJEH0N6qwXv/Ip9J9iCdUHS4ZM2YrzcSWEcGgdGwzD+L/Qg5g==
X-Received: by 2002:a05:6902:3402:b0:e39:9df1:67c2 with SMTP id 3f1490d57ef6-e3a0b485186mr13775245276.47.1733851705662;
        Tue, 10 Dec 2024 09:28:25 -0800 (PST)
Received: from x13.. ([157.23.249.72])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e39f7138861sm3124081276.52.2024.12.10.09.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:28:25 -0800 (PST)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: davidgow@google.com
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	akpm@linux-foundation.org,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	npitre@baylibre.com,
	skhan@linuxfoundation.org,
	rbm@suse.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	kunit-dev@googlegroups.com
Subject: [PATCH v4] lib/math: Add int_sqrt test suite
Date: Tue, 10 Dec 2024 12:28:07 -0500
Message-ID: <20241210172822.97683-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds test suite for integer based square root function.

The test suite is designed to verify the correctness of the int_sqrt()
math library function.

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
Changes in v2
  - Add new line at the end of int_sqrt_kunit.c
  - Add explicit header includes for MODULE_* macros, strscpy, and ULONG_MAX

Changes in v3
  - Remove unnecesary new line after Kconfig entry for INT_SQRT_KUNIT_TEST
  - Correct int_sqrt instances with int_sqrt() in commit message and kconfig
entry desc
  - Fix limits.h header include path

Changes in v4
  - Fix Kconfig entry: remove redundant word test
---
 lib/Kconfig.debug               | 15 ++++++++++
 lib/math/Makefile               |  1 +
 lib/math/tests/Makefile         |  1 +
 lib/math/tests/int_sqrt_kunit.c | 51 +++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100644 lib/math/tests/int_sqrt_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f3d723705879..cc00c4ace855 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3161,6 +3161,21 @@ config INT_POW_TEST
 
 	  If unsure, say N
 
+config INT_SQRT_KUNIT_TEST
+	tristate "Integer square root test test" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables the KUnit test suite for the int_sqrt() function,
+	  which performs square root calculation. The test suite checks
+	  various scenarios, including edge cases, to ensure correctness.
+
+	  Enabling this option will include tests that check various scenarios
+	  and edge cases to ensure the accuracy and reliability of the square root
+	  function.
+
+	  If unsure, say N
+
 endif # RUNTIME_TESTING_MENU
 
 config ARCH_USE_MEMTEST
diff --git a/lib/math/Makefile b/lib/math/Makefile
index 3ef11305f8d2..25bcb968b369 100644
--- a/lib/math/Makefile
+++ b/lib/math/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
 obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
 obj-$(CONFIG_TEST_MULDIV64)	+= test_mul_u64_u64_div_u64.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
+obj-y  += tests/
diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
index 6a169123320a..e1a79f093b2d 100644
--- a/lib/math/tests/Makefile
+++ b/lib/math/tests/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_INT_POW_TEST) += int_pow_kunit.o
+obj-$(CONFIG_INT_SQRT_KUNIT_TEST) += int_sqrt_kunit.o
diff --git a/lib/math/tests/int_sqrt_kunit.c b/lib/math/tests/int_sqrt_kunit.c
new file mode 100644
index 000000000000..3590142d2012
--- /dev/null
+++ b/lib/math/tests/int_sqrt_kunit.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <kunit/test.h>
+#include <linux/limits.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/string.h>
+
+struct test_case_params {
+	unsigned long x;
+	unsigned long expected_result;
+	const char *name;
+};
+
+static const struct test_case_params params[] = {
+	{ 0, 0, "edge-case: square root of 0" },
+	{ 4, 2, "perfect square: square root of 4" },
+	{ 81, 9, "perfect square: square root of 9" },
+	{ 2, 1, "non-perfect square: square root of 2" },
+	{ 5, 2, "non-perfect square: square root of 5"},
+	{ ULONG_MAX, 4294967295, "large input"},
+};
+
+static void get_desc(const struct test_case_params *tc, char *desc)
+{
+	strscpy(desc, tc->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(int_sqrt, params, get_desc);
+
+static void int_sqrt_test(struct kunit *test)
+{
+	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
+
+	KUNIT_EXPECT_EQ(test, tc->expected_result, int_sqrt(tc->x));
+}
+
+static struct kunit_case math_int_sqrt_test_cases[] = {
+	KUNIT_CASE_PARAM(int_sqrt_test, int_sqrt_gen_params),
+	{}
+};
+
+static struct kunit_suite int_sqrt_test_suite = {
+	.name = "math-int_sqrt",
+	.test_cases = math_int_sqrt_test_cases,
+};
+
+kunit_test_suites(&int_sqrt_test_suite);
+
+MODULE_DESCRIPTION("math.int_sqrt KUnit test suite");
+MODULE_LICENSE("GPL");
-- 
2.47.1

