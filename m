Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812541DD0F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 20:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733949271; cv=none; b=gVchXUe+a+LJUPQe6YRdR5VGS0gy7xxD67gCKDYeuNVD07aV5cX0LgEuVN1B5q1v95z/zeX1KRVN9KP4106L1DWvQzJdiF3EJYTAN3cJw5LZUbj1BiEFcx4nkDqnBBXKdh9hoJiyII048kEPoNAGi6GPKh/68YMP4BcnUUTovic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733949271; c=relaxed/simple;
	bh=5YmXEGP/cRY+RRUpDdkGmpMKmYheop2H/JG7afWhz/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m9mXqwtzMZXDJO/N0i3eBwcR8X2kIKPLdxo7iCnbPjPMx5l/5tQd9nGRPS9sYWS3Z+bWJR9U922AVjfZq8LrOx6SggxGtTjheCxQad7jnc6RsSznMrf6b4U+7HiGEwjApFXSVwS9iwxp+AmVkKCT/U+ADk7UpKVuBGlDjE4EgIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjmvCaZ8; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjmvCaZ8"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 233B4606E6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 20:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ab5GmyKe7MDo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Dec 2024 20:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B654610A1
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B654610A1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OjmvCaZ8
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3B654610A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 20:34:28 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6f0054cb797so35073347b3.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Dec 2024 12:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733949268; x=1734554068; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BtG47wpF97tJaGwTw5HnbCfBrRILA4erhzS9QHvmhs=;
        b=OjmvCaZ8DtG+QuKYvQj6lZs8uoBRo2bOD2s1LTT2P6EXGDqkiS5rvA0ZAFGJilJp8+
         IBoYeRCSXGKlJLywvqeMC6pYIB8MaWCN25udaqSMarJ1tkCCSK9nqXkZtslvVhd3HFex
         kO9jQd/wLrNTmFZKmk65GdF7HAs07s9cjyQ5gnMLykt1KKDS4HmtF1URbUOq+4HRrzD3
         sKH4hHqLQZyI6b2zyaHtSwPbdEnE1wOEZ/Zai7aInjxMmcX38n0PXIrcrlcxPDfTg215
         yc06lkNRnCqmGI6gEX7Y26b/F3bpkDsZh/69YV43uBfmpTAEdS/Q849yJ1FObJ4nAhfy
         baPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733949268; x=1734554068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BtG47wpF97tJaGwTw5HnbCfBrRILA4erhzS9QHvmhs=;
        b=Vumywr4gf8U1LfYfJNgVCVaCpO3sv5lapmtGY/3MlSe2cUlYRhrHHgaK4sRtkQbhKD
         uNuXAmVAL+U0e6s/lKaVDjw9sajuRwZB7BYeabd/5TxHNAspoONueA8uBQ/h26u8LLCk
         hoWbBOQTgGSHd3w/AweUWtxFF5hb3e6fmhI+rIgcKyo5nWPqo4VG5i5pUBZ3eKNZfsPO
         5x69OPTk7Jd8QWogFdd6ofuimTD7hl/5pkny8JlEZ7FFJUym041sXdejsru42GRbIr0S
         EV4a5BVYAr9VqY+k8aurbfKeKyg7Wy3Ou7dwoobtBfcXzKEKLkkdbn6b8Sbd93cAFoAR
         iehA==
X-Forwarded-Encrypted: i=1; AJvYcCVRprOw2ylDUrrJfbYcXlTLofwPfjvlWaNqFW9xkzQNGe6A8zBffsiAsa6GrCXgIiOkN59HF1Trr+LzjEaDiJ9f+p3u1A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyTgL4QKq39qRVcYT55uJx9F4+CoNVNeXB54DisNm5idAJuTday
	EDdjhx05nZbUF0TBrGYojzGfdtWc4n2+6Vnipqb3UQD6r8+SbnsU
X-Gm-Gg: ASbGncui69jd7+iA0mEAqvqBIB3NtWd8XMpVsf2S0TYCwwOeNd3VKBzBgQ2q1Qio0Bz
	V6M9LsQTLZNaQ1icptplAlszqmDLY2R7+20BnsZqv0N3SVxYWOAEN7w7SLKY9Vj0Fk4FQ48olbR
	Oz4kmgAWPmDxOtMcfw2+L+YZXcwxkQ9jiP9MfQOq/EC7ZTGoT3dtzQWqmHTwHOCxupw6ivBWMkl
	WSTtF3vmZ6YfonY4v3cV8ZXGtnieW7yC7Ic934WIGvZyqvXw5lvHQ0=
X-Google-Smtp-Source: AGHT+IGkJHn8xVW0GUURiFqM8Cqzl0Yz4EdO59oL+4NxZBj9hxdo5M9IEBzLs92qQhEGeqBhpTyG+Q==
X-Received: by 2002:a05:690c:886:b0:6ef:800c:6394 with SMTP id 00721157ae682-6f19e50e402mr11025057b3.37.1733949267580;
        Wed, 11 Dec 2024 12:34:27 -0800 (PST)
Received: from x13.. ([157.23.249.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f14cdaa101sm3978227b3.58.2024.12.11.12.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 12:34:27 -0800 (PST)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	rbm@suse.com
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	skhan@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] lib/math: Add int_sqrt test suite
Date: Wed, 11 Dec 2024 15:34:24 -0500
Message-ID: <20241211203425.26136-1-luis.hernandez093@gmail.com>
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

Changes in v5
  - Address review feedback by Nicolas Pitre
    - Make edge case portable by not relying on arch dependent macro
    - Add more edge cases
---
 lib/Kconfig.debug               | 15 +++++++++
 lib/math/Makefile               |  1 +
 lib/math/tests/Makefile         |  1 +
 lib/math/tests/int_sqrt_kunit.c | 60 +++++++++++++++++++++++++++++++++
 4 files changed, 77 insertions(+)
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
index 000000000000..a94c68816a1a
--- /dev/null
+++ b/lib/math/tests/int_sqrt_kunit.c
@@ -0,0 +1,60 @@
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
+	{ 3, 1, "non-perfect square: sqaure root of 3" },
+	{ 4, 2, "perfect square: square root of 4" },
+	{ 5, 2, "non-perfect square: square  root of 5" },
+	{ 6, 2, "non-perfect square: square root of 6" },
+	{ 7, 2, "non-perfect square: square root of 7" },
+	{ 8, 2, "non-perfect square: square root of 8" },
+	{ 9, 3, "perfect square: square root of 9" },
+	{ 16, 4, "perfect square: square root of 16" },
+	{ 81, 9, "perfect square: square root of 81" },
+	{ 256, 16, "perfect square: square root of 256" },
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

