Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9719CC41604
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 14:50:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F09B6206B8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 14:50:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVcSlSdn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F09B6206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AD9332026D;
	Sat,  3 Oct 2020 14:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Y9GbRlfoj8g; Sat,  3 Oct 2020 14:50:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4818E20115;
	Sat,  3 Oct 2020 14:50:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A1EEC016F;
	Sat,  3 Oct 2020 14:50:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AAE2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 90AE486A90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B9G+SymygrHz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:50:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D3DCE86A8F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:50:47 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id g9so2358699pgh.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 07:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uThi5mtiDBT2i7DU283pduGnjjzbRuLiGCPe/kRLOVg=;
 b=GVcSlSdnnCfJoNqvYlIy09aZ0TJJY7njhJvpFE4V6B7Bw/IqnTu1y9z+gMJjLeMxjX
 YepqlxY2/2ZbwT6X7XJLQJ8AzL7af3ATgDMr3Y34PV5IPJZZKt8U1nqWRHI512HLPVGW
 NHPVwBFTLJVhqp4NWuKI9+U26uUvEsC5ROJoOAkPjxK2dXUyJPLa2ZtF3XGkVHjmUkGk
 DEjARQp3RVHIF1ULdZ7NyVlJLd8l2Gt/ab0tjjw4Pvu0clICFKrcqCYrEza72rWcYspS
 VAiZ2IJunEzxntbz8k7wQddNwKglZFPoScIRofA8PzOJiD3Hu97leLUbjf2z03PitSy2
 qrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uThi5mtiDBT2i7DU283pduGnjjzbRuLiGCPe/kRLOVg=;
 b=kXaPspkfqDT9Ees1A1uzfbPArFAB1FZGEvpb6bLiOJUFc3WuFciguS7ziUuHvirmkW
 rVXpQbcfIipNd7vda1VpdgpCwcoinS/XXL9fYEhhwotVR/x8cipT94azBXwPtedwWIhc
 ayXTEHpBh2XGIDDj7h39ncKolEGT12cgFxyqHxi3LlDf3YZ5FMOCAnpSWxMtll/HV7aV
 eqJGBi4dHjCWXtEObJfB2QAFphN5cqs9BE2ugHIut8g6E9rmqzJU9x2E0KsuSbITWVKW
 Bvc1XAWYf1o2J4DNvdshNhOqM2iNeeY+iLw+xwGngypfwyRQyp0Hs93/hB/LXK+8Yqqv
 rymw==
X-Gm-Message-State: AOAM53035aGHXXmEdkGHjeB/Bm4t89PomF4FLaMl+/oVu9w6jMs6Z0uX
 zWTlWOSVSMOtd+O9nZBMOPQ=
X-Google-Smtp-Source: ABdhPJzWc6pzhdEtN1BzxHp5yMQmhGWNtmPPQrZtV1k0Hd/rSwT6Ay8ASpiE61RLQ17ktmpveTsKUw==
X-Received: by 2002:a63:fc63:: with SMTP id r35mr6733054pgk.156.1601736647356; 
 Sat, 03 Oct 2020 07:50:47 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([106.51.240.187])
 by smtp.gmail.com with ESMTPSA id b1sm3180152pft.127.2020.10.03.07.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 07:50:46 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 skhan@linuxfoundation.org
Date: Sat,  3 Oct 2020 20:18:07 +0530
Message-Id: <20201003144807.13036-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [RFC v3 1/2] kunit: Support for
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

Implementation of support for parameterized testing in KUnit.

Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
---
Changes v2->v3:
- Support for test to run iterating through all parameters added
  within the KUnit framework
- The index of the parameter causing test failure is displayed

Changes v1->v2:
- Parameterized input stored in a void* array
- An iterator method to access the different parameters

 include/kunit/test.h | 29 +++++++++++++++++++++++++++++
 lib/kunit/test.c     | 44 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 59f3144f009a..8e9325b29058 100644
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
index c36037200310..ae012e65368e 100644
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
+	if (!test->parameterized)
+		test_case->run_case(test);
+	else {
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
