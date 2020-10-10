Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA616C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 14:56:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FB372080C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 14:56:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0bHV9R8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FB372080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD23287747;
	Sat, 10 Oct 2020 14:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lZiPm9aqGETI; Sat, 10 Oct 2020 14:56:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 60C7787672;
	Sat, 10 Oct 2020 14:56:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BF72C07FF;
	Sat, 10 Oct 2020 14:56:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 379AAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 14:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3083D87672
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 14:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6XWT6B3ANBYZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 14:56:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8C62F86D94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 14:56:08 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id r10so9800528pgb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sGNQhmhArB3UYXjNX9OpITFlGmNkphwKVloKhJ0FzDk=;
 b=S0bHV9R8IhVO9EMs0iK7yrbR9/nG29nDS7qurazS5LxD8zbNK3TonOw+ODuwYkr0Xz
 iAz6LIcuk3FOv+wYDLTUYGdlgftQHT6fH4JA+X76wXWQzQNbuIfCB4pkkDfB11e/EXcS
 caPiNhdvF920dM+R+qVUOmbfG6kDe12QiytZyXlMmgMLBEnI62woruxD1K0mC+UiTHd0
 gN+Jq8PKyKrY2n6lL494N13JOjevEzTZbFGelaqVhCsw8NVJhTUkHotnbUGCG58qaWs9
 XaHEViNfP3r83XE3caXzP/F+2iRylYzLc4FhHD1DUBMleXO9DDAZAcvT6fDYhVHJQUGb
 lx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sGNQhmhArB3UYXjNX9OpITFlGmNkphwKVloKhJ0FzDk=;
 b=ulcImROc5myHhPjMmVhz70gewRHpJ6VsnqQcMc5ax7Dw3dNdmL6+hygaTEFdH6QOg4
 myKxtOl8QWPeI/TL+wmj9z+tTkJBqQiNUPmO09GUWFDBLh8giZmWO1X30chYS4A3M/k1
 kPPSDOhEogKO5wQYtZdTdruWY9ftRUv/+1rXYdWB5aLizQwTFBu6CfiyUAc/RBCExnIC
 F7/ZLn63y8TcYb1LYjVwBQlNc5I5x52RlfccSsIc+cj0mPDzVAwnDuyc0zJf9lGc1iFx
 Xn4WavEHRziWx6zwsu4u0YYLNs1vYoU/EumqJQZ2rG8kJL/RkCMDjxzWhA+y879OYj81
 CudQ==
X-Gm-Message-State: AOAM5339zcIVHq3hv5NNTJ5zTEYzBZthvGQlzfNM8IXP4uBy9U9QanuZ
 6VNxVC6t02J/TS52XJ7gkTk=
X-Google-Smtp-Source: ABdhPJwCEv+ay9FATziABv5KBkBcSRyRNFrawVj/C+EPxIiukIjt9wNklPDflMWdoEMYv4NU11s6cg==
X-Received: by 2002:a17:90a:b902:: with SMTP id
 p2mr10309905pjr.15.1602341768089; 
 Sat, 10 Oct 2020 07:56:08 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([106.51.240.187])
 by smtp.gmail.com with ESMTPSA id j19sm14304252pfi.51.2020.10.10.07.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 07:56:07 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, skhan@linuxfoundation.org, yzaikin@google.com,
 elver@google.com, tytso@mit.edu, adilger.kernel@dilger.ca
Date: Sat, 10 Oct 2020 20:25:44 +0530
Message-Id: <20201010145544.61034-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201010145357.60886-1-98.arpi@gmail.com>
References: <20201010145357.60886-1-98.arpi@gmail.com>
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [PATCH 2/2] fs: ext4: Modify inode-test.c to
	use KUnit parameterized testing feature
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

Modifies fs/ext4/inode-test.c to use the parameterized testing
feature of KUnit.

Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
---
 fs/ext4/inode-test.c | 64 +++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 28 deletions(-)

diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
index d62d802c9c12..691ef0a4ffe1 100644
--- a/fs/ext4/inode-test.c
+++ b/fs/ext4/inode-test.c
@@ -72,6 +72,8 @@
 #define UPPER_BOUND_NONNEG_EXTRA_BITS_1_CASE\
 	"2446-05-10 Upper bound of 32bit >=0 timestamp. All extra sec bits on"
 
+#define NUMBER_OF_TESTCASES 16
+
 struct timestamp_expectation {
 	const char *test_case_name;
 	struct timespec64 expected;
@@ -101,7 +103,36 @@ static time64_t get_32bit_time(const struct timestamp_expectation * const test)
  */
 static void inode_test_xtimestamp_decoding(struct kunit *test)
 {
-	const struct timestamp_expectation test_data[] = {
+	struct timespec64 timestamp;
+
+	struct timestamp_expectation *test_data =
+		(struct timestamp_expectation *)get_test_case_parameters(test);
+
+	timestamp.tv_sec = get_32bit_time(test_data);
+	ext4_decode_extra_time(&timestamp,
+			       cpu_to_le32(test_data->extra_bits));
+
+	KUNIT_EXPECT_EQ_MSG(test,
+			    test_data->expected.tv_sec,
+			    timestamp.tv_sec,
+			    CASE_NAME_FORMAT,
+			    test_data->test_case_name,
+			    test_data->msb_set,
+			    test_data->lower_bound,
+			    test_data->extra_bits);
+	KUNIT_EXPECT_EQ_MSG(test,
+			    test_data->expected.tv_nsec,
+			    timestamp.tv_nsec,
+			    CASE_NAME_FORMAT,
+			    test_data->test_case_name,
+			    test_data->msb_set,
+			    test_data->lower_bound,
+			    test_data->extra_bits);
+}
+
+struct timestamp_expectation *get_test_parameters(void)
+{
+	static struct timestamp_expectation test_data[] = {
 		{
 			.test_case_name = LOWER_BOUND_NEG_NO_EXTRA_BITS_CASE,
 			.msb_set = true,
@@ -231,36 +262,13 @@ static void inode_test_xtimestamp_decoding(struct kunit *test)
 			.expected = {.tv_sec = 0x37fffffffLL, .tv_nsec = 0L},
 		}
 	};
-
-	struct timespec64 timestamp;
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
+	return test_data;
 }
 
 static struct kunit_case ext4_inode_test_cases[] = {
-	KUNIT_CASE(inode_test_xtimestamp_decoding),
+	KUNIT_CASE_PARAM(inode_test_xtimestamp_decoding,
+			get_test_parameters, NUMBER_OF_TESTCASES,
+			sizeof(struct timestamp_expectation)),
 	{}
 };
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
