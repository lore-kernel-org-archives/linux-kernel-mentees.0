Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F57617E016
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Dec 2024 04:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734064031; cv=none; b=OgdqDF0+FbB8OyL+1aeaIYuSCi3SE709ygGS0mOjkXIVPFg7bRWLc60c2lsbBQyE2S6QktRJcrxleyPcwPXVwf1U3g/j3ej+F71fMJtl1fj27qZoWzjjy7DCjmYUhkecjkzzJo9hzsOalyyNdEQVlibye1I7k0x/ml+gRjaWzNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734064031; c=relaxed/simple;
	bh=PjL1Ykco8HVzG9IFl88OM+jnPP6HT71hIZ9O3TF4fb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aI+2EDNsld0ohdgpZzZ4MtLvwaPghVDISHg9C1gMajjEKUBVMOPqpFxiBT964rGYkBb0lyqVK98c0CYoi97LH6HwBRZL0iYuMCyV76A4evlNtDjsenMu5rsuOCsRDij1p32b99XXLD69EWMW+MIZ8TFCC/xg2jJWsKM/K5jOVIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IR0xU4ZW; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IR0xU4ZW"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4E7060723
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Dec 2024 04:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXnVbevZ8Sj1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2024 04:27:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B8CB6606BB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8CB6606BB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IR0xU4ZW
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B8CB6606BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 13 Dec 2024 04:27:08 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-51623968932so643964e0c.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Dec 2024 20:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734064027; x=1734668827; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFIE2oFTL5RsiGL4yGnXOTeASsgxqZiZltFWWa94vak=;
        b=IR0xU4ZW6VZXyiUzzySTnUaMjq56E82OPdz0vRvdiuQ27d0I8eUfAqw5Ht7ryDPRp6
         c+FDJFp6iwC+mA7YZDcP9eIBt73pIkebRv+bTWBAzaB49Xo+YmpGrLm5rBJAyC9Ix1He
         DSKOgzGFU4bZn/YQ4PQgDzvr19ePgOJqN3CqSwrc5gTMBclS5hGxhq3uIMcY6xehertD
         G5jBjyfbR0bTwltpuuKj1hN/wrfsZgWQWaPeE2ytkDL0lG21FrIqC67YPnpBiw+88DW6
         uLmrb5g8QsYqpYwcg25AlXZ6PZnMlJin0wlQ2OkVLDRioo+XQ8F8FadW8Vflg0x5FpBp
         +ICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734064027; x=1734668827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFIE2oFTL5RsiGL4yGnXOTeASsgxqZiZltFWWa94vak=;
        b=wk7vHQ8DmO5DdMosnl/8gogYTt+s9MosnPwXMjuVxX7mQ611CuhYUmtxuup8qoiHMH
         8Fxz/zAKwaIKkRf68mOsyqfLDUdsrCYS53iVYSfx3xQPRHYDjm1Y7oC5OX/pU7DMh0/p
         NxQaiJzFaFttHSSMk/WNzAuyEZ0VTWoQwY13HEHMNnVeSDL875b9G0cI1byWpDG/jwER
         y3Uhe4avF5Rdcik/kKL0f2cKhhMrtL9DjV8N/drvDVJpbFQJS47uiVAcyd6IgUDUiHkb
         7I8ryWaw5JUVyQDODfmCgRDRG+OlE3sGEpbaFeaTCeLhAx/OmV13sKYX4yzxMcFqGpir
         F3rg==
X-Forwarded-Encrypted: i=1; AJvYcCU4a12PN2TrLRhoUPTs6ImMxOoDAWNRXUFSujOTgZ16FTpe5n4kTHEicoDrXMzEW1dVjYmwj9HJMOb2Aa4zM1P/BpXpQA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yysn8DdK1FWgx0pQU0a3AvU/IKTPgsry+mKl4PohzTbEei8Tm29
	zAEpmsXhPOGrDxaoF+v6xzYojtrZMmk6MkM3kJs60/ersT99b0jv
X-Gm-Gg: ASbGncs0YAN7vIyZS3jO/WB75KLM3MAiijQwDTG5Q/BMAvgdCfRORonfFQ/k2U0uRF4
	u+B8SaAWYWDr3WrKBnOnvBF1tH4YRqvmbTLG9D8Wr2KNrtsRBbNmST8D8NV7LD47LgKQpEWAouw
	i4LUR7UJFjberggFVbBJ5wEoESnLSn4ObSZjGZdFtrVHRu1llsamUud23S8L1lrNvo90cvxcG5F
	HPkvg+ogjbILJRymzUhW6scovsoiOsh7Ym0vjWaH2nDIuXyjQfhVdt6uRDWRqhmlcMcvj2xrZ59
	0S58jlUjvJbaXb2vlNvXv1GGOSR4MLXv+FS5
X-Google-Smtp-Source: AGHT+IGMpCNDA5EpRH+Yj2oXjYJ5jqJbGHiTvFiUeGCAQV6LTCnPR+Fm5peOQUpqg30Npa50ajF0IQ==
X-Received: by 2002:a05:6122:8c0f:b0:510:3a9:bb87 with SMTP id 71dfb90a1353d-518ca3850b9mr1575459e0c.1.1734064027137;
        Thu, 12 Dec 2024 20:27:07 -0800 (PST)
Received: from x13.localdomain (syn-142-197-128-048.res.spectrum.com. [142.197.128.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51887e3ef80sm716399e0c.18.2024.12.12.20.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 20:27:05 -0800 (PST)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: davidgow@google.com,
	akpm@linux-foundation.org
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	skhan@linuxfoundation.org,
	rbm@suse.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7] lib/math: Add int_sqrt test suite
Date: Thu, 12 Dec 2024 23:26:50 -0500
Message-ID: <20241213042701.1037467-1-luis.hernandez093@gmail.com>
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
index 3ef11305f8d2..853f023ae537 100644
--- a/lib/math/Makefile
+++ b/lib/math/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
 obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
 obj-$(CONFIG_TEST_MULDIV64)	+= test_mul_u64_u64_div_u64.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
+obj-$(CONFIG_INT_SQRT_KUNIT_TEST) += tests/int_sqrt_kunit.o
\ No newline at end of file
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

