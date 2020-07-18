Return-Path: <SRS0=awrY=A5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEE3C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jul 2020 00:51:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FB962074B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jul 2020 00:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="JKdJdOWo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FB962074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D42687FB5;
	Sat, 18 Jul 2020 00:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84Rz-YXZLbm1; Sat, 18 Jul 2020 00:51:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CDCB887F3F;
	Sat, 18 Jul 2020 00:51:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7B8FC0865;
	Sat, 18 Jul 2020 00:51:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A03A2C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 00:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8A84587787
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 00:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JtfisygwVrIQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 00:51:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8967487784
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 00:51:46 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id z63so10412639qkb.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 17:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4lR3PL+tlav6Sd3AKsZVkdyRuT1gdsNfBg2d9bO4Ybw=;
 b=JKdJdOWoLbE63zmjfhu9UnfMu+KTlFFcste0tnpG53kEQSd+TyAuBDwTYKyLJnj/9Q
 7YdpDHel5BWIE0wV8SMcrbCxBxy5ZNhfOCR3hDbL+nS4U1HQynZZXcM3nDI/HMzWkfHk
 wxFzuoPHjpN7WpTOS2yHO1N/z+f1NnmzUaD7PMXpep9XdiR2e3xeZhgNQ8BBowRxGRi5
 4QGnA2ev/gV/A5QkI4xyIiUeH39t+h78XlqhClCrhMspeR/mJ97nweM27pBNojAoSRC8
 vElpGEzvULRIUidS+/Ckxe8n/AhXzkrHlZZ+VIBqpZrFlcM6KhM4oFFA9Fng02ERJHT8
 EmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4lR3PL+tlav6Sd3AKsZVkdyRuT1gdsNfBg2d9bO4Ybw=;
 b=eJrH6fKQrKSosF5/ePihvZ6rETKfU4TcWb1UJg/R/R2NvmVZ59hzulVRqT0HL+pxGr
 LmoNDNdnqcAa2wS2aRBph28IE28BcOCf8GruPiG4gyyMJZuEUFoKCMwb+p0wHnA18tn1
 tvuWmLtB6mBZUEBoVgfsEWUUIyHR8w6+T3UHiro5IHnr46uX9VlleARtmhHyqPaUDB1A
 Wtzv+Zx33Ya6aUZBj2RANgfs2Z2rvSbbyKuka/DmcgzpfreqmkN7oH2vBPx7uW4G5hgo
 8HNUbcxyfhu5NLnMfD8c0hDPF6+R/MGIUBeJrXWB1Gg/em2TlO6TCIW8f3ejW3skt9bq
 Xi5Q==
X-Gm-Message-State: AOAM533S1vOkc0sfUV//4qm/Mr1NFumE4MNqWmULwGQ8PJ3Fc6ru6zpm
 RTBfjMZhYLhXbiwLA4WgAdaQ2Q==
X-Google-Smtp-Source: ABdhPJyL15m0TxuDLsuYT9qyN02p4DwZ4mgfiDhARFqC9WoQENmBgtZ6gZRbT76CZf0OhAjlASlZyw==
X-Received: by 2002:a05:620a:79a:: with SMTP id
 26mr11825826qka.169.1595033505432; 
 Fri, 17 Jul 2020 17:51:45 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id 79sm11998188qkd.134.2020.07.17.17.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 17:51:44 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Fri, 17 Jul 2020 21:51:41 -0300
Message-Id: <20200718005141.440405-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kselftest@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, davidgow@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, keescook@chromium.org
Subject: [Linux-kernel-mentees] [PATCH v2] lib: Convert test_user_copy to
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

This adds the conversion of the runtime tests of test_user_copy fuctions,
from `lib/test_user_copy.c` to KUnit tests.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
v2:
    * splitted patch in 3:
        - Allows to install and load modules in root filesystem;
        - Provides an userspace memory context when tests are compiled
          as module;
        - Convert test_user_copy to KUnit test;
    * removed entry for CONFIG_TEST_USER_COPY;
    * replaced pr_warn to KUNIT_EXPECT_FALSE_MSG in test macro to
      decrease the diff;
---
 lib/Kconfig.debug                           | 28 ++++++++------
 lib/Makefile                                |  2 +-
 lib/{test_user_copy.c => user_copy_kunit.c} | 42 +++++++++------------
 3 files changed, 35 insertions(+), 37 deletions(-)
 rename lib/{test_user_copy.c => user_copy_kunit.c} (91%)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9ad9210d70a1..f699a3624ae7 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2078,18 +2078,6 @@ config TEST_VMALLOC
 
 	  If unsure, say N.
 
-config TEST_USER_COPY
-	tristate "Test user/kernel boundary protections"
-	depends on m
-	help
-	  This builds the "test_user_copy" module that runs sanity checks
-	  on the copy_to/from_user infrastructure, making sure basic
-	  user/kernel boundary testing is working. If it fails to load,
-	  a regression has been detected in the user/kernel memory boundary
-	  protections.
-
-	  If unsure, say N.
-
 config TEST_BPF
 	tristate "Test BPF filter functionality"
 	depends on m && NET
@@ -2154,6 +2142,22 @@ config SYSCTL_KUNIT_TEST
 
 	  If unsure, say N.
 
+config USER_COPY_KUNIT
+	tristate "KUnit Test for user/kernel boundary protections"
+	depends on KUNIT
+	depends on m
+	help
+	  This builds the "user_copy_kunit" module that runs sanity checks
+	  on the copy_to/from_user infrastructure, making sure basic
+	  user/kernel boundary testing is working. If it fails to load,
+	  a regression has been detected in the user/kernel memory boundary
+	  protections.
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
index b1c42c10073b..8c145f85accc 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -78,7 +78,6 @@ obj-$(CONFIG_TEST_VMALLOC) += test_vmalloc.o
 obj-$(CONFIG_TEST_OVERFLOW) += test_overflow.o
 obj-$(CONFIG_TEST_RHASHTABLE) += test_rhashtable.o
 obj-$(CONFIG_TEST_SORT) += test_sort.o
-obj-$(CONFIG_TEST_USER_COPY) += test_user_copy.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
 obj-$(CONFIG_TEST_PRINTF) += test_printf.o
@@ -318,3 +317,4 @@ obj-$(CONFIG_OBJAGG) += objagg.o
 # KUnit tests
 obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
+obj-$(CONFIG_USER_COPY_KUNIT) += user_copy_kunit.o
diff --git a/lib/test_user_copy.c b/lib/user_copy_kunit.c
similarity index 91%
rename from lib/test_user_copy.c
rename to lib/user_copy_kunit.c
index 5ff04d8fe971..a10ddd15b4cd 100644
--- a/lib/test_user_copy.c
+++ b/lib/user_copy_kunit.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/vmalloc.h>
+#include <kunit/test.h>
 
 /*
  * Several 32-bit architectures support 64-bit {get,put}_user() calls.
@@ -35,7 +36,7 @@
 ({									\
 	int cond = (condition);						\
 	if (cond)							\
-		pr_warn("[%d] " msg "\n", __LINE__, ##__VA_ARGS__);	\
+		KUNIT_EXPECT_FALSE_MSG(test, cond, msg, ##__VA_ARGS__);	\
 	cond;								\
 })
 
@@ -44,7 +45,7 @@ static bool is_zeroed(void *from, size_t size)
 	return memchr_inv(from, 0x0, size) == NULL;
 }
 
-static int test_check_nonzero_user(char *kmem, char __user *umem, size_t size)
+static int test_check_nonzero_user(struct kunit *test, char *kmem, char __user *umem, size_t size)
 {
 	int ret = 0;
 	size_t start, end, i, zero_start, zero_end;
@@ -102,7 +103,7 @@ static int test_check_nonzero_user(char *kmem, char __user *umem, size_t size)
 	return ret;
 }
 
-static int test_copy_struct_from_user(char *kmem, char __user *umem,
+static int test_copy_struct_from_user(struct kunit *test, char *kmem, char __user *umem,
 				      size_t size)
 {
 	int ret = 0;
@@ -177,7 +178,7 @@ static int test_copy_struct_from_user(char *kmem, char __user *umem,
 	return ret;
 }
 
-static int __init test_user_copy_init(void)
+static void user_copy_test(struct kunit *test)
 {
 	int ret = 0;
 	char *kmem;
@@ -192,16 +193,14 @@ static int __init test_user_copy_init(void)
 #endif
 
 	kmem = kmalloc(PAGE_SIZE * 2, GFP_KERNEL);
-	if (!kmem)
-		return -ENOMEM;
+	KUNIT_EXPECT_FALSE_MSG(test, kmem == NULL, "kmalloc failed");
 
 	user_addr = vm_mmap(NULL, 0, PAGE_SIZE * 2,
 			    PROT_READ | PROT_WRITE | PROT_EXEC,
 			    MAP_ANONYMOUS | MAP_PRIVATE, 0);
 	if (user_addr >= (unsigned long)(TASK_SIZE)) {
-		pr_warn("Failed to allocate user memory\n");
 		kfree(kmem);
-		return -ENOMEM;
+		KUNIT_FAIL(test, "Failed to allocate user memory");
 	}
 
 	usermem = (char __user *)user_addr;
@@ -245,9 +244,9 @@ static int __init test_user_copy_init(void)
 #undef test_legit
 
 	/* Test usage of check_nonzero_user(). */
-	ret |= test_check_nonzero_user(kmem, usermem, 2 * PAGE_SIZE);
+	ret |= test_check_nonzero_user(test, kmem, usermem, 2 * PAGE_SIZE);
 	/* Test usage of copy_struct_from_user(). */
-	ret |= test_copy_struct_from_user(kmem, usermem, 2 * PAGE_SIZE);
+	ret |= test_copy_struct_from_user(test, kmem, usermem, 2 * PAGE_SIZE);
 
 	/*
 	 * Invalid usage: none of these copies should succeed.
@@ -309,23 +308,18 @@ static int __init test_user_copy_init(void)
 
 	vm_munmap(user_addr, PAGE_SIZE * 2);
 	kfree(kmem);
-
-	if (ret == 0) {
-		pr_info("tests passed.\n");
-		return 0;
-	}
-
-	return -EINVAL;
 }
 
-module_init(test_user_copy_init);
-
-static void __exit test_user_copy_exit(void)
-{
-	pr_info("unloaded.\n");
-}
+static struct kunit_case user_copy_test_cases[] = {
+	KUNIT_CASE(user_copy_test),
+	{}
+};
 
-module_exit(test_user_copy_exit);
+static struct kunit_suite user_copy_test_suite = {
+	.name = "user_copy",
+	.test_cases = user_copy_test_cases,
+};
 
+kunit_test_suites(&user_copy_test_suite);
 MODULE_AUTHOR("Kees Cook <keescook@chromium.org>");
 MODULE_LICENSE("GPL");

base-commit: 725aca9585956676687c4cb803e88f770b0df2b2
prerequisite-patch-id: 5e5f9a8a05c5680fda1b04c9ab1b95ce91dc88b2
prerequisite-patch-id: 4d997940f4a9f303424af9bac412de1af861f9d9
prerequisite-patch-id: 582b6d9d28ce4b71628890ec832df6522ca68de0
prerequisite-patch-id: 5cd745ed9bbb0b36010c5de8adc19bfa86ad8be0
prerequisite-patch-id: 42f17b389ec15baf50dd1c43f6e30b8d2dff7964
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
