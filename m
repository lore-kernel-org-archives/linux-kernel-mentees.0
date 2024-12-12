Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A385813B284
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Dec 2024 02:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733969590; cv=none; b=doX+UWxU71fHJrDzVjfjgC/Vi+/Nv22/WqoQCeIktItcvxpVejKY2la2HnOu073tbTgHMacvrnrsQpRwKGM/UQG5W6roQlBRGQN2gVRMwKqIV980UL+6XUW/I4smckfuypqzUXLaDH+OHo2OjjzZqa4OjComDg9blNk/wrsCkjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733969590; c=relaxed/simple;
	bh=fFWHZp3MKlJnD43x2f0Z1mHjW9ZEBYL4CSXNLKb1tEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kYT5hTmpX6bWrM0kSwD9ry6neoylpuH7EYfgWHoZYQEW6rEscvMvQ6HpHSIo1eAl5AN358Ozhf5v/FpQ+a59tmR99RJ7WnejHRIrkfo7i0eEYPHFsfJUy2fREvyFQA39SVN300d6ii9x8fDAC4rHSN1egEnE0gU5aKweY5O5eio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azgXTAjP; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azgXTAjP"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38D24403C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Dec 2024 02:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPj3tSAoL-z1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2024 02:13:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::e32; helo=mail-vs1-xe32.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD8B240357
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD8B240357
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=azgXTAjP
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AD8B240357
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Dec 2024 02:13:06 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-4afd56903b7so13957137.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 18:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733969585; x=1734574385; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0Y0wtLjBQsvZ6KC9hEfpTSMmwYeVYfpKKwx+sndi6I=;
        b=azgXTAjPVqWE2JppqcIBQ2ui+W7R7vdUsoeK2/vpz/aeEUyP7nLtJYKJoy+P/QfbMB
         90gqt/c91/cr0OYTM7+lFrsZBAUARfLX6zUaI7C0uBWMgy5JxVWiWsmhnxPWU60FDuFY
         him48ry2WSFBHa9OG4vah39+wKixkzkAXmDlHsCljK15UBat378wcdRS+ksOEmx5IJha
         d4j+NqEG436uTaJbl/z8ma/zL8aFN/U6DUcyPCt/8KYzYt7XMhSC/tel2T0S4d5T9xpx
         8MNHOMP+yJ+kdlPtuqWnNGDfM+7hYiKFj2f2ORnOaSqz9p7UyhR2e3/nouvOMwTkjnx0
         rNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733969585; x=1734574385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0Y0wtLjBQsvZ6KC9hEfpTSMmwYeVYfpKKwx+sndi6I=;
        b=O5uXGopfDAv5FmRgCseBjYH7myJjaB7iq3UVugcOlgmBI3xTcOrd+hS33f0SRMGpSm
         NoSiN7DZfjkbtBYQc8NAlD+sUASl4ieDBn3hKYSKxATRI6kIIDz5KxlLCVBBDiTbU6v8
         GnSLK7Burrjba0VTBNeW6kX/ZDR0PfmNrxWFuL6JXDYTyOj1PBS3d59k9OGFKvt4n5m2
         knmT4/k8jXEWuB6fJc9h7ItPgrHAxdhIsH3M6KwJpqANlSOOmeur01eItrp65a9i+WXM
         0AfyZ5dto7ifqKSgl3Ww8X2Bw6evmT9ySurU1V/xh8S7eQG5sYb1k3AIJ0vgt1iENEYd
         fxzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLGsidqcYxXFSYxkBbH15cRAZN1XZ8FgPl/cthw+5tAx01ANTI+iFqAwM4UDvFtd4SONLLazxavw2Lau6zJnHfCGw2yg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwIB13veVlnU/jC0HxiOdxtVhtRNHF7WUVjBSYJFGc4TgF0osEs
	mon6AN9R6Rmx06GmolVa097ph/XPBGWyC/akbi506kQPBmBUqNv2
X-Gm-Gg: ASbGncsd0hHY8zfJO38d0AuTX0PMH42pdFRkNK1s6+7ZLmpziVxZWlqM81rJblZbdeF
	C4567mqXGO4yoQM7ehofqPCRHupOypZBYggMHhyTUoT4pdoUOPnTPYoDvTUAu7HFKvyNMo6/Lu1
	RKUPRli9OHqitfhpoNCLAh1ewvgnUa99inlj7OmuTzSotijMpUH8joUjTrKXSbI44l0hxYAw1Me
	J+8AdWGOv5MuWUXycs60dVbvYCdIweHk5S1E4V1dWExEB9dI5h3UqshaFVnuANkw9RKn25guBPI
	t5Md9vjI0IlZo4n/WfzJjM44Fa/qkFhsqyzb
X-Google-Smtp-Source: AGHT+IFZbNn3kVb+kdh/aW+wmULIGh6BRjietFwtPeF+ZgMWgQ2LphVM3LQ3meQJQywglQBrzt3OVg==
X-Received: by 2002:a05:6102:5487:b0:4af:3973:6b22 with SMTP id ada2fe7eead31-4b2478a8ffcmr2253585137.22.1733969585166;
        Wed, 11 Dec 2024 18:13:05 -0800 (PST)
Received: from x13.localdomain (syn-142-197-128-048.res.spectrum.com. [142.197.128.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2b9f7980sm1886933241.13.2024.12.11.18.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 18:13:04 -0800 (PST)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: davidgow@google.com,
	akpm@linux-foundation.org,
	npitre@baylibre.com,
	stern@rowland.harvard.edu
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	u.kleine-koenig@baylibre.com,
	skhan@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	rbm@suse.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] lib/math: Add int_sqrt test suite
Date: Wed, 11 Dec 2024 21:12:58 -0500
Message-ID: <20241212021259.20591-1-luis.hernandez093@gmail.com>
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
  - Remove unnecessary new line after Kconfig entry for INT_SQRT_KUNIT_TEST
  - Correct int_sqrt instances with int_sqrt() in commit message and kconfig
entry desc
  - Fix limits.h header include path

Changes in v4
  - Fix Kconfig entry: remove redundant word test

Changes in v5
  - Address review feedback by Nicolas Pitre <npitre@baylibre.com>
    - Make edge case portable by not relying on arch dependent macro
    - Add more edge cases
Changes in v6
  - Address review feedback by Alan Stern <stern@rowland.harvard.edu>
    - ref: https://lore.kernel.org/all/ad95d09e-ddbe-4d43-bf22-00c2008823d8@rowland.harvard.edu/
    - Correct recipient list
    - Spelling and typography fixes
      - sqaure -> square
      - remove extra white space
    - Add edge cases to validates boundaries around perfect square
---
 lib/Kconfig.debug               | 15 ++++++++
 lib/math/Makefile               |  1 +
 lib/math/tests/Makefile         |  1 +
 lib/math/tests/int_sqrt_kunit.c | 66 +++++++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 lib/math/tests/int_sqrt_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f3d723705879..147d9fef42e7 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3161,6 +3161,21 @@ config INT_POW_TEST
 
 	  If unsure, say N
 
+config INT_SQRT_KUNIT_TEST
+	tristate "Integer square root test" if !KUNIT_ALL_TESTS
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
index 000000000000..1798e1312eb7
--- /dev/null
+++ b/lib/math/tests/int_sqrt_kunit.c
@@ -0,0 +1,66 @@
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
+	{ 0, 0, "edge case: square root of 0" },
+	{ 1, 1, "perfect square: square root of 1" },
+	{ 2, 1, "non-perfect square: square root of 2" },
+	{ 3, 1, "non-perfect square: square root of 3" },
+	{ 4, 2, "perfect square: square root of 4" },
+	{ 5, 2, "non-perfect square: square root of 5" },
+	{ 6, 2, "non-perfect square: square root of 6" },
+	{ 7, 2, "non-perfect square: square root of 7" },
+	{ 8, 2, "non-perfect square: square root of 8" },
+	{ 9, 3, "perfect square: square root of 9" },
+	{ 15, 3, "non-perfect square: square root of 15 (N-1 from 16)" },
+	{ 16, 4, "perfect square: square root of 16" },
+	{ 17, 4, "non-perfect square: square root of 17 (N+1 from 16)" },
+	{ 80, 8, "non-perfect square: square root of 80 (N-1 from 81)" },
+	{ 81, 9, "perfect square: square root of 81" },
+	{ 82, 9, "non-perfect square: square root of 82 (N+1 from 81)" },
+	{ 255, 15, "non-perfect square: square root of 255 (N-1 from 256)" },
+	{ 256, 16, "perfect square: square root of 256" },
+	{ 257, 16, "non-perfect square: square root of 257 (N+1 from 256)" },
+	{ 2147483648, 46340, "large input: square root of 2147483648" },
+	{ 4294967295, 65535, "edge case: ULONG_MAX for 32-bit" },
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

