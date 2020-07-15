Return-Path: <SRS0=zsCJ=A2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0980C433EB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 03:11:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4DB020729
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 03:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="ovEc7xb3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4DB020729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 864C7204DB;
	Wed, 15 Jul 2020 03:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cy9kmIwHS1NO; Wed, 15 Jul 2020 03:11:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0CD05204C6;
	Wed, 15 Jul 2020 03:11:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0483AC0891;
	Wed, 15 Jul 2020 03:11:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85C24C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 03:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7DDFF204DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 03:11:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjOcro-Dghz7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 03:11:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 9F2BF204C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 03:11:32 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id w34so645327qte.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 20:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f7B6nRu17D4hLq2dpnNEqUTozGMt7UQuNjvdNS+jJbU=;
 b=ovEc7xb3UBenViTIJEoNSptb30ZAYlKnZjOp5qED9m/e22xilVePTic9UoGc55lE+k
 kC75wEyvi6w6pCgu/7TfFf2BIdHVuuDsGmXyvFz9fC9+5JtIQq6aV36WN4hGo1nutneB
 M9rFUvpemCWKnKmOs+654u/Kc2/LoSZ57OddYNwJjsIETuOai/i7G3NkkMeJE/rbRzPU
 Di41NNl8yWr84/KYvGxbzQBO6utP/n7V+ikzI1FL7c53G3cMP+Fm5EdHaegqgxy3pHV7
 YufZu+DIVy9Iw2ZFfMyfHo4iluz1F1H7RTgQ9JcEdL/Hm8aLPhaCSGysnx1gQVJolQ/C
 EtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f7B6nRu17D4hLq2dpnNEqUTozGMt7UQuNjvdNS+jJbU=;
 b=WBfzEe3uEwaG23U9dNmCKl2sZCX8nUI1eSjI2HTO//wpZF10oMbpY7h9WVyzXIhy2X
 bz/2n1vR/oZJqQa+R2CKrN5tR01A/BugFry0Sf08Bd7fXrW9jrti08fSGpSz4+jYaYWc
 Cw+1pi24cHTwJlnYYG5KXpEuwgPpoJUCyytcUu86/3MZSlGsDUBziwJh5Wsn6DM56dnJ
 2W4YnqkwdiQ8odRmHpP1fe6b3xetarIFzJ3UxhvOqeBsQbBemdE5dxhqzeh2kxivgzVI
 UZt1c8DgOv9xg9DQpkS7MSrfORhH/yMD6XJ50KaaIptTHAu8gpk08/cb83bpT8I0VRXb
 52RA==
X-Gm-Message-State: AOAM530NcjtHRURP9IkV61SUgRMzgwJjfdLpYXbhK1qYEIK8l+4kZ0t3
 fMSIKPsQmyEjJkQc+wr3pj7v0Q==
X-Google-Smtp-Source: ABdhPJxA8gzAAxGa3RZYJ9BLUMX1vyYZ+/mghOsWxHg2iON1/daKdrj6Rb3bTwDGFcNnKyMHc6PpYw==
X-Received: by 2002:aed:20e5:: with SMTP id 92mr8045746qtb.388.1594782691550; 
 Tue, 14 Jul 2020 20:11:31 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id x29sm1269229qtx.74.2020.07.14.20.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 20:11:31 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Wed, 15 Jul 2020 00:11:19 -0300
Message-Id: <20200715031120.1002016-3-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200715031120.1002016-1-vitor@massaru.org>
References: <20200715031120.1002016-1-vitor@massaru.org>
MIME-Version: 1.0
Cc: linux-kselftest@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, davidgow@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, keescook@chromium.org
Subject: [Linux-kernel-mentees] [RFC 2/3] lib: Allows to borrow mm in
	userspace on KUnit
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

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 include/kunit/test.h  |  1 +
 lib/kunit/try-catch.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 59f3144f009a..49c38bdcb93e 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -222,6 +222,7 @@ struct kunit {
 	 * protect it with some type of lock.
 	 */
 	struct list_head resources; /* Protected by lock. */
+	struct mm_struct *mm;
 };
 
 void kunit_init_test(struct kunit *test, const char *name, char *log);
diff --git a/lib/kunit/try-catch.c b/lib/kunit/try-catch.c
index 0dd434e40487..f677c2f2a51a 100644
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
+	if (test->mm != NULL)
+		kthread_use_mm(try_catch->test->mm);
 
 	try_catch->try(try_catch->context);
+	if (try_catch->test->mm) {
+		if (test->mm != NULL)
+			kthread_unuse_mm(try_catch->test->mm);
+		try_catch->test->mm = NULL;
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
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
