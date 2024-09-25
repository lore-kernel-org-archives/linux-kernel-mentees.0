Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8169114831E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 25 Sep 2024 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727232979; cv=none; b=pAY3+nauj875PmM04ET4v44E7NTSAhev7jUHtfqEscdsvOO5zbFkBG8quQr6DEaF/eMYq+FwUscnbmnXE0mxmxGqnLRn3KOJe6DUl2/LzZwzPDa8tn/FlU2JYYRD7T0QKG9Qfb0djlKFGjt5/Xv4mLOp6Cxkb8SybRj3XESbrEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727232979; c=relaxed/simple;
	bh=4vfi5x6jlpdB8GyEDWYR0w8HiOGTIIh2/6DFiSsr4aM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XcPGXTqleD+GmXOZx+m/ruT98izbyGqjLedBrj4zSqpCfhNmFhjzq93K2nN9bXG74r8cf+IMuhwgkGexC0GnqvCjcv+1Cz4wwJ9BmYaLZpl0aA8q2Oseab3P5YBE0jxEGEHx0qjW8c2IIFmIfgk2B60bbkqlHwpKxNTw5Hank4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6zEFMna; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6zEFMna"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20507848DA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 25 Sep 2024 02:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8xV0ACviDxT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Sep 2024 02:56:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com; envelope-from=brunofrancadevsec@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37477848D9
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37477848D9
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i6zEFMna
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 37477848D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 25 Sep 2024 02:56:16 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-503f944f174so1277063e0c.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 24 Sep 2024 19:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727232976; x=1727837776; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0pgJW2Tr2MUvWqYnkmAdG88VwBWaC6dIXhvLCOKUEQ=;
        b=i6zEFMnawibStZcvms3hs5vUP2El7rMzF8iGS5kIuSdMpmGHr9Mo4EyAvqJ6KzVu6A
         X520DOcjADils5gy6L3QDgLNnWAhdNfZ6bIswk9dOA48ZJ3a+6FovQ7zTVvWR4Kr9pRv
         mmwcXhNOQP7L/UNyGv8cCpQyl6NBxr6vwbEOLYnfECKYeo1Wd1AmddWaJfqbxEtmIZPL
         7Y4UVQCyUyte6GkBSGaWbhpmTVd1ysyQmq79h8W+rsrKYlmyZajQETK14ZWQEPXBCpLI
         Md+MBar3webmRn8IEhLjggWn9lxvdDyAyioEKzbGScdRzFvsmVV4EtpXK5HnYd6Jetk8
         KKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727232976; x=1727837776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0pgJW2Tr2MUvWqYnkmAdG88VwBWaC6dIXhvLCOKUEQ=;
        b=fWT29K+DWTBqLtaP9/dMqO0MffaGFyV1FqP1HJ5NvBg+vMncIHY0ptWbo/i17uLjfi
         o26zgJyijCVvkvk6Obpsk9pD1i++/Q0s9oGCiWRsnxNk0vjFE13EmbU2E2ZbDTJFjLBq
         zfAYlYngqWPlUdZMdXXIiTNb8w+/dXjw2yR95F1JLDkE7vZIR37brhr3aPG2ZSzgQtMv
         RJSH0xFaBy/dY0AdH54uT2HCJyNSfAaUywVcPjkGODsfcAT0TCcmlS7/7vEDxByx37bM
         ayvvluogkvKkFHvYWIiaIn/5fsH+2qQ8LQXGuFw8W8Vx7Twk1yoIF8063fIeMK1JqEC/
         lzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYzkYr3LRUDeTtW2bld4Aglo+QPWM43ocFYPGllWBrIvkb25lbUhUL3Od5hC/8nEOoIFNKCR1NG9X45xcODNZVbGs8Jg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw9sNe5iGleprxNcNei3CbKDKxXOI/nENuYmktbgXrWw5l1SX1P
	xIUfnqVbXlU36s8cUD1UxrGdyd6D2/rFVo5KDkrx5/XC0JlxcWUe
X-Google-Smtp-Source: AGHT+IEKu6zQlFpimo9I1REY17XJCoQxB016Upip39ZNZXMHZyu1t8M5hGkNkEJxP//4dx6M9dg84Q==
X-Received: by 2002:a05:6122:4681:b0:4ef:5e6b:98c0 with SMTP id 71dfb90a1353d-505c20a2609mr1933410e0c.9.1727232975617;
        Tue, 24 Sep 2024 19:56:15 -0700 (PDT)
Received: from hilb.. ([187.11.199.58])
        by smtp.googlemail.com with ESMTPSA id 71dfb90a1353d-505a9efb0a2sm1633103e0c.2.2024.09.24.19.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 19:56:15 -0700 (PDT)
From: =?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
To: akpm@linux-foundation.org,
	davidgow@google.com,
	linux-kernel@vger.kernel.org,
	rmoar@google.com
Cc: kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	=?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
Subject: [PATCH v3] lib/math: Add int_log test suite
Date: Wed, 25 Sep 2024 02:56:06 +0000
Message-ID: <20240925025606.1714-1-brunofrancadevsec@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This commit introduces KUnit tests for the intlog2 and intlog10
functions, which compute logarithms in base 2 and base 10, respectively.
The tests cover a range of inputs to ensure the correctness of these
functions across common and edge cases.

Signed-off-by: Bruno Sobreira França <brunofrancadevsec@gmail.com>
---
Changes in v3:
  - Fix checkpatch issues reintroduced in v2
Changes in v2:
  - Fix the overflow warning reported by the kernel test robot
---
 lib/Kconfig.debug              | 11 +++++
 lib/math/Makefile              |  3 +-
 lib/math/tests/Makefile        |  1 +
 lib/math/tests/int_log_kunit.c | 75 ++++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 lib/math/tests/int_log_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index bc8faa4509e1..b0f658b0f29f 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3089,3 +3089,14 @@ config INT_POW_TEST
 	  function.
 
 	  If unsure, say N
+
+config INT_LOG_TEST
+	tristate "Integer log (int_log) test" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables the KUnit test suite for the int_log library, which
+	  provides two functions to compute the integer logarithm in base 2 and
+	  base 10, called respectively as intlog2 and intlog10.
+
+	  If unsure, say N
diff --git a/lib/math/Makefile b/lib/math/Makefile
index 3ef11305f8d2..c3fd967bc49b 100644
--- a/lib/math/Makefile
+++ b/lib/math/Makefile
@@ -5,7 +5,8 @@ obj-$(CONFIG_CORDIC)		+= cordic.o
 obj-$(CONFIG_PRIME_NUMBERS)	+= prime_numbers.o
 obj-$(CONFIG_RATIONAL)		+= rational.o
 
-obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
+obj-$(CONFIG_INT_POW_TEST)  	+= tests/int_pow_kunit.o
+obj-$(CONFIG_INT_LOG_TEST) 	+= tests/int_log_kunit.o
 obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
 obj-$(CONFIG_TEST_MULDIV64)	+= test_mul_u64_u64_div_u64.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
index 6a169123320a..83bbf1e47940 100644
--- a/lib/math/tests/Makefile
+++ b/lib/math/tests/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_INT_POW_TEST) += int_pow_kunit.o
+obj-$(CONFIG_INT_LOG_TEST) += int_log_kunit.o
diff --git a/lib/math/tests/int_log_kunit.c b/lib/math/tests/int_log_kunit.c
new file mode 100644
index 000000000000..025748cd0bbe
--- /dev/null
+++ b/lib/math/tests/int_log_kunit.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <kunit/test.h>
+#include <linux/int_log.h>
+
+struct test_case_params {
+	u32 value;
+	unsigned int expected_result;
+	const char *name;
+};
+
+
+/* The expected result takes into account the log error */
+static const struct test_case_params intlog2_params[] = {
+	{0, 0, "Log base 2 of 0"},
+	{1, 0, "Log base 2 of 1"},
+	{2, 16777216, "Log base 2 of 2"},
+	{3, 26591232, "Log base 2 of 3"},
+	{4, 33554432, "Log base 2 of 4"},
+	{8, 50331648, "Log base 2 of 8"},
+	{16, 67108864, "Log base 2 of 16"},
+	{32, 83886080, "Log base 2 of 32"},
+	{U32_MAX, 536870911, "Log base 2 of MAX"},
+};
+
+static const struct test_case_params intlog10_params[] = {
+	{0, 0, "Log base 10 of 0"},
+	{1, 0, "Log bsae 10 of 1"},
+	{6, 13055203, "Log base 10 of 6"},
+	{10, 16777225, "Log base 10 of 10"},
+	{100, 33554450, "Log base 10 of 100"},
+	{1000, 50331675, "Log base 10 of 1000"},
+	{10000, 67108862, "Log base 10 of 10000"},
+	{U32_MAX, 161614247, "Log base 10 of MAX"}
+};
+
+static void get_desc(const struct test_case_params *tc, char *desc)
+{
+	strscpy(desc, tc->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+
+KUNIT_ARRAY_PARAM(intlog2, intlog2_params, get_desc);
+
+static void intlog2_test(struct kunit *test)
+{
+	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
+
+	KUNIT_EXPECT_EQ(test, tc->expected_result, intlog2(tc->value));
+}
+
+KUNIT_ARRAY_PARAM(intlog10, intlog10_params, get_desc);
+
+static void intlog10_test(struct kunit *test)
+{
+	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
+
+	KUNIT_EXPECT_EQ(test, tc->expected_result, intlog10(tc->value));
+}
+
+static struct kunit_case math_int_log_test_cases[] = {
+	KUNIT_CASE_PARAM(intlog2_test, intlog2_gen_params),
+	KUNIT_CASE_PARAM(intlog10_test, intlog10_gen_params),
+	{}
+};
+
+static struct kunit_suite int_log_test_suite = {
+	.name = "math-int_log",
+	.test_cases =  math_int_log_test_cases,
+};
+
+kunit_test_suites(&int_log_test_suite);
+
+MODULE_DESCRIPTION("math.int_log KUnit test suite");
+MODULE_LICENSE("GPL");
+
-- 
2.43.0

