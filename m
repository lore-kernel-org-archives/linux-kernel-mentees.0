Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2907FC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 22:44:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E11712080D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 22:44:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="MijXTMv2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E11712080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E3FE864B3;
	Mon, 20 Jul 2020 22:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nv6XYUNC3F24; Mon, 20 Jul 2020 22:44:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D18658638F;
	Mon, 20 Jul 2020 22:44:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8516C0894;
	Mon, 20 Jul 2020 22:44:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4325C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 22:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C37A784BE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 22:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZBwAuv11bDsw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 22:44:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9805884B22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 22:44:25 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d27so14735128qtg.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 15:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ag3CH9gIrCGq60wqLtIh8GQRzVO4EAvpufO2Zb/zlwc=;
 b=MijXTMv2wmOpRT0tSxn67usaHrw7v5/wM9T09O2XbEPBquJps5+8tk8hPgi+9s8haX
 DwenNjaAEUmqapQyTASXTIMFLrqfJ5maiAbJQLOCfogISvfTxHrXjb/P3vx8ORIPJZON
 IKLq7gwEwA4XcBWmR2Z24Pi7TAlfL9mNK6ntT2H9RvN/4/UbbmwNRY/A9QLg8S1sVL4p
 kQBzA5Al3O8Ct7hjyr+Q6j6YqSAcL+/GJIPjnN6I9OuxTl2lrbQPHmJy048u9YeXUZDo
 /0Y5h6zcEukIuboddjdF2QFrEnX1ablLh0vlr2c8qn2PzSq2CTzpap7gEEC7oJdQxH6k
 JlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ag3CH9gIrCGq60wqLtIh8GQRzVO4EAvpufO2Zb/zlwc=;
 b=Qow/z/n9lGSSa2togsbrOAKIq2K71elOl64T55wyXz94g6EKCvFzyfFF7SyogmCIFN
 vO+AZdy0IgOztuPTp2nlMMoMsWHQ6fLy+1vOkq9S8YDVXkEE+vDpnh9zgP4kisHJdYtm
 QuUQwYrd8YTXFCt2axd2cSrUp0K5NCuj3PU33Tr59jZ/WtUudB20uJ4x42CP8giMLevS
 EbG4aLXOdcebH90Nh4xpyoOFtYSZH5UDE4bF77PYJ8GAM1ZAQzfBvi4YcBL2nO1rD3To
 bhVZhuKUf+c8Dnap3Ao1xF/fTCSqiJnfn1lEzsUhraacz9kblStWIhhNzXt6kAMLUWKU
 IaVA==
X-Gm-Message-State: AOAM531L83FoUWy1SJ3ciGMK81IhVkTbJovNDxGMqT38+6hu/OM+LRhE
 0D7xjoCadyN1Tc7MZfZEwtqjuQ==
X-Google-Smtp-Source: ABdhPJwpZN6+9Bs9wz4nAsemF8PM8GzrSfDmAGPEYHHS4VKn288EfCse8gYvM/GJ6JWxwBpXQ1D0RQ==
X-Received: by 2002:ac8:3985:: with SMTP id v5mr25758367qte.337.1595285064006; 
 Mon, 20 Jul 2020 15:44:24 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id g136sm795513qke.82.2020.07.20.15.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 15:44:22 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Mon, 20 Jul 2020 19:44:18 -0300
Message-Id: <20200720224418.200495-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kselftest@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, davidgow@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, keescook@chromium.org
Subject: [Linux-kernel-mentees] [PATCH v3] lib: overflow_kunit: add KUnit
	test conversion of check_*_overflow
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

This adds the conversion of the runtime tests of check_*_overflow functions,
from `lib/test_overflow.c`to KUnit tests.

The log similar to the one seen in dmesg running test_overflow.c can be
seen in `test.log`.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
Tested-by: David Gow <davidgow@google.com>
---
v2:
  * moved lib/test_overflow.c to lib/overflow-test.c;
    * back to original license;
    * fixed style code;
    * keeps __initconst and added _refdata on overflow_test_cases variable;
    * keeps macros intact making asserts with the variable err;
    * removed duplicate test_s8_overflow();
  * fixed typos on commit message;

v3:
  * changed filename to overflow_kunit.c;
  * replace _refdata by _inidata;
  * added expects/asserts on individual tests;
---
 lib/Kconfig.debug                         |  20 +++-
 lib/Makefile                              |   2 +-
 lib/{test_overflow.c => overflow_kunit.c} | 122 +++++++++-------------
 3 files changed, 70 insertions(+), 74 deletions(-)
 rename lib/{test_overflow.c => overflow_kunit.c} (91%)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9ad9210d70a1..230aaf418dc0 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1999,9 +1999,6 @@ config TEST_UUID
 config TEST_XARRAY
 	tristate "Test the XArray code at runtime"

-config TEST_OVERFLOW
-	tristate "Test check_*_overflow() functions at runtime"
-
 config TEST_RHASHTABLE
 	tristate "Perform selftest on resizable hash table"
 	help
@@ -2154,6 +2151,23 @@ config SYSCTL_KUNIT_TEST

 	  If unsure, say N.

+config OVERFLOW_KUNIT
+	tristate "KUnit test for overflow" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the overflow KUnit tests.
+
+	  KUnit tests run during boot and output the results to the debug log
+	  in TAP format (http://testanything.org/). Only useful for kernel devs
+	  running KUnit test harness and are not for inclusion into a production
+	  build.
+
+	  For more information on KUnit and unit tests in general please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 config LIST_KUNIT_TEST
 	tristate "KUnit Test for Kernel Linked-list structures" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/Makefile b/lib/Makefile
index b1c42c10073b..c3cf72ec6c52 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -75,7 +75,6 @@ obj-$(CONFIG_TEST_LIST_SORT) += test_list_sort.o
 obj-$(CONFIG_TEST_MIN_HEAP) += test_min_heap.o
 obj-$(CONFIG_TEST_LKM) += test_module.o
 obj-$(CONFIG_TEST_VMALLOC) += test_vmalloc.o
-obj-$(CONFIG_TEST_OVERFLOW) += test_overflow.o
 obj-$(CONFIG_TEST_RHASHTABLE) += test_rhashtable.o
 obj-$(CONFIG_TEST_SORT) += test_sort.o
 obj-$(CONFIG_TEST_USER_COPY) += test_user_copy.o
@@ -318,3 +317,4 @@ obj-$(CONFIG_OBJAGG) += objagg.o
 # KUnit tests
 obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
+obj-$(CONFIG_OVERFLOW_KUNIT) += overflow_kunit.o
diff --git a/lib/test_overflow.c b/lib/overflow_kunit.c
similarity index 91%
rename from lib/test_overflow.c
rename to lib/overflow_kunit.c
index 7a4b6f6c5473..475d0daeb801 100644
--- a/lib/test_overflow.c
+++ b/lib/overflow_kunit.c
@@ -4,14 +4,11 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

+#include <kunit/test.h>
 #include <linux/device.h>
 #include <linux/init.h>
-#include <linux/kernel.h>
 #include <linux/mm.h>
-#include <linux/module.h>
 #include <linux/overflow.h>
-#include <linux/slab.h>
-#include <linux/types.h>
 #include <linux/vmalloc.h>

 #define DEFINE_TEST_ARRAY(t)			\
@@ -248,7 +245,7 @@ static int __init do_test_ ## t(const struct test_ ## t *p)		\
 	return err;							\
 }									\
 									\
-static int __init test_ ## t ## _overflow(void) {			\
+static int __init test_ ## t ## _overflow(struct kunit *test) {	\
 	int err = 0;							\
 	unsigned i;							\
 									\
@@ -256,6 +253,7 @@ static int __init test_ ## t ## _overflow(void) {			\
 		ARRAY_SIZE(t ## _tests));				\
 	for (i = 0; i < ARRAY_SIZE(t ## _tests); ++i)			\
 		err |= do_test_ ## t(&t ## _tests[i]);			\
+	KUNIT_EXPECT_FALSE(test, err);					\
 	return err;							\
 }

@@ -270,25 +268,25 @@ DEFINE_TEST_FUNC(u64, "%llu");
 DEFINE_TEST_FUNC(s64, "%lld");
 #endif

-static int __init test_overflow_calculation(void)
+static void __init overflow_calculation_test(struct kunit *test)
 {
 	int err = 0;

-	err |= test_u8_overflow();
-	err |= test_s8_overflow();
-	err |= test_u16_overflow();
-	err |= test_s16_overflow();
-	err |= test_u32_overflow();
-	err |= test_s32_overflow();
+	err |= test_u8_overflow(test);
+	err |= test_s8_overflow(test);
+	err |= test_u16_overflow(test);
+	err |= test_s16_overflow(test);
+	err |= test_u32_overflow(test);
+	err |= test_s32_overflow(test);
 #if BITS_PER_LONG == 64
-	err |= test_u64_overflow();
-	err |= test_s64_overflow();
+	err |= test_u64_overflow(test);
+	err |= test_s64_overflow(test);
 #endif

-	return err;
+	KUNIT_EXPECT_FALSE(test, err);
 }

-static int __init test_overflow_shift(void)
+static void __init overflow_shift_test(struct kunit *test)
 {
 	int err = 0;

@@ -313,9 +311,9 @@ static int __init test_overflow_shift(void)
 			pr_warn("got %llu\n", (u64)__d);		\
 		__failed = 1;						\
 	}								\
-	if (!__failed)							\
-		pr_info("ok: (%s)(%s << %s) == %s\n", #t, #a, #s,	\
-			of ? "overflow" : #expect);			\
+	KUNIT_EXPECT_FALSE_MSG(test, __failed,				\
+			       "ok: (%s)(%s << %s) == %s\n", #t, #a, #s,\
+			       of ? "overflow" : #expect);		\
 	__failed;							\
 })

@@ -479,7 +477,7 @@ static int __init test_overflow_shift(void)
 	err |= TEST_ONE_SHIFT(0, 31, s32, 0, false);
 	err |= TEST_ONE_SHIFT(0, 63, s64, 0, false);

-	return err;
+	KUNIT_EXPECT_FALSE(test, err);
 }

 /*
@@ -499,7 +497,7 @@ static int __init test_overflow_shift(void)
 #define TEST_SIZE		(5 * 4096)

 #define DEFINE_TEST_ALLOC(func, free_func, want_arg, want_gfp, want_node)\
-static int __init test_ ## func (void *arg)				\
+static int __init test_ ## func (struct kunit *test, void *arg)		\
 {									\
 	volatile size_t a = TEST_SIZE;					\
 	volatile size_t b = (SIZE_MAX / TEST_SIZE) + 1;			\
@@ -507,19 +505,15 @@ static int __init test_ ## func (void *arg)				\
 									\
 	/* Tiny allocation test. */					\
 	ptr = alloc ## want_arg ## want_gfp ## want_node (func, arg, 1);\
-	if (!ptr) {							\
-		pr_warn(#func " failed regular allocation?!\n");	\
-		return 1;						\
-	}								\
+	KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr,			\
+			#func " failed regular allocation?!\n");	\
 	free ## want_arg (free_func, arg, ptr);				\
 									\
 	/* Wrapped allocation test. */					\
 	ptr = alloc ## want_arg ## want_gfp ## want_node (func, arg,	\
 							  a * b);	\
-	if (!ptr) {							\
-		pr_warn(#func " unexpectedly failed bad wrapping?!\n");	\
-		return 1;						\
-	}								\
+	KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr,			\
+			#func " unexpectedly failed bad wrapping?!\n"); \
 	free ## want_arg (free_func, arg, ptr);				\
 									\
 	/* Saturated allocation test. */				\
@@ -555,7 +549,7 @@ DEFINE_TEST_ALLOC(kvzalloc_node, kvfree,     0, 1, 1);
 DEFINE_TEST_ALLOC(devm_kmalloc,  devm_kfree, 1, 1, 0);
 DEFINE_TEST_ALLOC(devm_kzalloc,  devm_kfree, 1, 1, 0);

-static int __init test_overflow_allocation(void)
+static void __init overflow_allocation_test(struct kunit *test)
 {
 	const char device_name[] = "overflow-test";
 	struct device *dev;
@@ -563,52 +557,40 @@ static int __init test_overflow_allocation(void)

 	/* Create dummy device for devm_kmalloc()-family tests. */
 	dev = root_device_register(device_name);
-	if (IS_ERR(dev)) {
-		pr_warn("Cannot register test device\n");
-		return 1;
-	}
-
-	err |= test_kmalloc(NULL);
-	err |= test_kmalloc_node(NULL);
-	err |= test_kzalloc(NULL);
-	err |= test_kzalloc_node(NULL);
-	err |= test_kvmalloc(NULL);
-	err |= test_kvmalloc_node(NULL);
-	err |= test_kvzalloc(NULL);
-	err |= test_kvzalloc_node(NULL);
-	err |= test_vmalloc(NULL);
-	err |= test_vmalloc_node(NULL);
-	err |= test_vzalloc(NULL);
-	err |= test_vzalloc_node(NULL);
-	err |= test_devm_kmalloc(dev);
-	err |= test_devm_kzalloc(dev);
+	KUNIT_ASSERT_FALSE_MSG(test, IS_ERR(dev), "Cannot register test device\n");
+
+	err |= test_kmalloc(test, NULL);
+	err |= test_kmalloc_node(test, NULL);
+	err |= test_kzalloc(test, NULL);
+	err |= test_kzalloc_node(test, NULL);
+	err |= test_kvmalloc(test, NULL);
+	err |= test_kvmalloc_node(test, NULL);
+	err |= test_kvzalloc(test, NULL);
+	err |= test_kvzalloc_node(test, NULL);
+	err |= test_vmalloc(test, NULL);
+	err |= test_vmalloc_node(test, NULL);
+	err |= test_vzalloc(test, NULL);
+	err |= test_vzalloc_node(test, NULL);
+	err |= test_devm_kmalloc(test, dev);
+	err |= test_devm_kzalloc(test, dev);

 	device_unregister(dev);

-	return err;
+	KUNIT_EXPECT_FALSE(test, err);
 }

-static int __init test_module_init(void)
-{
-	int err = 0;
-
-	err |= test_overflow_calculation();
-	err |= test_overflow_shift();
-	err |= test_overflow_allocation();
-
-	if (err) {
-		pr_warn("FAIL!\n");
-		err = -EINVAL;
-	} else {
-		pr_info("all tests passed\n");
-	}
+static struct kunit_case __initdata overflow_test_cases[] = {
+	KUNIT_CASE(overflow_calculation_test),
+	KUNIT_CASE(overflow_shift_test),
+	KUNIT_CASE(overflow_allocation_test),
+	{}
+};

-	return err;
-}
+static struct kunit_suite __initdata overflow_test_suite = {
+	.name = "overflow",
+	.test_cases = overflow_test_cases,
+};

-static void __exit test_module_exit(void)
-{ }
+kunit_test_suites(&overflow_test_suite);

-module_init(test_module_init);
-module_exit(test_module_exit);
 MODULE_LICENSE("Dual MIT/GPL");

base-commit: c63d2dd7e134ebddce4745c51f9572b3f0d92b26
--
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
