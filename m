Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D383DC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 03:22:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3219520B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 03:22:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeScLufo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3219520B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C629A86936;
	Thu,  1 Oct 2020 03:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVKLcF644WrH; Thu,  1 Oct 2020 03:22:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E34D86912;
	Thu,  1 Oct 2020 03:22:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30901C0889;
	Thu,  1 Oct 2020 03:22:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2050FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 03:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 00EE48690F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 03:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7LMOnKptmjq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 03:22:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0D34A85B8A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 03:22:04 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id u3so1103611pjr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 20:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EPekBU0XqiFxbqe13dgU9xm9+F21ilEGixIFqvPQR6E=;
 b=TeScLufosUcQW68ZXWEGZ2z/gGwdZ/Ki1vPZ6SwqUsmTfRsYhnTSRnVg2zDuHS8KH9
 p1l/kftN9kN/uBUTbu5C/l1+fS8/MSAd5xGkhQt6HuENuIPMi6oHFJ6t+AGCrCJ7iPm/
 AhGTD1+aXdTuft0CosoTZV6aMlsCXGUS04q10/KeurU7u4/DsCgzhYJpOGsmcak567FC
 LunSk845d2hiZVUv8OANy1eIpatAMOoZ1B3ify11T0rzaVTgQTogN993o3yF6NPZLfSJ
 AJYMAwkHiSu3hpa278eTMzQhDYEQkLZAdyRaKMhcLPbpXRc76O+7ndz/G1r4F54EbUWg
 82hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EPekBU0XqiFxbqe13dgU9xm9+F21ilEGixIFqvPQR6E=;
 b=XNGeeLPJhggVkZL82yN/VqJlqeBe0V5S0BeAs23LeoZ2ZynW9bvWBlp11h1XAbg5V+
 79KOQ8VSm987cmK1OHyi8zoreohwVG/ZWmAY8C13gfd5X3shjYPWBwSakN0WiO+dBwl0
 zdYThEJoc2OAzEX/YAX34DWitL2wQla57JHAY0xMBG7HYSFwmeypcBO+5ybWJZVgTlb8
 FfsKEBoTP7p0mk2sMQ1uFH80pyslVXerQysgB8K6S6wFkeSOW6zIFmpqh/rQ+CXtnMfL
 CUNxMknn0wU+dVj623hA3aJsh13EL0oKr59735T+aqBx7b0DTKunleikiljlJYam6ldO
 /8iQ==
X-Gm-Message-State: AOAM532XUa2htyP7Ynw40EqHLDl8m8M17LO0sR5piS/oKi6qMZofPZHW
 mNadGMHkhK+gR2fBX1hfFXs=
X-Google-Smtp-Source: ABdhPJzD76iAZ20uIZ4YYNNidhnPWITbwL8gkDQ78dgR30GfQf3Jcuia920Nrog9JnDN2l0SML0ASg==
X-Received: by 2002:a17:90a:d246:: with SMTP id
 o6mr5379815pjw.211.1601522523530; 
 Wed, 30 Sep 2020 20:22:03 -0700 (PDT)
Received: from arpitha-Inspiron-7570.lan ([106.51.240.187])
 by smtp.gmail.com with ESMTPSA id p6sm4251591pfn.63.2020.09.30.20.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 20:22:02 -0700 (PDT)
From: Arpitha Raghunandan <98.arpi@gmail.com>
To: brendanhiggins@google.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 skhan@linuxfoundation.org
Date: Thu,  1 Oct 2020 08:51:36 +0530
Message-Id: <20201001032136.27121-1-98.arpi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930144052.62720-1-98.arpi@gmail.com>
References: <20200930144052.62720-1-98.arpi@gmail.com>
MIME-Version: 1.0
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: [Linux-kernel-mentees] [RFC v2 2/2] fs: ext4: Modify inode-test.c
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
 fs/ext4/inode-test.c | 65 ++++++++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 26 deletions(-)

diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
index d62d802c9c12..f127f9123cc1 100644
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
@@ -101,7 +103,40 @@ static time64_t get_32bit_time(const struct timestamp_expectation * const test)
  */
 static void inode_test_xtimestamp_decoding(struct kunit *test)
 {
-	const struct timestamp_expectation test_data[] = {
+	struct timespec64 timestamp;
+	int i;
+
+	for (i = 0; i < NUMBER_OF_TESTCASES; ++i) {
+		struct timestamp_expectation *test_case = (struct timestamp_expectation *)get_test_case_parameters(test);
+
+		timestamp.tv_sec = get_32bit_time(test_case);
+		ext4_decode_extra_time(&timestamp,
+				       cpu_to_le32(test_case->extra_bits));
+
+		KUNIT_EXPECT_EQ_MSG(test,
+				    test_case->expected.tv_sec,
+				    timestamp.tv_sec,
+				    CASE_NAME_FORMAT,
+				    test_case->test_case_name,
+				    test_case->msb_set,
+				    test_case->lower_bound,
+				    test_case->extra_bits);
+		KUNIT_EXPECT_EQ_MSG(test,
+				    test_case->expected.tv_nsec,
+				    timestamp.tv_nsec,
+				    CASE_NAME_FORMAT,
+				    test_case->test_case_name,
+				    test_case->msb_set,
+				    test_case->lower_bound,
+				    test_case->extra_bits);
+	}
+}
+
+struct timestamp_expectation *get_test_parameters(void)
+{
+	struct timestamp_expectation *test_data = (struct timestamp_expectation *)kmalloc(sizeof(struct timestamp_expectation) * NUMBER_OF_TESTCASES, GFP_KERNEL);
+
+	const struct timestamp_expectation test_data_init[] = {
 		{
 			.test_case_name = LOWER_BOUND_NEG_NO_EXTRA_BITS_CASE,
 			.msb_set = true,
@@ -232,35 +267,13 @@ static void inode_test_xtimestamp_decoding(struct kunit *test)
 		}
 	};
 
-	struct timespec64 timestamp;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(test_data); ++i) {
-		timestamp.tv_sec = get_32bit_time(&test_data[i]);
-		ext4_decode_extra_time(&timestamp,
-				       cpu_to_le32(test_data[i].extra_bits));
+	memcpy(test_data, test_data_init, sizeof(struct timestamp_expectation) * ARRAY_SIZE(test_data_init));
 
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
+	KUNIT_CASE_PARAM(inode_test_xtimestamp_decoding, get_test_parameters, NUMBER_OF_TESTCASES, sizeof(struct timestamp_expectation)),
 	{}
 };
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
