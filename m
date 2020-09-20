Return-Path: <SRS0=4nEd=C5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC00BC43465
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 06:40:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CB9A2078D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 06:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wz1KWB1k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CB9A2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E31FA87385;
	Sun, 20 Sep 2020 06:40:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gpb08acjLPmw; Sun, 20 Sep 2020 06:40:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3060187381;
	Sun, 20 Sep 2020 06:40:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16731C0859;
	Sun, 20 Sep 2020 06:40:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BED6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 06:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 24C0D85F8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 06:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gRqcftb5JbAi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 06:40:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6315385B7C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 06:40:47 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id y1so6119238pgk.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 23:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1QL0a0arJEixSXg1ARR1mbsS8zWipyl6tY3BSbfA5Es=;
 b=Wz1KWB1kgiqbQnS+TKJKlOD/drnGausO9fU/1EILA1E/C+UawIu8fQR5IeF4uPDkPe
 X3FsiIc5UwnPln17avlhnJjnCs5i/ej4SRI61VLvYQ24OkBmKEOXQJz3j97ZNjYmtOl1
 h9I4lRxX+Q+R5Ry+zp+tHaFoUo3WeTv8s/+5XYRJ7daj0dVmn8JoQqBLHYfHLmBy0HDi
 VfRKelEKlz6RihtNk1Juc2KO+XLwjlqYgfpL7UXADs3FlSu6aZVAbHGIn5D6ZDadI02L
 A6k2K+dCJPEyMU0bvM0tu7H/Vg1EhM6kbPeH33z3o0LuzWKQK30oZQvEf4goPDYdTwvP
 sAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1QL0a0arJEixSXg1ARR1mbsS8zWipyl6tY3BSbfA5Es=;
 b=LMPBM31kvQr+6i6w5ywpJw0LE16NLiPnINrnJ3IA7jonhxuNIW3y8GpBBzljEWPxpf
 vfo0oJQDmflTE83f7pQSwPBSQLtAKprjw0PDZr4df292x5V3JTCJ+VN773bhut+B7LFS
 RsDoljK9SEmfVu6pADvzuZp6F1CUPnlq8TsgaHbw6YG4wYOab0i7fmH/SVrXR/nFP444
 60xAo2RltzcVMnXmPE4jO3ZWNYTFNuV0deAfg4HOCt3wbjPKa++s1RNXtW1PpCdgLz1x
 ZTWSe3HIa/DFqP/6g7aFxTgSfT6y99a1cNgb086tLvCObiuAQhW9SdRFwk5sE3yj0RYQ
 88sw==
X-Gm-Message-State: AOAM531nAc0Rl8Akw79Ctt5VDP3ciAKOI/tlAj7Xh3JlbDR8AhIAVSPv
 8Pyz8OUZAWZs8FROHrYzzj4=
X-Google-Smtp-Source: ABdhPJyUiuW1WKZjWS0Yu6kJmBYqpnRP1tbjdR8Y2GUVWcTnjNLEV7IuyqL7DZ41ifCu7t47bIfF0Q==
X-Received: by 2002:a62:7704:0:b029:13f:dd99:d17c with SMTP id
 s4-20020a6277040000b029013fdd99d17cmr29624735pfc.6.1600584046837; 
 Sat, 19 Sep 2020 23:40:46 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([106.51.242.111])
 by smtp.gmail.com with ESMTPSA id m5sm7166486pjn.19.2020.09.19.23.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 23:40:46 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com
Date: Sun, 20 Sep 2020 12:10:01 +0530
Message-Id: <20200920064001.83359-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [RFC] kunit: Support for Parameterized
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

This patch has a basic implementation for adding support for parameterized
testing in KUnit. It is not complete. Currently there is only support
for integer parameters for test cases. I will generalize this to support
other data types as well. I have tested this by making some small changes
to the ext4/inode-test.c test. The main logic of this test hasn't been
changed. However, I have created an integer array of inputs. The test only
shows that these values can be accessed through the kunit struct as shown
by the dmesg output:

    # inode_test_xtimestamp_decoding: 
Parameterized = 1
    # inode_test_xtimestamp_decoding: 
a[0][0] = 1 and a[0][1] = 2 and a[1][0] = 3 and a[1][1] = 4

While this does not affect the test, it shows that this initial approach
for parameterized testing works.
Please let me know any suggestions for this approach and how it can be improved.

Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
---
 fs/ext4/inode-test.c   | 22 +++++++++++++++++++++-
 include/kunit/test.h   | 11 ++++++++++-
 lib/kunit/kunit-test.c |  4 ++--
 lib/kunit/test.c       | 15 +++++++++++++--
 4 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
index d62d802c9c12..5ef242f2fef3 100644
--- a/fs/ext4/inode-test.c
+++ b/fs/ext4/inode-test.c
@@ -235,6 +235,11 @@ static void inode_test_xtimestamp_decoding(struct kunit *test)
 	struct timespec64 timestamp;
 	int i;
 
+	kunit_info(test, "\nParameterized = %d\n", test->parameterized);
+	kunit_info(test, "\na[0][0] = %d and a[0][1] = %d and a[1][0] = %d and a[1][1] = %d\n",
+						test->param_values[0][0], test->param_values[0][1],
+						test->param_values[1][0], test->param_values[1][1]);
+
 	for (i = 0; i < ARRAY_SIZE(test_data); ++i) {
 		timestamp.tv_sec = get_32bit_time(&test_data[i]);
 		ext4_decode_extra_time(&timestamp,
@@ -259,8 +264,23 @@ static void inode_test_xtimestamp_decoding(struct kunit *test)
 	}
 }
 
+int **getParams(void)
+{
+	int *x = (int *)kmalloc(sizeof(int) * 2, GFP_KERNEL);
+	int *y = (int *)kmalloc(sizeof(int) * 2, GFP_KERNEL);
+	int **a = (int **)kmalloc(sizeof(x) * 2, GFP_KERNEL);
+
+	x[0] = 1;
+	x[1] = 2;
+	y[0] = 3;
+	y[1] = 4;
+	a[0] = x;
+	a[1] = y;
+	return a;
+}
+
 static struct kunit_case ext4_inode_test_cases[] = {
-	KUNIT_CASE(inode_test_xtimestamp_decoding),
+	KUNIT_CASE_PARAM(inode_test_xtimestamp_decoding, getParams),
 	{}
 };
 
diff --git a/include/kunit/test.h b/include/kunit/test.h
index 59f3144f009a..23e4ff68c4b5 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -140,6 +140,8 @@ struct kunit;
 struct kunit_case {
 	void (*run_case)(struct kunit *test);
 	const char *name;
+	bool parameterized;
+	int** (*get_params)(void);
 
 	/* private: internal use only. */
 	bool success;
@@ -162,6 +164,10 @@ static inline char *kunit_status_to_string(bool status)
  */
 #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
 
+#define KUNIT_CASE_PARAM(test_name, getparams) { .run_case = test_name,		\
+								.name = #test_name, .parameterized = true,	\
+								.get_params = getparams }
+
 /**
  * struct kunit_suite - describes a related collection of &struct kunit_case
  *
@@ -206,6 +212,8 @@ struct kunit {
 	/* private: internal use only. */
 	const char *name; /* Read only after initialization! */
 	char *log; /* Points at case log after initialization */
+	bool parameterized;
+	int **param_values;
 	struct kunit_try_catch try_catch;
 	/*
 	 * success starts as true, and may only be set to false during a
@@ -224,7 +232,8 @@ struct kunit {
 	struct list_head resources; /* Protected by lock. */
 };
 
-void kunit_init_test(struct kunit *test, const char *name, char *log);
+void kunit_init_test(struct kunit *test, const char *name, char *log, bool parameterized);
+void kunit_init_param_test(struct kunit *test, struct kunit_case *test_case);
 
 int kunit_run_tests(struct kunit_suite *suite);
 
diff --git a/lib/kunit/kunit-test.c b/lib/kunit/kunit-test.c
index 69f902440a0e..b79e287ca19b 100644
--- a/lib/kunit/kunit-test.c
+++ b/lib/kunit/kunit-test.c
@@ -134,7 +134,7 @@ static void kunit_resource_test_init_resources(struct kunit *test)
 {
 	struct kunit_test_resource_context *ctx = test->priv;
 
-	kunit_init_test(&ctx->test, "testing_test_init_test", NULL);
+	kunit_init_test(&ctx->test, "testing_test_init_test", NULL, false);
 
 	KUNIT_EXPECT_TRUE(test, list_empty(&ctx->test.resources));
 }
@@ -370,7 +370,7 @@ static int kunit_resource_test_init(struct kunit *test)
 
 	test->priv = ctx;
 
-	kunit_init_test(&ctx->test, "test_test_context", NULL);
+	kunit_init_test(&ctx->test, "test_test_context", NULL, false);
 
 	return 0;
 }
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index c36037200310..2e061bfe154d 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -224,7 +224,7 @@ void kunit_do_assertion(struct kunit *test,
 }
 EXPORT_SYMBOL_GPL(kunit_do_assertion);
 
-void kunit_init_test(struct kunit *test, const char *name, char *log)
+void kunit_init_test(struct kunit *test, const char *name, char *log, bool parameterized)
 {
 	spin_lock_init(&test->lock);
 	INIT_LIST_HEAD(&test->resources);
@@ -232,10 +232,19 @@ void kunit_init_test(struct kunit *test, const char *name, char *log)
 	test->log = log;
 	if (test->log)
 		test->log[0] = '\0';
+	test->parameterized = parameterized;
 	test->success = true;
 }
 EXPORT_SYMBOL_GPL(kunit_init_test);
 
+void kunit_init_param_test(struct kunit *test, struct kunit_case *test_case)
+{
+	spin_lock_init(&test->lock);
+	INIT_LIST_HEAD(&test->resources);
+	test->param_values = test_case->get_params();
+}
+EXPORT_SYMBOL_GPL(kunit_init_param_test);
+
 /*
  * Initializes and runs test case. Does not clean up or do post validations.
  */
@@ -342,7 +351,9 @@ static void kunit_run_case_catch_errors(struct kunit_suite *suite,
 	struct kunit_try_catch *try_catch;
 	struct kunit test;
 
-	kunit_init_test(&test, test_case->name, test_case->log);
+	kunit_init_test(&test, test_case->name, test_case->log, test_case->parameterized);
+	if (test_case->parameterized)
+		kunit_init_param_test(&test, test_case);
 	try_catch = &test.try_catch;
 
 	kunit_try_catch_init(try_catch,
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
