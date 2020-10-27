Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24661C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 17:47:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B88B24197
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 17:47:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnoCBn0o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B88B24197
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0BE0786929;
	Tue, 27 Oct 2020 17:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFN94OA06qdm; Tue, 27 Oct 2020 17:47:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 29E988693D;
	Tue, 27 Oct 2020 17:47:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 155E8C0859;
	Tue, 27 Oct 2020 17:47:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9639CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 81A96203DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q571rS9oecwG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:47:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id DCED62151F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:47:06 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w21so1342059pfc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 10:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aVsNnL1ok0ysdwP7UDtWbtFrfy8z7SExZwj3jr3Vm2s=;
 b=RnoCBn0oxegs9sYJiBmxzUlpBqJs6P6O+Gp4kF2ZAUcxgKaN3Fx6pXdjHj/JpqrhJ2
 4spcs0faeMhQYyYLd18oI5PPUXFdHxHFTlUGasjDxO5Z/lH4YvkbQziO5AWKT92i9Cvq
 n05pKOts614rBAaS7r6bvoH5HDoUjV5I/ufgA5I4/lwgE5sxVe49R6QMeVfz1ZJq0VXq
 usm+mtrQW8J+9rn39s/G6l+eOpYeeN5IGTlwBK1A/u1diB2rFnD9zVYJp7ieK6hREiw7
 BTbJlxtzhl3v+mK6xbEA2S7gqF2K7RLy6ZS20F9dhM7yfDENhNbPP3LMHwcZS3bqeKVF
 M+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aVsNnL1ok0ysdwP7UDtWbtFrfy8z7SExZwj3jr3Vm2s=;
 b=ZL/5f4kv+PrdcQiDrnwPk/y5m9PPpHFPPOvNLVQNSfKjWTMYRTdW19r4ic0r7i018m
 CI+U4Fv8+Kpqf2Ho/ASdLinCLYL6NlyyXifkTLeDhhA6AtIbke32Uh5e4+XUyAEEIvCr
 5YislwCYVCuyBfVgqYpuOQ3sBYbsag+PlqrH67CWPq/xr1w347sZ3KI1sxCn7R0MuWY2
 /77OKR7bMhk4sjv5u4L/iE3BXdI7ritdkQdnny+dxOGAl0xIEvtbCbpBCcMYmlEFHb5g
 CQI9PWL6dJSy1Sm/1y0Phy/j5Tmk2r0vJFVmoWMGLZYz6PwSqZely9XEwhbs75SxgsGw
 7K3Q==
X-Gm-Message-State: AOAM532DpHfK+bG3Ft6LIiDkEXPgDYqWR/iczMLy4As/3PhDVQd65LJa
 Sn945/sk2mmwa7aKIHHVCks=
X-Google-Smtp-Source: ABdhPJwVATQwRqDKinAmRyabBjkId+SiNykWzpqlwCHd7Rs0ZVL1i/IScSyDPS3WF1qjRBUgSOTWQw==
X-Received: by 2002:a05:6a00:134c:b029:160:c73:8462 with SMTP id
 k12-20020a056a00134cb02901600c738462mr3264745pfu.4.1603820826322; 
 Tue, 27 Oct 2020 10:47:06 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([106.51.240.100])
 by smtp.gmail.com with ESMTPSA id 15sm2965980pfj.179.2020.10.27.10.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 10:47:05 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, skhan@linuxfoundation.org, elver@google.com,
 yzaikin@google.com, tytso@mit.edu, adilger.kernel@dilger.ca
Date: Tue, 27 Oct 2020 23:16:30 +0530
Message-Id: <20201027174630.85213-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [PATCH v4 1/2] kunit: Support for
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
This approach requires the creation of a test case using the
KUNIT_CASE_PARAM macro that accepts a generator function as input.
This generator function should return the next parameter given the
previous parameter in parameterized tests. It also provides
a macro to generate common-case generators.

Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
Co-developed-by: Marco Elver <elver@google.com>
Signed-off-by: Marco Elver <elver@google.com>
---
Changes v3->v4:
- Rename kunit variables
- Rename generator function helper macro
- Add documentation for generator approach
- Display test case name in case of failure along with param index
Changes v2->v3:
- Modifictaion of generator macro and method
Changes v1->v2:
- Use of a generator method to access test case parameters

 include/kunit/test.h | 34 ++++++++++++++++++++++++++++++++++
 lib/kunit/test.c     | 21 ++++++++++++++++++++-
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 9197da792336..ec2307ee9bb0 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -107,6 +107,13 @@ struct kunit;
  *
  * @run_case: the function representing the actual test case.
  * @name:     the name of the test case.
+ * @generate_params: the generator function for parameterized tests.
+ *
+ * The generator function is used to lazily generate a series of
+ * arbitrarily typed values that fit into a void*. The argument @prev
+ * is the previously returned value, which should be used to derive the
+ * next value; @prev is set to NULL on the initial generator call.
+ * When no more values are available, the generator must return NULL.
  *
  * A test case is a function with the signature,
  * ``void (*)(struct kunit *)``
@@ -141,6 +148,7 @@ struct kunit;
 struct kunit_case {
 	void (*run_case)(struct kunit *test);
 	const char *name;
+	void* (*generate_params)(void *prev);
 
 	/* private: internal use only. */
 	bool success;
@@ -162,6 +170,9 @@ static inline char *kunit_status_to_string(bool status)
  * &struct kunit_case for an example on how to use it.
  */
 #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
+#define KUNIT_CASE_PARAM(test_name, gen_params)			\
+		{ .run_case = test_name, .name = #test_name,	\
+		  .generate_params = gen_params }
 
 /**
  * struct kunit_suite - describes a related collection of &struct kunit_case
@@ -208,6 +219,15 @@ struct kunit {
 	const char *name; /* Read only after initialization! */
 	char *log; /* Points at case log after initialization */
 	struct kunit_try_catch try_catch;
+	/* param_value points to test case parameters in parameterized tests */
+	void *param_value;
+	/*
+	 * param_index stores the index of the parameter in
+	 * parameterized tests. param_index + 1 is printed
+	 * to indicate the parameter that causes the test
+	 * to fail in case of test failure.
+	 */
+	int param_index;
 	/*
 	 * success starts as true, and may only be set to false during a
 	 * test case; thus, it is safe to update this across multiple
@@ -1742,4 +1762,18 @@ do {									       \
 						fmt,			       \
 						##__VA_ARGS__)
 
+/**
+ * KUNIT_ARRAY_PARAM() - Helper method for test parameter generators
+ * 			 required in parameterized tests.
+ * @name:  prefix of the name for the test parameter generator function.
+ *	   It will be suffixed by "_gen_params".
+ * @array: a user-supplied pointer to an array of test parameters.
+ */
+#define KUNIT_ARRAY_PARAM(name, array)								\
+	static void *name##_gen_params(void *prev)						\
+	{											\
+		typeof((array)[0]) * __next = prev ? ((typeof(__next)) prev) + 1 : (array);	\
+		return __next - (array) < ARRAY_SIZE((array)) ? __next : NULL;			\
+	}
+
 #endif /* _KUNIT_TEST_H */
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 750704abe89a..8ad908b61494 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -127,6 +127,12 @@ unsigned int kunit_test_case_num(struct kunit_suite *suite,
 }
 EXPORT_SYMBOL_GPL(kunit_test_case_num);
 
+static void kunit_print_failed_param(struct kunit *test)
+{
+	kunit_err(test, "\n\tTest failed at:\n\ttest case: %s\n\tparameter: %d\n",
+						test->name, test->param_index + 1);
+}
+
 static void kunit_print_string_stream(struct kunit *test,
 				      struct string_stream *stream)
 {
@@ -168,6 +174,8 @@ static void kunit_fail(struct kunit *test, struct kunit_assert *assert)
 	assert->format(assert, stream);
 
 	kunit_print_string_stream(test, stream);
+	if (test->param_value)
+		kunit_print_failed_param(test);
 
 	WARN_ON(string_stream_destroy(stream));
 }
@@ -239,7 +247,18 @@ static void kunit_run_case_internal(struct kunit *test,
 		}
 	}
 
-	test_case->run_case(test);
+	if (!test_case->generate_params) {
+		test_case->run_case(test);
+	} else {
+		test->param_value = test_case->generate_params(NULL);
+		test->param_index = 0;
+
+		while (test->param_value) {
+			test_case->run_case(test);
+			test->param_value = test_case->generate_params(test->param_value);
+			test->param_index++;
+		}
+	}
 }
 
 static void kunit_case_internal_cleanup(struct kunit *test)
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
