Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2ED1E9094
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Oct 2024 13:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730295855; cv=none; b=tQlGyvgciV15+GPD+ovnMC5m7QxHzaGUf5gEQwcHsGZS5MjL03d7aUXKggeoChBLlMtniycO4fL3C1uagDNgXJh0wCZ4ewFveTAA7Z76msEtqsJ0teZzsMLw9QC0RHlD7kJnDYrZXa2yBxgYQ+Lezkfcil79zGADRBnYCjPgE7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730295855; c=relaxed/simple;
	bh=nUon+G46zP2CSR3tR1gbd+JLlhnCUVcpuNgOZP3VoGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nk03w+K5mp/www07mYWXJ8NU4NHLxp0jB4uH8mpqJJCmTKQkTdbRN5IAICXUYRpEFx4R71bAZcv8D04pIF2+T+aBWcjXdaY35fwDGoH1fY9Zn5YesLvEpswtcZwOYc0iKQa1/uOygfaQc6ZQi0C5kiXltPM+w+ZqcLVcofQrXr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtuRcWGS; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtuRcWGS"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E28CF40096
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Oct 2024 13:44:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jc3O1WYJLTZb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Oct 2024 13:44:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE5CA400FF
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE5CA400FF
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TtuRcWGS
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AE5CA400FF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Oct 2024 13:44:11 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6e9ed5e57a7so32317947b3.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Oct 2024 06:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730295850; x=1730900650; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gohomfedkfXRjVspcTaXGu7eMc1O0Uh2mGX5FqgSJHQ=;
        b=TtuRcWGSOMg6HebxdJ4nQZMv1xM31I5SqzjzuVJ6ainKiDEdedTYE4XTOZqpTZo9l/
         IStLyNXXptoWH6w3qWL3gAT0FRPSHEUhO7G5+rirkJdX5vMIstya1JFvZKOSc1xWcP6o
         0c+h/ZOvvH78938Noq3L+Lhs8F3whQsteY1rvfLK5zd84+lvDZDjwwsN9ptvUVwDeHWt
         9AY82SXb5oEKKwsgNX7UD28s2ygNDpAnUMUJPEo9s0/pc9zaUGmvT01A7Wwfu5QL2KL5
         goQEkttwvps488NbZnuQaqgN7kPq8sxZWlt+a55L1S/xDTKIQZksFyiH6QgNqw36pEKu
         3iAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730295850; x=1730900650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gohomfedkfXRjVspcTaXGu7eMc1O0Uh2mGX5FqgSJHQ=;
        b=N7hSGw7yAvSopwD9qJLP1YUySGJOdiTHjhWvUZAICRR4GM34k5IJfWR0Q8jAoEbK78
         ZswfvRVEbRUJYO6l+i6harWTS9HWghDfY63usZnJcudXtTvodjXcjdbbLSTx9ANZA6bo
         NOyvae5XOyaudeOjH5IO2wceIjikCxnYVKgBbMPoxLL+o46fcfuUwK3aTKAINwiI5qhn
         ARXAyi/SK8qO5AnvJtNzE6S+85c8WySXbUKcOtpp9tET4CNcdMphbxBrVudOClmYAfNN
         ZHVlFIamWCr7nSFRCZWethTSS+DtEyUHio20NkOLVj6j1iP5iqwPvMpczmD+zkitc5ly
         gkYg==
X-Forwarded-Encrypted: i=1; AJvYcCXiLw3mTKbJnWdBjC0A0lHs2sVfU6tbw8I1F2Ml6wSJBbjG2h+Jn4s2v92listi9xhEYE/p+C/C8jvtUfe9KEmoBpe0Gg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzLudgteo2T6+N+4FOU+eoXo40iKUxwXSx16cvfHaH3W9wOlHMo
	XJ2XWMgn9p7IlgPgt6h6cySwDOTkVBvDsdLI72MKB2NDTsvhrvb1
X-Google-Smtp-Source: AGHT+IFpXFYXK4s+dOnVRg7C2fehk9sad2Yniq1DKN9iBPyfplZXUV1i/apuQDy41OL24kqCCBUiWw==
X-Received: by 2002:a05:690c:f87:b0:6e3:2e4b:ad9a with SMTP id 00721157ae682-6e9d895d649mr170300547b3.12.1730295850206;
        Wed, 30 Oct 2024 06:44:10 -0700 (PDT)
Received: from x13.. ([157.23.249.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c19d42sm24600357b3.71.2024.10.30.06.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 06:44:09 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: brendan.higgins@linux.dev,
	davidgow@google.com
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	ricardo@marliere.net,
	linux-kernel-mentees@lists.linuxfoundation.org,
	andriy.shevchenko@linux.intel.com
Subject: [PATCH v3] lib/math: Add int_sqrt test suite
Date: Wed, 30 Oct 2024 09:43:53 -0400
Message-ID: <20241030134355.14294-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.47.0
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
---
 lib/Kconfig.debug               | 15 ++++++++++
 lib/math/Makefile               |  1 +
 lib/math/tests/Makefile         |  1 +
 lib/math/tests/int_sqrt_kunit.c | 51 +++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100644 lib/math/tests/int_sqrt_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 7312ae7c3cc5..c83f5dc9bb48 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2993,6 +2993,21 @@ config TEST_OBJPOOL
 
 	  If unsure, say N.
 
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
2.47.0

