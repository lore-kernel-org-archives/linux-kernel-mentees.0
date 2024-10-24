Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B43189F5F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 19:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729799720; cv=none; b=AobRSZ1wFzR6gAk139UJodQ/HULrySLBhaimd6bML5DZkGUcp77anCWCj+O+GQz6cDsrmXbum7ku9nTdp/JIyaCRbhqpX+YO18iVgWN/zcc8o9KdTq2ZfIFXu6kLvOEUzyPT/ZNDuGADlubBzC0/0+co2RpR8Ddi8WW+pDxoHeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729799720; c=relaxed/simple;
	bh=YUcfI3mJydqMZ5SbUUyKpBqgyyQ1WhBvhzCjDpbUXAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNYmbeHyTpECxzaKAjXFsBMPXh3GuS6sAEP04V2xK8YwNX1GuMHTYIyWMdhhvx7MKuG5gVs2Fdegd/KvOC45718ocnvip+BD7UK7YXJgdLQSK8YCQmIeRod6tjj/DTXZ8A5GMaAYlqFopH82PS/v9dDn2iSFaPJCgiOyGJOV1AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKf7+uIi; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKf7+uIi"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC25840BA7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 19:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnuHhoKyVY2g for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Oct 2024 19:55:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F3004044B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F3004044B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KKf7+uIi
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7F3004044B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 19:55:17 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso1448349276.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 12:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729799716; x=1730404516; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQbL6xtxKdi2l7nN5S7Vs3vuzfztUrnDWB3s/MG43AU=;
        b=KKf7+uIiIVAbyAOZvlybtO+jV0xIA9m3bAqWaOni8PAPPTLqIvtbwfPkvXelHU8O7o
         ejZP5J2jF11KVTJDSvS10jBq7QUlqVINaFG/uxHQ+lecodEDDjAqFgx0ks5sAoidhYvr
         KStiF/qLJe+/JGQgxXqSC7elo5t+Vog1rrVO2OEv0Ur6HdMvrU8lg6+XS58D9FhqDLNv
         Cijg3YmiwPKHo573IcTsfgBUce2bCc+vAW1HTnud9VK+s1E4TylK4QJIpoWdZ+wQlcyZ
         ZW8juceLCTFFUtF8BmhrAY48WQ5h1sqlwbXrHm0lSWJQm0cdbxoB1dVMbBbUkl3cFFti
         bzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729799716; x=1730404516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQbL6xtxKdi2l7nN5S7Vs3vuzfztUrnDWB3s/MG43AU=;
        b=jtjU123sAqtjWINoIKTHbyXoOvl88VxeCyMzFVd+uW7bDvlRqJZctnV76BmHUTehm7
         2RRYaA0hmzZkL+azg/tVqx2gOI1yEGp4rfqJWlqJGmpAId6Ef6iNKmbuaZ5OGg4DtvvO
         vGH/W3yFF8/E2RTm5KBKC+4TG2MQl1mz3YxbLom/UpAK0AweGOZpeavoF9+JZoWw6+LN
         8F/0yozdle6Xck595tdyvsOyLz2O6jIwPbFkZLo5FuKWPIlQU6rdUlZ8CY+VZBzRNjS2
         EB5KPyRtBWjPwiw2t8xtJSRAokp4b85fjwFlnMF970/15yQT0iBCKL6bGj3SDDcjMVL5
         ilXg==
X-Forwarded-Encrypted: i=1; AJvYcCUFZZe9pfbmFPAJlzDgP8wEvAM1LJRwseTggVI3ItnvnmJmCG+iOtSjuMaWfxJYsKCAyr71WS7MM0qPBmw7gtwdIq5TUg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywqec7gwXqcswdFhLtXM24E4AMQ2kZnBkTWZjEmI0B5KgGWVGbN
	9aHniJIu1Stx/goUOlSsAemlrgbhw9QE3O5gQxUgvGjdieBABosv
X-Google-Smtp-Source: AGHT+IEFgp8o1SzksY5ernF9kkYPxkwMOor1qgU4ZUNCodmKUOEuvE8Z7c7hjA5y7ESax62tTgQPzw==
X-Received: by 2002:a05:690c:6f8c:b0:672:e1f2:feef with SMTP id 00721157ae682-6e866332642mr41647867b3.43.1729799715765;
        Thu, 24 Oct 2024 12:55:15 -0700 (PDT)
Received: from x13.. ([157.23.249.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5a4d396sm21296137b3.38.2024.10.24.12.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:55:15 -0700 (PDT)
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
Subject: [PATCH v2] lib/math: Add int_sqrt test suite
Date: Thu, 24 Oct 2024 15:55:09 -0400
Message-ID: <20241024195511.72674-1-luis.hernandez093@gmail.com>
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
 lib/Kconfig.debug               | 16 +++++++++++
 lib/math/Makefile               |  1 +
 lib/math/tests/Makefile         |  1 +
 lib/math/tests/int_sqrt_kunit.c | 51 +++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 lib/math/tests/int_sqrt_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 7312ae7c3cc5..772c681dff3e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2993,6 +2993,22 @@ config TEST_OBJPOOL
 
 	  If unsure, say N.
 
+config INT_SQRT_KUNIT_TEST
+	tristate "Integer square root test test" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables the KUnit test suite for the int_sqrt function,
+	  which performs square root calculation. The test suite checks
+	  various scenarios, including edge cases, to ensure correctness.
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
index 000000000000..a93aba31cd05
--- /dev/null
+++ b/lib/math/tests/int_sqrt_kunit.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <kunit/test.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <limits.h>
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

