Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B320E19F13C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 18:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727116093; cv=none; b=OHCPZmShvJtyQtar3ea93FfIAk8L/I+W9AB7285z+1WpRvpjECVJuXVPdPOyYp5i2YSdQXRbtXY40NM3IXlZRH+M9+JHOddBITo6kLpJVCUnZ7E6jiwYniyPJYbgz6wfuDgKT01tnm0Tuf52Zcx/HJSnwSPyXAjAFGPR/c3kpWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727116093; c=relaxed/simple;
	bh=QbRqjtxOB3MHaRJ1QgYEDpdPYgM7DU/nYJWS2/l99G4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ca8vhefK8yYFQ8rEhd8cQJ8W7Q7rJpQZH4pwYKv/hL0dtp6vDXGLTOqNerY1h0gswOg7QEzeAXzdF0gAi4Z+VB6ND8N+I17vJ1ihfuRq4dTPNN6/PlmCCdFGI4Na2+U0ZIflHQjmKj1XiaqaYDe2VdB5kQ9cCagMuKuObVud2CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsDx3ivd; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsDx3ivd"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FC1240A9B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 18:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-VuM-w8twmB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Sep 2024 18:28:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com; envelope-from=brunofrancadevsec@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0820940021
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0820940021
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gsDx3ivd
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0820940021
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 18:28:10 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-49bd45cfe38so1645782137.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 23 Sep 2024 11:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727116089; x=1727720889; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VvC8OpRVu7RcWevPpe6zlyuw6fQztO2vgcY7rQ0WA6E=;
        b=gsDx3ivdz0EgAkY5kUK26s0CFjmovbPuHyteyazsc/QsQeggCbTTjE4kJ1UdoxREjV
         aW7MIvuOy8ZvpHsib27WvuM3aqOgDglUDLK+xGz64Y+ymI7N7KluV1eC0SA00r7B3T0W
         +wbrezcLbp1Z/6dYiUbWF7eLX+XV4phef0w9YH5EWSsBZugRte6gq+5jBf24T1W+27oU
         UqbnJtfxBzo7U2mooGyBbWFCkPD/GvX6oObyMQs6yqZf92tB0NB4n/DIzmPDfxxn8jBO
         zaTujlTBXaW4AB2WBXkvF64MCTsI2HMCTQv85RDtSc0yfArSFvnDI2X8QnhTmK2KT7xv
         DSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727116089; x=1727720889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvC8OpRVu7RcWevPpe6zlyuw6fQztO2vgcY7rQ0WA6E=;
        b=xE47g4XMVxpoLY4rw47MZf03Euu2dBsTMgEjTNE/Hcip8M+Uz4aqUN+DHEjlSLVESD
         4itYxZsMVx/nDN/CG5NObZ8lplxAPvQYOJZGPhdDI0k/CQ07/V8IM5S752hS/5/rN/Tl
         2aJuZ89Zgs79Ov+Dd8v8+9+Mz3ECs0VTd4G27sLM9H+BPEMhMEEq0avW7sbf8uuhHiTc
         gHcO0bJJ1C8SPkimjGUtVShMO3WvXSvvNXBOBAnyVU9x4F6XaAGBgB1Wm6i+DqXoyxY1
         W+ItE6u3ynIw7J5hpmhNiHQ4fTMXSn0tI5IP1B9F1C/qxKHE1Mz5vkuU14WH/IIdKLp9
         jUAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU8Ihc30flli2S4e7WEWa3weljUpfP6dCV4hT2UJKYqAcbz67QGJgzONei4qbz2Gr/P7vAG/M/TudKYvfUmyMczWr+GQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzIlJsYNSIeTjK1Ecvj22gRkkNSMZCMyoHoPk0/KJoK0i3kmExr
	oGUCibpMI3h6L8lhKAaj5ARvV7GCvMG6K+icifJz4h4tzdQCA8w7
X-Google-Smtp-Source: AGHT+IExJyb740zkCQVp6XC9+Z56SOW92gmYPETjHCLM9ypiku8Mb1zqeKoMl+NsUrB4+WyBJ+yNyQ==
X-Received: by 2002:a05:6102:94c:b0:493:b719:efaf with SMTP id ada2fe7eead31-49fc7678485mr8621012137.20.1727116089541;
        Mon, 23 Sep 2024 11:28:09 -0700 (PDT)
Received: from hilb.unicamp.br ([143.106.58.82])
        by smtp.googlemail.com with ESMTPSA id a1e0cc1a2514c-8493999717esm3354397241.31.2024.09.23.11.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 11:28:09 -0700 (PDT)
From: =?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
To: akpm@linux-foundation.org,
	davidgow@google.com,
	linux-kernel@vger.kernel.org,
	rmoar@google.com
Cc: kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	=?UTF-8?q?Bruno=20Sobreira=20Fran=C3=A7a?= <brunofrancadevsec@gmail.com>
Subject: [PATCH v2] lib/math: Add int_log test suite
Date: Mon, 23 Sep 2024 18:28:01 +0000
Message-ID: <20240923182801.37747-1-brunofrancadevsec@gmail.com>
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
+       	{16, 67108864, "Log base 2 of 16"},
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

