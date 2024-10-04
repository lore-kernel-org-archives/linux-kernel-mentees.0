Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD01E7C1B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Oct 2024 18:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728067646; cv=none; b=pymp9HXKq/HtqYHUfLjQTlah3ycsB9+aYzirTwhg6tTlimq05KaU4wyq0K7wyYo7TWDmwXq/xIkf/RQNs+Vkq2hRlMxhxgnMNrQj9PBO4sS41T+kHqXBwZLljtK3Zn8h4GeZlfAkvloP2dPOxXbWPh9/zPShq76sbXrF0xpjEMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728067646; c=relaxed/simple;
	bh=V03GFNzD11CECPmUTDDQ0S68l5jzC/7sxNfkJ3eRzXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fPSMTtk3S/HeR0G58YtHjpsJ/IcsmQT22MFKa+biuDpURIZd+Dg61YIqNNn6n+gtqpRQL1wU6uL9qzL1No530VhX0WbxCcgxyZAms5YpssAZL2xbkNO7wfmqVrwBPjg5xwA5vty1Fc+pBiG/NkaEXHQnz3QfPwywUAw9v/drAq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCcM1UIs; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCcM1UIs"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1D2240146
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Oct 2024 18:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZO_aCanMVfE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Oct 2024 18:47:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=brunofrancadevsec@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D26634011A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D26634011A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UCcM1UIs
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D26634011A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Oct 2024 18:47:23 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20b86298710so21392295ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 04 Oct 2024 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728067643; x=1728672443; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qFdjl4nnT3iOUyZk1xlx2SlCDfY3Jc7r1BLQPkD7dFI=;
        b=UCcM1UIs2nWH7l+20FMOAMFcMa0x8IClAS9fRsMETG4s2iud1vPgYQd8H45uFntkXU
         vFYWizeiRdjV6e5BAAIVTXBYrge/uRwbtPMdb8bLgC1CG7LOoPShwhRYEAiJqbn9FrDP
         3KHeFZFBH5Vf3vjNkHGXLC0sTvLVYeM5O6i0sIPRJn0ANr9rfyDw/GvZZuanlvWdJald
         8BfYdI3qaEEXwFBzUe4Lu6cNoqcpjk0iVTekNp6xhIA6YYz+KwpexGtQNQTjZowucRir
         tBApvfOGBaBSGNEs834K6h3ad4BHcOg70Lv5PC9xjp7cJE9hS29enTbEFaRvVG0X2Q2s
         FwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728067643; x=1728672443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFdjl4nnT3iOUyZk1xlx2SlCDfY3Jc7r1BLQPkD7dFI=;
        b=glq/wGxGJ7dOiFrQjtfGejXWY7VP91VsQ0BzS5VgkGtB2BWZWZ3N0rEP8U32VIASDX
         WU828CMB4LI1Ela8LbDXKnHsRGXBZxRY70C7WvgNXGLIHSIwK79ODlm+T0Y07dzj9TQk
         6FJb3SYn0uiDbUdOx98F2RzO2BWDIdqlARYAas0RijR6ZUC2zmrwQcd5ISO6QVj32UzG
         kDh9nLnBXmXmHJvBYezwmk6Or/97YwxtZeA7KGeZMY5CHyICnRmSDS8N/BmtJ+4KjUoJ
         J367P8X7ADUfFVT2DgRvOqkfzhRFDygEt5EStmRndGF1fdQIhMpYBDqzOvjhafV3JjNF
         g0Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVltglN6LDPBR1O+VKQmmK3XnjQ2sWH65tj/RbzBOlzWxzBmEEpwJcbjQGVot7etP/gZD9ruTxhKU/YuThyoI1vS3fDgQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzg7IaGe9+ZO6U8DVo6ZJqX2GJbbJvKrhOaV6rdL0mSL5XH49nQ
	YEfDDWB++TLYm8iyIqec/FpP/+ZOjfnin6LOiRtmfAj4nusXXCzV
X-Google-Smtp-Source: AGHT+IE0R45d5ZL7xzZwuhvtXQOf1xTSCs3ElYiEDg7HQMY+coEv+ZPf5ecm+PFaWRxFNyOKSd8k8g==
X-Received: by 2002:a17:902:fb0b:b0:20b:9224:11c9 with SMTP id d9443c01a7336-20bff047bbfmr44710025ad.39.1728067643119;
        Fri, 04 Oct 2024 11:47:23 -0700 (PDT)
Received: from hilb.unicamp.br ([143.106.58.82])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e9f678202asm314295a12.0.2024.10.04.11.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 11:47:22 -0700 (PDT)
From: =?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
To: akpm@linux-foundation.org,
	davidgow@google.com,
	linux-kernel@vger.kernel.org,
	rmoar@google.com
Cc: kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	=?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
Subject: [PATCH v4] lib/math: Add int_log test suite
Date: Fri,  4 Oct 2024 18:47:13 +0000
Message-ID: <20241004184713.25262-1-brunofrancadevsec@gmail.com>
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
Changes in v4:
  - Rebase on top of linux-kselftest kunit branch
  - Fix spelling mistake in a literal string
Changes in v3:
  - Fix checkpatch issues reintroduced in v2
Changes in v2:
  - Fix the overflow warning reported by the kernel test robot
---
 lib/Kconfig.debug              | 11 +++++
 lib/math/tests/Makefile        |  1 +
 lib/math/tests/int_log_kunit.c | 75 ++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 lib/math/tests/int_log_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 0d6c979f0..1d7dc494c 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3104,3 +3104,14 @@ config INT_POW_KUNIT_TEST
 	  function.
 
 	  If unsure, say N
+
+config INT_LOG_KUNIT_TEST
+        tristate "Integer log (int_log) test" if !KUNIT_ALL_TESTS
+        depends on KUNIT
+        default KUNIT_ALL_TESTS
+        help
+          This option enables the KUnit test suite for the int_log library, which
+          provides two functions to compute the integer logarithm in base 2 and
+          base 10, called respectively as intlog2 and intlog10.
+
+          If unsure, say N
diff --git a/lib/math/tests/Makefile b/lib/math/tests/Makefile
index f9a0a0e6b..89a266241 100644
--- a/lib/math/tests/Makefile
+++ b/lib/math/tests/Makefile
@@ -2,5 +2,6 @@
 
 obj-$(CONFIG_DIV64_KUNIT_TEST)    += div64_kunit.o
 obj-$(CONFIG_INT_POW_KUNIT_TEST)  += int_pow_kunit.o
+obj-$(CONFIG_INT_LOG_KUNIT_TEST)  += int_log_kunit.o
 obj-$(CONFIG_MULDIV64_KUNIT_TEST) += mul_u64_u64_div_u64_kunit.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational_kunit.o
diff --git a/lib/math/tests/int_log_kunit.c b/lib/math/tests/int_log_kunit.c
new file mode 100644
index 000000000..40b5a6813
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
+	{1, 0, "Log base 10 of 1"},
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

