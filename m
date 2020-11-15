Return-Path: <SRS0=uYLy=EV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC38C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 18:59:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61AF22225B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 18:59:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pp/CNMaM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61AF22225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BD4C87205;
	Sun, 15 Nov 2020 18:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84IQUWIVXh-F; Sun, 15 Nov 2020 18:59:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 494AD87201;
	Sun, 15 Nov 2020 18:59:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4451AC0891;
	Sun, 15 Nov 2020 18:59:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31130C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 18:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 25D2520385
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 18:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id roEiRpS-nqVT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 18:59:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id DB1DC20365
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 18:59:34 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id r9so2792466pjl.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 10:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I7nyAef/ps8aO0HXexFB9vyY502uhN9jokzsj+GrHx8=;
 b=Pp/CNMaMKId7jnYeAU3sqT4Lk2cSuFGCkSH6nSyFMOU3PBB9zZJlBM8OZJF270ReYO
 zhxmkg+9hbjWbavKQQfGVy6OR+lsPilxnLPIvyjZXK+HeBSzfeclCH7TAvjZ2N0vIQJ5
 7MHF2uzt8UpMvqQl5cCG9UPWmDXrosDOq+l8TEtZHyGjje2DbjXKpgqA7BmaolJVoTFF
 mnEUb+4ZV0ALFKMCwoeTIdAUDuLN3eGqAI3pcOY7tW4vG0rGPj1COuriaKbdQ5KhZNlD
 0DvkAEszik36SSyHYTuyz9nkEhzxy0toxEc4s/3p+l6g6fbg8gSWKSd5wvwKFeEaEkke
 tdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7nyAef/ps8aO0HXexFB9vyY502uhN9jokzsj+GrHx8=;
 b=U7w2XxcYj3L5dyqn5cD9guphOQEPJs50gJLjSTaktL5gXzGMY1mNaNKZBqE316L1Nv
 AeEtbyREa+0D4yW+TZAl1W8UL0VStjfsnVuSgeXwsR7YXRy/NwX3yTQnQGPGYiZYg7wS
 dH4I9jHQzE2Y3K/ztVUUvhG8CI8HtX8ald7eYYmHlyJudFFU0jaZsyA35ce/chy5VT88
 F2BgtQj49iXCY4181znm26zSMP1b3jfULb64N8MsaHi4Ac58FxqNsgozOLqOAlRMSeGK
 54L+ocmuoZ11TwOKEXj2CT6ikMtY9EHkmIdP93m1kazskWSidrWfzwulrafts712XMQi
 15jQ==
X-Gm-Message-State: AOAM531m3YYXRb4jfP5eV6oPwRrC7zbXWehecxdwJ6yfVcmTjNQmaK7c
 wEhVRzP2zrVuNXLS+Ruvbyo=
X-Google-Smtp-Source: ABdhPJzCkyJ2SXNFSQ35eY3rZCnCWLMVKCzccpXJTTGwujRL+UY4stljaGDCiwT7POMb05FpqzOiiA==
X-Received: by 2002:a17:90a:f00a:: with SMTP id
 bt10mr11672419pjb.91.1605466774396; 
 Sun, 15 Nov 2020 10:59:34 -0800 (PST)
Received: from arpitha-Inspiron-7570.lan ([106.51.140.48])
 by smtp.gmail.com with ESMTPSA id k17sm17482645pji.50.2020.11.15.10.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 10:59:33 -0800 (PST)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, skhan@linuxfoundation.org, elver@google.com,
 yzaikin@google.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 Tim.Bird@sony.com, davidgow@google.com
Date: Mon, 16 Nov 2020 00:29:05 +0530
Message-Id: <20201115185905.169349-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201115185759.169279-1-98.arpi@gmail.com>
References: <20201115185759.169279-1-98.arpi@gmail.com>
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [PATCH v8 2/2] fs: ext4: Modify inode-test.c
	to use KUnit parameterized testing feature
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

Modify fs/ext4/inode-test.c to use the parameterized testing
feature of KUnit.

Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
Signed-off-by: Marco Elver <elver@google.com>
---
Changes v7->v8:
- Replace strcpy() with strncpy() in timestamp_expectation_to_desc()
Changes v6->v7:
- Introduce timestamp_expectation_to_desc() to convert param to
  description.
Changes v5->v6:
- No change to this patch of the patch series
Changes v4->v5:
- No change to this patch of the patch series
Changes v3->v4:
- Modification based on latest implementation of KUnit parameterized testing
Changes v2->v3:
- Marked hardcoded test data const
- Modification based on latest implementation of KUnit parameterized testing
Changes v1->v2:
- Modification based on latest implementation of KUnit parameterized testing

 fs/ext4/inode-test.c | 323 ++++++++++++++++++++++---------------------
 1 file changed, 167 insertions(+), 156 deletions(-)

diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
index d62d802c9c12..2c0c00c45c6b 100644
--- a/fs/ext4/inode-test.c
+++ b/fs/ext4/inode-test.c
@@ -80,6 +80,148 @@ struct timestamp_expectation {
 	bool lower_bound;
 };
 
+static const struct timestamp_expectation test_data[] = {
+	{
+		.test_case_name = LOWER_BOUND_NEG_NO_EXTRA_BITS_CASE,
+		.msb_set = true,
+		.lower_bound = true,
+		.extra_bits = 0,
+		.expected = {.tv_sec = -0x80000000LL, .tv_nsec = 0L},
+	},
+
+	{
+		.test_case_name = UPPER_BOUND_NEG_NO_EXTRA_BITS_CASE,
+		.msb_set = true,
+		.lower_bound = false,
+		.extra_bits = 0,
+		.expected = {.tv_sec = -1LL, .tv_nsec = 0L},
+	},
+
+	{
+		.test_case_name = LOWER_BOUND_NONNEG_NO_EXTRA_BITS_CASE,
+		.msb_set = false,
+		.lower_bound = true,
+		.extra_bits = 0,
+		.expected = {0LL, 0L},
+	},
+
+	{
+		.test_case_name = UPPER_BOUND_NONNEG_NO_EXTRA_BITS_CASE,
+		.msb_set = false,
+		.lower_bound = false,
+		.extra_bits = 0,
+		.expected = {.tv_sec = 0x7fffffffLL, .tv_nsec = 0L},
+	},
+
+	{
+		.test_case_name = LOWER_BOUND_NEG_LO_1_CASE,
+		.msb_set = true,
+		.lower_bound = true,
+		.extra_bits = 1,
+		.expected = {.tv_sec = 0x80000000LL, .tv_nsec = 0L},
+	},
+
+	{
+		.test_case_name = UPPER_BOUND_NEG_LO_1_CASE,
+		.msb_set = true,
+		.lower_bound = false,
+		.extra_bits = 1,
+		.expected = {.tv_sec = 0xffffffffLL, .tv_nsec = 0L},
+	},
+
+	{
+		.test_case_name = LOWER_BOUND_NONNEG_LO_1_CASE,
+		.msb_set = false,
+		.lower_bound = true,
+		.extra_bits = 1,
+		.expected = {.tv_sec = 0x100000000LL, .tv_nsec = 0L},
+	},
+
+	{
+		.test_case_name = UPPER_BOUND_NONNEG_LO_1_CASE,
+		.msb_set = false,
+		.lower_bound = false,
+		.extra_bits = 1,
+		.expected = {.tv_sec = 0x17fffffffLL, .tv_nsec = 0L},
+	},
+
+	{
+		.test_case_name = LOWER_BOUND_NEG_HI_1_CASE,
+		.msb_set = true,
+		.lower_bound = true,
+		.extra_bits =  2,
+		.expected = {.tv_sec = 0x180000000LL, .tv_nsec = 0L},
+	},
+
+	{
+		.test_case_name = UPPER_BOUND_NEG_HI_1_CASE,
+		.msb_set = true,
+		.lower_bound = false,
+		.extra_bits = 2,
+		.expected = {.tv_sec = 0x1ffffffffLL, .tv_nsec = 0L},
+	},
+
+	{
+		.test_case_name = LOWER_BOUND_NONNEG_HI_1_CASE,
+		.msb_set = false,
+		.lower_bound = true,
+		.extra_bits = 2,
+		.expected = {.tv_sec = 0x200000000LL, .tv_nsec = 0L},
+	},
+
+	{
+		.test_case_name = UPPER_BOUND_NONNEG_HI_1_CASE,
+		.msb_set = false,
+		.lower_bound = false,
+		.extra_bits = 2,
+		.expected = {.tv_sec = 0x27fffffffLL, .tv_nsec = 0L},
+	},
+
+	{
+		.test_case_name = UPPER_BOUND_NONNEG_HI_1_NS_1_CASE,
+		.msb_set = false,
+		.lower_bound = false,
+		.extra_bits = 6,
+		.expected = {.tv_sec = 0x27fffffffLL, .tv_nsec = 1L},
+	},
+
+	{
+		.test_case_name = LOWER_BOUND_NONNEG_HI_1_NS_MAX_CASE,
+		.msb_set = false,
+		.lower_bound = true,
+		.extra_bits = 0xFFFFFFFF,
+		.expected = {.tv_sec = 0x300000000LL,
+			     .tv_nsec = MAX_NANOSECONDS},
+	},
+
+	{
+		.test_case_name = LOWER_BOUND_NONNEG_EXTRA_BITS_1_CASE,
+		.msb_set = false,
+		.lower_bound = true,
+		.extra_bits = 3,
+		.expected = {.tv_sec = 0x300000000LL, .tv_nsec = 0L},
+	},
+
+	{
+		.test_case_name = UPPER_BOUND_NONNEG_EXTRA_BITS_1_CASE,
+		.msb_set = false,
+		.lower_bound = false,
+		.extra_bits = 3,
+		.expected = {.tv_sec = 0x37fffffffLL, .tv_nsec = 0L},
+	}
+};
+
+static void timestamp_expectation_to_desc(const struct timestamp_expectation *t,
+					  char *desc)
+{
+	int desc_length = strlen(t->test_case_name);
+
+	strncpy(desc, t->test_case_name, desc_length);
+	desc[desc_length] = '\0';
+}
+
+KUNIT_ARRAY_PARAM(ext4_inode, test_data, timestamp_expectation_to_desc);
+
 static time64_t get_32bit_time(const struct timestamp_expectation * const test)
 {
 	if (test->msb_set) {
@@ -101,166 +243,35 @@ static time64_t get_32bit_time(const struct timestamp_expectation * const test)
  */
 static void inode_test_xtimestamp_decoding(struct kunit *test)
 {
-	const struct timestamp_expectation test_data[] = {
-		{
-			.test_case_name = LOWER_BOUND_NEG_NO_EXTRA_BITS_CASE,
-			.msb_set = true,
-			.lower_bound = true,
-			.extra_bits = 0,
-			.expected = {.tv_sec = -0x80000000LL, .tv_nsec = 0L},
-		},
-
-		{
-			.test_case_name = UPPER_BOUND_NEG_NO_EXTRA_BITS_CASE,
-			.msb_set = true,
-			.lower_bound = false,
-			.extra_bits = 0,
-			.expected = {.tv_sec = -1LL, .tv_nsec = 0L},
-		},
-
-		{
-			.test_case_name = LOWER_BOUND_NONNEG_NO_EXTRA_BITS_CASE,
-			.msb_set = false,
-			.lower_bound = true,
-			.extra_bits = 0,
-			.expected = {0LL, 0L},
-		},
-
-		{
-			.test_case_name = UPPER_BOUND_NONNEG_NO_EXTRA_BITS_CASE,
-			.msb_set = false,
-			.lower_bound = false,
-			.extra_bits = 0,
-			.expected = {.tv_sec = 0x7fffffffLL, .tv_nsec = 0L},
-		},
-
-		{
-			.test_case_name = LOWER_BOUND_NEG_LO_1_CASE,
-			.msb_set = true,
-			.lower_bound = true,
-			.extra_bits = 1,
-			.expected = {.tv_sec = 0x80000000LL, .tv_nsec = 0L},
-		},
-
-		{
-			.test_case_name = UPPER_BOUND_NEG_LO_1_CASE,
-			.msb_set = true,
-			.lower_bound = false,
-			.extra_bits = 1,
-			.expected = {.tv_sec = 0xffffffffLL, .tv_nsec = 0L},
-		},
-
-		{
-			.test_case_name = LOWER_BOUND_NONNEG_LO_1_CASE,
-			.msb_set = false,
-			.lower_bound = true,
-			.extra_bits = 1,
-			.expected = {.tv_sec = 0x100000000LL, .tv_nsec = 0L},
-		},
-
-		{
-			.test_case_name = UPPER_BOUND_NONNEG_LO_1_CASE,
-			.msb_set = false,
-			.lower_bound = false,
-			.extra_bits = 1,
-			.expected = {.tv_sec = 0x17fffffffLL, .tv_nsec = 0L},
-		},
-
-		{
-			.test_case_name = LOWER_BOUND_NEG_HI_1_CASE,
-			.msb_set = true,
-			.lower_bound = true,
-			.extra_bits =  2,
-			.expected = {.tv_sec = 0x180000000LL, .tv_nsec = 0L},
-		},
-
-		{
-			.test_case_name = UPPER_BOUND_NEG_HI_1_CASE,
-			.msb_set = true,
-			.lower_bound = false,
-			.extra_bits = 2,
-			.expected = {.tv_sec = 0x1ffffffffLL, .tv_nsec = 0L},
-		},
-
-		{
-			.test_case_name = LOWER_BOUND_NONNEG_HI_1_CASE,
-			.msb_set = false,
-			.lower_bound = true,
-			.extra_bits = 2,
-			.expected = {.tv_sec = 0x200000000LL, .tv_nsec = 0L},
-		},
-
-		{
-			.test_case_name = UPPER_BOUND_NONNEG_HI_1_CASE,
-			.msb_set = false,
-			.lower_bound = false,
-			.extra_bits = 2,
-			.expected = {.tv_sec = 0x27fffffffLL, .tv_nsec = 0L},
-		},
-
-		{
-			.test_case_name = UPPER_BOUND_NONNEG_HI_1_NS_1_CASE,
-			.msb_set = false,
-			.lower_bound = false,
-			.extra_bits = 6,
-			.expected = {.tv_sec = 0x27fffffffLL, .tv_nsec = 1L},
-		},
-
-		{
-			.test_case_name = LOWER_BOUND_NONNEG_HI_1_NS_MAX_CASE,
-			.msb_set = false,
-			.lower_bound = true,
-			.extra_bits = 0xFFFFFFFF,
-			.expected = {.tv_sec = 0x300000000LL,
-				     .tv_nsec = MAX_NANOSECONDS},
-		},
-
-		{
-			.test_case_name = LOWER_BOUND_NONNEG_EXTRA_BITS_1_CASE,
-			.msb_set = false,
-			.lower_bound = true,
-			.extra_bits = 3,
-			.expected = {.tv_sec = 0x300000000LL, .tv_nsec = 0L},
-		},
-
-		{
-			.test_case_name = UPPER_BOUND_NONNEG_EXTRA_BITS_1_CASE,
-			.msb_set = false,
-			.lower_bound = false,
-			.extra_bits = 3,
-			.expected = {.tv_sec = 0x37fffffffLL, .tv_nsec = 0L},
-		}
-	};
-
 	struct timespec64 timestamp;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(test_data); ++i) {
-		timestamp.tv_sec = get_32bit_time(&test_data[i]);
-		ext4_decode_extra_time(&timestamp,
-				       cpu_to_le32(test_data[i].extra_bits));
-
-		KUNIT_EXPECT_EQ_MSG(test,
-				    test_data[i].expected.tv_sec,
-				    timestamp.tv_sec,
-				    CASE_NAME_FORMAT,
-				    test_data[i].test_case_name,
-				    test_data[i].msb_set,
-				    test_data[i].lower_bound,
-				    test_data[i].extra_bits);
-		KUNIT_EXPECT_EQ_MSG(test,
-				    test_data[i].expected.tv_nsec,
-				    timestamp.tv_nsec,
-				    CASE_NAME_FORMAT,
-				    test_data[i].test_case_name,
-				    test_data[i].msb_set,
-				    test_data[i].lower_bound,
-				    test_data[i].extra_bits);
-	}
+
+	struct timestamp_expectation *test_param =
+			(struct timestamp_expectation *)(test->param_value);
+
+	timestamp.tv_sec = get_32bit_time(test_param);
+	ext4_decode_extra_time(&timestamp,
+			       cpu_to_le32(test_param->extra_bits));
+
+	KUNIT_EXPECT_EQ_MSG(test,
+			    test_param->expected.tv_sec,
+			    timestamp.tv_sec,
+			    CASE_NAME_FORMAT,
+			    test_param->test_case_name,
+			    test_param->msb_set,
+			    test_param->lower_bound,
+			    test_param->extra_bits);
+	KUNIT_EXPECT_EQ_MSG(test,
+			    test_param->expected.tv_nsec,
+			    timestamp.tv_nsec,
+			    CASE_NAME_FORMAT,
+			    test_param->test_case_name,
+			    test_param->msb_set,
+			    test_param->lower_bound,
+			    test_param->extra_bits);
 }
 
 static struct kunit_case ext4_inode_test_cases[] = {
-	KUNIT_CASE(inode_test_xtimestamp_decoding),
+	KUNIT_CASE_PARAM(inode_test_xtimestamp_decoding, ext4_inode_gen_params),
 	{}
 };
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
