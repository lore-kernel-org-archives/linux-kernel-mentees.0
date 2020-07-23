Return-Path: <SRS0=mJtO=BC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE46EC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 00:08:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67F9222B3F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 00:08:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="iFlAbOWW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67F9222B3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3038D2420F;
	Thu, 23 Jul 2020 00:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7aNc8HaWV8ay; Thu, 23 Jul 2020 00:08:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 44655241F9;
	Thu, 23 Jul 2020 00:08:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 260B0C004E;
	Thu, 23 Jul 2020 00:08:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EEFCC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 00:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 07E852420F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 00:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVpr7pgZ5CuI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 00:08:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 8D5B6241F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 00:08:17 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id g13so3211256qtv.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 17:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wIJE53JQkkzN5LFSQElzrK2dsjCi+Qx4vXk/TwFFyZo=;
 b=iFlAbOWWbZfvrAlTvRFOi3RUaabnAITRT/KxJ3GYUkN5crnBC9miqwoa7Dqh5p5y2z
 NKO8hTYz5votR4D2q68XcqzIyL/TO+DfLeGNdyHYPL9LATmCFjVXa1YoUwh9+HwA9UX0
 r4qWmmQmkpQ6xkp4rdjwJY8rGAHAU9oHeotOxdedTu3jMXvUi4UEO90IFexVLhyxR3Ee
 0aP7eKaSHwHQPIeS0qqONOFhW36Jol0SrQZi/UouQxm4V7FkfpdiEbpzurlf3yYs4N1y
 OJnlLFCcS7f616yGhk5fTAN96LD/4ARV8G84+aqrer7EWgemmNZcBzOTToP6xmmY9d9a
 EB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wIJE53JQkkzN5LFSQElzrK2dsjCi+Qx4vXk/TwFFyZo=;
 b=AeMa2zUwi0lnX5OstybUuPLRw/tKI9mNjQ8TFi/BVTvNXHLrIroKlnxDNHJ0FyTsww
 HaVZFVL5xDlBSl1B1UNzWjjae6rgS8Orj6e+tCERA5IGXrr0qkRT1Dj0+uOq5Jyl5I37
 3iKAo3f93cHXmheSS9dDkHwp92fNBSVzamnG34kjGiJuWQcYNFmVWRWXidMuxuy1Z4HM
 B8MNgulZjBPjVwCc0S3mcwzDBVYFIjSakiOetPu8jfVFedoVgpXU4d2Gphsf1W1FiWAw
 eFw30ABnVZD4lbRrYaisNm70UA1EQ0YoZCOEwOKMx5dB3Ib+mZFRuVCIICyCbZIxXybC
 InIw==
X-Gm-Message-State: AOAM531osGTlkOkr2/Ine551HeBwXzPy7sHHfbIP0Kli5VCVp9589WQM
 9uM9tJ1VUS5wVSqDAJEAMMNPFw==
X-Google-Smtp-Source: ABdhPJyoCLDw96+G5vz569EAbwZkgms47TpFmM8GeL89ABrUkEkgBQQH2U2yceS+o56uKcTJOxf4tA==
X-Received: by 2002:ac8:3963:: with SMTP id t32mr1962263qtb.152.1595462896422; 
 Wed, 22 Jul 2020 17:08:16 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id l67sm1160598qkd.7.2020.07.22.17.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 17:08:15 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Wed, 22 Jul 2020 21:08:07 -0300
Message-Id: <20200723000807.171940-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: fkostenzer@live.at, torvalds@linux-foundation.org,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 paul.gortmaker@windriver.com, geert@linux-m68k.org,
 linux-kselftest@vger.kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com,
 linux-kernel-mentees@lists.linuxfoundation.org, akpm@linux-foundation.org
Subject: [Linux-kernel-mentees] [PATCH] lib: kunit: Convert test_sort to
	KUnit test
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

This adds the conversion of the test_sort.c to KUnit test.

Please apply this commit first (linux-kselftest/kunit-fixes):
3f37d14b8a3152441f36b6bc74000996679f0998 kunit: kunit_config: Fix parsing of CONFIG options with space

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 lib/Kconfig.debug                 | 26 +++++++++++++++++---------
 lib/Makefile                      |  2 +-
 lib/{test_sort.c => sort_kunit.c} | 31 +++++++++++++++----------------
 3 files changed, 33 insertions(+), 26 deletions(-)
 rename lib/{test_sort.c => sort_kunit.c} (55%)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9ad9210d70a1..1fe19e78d7ca 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1874,15 +1874,6 @@ config TEST_MIN_HEAP

 	  If unsure, say N.

-config TEST_SORT
-	tristate "Array-based sort test"
-	depends on DEBUG_KERNEL || m
-	help
-	  This option enables the self-test function of 'sort()' at boot,
-	  or at module load time.
-
-	  If unsure, say N.
-
 config KPROBES_SANITY_TEST
 	bool "Kprobes sanity tests"
 	depends on DEBUG_KERNEL
@@ -2185,6 +2176,23 @@ config LINEAR_RANGES_TEST

 	  If unsure, say N.

+config SORT_KUNIT
+	tristate "KUnit test for Array-based sort"
+	depends on DEBUG_KERNEL || m
+	help
+	  This option enables the KUnit function of 'sort()' at boot,
+	  or at module load time.
+
+	  KUnit tests run during boot and output the results to the debug log
+	  in TAP format (http://testanything.org/). Only useful for kernel devs
+	  running the KUnit test harness, and not intended for inclusion into a
+	  production build.
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
index b1c42c10073b..c22bb13b0a08 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -77,7 +77,6 @@ obj-$(CONFIG_TEST_LKM) += test_module.o
 obj-$(CONFIG_TEST_VMALLOC) += test_vmalloc.o
 obj-$(CONFIG_TEST_OVERFLOW) += test_overflow.o
 obj-$(CONFIG_TEST_RHASHTABLE) += test_rhashtable.o
-obj-$(CONFIG_TEST_SORT) += test_sort.o
 obj-$(CONFIG_TEST_USER_COPY) += test_user_copy.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
@@ -318,3 +317,4 @@ obj-$(CONFIG_OBJAGG) += objagg.o
 # KUnit tests
 obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
+obj-$(CONFIG_SORT_KUNIT) += sort_kunit.o
diff --git a/lib/test_sort.c b/lib/sort_kunit.c
similarity index 55%
rename from lib/test_sort.c
rename to lib/sort_kunit.c
index 52edbe10f2e5..03ba1cf1285c 100644
--- a/lib/test_sort.c
+++ b/lib/sort_kunit.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/sort.h>
-#include <linux/slab.h>
-#include <linux/module.h>
+#include <kunit/test.h>

 /* a simple boot-time regression test */

@@ -12,13 +11,12 @@ static int __init cmpint(const void *a, const void *b)
 	return *(int *)a - *(int *)b;
 }

-static int __init test_sort_init(void)
+static void __init sort_test(struct kunit *test)
 {
-	int *a, i, r = 1, err = -ENOMEM;
+	int *a, i, r = 1;

 	a = kmalloc_array(TEST_LEN, sizeof(*a), GFP_KERNEL);
-	if (!a)
-		return err;
+	KUNIT_ASSERT_FALSE_MSG(test, a == NULL, "kmalloc_array failed");

 	for (i = 0; i < TEST_LEN; i++) {
 		r = (r * 725861) % 6599;
@@ -27,24 +25,25 @@ static int __init test_sort_init(void)

 	sort(a, TEST_LEN, sizeof(*a), cmpint, NULL);

-	err = -EINVAL;
 	for (i = 0; i < TEST_LEN-1; i++)
 		if (a[i] > a[i+1]) {
-			pr_err("test has failed\n");
+			KUNIT_FAIL(test, "test has failed");
 			goto exit;
 		}
-	err = 0;
-	pr_info("test passed\n");
 exit:
 	kfree(a);
-	return err;
 }

-static void __exit test_sort_exit(void)
-{
-}
+static struct kunit_case sort_test_cases[] = {
+	KUNIT_CASE(sort_test),
+	{}
+};
+
+static struct kunit_suite sort_test_suite = {
+	.name = "sort",
+	.test_cases = sort_test_cases,
+};

-module_init(test_sort_init);
-module_exit(test_sort_exit);
+kunit_test_suites(&sort_test_suite);

 MODULE_LICENSE("GPL");

base-commit: d43c7fb05765152d4d4a39a8ef957c4ea14d8847
--
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
