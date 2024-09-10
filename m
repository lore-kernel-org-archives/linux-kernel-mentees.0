Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9922F86E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Sep 2024 01:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725930650; cv=none; b=aaFP7khYIVoFnrGLz9a04hWTTcGGOZoAoDYR4dg7/JsOPzT8wC+8mt+aYKLtGTUFWd984kM7I7KoHuw9WnGKtG/qSFYySw0xxHjnvwcGXtovkKMVu+m9crM8f1fWZ4OSV8N6YLAZbsDI7apDIytyv93OSa44D8y/uYKicKs6yI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725930650; c=relaxed/simple;
	bh=oc9n6anzUCCgh/9mdVpHlXQsIkcCodF2xEspvvmhuHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XjGV5sgsm0gui93GxgXfO2lVxVsBmSYtPU5QOn9Hiuo+h+Fn160IqJc2z0oLar9GoFT7bmdhje27oAsj7Yv2O5cslADo6wMzqmYLooFUt/eqAd2vtOf6P0U38axZDJksdz6dumV6eCWlCL2SOSV2AFEO7MH4yWl/5Lr9TUg193c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAixUiQd; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAixUiQd"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57CF660834
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Sep 2024 01:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMu-W0ygw7Vo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Sep 2024 01:10:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::e32; helo=mail-vs1-xe32.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BA37607F7
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BA37607F7
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lAixUiQd
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6BA37607F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 10 Sep 2024 01:10:47 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-49bd27b3507so1389275137.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 09 Sep 2024 18:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725930646; x=1726535446; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZo3dHoUlvsPvtWs9uI1nqTcMjUn5Xqg5a9hNWOoQ0U=;
        b=lAixUiQddDluN09MRAO5OO6ETA/vQTMsQS03jyrUbs+7LyRHVh+o3qBuvt7wQgNB7k
         Jz/jRQaQxJP7SghU9PFKxh6vfBKS8DlU7W6y6wdY37tnVBafVLsEzvECgGD6BetjaB6N
         EZM8badKmv2gR9eWSFDvzV38HIb4fxorzwBcZrIFDb+zavBJU/gFzNISdFFXZVV61BPC
         U0LjOqCpoG/wP4u2qX3pKNAquhlaOByMWAf7IHNmBN0J0cPwgDpwI+OxIm25vw2Dredq
         po2wgsi6jhwon09Y0FV79rNAnbj3HmM+kvf5kdzVP7CV/Ls/ms22H5bX6Wr78dEwT0LC
         QWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725930646; x=1726535446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZo3dHoUlvsPvtWs9uI1nqTcMjUn5Xqg5a9hNWOoQ0U=;
        b=QWZdVOyqDXGq5nUhmFGodRq2L4IaxOrWbavj1fFhODQidrOsJT5j62S5QvYRiH/d9Q
         H6cDGwXnCFUFwwMpgEf57NjpInFUekI0mFcZaKyJ5nX/Qa8Zm8P3cQGiFzHdNMKE/XnG
         Y47i8mbXj/dupOCfIBmfjNEggjIJeqrcmzgsV2ehU5DMqbzzi6AM5LqaiIbGc5DwTbhf
         sc6iMdSgQVIyHqMxnVp71f49/hRYrjxIh0yOEd/PlPuU7s9z4FzXwZIyHFE0h1DV55aQ
         jQiDJ0teE0vSU8KFdv0IJA5x7aM6I3Cpr0MiJ1f6e2UWnGxL/8W/7/nst0p5rT0YMl3d
         eelw==
X-Forwarded-Encrypted: i=1; AJvYcCXlSbE8ypG3cVCN2wg2EnAO1P/ATZzId5vtQtbafhDGpMkctt9pGgvpCc3pb5KpT8O+2B97CJGrH6VnAjKBJHZ5xRFNTA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxv2QDhJd3dpOSGQcWrWc2Q9SF7HouwlkDLM+VlgfhBnCBI+V3l
	4JWGA4EU/clE2k6BFUiAP5IkJ5ZKfcWJOohwsYkb4EZJmUxd0l/K
X-Google-Smtp-Source: AGHT+IGoJhK2So7eKTIKvEIwazC1BO+otrVme7YefkOZVBJ+ajYsgVH4p6E9Dk+sVmDa9vuxcpJDrQ==
X-Received: by 2002:a05:6102:c0e:b0:48f:cb62:231a with SMTP id ada2fe7eead31-49bde25de59mr9391558137.23.1725930646035;
        Mon, 09 Sep 2024 18:10:46 -0700 (PDT)
Received: from x13.localdomain (syn-142-197-128-048.res.spectrum.com. [142.197.128.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8489ad449acsm622584241.31.2024.09.09.18.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 18:10:42 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: brendan.higgins@linux.dev,
	davidgow@google.com,
	rmoar@google.com
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v5] lib/math: Add int_pow test suite
Date: Mon,  9 Sep 2024 21:10:34 -0400
Message-ID: <20240910011036.15117-1-luis.hernandez093@gmail.com>
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
Changes in v5:
  - Fix kernel test bot warning
  - Rebase with latest
Changes in v4:
  - Address checkpatch warning and make kconfig description longer
  - Use GPL-2.0-only for consistency
  - Spelling fix fith -> fifth
Changes in v3:
  - Fix compiler warning: explicitly define constant as unsigned int
  - Add changes in patch revisions
Changes in v2:
  - Address review feedback
  - Add kconfig entry
  - Use correct dir and file convention for KUnit
  - Fix typo
  - Remove unused static_stub header
  - Refactor test suite to use paramerterized test cases
  - Add close to max allowable value to in large_result test case
  - Add test case with non-power of two exponent
  - Fix module license 
---
 lib/Kconfig.debug              | 16 +++++++++++
 lib/math/Makefile              |  1 +
 lib/math/tests/Makefile        |  3 ++
 lib/math/tests/int_pow_kunit.c | 52 ++++++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 lib/math/tests/Makefile
 create mode 100644 lib/math/tests/int_pow_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a30c03a66172..c415f8ca43a7 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3051,3 +3051,19 @@ config RUST_KERNEL_DOCTESTS
 endmenu # "Rust"
 
 endmenu # Kernel hacking
+
+config INT_POW_TEST
+	tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables the KUnit test suite for the int_pow function,
+	  which performs integer exponentiation. The test suite is designed to
+	  verify that the implementation of int_pow correctly computes the power
+	  of a given base raised to a given exponent.
+
+	  Enabling this option will include tests that check various scenarios
+	  and edge cases to ensure the accuracy and reliability of the exponentiation
+	  function.
+	  
+	  If unsure, say N
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
index 000000000000..34b33677d458
--- /dev/null
+++ b/lib/math/tests/int_pow_kunit.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only
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
+	{ 5, 5, 3125, "Five raised to the fifth power" },
+	{ U64_MAX, 1, U64_MAX, "Max base" },
+	{ 2, 63, 9223372036854775808ULL, "Large result"},
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

