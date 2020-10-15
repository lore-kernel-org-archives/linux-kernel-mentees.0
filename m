Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDD8C43457
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 01:46:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B55022257
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 01:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="cgW9/K3x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B55022257
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E53238837F;
	Thu, 15 Oct 2020 01:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVsHCKdzq6g8; Thu, 15 Oct 2020 01:46:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 339508837A;
	Thu, 15 Oct 2020 01:46:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D5FEC07FF;
	Thu, 15 Oct 2020 01:46:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89FC1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 01:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 71B3588717
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 01:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLPZ2Yg5+VVP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 01:46:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 63AD788716
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 01:46:24 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id w5so484435qvn.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 18:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M+KMDSMW+VIAL3mDePAVrUXUBl0wejFu1z7ayCtJdWE=;
 b=cgW9/K3x93TgArMaMN1eVRDH8x6TsGW+2KFrqGZSm9nRochFWHsFWrkqVYLgqCVQzh
 fGSY0sbngNPxQb9U2RwyZgA9E1PRHFUjDnnQmSVtZU3V9WYsa/sNrOtAs729lTc4+4HI
 kLKnqg3FI47AtwWnBflb28IAKoRNhimAM/lwME8aq+hP7qnx1egmOvR5kTXpLKEDbXIm
 OWheODEdG9FcdJxH/Pfv0wNsjpQ7yPxwAx07HCv+EggLm0lk3odFHCYZaiUAwJomClvC
 rewmN3NMeHetnC+uvegWHUstXV/iIN6Sb1WZQqxR6aN5sRozaB4aiecYQ7bxSHqdkK6w
 t76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M+KMDSMW+VIAL3mDePAVrUXUBl0wejFu1z7ayCtJdWE=;
 b=EvUWW7aayI1jzcg1BBqXZmKINYSepfuPiqdisIm1r7sFZWLrs42dHjDP60Aejv9fYl
 f5nZyXeIVzKbKNfITKx4Te4XkcWzqzop8x28FETmrIAbSFXKu7u8K9UDAsTqxa4Fytcz
 O+8vfoWoPARXyI7QTI5nXO5wH7WcFDaEs0gmkJ5ekpgafzf4DM8YgvVcoTTF/cwX+ydH
 MsfgY6csE9ZW2ElHwSnA1HLbzozTc6OuopevzivkCG8RiwA1D3BRQdPOoKwSM4F4PAX3
 hT6uduJVQ5IG8cZ22GcTCw2xnXXRh/reOkF/xSROXVLBshLLN4LfremJ8ole+H5yBjsS
 +PVA==
X-Gm-Message-State: AOAM531x8dGJemcU+mv9DB4d3LBX2AjBMXaju55SkPD85zHWMr13bxpw
 nvqzD2douIxIuCy1IQQrD4iJwA==
X-Google-Smtp-Source: ABdhPJzYM/lcrs60DNosmH1aZkomG9f401VbNqKieHGPn3ss7ztP5CAqKfbf6uPnoTX8dE58FnKQwA==
X-Received: by 2002:ad4:4f22:: with SMTP id fc2mr2288567qvb.28.1602726383312; 
 Wed, 14 Oct 2020 18:46:23 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7cb:5e0b:6f3d:fca0:306c:a15d])
 by smtp.gmail.com with ESMTPSA id h9sm541448qth.78.2020.10.14.18.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 18:46:22 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com,
	brendanhiggins@google.com,
	elver@google.com
Date: Wed, 14 Oct 2020 22:46:16 -0300
Message-Id: <20201015014616.309000-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: mhocko@suse.com, arnd@arndb.de, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, elfring@users.sourceforge.net,
 paul.gortmaker@windriver.com, geert@linux-m68k.org,
 linux-kselftest@vger.kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com,
 linux-kernel-mentees@lists.linuxfoundation.org, akpm@linux-foundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] lib: kunit: add list_sort test
	conversion to KUnit
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

This adds the conversion of the runtime tests of test_list_sort,
from `lib/test_list_sort.c` to KUnit tests.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
v2:
  * fix  KUNIT_TEST sufix;
  * make kconfig help more concise;
  * remove obsolete commit comments;
  * change Kconfig entries to be more adherent to KUnit documentation;
---
 lib/Kconfig.debug                           | 24 ++++---
 lib/Makefile                                |  2 +-
 lib/{test_list_sort.c => list_sort_kunit.c} | 73 +++++++++++----------
 3 files changed, 53 insertions(+), 46 deletions(-)
 rename lib/{test_list_sort.c => list_sort_kunit.c} (62%)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 4f09c6505a2e..b4b1338c523a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1905,16 +1905,6 @@ config LKDTM
 	Documentation on how to use the module can be found in
 	Documentation/fault-injection/provoke-crashes.rst
 
-config TEST_LIST_SORT
-	tristate "Linked list sorting test"
-	depends on DEBUG_KERNEL || m
-	help
-	  Enable this to turn on 'list_sort()' function test. This test is
-	  executed only once during system boot (so affects only boot time),
-	  or at module load time.
-
-	  If unsure, say N.
-
 config TEST_MIN_HEAP
 	tristate "Min heap test"
 	depends on DEBUG_KERNEL || m
@@ -2233,6 +2223,20 @@ config LIST_KUNIT_TEST
 
 	  If unsure, say N.
 
+config LIST_SORT_KUNIT_TEST
+	tristate "KUnit Linked list sorting test" if !KUNIT_ALL_TESTS 
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this to turn on 'list_sort()' function test. This test is
+	  executed only once during system boot (so affects only boot time),
+	  or at module load time.
+
+	  For more information on KUnit and unit tests in general please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 config LINEAR_RANGES_TEST
 	tristate "KUnit test for linear_ranges"
 	depends on KUNIT
diff --git a/lib/Makefile b/lib/Makefile
index d862d41fdc3d..a00e26d34263 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -67,7 +67,6 @@ obj-$(CONFIG_TEST_UBSAN) += test_ubsan.o
 CFLAGS_test_ubsan.o += $(call cc-disable-warning, vla)
 UBSAN_SANITIZE_test_ubsan.o := y
 obj-$(CONFIG_TEST_KSTRTOX) += test-kstrtox.o
-obj-$(CONFIG_TEST_LIST_SORT) += test_list_sort.o
 obj-$(CONFIG_TEST_MIN_HEAP) += test_min_heap.o
 obj-$(CONFIG_TEST_LKM) += test_module.o
 obj-$(CONFIG_TEST_VMALLOC) += test_vmalloc.o
@@ -341,5 +340,6 @@ obj-$(CONFIG_PLDMFW) += pldmfw/
 # KUnit tests
 obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
 obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
+obj-$(CONFIG_LIST_SORT_KUNIT_TEST) += list_sort_kunit.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
 obj-$(CONFIG_BITS_TEST) += test_bits.o
diff --git a/lib/test_list_sort.c b/lib/list_sort_kunit.c
similarity index 62%
rename from lib/test_list_sort.c
rename to lib/list_sort_kunit.c
index 1f017d3b610e..20cbacbb7d6c 100644
--- a/lib/test_list_sort.c
+++ b/lib/list_sort_kunit.c
@@ -1,13 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
-#define pr_fmt(fmt) "list_sort_test: " fmt
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/kernel.h>
 #include <linux/list_sort.h>
 #include <linux/list.h>
-#include <linux/module.h>
-#include <linux/printk.h>
-#include <linux/slab.h>
 #include <linux/random.h>
+#include <kunit/test.h>
 
 /*
  * The pattern of set bits in the list length determines which cases
@@ -29,28 +26,28 @@ struct debug_el {
 /* Array, containing pointers to all elements in the test list */
 static struct debug_el **elts __initdata;
 
-static int __init check(struct debug_el *ela, struct debug_el *elb)
+static int __init check(struct kunit *context, struct debug_el *ela, struct debug_el *elb)
 {
 	if (ela->serial >= TEST_LIST_LEN) {
-		pr_err("error: incorrect serial %d\n", ela->serial);
+		KUNIT_FAIL(context, "incorrect serial %d", ela->serial);
 		return -EINVAL;
 	}
 	if (elb->serial >= TEST_LIST_LEN) {
-		pr_err("error: incorrect serial %d\n", elb->serial);
+		KUNIT_FAIL(context, "incorrect serial %d", elb->serial);
 		return -EINVAL;
 	}
 	if (elts[ela->serial] != ela || elts[elb->serial] != elb) {
-		pr_err("error: phantom element\n");
+		KUNIT_FAIL(context, "phantom element");
 		return -EINVAL;
 	}
 	if (ela->poison1 != TEST_POISON1 || ela->poison2 != TEST_POISON2) {
-		pr_err("error: bad poison: %#x/%#x\n",
-			ela->poison1, ela->poison2);
+		KUNIT_FAIL(context, "bad poison: %#x/%#x",
+			   ela->poison1, ela->poison2);
 		return -EINVAL;
 	}
 	if (elb->poison1 != TEST_POISON1 || elb->poison2 != TEST_POISON2) {
-		pr_err("error: bad poison: %#x/%#x\n",
-			elb->poison1, elb->poison2);
+		KUNIT_FAIL(context, "bad poison: %#x/%#x",
+			   elb->poison1, elb->poison2);
 		return -EINVAL;
 	}
 	return 0;
@@ -63,27 +60,26 @@ static int __init cmp(void *priv, struct list_head *a, struct list_head *b)
 	ela = container_of(a, struct debug_el, list);
 	elb = container_of(b, struct debug_el, list);
 
-	check(ela, elb);
+	check(priv, ela, elb);
 	return ela->value - elb->value;
 }
 
-static int __init list_sort_test(void)
+static void __init test_list_sort(struct kunit *context)
 {
-	int i, count = 1, err = -ENOMEM;
+	int i, count = 1;
 	struct debug_el *el;
 	struct list_head *cur;
 	LIST_HEAD(head);
 
-	pr_debug("start testing list_sort()\n");
-
 	elts = kcalloc(TEST_LIST_LEN, sizeof(*elts), GFP_KERNEL);
-	if (!elts)
-		return err;
+	KUNIT_ASSERT_FALSE_MSG(context, elts == NULL, "kcalloc failed");
 
 	for (i = 0; i < TEST_LIST_LEN; i++) {
 		el = kmalloc(sizeof(*el), GFP_KERNEL);
-		if (!el)
+		if (!el) {
+			KUNIT_FAIL(context, "kmalloc failed");
 			goto exit;
+		}
 
 		 /* force some equivalencies */
 		el->value = prandom_u32() % (TEST_LIST_LEN / 3);
@@ -94,55 +90,62 @@ static int __init list_sort_test(void)
 		list_add_tail(&el->list, &head);
 	}
 
-	list_sort(NULL, &head, cmp);
+	list_sort(context, &head, cmp);
 
-	err = -EINVAL;
 	for (cur = head.next; cur->next != &head; cur = cur->next) {
 		struct debug_el *el1;
 		int cmp_result;
 
 		if (cur->next->prev != cur) {
-			pr_err("error: list is corrupted\n");
+			KUNIT_FAIL(context, "list is corrupted");
 			goto exit;
 		}
 
-		cmp_result = cmp(NULL, cur, cur->next);
+		cmp_result = cmp(context, cur, cur->next);
 		if (cmp_result > 0) {
-			pr_err("error: list is not sorted\n");
+			KUNIT_FAIL(context, "list is not sorted");
 			goto exit;
 		}
 
 		el = container_of(cur, struct debug_el, list);
 		el1 = container_of(cur->next, struct debug_el, list);
 		if (cmp_result == 0 && el->serial >= el1->serial) {
-			pr_err("error: order of equivalent elements not "
-				"preserved\n");
+			KUNIT_FAIL(context, "order of equivalent elements not preserved");
 			goto exit;
 		}
 
-		if (check(el, el1)) {
-			pr_err("error: element check failed\n");
+		if (check(context, el, el1)) {
 			goto exit;
 		}
 		count++;
 	}
 	if (head.prev != cur) {
-		pr_err("error: list is corrupted\n");
+		KUNIT_FAIL(context, "list is corrupted");
 		goto exit;
 	}
 
 
 	if (count != TEST_LIST_LEN) {
-		pr_err("error: bad list length %d", count);
+		KUNIT_FAIL(context, "bad list length %d", count);
 		goto exit;
 	}
 
-	err = 0;
 exit:
 	for (i = 0; i < TEST_LIST_LEN; i++)
 		kfree(elts[i]);
 	kfree(elts);
-	return err;
 }
-module_init(list_sort_test);
+
+static struct kunit_case __refdata list_sort_test_cases[] = {
+	KUNIT_CASE(test_list_sort),
+	{}
+};
+
+static struct kunit_suite list_sort_test_suite = {
+	.name = "list-sort",
+	.test_cases = list_sort_test_cases,
+};
+
+kunit_test_suites(&list_sort_test_suite);
+
 MODULE_LICENSE("GPL");

base-commit: d2585f5164c298aaaed14c2c8d313cbe7bd5b253
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
