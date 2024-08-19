Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4A09460
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 01:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724031694; cv=none; b=YJrwCo0QzGu9fMN1XXwFZWQDPg4lNFij8Si2Y5x31fqPEwWlOdJK1GGjD/tYVms4k6XaITfXRScvflex4Rl13wd1BUcDd0NjtIAynTIJ0ReH0m/Lo/GgEH45oqT0YQSdUR1yaI50WSchXKxYV4fTn8cRqgMl+81lFGiyChn+Tps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724031694; c=relaxed/simple;
	bh=Nh2IUPVzC3Cu7ZNM0NcDSnF9+JYCItVqEB7NhhbYed4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hUBuNnTx1SwhimtaQ6z2RwDl2vfDLwi+sA8eRuSXZVWAzSUhLnu+7TlSxep3Ey7CqIIlHPWTSIABMpyVYC0JbCHTrl89ID+TWlD/D89AOaRv/7wBdz0BDE8J/fpIdyZi+M3ZHtJ/INXcuLEy4O6yEh02bjn7U3h5ErkuDold+Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnWHS+5j; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnWHS+5j"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30370605AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 01:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsSH2wK1t-RJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Aug 2024 01:41:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30AA3605A0
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30AA3605A0
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OnWHS+5j
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 30AA3605A0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 01:41:30 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-4f6b8b7d85bso1368739e0c.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 18 Aug 2024 18:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724031689; x=1724636489; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPej5M+n6eDs+72yI9568u4PoP3Ufjq7SFsXIfTqhJQ=;
        b=OnWHS+5jipgzNxrSxbV3Bx8xMyIUJ4DFMSWn6PFjheuzfLS9s/UXwDMjFassh2RJf+
         VRG4DfN2nk3SZtEbtCG9YaHL7AA279ueWi9vQ0sZgpbYD8PZl5fCmqtee+8LyyibxeaX
         wrs95O9XxNbZDpwmfd0IpMQyi4NZ6jqZxvdv3ebWz0ld4ZSoNRPAR8wcIaW5J+z7b3lX
         UY6BUz3Pg4I+50KFrCR6wF6sWm6/hcJPg20N9C2j5QOjvV4vFUVQbU0V/tfXRBgsM+HI
         Dm7Jx52hAiUcnFdypouttKepbeTlq8oGlyb5y4owMoz9wH/J6/5+hc1NwYo0vHscuc4K
         t95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724031689; x=1724636489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPej5M+n6eDs+72yI9568u4PoP3Ufjq7SFsXIfTqhJQ=;
        b=cPQqqbMpcnP5EFkNnLXwPXJXfzKyY0yJBxjbYPhZDLXhmE30crsos4bnT4w4vXYtHc
         YuKj9Jv1DYAabDq7snWh2nVEuIMl1p/KnKHgVuvPK+dkGiFVnEn2ctS5c0uGU/l9Pjvm
         3h32DFpmIxfOkMrNLrCuehIbRcw4i2VpJpKuMBOw1b/83roWJKZ8YWM/EIhPZx/Y0+Yt
         9GO5pbXs5pk4Q2ADHdYaq+4v+o7TF5QANkDvVcPyNUljhizic4zjqT0GwVUqMIxhbdws
         kX5MSI4MeJg10IveCjg1VNxYr5VXywvB/iRCwyjTA1S7634g7YqZgUiXHni90THursLB
         HJEA==
X-Forwarded-Encrypted: i=1; AJvYcCXReUX4DYc9Z3HvsKomDeH14DAYjpoJwOgx5bV1zDC6aOW7a4QLJptmebXC9/8MLd44DTg4zrERXTSyCv9uQKzuYO2VeQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyMSpKiUmRh9WmrfyWVX3QPsPEqyW7S+60oQafJ4sCP2S0Z0RR7
	7H83wbyv8LeLpb+dMiyts87wfmAdTrnlr/XCUEGfVv05XDhHwQ58
X-Google-Smtp-Source: AGHT+IHT5tJfFHsNe6fV6zNaZSqMOa/LyftafMLYi1iZMhEcHeaGZcmOKZtJ4RP04Wo7FZxQaA995A==
X-Received: by 2002:a05:6122:a19:b0:4ed:185:258c with SMTP id 71dfb90a1353d-4fc6c71d829mr11796656e0c.2.1724031689468;
        Sun, 18 Aug 2024 18:41:29 -0700 (PDT)
Received: from x13.localdomain (syn-142-197-128-048.res.spectrum.com. [142.197.128.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-4fc5b8c65b3sm973923e0c.5.2024.08.18.18.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 18:41:28 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: brendan.higgins@linux.dev,
	davidgow@google.com,
	rmoar@google.com
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] lib/math: Add int_pow test suite
Date: Sun, 18 Aug 2024 21:41:12 -0400
Message-ID: <20240819014115.221135-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds test suite for integer based power function.

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
 lib/Kconfig.debug              |  9 ++++++
 lib/math/Makefile              |  1 +
 lib/math/tests/Makefile        |  3 ++
 lib/math/tests/int_pow_kunit.c | 52 ++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 lib/math/tests/Makefile
 create mode 100644 lib/math/tests/int_pow_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a30c03a66172..b0bbd30d4cba 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3051,3 +3051,12 @@ config RUST_KERNEL_DOCTESTS
 endmenu # "Rust"
 
 endmenu # Kernel hacking
+
+config INT_POW_TEST
+       tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
+       depends on KUNIT
+       default KUNIT_ALL_TESTS
+       help
+         Enable this to test the int_pow maths function KUnit test.
+
+         If unsure, say N
diff --git a/lib/math/Makefile b/lib/math/Makefile
index 91fcdb0c9efe..3c1f92a7459d 100644
--- a/lib/math/Makefile
+++ b/lib/math/Makefile
@@ -5,5 +5,6 @@ obj-$(CONFIG_CORDIC)		+= cordic.o
 obj-$(CONFIG_PRIME_NUMBERS)	+= prime_numbers.o
 obj-$(CONFIG_RATIONAL)		+= rational.o
 
+obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
 obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
new file mode 100644
index 000000000000..6a169123320a
--- /dev/null
+++ b/lib/math/tests/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_INT_POW_TEST) += int_pow_kunit.o
diff --git a/lib/math/tests/int_pow_kunit.c b/lib/math/tests/int_pow_kunit.c
new file mode 100644
index 000000000000..e04dd73dabd1
--- /dev/null
+++ b/lib/math/tests/int_pow_kunit.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <kunit/test.h>
+#include <linux/math.h>
+
+struct test_case_params {
+	u64 base;
+	unsigned int exponent;
+	u64 expected_result;
+	const char *name;
+};
+
+static const struct test_case_params params[] = {
+	{ 64, 0, 1, "Power of zero" },
+	{ 64, 1, 64, "Power of one"},
+	{ 0, 5, 0, "Base zero" },
+	{ 1, 64, 1, "Base one" },
+	{ 2, 2, 4, "Two squared"},
+	{ 2, 3, 8, "Two cubed"},
+	{ 5, 5, 3125, "Five raised to the fith power" },
+	{ U64_MAX, 1, U64_MAX, "Max base" },
+	{ 2, 63, 9223372036854775808, "Large result"},
+};
+
+static void get_desc(const struct test_case_params *tc, char *desc)
+{
+	strscpy(desc, tc->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(int_pow, params, get_desc);
+
+static void int_pow_test(struct kunit *test)
+{
+	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
+
+	KUNIT_EXPECT_EQ(test, tc->expected_result, int_pow(tc->base, tc->exponent));
+}
+
+static struct kunit_case math_int_pow_test_cases[] = {
+	KUNIT_CASE_PARAM(int_pow_test, int_pow_gen_params),
+	{}
+};
+
+static struct kunit_suite int_pow_test_suite = {
+	.name = "math-int_pow",
+	.test_cases = math_int_pow_test_cases,
+};
+
+kunit_test_suites(&int_pow_test_suite);
+
+MODULE_DESCRIPTION("math.int_pow KUnit test suite");
+MODULE_LICENSE("GPL");
-- 
2.46.0

