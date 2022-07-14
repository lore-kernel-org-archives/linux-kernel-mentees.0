Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF7EC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jul 2022 16:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC5BF40547;
	Thu, 14 Jul 2022 16:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC5BF40547
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qBHQS5KP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sAskhljBNva3; Thu, 14 Jul 2022 16:16:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EA4B040114;
	Thu, 14 Jul 2022 16:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA4B040114
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6A73C0033;
	Thu, 14 Jul 2022 16:16:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7457C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jul 2022 16:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E9E042667
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jul 2022 16:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E9E042667
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qBHQS5KP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7LA8bwlowZ2f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jul 2022 16:16:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A00AC4265D
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A00AC4265D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jul 2022 16:16:44 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id f65so1970756pgc.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jul 2022 09:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zfIj5qyV6W5yq5ox/J/cFoftvvx5vCMig2RVtH35Sq0=;
 b=qBHQS5KPrKzSzz4fy6T9DYMJgzLJNlkHeAEn5yHBzp9NxCz6UhFfzv4tg6UsDM/DdS
 6tmyS/NoJZcPWLEz9WhqiHGAOCsnhKIg+3swRPT2CgDu4l/h52SKR8U/PmzZVF9uEA8M
 7EAOfpgwvf/g8lLvmqVU2kdTccflOzpQyhyjtHo2z+KpOvCXhvpTeODyjsU010zbEH9m
 9imXtC9n1DQC9aKUZ7LPzp5uB0hoyfSSC167M/ozlhZHCdKFnntxxYHMNpKyTZ6gffpb
 hQHaiFnmOePz2wCpRyxzelsoROPFJhDlEyTbZ9Y9M40tpzPdNZJ8pxMm6xKfDNz1UWce
 BUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zfIj5qyV6W5yq5ox/J/cFoftvvx5vCMig2RVtH35Sq0=;
 b=W/q9bUvu6NduAj5WCBDoyY6vn2JE2NK+vjgRqC8KZMKNHhKIT96W+U3NCiaZfFGQyT
 0Gdq+fAiEsa2RYPF77M3AOTSuuPJGVqTuGR6L0Lm/yI+wI7+18aPDxcHyYu+VSD0FOCt
 VxdVbe+OfYS/g91K09CizX52AlzQ/odYAskCTz91ywOxTbcuW03aXpszpbJZ9Hb5UFSA
 sUVe66JqBkkIugarwxnibxEkXV97wfHVu5lxTxSY+xXSUld0OrSfezm1QyVskJazc4I4
 +ZDaySi12d51+GEYH80Uzbeo4KdDM0Ctt7x7YZWBgX2GU/Q1eSeMGNRilYOAIH4v1g0G
 sr6g==
X-Gm-Message-State: AJIora/JfEKFsPG16HJT3b9nVD2STXQNwIVm+vkEkz4SV44oTD3hUteN
 S1t8zr0r2/lXOR+6nK7Zs74=
X-Google-Smtp-Source: AGRyM1sbmcRbyKVTh1//ROU61N3Fczq0SjQ7kXeTzNSuebeT5GQeN8KQgtCY2GGlhG/jcEIxLci7nQ==
X-Received: by 2002:a05:6a00:1312:b0:528:2ed8:7e35 with SMTP id
 j18-20020a056a00131200b005282ed87e35mr8900166pfu.13.1657815403880; 
 Thu, 14 Jul 2022 09:16:43 -0700 (PDT)
Received: from fedora.. ([103.230.148.189]) by smtp.gmail.com with ESMTPSA id
 p10-20020a170902780a00b0016b68cf6ae5sm1654281pll.226.2022.07.14.09.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 09:16:42 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: shuah@kernel.org
Subject: [PATCH v2] selftests/kcmp: Make the test output consistent and clear
Date: Thu, 14 Jul 2022 21:46:29 +0530
Message-Id: <20220714161629.5488-1-gautammenghani201@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <bdcac68c-e227-6376-9d71-aa667596c4e6@linuxfoundation.org>
References: <bdcac68c-e227-6376-9d71-aa667596c4e6@linuxfoundation.org>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Gautam Menghani <gautammenghani201@gmail.com>
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

In the KCMP test, currently the functions ksft_print_header() and
ksft_set_plan() are not used due to which an error appears in the
output. Also, the result of the tests is being printed multiple times
because the output is printed by both ksft_print_cnts() and
ksft_exit_fail()/ksft_exit_pass(). 
This patch makes the output format of this test consistent. Currently the
output is as follows:

+TAP version 13
+1..1
+# selftests: kcmp: kcmp_test
+# pid1:  45814 pid2:  45815 FD:  1 FILES:  1 VM:  2 FS:  1 SIGHAND:  2 
+  IO:  0 SYSVSEM:  0 INV: -1
+# PASS: 0 returned as expected
+# PASS: 0 returned as expected
+# PASS: 0 returned as expected
+# # Planned tests != run tests (0 != 3)
+# # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0
+# # Planned tests != run tests (0 != 3)
+# # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0
+# # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
+ok 1 selftests: kcmp: kcmp_test

With this patch applied the output is as follows:

+TAP version 13
+1..1
+# selftests: kcmp: kcmp_test
+# TAP version 13
+# 1..3
+# pid1:  46330 pid2:  46331 FD:  1 FILES:  2 VM:  2 FS:  2 SIGHAND:  1 
+  IO:  0 SYSVSEM:  0 INV: -1
+# PASS: 0 returned as expected
+# PASS: 0 returned as expected
+# PASS: 0 returned as expected
+# # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0
+ok 1 selftests: kcmp: kcmp_test


Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
---
Changes in v2:
1. Describe the changes in detail.

 tools/testing/selftests/kcmp/kcmp_test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kcmp/kcmp_test.c b/tools/testing/selftests/kcmp/kcmp_test.c
index 6ea7b9f37a41..25110c7c0b3e 100644
--- a/tools/testing/selftests/kcmp/kcmp_test.c
+++ b/tools/testing/selftests/kcmp/kcmp_test.c
@@ -88,6 +88,9 @@ int main(int argc, char **argv)
 		int pid2 = getpid();
 		int ret;
 
+		ksft_print_header();
+		ksft_set_plan(3);
+
 		fd2 = open(kpath, O_RDWR, 0644);
 		if (fd2 < 0) {
 			perror("Can't open file");
@@ -152,7 +155,6 @@ int main(int argc, char **argv)
 			ksft_inc_pass_cnt();
 		}
 
-		ksft_print_cnts();
 
 		if (ret)
 			ksft_exit_fail();
@@ -162,5 +164,5 @@ int main(int argc, char **argv)
 
 	waitpid(pid2, &status, P_ALL);
 
-	return ksft_exit_pass();
+	return 0;
 }
-- 
2.36.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
