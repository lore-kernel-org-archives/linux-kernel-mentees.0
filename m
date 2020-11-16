Return-Path: <SRS0=dWhK=EW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEB7C63697
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 05:41:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC716206B7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 05:41:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sX3yV72b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC716206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4E0692042D;
	Mon, 16 Nov 2020 05:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YEpTKfg8l-Vy; Mon, 16 Nov 2020 05:41:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BF2C5203E4;
	Mon, 16 Nov 2020 05:41:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A04D5C0800;
	Mon, 16 Nov 2020 05:41:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE434C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 05:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 920F286632
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 05:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kuE6bpBpH4Bo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 05:41:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8BCC086578
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 05:41:34 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id f38so12262704pgm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 21:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=45ZC/xNALTHxmSGHxMUVYQF4aY5abhBg6nVx4tu1yvI=;
 b=sX3yV72bXDv9CTAlncb/ppSOXxoIcTgBzofe9Uiq0CzTwC9qQ20BZDR8PeKq/AivYU
 nuSmSScQUPOVAMZ1EzwEs4luHRbDfHv5UvsPLmClraQZ0FOQp7J/xlja2ivkToaW2W69
 sa09jMrqjrcA0vzAda8Fw2KS9MjWQwYcoXBxRxg4AtU8lGHCCdruseeoiR8cbXiF6x4f
 qJiyrgZkwepvs0sKJHImCCFga0zadwWRsWYhmkq06Hs49jXSDLE6GBOyTB9jsGYBpI6e
 PLas64nEl+TRsUIGxNsioxzuJ2XQ8PPP0ufEWxj2H5/rw1DMKTevl5EJrJWF47B5zujL
 hOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=45ZC/xNALTHxmSGHxMUVYQF4aY5abhBg6nVx4tu1yvI=;
 b=TqpBYU9vKcrynRGb7ohXH8ujw544RuhoveJxxzNQqF5CveUyKbRfCGfnxVuJJQXULI
 xMFXTYaoT/4giHMeK6ZH+flFfIARr7ComCiBmioMJ8ECFw2dnuma15XxrKJNENFrDXYE
 I2zNA8ffLND1xsQLQt8YkM8g344PHsAcknTeaVhV9wxbIggRR3mPrWNLWGJrWSAyKwAq
 i82GN4DfSyQUu4GUFQYsenRAD8HCfw9yiePqSxz+0rUfbfq2YlrKG4rsbuQWBMTFvTOr
 kgYxCUuLXuPqfTFGaF50dwsoPbJQ+BiVxeWkYZXpMmFxSR2vvK9oyddDyXcu09eSa8bq
 twkQ==
X-Gm-Message-State: AOAM531A692CnRc5qxrDhdoA4cwikF2j40KJk/jRHUIPglZkSEet1Q/k
 sHNhpD52T9WCMa9abAgAJDw=
X-Google-Smtp-Source: ABdhPJwAQPprVK9X9b7r1wbMQR+RVPRWxdmeOO9AZ7Zh0eDIsFUhJYqNHe3zhhqpus9TLew+S3Ff4Q==
X-Received: by 2002:a17:90b:3648:: with SMTP id
 nh8mr13440481pjb.27.1605505294068; 
 Sun, 15 Nov 2020 21:41:34 -0800 (PST)
Received: from arpitha-Inspiron-7570.lan ([106.51.140.48])
 by smtp.gmail.com with ESMTPSA id mv5sm16504106pjb.42.2020.11.15.21.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 21:41:33 -0800 (PST)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, skhan@linuxfoundation.org, elver@google.com,
 yzaikin@google.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 Tim.Bird@sony.com, davidgow@google.com
Date: Mon, 16 Nov 2020 11:10:35 +0530
Message-Id: <20201116054035.211498-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [PATCH v9 1/2] kunit: Support for
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

Implementation of support for parameterized testing in KUnit. This
approach requires the creation of a test case using the
KUNIT_CASE_PARAM() macro that accepts a generator function as input.

This generator function should return the next parameter given the
previous parameter in parameterized tests. It also provides a macro to
generate common-case generators based on arrays. Generators may also
optionally provide a human-readable description of parameters, which is
displayed where available.

Note, currently the result of each parameter run is displayed in
diagnostic lines, and only the overall test case output summarizes
TAP-compliant success or failure of all parameter runs. In future, when
supported by kunit-tool, these can be turned into subsubtest outputs.

Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
Co-developed-by: Marco Elver <elver@google.com>
Signed-off-by: Marco Elver <elver@google.com>
---
Changes v8->v9:
- No change to this patch of the patch series

Changes v7->v8:
- Increase KUNIT_PARAM_DESC_SIZE to 128
- Format pointer style appropriately 

Changes v6->v7:
- Clarify commit message.
- Introduce ability to optionally generate descriptions for parameters;
  if no description is provided, we'll still print 'param-N'.
- Change diagnostic line format to:
        # <test-case-name>: <ok|not ok> N - [<param description>]

Changes v5->v6:
- Fix alignment to maintain consistency

Changes v4->v5:
- Update kernel-doc comments.
- Use const void* for generator return and prev value types.
- Add kernel-doc comment for KUNIT_ARRAY_PARAM.
- Rework parameterized test case execution strategy: each parameter is executed
  as if it was its own test case, with its own test initialization and cleanup
  (init and exit are called, etc.). However, we cannot add new test cases per TAP
  protocol once we have already started execution. Instead, log the result of
  each parameter run as a diagnostic comment.

Changes v3->v4:
- Rename kunit variables
- Rename generator function helper macro
- Add documentation for generator approach
- Display test case name in case of failure along with param index

Changes v2->v3:
- Modifictaion of generator macro and method

Changes v1->v2:
- Use of a generator method to access test case parameters
Changes v6->v7:
- Clarify commit message.
- Introduce ability to optionally generate descriptions for parameters;
  if no description is provided, we'll still print 'param-N'.
- Change diagnostic line format to:
        # <test-case-name>: <ok|not ok> N - [<param description>]
- Before execution of parameterized test case, count number of
  parameters and display number of parameters. Currently also as a
  diagnostic line, but this may be used in future to generate a subsubtest
  plan. A requirement of this change is that generators must generate a
  deterministic number of parameters.

Changes v5->v6:
- Fix alignment to maintain consistency

Changes v4->v5:
- Update kernel-doc comments.
- Use const void* for generator return and prev value types.
- Add kernel-doc comment for KUNIT_ARRAY_PARAM.
- Rework parameterized test case execution strategy: each parameter is executed
  as if it was its own test case, with its own test initialization and cleanup
  (init and exit are called, etc.). However, we cannot add new test cases per TAP
  protocol once we have already started execution. Instead, log the result of
  each parameter run as a diagnostic comment.

Changes v3->v4:
- Rename kunit variables
- Rename generator function helper macro
- Add documentation for generator approach
- Display test case name in case of failure along with param index

Changes v2->v3:
- Modifictaion of generator macro and method

Changes v1->v2:
- Use of a generator method to access test case parameters

 include/kunit/test.h | 51 ++++++++++++++++++++++++++++++++++++++
 lib/kunit/test.c     | 59 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 97 insertions(+), 13 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index db1b0ae666c4..27b42a008c7a 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -94,6 +94,9 @@ struct kunit;
 /* Size of log associated with test. */
 #define KUNIT_LOG_SIZE	512
 
+/* Maximum size of parameter description string. */
+#define KUNIT_PARAM_DESC_SIZE 128
+
 /*
  * TAP specifies subtest stream indentation of 4 spaces, 8 spaces for a
  * sub-subtest.  See the "Subtests" section in
@@ -107,6 +110,7 @@ struct kunit;
  *
  * @run_case: the function representing the actual test case.
  * @name:     the name of the test case.
+ * @generate_params: the generator function for parameterized tests.
  *
  * A test case is a function with the signature,
  * ``void (*)(struct kunit *)``
@@ -141,6 +145,7 @@ struct kunit;
 struct kunit_case {
 	void (*run_case)(struct kunit *test);
 	const char *name;
+	const void* (*generate_params)(const void *prev, char *desc);
 
 	/* private: internal use only. */
 	bool success;
@@ -163,6 +168,27 @@ static inline char *kunit_status_to_string(bool status)
  */
 #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
 
+/**
+ * KUNIT_CASE_PARAM - A helper for creation a parameterized &struct kunit_case
+ *
+ * @test_name: a reference to a test case function.
+ * @gen_params: a reference to a parameter generator function.
+ *
+ * The generator function::
+ *
+ *	const void* gen_params(const void *prev, char *desc)
+ *
+ * is used to lazily generate a series of arbitrarily typed values that fit into
+ * a void*. The argument @prev is the previously returned value, which should be
+ * used to derive the next value; @prev is set to NULL on the initial generator
+ * call. When no more values are available, the generator must return NULL.
+ * Optionally write a string into @desc (size of KUNIT_PARAM_DESC_SIZE)
+ * describing the parameter.
+ */
+#define KUNIT_CASE_PARAM(test_name, gen_params)			\
+		{ .run_case = test_name, .name = #test_name,	\
+		  .generate_params = gen_params }
+
 /**
  * struct kunit_suite - describes a related collection of &struct kunit_case
  *
@@ -208,6 +234,10 @@ struct kunit {
 	const char *name; /* Read only after initialization! */
 	char *log; /* Points at case log after initialization */
 	struct kunit_try_catch try_catch;
+	/* param_value is the current parameter value for a test case. */
+	const void *param_value;
+	/* param_index stores the index of the parameter in parameterized tests. */
+	int param_index;
 	/*
 	 * success starts as true, and may only be set to false during a
 	 * test case; thus, it is safe to update this across multiple
@@ -1742,4 +1772,25 @@ do {									       \
 						fmt,			       \
 						##__VA_ARGS__)
 
+/**
+ * KUNIT_ARRAY_PARAM() - Define test parameter generator from an array.
+ * @name:  prefix for the test parameter generator function.
+ * @array: array of test parameters.
+ * @get_desc: function to convert param to description; NULL to use default
+ *
+ * Define function @name_gen_params which uses @array to generate parameters.
+ */
+#define KUNIT_ARRAY_PARAM(name, array, get_desc)						\
+	static const void *name##_gen_params(const void *prev, char *desc)			\
+	{											\
+		typeof((array)[0]) *__next = prev ? ((typeof(__next)) prev) + 1 : (array);	\
+		if (__next - (array) < ARRAY_SIZE((array))) {					\
+			void (*__get_desc)(typeof(__next), char *) = get_desc;			\
+			if (__get_desc)								\
+				__get_desc(__next, desc);					\
+			return __next;								\
+		}										\
+		return NULL;									\
+	}
+
 #endif /* _KUNIT_TEST_H */
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 750704abe89a..ec9494e914ef 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -325,39 +325,72 @@ static void kunit_catch_run_case(void *data)
  * occur in a test case and reports them as failures.
  */
 static void kunit_run_case_catch_errors(struct kunit_suite *suite,
-					struct kunit_case *test_case)
+					struct kunit_case *test_case,
+					struct kunit *test)
 {
 	struct kunit_try_catch_context context;
 	struct kunit_try_catch *try_catch;
-	struct kunit test;
 
-	kunit_init_test(&test, test_case->name, test_case->log);
-	try_catch = &test.try_catch;
+	kunit_init_test(test, test_case->name, test_case->log);
+	try_catch = &test->try_catch;
 
 	kunit_try_catch_init(try_catch,
-			     &test,
+			     test,
 			     kunit_try_run_case,
 			     kunit_catch_run_case);
-	context.test = &test;
+	context.test = test;
 	context.suite = suite;
 	context.test_case = test_case;
 	kunit_try_catch_run(try_catch, &context);
 
-	test_case->success = test.success;
-
-	kunit_print_ok_not_ok(&test, true, test_case->success,
-			      kunit_test_case_num(suite, test_case),
-			      test_case->name);
+	test_case->success = test->success;
 }
 
 int kunit_run_tests(struct kunit_suite *suite)
 {
+	char param_desc[KUNIT_PARAM_DESC_SIZE];
 	struct kunit_case *test_case;
 
 	kunit_print_subtest_start(suite);
 
-	kunit_suite_for_each_test_case(suite, test_case)
-		kunit_run_case_catch_errors(suite, test_case);
+	kunit_suite_for_each_test_case(suite, test_case) {
+		struct kunit test = { .param_value = NULL, .param_index = 0 };
+		bool test_success = true;
+
+		if (test_case->generate_params) {
+			/* Get initial param. */
+			param_desc[0] = '\0';
+			test.param_value = test_case->generate_params(NULL, param_desc);
+		}
+
+		do {
+			kunit_run_case_catch_errors(suite, test_case, &test);
+			test_success &= test_case->success;
+
+			if (test_case->generate_params) {
+				if (param_desc[0] == '\0') {
+					snprintf(param_desc, sizeof(param_desc),
+						 "param-%d", test.param_index);
+				}
+
+				kunit_log(KERN_INFO, &test,
+					  KUNIT_SUBTEST_INDENT
+					  "# %s: %s %d - %s",
+					  test_case->name,
+					  kunit_status_to_string(test.success),
+					  test.param_index + 1, param_desc);
+
+				/* Get next param. */
+				param_desc[0] = '\0';
+				test.param_value = test_case->generate_params(test.param_value, param_desc);
+				test.param_index++;
+			}
+		} while (test.param_value);
+
+		kunit_print_ok_not_ok(&test, true, test_success,
+				      kunit_test_case_num(suite, test_case),
+				      test_case->name);
+	}
 
 	kunit_print_subtest_end(suite);
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
