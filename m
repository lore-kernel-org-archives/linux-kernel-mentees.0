Return-Path: <SRS0=aL4C=EB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F7BC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 18:36:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 547972224E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 18:36:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oluu89m6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 547972224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A3DA52E10D;
	Mon, 26 Oct 2020 18:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeR8bn-GymEr; Mon, 26 Oct 2020 18:36:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 52D2F2E10B;
	Mon, 26 Oct 2020 18:36:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B064C0859;
	Mon, 26 Oct 2020 18:36:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 859ACC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 78D898718E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m7tV7y0eKYQB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:36:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CA8BA87178
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 18:36:10 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id l2so3511935pjt.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 11:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GDOHv5b8HiOM16zq/llcw/rbyjliyY5uE1ixYVZQCRk=;
 b=Oluu89m6zfnz2xjgPuqZ/RtqNtSFMlEBWuKWY6dglhynSZHo52MpwU4nIX/l9JqgBN
 VAWmDkz5EtHdhrStBWaYy0XSF15h0gb5VOmfQTL8nkeOh6BYtLAisjFqocIuPlpH/ZWd
 Q9FEbXvfhwzq/+BN9aRU+0+DeoMf+7hEkbQ1ZMCBEjUph0HQmkWd4qgAeZKkBZ9JydvD
 yQD2cCtL8Kdf6eAfhHpmVHp+BwyvUEWelMiHhRkEcDaGdXyDbyjTQSb7pXPQftDuXR9E
 5kjXcMxTwR3Wojl8R9kX5fDWk9vxT8NZdMeNBzlCeQoFLtb/xTVk05VEN/mqZtngfZH+
 nbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GDOHv5b8HiOM16zq/llcw/rbyjliyY5uE1ixYVZQCRk=;
 b=Es+Eb1zgXIcdaijN5hk2TqqYQ4zttN0Y6x1wPbeS0gPCAKtjJb3q+SFdMEBBQYeSSW
 e75PD61EGZyg6JY9+/AJten4aMUYtO54GLtBKaETUm8/Y9BzNZpcIJVrAhFQP8QT+XCQ
 +7G/AErz2VRMJoTgeMOhBYPmGb/Dhp8spmCIozffCMe189fvkCOLnFRp1z7f5c2H638U
 2g2ubuGTRo4fCxOBk3yG2rMnSMPNETjZToCHCYsHxraRA8i7QrWgwCIg/PGdDRLreLLD
 NYXfjk0dkCKOc4CAivJLn4w0eF8dPwbbOZrcMCht8SrNcFOXhSkDyIrSs3yTH+TJiB+k
 2+KA==
X-Gm-Message-State: AOAM5300P7Jy5QIaZBQL0JsHPmOX4ofs7oI1bo8tMlkh2ITk6JT+XHBm
 xlQFG4W5TC0xZWgDDiN8YAo=
X-Google-Smtp-Source: ABdhPJw+Kpj72k9Rn6j1v/PbCzIUTKXOjmOgwzcUZNhWRbstWGMZPmaBxBy8VHtiGcdwZKqlH49fTQ==
X-Received: by 2002:a17:90a:fe8:: with SMTP id
 95mr17238402pjz.73.1603737370301; 
 Mon, 26 Oct 2020 11:36:10 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([106.51.240.100])
 by smtp.gmail.com with ESMTPSA id z23sm11085260pgf.12.2020.10.26.11.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:36:09 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, skhan@linuxfoundation.org, elver@google.com,
 yzaikin@google.com, tytso@mit.edu, adilger.kernel@dilger.ca
Date: Tue, 27 Oct 2020 00:05:23 +0530
Message-Id: <20201026183523.82749-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [PATCH v3 1/2] kunit: Support for
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
Changes v2->v3:
- Modifictaion of generator macro and method
Changes v1->v2:
- Use of a generator method to access test case parameters

 include/kunit/test.h | 32 ++++++++++++++++++++++++++++++++
 lib/kunit/test.c     | 20 +++++++++++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index a423fffefea0..16bf9f334e2c 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -142,6 +142,12 @@ struct kunit_case {
 	void (*run_case)(struct kunit *test);
 	const char *name;
 
+	/*
+	 * Pointer to test parameter generator function.
+	 * Used only for parameterized tests.
+	 */
+	void* (*generate_params)(void *prev);
+
 	/* private: internal use only. */
 	bool success;
 	char *log;
@@ -162,6 +168,9 @@ static inline char *kunit_status_to_string(bool status)
  * &struct kunit_case for an example on how to use it.
  */
 #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
+#define KUNIT_CASE_PARAM(test_name, gen_params)			\
+		{ .run_case = test_name, .name = #test_name,	\
+		  .generate_params = gen_params }
 
 /**
  * struct kunit_suite - describes a related collection of &struct kunit_case
@@ -208,6 +217,15 @@ struct kunit {
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
@@ -1742,4 +1760,18 @@ do {									       \
 						fmt,			       \
 						##__VA_ARGS__)
 
+/**
+ * KUNIT_PARAM_GENERATOR() - Helper method for test parameter generators
+ * 			     required in parameterized tests.
+ * @name:  prefix of the name for the test parameter generator function.
+ * @prev: a pointer to the previous test parameter, NULL for first parameter.
+ * @array: a user-supplied pointer to an array of test parameters.
+ */
+#define KUNIT_PARAM_GENERATOR(name, array)							\
+	static void *name##_gen_params(void *prev)						\
+	{											\
+		typeof((array)[0]) * __next = prev ? ((typeof(__next)) prev) + 1 : (array);	\
+		return __next - (array) < ARRAY_SIZE((array)) ? __next : NULL;			\
+	}
+
 #endif /* _KUNIT_TEST_H */
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 750704abe89a..b70ab9b12f3b 100644
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
+		test->param_values = test_case->generate_params(NULL);
+		test->current_param = 0;
+
+		while (test->param_values) {
+			test_case->run_case(test);
+			test->param_values = test_case->generate_params(test->param_values);
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
