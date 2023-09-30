Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AAEE77373
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Sep 2023 12:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2108E60FD4;
	Sat, 30 Sep 2023 12:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2108E60FD4
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gTjYpM5H
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sMjGWHzuaGrg; Sat, 30 Sep 2023 12:25:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C411160F0F;
	Sat, 30 Sep 2023 12:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C411160F0F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94D02C0039;
	Sat, 30 Sep 2023 12:25:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90F78C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Sep 2023 12:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BD5740127
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Sep 2023 12:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BD5740127
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gTjYpM5H
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mqDYLcqPCyL4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Sep 2023 12:25:33 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD9DD40108
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Sep 2023 12:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD9DD40108
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-277564f049dso8010592a91.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Sep 2023 05:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696076733; x=1696681533;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NxFdnF+d4GELCyBnxXMqf2wy+/Apt8AHrNw5TDGtQhE=;
 b=gTjYpM5HGtVM3Tqy1F2pAlAFqhkT2HmEdzTFqcw+a0xt8q7NkT9w+vvJe4ThB0U1+H
 EN+chumvsGoHlKxO88njpTC93WdAbAARsgEQ4tggkSfXDrpW7mye5K61yKGutOuES5fk
 UiDUL9P4ks3JhQ6zTfFPlqSBDz+NQpHI2trngNKXWYNQ73TacIvFTE+5Z4S06sh/qe+E
 /9DQ7bp4v4W2A29oZkOcoe6UZaz8s2y5OdXUVQM3RANNTE6eY1UGwf3pLA/hwY9dA0bD
 bVmsHhMSYUuonPKt0WHImldXzmTSty8UHXo3YwEqTSVSglmm38QUhaJEqM5Rl3dMeYUA
 ri7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696076733; x=1696681533;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NxFdnF+d4GELCyBnxXMqf2wy+/Apt8AHrNw5TDGtQhE=;
 b=lodryr+WM9LH18tr9EQLSWeMVufnjTMOsC7xW/AnE5TeoqXBqW+HLPRyhY4oX3gZC6
 8SoaRJN/zw3IkKPjTXRMNwD8ple5NF6VboDGhSm0eCF1aweJsh2smFvUHH2aC1wEDMqu
 xn0VutZ6H8cduDg6ki8XFTJ5MrK4cA9BAAvFH3QOc8JvMwK04Auo7v0a6nMgUh9JywOy
 vnFU9iKrEOrTAQtnb3tkPbS1BQOHqbXy+ztA32mexPMquOzWfGS9LufL2xgi7c2oGBvw
 P6MiRgka4nhLcHukI8w9b5HZ7DgksioopdxirelywxUCloGo6nzErwK+uzUGy8iEG2pV
 wJDA==
X-Gm-Message-State: AOJu0YxMn1Cxq95tEkHB+qRkF3uJdIcEe4nfXF8OXLT7gloEtXhYNcXp
 0KqyqGTrW7yKxjqXj9pOofI=
X-Google-Smtp-Source: AGHT+IEK0Xg6qzH2Dm4yIDx6l93pGNsG8+Wuig0p6FBvwt9f5BaAcmHS/LJYC3ybdLbpAIlHcN2gnw==
X-Received: by 2002:a17:90a:5217:b0:274:9409:bbca with SMTP id
 v23-20020a17090a521700b002749409bbcamr5793346pjh.3.1696076733186; 
 Sat, 30 Sep 2023 05:25:33 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.87.78])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a17090a178900b0027463889e72sm3301661pja.55.2023.09.30.05.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 05:25:32 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: shuah@kernel.org, akpm@linux-foundation.org, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests:proc add missing field KSM in smaps_rollup[] array
Date: Sat, 30 Sep 2023 17:55:23 +0530
Message-Id: <20230930122523.118173-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: swarupkotikalapudi@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Missing field KSM is added in g_smaps_rollup[] array as it
fixes assert in function test_proc_pid_smaps_rollup()

Without this patchset test fails for "proc-empty-vm" as can be seen below:
$make TARGETS="proc" kselftest
...
  selftests: proc: proc-empty-vm
  proc-empty-vm: proc-empty-vm.c:299: test_proc_pid_smaps_rollup:
   Assertion `rv == sizeof(g_smaps_rollup) - 1' failed.
  /usr/bin/timeout: the monitored command dumped core
  Aborted
  not ok 5 selftests: proc: proc-empty-vm # exit=134
...

With this patchset test passes for "proc-empty-vm" as can be seen below:
$make TARGETS="proc" kselftest
....
timeout set to 45
selftests: proc: proc-empty-vm
ok 5 selftests: proc: proc-empty-vm
....

Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
 tools/testing/selftests/proc/proc-empty-vm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index b16c13688b88..ee71ce52cb6a 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -267,6 +267,7 @@ static const char g_smaps_rollup[] =
 "Private_Dirty:         0 kB\n"
 "Referenced:            0 kB\n"
 "Anonymous:             0 kB\n"
+"KSM:                   0 kB\n"
 "LazyFree:              0 kB\n"
 "AnonHugePages:         0 kB\n"
 "ShmemPmdMapped:        0 kB\n"
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
