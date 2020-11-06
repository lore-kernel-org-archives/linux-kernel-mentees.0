Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE744C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 12:34:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C59C2087E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 12:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="MgMS7wfJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C59C2087E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CA94686151;
	Fri,  6 Nov 2020 12:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V71-BO6CXkGy; Fri,  6 Nov 2020 12:34:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0D8A98651E;
	Fri,  6 Nov 2020 12:34:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED17BC0893;
	Fri,  6 Nov 2020 12:34:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 191DFC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 12:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0560D85FC9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 12:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-dVHf801nGl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 12:34:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 768728502C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 12:34:41 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p1so1139248wrf.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Nov 2020 04:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=+0cyqcYUK2+B0qvk4HkncjgpI84qU878Jr3sHumUnC4=;
 b=MgMS7wfJPGYPDw9dED96W8wqjWKiOetL+Ja3hrUqjgo+c7aqOa7Qxe1lh8LWjA0qHi
 XRV3y4DYihndlFiaHsKYJEwiFcoMP1p2diofhARszuB/RxQqczRQRPYgBe9Y6yad3QKz
 ZRpAT5Bs/03ESFi7m69/Hz1dZpG661BUAa03D/XbCQVkd0QJEHgYsvxALrAxjlbJXsc6
 lFFxfo0iBVnJiFT/jkKoLv2NV1OhUURVB/0Pqpd1VCqnu+didTPDJfhIE0vP0cGc7Ksq
 zYrdT3dCz3KQeuEVszwy7u9VUO7iI+jfwsZfmsR2g50SM9VCHVq+QtTsToKlrggPaQaR
 VdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+0cyqcYUK2+B0qvk4HkncjgpI84qU878Jr3sHumUnC4=;
 b=bOPoiX+Cah3a/FwA+4jKLbaUv3bSuQs8HAO7LqEBKieQ8L6D3iIgfWTHY6hh7r3wcH
 J/adUQ6NjDkZBMXPlhwhWGLoziL/juLJ1pDHN741Ss9GiKNhaOJO0ZCBl3iKEAQ0AHSY
 gtCE4WrlKHUllN6EEnlkn8Irto4DOMK1QMuJ+gi4ZGijXCDAG/lho7tfPy6tl5Xq013y
 VBzor2fDLWdO2EDSFRVlS981zqvlttdMAmTYsqbaawrkyCEjuMn0IEyzeZ+6jrV8urtk
 QkNlBtOMED9sga7fAYUJgri895LQY85GDpAwTIisV0nG/ZObW5N2nz2R7JHpaYacdbyl
 3hKg==
X-Gm-Message-State: AOAM530FaEFvcu6KcIux286GQAnJoW2h7/aVzlHmgb4d90teTnfflYjA
 fdlpN0dT4vClEUtTzQRBieqp1A==
X-Google-Smtp-Source: ABdhPJx8pkKBByQHbPkV82psAfrDcCb9hyfQDBpKOYF74GUY2JB8yDA3oiAW2mfwTBALTKHbV9bnsA==
X-Received: by 2002:adf:a343:: with SMTP id d3mr2447934wrb.91.1604666079621;
 Fri, 06 Nov 2020 04:34:39 -0800 (PST)
Received: from elver.google.com ([100.105.32.75])
 by smtp.gmail.com with ESMTPSA id z14sm2170887wmc.15.2020.11.06.04.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 04:34:38 -0800 (PST)
Date: Fri, 6 Nov 2020 13:34:33 +0100
To: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <20201106123433.GA3563235@elver.google.com>
References: <20201027174630.85213-1-98.arpi@gmail.com>
 <CANpmjNOpbXHs4gs9Ro-u7hyN_zZ7s3AqDcdDy1Nqxq4ckThugA@mail.gmail.com>
 <73c4e46c-10f1-9362-b4fb-94ea9d74e9b2@gmail.com>
 <CANpmjNPxqQM0_f14ZwV3rHZzwhCtqx2fbOhHmXmiJawou6=z6Q@mail.gmail.com>
 <77d6dc66-1086-a9ae-ccbc-bb062ff81437@gmail.com>
 <CANpmjNORLJ4b_uwBB8v2h5cxoZF2SMTaz5K6QP37PxdUJDZUDA@mail.gmail.com>
 <20201105195503.GA2399621@elver.google.com>
 <f7e04221-607c-dd05-24a6-27c26d86919d@gmail.com>
 <CANpmjNMH9v3RE9xCh9nS=ZmBboxAsMvhfgby+QEO=Q3-oEyiNA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANpmjNMH9v3RE9xCh9nS=ZmBboxAsMvhfgby+QEO=Q3-oEyiNA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v4 1/2] kunit: Support for
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
From: Marco Elver via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Nov 06, 2020 at 09:11AM +0100, Marco Elver wrote:
> On Fri, 6 Nov 2020 at 06:54, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
[...]
> > I think this format of output should be fine for parameterized tests.
> > But, this patch has the same issue as earlier. While, the tests run and
> > this is the output that can be seen using dmesg, it still causes an issue on
> > using the kunit tool. It gives a similar error:
> >
> > [11:07:38] [ERROR]  expected 7 test suites, but got -1
> > [11:07:38] [ERROR] expected_suite_index -1, but got 2
> > [11:07:38] [ERROR] got unexpected test suite: kunit-try-catch-test
> > [ERROR] no tests run!
> > [11:07:38] ============================================================
> > [11:07:38] Testing complete. 0 tests run. 0 failed. 0 crashed.
> >
> 
> I'd suggest testing without these patches and diffing the output.
> AFAIK we're not adding any new non-# output, so it might be a
> pre-existing bug in some parsing code. Either that, or the parsing
> code does not respect the # correctly?

Hmm, tools/testing/kunit/kunit_parser.py has

	SUBTEST_DIAGNOSTIC = re.compile(r'^[\s]+# .*?: (.*)$')

, which seems to expect a ': ' in there. Not sure if this is required by
TAP, but let's leave this alone for now.

We can change the output to not trip this up, which might also be more a
consistent diagnostic format vs. other diagnostics. See the revised
patch below. With it the output is as follows:

| TAP version 14
| 1..6
|     # Subtest: ext4_inode_test
|     1..1
|     # inode_test_xtimestamp_decoding: param-0 ok
|     # inode_test_xtimestamp_decoding: param-1 ok
|     # inode_test_xtimestamp_decoding: param-2 ok
|     # inode_test_xtimestamp_decoding: param-3 ok
|     # inode_test_xtimestamp_decoding: param-4 ok
|     # inode_test_xtimestamp_decoding: param-5 ok
|     # inode_test_xtimestamp_decoding: param-6 ok
|     # inode_test_xtimestamp_decoding: param-7 ok
|     # inode_test_xtimestamp_decoding: param-8 ok
|     # inode_test_xtimestamp_decoding: param-9 ok
|     # inode_test_xtimestamp_decoding: param-10 ok
|     # inode_test_xtimestamp_decoding: param-11 ok
|     # inode_test_xtimestamp_decoding: param-12 ok
|     # inode_test_xtimestamp_decoding: param-13 ok
|     # inode_test_xtimestamp_decoding: param-14 ok
|     # inode_test_xtimestamp_decoding: param-15 ok
|     ok 1 - inode_test_xtimestamp_decoding
| ok 1 - ext4_inode_test

And kunit-tool seems to be happy as well.

Thanks,
-- Marco

------ >8 ------

From 13a94d75d6b1b430e89fcff2cd76629b56b9d636 Mon Sep 17 00:00:00 2001
From: Arpitha Raghunandan <98.arpi@gmail.com>
Date: Tue, 27 Oct 2020 23:16:30 +0530
Subject: [PATCH] kunit: Support for Parameterized Testing

Implementation of support for parameterized testing in KUnit.
This approach requires the creation of a test case using the
KUNIT_CASE_PARAM macro that accepts a generator function as input.
This generator function should return the next parameter given the
previous parameter in parameterized tests. It also provides
a macro to generate common-case generators.

Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
Co-developed-by: Marco Elver <elver@google.com>
Signed-off-by: Marco Elver <elver@google.com>
---
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
---
 include/kunit/test.h | 36 ++++++++++++++++++++++++++++++++++
 lib/kunit/test.c     | 46 +++++++++++++++++++++++++++++++-------------
 2 files changed, 69 insertions(+), 13 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 9197da792336..ae5488a37e48 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -107,6 +107,7 @@ struct kunit;
  *
  * @run_case: the function representing the actual test case.
  * @name:     the name of the test case.
+ * @generate_params: the generator function for parameterized tests.
  *
  * A test case is a function with the signature,
  * ``void (*)(struct kunit *)``
@@ -141,6 +142,7 @@ struct kunit;
 struct kunit_case {
 	void (*run_case)(struct kunit *test);
 	const char *name;
+	const void* (*generate_params)(const void *prev);
 
 	/* private: internal use only. */
 	bool success;
@@ -163,6 +165,22 @@ static inline char *kunit_status_to_string(bool status)
  */
 #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
 
+/**
+ * KUNIT_CASE_PARAM - A helper for creation a parameterized &struct kunit_case
+ *
+ * @test_name: a reference to a test case function.
+ * @gen_params: a reference to a parameter generator function.
+ *
+ * The generator function ``const void* gen_params(const void *prev)`` is used
+ * to lazily generate a series of arbitrarily typed values that fit into a
+ * void*. The argument @prev is the previously returned value, which should be
+ * used to derive the next value; @prev is set to NULL on the initial generator
+ * call.  When no more values are available, the generator must return NULL.
+ */
+#define KUNIT_CASE_PARAM(test_name, gen_params)			\
+		{ .run_case = test_name, .name = #test_name,	\
+		  .generate_params = gen_params }
+
 /**
  * struct kunit_suite - describes a related collection of &struct kunit_case
  *
@@ -208,6 +226,10 @@ struct kunit {
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
@@ -1742,4 +1764,18 @@ do {									       \
 						fmt,			       \
 						##__VA_ARGS__)
 
+/**
+ * KUNIT_ARRAY_PARAM() - Define test parameter generator from an array.
+ * @name:  prefix for the test parameter generator function.
+ * @array: array of test parameters.
+ *
+ * Define function @name_gen_params which uses @array to generate parameters.
+ */
+#define KUNIT_ARRAY_PARAM(name, array)								\
+	static const void *name##_gen_params(const void *prev)					\
+	{											\
+		typeof((array)[0]) * __next = prev ? ((typeof(__next)) prev) + 1 : (array);	\
+		return __next - (array) < ARRAY_SIZE((array)) ? __next : NULL;			\
+	}
+
 #endif /* _KUNIT_TEST_H */
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 750704abe89a..329fee9e0634 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -325,29 +325,25 @@ static void kunit_catch_run_case(void *data)
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
@@ -356,8 +352,32 @@ int kunit_run_tests(struct kunit_suite *suite)
 
 	kunit_print_subtest_start(suite);
 
-	kunit_suite_for_each_test_case(suite, test_case)
-		kunit_run_case_catch_errors(suite, test_case);
+	kunit_suite_for_each_test_case(suite, test_case) {
+		struct kunit test = { .param_value = NULL, .param_index = 0 };
+		bool test_success = true;
+
+		if (test_case->generate_params)
+			test.param_value = test_case->generate_params(NULL);
+
+		do {
+			kunit_run_case_catch_errors(suite, test_case, &test);
+			test_success &= test_case->success;
+
+			if (test_case->generate_params) {
+				kunit_log(KERN_INFO, &test,
+					  KUNIT_SUBTEST_INDENT
+					  "# %s: param-%d %s",
+					  test_case->name, test.param_index,
+					  kunit_status_to_string(test.success));
+				test.param_value = test_case->generate_params(test.param_value);
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
2.29.2.222.g5d2a92d10f8-goog

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
