Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77085C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 15:06:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3724208B6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 15:06:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pFREwHdt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3724208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BD7487046;
	Fri, 23 Oct 2020 15:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjYDV1Fd-0nH; Fri, 23 Oct 2020 15:06:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 61B4F86DAD;
	Fri, 23 Oct 2020 15:06:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53EF4C0052;
	Fri, 23 Oct 2020 15:06:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F377BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 15:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EC6EF87659
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 15:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZx-fd759rti
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 15:06:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3BBAA875A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 15:06:10 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 10so1550434pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 08:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cOkCttaR0bC+4/s3OhAlnJb8FuiFIwQlMyKpigG8dkI=;
 b=pFREwHdtLPQZmiTj8UQXEeuy9cmHFRUbUCtz+jETwBYbX8Fi7yzUGESD6Qvh0ZAxHR
 ZFlrFzC+UDnJcHOfad12GTiXKcQ01F/bry3iRzK+DT8JSvQecsQrP1vcIxjbtIYgvGHw
 uhL4pP1tS4NL0tKBwi/hv2z24CkByZulgdi2vxo1IHrvX2jy9vohwpwB+fVzWgZNhre9
 t8So6jTNE8/J+yYhIPeLCNr3XWBKs4lpVkhs2XKy02MkoNS4ITETMKdvx6SBxh4JDlrN
 FOhmgXMnX70JmMSNw9OI6uro4n95eGaVIkeoKMHsJqZb5/zhb/VTXr6oxu6w5ybzZlMA
 6LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cOkCttaR0bC+4/s3OhAlnJb8FuiFIwQlMyKpigG8dkI=;
 b=j91vP/vvwed5bUEW2f8LfmCgeJm89mmX46J6+tMs57szGXNwcz/9zhWrFoPbJLBrRV
 yyUT+2s4dk0ZwGUsvM74uIHRQVprbKkahIUlZZZ0aRKHmly/mC5zWq57eKOkO0y/m3su
 vH/CWSYtxgSl5fJ7W8vOqQkFRaTUK+BCGrdy8bxyRlXYeYVqHaYbPRWlqBSu3WGURil3
 KAnC2l6W8flj5fqYTyCYeW+yctIs1KzfSJfHUzQE306E0X6riJKJ+tfnp1RGaQabEzHD
 VxoUWFoZkcgFP301jxMYiW1siuUFEYljGaIKJdPsxwsN2i7lbgqF2eznBeGFs8nZuURp
 /h/Q==
X-Gm-Message-State: AOAM5339lo0R3ZGlCIa83wmqGbiy2bQXhDvHaGTSCtTqZMdal2d2HDRL
 3V02Uq4XyextswbSSVMcNVk=
X-Google-Smtp-Source: ABdhPJy+G+QRKUIq2q5O0AbyDACZK1LnjZBNu9jE4BW7rj5lUUjlAVaQEcEaigJVkn4aUzpNH2EvKg==
X-Received: by 2002:a17:90b:1c0d:: with SMTP id
 oc13mr3275849pjb.192.1603465569743; 
 Fri, 23 Oct 2020 08:06:09 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([106.51.242.32])
 by smtp.gmail.com with ESMTPSA id 78sm2430532pfz.211.2020.10.23.08.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 08:06:08 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, skhan@linuxfoundation.org, elver@google.com,
 yzaikin@google.com, tytso@mit.edu, adilger.kernel@dilger.ca
Date: Fri, 23 Oct 2020 20:35:36 +0530
Message-Id: <20201023150536.282568-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [PATCH v2 1/2] kunit: Support for
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
Changes v1->v2:
- Use of a generator method to access test case parameters

 include/kunit/test.h | 45 ++++++++++++++++++++++++++++++++++++++++++++
 lib/kunit/test.c     | 20 +++++++++++++++++++-
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index a423fffefea0..c417ac140326 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -141,6 +141,7 @@ struct kunit;
 struct kunit_case {
 	void (*run_case)(struct kunit *test);
 	const char *name;
+	void* (*generate_params)(struct kunit *test, void *prev);
 
 	/* private: internal use only. */
 	bool success;
@@ -162,6 +163,9 @@ static inline char *kunit_status_to_string(bool status)
  * &struct kunit_case for an example on how to use it.
  */
 #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
+#define KUNIT_CASE_PARAM(test_name, gen_params)			\
+		{ .run_case = test_name, .name = #test_name,	\
+		  .generate_params = gen_params }
 
 /**
  * struct kunit_suite - describes a related collection of &struct kunit_case
@@ -208,6 +212,15 @@ struct kunit {
 	const char *name; /* Read only after initialization! */
 	char *log; /* Points at case log after initialization */
 	struct kunit_try_catch try_catch;
+	/* param_values points to test case parameters in parameterized tests */
+	void *param_values;
+	/*
+	 * current_param stores the index of the parameter in
+	 * the array of parameters in parameterized tests.
+	 * current_param + 1 is printed to indicate the parameter
+	 * that causes the test to fail in case of test failure.
+	 */
+	int current_param;
 	/*
 	 * success starts as true, and may only be set to false during a
 	 * test case; thus, it is safe to update this across multiple
@@ -1742,4 +1755,36 @@ do {									       \
 						fmt,			       \
 						##__VA_ARGS__)
 
+/**
+ * kunit_param_generator_helper() - Helper method for test parameter generators
+ * 				    required in parameterized tests.
+ * @test: The test context object.
+ * @prev_param: a pointer to the previous test parameter, NULL for first parameter.
+ * @param_array: a user-supplied pointer to an array of test parameters.
+ * @array_size: number of test parameters in the array.
+ * @type_size: size of one test parameter.
+ */
+static inline void *kunit_param_generator_helper(struct kunit *test,
+					void *prev_param,
+					void *param_array,
+					size_t array_size,
+					size_t type_size)
+{
+	KUNIT_ASSERT_EQ(test, (prev_param - param_array) % type_size, 0);
+
+	if (!prev_param)
+		return param_array;
+
+	KUNIT_ASSERT_GE(test, prev_param, param_array);
+
+	if (prev_param + type_size < param_array + (array_size * type_size))
+		return prev_param + type_size;
+	else
+		return NULL;
+}
+
+#define KUNIT_PARAM_GENERATOR_HELPER(test, prev_param, param_array, param_type) \
+	kunit_param_generator_helper(test, prev_param, param_array,		\
+				ARRAY_SIZE(param_array), sizeof(param_type))
+
 #endif /* _KUNIT_TEST_H */
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 750704abe89a..0e6ffe6384a7 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -127,6 +127,11 @@ unsigned int kunit_test_case_num(struct kunit_suite *suite,
 }
 EXPORT_SYMBOL_GPL(kunit_test_case_num);
 
+static void kunit_print_failed_param(struct kunit *test)
+{
+	kunit_err(test, "\n\tTest failed at parameter: %d\n", test->current_param + 1);
+}
+
 static void kunit_print_string_stream(struct kunit *test,
 				      struct string_stream *stream)
 {
@@ -168,6 +173,8 @@ static void kunit_fail(struct kunit *test, struct kunit_assert *assert)
 	assert->format(assert, stream);
 
 	kunit_print_string_stream(test, stream);
+	if (test->param_values)
+		kunit_print_failed_param(test);
 
 	WARN_ON(string_stream_destroy(stream));
 }
@@ -239,7 +246,18 @@ static void kunit_run_case_internal(struct kunit *test,
 		}
 	}
 
-	test_case->run_case(test);
+	if (!test_case->generate_params) {
+		test_case->run_case(test);
+	} else {
+		test->param_values = test_case->generate_params(test, NULL);
+		test->current_param = 0;
+
+		while (test->param_values) {
+			test_case->run_case(test);
+			test->param_values = test_case->generate_params(test, test->param_values);
+			test->current_param++;
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
