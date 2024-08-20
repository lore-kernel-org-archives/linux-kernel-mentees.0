Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C751EC8E9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 01:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724115846; cv=none; b=Z9jPXB5meaeUjy6ONuXDtYmcbTR3XfhGFgwdG09sbjNyBj31yKqOqoewok6UXGKwIKEkv7y2A2xLh53c31sRprQP1I+1I4n5FLvWghaL+H1jPwjmP7fCfVjnXlMkGB5hwjc5xq3Z9CvYEkYao0njAZ6BMrRwCwqEv4krXsDGcZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724115846; c=relaxed/simple;
	bh=IZLXBA7ZZL9JQUfezOi9Myz8vJBxrzmGTbhPuknJdBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZX/gXoCe3/J2yyvFhJGK5PM8V8etmKvmt1VeYmjyvYHAcmSRYqypA5ADKoJTbmzUG267I7ICPhREm5wahgEgOO6mkH1T5TwDGAMychMDJYAENr3Mbc7wZohoXnT8KtvugQrPE72Ac9m/vTT0Ul7Yc9bvU7M2Kj09dk9U7TRCZFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PN4ozB1d; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PN4ozB1d"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6598A404D0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 01:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hMjtTm5A8Pj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Aug 2024 01:04:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::935; helo=mail-ua1-x935.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E131404CA
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E131404CA
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PN4ozB1d
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4E131404CA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 01:04:03 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-843046a99e3so937559241.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Aug 2024 18:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724115842; x=1724720642; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9cBkJC0RP1zERiTMVgnYdt05/xaN8L9Ga6Qql299sY=;
        b=PN4ozB1d5rxnV9IFim92hDhKayi3MDzlq06SmEDfBLdxR0ndKVViaLJm4l9RZtfTDV
         1AkYNRc5KZSP2+v6VIn3lOw0NA9/g1fHLd7avAmXJgYE4rnWWV2lwc49jmdlHBjNkDqE
         C4tEAHCwIVyO66rQdiL9Kv8dmuHSV8q4S49or2pRfNTizDA3c0llpSQUBfqLD6qJbKgz
         T7NxgXftfRpEf8omBgHRMnDtC24uaIE4N/xL148L07U2V80S0lA3XSoMP+8QLfgIh8Iu
         vcnjdXRe8J3I4yeeGhHGwTom9f2wBapyX65VRm1vPUfuqa5e9seytH42p4OIE/TU02un
         G9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724115842; x=1724720642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9cBkJC0RP1zERiTMVgnYdt05/xaN8L9Ga6Qql299sY=;
        b=FHq9f8+fTYf7//IcRsJOuJYtyhrPvDq/IQnn8PVdPfKJZm2OErrrjdOnAjTnv50vQl
         F8PFHda6cQZGifkwjB7k5vVtmSzq5PKkeP/X4of4M6Kkma3Rehh3KPa3y3dQWqiBLEMe
         Zw85l2UXF+zqNWS5OPgS2cudt/UXqqeGcAa3gYflNvF/UV5Ul2t+/g89QmBEOJOOJiNL
         bom/bhqA8DolgpbRlmTD7LFQtWuy0nLsn6gneiN17fkBjBrvIojq8h6KOGmigUorvACJ
         qEYbwNdbavc+LjOaBYCo2MMX/lbJdmfS/bOwmIqnNCUux6+VfeTOTueWFeL+RWV7xw0N
         gX0A==
X-Forwarded-Encrypted: i=1; AJvYcCVEb7lHUT9KhTfoPZMkyB5Ycnhip06H1Yl9SPJmHtQ8jBfOXvQqhoxVwWHE9Cf06duoPII2at7S428u2mKeymtZvUmR9A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywp8eGsDqDt1c5PbJiiOvjCm+YEJtGtr0eyq9iY8bvM4qWV0/NF
	+RS+1SOV0LUJp0fh28iAeltalRoy8joo24Y6/r3/WtuFMgzPO1qO
X-Google-Smtp-Source: AGHT+IHmsFq3kmTL7RHWh4Pv3B7eZi49R5V1M7QDJNDVqWUuTMcARCMHA9u1QlKEKlwjTcX3UmcuZQ==
X-Received: by 2002:a05:6102:85:b0:498:9aff:a193 with SMTP id ada2fe7eead31-4989affa27amr5093189137.24.1724115842236;
        Mon, 19 Aug 2024 18:04:02 -0700 (PDT)
Received: from x13.localdomain (syn-142-197-128-048.res.spectrum.com. [142.197.128.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-842fb9c6170sm1395040241.27.2024.08.19.18.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 18:04:00 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: brendan.higgins@linux.dev,
	davidgow@google.com,
	rmoar@google.com
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3] lib/math: Add int_pow test suite
Date: Mon, 19 Aug 2024 21:03:52 -0400
Message-ID: <20240820010353.7533-1-luis.hernandez093@gmail.com>
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

