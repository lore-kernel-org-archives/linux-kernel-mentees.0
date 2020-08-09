Return-Path: <SRS0=eSSj=BT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417F8C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Aug 2020 14:45:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BED0206E9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Aug 2020 14:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bctJ7jE7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BED0206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CD02785FFD;
	Sun,  9 Aug 2020 14:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ZtTkihZZvAP; Sun,  9 Aug 2020 14:45:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1DF8585FC6;
	Sun,  9 Aug 2020 14:45:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04124C0864;
	Sun,  9 Aug 2020 14:45:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C4AEC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 14:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1852A204A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 14:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0Jjj4xmTHpD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 14:45:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id BD63F20432
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Aug 2020 14:45:38 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id f9so3491911pju.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 09 Aug 2020 07:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2iuVv4gM1MdMOYd40ce8eT3xg35aeEd9myudBM64X18=;
 b=bctJ7jE7Rl7Y7z9oAwWJiMIC0vdXTHSHvwOHOvk9dgFIrXKECb1QbBJDLEcq6r6QhW
 UkWTPWtdq+0YSumECg4Q81bOCnChp1SunrhX5R+M9inTgPjUhoa3QheedrmKJgt/2D2q
 alkNe7b/xupQTHSDL3RgDlJP09ApFY0/I3UDHXitAdf50/wSjDy2HVlzQaKh6rlvkwgr
 rB7YHvxphL8ItWySxCPhcwxF9EX5kTpiPuohhwaotpgsNtyKKI15tPNS3QVvtz2MrMdv
 ihkBYnrhV1k+DsxePR3byPFrhaTeHyBOGVHVzdEj+eA0zc3VlftrJ7nVs5bfafa89bGm
 gLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2iuVv4gM1MdMOYd40ce8eT3xg35aeEd9myudBM64X18=;
 b=c43m9DTVb7XXrzSnYH3zXOm/JUuTGFv++gMDfMR64TQgb9ZBDHhc3bDzpJKmfKetx1
 xGW+pq0JYpPZZ4ZQ9LylqdDLIBevMWAhmo1RHw0vPqNBpU58JEqF4hefojRrXNG6A7kQ
 Svxzbjcpssi1mF7PkCh8H3FYpUiNkYh+mstZa3RhGh3WFn1PZ9gLzWXoRBotKAVyknvM
 WH3V1fTIhpf3ACOkLCThzaAdYlQBZR4eNKdyzg9X7oOZEC1HStSj30Ttllju10oc18bV
 RFJOCVbIhdeuh4eRFu16BS5LVmmKY+1wMXpLJco0mywDVdW3yAHmljsQVr+l94W3y6R9
 AISw==
X-Gm-Message-State: AOAM530MSJKCDUziHOH0ZcGjbxNYXDsVN4k5yYy5WPShMgCrCEy6110V
 BwT155YbudB8NUquocMtxn0=
X-Google-Smtp-Source: ABdhPJwKB738poNztH/3a0EWwL8KRY1GV4fvAtsuYiZSJGHIgHJEEgW7jMOcKq2j5Ga4sGD0YkZyjQ==
X-Received: by 2002:a17:90a:2110:: with SMTP id
 a16mr22924416pje.104.1596984338130; 
 Sun, 09 Aug 2020 07:45:38 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([49.206.15.28])
 by smtp.gmail.com with ESMTPSA id 203sm14244523pge.34.2020.08.09.07.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 07:45:37 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, skhan@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com
Date: Sun,  9 Aug 2020 20:15:08 +0530
Message-Id: <20200809144508.61076-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [PATCH v2] lib: Convert test_hexdump.c to
	KUnit
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
Changes v1->v2:
- Replace KUNIT_EXPECT_EQ() with KUNIT_EXPECT_EQ_MSG()
- Replace KUNIT_EXPECT_NE() with KUNIT_EXPECT_NE_MSG()
- Prints expected and real buffer values in case of test failure

 lib/Kconfig.debug                       |  7 +-
 lib/Makefile                            |  2 +-
 lib/{test_hexdump.c => hexdump_kunit.c} | 85 ++++++++++---------------
 3 files changed, 40 insertions(+), 54 deletions(-)
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
index f39962104036..73ae79e36cc9 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -53,7 +53,6 @@ obj-$(CONFIG_STRING_SELFTEST) += test_string.o
 obj-y += string_helpers.o
 obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o
 obj-y += hexdump.o
-obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
 obj-y += kstrtox.o
 obj-$(CONFIG_FIND_BIT_BENCHMARK) += find_bit_benchmark.o
 obj-$(CONFIG_TEST_BPF) += test_bpf.o
@@ -345,3 +344,4 @@ obj-$(CONFIG_PLDMFW) += pldmfw/
 # KUnit tests
 obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
+obj-$(CONFIG_HEXDUMP_KUNIT_TEST) += hexdump_kunit.o
diff --git a/lib/test_hexdump.c b/lib/hexdump_kunit.c
similarity index 74%
rename from lib/test_hexdump.c
rename to lib/hexdump_kunit.c
index 5144899d3c6b..fea074b8c2e5 100644
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
@@ -138,28 +134,25 @@ static void __init test_hexdump(size_t len, int rowsize, int groupsize,
 	test_hexdump_prepare_test(len, rowsize, groupsize, test, sizeof(test),
 				  ascii);
 
-	if (memcmp(test, real, TEST_HEXDUMP_BUF_SIZE)) {
-		pr_err("Len: %zu row: %d group: %d\n", len, rowsize, groupsize);
-		pr_err("Result: '%s'\n", real);
-		pr_err("Expect: '%s'\n", test);
-		failed_tests++;
-	}
+	KUNIT_EXPECT_EQ_MSG(kunittest, 0, memcmp(test, real, TEST_HEXDUMP_BUF_SIZE),
+			"Len: %zu row: %d group: %d\nResult: '%s'\nExpect: '%s'\n",
+			len, rowsize, groupsize, real, test);
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
@@ -167,8 +160,6 @@ static void __init test_hexdump_overflow(size_t buflen, size_t len,
 	int ae, he, e, f, r;
 	bool a;
 
-	total_tests++;
-
 	memset(buf, FILL_CHAR, sizeof(buf));
 
 	r = hex_dump_to_buffer(data_b, len, rs, gs, buf, buflen, ascii);
@@ -196,16 +187,12 @@ static void __init test_hexdump_overflow(size_t buflen, size_t len,
 
 	buf[sizeof(buf) - 1] = '\0';
 
-	if (!a) {
-		pr_err("Len: %zu buflen: %zu strlen: %zu\n",
-			len, buflen, strnlen(buf, sizeof(buf)));
-		pr_err("Result: %d '%s'\n", r, buf);
-		pr_err("Expect: %d '%s'\n", e, test);
-		failed_tests++;
-	}
+	KUNIT_EXPECT_NE_MSG(kunittest, 0, a,
+			"Len: %zu buflen: %zu strlen: %zu\nResult: %d '%s'\nExpect: %d '%s",
+			len, buflen, strnlen(buf, sizeof(buf)), r, buf, e, test);
 }
 
-static void __init test_hexdump_overflow_set(size_t buflen, bool ascii)
+static void test_hexdump_overflow_set(struct kunit *test, size_t buflen, bool ascii)
 {
 	unsigned int i = 0;
 	int rs = (get_random_int() % 2 + 1) * 16;
@@ -214,43 +201,41 @@ static void __init test_hexdump_overflow_set(size_t buflen, bool ascii)
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
