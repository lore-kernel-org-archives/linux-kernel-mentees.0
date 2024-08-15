Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7517263B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 02:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723687640; cv=none; b=GYExrM5NDY5nZ8hvI+0lGL6+4ckEFj3dQVUvG8ZHjaEjaO9eW9csoDA9ahRdIimIa7CbvZPGiM/GQ6vCILD+gCpdmANAO/y/HKqt/cscqk7oF4nCn7DHWiB61b4KJkI2LsWia1mIaqqGdBGsXq2UG1UzHFPPhDUpo34hYsV8c+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723687640; c=relaxed/simple;
	bh=dIZzHXiKMw27T75+DwnZyDKbGiZ/QhDiyGNMnFwk7tc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jya5RpOqbFLmMdJ7jDbiz9X7LL43+OZkSJADKgeNKSsb6mMO8WdlxqE3n4HZnP62EFDb4NcYxhzIBUQDLEiQUTxf5I7Bn7qI+MziVCnqXgpBQw+JG0eo3i7ouXlgaZD/piS2jJjqH5nHL4CLmlKeGb3bUyhBcIYkd1OS0L8Ji9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkSdzjyg; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkSdzjyg"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CB4181CA3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 02:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amtAXdpB5NsJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 02:07:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B1C081C38
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B1C081C38
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KkSdzjyg
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1B1C081C38
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 02:07:17 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-64b417e1511so5578307b3.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 14 Aug 2024 19:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723687636; x=1724292436; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2/ASuLUtGxDS0GSssOdh4ZdX64NP+jCqG7TJlf5fYQ=;
        b=KkSdzjyguaK0ilIqVUZCJtaIoR95tI1m1ep8YOXaFt1po0yYGANupo7pK8N5AvKeCo
         WokjXRFLSkURJfiMAySAysxMOfgfUpMaHAOlYBpdU5Uqt33tV6FNqGU/tDUQAYweddWK
         tG/Ci5D4ZuhZIZievkNw7v6kLKflnaW9TiDgf++SCsk5MvoAR/hQdX3p+wypjuTuII7i
         sGlaIRFgj+QCUi2gWbh5dmHGhlrPIp+7dS3FU0J/oJxtNrLN+PwIZdBu1obHO5da6Cww
         0liOZ+ezOP/Wbw3+NTmnJVq+ljGPxCGoZZcwbMFU7NErHwQHeDk3jcOgpM4lmSfkqCuf
         TJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723687636; x=1724292436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2/ASuLUtGxDS0GSssOdh4ZdX64NP+jCqG7TJlf5fYQ=;
        b=Ycnpz4mZsO74XC9sCFYj6XfnQ5wL9faFKdU09iDY3CFz73GLAFWKw1YKF5HxubjPce
         E5IwVmJv00ae2HOsq+oLPNBTHFxEbXSl8ZG9PJwXX0coF5x1LOV/VCbY/d816mhKIMdM
         CWbgBui8dD5L98cFASNuYt+oHNNsX3KI8G/QnhtyfBgfy3+AiQ4UyLk7/s9GEv1ScBRm
         fCeqyiYMOttdi+NaafHcwbV+iJkx9sczsw68wyfpQ9lALj9sXaoFEEcomhKCgIeIlmkD
         3xlxlEd4WwRbYzn9Fn1J7Wf8pxLA4nK7wD8l7Nl1nv6h9w/5ErXFd/6x79sFJSskBbod
         VyNw==
X-Forwarded-Encrypted: i=1; AJvYcCVwqYz8tBcbAWdkYVPyfY8qrVEG3VghaK3FoGDVe0V9K+ZMw9u1ZhyFPmMljCkM/pecudE85y4xiNchHEWvlOKixfA/18kgywV2grrBFdNQi+75445O+pT7q+MjogI1
X-Gm-Message-State: AOJu0YyplXJOqixewmk11qIOrYboD7wgqWqLOteWjjBFzuNxozm9mO83
	fGZq39MU+iJOw61Z0F1JeuTITgBzaFzlNhRU4tgxNpVRmCLV1nnt
X-Google-Smtp-Source: AGHT+IFc8pS8AFMDIoNr3RFZTXNr37gKkVG+aNLf25NfQwUsMxlcO+HSVbpsO7aNLmQnnGjIfAgIwA==
X-Received: by 2002:a05:690c:398:b0:63b:d711:e722 with SMTP id 00721157ae682-6ac954ac75bmr50353787b3.1.1723687635999;
        Wed, 14 Aug 2024 19:07:15 -0700 (PDT)
Received: from x13.lan (2603-9001-2ff0-a230-0000-0000-0000-1896.inf6.spectrum.com. [2603:9001:2ff0:a230::1896])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6af9d8273fesm1059417b3.116.2024.08.14.19.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 19:07:15 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: brendan.higgins@linux.dev,
	davidgow@google.com,
	rmoar@google.com
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] lib/math: Add int_pow test suite
Date: Wed, 14 Aug 2024 22:07:09 -0400
Message-ID: <20240815020711.110640-1-luis.hernandez093@gmail.com>
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
 lib/math/Makefile       |  1 +
 lib/math/test_int_pow.c | 70 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 lib/math/test_int_pow.c

diff --git a/lib/math/Makefile b/lib/math/Makefile
index 91fcdb0c9efe..ba564bf4fb00 100644
--- a/lib/math/Makefile
+++ b/lib/math/Makefile
@@ -6,4 +6,5 @@ obj-$(CONFIG_PRIME_NUMBERS)	+= prime_numbers.o
 obj-$(CONFIG_RATIONAL)		+= rational.o
 
 obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
+obj-$(CONFIG_TEST_INT_POW)	+= test_int_pow.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
diff --git a/lib/math/test_int_pow.c b/lib/math/test_int_pow.c
new file mode 100644
index 000000000000..ecabe71d01cc
--- /dev/null
+++ b/lib/math/test_int_pow.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <kunit/test.h>
+#include <kunit/static_stub.h>
+
+#include <linux/math.h>
+
+
+static void test_pow_0(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 1, int_pow(64, 0));
+}
+
+static void test_pow_1(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 64, int_pow(64, 1));
+}
+
+static void test_base_0(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 0, int_pow(0, 5));
+}
+
+static void test_base_1(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 1, int_pow(1, 100));
+	KUNIT_EXPECT_EQ(test, 1, int_pow(1, 0));
+}
+
+static void test_base_0_pow_0(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 1, int_pow(0, 0));
+}
+
+static void test_base_2_pow_2(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 4, int_pow(2, 2));
+}
+
+static void test_max_base(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, U64_MAX, int_pow(U64_MAX, 1));
+}
+
+static void test_large_result(struct kunit *test)
+{
+	UNIT_EXPECT_EQ(test, 1152921504606846976, int_pow(2, 60));
+}
+
+static struct kunit_case math_int_pow_test_cases[] = {
+	KUNIT_CASE(test_pow_0),
+	KUNIT_CASE(test_pow_1),
+	KUNIT_CASE(test_base_0),
+	KUNIT_CASE(test_base_1),
+	KUNIT_CASE(test_base_0_pow_0),
+	KUNIT_CASE(test_base_2_pow_2),
+	KUNIT_CASE(test_max_base),
+	KUNIT_CASE(test_large_result),
+	{}
+};
+
+static struct kunit_suite int_pow_test_suite = {
+	.name = "lib-math-int_pow",
+	.test_cases = math_int_pow_test_cases,
+};
+
+kunit_test_suites(&int_pow_test_suite);
+
+MODULE_DESCRIPTION("math.int_pow KUnit test suite");
+MODULE_LICENSE("GPL v2");
-- 
2.46.0

