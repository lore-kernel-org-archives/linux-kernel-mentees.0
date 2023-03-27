Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9701C6FD1D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Mar 2023 20:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4126D401D8;
	Mon, 27 Mar 2023 20:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4126D401D8
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V3LSYPuP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18YPwbBqYGyp; Mon, 27 Mar 2023 20:19:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 39AD940017;
	Mon, 27 Mar 2023 20:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39AD940017
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E843C007E;
	Mon, 27 Mar 2023 20:19:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBCEFC007A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 20:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2B1281980
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 20:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2B1281980
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V3LSYPuP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yI5T2sYI7RkO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 20:19:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2431818E6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2431818E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 20:19:17 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-93075ee221bso38311666b.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Mar 2023 13:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679948356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZStOGFomeC4iKiC4ctCI52dZV1VdmoFJa9Q3XiMGXSQ=;
 b=V3LSYPuPqzvEay/j0Vd+Wq1wKBAo2Cmzkvh1uIm0oyisM41675tJ4TzpZUP4eIss1A
 MMWYaYdcfdJMs9+YyDCKovpEgfoMIwZf/RBpeMrsHukVwudu5Y1xMdDtdBvm1h0NXv9F
 XQqqb6fL8t0I6IbTLyAaHliB3jM4jQ7ZH0xqOSRJflVC8T/osiQ3nFtt456BaEiQfXdq
 lYAv5zuM9n6Cg8hOBhHqQgAfz226UT+0TOvQzOO2bFnH95QQFEPlHCqPs9z/U1dMGlU0
 esmUIcX6C4Jdg3VRtqm7X6LV3kNXUVgXpCalZuibhkZFZGCfpyao0fBaJIkhAW08Pkf3
 Cz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679948356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZStOGFomeC4iKiC4ctCI52dZV1VdmoFJa9Q3XiMGXSQ=;
 b=7kCpBj7IgKPic4vePY81QeBcSjFAWj2UOQZtyGMqGVGCxSAeDjKRyaTGJJlJZJQ67B
 Vz5wD7yhPLxYwxtm0FKtdf9W4jQavNHnDS5hJpVAb429nCF6TeS4ftW24nc72W2LNtUz
 rSh5oNBIJ9G2ZeWYwuyxCw3jLmkbVSeltb3D0EHgqWt+BNJ/WIOtafwG0zbmK12a/Eq2
 Co5BK9Xrn9O71sZ8byxUKVslFxOQxqfUWeZ1zsubBfh+P1o1LX3wmh1bOVoef9Xkd/er
 QOvg8a0hpgRa8OWH3fO4xgoz2YaPvbY2tgVUW9MAtHuc9+uMPhSISMKDM/hzoj/i+YO7
 yuZA==
X-Gm-Message-State: AAQBX9cy54u5d+U9WhbQVIkUF5ceYDHRHMfwdlN0b8oAJO3hLyLYPa6W
 cf5ZlRseBne31VD9m1GfTtc=
X-Google-Smtp-Source: AKy350ZMc3752XxDaCDZ5LFOm0UEG9WexjqCekr5a9D9aOyh+N2fOVWJOxSCcjbVM0CjfJcZN0gABQ==
X-Received: by 2002:a17:906:1ce:b0:931:4285:ea1d with SMTP id
 14-20020a17090601ce00b009314285ea1dmr7796064ejj.5.1679948355765; 
 Mon, 27 Mar 2023 13:19:15 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([37.252.81.68])
 by smtp.gmail.com with ESMTPSA id
 ml23-20020a170906cc1700b0092ce8344078sm14440118ejb.33.2023.03.27.13.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 13:19:15 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: skhan@linuxfoundation.org
Subject: [PATCH v2] selftests: sched: Add more core schedule prctl calls
Date: Tue, 28 Mar 2023 00:18:55 +0400
Message-Id: <20230327201855.121821-1-ivan.orlov0322@gmail.com>
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
V1 -> V2: Unnecessary printing removed - 'validate' will
automatically print the message in case or error

 tools/testing/selftests/sched/cs_prctl_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/sched/cs_prctl_test.c b/tools/testing/selftests/sched/cs_prctl_test.c
index 25e0d95d3713..3e1619b6bf2d 100644
--- a/tools/testing/selftests/sched/cs_prctl_test.c
+++ b/tools/testing/selftests/sched/cs_prctl_test.c
@@ -334,6 +334,12 @@ int main(int argc, char *argv[])
 	validate(get_cs_cookie(pid) != 0);
 	validate(get_cs_cookie(pid) == get_cs_cookie(procs[pidx].thr_tids[0]));
 
+	validate(_prctl(PR_SCHED_CORE, PR_SCHED_CORE_MAX, 0, PIDTYPE_PGID, 0) < 0
+		&& errno == EINVAL);
+
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
