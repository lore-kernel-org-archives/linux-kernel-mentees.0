Return-Path: <SRS0=sW3u=BQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF91DC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Aug 2020 11:03:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF2A62250E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Aug 2020 11:03:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKnCtfCe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF2A62250E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5E7C323DB4;
	Thu,  6 Aug 2020 09:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbRM9af8qGc9; Thu,  6 Aug 2020 09:45:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BDF6A20521;
	Thu,  6 Aug 2020 09:45:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A248BC0050;
	Thu,  6 Aug 2020 09:45:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 887FAC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 09:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 73E588888A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 09:45:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H6oGzqXpNyLL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 09:45:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ABEA98887E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 09:45:35 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id r4so16586116pls.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Aug 2020 02:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qWcDbCXjjTS6FI2Lgan9OIsGZAC933SE4UPrECccLi4=;
 b=KKnCtfCegvFbD/tDZxYcvbMK30oQ3CsY9rUNbUO1ne/rJOL//uutNsLiyQwEmU0w7j
 z39/+c0SdKROpUiVvcgOUKEyCivyMDvsj5f5DSVm7Dx1ut65er3z37aiLab1gw460Xv5
 r8sPPFIRjMk4KrkDDRoJ8pix33kuUmOGbwdytFBncHRBMGbWqk/rpkFEXcV7BttRvCSB
 3+cUqBKpLfx7AwQiKWMRUW/jrK/bvcEESGyDf6vWuRZkvm5RBc0Bi4MsZpkrULdi1+mk
 s9Yrw8zSPoV2RT/tB1/Wxultw5MK5vyhpcvWB8+CshnT2jAXL+pjKjWYwtC9QsAmYkBN
 lNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qWcDbCXjjTS6FI2Lgan9OIsGZAC933SE4UPrECccLi4=;
 b=MJJ9fdl5B7azzUGm6WEwI2dwyj7vwWMTRcBjgmfG6RxL2GzfbJmVszlDrPwMs+EUMh
 FSE9UoJvbNELyKMcoxomw26+LiNMmysddYLEoOeujLLOUooO293ObJ2Zcnw+bYWWSatY
 bccOL8YClvfbxQdcg/dztEH409nRiHVnqLZb18rSfJoGRYhmglLyS8p8QfiIXTcogIsB
 5g56LloRYDhwqsXvlXkB7b2k8nfa+goqsP2gJVb55ge5ADDHiV27lG/2pRHkF7ZOgDqS
 lSsfT5DyxkToXltjIRkzOysYT/nufFov/JM7tLwCPD6KfvG2S1N98wTkRQlKaC55YNav
 6nJg==
X-Gm-Message-State: AOAM533CXApAbP0K6S/EDv2qdapR4oMlIKJpmwgtkb8ggBcRg1Q8MEvJ
 6qMM2/9/DHDz5Rs+V4zch0Y=
X-Google-Smtp-Source: ABdhPJweWzPxErikXlHXt2fZRae5rt4PSN+3g5cwiXlmpZWnbdEM0SQRie62WOdOxMGXOv/WIjSyEg==
X-Received: by 2002:a17:90a:fa94:: with SMTP id
 cu20mr7583230pjb.145.1596707135130; 
 Thu, 06 Aug 2020 02:45:35 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([49.206.15.28])
 by smtp.gmail.com with ESMTPSA id 3sm6374496pjo.40.2020.08.06.02.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 02:45:34 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, skhan@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com
Date: Thu,  6 Aug 2020 15:14:40 +0530
Message-Id: <20200806094440.14962-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [PATCH] lib: Convert test_hexdump.c to KUnit
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

Converts test lib/test_hexdump.c to KUnit.
More information about KUnit can be found at
https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
KUnit provides a common framework for unit tests in the kernel.

Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
---
 lib/Kconfig.debug                       |  7 ++-
 lib/Makefile                            |  2 +-
 lib/{test_hexdump.c => hexdump_kunit.c} | 81 ++++++++++---------------
 3 files changed, 36 insertions(+), 54 deletions(-)
 rename lib/{test_hexdump.c => hexdump_kunit.c} (74%)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a164785c3b48..20efea177e02 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2003,9 +2003,6 @@ config ASYNC_RAID6_TEST
 
 	  If unsure, say N.
 
-config TEST_HEXDUMP
-	tristate "Test functions located in the hexdump module at runtime"
-
 config TEST_STRING_HELPERS
 	tristate "Test functions located in the string_helpers module at runtime"
 
@@ -2224,6 +2221,10 @@ config LINEAR_RANGES_TEST
 
 	  If unsure, say N.
 
+config HEXDUMP_KUNIT_TEST
+	tristate "KUnit test for functions located in the hexdump module at runtime"
+	depends on KUNIT
+
 config TEST_UDELAY
 	tristate "udelay test driver"
 	help
diff --git a/lib/Makefile b/lib/Makefile
index 435f7f13b8aa..3819d42a4681 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -54,7 +54,6 @@ obj-$(CONFIG_STRING_SELFTEST) += test_string.o
 obj-y += string_helpers.o
 obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o
 obj-y += hexdump.o
-obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
 obj-y += kstrtox.o
 obj-$(CONFIG_FIND_BIT_BENCHMARK) += find_bit_benchmark.o
 obj-$(CONFIG_TEST_BPF) += test_bpf.o
@@ -346,3 +345,4 @@ obj-$(CONFIG_PLDMFW) += pldmfw/
 # KUnit tests
 obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
+obj-$(CONFIG_HEXDUMP_KUNIT_TEST) += hexdump_kunit.o
diff --git a/lib/test_hexdump.c b/lib/hexdump_kunit.c
similarity index 74%
rename from lib/test_hexdump.c
rename to lib/hexdump_kunit.c
index 5144899d3c6b..8f8d80114a92 100644
--- a/lib/test_hexdump.c
+++ b/lib/hexdump_kunit.c
@@ -3,6 +3,7 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <kunit/test.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -61,10 +62,7 @@ static const char * const test_data_8_be[] __initconst = {
 
 #define FILL_CHAR	'#'
 
-static unsigned total_tests __initdata;
-static unsigned failed_tests __initdata;
-
-static void __init test_hexdump_prepare_test(size_t len, int rowsize,
+static void test_hexdump_prepare_test(size_t len, int rowsize,
 					     int groupsize, char *test,
 					     size_t testlen, bool ascii)
 {
@@ -122,14 +120,12 @@ static void __init test_hexdump_prepare_test(size_t len, int rowsize,
 
 #define TEST_HEXDUMP_BUF_SIZE		(32 * 3 + 2 + 32 + 1)
 
-static void __init test_hexdump(size_t len, int rowsize, int groupsize,
-				bool ascii)
+static void test_hexdump(struct kunit *kunittest, size_t len, int rowsize,
+				int groupsize, bool ascii)
 {
 	char test[TEST_HEXDUMP_BUF_SIZE];
 	char real[TEST_HEXDUMP_BUF_SIZE];
 
-	total_tests++;
-
 	memset(real, FILL_CHAR, sizeof(real));
 	hex_dump_to_buffer(data_b, len, rowsize, groupsize, real, sizeof(real),
 			   ascii);
@@ -138,28 +134,23 @@ static void __init test_hexdump(size_t len, int rowsize, int groupsize,
 	test_hexdump_prepare_test(len, rowsize, groupsize, test, sizeof(test),
 				  ascii);
 
-	if (memcmp(test, real, TEST_HEXDUMP_BUF_SIZE)) {
-		pr_err("Len: %zu row: %d group: %d\n", len, rowsize, groupsize);
-		pr_err("Result: '%s'\n", real);
-		pr_err("Expect: '%s'\n", test);
-		failed_tests++;
-	}
+	KUNIT_EXPECT_EQ(kunittest, 0, memcmp(test, real, TEST_HEXDUMP_BUF_SIZE));
 }
 
-static void __init test_hexdump_set(int rowsize, bool ascii)
+static void test_hexdump_set(struct kunit *test, int rowsize, bool ascii)
 {
 	size_t d = min_t(size_t, sizeof(data_b), rowsize);
 	size_t len = get_random_int() % d + 1;
 
-	test_hexdump(len, rowsize, 4, ascii);
-	test_hexdump(len, rowsize, 2, ascii);
-	test_hexdump(len, rowsize, 8, ascii);
-	test_hexdump(len, rowsize, 1, ascii);
+	test_hexdump(test, len, rowsize, 4, ascii);
+	test_hexdump(test, len, rowsize, 2, ascii);
+	test_hexdump(test, len, rowsize, 8, ascii);
+	test_hexdump(test, len, rowsize, 1, ascii);
 }
 
-static void __init test_hexdump_overflow(size_t buflen, size_t len,
-					 int rowsize, int groupsize,
-					 bool ascii)
+static void test_hexdump_overflow(struct kunit *kunittest, size_t buflen,
+					size_t len, int rowsize,
+					int groupsize, bool ascii)
 {
 	char test[TEST_HEXDUMP_BUF_SIZE];
 	char buf[TEST_HEXDUMP_BUF_SIZE];
@@ -167,8 +158,6 @@ static void __init test_hexdump_overflow(size_t buflen, size_t len,
 	int ae, he, e, f, r;
 	bool a;
 
-	total_tests++;
-
 	memset(buf, FILL_CHAR, sizeof(buf));
 
 	r = hex_dump_to_buffer(data_b, len, rs, gs, buf, buflen, ascii);
@@ -196,16 +185,10 @@ static void __init test_hexdump_overflow(size_t buflen, size_t len,
 
 	buf[sizeof(buf) - 1] = '\0';
 
-	if (!a) {
-		pr_err("Len: %zu buflen: %zu strlen: %zu\n",
-			len, buflen, strnlen(buf, sizeof(buf)));
-		pr_err("Result: %d '%s'\n", r, buf);
-		pr_err("Expect: %d '%s'\n", e, test);
-		failed_tests++;
-	}
+	KUNIT_EXPECT_NE(kunittest, 0, a);
 }
 
-static void __init test_hexdump_overflow_set(size_t buflen, bool ascii)
+static void test_hexdump_overflow_set(struct kunit *test, size_t buflen, bool ascii)
 {
 	unsigned int i = 0;
 	int rs = (get_random_int() % 2 + 1) * 16;
@@ -214,43 +197,41 @@ static void __init test_hexdump_overflow_set(size_t buflen, bool ascii)
 		int gs = 1 << i;
 		size_t len = get_random_int() % rs + gs;
 
-		test_hexdump_overflow(buflen, rounddown(len, gs), rs, gs, ascii);
+		test_hexdump_overflow(test, buflen, rounddown(len, gs), rs, gs, ascii);
 	} while (i++ < 3);
 }
 
-static int __init test_hexdump_init(void)
+static void test_hexdump_init(struct kunit *test)
 {
 	unsigned int i;
 	int rowsize;
 
 	rowsize = (get_random_int() % 2 + 1) * 16;
 	for (i = 0; i < 16; i++)
-		test_hexdump_set(rowsize, false);
+		test_hexdump_set(test, rowsize, false);
 
 	rowsize = (get_random_int() % 2 + 1) * 16;
 	for (i = 0; i < 16; i++)
-		test_hexdump_set(rowsize, true);
+		test_hexdump_set(test, rowsize, true);
 
 	for (i = 0; i <= TEST_HEXDUMP_BUF_SIZE; i++)
-		test_hexdump_overflow_set(i, false);
+		test_hexdump_overflow_set(test, i, false);
 
 	for (i = 0; i <= TEST_HEXDUMP_BUF_SIZE; i++)
-		test_hexdump_overflow_set(i, true);
+		test_hexdump_overflow_set(test, i, true);
+}
 
-	if (failed_tests == 0)
-		pr_info("all %u tests passed\n", total_tests);
-	else
-		pr_err("failed %u out of %u tests\n", failed_tests, total_tests);
+static struct kunit_case hexdump_test_cases[] = {
+	KUNIT_CASE(test_hexdump_init),
+	{}
+};
 
-	return failed_tests ? -EINVAL : 0;
-}
-module_init(test_hexdump_init);
+static struct kunit_suite hexdump_test_suite = {
+	.name = "hexdump-kunit-test",
+	.test_cases = hexdump_test_cases,
+};
 
-static void __exit test_hexdump_exit(void)
-{
-	/* do nothing */
-}
-module_exit(test_hexdump_exit);
+kunit_test_suite(hexdump_test_suite);
 
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
