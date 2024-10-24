Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD061FE0F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 19:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729797461; cv=none; b=FFMEcntv6kSlPz14x8eEDGSJaMtztsvkA6hRzNea+ORM46KSSf2FFoUDA3hB7y57w5PooWj1J4LjWVIEjrkJ1e5SUsVXfleAP52kMVZ0bvVlEoXNnXuFl5rBxH5G4x6dTTStLFBDrmfmFOIUi1qPaBk+wjczI/Oti/GIgIK0kNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729797461; c=relaxed/simple;
	bh=+4IttYR4kTs3BgakyteqDLXe6FUHJAKHRCl8Q2HFcqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rjtHZ0B9LbPJRnKjXsiAXNjbKY/ZxZ3cauAIYpTSoIeY8UOEYPmI3QFbQbXt1cBClBZ1lDX/a3bwm+RYvB7XvTN97Y5Pt/aGM6QCqgIqLTpl5+xac1j3HLXu56EZS7CaERB3ROXXYMS1mYfJWcXzB4mJfDnXp1l0ejcuJi5vKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meKtUc1T; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meKtUc1T"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10AD64044B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 19:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlB7N36-w1HU for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Oct 2024 19:17:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E0474400B5
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0474400B5
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=meKtUc1T
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E0474400B5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 19:17:37 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6e5a15845easo12497237b3.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 12:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729797456; x=1730402256; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOWx7jnVLhhYqmmc0kk5hR8SpqsjGY3VnKJpFaYMEEE=;
        b=meKtUc1Tl+Qj8kdv14ua91CcbpZqWFfwan6Zo4EV6AZ1UVzHbxBzqhBd8hdkMWfQ55
         aY2ighN48veLVxL1cVS2tyr4yIo2q0dxnkyYuXjc2F1icsN07+QVtKQAbBNicwB2A9r4
         QavJjVjXC8bsrhilRX49jp4w+SjD934wKv3u53Uebx9mPYw41LGrQlxY527S3xMr+c6Z
         LoNaY0EKhevynVjGet9Yn8xysCNO4PwSd0KKIKTL/+OIyMVnbIFngkStyeaZEo51h4N0
         3qWopkzVCkjUFQAuKPX2iL+0rvMMTQDEiwMsNLs7uah5wGYxydogcEruh6dgQIswZu5u
         xkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729797456; x=1730402256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOWx7jnVLhhYqmmc0kk5hR8SpqsjGY3VnKJpFaYMEEE=;
        b=XWJKCrd2LbfQEG4t5MlLumOnkvBg/w+vGA9VbZFDPfxsA8fgWEg41hlXjXiAbeJpbs
         hbYaBC2x7F1maImgwaSWB3L9nMOaVuTARK9X7tAYjTN794IP4pqVSJx08JoPeQAwS1ip
         PsgwkDKtlsNUJe9ald7Ajy4szEBQUDlev73IskZYqfRA8NbbNN9h9cV1KGB+gE2u/CZw
         3HESH+hZhJjeFLHfMZfNT8szP2GTS/LMasyUVsrXvL+iJG8A3hnMHiVfBaK7h9G7Bxyi
         /KnPQJ05AGiGYNUJOwDmVvmNsoZFKmM379FlcwMnErZVZuqiqLWwB/ofZ2CUOtxqpJEi
         FW3A==
X-Forwarded-Encrypted: i=1; AJvYcCUAjPiigdYSS5H2Yh/iq2d51a88mcmpCDoSyaWbrHoRmpT+FnX+lRtOtkpuG9LJJkJjeTqHxZZKSs3HpB2Nmq1T/xzj/Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yyu38N10/LyKhiN0NCDr1GcRPv2UHBkr/Yieg5HQaU52raKt23l
	Zpo1zXl5vKeN7ZRLPhKPXmVJ6XHCN3SNasxa/WlWvn+6SQvlvN6t
X-Google-Smtp-Source: AGHT+IHNpssd6UN8JLxojgixsRYKJvUh/JkCow3Wp0tb3/0LUzQwzYXgmxyzyOR6if9R4VcVR1Ma2A==
X-Received: by 2002:a05:690c:308a:b0:6e2:50a:f436 with SMTP id 00721157ae682-6e7f0f7e58cmr76490317b3.36.1729797456463;
        Thu, 24 Oct 2024 12:17:36 -0700 (PDT)
Received: from x13.. ([157.23.249.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d749e2sm20787287b3.142.2024.10.24.12.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:17:35 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: brendan.higgins@linux.dev,
	davidgow@google.com
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	ricardo@marliere.net,
	linux-kernel-mentees@lists.linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	davidlohr.bueso@hp.com
Subject: [PATCH] lib/math: Add int_sqrt test suite
Date: Thu, 24 Oct 2024 15:17:28 -0400
Message-ID: <20241024191730.69542-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds test suite for integer based square root function.

The test suite is designed to verify the correctness of the int_sqrt
math library function.

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
 lib/Kconfig.debug               | 17 ++++++++++++
 lib/math/Makefile               |  1 +
 lib/math/tests/Makefile         |  1 +
 lib/math/tests/int_sqrt_kunit.c | 48 +++++++++++++++++++++++++++++++++
 4 files changed, 67 insertions(+)
 create mode 100644 lib/math/tests/int_sqrt_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 7312ae7c3cc5..a7e63dae9281 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2993,6 +2993,23 @@ config TEST_OBJPOOL
 
 	  If unsure, say N.
 
+config INT_SQRT_KUNIT_TEST
+	tristate "Integer square root test test" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables the KUnit test suite for the int_sqrt function,
+	  which performs square root calculation. The test suite is designed to
+	  verify that the implementation of int_sqrt correctly computes the
+	  square root of a number.
+
+	  Enabling this option will include tests that check various scenarios
+	  and edge cases to ensure the accuracy and reliability of the square root
+	  function.
+
+	  If unsure, say N
+
+
 endif # RUNTIME_TESTING_MENU
 
 config ARCH_USE_MEMTEST
diff --git a/lib/math/Makefile b/lib/math/Makefile
index 3ef11305f8d2..c7b043ffb249 100644
--- a/lib/math/Makefile
+++ b/lib/math/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
 obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
 obj-$(CONFIG_TEST_MULDIV64)	+= test_mul_u64_u64_div_u64.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
+obj-y  += tests/
\ No newline at end of file
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
index 000000000000..9935f52e808f
--- /dev/null
+++ b/lib/math/tests/int_sqrt_kunit.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <kunit/test.h>
+#include <linux/math.h>
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
2.47.0

