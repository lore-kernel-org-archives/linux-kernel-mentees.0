Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F1B2BAF1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 22 Sep 2024 17:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727025961; cv=none; b=KgHqtyWJ0401Mfcet4RM8p/2GNn+vIcdojpKj9wfS8A85Ve0RFYdmhJ7kKWmj0GlDx0Ce4uwSNuq5abUiQoi81BIQpkN6FtSN9Qwdfb1l1KB/1l2gqHdQeWzJwIhIQ8dycVnRPmNDrAneMA1fpgaji9ZpkpnScrGHgYGrA6qeOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727025961; c=relaxed/simple;
	bh=cwCColBuWJjjCoyT4tCp6xqYfe9D6tHyJE1ojxDYajU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jge6UkFi8fvzFX9AV7HBkvWinUMp4LdfrwsW70OzfzIc6W421/41ytZIp8F7cdn8rNb9ZAXsZK9FCbjK8V2Nqm6zkoZY43XYB6J5uf1DsUiB0OpmkwmKON3TX4gWyGXmLGCIbFU364MEuT3A+HeXNXwGoziqPGs6D7rDV+na1XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQkXcxUZ; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQkXcxUZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A2AF60608
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 22 Sep 2024 17:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzijauFtO7WJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Sep 2024 17:25:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=brunofrancadevsec@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1AA22605CB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AA22605CB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PQkXcxUZ
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1AA22605CB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 22 Sep 2024 17:25:58 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7a99e4417c3so330992785a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 22 Sep 2024 10:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727025957; x=1727630757; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=plezpWiXZgx1zibpF7IExoNVZXNr/qxjzsaTwke7+zc=;
        b=PQkXcxUZqYbUTNIcK9DoY6XefxopUvoHjz929LJJf1ga7tgNShrHoCHJBZ+2jb6doT
         Xg/rUgBzn8ZktGHVpRmSf+kYqRt6gsA30qkR6IEOTVaHn2Es60kDjTiIJ93w9iZGWpAR
         E1ptptgQ45ekLDuFHzHGOhc0s8SEHQiiKR9oa/2jSJH8UPXCSfgCpNrkG6/HGelWjS7I
         DnVscLQVyUCZWLdn3FJ8aAs98o7K8pGkOvFRAhBgjJGEmTr5Jy4Gcmurk/otCtTdSlOW
         RwfWvI7sAFuxqW8a2gQ1N2mgv8Dntr1jKAhS43ooRwNeY6Jaf0tKTtZ2az4uPE57hY9e
         Asdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727025957; x=1727630757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plezpWiXZgx1zibpF7IExoNVZXNr/qxjzsaTwke7+zc=;
        b=IpyckYvf/P63AStMvQRwtKcvsRzeE25k9saRRm/i2ysH0oOXUmAfITo1OK7mTwwtl4
         cbqSQ5OkQmlONmLOy7Bc0ifwOpHrZW38F4Znihq1yrZFhsOikbdHiIqVsCP5MAGLTuu3
         x2856/BXvKklngVn06a4HKmP3I0VDGt8+ZIJd7q455bVBLo9w76w6jF3efC0B135hYC+
         Z1Ybc4mDFLd6OydFR+DoAlr4Fpj7jBfrky1vMTkguq7L6Vkq0Y9ta250z2c+1aes4skC
         fhMC2mEr0LvWaUMaRvs3RSQGDmOFR4vNPFBgRAP2CfbB3+jsMNPF9LC21ndAYiXiuuou
         FoGg==
X-Forwarded-Encrypted: i=1; AJvYcCUGuxJBbhxhBr7e/zv11yJniOjAMhV+ZC7AILFyAgCHYmIh95++FjBaTr0SDMG6ur7EkNNfLzqo8RzVqQkrBl5bmRhC0w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwoR+fI8Q+DrY1fMZIvaJyT9UXZV9fFYA6POhnYdWXwuG9MV2sl
	wLmHjOWP1qC/hWjrFDH10Y5aJ3SJ0Mcv8mnpF/G4AbkMvBH97D0u
X-Google-Smtp-Source: AGHT+IH3p0ldDxkkvAzZw+Yvw+Fc4GQfGqjThRsGyQLkkfe6nzoo0GqMrWEgJSySvSx016d/lqHeMg==
X-Received: by 2002:a05:620a:400b:b0:7a9:d09e:cfba with SMTP id af79cd13be357-7acb82226bcmr1622122685a.59.1727025957489;
        Sun, 22 Sep 2024 10:25:57 -0700 (PDT)
Received: from hilb.. ([187.11.199.58])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7acb08eb9a6sm397794985a.126.2024.09.22.10.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 10:25:57 -0700 (PDT)
From: =?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
To: akpm@linux-foundation.org,
	davidgow@google.com,
	linux-kernel@vger.kernel.org,
	rmoar@google.com
Cc: kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	=?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
Subject: [PATCH] lib/math: Add int_log test suite
Date: Sun, 22 Sep 2024 17:25:49 +0000
Message-ID: <20240922172549.159928-1-brunofrancadevsec@gmail.com>
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
index 000000000000..4764af808176
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
+	{U64_MAX, 536870911, "Log base 2 of MAX"},
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
+	{U64_MAX, 161614247, "Log base 10 of MAX"}
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

