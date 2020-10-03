Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA90C41604
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 14:51:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B1B8206B8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 14:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h876pcXr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B1B8206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F182F86151;
	Sat,  3 Oct 2020 14:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vqhRBmnTI_Qt; Sat,  3 Oct 2020 14:51:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8301586121;
	Sat,  3 Oct 2020 14:51:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 727EFC016F;
	Sat,  3 Oct 2020 14:51:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39A7FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 285088715E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvbVOdm0mZqN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:51:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9002487132
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:51:46 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id t7so2921713pjd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 07:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L0MIt/M9+sxzyQr12xuZB6ma1VSDz+qa9YzowS+lrvo=;
 b=h876pcXrCZIK7pMdN10PojF4AW1q9nAQvnBL1zrXw8GTY2PsHQ97b1KuRweFcbTrYG
 mchvmaDyQUudTkQW5jSpvR/fuBi9MWaqzYbBQ9esqGwRmjWJlhy0ZfTT0YKWOcoVE5og
 jhs3BpE7dWXg/t2WBWijUu01QHbBlZNAjipbIW7EvEzDNjrDSvxVkeYLruFGWQo1a0gw
 j9qHTxTdpbC50qTolx+oatD8dxv46w1Y2O6Lgn1S1u4xP03T/HYN557G5Y0bebROYW/N
 gsxH6XUSGamNzl53U0etRh/YXM9Y+Q3ULDy2YtjYkKd1YqHWcw76cYsW0mZ4fEsvyjiP
 2DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L0MIt/M9+sxzyQr12xuZB6ma1VSDz+qa9YzowS+lrvo=;
 b=tdXc8AbviSwPKsL179RpJbZvuyRQeSf8kOZhI6Dy8o8HW1jjZZx6lyXPsP9mGqkg4D
 +mclhglFwdWAj268nSH3+PSLG65r8aotpytvOe0/uLf9yGw0SNnxsatwbGwOBpshr9jv
 VYCZnyu5KtLSDdzgR/1pAr6UVqqKsh8BIUcD620QfZ/XX4hJoh/fni/AgiMMu0QGviAC
 z3VjhnGlkWnr7c6ccDgYus5RoBK2Df4FbVj0q3i/jFITRvGDzQD90x4rP/J6Ft9h5eM0
 fPlJVsLGLTtiZoF865hn4hDV+m79UWpOGT4ZzhgKRAt8ZRc/AlIHgh+MxQYin06s9FBB
 AGKA==
X-Gm-Message-State: AOAM532yKJmoESCNaYxfNtYhgDYLtU/y0/1kkJzZJ1xM0wT/LbqrMeJZ
 G3a1u+0oEH8UeJVi8Cl/a3I=
X-Google-Smtp-Source: ABdhPJx0oHUG80QL+RC9ig0TGsW8u9ZXYvrK+NvnBhBIcxggtPiheCusykxttJgWriT7O9PGLcaMYw==
X-Received: by 2002:a17:90b:108f:: with SMTP id
 gj15mr7456413pjb.62.1601736706161; 
 Sat, 03 Oct 2020 07:51:46 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([106.51.240.187])
 by smtp.gmail.com with ESMTPSA id 25sm6046258pfj.35.2020.10.03.07.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 07:51:45 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 skhan@linuxfoundation.org
Date: Sat,  3 Oct 2020 20:21:15 +0530
Message-Id: <20201003145115.13145-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201003144807.13036-1-98.arpi@gmail.com>
References: <20201003144807.13036-1-98.arpi@gmail.com>
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [RFC v3 2/2] fs: ext4: Modify inode-test.c
	to use KUnit parameterized testing
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
 fs/ext4/inode-test.c | 69 +++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
index d62d802c9c12..e262fef505b3 100644
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
@@ -101,7 +103,39 @@ static time64_t get_32bit_time(const struct timestamp_expectation * const test)
  */
 static void inode_test_xtimestamp_decoding(struct kunit *test)
 {
-	const struct timestamp_expectation test_data[] = {
+	struct timespec64 timestamp;
+
+	struct timestamp_expectation *test_case =
+		(struct timestamp_expectation *)get_test_case_parameters(test);
+
+	timestamp.tv_sec = get_32bit_time(test_case);
+	ext4_decode_extra_time(&timestamp,
+			       cpu_to_le32(test_case->extra_bits));
+
+	KUNIT_EXPECT_EQ_MSG(test,
+			    test_case->expected.tv_sec,
+			    timestamp.tv_sec,
+			    CASE_NAME_FORMAT,
+			    test_case->test_case_name,
+			    test_case->msb_set,
+			    test_case->lower_bound,
+			    test_case->extra_bits);
+	KUNIT_EXPECT_EQ_MSG(test,
+			    test_case->expected.tv_nsec,
+			    timestamp.tv_nsec,
+			    CASE_NAME_FORMAT,
+			    test_case->test_case_name,
+			    test_case->msb_set,
+			    test_case->lower_bound,
+			    test_case->extra_bits);
+}
+
+struct timestamp_expectation *get_test_parameters(void)
+{
+	struct timestamp_expectation *test_data = (struct timestamp_expectation *)
+		kmalloc(sizeof(struct timestamp_expectation) * NUMBER_OF_TESTCASES, GFP_KERNEL);
+
+	const struct timestamp_expectation test_data_init[] = {
 		{
 			.test_case_name = LOWER_BOUND_NEG_NO_EXTRA_BITS_CASE,
 			.msb_set = true,
@@ -232,35 +266,16 @@ static void inode_test_xtimestamp_decoding(struct kunit *test)
 		}
 	};
 
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
+	memcpy(test_data, test_data_init,
+		sizeof(struct timestamp_expectation) * ARRAY_SIZE(test_data_init));
+
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
