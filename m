Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2A9C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 02:05:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 067E222255
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 02:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="PfUavVuK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 067E222255
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 585FC8871C;
	Thu, 15 Oct 2020 02:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4YOFHMl6r6M1; Thu, 15 Oct 2020 02:05:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 54DEB885D1;
	Thu, 15 Oct 2020 02:05:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E410C07FF;
	Thu, 15 Oct 2020 02:05:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DA8DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 02:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3894888386
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 02:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4e77cbsR52iX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 02:05:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 20EE088383
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 02:05:00 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c2so1162580qkf.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 19:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0cFyvDYJwXB3yd+7/P2nUc5iqvNKygR8nPLmQrIdH4=;
 b=PfUavVuKFuMrQYnPUE8cAHNGX9Ajpfjl8sqSbP0g5FfOiMufre5o65Yf72vIvGYaqs
 aq1bwXyAYAg/F5xAbsjNtc3kM6YlodJedu5d2H7TWGgsnNuDPMM+/ho6dVKPBfWRiwge
 aCwV6T1Uk13Hm7FKvLub2loYlwir1MvNZ+HjGnj0aOG06YzGD2G0TvH8C/jlcA2Ik8vP
 Pk+GA/+uIFanTYYrepAybORZpIUvnbMU1H0gUTQXABFXM6nRW7M7N8uhfgqbB8NEnuME
 AmmdziPe6gSPB09ro0G7WZWa0gmhjVACUSlYJKoa0PgFCrS6stALWX2NTTQqIAAjlgy2
 FG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c0cFyvDYJwXB3yd+7/P2nUc5iqvNKygR8nPLmQrIdH4=;
 b=PpW/VcN8Y2wHK2lXC/B+nRBO6cyOijJKcl3BnZCXzshJHmf1oWyXS+cLAGsGfsVo0K
 FyMkZVBeZ+Sz7CdEb8f6IEeIhuMP8ZM9m3I81AOSWMDE6nOXMAwGsVM9YKhK3yOuSPVT
 xwU0GuOeReut0GE4TD/VJe47C7RTfxa9j/QFz5/054QO5hyfG9J+mXt4lIcLCEnixMSJ
 0wTk9kav1OeNrK0QL48/zg6qtnaUbMi5Q8xZrQRpTICtxZy2DnqBSumgd72LIpeEZSmc
 8rc+ux30om6fH36bYi4sSY1udnyVBpnwhr0TtQmJxyyFEirnBGy+sfG4R/9h97+OzMIS
 JJpw==
X-Gm-Message-State: AOAM532a5+Aplbn1ZvSGcy4dD5e+6APeRZeyeHQh4c/c+EKgHk0UWQod
 xpRTk+X6sthhIQr/O1km128+gg==
X-Google-Smtp-Source: ABdhPJwQlM5OerP8i+GB+Itwc1WB76p7g7oRvfyXuDh/Fwjd85kNhXAdmLyw5Mwbcr9WWjoOXdj9EA==
X-Received: by 2002:a37:9c4f:: with SMTP id f76mr1899894qke.403.1602727499071; 
 Wed, 14 Oct 2020 19:04:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7cb:5e0b:6f3d:fca0:306c:a15d])
 by smtp.gmail.com with ESMTPSA id e4sm665386qkb.4.2020.10.14.19.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 19:04:58 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com, irogers@google.com, brendanhiggins@google.com
Date: Wed, 14 Oct 2020 23:04:54 -0300
Message-Id: <20201015020454.314186-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, mingo@kernel.org
Subject: [Linux-kernel-mentees] [RESEND PATCH v2] lib: kunit: add
	test_min_heap test conversion to KUnit
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This adds the conversion of the runtime tests of test_min_heap,
from `lib/test_min_heap.c` to KUnit tests.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
  v2: 
    * change Kconfig entries to be more adherent to KUnit documentation,
      min_heap test runs when enabling full test coverage (KUNIT_ALL_TESTS).
    * make kconfig help more concise;
    * fix KUNIT_TEST sufix;
---
 lib/Kconfig.debug                         |  24 +++--
 lib/Makefile                              |   2 +-
 lib/{test_min_heap.c => min_heap_kunit.c} | 117 ++++++++++++----------
 3 files changed, 78 insertions(+), 65 deletions(-)
 rename lib/{test_min_heap.c => min_heap_kunit.c} (60%)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 4f09c6505a2e..0e10ef1176de 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1915,16 +1915,6 @@ config TEST_LIST_SORT
 
 	  If unsure, say N.
 
-config TEST_MIN_HEAP
-	tristate "Min heap test"
-	depends on DEBUG_KERNEL || m
-	help
-	  Enable this to turn on min heap function tests. This test is
-	  executed only once during system boot (so affects only boot time),
-	  or at module load time.
-
-	  If unsure, say N.
-
 config TEST_SORT
 	tristate "Array-based sort test"
 	depends on DEBUG_KERNEL || m
@@ -2256,6 +2246,20 @@ config BITS_TEST
 
 	  If unsure, say N.
 
+config MIN_HEAP_KUNIT_TEST
+	tristate "KUnit test for Min heap" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this to turn on min heap function tests. This test is
+	  executed only once during system boot (so affects only boot time),
+	  or at module load time.
+
+	  For more information on KUnit and unit tests in general please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 config TEST_UDELAY
 	tristate "udelay test driver"
 	help
diff --git a/lib/Makefile b/lib/Makefile
index d862d41fdc3d..03d12e672cf8 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -68,7 +68,6 @@ CFLAGS_test_ubsan.o += $(call cc-disable-warning, vla)
 UBSAN_SANITIZE_test_ubsan.o := y
 obj-$(CONFIG_TEST_KSTRTOX) += test-kstrtox.o
 obj-$(CONFIG_TEST_LIST_SORT) += test_list_sort.o
-obj-$(CONFIG_TEST_MIN_HEAP) += test_min_heap.o
 obj-$(CONFIG_TEST_LKM) += test_module.o
 obj-$(CONFIG_TEST_VMALLOC) += test_vmalloc.o
 obj-$(CONFIG_TEST_OVERFLOW) += test_overflow.o
@@ -343,3 +342,4 @@ obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
 obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
 obj-$(CONFIG_BITS_TEST) += test_bits.o
+obj-$(CONFIG_MIN_HEAP_KUNIT_TEST) += min_heap_kunit.o
diff --git a/lib/test_min_heap.c b/lib/min_heap_kunit.c
similarity index 60%
rename from lib/test_min_heap.c
rename to lib/min_heap_kunit.c
index d19c8080fd4d..398db1c63146 100644
--- a/lib/test_min_heap.c
+++ b/lib/min_heap_kunit.c
@@ -7,9 +7,8 @@
 
 #include <linux/log2.h>
 #include <linux/min_heap.h>
-#include <linux/module.h>
-#include <linux/printk.h>
 #include <linux/random.h>
+#include <kunit/test.h>
 
 static __init bool less_than(const void *lhs, const void *rhs)
 {
@@ -29,37 +28,34 @@ static __init void swap_ints(void *lhs, void *rhs)
 	*(int *)rhs = temp;
 }
 
-static __init int pop_verify_heap(bool min_heap,
+static __init void pop_verify_heap(struct kunit *context,
+				bool min_heap,
 				struct min_heap *heap,
 				const struct min_heap_callbacks *funcs)
 {
 	int *values = heap->data;
-	int err = 0;
 	int last;
 
 	last = values[0];
 	min_heap_pop(heap, funcs);
 	while (heap->nr > 0) {
 		if (min_heap) {
-			if (last > values[0]) {
-				pr_err("error: expected %d <= %d\n", last,
-					values[0]);
-				err++;
-			}
+			KUNIT_EXPECT_FALSE_MSG(context,
+					       last > values[0],
+					       "expected %d <= %d\n",
+					       last, values[0]);
 		} else {
-			if (last < values[0]) {
-				pr_err("error: expected %d >= %d\n", last,
-					values[0]);
-				err++;
-			}
+			KUNIT_EXPECT_FALSE_MSG(context,
+					       last < values[0],
+					       "expected %d >= %d\n",
+					       last, values[0]);
 		}
 		last = values[0];
 		min_heap_pop(heap, funcs);
 	}
-	return err;
 }
 
-static __init int test_heapify_all(bool min_heap)
+static __init void test_heapify_all(struct kunit *context, bool min_heap)
 {
 	int values[] = { 3, 1, 2, 4, 0x8000000, 0x7FFFFFF, 0,
 			 -3, -1, -2, -4, 0x8000000, 0x7FFFFFF };
@@ -73,12 +69,11 @@ static __init int test_heapify_all(bool min_heap)
 		.less = min_heap ? less_than : greater_than,
 		.swp = swap_ints,
 	};
-	int i, err;
+	int i;
 
 	/* Test with known set of values. */
 	min_heapify_all(&heap, &funcs);
-	err = pop_verify_heap(min_heap, &heap, &funcs);
-
+	pop_verify_heap(context, min_heap, &heap, &funcs);
 
 	/* Test with randomly generated values. */
 	heap.nr = ARRAY_SIZE(values);
@@ -86,12 +81,10 @@ static __init int test_heapify_all(bool min_heap)
 		values[i] = get_random_int();
 
 	min_heapify_all(&heap, &funcs);
-	err += pop_verify_heap(min_heap, &heap, &funcs);
-
-	return err;
+	pop_verify_heap(context, min_heap, &heap, &funcs);
 }
 
-static __init int test_heap_push(bool min_heap)
+static __init void test_heap_push(struct kunit *context, bool min_heap)
 {
 	const int data[] = { 3, 1, 2, 4, 0x80000000, 0x7FFFFFFF, 0,
 			     -3, -1, -2, -4, 0x80000000, 0x7FFFFFFF };
@@ -106,25 +99,22 @@ static __init int test_heap_push(bool min_heap)
 		.less = min_heap ? less_than : greater_than,
 		.swp = swap_ints,
 	};
-	int i, temp, err;
+	int i, temp;
 
 	/* Test with known set of values copied from data. */
 	for (i = 0; i < ARRAY_SIZE(data); i++)
 		min_heap_push(&heap, &data[i], &funcs);
-
-	err = pop_verify_heap(min_heap, &heap, &funcs);
+	pop_verify_heap(context, min_heap, &heap, &funcs);
 
 	/* Test with randomly generated values. */
 	while (heap.nr < heap.size) {
 		temp = get_random_int();
 		min_heap_push(&heap, &temp, &funcs);
 	}
-	err += pop_verify_heap(min_heap, &heap, &funcs);
-
-	return err;
+	pop_verify_heap(context, min_heap, &heap, &funcs);
 }
 
-static __init int test_heap_pop_push(bool min_heap)
+static __init void test_heap_pop_push(struct kunit *context, bool min_heap)
 {
 	const int data[] = { 3, 1, 2, 4, 0x80000000, 0x7FFFFFFF, 0,
 			     -3, -1, -2, -4, 0x80000000, 0x7FFFFFFF };
@@ -139,7 +129,7 @@ static __init int test_heap_pop_push(bool min_heap)
 		.less = min_heap ? less_than : greater_than,
 		.swp = swap_ints,
 	};
-	int i, temp, err;
+	int i, temp;
 
 	/* Fill values with data to pop and replace. */
 	temp = min_heap ? 0x80000000 : 0x7FFFFFFF;
@@ -149,8 +139,7 @@ static __init int test_heap_pop_push(bool min_heap)
 	/* Test with known set of values copied from data. */
 	for (i = 0; i < ARRAY_SIZE(data); i++)
 		min_heap_pop_push(&heap, &data[i], &funcs);
-
-	err = pop_verify_heap(min_heap, &heap, &funcs);
+	pop_verify_heap(context, min_heap, &heap, &funcs);
 
 	heap.nr = 0;
 	for (i = 0; i < ARRAY_SIZE(data); i++)
@@ -161,34 +150,54 @@ static __init int test_heap_pop_push(bool min_heap)
 		temp = get_random_int();
 		min_heap_pop_push(&heap, &temp, &funcs);
 	}
-	err += pop_verify_heap(min_heap, &heap, &funcs);
+	pop_verify_heap(context, min_heap, &heap, &funcs);
+}
 
-	return err;
+static void __init test_heapify_all_true(struct kunit *context)
+{
+	test_heapify_all(context, true);
 }
 
-static int __init test_min_heap_init(void)
+static void __init test_heapify_all_false(struct kunit *context)
 {
-	int err = 0;
-
-	err += test_heapify_all(true);
-	err += test_heapify_all(false);
-	err += test_heap_push(true);
-	err += test_heap_push(false);
-	err += test_heap_pop_push(true);
-	err += test_heap_pop_push(false);
-	if (err) {
-		pr_err("test failed with %d errors\n", err);
-		return -EINVAL;
-	}
-	pr_info("test passed\n");
-	return 0;
+	test_heapify_all(context, true);
+}
+
+static void __init test_heap_push_true(struct kunit *context)
+{
+	test_heap_push(context, true);
+}
+
+static void __init test_heap_push_false(struct kunit *context)
+{
+	test_heap_push(context, false);
 }
-module_init(test_min_heap_init);
 
-static void __exit test_min_heap_exit(void)
+static void __init test_heap_pop_push_true(struct kunit *context)
 {
-	/* do nothing */
+	test_heap_pop_push(context, true);
 }
-module_exit(test_min_heap_exit);
+
+static void __init test_heap_pop_push_false(struct kunit *context)
+{
+	test_heap_pop_push(context, false);
+}
+
+static struct kunit_case __refdata min_heap_test_cases[] = {
+	KUNIT_CASE(test_heapify_all_true),
+	KUNIT_CASE(test_heapify_all_false),
+	KUNIT_CASE(test_heap_push_true),
+	KUNIT_CASE(test_heap_push_false),
+	KUNIT_CASE(test_heap_pop_push_true),
+	KUNIT_CASE(test_heap_pop_push_false),
+	{}
+};
+
+static struct kunit_suite min_heap_test_suite = {
+	.name = "min-heap",
+	.test_cases = min_heap_test_cases,
+};
+
+kunit_test_suites(&min_heap_test_suite);
 
 MODULE_LICENSE("GPL");

base-commit: d2585f5164c298aaaed14c2c8d313cbe7bd5b253
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
