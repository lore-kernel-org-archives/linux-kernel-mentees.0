Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223B1C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 14:42:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8411E206FC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 14:42:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTu+N+Bo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8411E206FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 40E05860FD;
	Wed, 30 Sep 2020 14:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOzxqIlnKyMm; Wed, 30 Sep 2020 14:42:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 16E1B85F10;
	Wed, 30 Sep 2020 14:42:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F167AC016F;
	Wed, 30 Sep 2020 14:42:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69E21C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 14:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 578AD84F12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 14:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 58pHt1L8kr8I
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 14:42:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 92FDA83AE3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 14:42:22 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id d19so1153997pld.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 07:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EY+CSFeCM6JX5/1p7j0/EOqjBkg/p6wmfaxiruvqZq0=;
 b=bTu+N+Bo3I+J0QATwke8o0iv+phPJt1tYuNlwJ1h9Cnvwba+YbmPgYjdHCHqyobmpG
 1QGAtMY8c6qsWEKgKobNVOExcU7HosrjzjdDCGWqbDXJ6imaFgzVFcmeSA8i6VjCkcgv
 0PM9we/VEb61B5guZSpKSe1DZPFo1iXutWmyfwlCr5oUe+oiyy8vryYuLXxHpm1C9EFU
 /9Jllp8THnqRqIpHGX6h5S34eMIjuwhjUMJkUPtg4Y9CeHl81gIn1ATF3aLnwahuV2Kc
 LO0Ml9l4hYy5RZBauwKvsGDjfeTaQyn2yo/LJNlElLv8YjqlNUDO5Wyscw/eLXqAshRJ
 +AEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EY+CSFeCM6JX5/1p7j0/EOqjBkg/p6wmfaxiruvqZq0=;
 b=Q//XILelAxxoJI8wZj2ZRyk2l58uGsbRUzq0Ih8odGXMOvi2ox6EH5KKr/lnBJVgAw
 t1XkizxHLl6qvWE6eblNeUXKfkRU+AiwIsTOoB21reDyQuHk7rMZBAMDbV4fimQ3Mjhx
 AdAehiHYvTcvHn9ejml0/M1n9TqfUonKImju2OuHIX7qjNPsOEVAIbKjCpOfVUo117or
 i8NX9AdweZxxDHjE16pg1mAbY9P35FAc2gX525s+FSLbI7JIDbZj04pWdWOYSR/15ccQ
 Au9ZGsrOlDfAA/gMwMScgfDFl8AJwl81plQXXOMDa2kthoUiAdeyX56ZVwxJw/ZPvhio
 CQmA==
X-Gm-Message-State: AOAM531ckOmR2uDiLJV9MFLSjTNJuTFneH8VtouPautOj5NCHuOLAtBh
 BNR3ABjrYfKzVGY7MdaETkI=
X-Google-Smtp-Source: ABdhPJyQwTmmdcn5Ms5UHFa1G7efb7LJlTkOaGFdryNBFOVJ8WKNuMCIbIJNRBEYQ5PUoTvXDdleNQ==
X-Received: by 2002:a17:90a:5609:: with SMTP id
 r9mr2884645pjf.217.1601476942073; 
 Wed, 30 Sep 2020 07:42:22 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([106.51.240.187])
 by smtp.gmail.com with ESMTPSA id z25sm2481523pgl.6.2020.09.30.07.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 07:42:20 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 skhan@linuxfoundation.org
Date: Wed, 30 Sep 2020 20:10:52 +0530
Message-Id: <20200930144052.62720-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [RFC v2 1/2] kunit: Support for
	Parameterized Testing
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

This patch has a basic implementation for adding support for
parameterized testing in KUnit. The macro KUNIT_CASE_PARAM takes
in a function pointer to a function that returns the test case
parameters, the number of test cases and the size of each test 
case parameter. The get_test_case_parameters() acts as an iterator
and returns one test case parameter each time it is called.


Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
---
Changes v1->v2:
- Parameterized input stored in a void* array
- An iterator method to access the different parameters

 include/kunit/test.h | 17 +++++++++++++++++
 lib/kunit/test.c     | 27 +++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 59f3144f009a..d037ba8c3002 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -140,10 +140,14 @@ struct kunit;
 struct kunit_case {
 	void (*run_case)(struct kunit *test);
 	const char *name;
+	void* (*get_params)(void);
+	int max_parameters_count;
+	int parameter_size;
 
 	/* private: internal use only. */
 	bool success;
 	char *log;
+	bool parameterized;
 };
 
 static inline char *kunit_status_to_string(bool status)
@@ -162,6 +166,11 @@ static inline char *kunit_status_to_string(bool status)
  */
 #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
 
+#define KUNIT_CASE_PARAM(test_name, getparams, count, size) {	.run_case = test_name,						\
+								.name = #test_name, .parameterized = true,			\
+								.get_params = (void* (*)(void))getparams,			\
+								.max_parameters_count = count, .parameter_size = size }
+
 /**
  * struct kunit_suite - describes a related collection of &struct kunit_case
  *
@@ -206,6 +215,11 @@ struct kunit {
 	/* private: internal use only. */
 	const char *name; /* Read only after initialization! */
 	char *log; /* Points at case log after initialization */
+	bool parameterized; /* True for parameterized tests */
+	void *param_values; /* Stores the test parameters for parameterized tests */
+	int max_parameters_count; /* Indicates maximum number of parameters for parameterized tests */
+	int iterator_count; /* Used by the iterator method for parameterized tests */
+	int parameter_size; /* Indicates size of a single test case for parameterized tests */
 	struct kunit_try_catch try_catch;
 	/*
 	 * success starts as true, and may only be set to false during a
@@ -225,6 +239,7 @@ struct kunit {
 };
 
 void kunit_init_test(struct kunit *test, const char *name, char *log);
+void kunit_init_param_test(struct kunit *test, struct kunit_case *test_case);
 
 int kunit_run_tests(struct kunit_suite *suite);
 
@@ -237,6 +252,8 @@ int __kunit_test_suites_init(struct kunit_suite **suites);
 
 void __kunit_test_suites_exit(struct kunit_suite **suites);
 
+void *get_test_case_parameters(struct kunit *test);
+
 /**
  * kunit_test_suites() - used to register one or more &struct kunit_suite
  *			 with KUnit.
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index c36037200310..c4fd8f729e96 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -236,6 +236,18 @@ void kunit_init_test(struct kunit *test, const char *name, char *log)
 }
 EXPORT_SYMBOL_GPL(kunit_init_test);
 
+void kunit_init_param_test(struct kunit *test, struct kunit_case *test_case)
+{
+	spin_lock_init(&test->lock);
+	INIT_LIST_HEAD(&test->resources);
+	test->parameterized = true;
+	test->param_values = (void *)(test_case->get_params());
+	test->max_parameters_count = test_case->max_parameters_count;
+	test->parameter_size = test_case->parameter_size;
+	test->iterator_count = 0;
+}
+EXPORT_SYMBOL_GPL(kunit_init_param_test);
+
 /*
  * Initializes and runs test case. Does not clean up or do post validations.
  */
@@ -343,6 +355,8 @@ static void kunit_run_case_catch_errors(struct kunit_suite *suite,
 	struct kunit test;
 
 	kunit_init_test(&test, test_case->name, test_case->log);
+	if (test_case->parameterized)
+		kunit_init_param_test(&test, test_case);
 	try_catch = &test.try_catch;
 
 	kunit_try_catch_init(try_catch,
@@ -407,6 +421,19 @@ void __kunit_test_suites_exit(struct kunit_suite **suites)
 }
 EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
 
+/*
+ * Iterator method for the parameterized test cases
+ */
+void *get_test_case_parameters(struct kunit *test)
+{
+	int index = test->iterator_count * test->parameter_size;
+
+	if (test->iterator_count != test->max_parameters_count)
+		test->iterator_count++;
+	return (test->param_values + index);
+}
+EXPORT_SYMBOL_GPL(get_test_case_parameters);
+
 /*
  * Used for static resources and when a kunit_resource * has been created by
  * kunit_alloc_resource().  When an init function is supplied, @data is passed
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
