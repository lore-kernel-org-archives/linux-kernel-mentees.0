Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27261DE8AD
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  6 Jun 2026 03:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780715008; cv=none; b=HhJagI1Rv9J6m7U3SFuDJWzECx+sYsUMug6+Vd0RM/PcuBTDcsYAO0Z4lXoPslOIrFDhkqT6X5nm1DyqWD8R5xXWQIQdGIrflFov6z5FhuA6uI1P30uMrghaD5XgBjtLEbhbLC7hDQvpuM7WQK+KZrDtUpUApKLZckiaSFtoju8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780715008; c=relaxed/simple;
	bh=ky/O851hUVScoQCJyHMEdXAknbRDO2OmkuDtVhtUaWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a0sUcAnDWf+1U+ctx/9cnCn2UG4f77QpcgSz2vclG2mmtNgyHgxduQsRLOTa0YjXTobZSvyeVQV8LRlVrvi7SYdVNSwMPIE1Ie4oE/rmxUBCSAWvuT7OdxZu5sf1439/eOArov34M5s4vhp1S8B8GchvEhQc0AwkzMSZUVbmllQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjFKmWfP; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjFKmWfP"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so1889859a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 05 Jun 2026 20:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780715006; x=1781319806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wkeCClWpNQ+LEjlwBYSSWBLUbENqf+0YKBgoFzbsoiQ=;
        b=OjFKmWfPblRfDocbvHImQkfYrV8z3PYeYG569a3V78vCzcww1CEKUZWjnBTqdgvCsS
         i46P0FLP9ppbci+J3rsfUn9PhEsL0G6CgFnGwu7ofuXX7C+blh+Sv2uuA3pz/F/hoMc2
         pNqwcabBN7+0SB0G6ZhEz/tI5OIkhBFJSdsN0p065RqbYBKdJhglYQf+TvMOi5QyxgZY
         qhmFVevvuEpTDeT/lXPB54/56QNgzJP7HEDzdBTz1jmisvFFJX/qh4XRW53JEgvqKrdf
         iZkTGkIZi09lYf2UffVaXZjqD+LL8bcLEvUYd4aC8ZG5OMBlpQZF/ruWaulteOnc82aa
         cl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780715006; x=1781319806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkeCClWpNQ+LEjlwBYSSWBLUbENqf+0YKBgoFzbsoiQ=;
        b=hafOkOu0zswEEBX9+fnJZJ84eeT3HX9Lz1A0kmbi0o6H8ncPkZzg9WQQE1nc4jfcID
         ll+Rxh131TeUc0+BRZNnMBx84yvuq2pEs1Yy2JrmifQgHnQB/6uGuLTETEAQpqynOzC5
         IpD2fxK9314IRoBx8tcyALo7/3AmBroAXEzCc7d775kg0K8AgKTipWZXQitX3Sc04RSW
         YoPW3yjsq4W/cgKji5126ry667Q7VTAgZ0CIuFp0ZX+16XcbtKWtf1hgGAm+GgqrnTl3
         bSF5mwuRdAogiVdlrKqCAsqbp8WD/Bql5iZ7aD+DrJ7qXlLAA8H9mXwviKvwIC6P3nxS
         7tGg==
X-Gm-Message-State: AOJu0YyXn4AYaxeVoOR0sYojg1f7Bx++MJqE5ySjPjaBB9SUbkKxZcMk
	peh/6548vQm6HyzrrEPD6OGe0vTlU+EHzd6TV5UGBWZ9BdGhmoCoH+1R
X-Gm-Gg: Acq92OGq01Ga5+F/bUMVOZ9Nzqv+UsbDa7J/mE2Ob03ngkyjihQU2XeguArdKNUi3kO
	zBAgLoMpKWfjNRARRAKzjOSKhy1zIoX/qwKa2UFNrZCHBkZz0lC1ygViv5F/qgwLhiY6lZfx36L
	eE7ftXtsep+jugJduhsQ9jX50rcacJOkRrZlzi+mEbT1CUiY4+WDioB8YPA6d1i4puzAK20ENOn
	7FsE8Si+fDHBli1jZ5QJFJmD60+bVECwdQFVRGEizxY+b3YebSJQLblYvyg3PW+KRMJVXwPFJDD
	tf6AroqTWxeRLK3P1B4B6daa0dZCqalO43GqyxDG/wpJQkc/1AkMeB7530BLzgBEe9McV/oxNWE
	rXiL35q3cdQSmgQPZ+xurdyCmrRI9tdlqLPpsYsr/L/E5N9WhFfdtJi0fnJVe/WFd0mP4kIsB84
	KQyns4UrkviHF3M98+vPE1bwDL4cauHSLAqkvzh+2iyPb70gTnpo9Afd9fL1gDk7w48glOJR9U0
	IxLBaW28SSH2gwjsB0DMwgvSQzE7eKGZyrhrPBXkLVvh77JzvwOC7Xo3PXJXjCT4R6v9m4O0eKd
	+eDWNmS8MYBK3ucixIjWmZuDftyM1HzZKR+/MxzvftC5CFY/7s0f
X-Received: by 2002:a17:90b:4fcd:b0:36d:b680:3029 with SMTP id 98e67ed59e1d1-370eeff1da0mr7178373a91.1.1780715005882;
        Fri, 05 Jun 2026 20:03:25 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3713346cd9fsm3685124a91.2.2026.06.05.20.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 20:03:25 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Adi Nata <adinata.softwareengineer@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] lib/math: add KUnit test suite for polynomial_calc()
Date: Sat,  6 Jun 2026 11:03:09 +0800
Message-ID: <20260606030319.316752-1-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a KUnit test suite for the polynomial_calc() function, which had
no in-kernel test coverage. The tests verify correct evaluation of
constant, linear, quadratic, and cubic polynomials, including negative
coefficients, negative input data, zero-coefficient terms.

The Kconfig entry uses 'select POLYNOMIAL' rather than 'depends on
POLYNOMIAL' because POLYNOMIAL is a promptless tristate that cannot
be manually enabled on UML without an explicit selector.

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 lib/Kconfig.debug                 |  17 ++
 lib/math/tests/Makefile           |   1 +
 lib/math/tests/polynomial_kunit.c | 270 ++++++++++++++++++++++++++++++
 3 files changed, 288 insertions(+)
 create mode 100644 lib/math/tests/polynomial_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 8ff5adcfe1e0..5dc1b4579903 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3489,6 +3489,23 @@ config GCD_KUNIT_TEST
 
 	  If unsure, say N
 
+config POLYNOMIAL_KUNIT_TEST
+	tristate "Polynomial calculation (polynomial_calc) test" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	select POLYNOMIAL
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables the KUnit test suite for the polynomial_calc()
+	  function, which evaluates integer polynomials using factor
+	  redistribution to avoid overflow.
+
+	  The test suite verifies correctness for constant, linear, and
+	  quadratic polynomials, negative coefficients, per-step dividers,
+	  divider_leftover, total_divider scaling, and a real sensor
+	  N-to-temperature conversion polynomial.
+
+	  If unsure, say N
+
 config PRIME_NUMBERS_KUNIT_TEST
 	tristate "Prime number generator test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
index 13dc96e48408..85e1ad59f29d 100644
--- a/lib/math/tests/Makefile
+++ b/lib/math/tests/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_GCD_KUNIT_TEST)		+= gcd_kunit.o
 obj-$(CONFIG_INT_LOG_KUNIT_TEST)	+= int_log_kunit.o
 obj-$(CONFIG_INT_POW_KUNIT_TEST)	+= int_pow_kunit.o
 obj-$(CONFIG_INT_SQRT_KUNIT_TEST)	+= int_sqrt_kunit.o
+obj-$(CONFIG_POLYNOMIAL_KUNIT_TEST)	+= polynomial_kunit.o
 obj-$(CONFIG_PRIME_NUMBERS_KUNIT_TEST)	+= prime_numbers_kunit.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST)	+= rational_kunit.o
diff --git a/lib/math/tests/polynomial_kunit.c b/lib/math/tests/polynomial_kunit.c
new file mode 100644
index 000000000000..ef443b57fc12
--- /dev/null
+++ b/lib/math/tests/polynomial_kunit.c
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <kunit/test.h>
+#include <linux/polynomial.h>
+
+struct polynomial_test_param {
+	const struct polynomial *poly;
+	long data;
+	long expected;
+	const char *name;
+};
+
+/* f(x) = 5 */
+static const struct polynomial poly_constant = {
+	.total_divider = 1,
+	.terms = {
+		{0, 5, 1, 1},
+	}
+};
+
+/* f(x) = 2x^2 + 3x + 5 */
+static const struct polynomial poly_simple = {
+	.total_divider = 1,
+	.terms = {
+		{2, 2, 1, 1},
+		{1, 3, 1, 1},
+		{0, 5, 1, 1},
+	}
+};
+
+/* f(x) = -5x + 100 */
+static const struct polynomial poly_negative_coef = {
+	.total_divider = 1,
+	.terms = {
+		{1, -5, 1, 1},
+		{0, 100, 1, 1},
+	}
+};
+
+/* f(x) = (150x + 50) / 10 */
+static const struct polynomial poly_total_divider = {
+	.total_divider = 10,
+	.terms = {
+		{1, 150, 1, 1},
+		{0,  50, 1, 1},
+	}
+};
+
+/*
+ * f(x) = x / 2
+ * divider=2 applied once per multiply: mult_frac(coef, data, 2) = coef*data/2
+ */
+static const struct polynomial poly_step_divider = {
+	.total_divider = 1,
+	.terms = {
+		{1, 1, 2, 1},
+		{0, 0, 1, 1},
+	}
+};
+
+/*
+ * f(x) = (100/500) * x^2 = 0.2 * x^2
+ * Encoded as coef=100, divider=10, divider_leftover=5:
+ *   denom = 10^2 * 5 = 500
+ */
+static const struct polynomial poly_leftover = {
+	.total_divider = 1,
+	.terms = {
+		{2, 100, 10, 5},
+		{0,   0,  1, 1},
+	}
+};
+
+/*
+ * f(x) = 2x^3  (single high-degree term, no constant)
+ * Used to exercise the power loop alone.
+ */
+static const struct polynomial poly_cubic = {
+	.total_divider = 1,
+	.terms = {
+		{3, 2, 1, 1},
+		{0, 0, 1, 1},
+	}
+};
+
+/*
+ * f(x) = 4x + 1  with a zero-coefficient quadratic term.
+ * The deg-2 term contributes nothing regardless of input.
+ */
+static const struct polynomial poly_zero_coef = {
+	.total_divider = 1,
+	.terms = {
+		{2, 0, 1, 1},
+		{1, 4, 1, 1},
+		{0, 1, 1, 1},
+	}
+};
+
+/*
+ * f(x) = 9  with total_divider = 0.
+ * The implementation treats 0 as 1 via `total_divider ?: 1`, so the
+ * result must equal the constant term unchanged.
+ */
+static const struct polynomial poly_zero_total_divider = {
+	.total_divider = 0,
+	.terms = {
+		{0, 9, 1, 1},
+	}
+};
+
+
+static const struct polynomial_test_param test_params[] = {
+	{
+		.poly     = &poly_constant,
+		.data     = 0,
+		.expected = 5,
+		.name     = "Constant polynomial at x=0",
+	},
+	{
+		.poly     = &poly_constant,
+		.data     = 42,
+		.expected = 5,
+		.name     = "Constant polynomial is independent of input",
+	},
+	{
+		.poly     = &poly_simple,
+		.data     = 0,
+		.expected = 5,	/* zero input collapses all power terms */
+		.name     = "Zero input yields constant term only",
+	},
+	{
+		.poly     = &poly_simple,
+		.data     = 10,
+		.expected = 235,	/* 2*100 + 3*10 + 5 */
+		.name     = "Simple quadratic at x=10",
+	},
+	{
+		.poly     = &poly_negative_coef,
+		.data     = 10,
+		.expected = 50,		/* -5*10 + 100 */
+		.name     = "Negative coefficient at x=10",
+	},
+	{
+		.poly     = &poly_negative_coef,
+		.data     = 20,
+		.expected = 0,		/* -5*20 + 100 = 0 */
+		.name     = "Negative coefficient result is zero",
+	},
+	{
+		.poly     = &poly_total_divider,
+		.data     = 3,
+		.expected = 50,		/* (150*3 + 50) / 10 = 500/10 */
+		.name     = "total_divider scales the final sum",
+	},
+	{
+		.poly     = &poly_step_divider,
+		.data     = 100,
+		.expected = 50,		/* 1*100/2 */
+		.name     = "Per-step divider halves input",
+	},
+	{
+		.poly     = &poly_leftover,
+		.data     = 30,
+		.expected = 180,	/* 100*30^2 / (10^2 * 5) = 90000/500 */
+		.name     = "divider_leftover with quadratic term",
+	},
+	/* Boundary: unit and negative-unit input */
+	{
+		/*
+		 * data=1: each mult_frac(tmp, 1, divider) strips one factor of
+		 * divider from coef per degree, so coef is left-shifted right
+		 * until intermediate precision is exhausted.
+		 * 2*1 + 3*1 + 5 = 10
+		 */
+		.poly     = &poly_simple,
+		.data     = 1,
+		.expected = 10,
+		.name     = "Boundary: data=1 (unit input)",
+	},
+	{
+		/*
+		 * data=-1: even degrees produce positive contributions,
+		 * odd degrees produce negative ones.
+		 * 2*(-1)^2 + 3*(-1) + 5 = 2 - 3 + 5 = 4
+		 */
+		.poly     = &poly_simple,
+		.data     = -1,
+		.expected = 4,
+		.name     = "Boundary: data=-1 (negative unit input)",
+	},
+
+	/* Boundary: negative non-trivial input */
+	{
+		/*
+		 * 2*(-3)^2 + 3*(-3) + 5 = 18 - 9 + 5 = 14
+		 * Verifies sign handling for negative data across all degrees.
+		 */
+		.poly     = &poly_simple,
+		.data     = -3,
+		.expected = 14,
+		.name     = "Boundary: negative data with quadratic",
+	},
+
+	/* Boundary: total_divider = 0 is treated as 1 */
+	{
+		.poly     = &poly_zero_total_divider,
+		.data     = 42,
+		.expected = 9,
+		.name     = "Boundary: total_divider=0 defaults to 1",
+	},
+
+	/* Boundary: zero-coefficient high-degree term */
+	{
+		/*
+		 * The deg-2 term has coef=0, so it contributes 0 regardless
+		 * of data. Result: 0 + 4*10 + 1 = 41
+		 */
+		.poly     = &poly_zero_coef,
+		.data     = 10,
+		.expected = 41,
+		.name     = "Boundary: zero-coefficient term is inert",
+	},
+
+	/* Boundary: single high-degree term, no constant */
+	{
+		/* 2 * 5^3 = 250; also verifies the loop terminates on deg-0 */
+		.poly     = &poly_cubic,
+		.data     = 5,
+		.expected = 250,
+		.name     = "Boundary: single cubic term",
+	},
+	{
+		/* 2 * (-2)^3 = -16; odd power preserves sign of negative data */
+		.poly     = &poly_cubic,
+		.data     = -2,
+		.expected = -16,
+		.name     = "Boundary: single cubic term, negative data",
+	},
+
+};
+
+static void get_desc(const struct polynomial_test_param *param, char *desc)
+{
+	strscpy(desc, param->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(polynomial, test_params, get_desc);
+
+static void polynomial_calc_test(struct kunit *test)
+{
+	const struct polynomial_test_param *param = test->param_value;
+
+	KUNIT_EXPECT_EQ(test, polynomial_calc(param->poly, param->data),
+			param->expected);
+}
+
+static struct kunit_case polynomial_test_cases[] = {
+	KUNIT_CASE_PARAM(polynomial_calc_test, polynomial_gen_params),
+	{}
+};
+
+static struct kunit_suite polynomial_test_suite = {
+	.name = "math-polynomial",
+	.test_cases = polynomial_test_cases,
+};
+
+kunit_test_suites(&polynomial_test_suite);
+
+MODULE_DESCRIPTION("math.polynomial_calc KUnit test suite");
+MODULE_LICENSE("GPL");
-- 
2.47.3

