Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED00C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 17:40:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 479E720792
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 17:40:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="byMaJXbe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 479E720792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2641B88660;
	Tue, 21 Jul 2020 17:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qtaBG8HdbqLL; Tue, 21 Jul 2020 17:40:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 915C3884B5;
	Tue, 21 Jul 2020 17:40:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77E20C088E;
	Tue, 21 Jul 2020 17:40:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 188F0C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 17:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 110ED86AAA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 17:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nihfxDf4eGJK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 17:40:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 27BF886AA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 17:40:42 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id z15so13419481qki.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 10:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ziXNDrsTUf/jO1e0o+ATLIms8b87+wdcIPJLc5MdA5I=;
 b=byMaJXbew5T06Kk8bGXuwpnPtmHxBPAZo3GtrojHEEEajDRLMyzlzyOKZPuE5jASUi
 CIZBmDtNOcoe6gTMoeNQmsJHcqjomo34rdGvJL+0UJr1A553/zgbVa5MHw9rpZVfK2Rp
 CTCJyeTZ9S0VRsOmWA3rvpCM6l8KAsbEorM1lBf2idN+LOHB7jlDsWWRwoVzUxGgNsCU
 cAMHrMrJIpEXwyImY/8ac1vfQxrfQ+utj1/tCkBrHNdvWnq94qXe/s0ONuZhZ+SYQpZP
 51GQWHWJZGtJ1RK3xS39BcOh1xjLYIm8sOl/Jz+6x/yH8PJ5mothCrEZzXa3t61GMiPS
 jdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ziXNDrsTUf/jO1e0o+ATLIms8b87+wdcIPJLc5MdA5I=;
 b=WaSFrg1HE96rDnkxtQqUoIoSvKA02WM8RFqSUKeBlTTphyo2nm9qRTWAp/KMHzRNwD
 Et0tz1nQnPZdzZgdFwclmvfY2Y3fcrlz9+nRT9N11I3iA80Q66RBsguo+hjgdSUUQ1CE
 AKOn6UV0O6Wkbe1BXNsPFtaHlCyWpyghVmapdp1KdQjidiw48WASJlV06RDUntRnFt1t
 rsrvYpqkmZDVzuK4TA6ZwThLk3+do8ksS/DdsMWSzr7prz7tec6s3ReRywmyhMt42LD5
 Gdav2ICrK1y0OPdeqfAsXpw0zgeuOU/a7AaToN9ouc/3dnZxecSFvgd+2Zl7CRKIbZvN
 5LCQ==
X-Gm-Message-State: AOAM531tK5kyo46qme+6Jsq6igTeVOj6EdwAO94BG+ulBlHxyK5DcZr+
 Csvs1OcIt5s6ed5r8/PfiCTAJQ==
X-Google-Smtp-Source: ABdhPJyEpCnDLIgKG+Qs1KVdSVn3ur/jfSm6Tjm8hv0giObFjbsZ4D3jJDKCisqzoCeGAUsB018GEg==
X-Received: by 2002:a05:620a:2282:: with SMTP id
 o2mr26833386qkh.402.1595353241126; 
 Tue, 21 Jul 2020 10:40:41 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id w11sm23282781qtk.35.2020.07.21.10.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 10:40:40 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Tue, 21 Jul 2020 14:40:36 -0300
Message-Id: <20200721174036.71072-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kselftest@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, davidgow@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, keescook@chromium.org
Subject: [Linux-kernel-mentees] [PATCH v3] lib: kunit: Provides a userspace
	memory context when tests are compiled as module
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

KUnit test cases run on kthreads, and kthreads don't have an
adddress space (current->mm is NULL), but processes have mm.

The purpose of this patch is to allow to borrow mm to KUnit kthread
after userspace is brought up, because we know that there are processes
running, at least the process that loaded the module to borrow mm.

This allows, for example, tests such as user_copy_kunit, which uses
vm_mmap, which needs current->mm.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
v2:
    * splitted patch in 3:
        - Allows to install and load modules in root filesystem;
        - Provides an userspace memory context when tests are compiled
          as module;
        - Convert test_user_copy to KUnit test;
    * added documentation;
    * added more explanation;
    * added a missed test pointer;
    * released mm with mmput();
v3:
    * rebased with last kunit branch
    * Please apply this commit from kunit-fixes:
        3f37d14b8a3152441f36b6bc74000996679f0998

 Documentation/dev-tools/kunit/usage.rst | 14 ++++++++++++++
 include/kunit/test.h                    | 12 ++++++++++++
 lib/kunit/try-catch.c                   | 15 ++++++++++++++-
 3 files changed, 40 insertions(+), 1 deletion(-)
---
diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 3c3fe8b5fecc..9f909157be34 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -448,6 +448,20 @@ We can now use it to test ``struct eeprom_buffer``:

 .. _kunit-on-non-uml:

+User-space context
+------------------
+
+I case you need a user-space context, for now this is only possible through
+tests compiled as a module. And it will be necessary to use a root filesystem
+and uml_utilities.
+
+Example:
+
+.. code-block:: bash
+
+   ./tools/testing/kunit/kunit.py run --timeout=60 --uml_rootfs_dir=.uml_rootfs
+
+
 KUnit on non-UML architectures
 ==============================

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 59f3144f009a..ae3337139c65 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -222,6 +222,18 @@ struct kunit {
 	 * protect it with some type of lock.
 	 */
 	struct list_head resources; /* Protected by lock. */
+	/*
+	 * KUnit test cases run on kthreads, and kthreads don't have an
+	 * adddress space (current->mm is NULL), but processes have mm.
+	 *
+	 * The purpose of this mm_struct is to allow to borrow mm to KUnit kthread
+	 * after userspace is brought up, because we know that there are processes
+	 * running, at least the process that loaded the module to borrow mm.
+	 *
+	 * This allows, for example, tests such as user_copy_kunit, which uses
+	 * vm_mmap, which needs current->mm.
+	 */
+	struct mm_struct *mm;
 };

 void kunit_init_test(struct kunit *test, const char *name, char *log);
diff --git a/lib/kunit/try-catch.c b/lib/kunit/try-catch.c
index 0dd434e40487..d03e2093985b 100644
--- a/lib/kunit/try-catch.c
+++ b/lib/kunit/try-catch.c
@@ -11,7 +11,8 @@
 #include <linux/completion.h>
 #include <linux/kernel.h>
 #include <linux/kthread.h>
-
+#include <linux/sched/mm.h>
+#include <linux/sched/task.h>
 #include "try-catch-impl.h"

 void __noreturn kunit_try_catch_throw(struct kunit_try_catch *try_catch)
@@ -24,8 +25,17 @@ EXPORT_SYMBOL_GPL(kunit_try_catch_throw);
 static int kunit_generic_run_threadfn_adapter(void *data)
 {
 	struct kunit_try_catch *try_catch = data;
+	struct kunit *test = try_catch->test;
+
+	if (test != NULL && test->mm != NULL)
+		kthread_use_mm(test->mm);

 	try_catch->try(try_catch->context);
+	if (test != NULL && test->mm != NULL) {
+		kthread_unuse_mm(test->mm);
+		mmput(test->mm);
+		test->mm = NULL;
+	}

 	complete_and_exit(try_catch->try_completion, 0);
 }
@@ -65,6 +75,9 @@ void kunit_try_catch_run(struct kunit_try_catch *try_catch, void *context)
 	try_catch->context = context;
 	try_catch->try_completion = &try_completion;
 	try_catch->try_result = 0;
+
+	test->mm = get_task_mm(current);
+
 	task_struct = kthread_run(kunit_generic_run_threadfn_adapter,
 				  try_catch,
 				  "kunit_try_catch_thread");

base-commit: d43c7fb05765152d4d4a39a8ef957c4ea14d8847
--
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
