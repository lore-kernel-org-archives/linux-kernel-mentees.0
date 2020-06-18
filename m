Return-Path: <SRS0=NG44=77=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1F4C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 14:06:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23A2B20734
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 14:06:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="SWNQqCth"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23A2B20734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EA26E87B1D;
	Thu, 18 Jun 2020 14:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OrHoFpphKs1r; Thu, 18 Jun 2020 14:06:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 269DF87B19;
	Thu, 18 Jun 2020 14:06:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15885C088C;
	Thu, 18 Jun 2020 14:06:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8791C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 14:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 95E7B22803
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 14:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCbbsph+ezEs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 14:06:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by silver.osuosl.org (Postfix) with ESMTPS id F03E92051A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 14:06:20 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id di13so2773321qvb.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 07:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9lVMlOdIyNxLzGMiXNj2N9UYux15sD/EtwgLiUczR68=;
 b=SWNQqCthtE9g0sq3+vBFx/xnVnQdfhX2FgyyrH2jWJFlJQyuF0LHukWNOzeQjqQ3jc
 PoK+nLYaILrXuAC7q5eN4U3mUZlz4Bs1QVX//qlaGU/HtbJPqnAvKeirLKJaGwqnaZ9g
 zRFEbsVSkyv25KzZcI8BjMF2pHWeyIiss/pGdAH4kNuMj3SGwOQ/hzLWycs2mrtOBrFe
 rNBKLYC6lBsASbw/Ah4WJXp7FlfNtL0oWTJVLFE4fLeDLi67BbtXF8gsOEv9zt9WmtA4
 Coh6Rnb5LShAGWr4w4oAgYyJcFnaCLCArUqpTK2RN8JCTanKl2KCVMcA80t4dqbOynyu
 4FZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9lVMlOdIyNxLzGMiXNj2N9UYux15sD/EtwgLiUczR68=;
 b=p4u62YPLiv59MaCEA2Gy7X1uwgpZvDG8I44qfCgWiA/hUy7DV0PcF6dI98nzeBxAUC
 lT3okol3AUapr0pSLbm+Ny9/IRFU6QvOhAq25HtZeaCtntYYwSftLdup8QDtuhfuqm+z
 m+74JxXKPXcy4f5hAqbo0R5Bj38tvXqV0wDyICPI4k25zwOeokmPjqECEB2zLiapUQHJ
 ktj2A+2+tL5NLSSX9M2QsHtwHeV6h64oaFEJj0+rlqBiq9QymiZPOFBRWzpIE+wqz4x8
 qYfOK8B3mEA+agjmtFUWUbMgYSF1s0ZevTUrGUfmDY/LVnfTIq8pAPsd68iGMHcSt4b7
 0OCg==
X-Gm-Message-State: AOAM533HQYNEevX2o1YFkI+46PBN9wwLnIXY//UJ25sva8DuAHkkYwmC
 3FygH8BZ7hA02yOvXWqyru/5Ew==
X-Google-Smtp-Source: ABdhPJySXdwj3CLQ0yEHHLQIIJimTYgUOu6BXtPn4akRwatVE26vzbLMCKx03UNsHAutW7tfTuBTdA==
X-Received: by 2002:a05:6214:178e:: with SMTP id
 ct14mr3860484qvb.73.1592489179664; 
 Thu, 18 Jun 2020 07:06:19 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id d140sm3005219qkc.22.2020.06.18.07.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 07:06:19 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Thu, 18 Jun 2020 11:06:15 -0300
Message-Id: <20200618140615.135606-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: keescook@chromium.org, linux@rasmusvillemoes.dk, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 davidgow@google.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] lib: overflow-test: add KUnit
	test of check_*_overflow functions
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
---
v2:
  * moved lib/test_overflow.c to lib/overflow-test.c; 
    * back to original license;
    * fixed style code;
    * keeps __initconst and added _refdata on overflow_test_cases variable;
    * keeps macros intact making asserts with the variable err;
    * removed duplicate test_s8_overflow();
  * fixed typos on commit message;
---
 lib/Kconfig.debug                        | 20 +++++++--
 lib/Makefile                             |  2 +-
 lib/{test_overflow.c => overflow-test.c} | 54 +++++++++---------------
 3 files changed, 38 insertions(+), 38 deletions(-)
 rename lib/{test_overflow.c => overflow-test.c} (96%)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d74ac0fd6b2d..fb8a3955e969 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2000,9 +2000,6 @@ config TEST_UUID
 config TEST_XARRAY
 	tristate "Test the XArray code at runtime"
 
-config TEST_OVERFLOW
-	tristate "Test check_*_overflow() functions at runtime"
-
 config TEST_RHASHTABLE
 	tristate "Perform selftest on resizable hash table"
 	help
@@ -2155,6 +2152,23 @@ config SYSCTL_KUNIT_TEST
 
 	  If unsure, say N.
 
+config OVERFLOW_KUNIT_TEST
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
index b1c42c10073b..3b725c9f92d4 100644
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
+obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow-test.o
diff --git a/lib/test_overflow.c b/lib/overflow-test.c
similarity index 96%
rename from lib/test_overflow.c
rename to lib/overflow-test.c
index 7a4b6f6c5473..d40ef06b1ade 100644
--- a/lib/test_overflow.c
+++ b/lib/overflow-test.c
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
@@ -270,7 +267,7 @@ DEFINE_TEST_FUNC(u64, "%llu");
 DEFINE_TEST_FUNC(s64, "%lld");
 #endif
 
-static int __init test_overflow_calculation(void)
+static void __init overflow_calculation_test(struct kunit *test)
 {
 	int err = 0;
 
@@ -285,10 +282,10 @@ static int __init test_overflow_calculation(void)
 	err |= test_s64_overflow();
 #endif
 
-	return err;
+	KUNIT_EXPECT_FALSE(test, err);
 }
 
-static int __init test_overflow_shift(void)
+static void __init overflow_shift_test(struct kunit *test)
 {
 	int err = 0;
 
@@ -479,7 +476,7 @@ static int __init test_overflow_shift(void)
 	err |= TEST_ONE_SHIFT(0, 31, s32, 0, false);
 	err |= TEST_ONE_SHIFT(0, 63, s64, 0, false);
 
-	return err;
+	KUNIT_EXPECT_FALSE(test, err);
 }
 
 /*
@@ -555,7 +552,7 @@ DEFINE_TEST_ALLOC(kvzalloc_node, kvfree,     0, 1, 1);
 DEFINE_TEST_ALLOC(devm_kmalloc,  devm_kfree, 1, 1, 0);
 DEFINE_TEST_ALLOC(devm_kzalloc,  devm_kfree, 1, 1, 0);
 
-static int __init test_overflow_allocation(void)
+static void __init overflow_allocation_test(struct kunit *test)
 {
 	const char device_name[] = "overflow-test";
 	struct device *dev;
@@ -563,10 +560,8 @@ static int __init test_overflow_allocation(void)
 
 	/* Create dummy device for devm_kmalloc()-family tests. */
 	dev = root_device_register(device_name);
-	if (IS_ERR(dev)) {
-		pr_warn("Cannot register test device\n");
-		return 1;
-	}
+	if (IS_ERR(dev))
+		kunit_warn(test, "Cannot register test device\n");
 
 	err |= test_kmalloc(NULL);
 	err |= test_kmalloc_node(NULL);
@@ -585,30 +580,21 @@ static int __init test_overflow_allocation(void)
 
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
+static struct kunit_case __refdata overflow_test_cases[] = {
+	KUNIT_CASE(overflow_calculation_test),
+	KUNIT_CASE(overflow_shift_test),
+	KUNIT_CASE(overflow_allocation_test),
+	{}
+};
 
-	return err;
-}
+static struct kunit_suite overflow_test_suite = {
+	.name = "overflow",
+	.test_cases = overflow_test_cases,
+};
 
-static void __exit test_module_exit(void)
-{ }
+kunit_test_suites(&overflow_test_suite);
 
-module_init(test_module_init);
-module_exit(test_module_exit);
 MODULE_LICENSE("Dual MIT/GPL");

base-commit: 7bf200b3a4ac10b1b0376c70b8c66ed39eae7cdd
prerequisite-patch-id: e827b6b22f950b9f69620805a04e4a264cf4cc6a
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
