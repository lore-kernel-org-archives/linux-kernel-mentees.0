Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5183C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 14:54:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 614282080C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 14:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDMCrxd/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 614282080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DFFD787672;
	Sat, 10 Oct 2020 14:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hzcMYWNIUUIl; Sat, 10 Oct 2020 14:54:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F39C86D94;
	Sat, 10 Oct 2020 14:54:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BDACC07FF;
	Sat, 10 Oct 2020 14:54:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 146BBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 14:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F320086F04
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 14:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHYo8ryq60Vv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 14:54:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5A5C386EDC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 14:54:45 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id y14so9789894pgf.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 07:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/krkgGWRLPwrBOotoEiPAuKzZC5AWMQrtjDnDpAK2FI=;
 b=pDMCrxd/zMBAJCqjki45oqVCT+zX55BDa9Ycymnp0lMpeZBUVnoSz8ksHcktrZKRq7
 lcOeufePSzUUMeU3fzBGlYBph5pcUaZQqt87oykxn6idISuIc7fhlRTpWA+RU5alacTr
 4iegTO4ybojBhElULXjQToX8+ifPswiUXZ+drmKsH0JC6K16Ovy8cc+/Vyh+Lt9D+pr6
 AsQ0CFbyOm1uvljB+Ej8t+Dufxz3p+heCtLN4ENRcAh3rtwWPkSWV8MalbKb96YHx6Qz
 Ygf3wFXOniHOUUoBDezcXXWwH+8Ot4HyVlxYYjg+UrVlZ2zYq0WM+MeLZFY3rgRr71Zi
 i7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/krkgGWRLPwrBOotoEiPAuKzZC5AWMQrtjDnDpAK2FI=;
 b=jeSLcFogiqh+3vYT9qLaSGI+2uoHi4nSGrBz7mnr5/ngSKaW0mKrYFBxiBC77SpbAx
 8xEwtUvvedo6vanKnr07kfUUxOnLxTMhVG2rPfDmaXaos+5qIF4leRw3H9JkmBrXsB/6
 1tAPrVU5ca2/FJ6fPwdifJlyzn9E9PkvRaqQeLQ2uO59rk6L5Y7RMWFyv1lR/UkxQxiv
 Rv4so5hUJCXdzt3LT485kpdvY//3UTIi9oz5fOQv8qWOhk/7tupiq3uV5ooi54VsczCv
 DfZRqx8Ge8oFDsZhacModfjznQh9Y1jGPhBtl++59kNvz9NeNB/syTJVbfKIUobwxOkG
 fKqg==
X-Gm-Message-State: AOAM5307Pte4r8ZW0Dzy7IoEYS8bDuBrSaRyjVZkyz7pFiFfir+AAJYa
 ziGaMZ3VVI8O0nfB3fFMQtA=
X-Google-Smtp-Source: ABdhPJwkQW2le5RVdC4V9Sn8fTVfqQ39bAof6kT8+Bi38tuJ+vH393jZam3QMTBaK9swjMMH5rg9Zw==
X-Received: by 2002:a63:3193:: with SMTP id x141mr7266188pgx.254.1602341684887; 
 Sat, 10 Oct 2020 07:54:44 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([106.51.240.187])
 by smtp.gmail.com with ESMTPSA id gg24sm15772806pjb.44.2020.10.10.07.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 07:54:44 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, skhan@linuxfoundation.org, yzaikin@google.com,
 elver@google.com, tytso@mit.edu, adilger.kernel@dilger.ca
Date: Sat, 10 Oct 2020 20:23:57 +0530
Message-Id: <20201010145357.60886-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [PATCH 1/2] kunit: Support for Parameterized
	Testing
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

Implementation of support for parameterized testing in KUnit.

Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
---
 include/kunit/test.h | 29 +++++++++++++++++++++++++++++
 lib/kunit/test.c     | 44 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 59f3144f009a..4740d66269b4 100644
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
 
+#define KUNIT_CASE_PARAM(test_name, getparams, count, size)				\
+		{ .run_case = test_name, .name = #test_name,				\
+		  .parameterized = true, .get_params = (void* (*)(void))getparams,	\
+		  .max_parameters_count = count, .parameter_size = size }
+
 /**
  * struct kunit_suite - describes a related collection of &struct kunit_case
  *
@@ -206,6 +215,23 @@ struct kunit {
 	/* private: internal use only. */
 	const char *name; /* Read only after initialization! */
 	char *log; /* Points at case log after initialization */
+	bool parameterized; /* True for parameterized tests */
+	/* param_values stores the test parameters
+	 * for parameterized tests.
+	 */
+	void *param_values;
+	/* max_parameters_count indicates maximum number of
+	 * parameters for parameterized tests.
+	 */
+	int max_parameters_count;
+	/* iterator_count is used by the iterator method
+	 * for parameterized tests.
+	 */
+	int iterator_count;
+	/* parameter_size indicates size of a single test case
+	 * for parameterized tests.
+	 */
+	int parameter_size;
 	struct kunit_try_catch try_catch;
 	/*
 	 * success starts as true, and may only be set to false during a
@@ -225,6 +251,7 @@ struct kunit {
 };
 
 void kunit_init_test(struct kunit *test, const char *name, char *log);
+void kunit_init_param_test(struct kunit *test, struct kunit_case *test_case);
 
 int kunit_run_tests(struct kunit_suite *suite);
 
@@ -237,6 +264,8 @@ int __kunit_test_suites_init(struct kunit_suite **suites);
 
 void __kunit_test_suites_exit(struct kunit_suite **suites);
 
+void *get_test_case_parameters(struct kunit *test);
+
 /**
  * kunit_test_suites() - used to register one or more &struct kunit_suite
  *			 with KUnit.
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index c36037200310..ab9e13c81d4a 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -142,6 +142,11 @@ unsigned int kunit_test_case_num(struct kunit_suite *suite,
 }
 EXPORT_SYMBOL_GPL(kunit_test_case_num);
 
+static void kunit_print_failed_param(struct kunit *test)
+{
+	kunit_err(test, "\n\tTest failed at parameter: %d\n", test->iterator_count);
+}
+
 static void kunit_print_string_stream(struct kunit *test,
 				      struct string_stream *stream)
 {
@@ -182,6 +187,9 @@ static void kunit_fail(struct kunit *test, struct kunit_assert *assert)
 
 	assert->format(assert, stream);
 
+	if (test->parameterized)
+		kunit_print_failed_param(test);
+
 	kunit_print_string_stream(test, stream);
 
 	WARN_ON(string_stream_destroy(stream));
@@ -236,6 +244,18 @@ void kunit_init_test(struct kunit *test, const char *name, char *log)
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
@@ -254,7 +274,14 @@ static void kunit_run_case_internal(struct kunit *test,
 		}
 	}
 
-	test_case->run_case(test);
+	if (!test->parameterized) {
+		test_case->run_case(test);
+	} else {
+		int i;
+
+		for (i = 0; i < test->max_parameters_count; i++)
+			test_case->run_case(test);
+	}
 }
 
 static void kunit_case_internal_cleanup(struct kunit *test)
@@ -343,6 +370,8 @@ static void kunit_run_case_catch_errors(struct kunit_suite *suite,
 	struct kunit test;
 
 	kunit_init_test(&test, test_case->name, test_case->log);
+	if (test_case->parameterized)
+		kunit_init_param_test(&test, test_case);
 	try_catch = &test.try_catch;
 
 	kunit_try_catch_init(try_catch,
@@ -407,6 +436,19 @@ void __kunit_test_suites_exit(struct kunit_suite **suites)
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
