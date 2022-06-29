Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282F8C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jun 2022 19:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86AEC4034D;
	Wed, 29 Jun 2022 19:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86AEC4034D
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bYonWsLg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id amcS6xWb1AnC; Wed, 29 Jun 2022 19:28:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3994540352;
	Wed, 29 Jun 2022 19:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3994540352
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13B4CC0021;
	Wed, 29 Jun 2022 19:28:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C182C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jun 2022 19:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 697E68138E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jun 2022 19:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 697E68138E
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bYonWsLg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GwjrJ4PD4b_f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jun 2022 19:28:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F2B581366
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F2B581366
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jun 2022 19:28:31 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id 128so15974440pfv.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jun 2022 12:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n0L9Ak2rih0QWqwb2iIsAHFOk1bnc7dnsv5n94hZROM=;
 b=bYonWsLg6KUobudvYp5urS+ZmI6RFZXKRiXZ0m30zyE3tdJ6qP7MTjQWVWhimzvul2
 go8d+H1wP+izwQlxcMlCuLUtyBDtzI4F+IQHvYyEdolqcddO9zWnC9i9RxhEB+4OHILp
 41XoZK+JygXqEpucvuxto3mMa4DtgtBL1LWOE06yTHNg2JjRmTZMagWfseU32vToryL5
 8iOl06VxW6w0mNSqDyXAdt4TwuanqT6zO2HmXKgap6HTdmLXikRIvw7YCP+35ps6+E8C
 8HX3KuCpRlx5dgHmXiOR+1HSta+dW28o4rFLGRKNmc5SSSJPR+Xe/Yj3RNFBGgpDcpve
 96wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n0L9Ak2rih0QWqwb2iIsAHFOk1bnc7dnsv5n94hZROM=;
 b=ysqEx+SqkSN+JCUC/G3fFIOIKsBjQ8XoxVVDvOC/kVwO3fXtDKhCb0xPvOT/Vej7rF
 ztPoFegiwE8OLUBj0si1wMuaIySK71avxi8xOv+dqszreW1vDy3BreZVKkj/lrRipSqR
 lWe4dx3/v3irTCNTTVbW8ncFdLCI/EffZyH+fvtOQpuWyMeaDsGMymdpg1hgh9iVf6Zc
 oaFA6+gxyiSp2W/ueS08kcWYsFrAoOE+banxazhXzi69OJSmcUwP5fHXGtKG5XdcKvED
 tnPbxCPC3Kx7FRkNv+sc64eYg3b98Q+yQQdDExWAoRY5YPuqcy/GIBqzk+0P9KC9Xwcp
 vt5g==
X-Gm-Message-State: AJIora/on206boeZZrbr6+5fZLEfGhG52C7swHafOg4e/sVasG/ixMKw
 SSvJKUsIqoCvpYeLS/LrjAI=
X-Google-Smtp-Source: AGRyM1uu6WVpdI6B9X7lgvzZqLrkX6ko+p/ABP8tLoZC1Fng+vpKXrtPAltW+JdfMiIq6MQrRB4sPA==
X-Received: by 2002:a05:6a00:2356:b0:525:7c6e:1dca with SMTP id
 j22-20020a056a00235600b005257c6e1dcamr11522615pfj.28.1656530910863; 
 Wed, 29 Jun 2022 12:28:30 -0700 (PDT)
Received: from fedora.. ([103.230.148.187]) by smtp.gmail.com with ESMTPSA id
 k11-20020a6555cb000000b0040d87299ca3sm11512389pgs.54.2022.06.29.12.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 12:28:30 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: shuah@kernel.org
Subject: [PATCH] selftests/kcmp: Make the test output consistent and clear
Date: Thu, 30 Jun 2022 00:58:22 +0530
Message-Id: <20220629192822.47577-1-gautammenghani201@gmail.com>
X-Mailer: git-send-email 2.36.1
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

Make the output format of this test consistent. Currently the output is
as follows:

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
