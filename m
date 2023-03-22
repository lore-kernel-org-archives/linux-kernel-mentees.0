Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FF0C6FD1F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Mar 2023 20:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C04AE6146C;
	Wed, 22 Mar 2023 20:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C04AE6146C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GUepQa4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dr-HziC7hfMB; Wed, 22 Mar 2023 20:37:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B0E9C61446;
	Wed, 22 Mar 2023 20:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0E9C61446
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71838C0071;
	Wed, 22 Mar 2023 20:37:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27AFDC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Mar 2023 20:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01BCE40BB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Mar 2023 20:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01BCE40BB4
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GUepQa4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QRnhCoU0NPsr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Mar 2023 20:37:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 415D54031F
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 415D54031F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Mar 2023 20:37:32 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id eg48so77962356edb.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Mar 2023 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679517450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=17Wjze2y6t8a4zjcKa53kmqOgCJMw9ntTYn+G4muZxo=;
 b=GUepQa4FzpVnJdj3SwadimZqcabtTzoGmqFjHse67Uu4gkiGslqm6j9V07lBXolcOw
 r4qeHpPt5iGDTtqcul1BUlmiefkYFe/dxTn86OG3OIwWpfwxIfaQ33DwBXXT7dAMgwIB
 IpFOTnS8OofaLs15P51FTOSfr8QY9h3t6AAGjlOLh3FuZQmKqvuN5y4xNiVmFM2jLpdJ
 gVpQqIp43nAwNYTVz8BMmLKFUo6Xku8y3WQIlVOVYGVRweI/aUXPHIzTwogs+v0ogPnl
 Y+rQVDJ8dpScuVUIII53iUNnxyEkw9N2bG2DbC0nghJH8p8RD6SAT57hpC3AoZSpgFfM
 mDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679517450;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=17Wjze2y6t8a4zjcKa53kmqOgCJMw9ntTYn+G4muZxo=;
 b=ZUI+OfEfweZs0hdV1pnmwGIiZ4MZ1nnF1pvvoZh9935fVWOv8iPcxHe5gkbspIQXxx
 UoWm+xrbrtLDAVybY+80BbZJUvM3lUCnID1YTMJjPIVm5Cpgp6hGSgYPKsy0DDIRbHwh
 NiHw1T+hQHrVw0VodIL6SDeddrIf3PH1bkZRhsfyFXeF1+s5CZQl/uHh5/mrwVngHPbO
 hAJHxekuF4VYXQi5EcCQBFQg3v/1DbPhAiJ+14KqtbRWzbBAJR3JEhsq1STILSDFUWv/
 yL2BI9pSxBpB+/ZKblRYsgCJlsvWUFWbmP3TAtKFqJVOL4EOmz92Dnk6hBUWE+VnxFvq
 9xzA==
X-Gm-Message-State: AAQBX9ef2vwXosfnSyD0vKElR/JtVvcn9zRkfeXespLuQgGEm8ceVU5h
 t+0RIi1ctpn7RGWk2qMk8aw=
X-Google-Smtp-Source: AK7set/OL6xIAJnNOtJzYybsbaA8EkueTTd9ranGekne3VZDLQzuxhHshbuJ98MDBcimsyp0ApUgsA==
X-Received: by 2002:a05:6402:268e:b0:502:465:28d4 with SMTP id
 w14-20020a056402268e00b00502046528d4mr563537edd.1.1679517450319; 
 Wed, 22 Mar 2023 13:37:30 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([37.252.81.68])
 by smtp.gmail.com with ESMTPSA id
 qh7-20020a170906eca700b0092bea699124sm7671936ejb.106.2023.03.22.13.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 13:37:30 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: shuah@kernel.org
Subject: [PATCH] selftests: sched: Add more core schedule prctl calls
Date: Thu, 23 Mar 2023 00:37:24 +0400
Message-Id: <20230322203724.4757-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
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

The core sched kselftest makes prctl calls only with correct
parameters. This patch will extend this test with more core
schedule prctl calls with wrong parameters to increase code
coverage.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 tools/testing/selftests/sched/cs_prctl_test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/sched/cs_prctl_test.c b/tools/testing/selftests/sched/cs_prctl_test.c
index 25e0d95d3713..df8e4629b3b5 100644
--- a/tools/testing/selftests/sched/cs_prctl_test.c
+++ b/tools/testing/selftests/sched/cs_prctl_test.c
@@ -334,6 +334,14 @@ int main(int argc, char *argv[])
 	validate(get_cs_cookie(pid) != 0);
 	validate(get_cs_cookie(pid) == get_cs_cookie(procs[pidx].thr_tids[0]));
 
+	printf("\n## Try to pass wrong subcommand PR_SCHED_CORE_MAX = %d to prctl (shouldn't succeed)\n", PR_SCHED_CORE_MAX);
+	validate(_prctl(PR_SCHED_CORE, PR_SCHED_CORE_MAX, 0, PIDTYPE_PGID, 0) < 0
+		&& errno == EINVAL);
+
+	printf("\n## Try to pass not-null uaddr with forbidden command (shouldn't succeed)\n");
+	validate(_prctl(PR_SCHED_CORE, PR_SCHED_CORE_SHARE_TO, 0, PIDTYPE_PGID, 1) < 0
+		&& errno == EINVAL);
+
 	if (errors) {
 		printf("TESTS FAILED. errors: %d\n", errors);
 		res = 10;
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
