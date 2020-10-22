Return-Path: <SRS0=G515=D5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB6AC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 15:14:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 881F920709
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 15:14:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fj/9Ua9L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 881F920709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DE3AB86AAB;
	Thu, 22 Oct 2020 15:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXXyMMi84OdZ; Thu, 22 Oct 2020 15:14:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 150D5867E5;
	Thu, 22 Oct 2020 15:14:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08BDDC088B;
	Thu, 22 Oct 2020 15:14:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 353AFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 15:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1939A203AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 15:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dRpUmTWmbu+4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 15:14:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 4B32420370
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 15:14:30 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 10so1324816pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 08:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KZ/U65zjA9u6hMXsaiRL/mSlzHa3ohaGcy+QrWOeCZs=;
 b=Fj/9Ua9LZjX1ogWCvx6x9V2T3WspUdgEnxPcTOgA2S+i5pocpE8RAAnELpu5+bER3C
 se0syPVx3FXHuq+mshitx3zk2P13r8qcy2yqhf5/i+fH0051tDH0jk9ShCe4gnR6cz2V
 v+IXGlMEs5eLfSFG/yyg8XDl//WjYjTqD4NL63BgjrIkZmuhvAymQKvhGEXPVcrcPft+
 fGS4symGSQnkdwJoeU5qViq82MXoKEvRChiagBubdfKa/MLGZNEVqUDdZWXOrH+2rud1
 GbmXj4adph1BIDxERtowli3aP9b8i+PMX0fVDTn1w/T0IvR3qKLhi6AYPWKKFXmCPrJ9
 26sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KZ/U65zjA9u6hMXsaiRL/mSlzHa3ohaGcy+QrWOeCZs=;
 b=VUhB3ktS7CqFXtLFr0wqwzWhlgY8NQtwcRJLv0dG2e6cD0RXVETUafb16dKPwBKTnz
 H2q41gjIW4sZTmusHlJfexoQTX8maT5tguzqp6PD1lBDmf83tmja69ghkG/mi2/++FUJ
 deO4MK2uywwIVbUlxQ8OfGAvFWtHD8NyFw4DLvyT7rLD9DrsW46fAxsua3GfHMAci4V0
 uF6Iy3aFTqVJZJVMl6dhUr6pqDWvwQYlMu4eaZhZawa/p9fLZOlsUpuMtkpC26iqsMjd
 vcYyHf/EnzE9qtVfg1QJ6Btk1C4DZSUnEO8n2+W98vloodUVexZbhXhSJV7dWpeQlrXy
 qz5g==
X-Gm-Message-State: AOAM533hhsQoxvP+5NfuKuCOHIrnfIGiDmAG+xMMQrbNVq/EgmeMnIGS
 pfPVHdI6RirW6y+ENRM0IMU=
X-Google-Smtp-Source: ABdhPJy42DS6N7bC4UmjQLH4ThqM/A7jF0kkk3sDqAO6LScCP14YJLihJnQogZ5D64Vm6haSY84+tQ==
X-Received: by 2002:a65:5a4d:: with SMTP id z13mr1379207pgs.297.1603379669614; 
 Thu, 22 Oct 2020 08:14:29 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([106.51.242.32])
 by smtp.gmail.com with ESMTPSA id b16sm2704489pfp.195.2020.10.22.08.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 08:14:28 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, skhan@linuxfoundation.org,
 andriy.shevchenko@linux.intel.com, pmladek@suse.com, rostedt@goodmis.org,
 sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
 alexandre.belloni@bootlin.com, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, idryomov@gmail.com
Date: Thu, 22 Oct 2020 20:43:49 +0530
Message-Id: <20201022151349.47436-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [PATCH v2] lib: Convert test_printf.c to
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

Convert test lib/test_printf.c to KUnit. More information about
KUnit can be found at:
https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
KUnit provides a common framework for unit tests in the kernel.
KUnit and kselftest are standardizing around KTAP, converting this
test to KUnit makes this test output in KTAP which we are trying to
make the standard test result format for the kernel. More about
the KTAP format can be found at:
https://lore.kernel.org/linux-kselftest/CY4PR13MB1175B804E31E502221BC8163FD830@CY4PR13MB1175.namprd13.prod.outlook.com/.
I ran both the original and converted tests as is to produce the
output for success of the test in the two cases. I also ran these
tests with a small modification to show the difference in the output
for failure of the test in both cases. The modification I made is:
- test("127.000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin_addr);
+ test("127-000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin_addr);

Original test success:
[    0.591262] test_printf: loaded.
[    0.591409] test_printf: all 388 tests passed

Original test failure:
[    0.619345] test_printf: loaded.
[    0.619394] test_printf: vsnprintf(buf, 256, "%piS|%pIS", ...)
wrote '127.000.000.001|127.0.0.1', expected
'127-000.000.001|127.0.0.1'
[    0.619395] test_printf: vsnprintf(buf, 25, "%piS|%pIS", ...) wrote
'127.000.000.001|127.0.0.', expected '127-000.000.001|127.0.0.'
[    0.619396] test_printf: kvasprintf(..., "%piS|%pIS", ...) returned
'127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
[    0.619495] test_printf: failed 3 out of 388 tests

Converted test success:
    # Subtest: printf-kunit-test
    1..1
    ok 1 - selftest
ok 1 - printf-kunit-test

Converted test failure:
    # Subtest: printf-kunit-test
    1..1
    # selftest: EXPECTATION FAILED at lib/printf_kunit.c:82
vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote
'127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
    # selftest: EXPECTATION FAILED at lib/printf_kunit.c:82
vsnprintf(buf, 5, "%pi4|%pI4", ...) wrote '127.', expected '127-'
    # selftest: EXPECTATION FAILED at lib/printf_kunit.c:118
kvasprintf(..., "%pi4|%pI4", ...) returned
'127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
    not ok 1 - selftest
not ok 1 - printf-kunit-test

Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
---
Changes v1->v2:
- Retain the control flow (early returns) in do_test()
- Display less irrelevant information on test failure
- A more detailed commit message

 lib/Kconfig.debug                     |  7 +--
 lib/Makefile                          |  2 +-
 lib/{test_printf.c => printf_kunit.c} | 76 +++++++++++++--------------
 3 files changed, 43 insertions(+), 42 deletions(-)
 rename lib/{test_printf.c => printf_kunit.c} (91%)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 66d44d35cc97..e82ca893ed5b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2053,9 +2053,6 @@ config TEST_STRSCPY
 config TEST_KSTRTOX
 	tristate "Test kstrto*() family of functions at runtime"
 
-config TEST_PRINTF
-	tristate "Test printf() family of functions at runtime"
-
 config TEST_BITMAP
 	tristate "Test bitmap_*() family of functions at runtime"
 	help
@@ -2282,6 +2279,10 @@ config BITS_TEST
 
 	  If unsure, say N.
 
+config PRINTF_KUNIT_TEST
+	tristate "KUnit test for printf() family of functions at runtime"
+	depends on KUNIT
+
 config TEST_UDELAY
 	tristate "udelay test driver"
 	help
diff --git a/lib/Makefile b/lib/Makefile
index ce45af50983a..c323447022b7 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -84,7 +84,6 @@ obj-$(CONFIG_TEST_SORT) += test_sort.o
 obj-$(CONFIG_TEST_USER_COPY) += test_user_copy.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
-obj-$(CONFIG_TEST_PRINTF) += test_printf.o
 obj-$(CONFIG_TEST_BITMAP) += test_bitmap.o
 obj-$(CONFIG_TEST_STRSCPY) += test_strscpy.o
 obj-$(CONFIG_TEST_UUID) += test_uuid.o
@@ -352,3 +351,4 @@ obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
 obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
 obj-$(CONFIG_BITS_TEST) += test_bits.o
+obj-$(CONFIG_PRINTF_KUNIT_TEST) += printf_kunit.o
diff --git a/lib/test_printf.c b/lib/printf_kunit.c
similarity index 91%
rename from lib/test_printf.c
rename to lib/printf_kunit.c
index 7ac87f18a10f..e4dc1b1c8972 100644
--- a/lib/test_printf.c
+++ b/lib/printf_kunit.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <kunit/test.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -30,64 +31,57 @@
 #define PAD_SIZE 16
 #define FILL_CHAR '$'
 
-static unsigned total_tests __initdata;
-static unsigned failed_tests __initdata;
 static char *test_buffer __initdata;
 static char *alloced_buffer __initdata;
+struct kunit *kunittest;
 
-static int __printf(4, 0) __init
+static void __printf(4, 0) __init
 do_test(int bufsize, const char *expect, int elen,
 	const char *fmt, va_list ap)
 {
 	va_list aq;
 	int ret, written;
 
-	total_tests++;
-
 	memset(alloced_buffer, FILL_CHAR, BUF_SIZE + 2*PAD_SIZE);
 	va_copy(aq, ap);
 	ret = vsnprintf(test_buffer, bufsize, fmt, aq);
 	va_end(aq);
 
 	if (ret != elen) {
-		pr_warn("vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d\n",
+		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) returned %d, expected %d\n",
 			bufsize, fmt, ret, elen);
-		return 1;
+		return;
 	}
 
 	if (memchr_inv(alloced_buffer, FILL_CHAR, PAD_SIZE)) {
-		pr_warn("vsnprintf(buf, %d, \"%s\", ...) wrote before buffer\n", bufsize, fmt);
-		return 1;
+		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) wrote before buffer\n", bufsize, fmt);
+		return;
 	}
 
 	if (!bufsize) {
-		if (memchr_inv(test_buffer, FILL_CHAR, BUF_SIZE + PAD_SIZE)) {
-			pr_warn("vsnprintf(buf, 0, \"%s\", ...) wrote to buffer\n",
-				fmt);
-			return 1;
-		}
-		return 0;
+		if (memchr_inv(test_buffer, FILL_CHAR, BUF_SIZE + PAD_SIZE))
+			KUNIT_FAIL(kunittest, "vsnprintf(buf, 0, \"%s\", ...) wrote to buffer\n", fmt);
+		return;
 	}
 
 	written = min(bufsize-1, elen);
 	if (test_buffer[written]) {
-		pr_warn("vsnprintf(buf, %d, \"%s\", ...) did not nul-terminate buffer\n",
+		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) did not nul-terminate buffer\n",
 			bufsize, fmt);
-		return 1;
+		return;
 	}
 
 	if (memchr_inv(test_buffer + written + 1, FILL_CHAR, BUF_SIZE + PAD_SIZE - (written + 1))) {
-		pr_warn("vsnprintf(buf, %d, \"%s\", ...) wrote beyond the nul-terminator\n",
+		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) wrote beyond the nul-terminator\n",
 			bufsize, fmt);
-		return 1;
+		return;
 	}
 
 	if (memcmp(test_buffer, expect, written)) {
-		pr_warn("vsnprintf(buf, %d, \"%s\", ...) wrote '%s', expected '%.*s'\n",
+		KUNIT_FAIL(kunittest, "vsnprintf(buf, %d, \"%s\", ...) wrote '%s', expected '%.*s'\n",
 			bufsize, fmt, test_buffer, written, expect);
-		return 1;
+		return;
 	}
-	return 0;
 }
 
 static void __printf(3, 4) __init
@@ -98,9 +92,8 @@ __test(const char *expect, int elen, const char *fmt, ...)
 	char *p;
 
 	if (elen >= BUF_SIZE) {
-		pr_err("error in test suite: expected output length %d too long. Format was '%s'.\n",
+		KUNIT_FAIL(kunittest, "error in test suite: expected output length %d too long. Format was '%s'.\n",
 		       elen, fmt);
-		failed_tests++;
 		return;
 	}
 
@@ -112,19 +105,17 @@ __test(const char *expect, int elen, const char *fmt, ...)
 	 * enough and 0), and then we also test that kvasprintf would
 	 * be able to print it as expected.
 	 */
-	failed_tests += do_test(BUF_SIZE, expect, elen, fmt, ap);
+	do_test(BUF_SIZE, expect, elen, fmt, ap);
 	rand = 1 + prandom_u32_max(elen+1);
 	/* Since elen < BUF_SIZE, we have 1 <= rand <= BUF_SIZE. */
-	failed_tests += do_test(rand, expect, elen, fmt, ap);
-	failed_tests += do_test(0, expect, elen, fmt, ap);
+	do_test(rand, expect, elen, fmt, ap);
+	do_test(0, expect, elen, fmt, ap);
 
 	p = kvasprintf(GFP_KERNEL, fmt, ap);
 	if (p) {
-		total_tests++;
 		if (memcmp(p, expect, elen+1)) {
-			pr_warn("kvasprintf(..., \"%s\", ...) returned '%s', expected '%s'\n",
+			KUNIT_FAIL(kunittest, "kvasprintf(..., \"%s\", ...) returned '%s', expected '%s'\n",
 				fmt, p, expect);
-			failed_tests++;
 		}
 		kfree(p);
 	}
@@ -303,16 +294,13 @@ plain(void)
 
 	err = plain_hash();
 	if (err) {
-		pr_warn("plain 'p' does not appear to be hashed\n");
-		failed_tests++;
+		KUNIT_FAIL(kunittest, "plain 'p' does not appear to be hashed\n");
 		return;
 	}
 
 	err = plain_format();
-	if (err) {
-		pr_warn("hashing plain 'p' has unexpected format\n");
-		failed_tests++;
-	}
+	if (err)
+		KUNIT_FAIL(kunittest, "hashing plain 'p' has unexpected format\n");
 }
 
 static void __init
@@ -696,8 +684,9 @@ test_pointer(void)
 	fwnode_pointer();
 }
 
-static void __init selftest(void)
+static void __init selftest(struct kunit *ktest)
 {
+	kunittest = ktest;
 	alloced_buffer = kmalloc(BUF_SIZE + 2*PAD_SIZE, GFP_KERNEL);
 	if (!alloced_buffer)
 		return;
@@ -711,6 +700,17 @@ static void __init selftest(void)
 	kfree(alloced_buffer);
 }
 
-KSTM_MODULE_LOADERS(test_printf);
+static struct kunit_case printf_test_cases[] = {
+	KUNIT_CASE(selftest),
+	{}
+};
+
+static struct kunit_suite printf_test_suite = {
+	.name = "printf-kunit-test",
+	.test_cases = printf_test_cases,
+};
+
+kunit_test_suite(printf_test_suite);
+
 MODULE_AUTHOR("Rasmus Villemoes <linux@rasmusvillemoes.dk>");
 MODULE_LICENSE("GPL");
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
