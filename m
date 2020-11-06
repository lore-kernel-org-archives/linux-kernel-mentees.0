Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B4EC388F2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 18:29:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3FBB208FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 18:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="annsnH9O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3FBB208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7FE4B2E11F;
	Fri,  6 Nov 2020 18:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rxJC-RdEfgQ; Fri,  6 Nov 2020 18:29:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8F9772E11C;
	Fri,  6 Nov 2020 18:29:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89E1FC0893;
	Fri,  6 Nov 2020 18:29:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E453C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 853C52E11F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LjgFZ83-4mrf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:29:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id DBB612E11C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:29:14 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 10so2128584pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Nov 2020 10:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HYhDfQMnA8bM9wtcRRrDdHZK/wq2QRJvczI4RdmbDCY=;
 b=annsnH9OZkzeFvG281LCtmgRp3SuP2UAeOhU72BgJJ8EocqqMXAOa6JXMDyV7qh7hV
 S7KFMZ8OHzovM9jgmwWyzqW4M0UozD/BGOFoVPCx1SFNHeLCGHDBrWD/VJHpQ1LLRKQM
 hnn1ayh8uyRt44minKIr/9CB7+oxiKRrl1svRjnzKo4nNBL626Li5Gl7B1hbmfdglsqL
 enXk50DruLGt3hM5EFoEMqHs35hJH20beodlP3dWxC9zaTHNCKyHgsrluAWd6fkL6OeQ
 XHpuyQLKbh2nt70W4nVtLV7117hYDRQsvq1WKpIyoODE3WttYQMMabhcBtANv0yNoe20
 E1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HYhDfQMnA8bM9wtcRRrDdHZK/wq2QRJvczI4RdmbDCY=;
 b=WbiEssIP+r/ZRjvjSbnF8qP2RYZX/IuLI8diZVlmEZJPwdn7yhgsNUJBigBdFJF1Wq
 ecmkLdPU1oMrnyM8EHUlQaLxtVbZlwIfHLuewMBaN3nQd6h6IdTZ6h5EJimesZ2HmrB+
 x9rfWGqht4FzNOCHI297IGoeIFG6RZDG4rPNl+42DBMpPLLOxdTj2btSO4Vl5ivyqUrZ
 CiS95gAoN5qIeheUrsW1Ui6k4pUVIiJ4QFmbgy7r6ISbzuaBv2KJdRHK99S5ry4YNX2S
 c/i6TDNoYaoRBXgM9Sgcb4/qINvb/jfAxJuIhhmEjY+xhicjheC72LycClcjCvs8oVRc
 w+cA==
X-Gm-Message-State: AOAM530pz19bee34XzA0EKkA4fZEQB3JfDovgp7ZO42D/TrQZWQ/XSkG
 4cC0HYz7nmoAkUV4sRzwPd0=
X-Google-Smtp-Source: ABdhPJwWjuWxcVSbkjt+waGG0BB8ahDKwZAv0fjCNX5ow9o1xzHmLkjr2pksv/0Ng7Q8iXvXZvLdbw==
X-Received: by 2002:a17:90a:6288:: with SMTP id
 d8mr940385pjj.210.1604687354531; 
 Fri, 06 Nov 2020 10:29:14 -0800 (PST)
Received: from arpitha-Inspiron-7570.lan ([106.51.243.217])
 by smtp.gmail.com with ESMTPSA id h68sm2972296pfe.74.2020.11.06.10.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:29:13 -0800 (PST)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, skhan@linuxfoundation.org, elver@google.com,
 yzaikin@google.com, tytso@mit.edu, adilger.kernel@dilger.ca
Date: Fri,  6 Nov 2020 23:58:50 +0530
Message-Id: <20201106182850.30602-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106182657.30492-1-98.arpi@gmail.com>
References: <20201106182657.30492-1-98.arpi@gmail.com>
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [PATCH v5 2/2] fs: ext4: Modify inode-test.c
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
---
Changes v4->v5:
- No change to this patch of the patch series
Changes v3->v4:
- Modification based on latest implementation of KUnit parameterized testing
Changes v2->v3:
- Marked hardcoded test data const
- Modification based on latest implementation of KUnit parameterized testing
Changes v1->v2:
- Modification based on latest implementation of KUnit parameterized testing

 fs/ext4/inode-test.c | 314 ++++++++++++++++++++++---------------------
 1 file changed, 158 insertions(+), 156 deletions(-)

diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
index d62d802c9c12..ebf1b1af4f1d 100644
--- a/fs/ext4/inode-test.c
+++ b/fs/ext4/inode-test.c
@@ -80,6 +80,139 @@ struct timestamp_expectation {
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
+KUNIT_ARRAY_PARAM(ext4_inode, test_data);
+
 static time64_t get_32bit_time(const struct timestamp_expectation * const test)
 {
 	if (test->msb_set) {
@@ -101,166 +234,35 @@ static time64_t get_32bit_time(const struct timestamp_expectation * const test)
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
