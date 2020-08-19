Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773E9C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 19:39:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09A5A2083B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 19:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="j134cMEq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09A5A2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C289A87FFB;
	Wed, 19 Aug 2020 19:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B5bCr65Ex3OI; Wed, 19 Aug 2020 19:39:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9345387FDE;
	Wed, 19 Aug 2020 19:39:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78F1DC0889;
	Wed, 19 Aug 2020 19:39:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D641C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 55E8187FEA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w0D8xQvj9GTK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:39:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DCE8287FDE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:39:24 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id t6so11879205qvw.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 12:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwxj+o1BdkGwJ9m/5ICCYyNBv3FeFuzcv+ZpUclXE/U=;
 b=j134cMEqqIjB7KzfW6/0VjH7q6z+71GA4xiPd5ZXhgAiB0Vq5VmGKwvvMiu1WgvcAK
 wqTWSdUr9aLfabaPZr5whReM+sbkiedrJI3GhRehHFo+wP7bwEnBrvJWQkSFBp1vReri
 DF7mHp9pv+9cC5NDLq7i2LG909nIWhYWGvoE7gAM0OwoSEmtpMcf5yOlDtTvQaH9ssG2
 BeLLPKWyhjdaDAQq5vzIWLh2kfhZz2azjhFKuz5iU9ZMoRVBIDkHdwvlprBNpJ0nBY3v
 wrtknj3MmI/3khfcbxGfsY7v2hPQYVA1FVbWjrH1BXFIMdwuLMxHft4kET5NqlzDDSav
 A6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwxj+o1BdkGwJ9m/5ICCYyNBv3FeFuzcv+ZpUclXE/U=;
 b=tm9iXBfk+OzzbDSduBctRY5leI3OQIOsxyDWI3+YMsEnL2w0UvW5TfkjxjHoi4YibZ
 H/x44kyuU9g/X53cKNGm/WGO2WUAoWHIlUjIg0rvrowTz6unDYnL0XHOJ48etktN7Grs
 89VPjH8++A6ITz2KreCldQoBB39BkEk98DQHxqyxqG8XdDVK8ufwF3kloHBNylXz64HS
 qx+bh1CEVuIiTO6RzJ3dt2HWImn5ktAY08tP1HLZ7Z2jwWIrgr4wq/ZD33yCp5c6FK67
 /rsTqK4yvtJQxN2vvDJck9ovh8vowVbicqKeQ+08AZmdj83Hvx4qetr+Vc7lUvCPuwfp
 158Q==
X-Gm-Message-State: AOAM533DN7tCkrzst1kpjSSlPvXeIhtoI3ZMUITMlBMtgDlRBLJlccpJ
 68ex7/SDCWZhyn+Xk4fMis2pQg==
X-Google-Smtp-Source: ABdhPJx7Con1mzNWIqO/9Uu1KVyV7Ju/QQSoKaD7wueGgWcStEnrfTsSWs5Ko+XGRKfcgPqvqWERBg==
X-Received: by 2002:a0c:f1c9:: with SMTP id u9mr25138608qvl.76.1597865963641; 
 Wed, 19 Aug 2020 12:39:23 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:288::1001])
 by smtp.gmail.com with ESMTPSA id x57sm29367691qtc.61.2020.08.19.12.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 12:39:23 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Wed, 19 Aug 2020 16:39:17 -0300
Message-Id: <20200819193917.67409-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kselftest@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] kunit: Customize
	KUNIT_EXCEPT/KUNIT_ASSERT Expected messages
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

In some cases, to maintain the consistency of the Expected messages
with the original runtime test, it is necessary to customize the
Expected messages on KUnit.

As an example test_overflow conversion to KUnit (I added 1,
p->s_of+1, just to fail the test).

Using KUNIT_EXPECT_EQ:

Expected _of == p->s_of+1, but
  _of == 0
  p->s_of+1 == 1
not ok 1 - overflow_calculation_test
ok 2 - overflow_shift_test

Using KUNIT_EXPECT_EQ_CUSTOM_MSG:

Expected 0 + 0 to not overflow (type u8)
not ok 1 - overflow_calculation_test

Which is more similar to the error message of the original test.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 include/kunit/assert.h |   8 ++-
 include/kunit/test.h   | 151 +++++++++++++++++++++++++++++++++++++++--
 lib/kunit/assert.c     |  34 ++++++----
 3 files changed, 172 insertions(+), 21 deletions(-)

diff --git a/include/kunit/assert.h b/include/kunit/assert.h
index ad889b539ab3..b3c25b4420c8 100644
--- a/include/kunit/assert.h
+++ b/include/kunit/assert.h
@@ -204,6 +204,7 @@ struct kunit_binary_assert {
 	long long left_value;
 	const char *right_text;
 	long long right_value;
+	bool custom_msg;
 };
 
 void kunit_binary_assert_format(const struct kunit_assert *assert,
@@ -219,6 +220,7 @@ void kunit_binary_assert_format(const struct kunit_assert *assert,
  * @left_val: The actual evaluated value of the expression in the left slot.
  * @right_str: A string representation of the expression in the right slot.
  * @right_val: The actual evaluated value of the expression in the right slot.
+ * @custom_msg_bool: Show a custom expect message instead the default message.
  *
  * Initializes a &struct kunit_binary_assert. Intended to be used in
  * KUNIT_EXPECT_* and KUNIT_ASSERT_* macros.
@@ -229,7 +231,8 @@ void kunit_binary_assert_format(const struct kunit_assert *assert,
 					left_str,			       \
 					left_val,			       \
 					right_str,			       \
-					right_val) {			       \
+					right_val,			       \
+					custom_msg_bool) {		       \
 	.assert = KUNIT_INIT_ASSERT_STRUCT(test,			       \
 					   type,			       \
 					   kunit_binary_assert_format),	       \
@@ -237,7 +240,8 @@ void kunit_binary_assert_format(const struct kunit_assert *assert,
 	.left_text = left_str,						       \
 	.left_value = left_val,						       \
 	.right_text = right_str,					       \
-	.right_value = right_val					       \
+	.right_value = right_val,					       \
+	.custom_msg = custom_msg_bool,					       \
 }
 
 /**
diff --git a/include/kunit/test.h b/include/kunit/test.h
index 59f3144f009a..ec821a57ec5b 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -699,6 +699,7 @@ void kunit_do_assertion(struct kunit *test,
 				    left,				       \
 				    op,					       \
 				    right,				       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ...)				       \
 do {									       \
@@ -715,7 +716,8 @@ do {									       \
 					  #left,			       \
 					  __left,			       \
 					  #right,			       \
-					  __right),			       \
+					  __right,			       \
+					  custom_msg_bool),		       \
 			fmt,						       \
 			##__VA_ARGS__);					       \
 } while (0)
@@ -726,6 +728,7 @@ do {									       \
 				    assert_type,			       \
 				    left,				       \
 				    right,				       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ...)				       \
 	KUNIT_BASE_BINARY_ASSERTION(test,				       \
@@ -733,6 +736,7 @@ do {									       \
 				    ASSERT_CLASS_INIT,			       \
 				    assert_type,			       \
 				    left, ==, right,			       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
@@ -742,6 +746,7 @@ do {									       \
 				    assert_type,			       \
 				    left,				       \
 				    right,				       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ...)				       \
 	KUNIT_BASE_BINARY_ASSERTION(test,				       \
@@ -749,6 +754,7 @@ do {									       \
 				    ASSERT_CLASS_INIT,			       \
 				    assert_type,			       \
 				    left, !=, right,			       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
@@ -765,6 +771,7 @@ do {									       \
 				    ASSERT_CLASS_INIT,			       \
 				    assert_type,			       \
 				    left, <, right,			       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
@@ -774,6 +781,7 @@ do {									       \
 				    assert_type,			       \
 				    left,				       \
 				    right,				       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ...)				       \
 	KUNIT_BASE_BINARY_ASSERTION(test,				       \
@@ -781,6 +789,7 @@ do {									       \
 				    ASSERT_CLASS_INIT,			       \
 				    assert_type,			       \
 				    left, <=, right,			       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
@@ -797,6 +806,7 @@ do {									       \
 				    ASSERT_CLASS_INIT,			       \
 				    assert_type,			       \
 				    left, >, right,			       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
@@ -813,16 +823,23 @@ do {									       \
 				    ASSERT_CLASS_INIT,			       \
 				    assert_type,			       \
 				    left, >=, right,			       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
-#define KUNIT_BINARY_EQ_MSG_ASSERTION(test, assert_type, left, right, fmt, ...)\
+#define KUNIT_BINARY_EQ_MSG_ASSERTION(test,				       \
+				      assert_type,			       \
+				      left, right,			       \
+				      custom_msg_bool,			       \
+				      fmt,				       \
+				      ...)				       \
 	KUNIT_BASE_EQ_MSG_ASSERTION(test,				       \
 				    kunit_binary_assert,		       \
 				    KUNIT_INIT_BINARY_ASSERT_STRUCT,	       \
 				    assert_type,			       \
 				    left,				       \
 				    right,				       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
@@ -831,6 +848,7 @@ do {									       \
 				      assert_type,			       \
 				      left,				       \
 				      right,				       \
+				      false,				       \
 				      NULL)
 
 #define KUNIT_BINARY_PTR_EQ_MSG_ASSERTION(test,				       \
@@ -862,6 +880,18 @@ do {									       \
 				    assert_type,			       \
 				    left,				       \
 				    right,				       \
+				    false,				       \
+				    fmt,				       \
+				    ##__VA_ARGS__)
+
+#define KUNIT_BINARY_NE_CUSTOM_MSG_ASSERTION(test, assert_type, left, right, fmt, ...)\
+	KUNIT_BASE_NE_MSG_ASSERTION(test,				       \
+				    kunit_binary_assert,		       \
+				    KUNIT_INIT_BINARY_ASSERT_STRUCT,	       \
+				    assert_type,			       \
+				    left,				       \
+				    right,				       \
+				    true,				       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
@@ -870,6 +900,7 @@ do {									       \
 				      assert_type,			       \
 				      left,				       \
 				      right,				       \
+				      false,				       \
 				      NULL)
 
 #define KUNIT_BINARY_PTR_NE_MSG_ASSERTION(test,				       \
@@ -904,11 +935,12 @@ do {									       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
-#define KUNIT_BINARY_LT_ASSERTION(test, assert_type, left, right)	       \
+#define KUNIT_BINARY_LT_ASSERTION(test, assert_type, left, right, custom_msg_bool)\
 	KUNIT_BINARY_LT_MSG_ASSERTION(test,				       \
 				      assert_type,			       \
 				      left,				       \
 				      right,				       \
+				      custom_msg_bool,			       \
 				      NULL)
 
 #define KUNIT_BINARY_PTR_LT_MSG_ASSERTION(test,				       \
@@ -923,6 +955,7 @@ do {									       \
 				    assert_type,			       \
 				    left,				       \
 				    right,				       \
+				    false,				       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
@@ -933,13 +966,20 @@ do {									       \
 					  right,			       \
 					  NULL)
 
-#define KUNIT_BINARY_LE_MSG_ASSERTION(test, assert_type, left, right, fmt, ...)\
+#define KUNIT_BINARY_LE_MSG_ASSERTION(test,				       \
+				      assert_type,			       \
+				      left,				       \
+				      right,				       \
+				      custom_msg_bool,			       \
+				      fmt,				       \
+				      ...)				       \
 	KUNIT_BASE_LE_MSG_ASSERTION(test,				       \
 				    kunit_binary_assert,		       \
 				    KUNIT_INIT_BINARY_ASSERT_STRUCT,	       \
 				    assert_type,			       \
 				    left,				       \
 				    right,				       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
@@ -948,6 +988,7 @@ do {									       \
 				      assert_type,			       \
 				      left,				       \
 				      right,				       \
+				      false,				       \
 				      NULL)
 
 #define KUNIT_BINARY_PTR_LE_MSG_ASSERTION(test,				       \
@@ -972,13 +1013,20 @@ do {									       \
 					  right,			       \
 					  NULL)
 
-#define KUNIT_BINARY_GT_MSG_ASSERTION(test, assert_type, left, right, fmt, ...)\
+#define KUNIT_BINARY_GT_MSG_ASSERTION(test,				       \
+				      assert_type,			       \
+				      left,				       \
+				      right,				       \
+				      custom_msg_bool,			       \
+				      fmt,				       \
+				      ...)				       \
 	KUNIT_BASE_GT_MSG_ASSERTION(test,				       \
 				    kunit_binary_assert,		       \
 				    KUNIT_INIT_BINARY_ASSERT_STRUCT,	       \
 				    assert_type,			       \
 				    left,				       \
 				    right,				       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
@@ -1001,6 +1049,7 @@ do {									       \
 				    assert_type,			       \
 				    left,				       \
 				    right,				       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
@@ -1011,7 +1060,13 @@ do {									       \
 					  right,			       \
 					  NULL)
 
-#define KUNIT_BINARY_GE_MSG_ASSERTION(test, assert_type, left, right, fmt, ...)\
+#define KUNIT_BINARY_GE_MSG_ASSERTION(test,				       \
+				      assert_type,			       \
+				      left,				       \
+				      right,				       \
+				      custom_msg_bool,			       \
+				      fmt,				       \
+				      ...)				       \
 	KUNIT_BASE_GE_MSG_ASSERTION(test,				       \
 				    kunit_binary_assert,		       \
 				    KUNIT_INIT_BINARY_ASSERT_STRUCT,	       \
@@ -1026,12 +1081,14 @@ do {									       \
 				      assert_type,			       \
 				      left,				       \
 				      right,				       \
+				      false,				       \
 				      NULL)
 
 #define KUNIT_BINARY_PTR_GE_MSG_ASSERTION(test,				       \
 					  assert_type,			       \
 					  left,				       \
 					  right,			       \
+					  custom_msg_bool,		       \
 					  fmt,				       \
 					  ...)				       \
 	KUNIT_BASE_GE_MSG_ASSERTION(test,				       \
@@ -1040,6 +1097,7 @@ do {									       \
 				    assert_type,			       \
 				    left,				       \
 				    right,				       \
+				    custom_msg_bool,			       \
 				    fmt,				       \
 				    ##__VA_ARGS__)
 
@@ -1197,6 +1255,16 @@ do {									       \
 				      KUNIT_EXPECTATION,		       \
 				      left,				       \
 				      right,				       \
+				      false,				       \
+				      fmt,				       \
+				      ##__VA_ARGS__)
+
+#define KUNIT_EXPECT_EQ_CUSTOM_MSG(test, left, right, fmt, ...)		       \
+	KUNIT_BINARY_EQ_MSG_ASSERTION(test,				       \
+				      KUNIT_EXPECTATION,		       \
+				      left,				       \
+				      right,				       \
+				      true,				       \
 				      fmt,				       \
 				      ##__VA_ARGS__)
 
@@ -1222,9 +1290,18 @@ do {									       \
 					  KUNIT_EXPECTATION,		       \
 					  left,				       \
 					  right,			       \
+					  false,			       \
 					  fmt,				       \
 					  ##__VA_ARGS__)
 
+#define KUNIT_EXPECT_PTR_EQ_CUSTOM_MSG(test, left, right, fmt, ...)	       \
+	KUNIT_BINARY_PTR_EQ_MSG_ASSERTION(test,				       \
+					  KUNIT_EXPECTATION,		       \
+					  left,				       \
+					  right,			       \
+					  true,				       \
+					  fmt,				       \
+					  ##__VA_ARGS__)
 /**
  * KUNIT_EXPECT_NE() - An expectation that @left and @right are not equal.
  * @test: The test context object.
@@ -1244,6 +1321,16 @@ do {									       \
 				      KUNIT_EXPECTATION,		       \
 				      left,				       \
 				      right,				       \
+				      false,				       \
+				      fmt,				       \
+				      ##__VA_ARGS__)
+
+#define KUNIT_EXPECT_NE_CUSTOM_MSG(test, left, right, fmt, ...)		       \
+	KUNIT_BINARY_NE_MSG_ASSERTION(test,				       \
+				      KUNIT_EXPECTATION,		       \
+				      left,				       \
+				      right,				       \
+				      true,				       \
 				      fmt,				       \
 				      ##__VA_ARGS__)
 
@@ -1269,6 +1356,7 @@ do {									       \
 					  KUNIT_EXPECTATION,		       \
 					  left,				       \
 					  right,			       \
+					  false,			       \
 					  fmt,				       \
 					  ##__VA_ARGS__)
 
@@ -1313,6 +1401,16 @@ do {									       \
 				      KUNIT_EXPECTATION,		       \
 				      left,				       \
 				      right,				       \
+				      false,				       \
+				      fmt,				       \
+				      ##__VA_ARGS__)
+
+#define KUNIT_EXPECT_LE_CUSTOM_MSG(test, left, right, fmt, ...)		       \
+	KUNIT_BINARY_LE_MSG_ASSERTION(test,				       \
+				      KUNIT_EXPECTATION,		       \
+				      left,				       \
+				      right,				       \
+				      true,				       \
 				      fmt,				       \
 				      ##__VA_ARGS__)
 
@@ -1467,6 +1565,8 @@ do {									       \
 				  fmt,					       \
 				  ##__VA_ARGS__)
 
+//#define KUNIT_ASSERT_EQ_TYPE(test, )
+
 /**
  * KUNIT_ASSERT_EQ() - Sets an assertion that @left and @right are equal.
  * @test: The test context object.
@@ -1485,6 +1585,16 @@ do {									       \
 				      KUNIT_ASSERTION,			       \
 				      left,				       \
 				      right,				       \
+				      false,				       \
+				      fmt,				       \
+				      ##__VA_ARGS__)
+
+#define KUNIT_ASSERT_EQ_CUSTOM_MSG(test, left, right, fmt, ...)		       \
+	KUNIT_BINARY_EQ_MSG_ASSERTION(test,				       \
+				      KUNIT_ASSERTION,			       \
+				      left,				       \
+				      right,				       \
+				      true,				       \
 				      fmt,				       \
 				      ##__VA_ARGS__)
 
@@ -1506,9 +1616,18 @@ do {									       \
 					  KUNIT_ASSERTION,		       \
 					  left,				       \
 					  right,			       \
+					  false,			       \
 					  fmt,				       \
 					  ##__VA_ARGS__)
 
+#define KUNIT_ASSERT_PTR_EQ_CUSTOM_MSG(test, left, right, fmt, ...)	       \
+	KUNIT_BINARY_PTR_EQ_MSG_ASSERTION(test,				       \
+					  KUNIT_ASSERTION,		       \
+					  left,				       \
+					  right,			       \
+					  true,				       \
+					  fmt,				       \
+					  ##__VA_ARGS__)
 /**
  * KUNIT_ASSERT_NE() - An assertion that @left and @right are not equal.
  * @test: The test context object.
@@ -1527,6 +1646,7 @@ do {									       \
 				      KUNIT_ASSERTION,			       \
 				      left,				       \
 				      right,				       \
+				      false,				       \
 				      fmt,				       \
 				      ##__VA_ARGS__)
 
@@ -1549,6 +1669,7 @@ do {									       \
 					  KUNIT_ASSERTION,		       \
 					  left,				       \
 					  right,			       \
+					  false,			       \
 					  fmt,				       \
 					  ##__VA_ARGS__)
 /**
@@ -1594,6 +1715,15 @@ do {									       \
 				      fmt,				       \
 				      ##__VA_ARGS__)
 
+#define KUNIT_ASSERT_LE_CUSTOM_MSG(test, left, right, fmt, ...)		       \
+	KUNIT_BINARY_LE_MSG_ASSERTION(test,				       \
+				      KUNIT_ASSERTION,			       \
+				      left,				       \
+				      right,				       \
+				      true,				       \
+				      fmt,				       \
+				      ##__VA_ARGS__)
+
 /**
  * KUNIT_ASSERT_GT() - An assertion that @left is greater than @right.
  * @test: The test context object.
@@ -1638,6 +1768,15 @@ do {									       \
 				      fmt,				       \
 				      ##__VA_ARGS__)
 
+#define KUNIT_ASSERT_GE_CUSTOM_MSG(test, left, right, fmt, ...)		       \
+	KUNIT_BINARY_GE_MSG_ASSERTION(test,				       \
+				      KUNIT_ASSERTION,			       \
+				      left,				       \
+				      right,				       \
+				      true,				       \
+				      fmt,				       \
+				      ##__VA_ARGS__)
+
 /**
  * KUNIT_ASSERT_STREQ() - An assertion that strings @left and @right are equal.
  * @test: The test context object.
diff --git a/lib/kunit/assert.c b/lib/kunit/assert.c
index 33acdaa28a7d..202f9fdeed0e 100644
--- a/lib/kunit/assert.c
+++ b/lib/kunit/assert.c
@@ -32,8 +32,14 @@ EXPORT_SYMBOL_GPL(kunit_base_assert_format);
 void kunit_assert_print_msg(const struct kunit_assert *assert,
 			    struct string_stream *stream)
 {
-	if (assert->message.fmt)
-		string_stream_add(stream, "\n%pV", &assert->message);
+	struct kunit_binary_assert *binary_assert = container_of(
+			assert, struct kunit_binary_assert, assert);
+	if (assert->message.fmt) {
+		if (binary_assert->custom_msg == false)
+			string_stream_add(stream, "\n" KUNIT_SUBSUBTEST_INDENT "%pV", &assert->message);
+		else
+			string_stream_add(stream, KUNIT_SUBTEST_INDENT "%pV", &assert->message);
+	}
 }
 EXPORT_SYMBOL_GPL(kunit_assert_print_msg);
 
@@ -92,17 +98,19 @@ void kunit_binary_assert_format(const struct kunit_assert *assert,
 			assert, struct kunit_binary_assert, assert);
 
 	kunit_base_assert_format(assert, stream);
-	string_stream_add(stream,
-			  KUNIT_SUBTEST_INDENT "Expected %s %s %s, but\n",
-			  binary_assert->left_text,
-			  binary_assert->operation,
-			  binary_assert->right_text);
-	string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld\n",
-			  binary_assert->left_text,
-			  binary_assert->left_value);
-	string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld",
-			  binary_assert->right_text,
-			  binary_assert->right_value);
+	if (binary_assert->custom_msg == false) {
+		string_stream_add(stream,
+				  KUNIT_SUBTEST_INDENT "Expected %s %s %s, but\n",
+				  binary_assert->left_text,
+				  binary_assert->operation,
+				  binary_assert->right_text);
+		string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld\n",
+				  binary_assert->left_text,
+				  binary_assert->left_value);
+		string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld",
+				  binary_assert->right_text,
+				  binary_assert->right_value);
+	}
 	kunit_assert_print_msg(assert, stream);
 }
 EXPORT_SYMBOL_GPL(kunit_binary_assert_format);

base-commit: d43c7fb05765152d4d4a39a8ef957c4ea14d8847
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
