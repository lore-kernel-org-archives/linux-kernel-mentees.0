Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC99E71D2A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 Sep 2023 12:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B85C83C2A;
	Fri, 29 Sep 2023 12:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B85C83C2A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Uh7lX8MZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhODtxea_5mx; Fri, 29 Sep 2023 12:54:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3A6AD83C27;
	Fri, 29 Sep 2023 12:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A6AD83C27
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B0EBC0039;
	Fri, 29 Sep 2023 12:54:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C443C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 12:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 233E242D70
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 12:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 233E242D70
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Uh7lX8MZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5Pyhzn0ps8X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 12:53:59 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35F0142D57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 12:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35F0142D57
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-690bf8fdd1aso11425056b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 05:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695992038; x=1696596838;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=76gM6BDUUWAlgjRd9QMQTyUL0C7Q49QbZ5DAn9QkE6g=;
 b=Uh7lX8MZfCe1ddwceahkJ1KlJk9jF4dukxBDl8ZibDlt8NuDNAiRFZhbf7yHVF8LG8
 TP4raKY1em7uXBupnZ3cMgu3gYaNd53ThfING+uX1Esg1jfVa6XrpCkOqYz0na+JREqT
 bAVeWOPcyrwDQ5szG4AYEjbDvuirM8Ezz7R0qSowUi/vTtgWZIn+Im6sJ/1WeKt7/mS5
 e/W2mSu2xGq/7YHDKPceXNcZUVv9Hvre1Uz6HqRrirPcx0tQ/KbgT/5y2fiznI8x5cAC
 5e/vEx0AJu5oIDiZ1ZO3/SdOCOBXSZLnwq5oM0SBQpzYZDdCs7i4CQKpAju/P/HSBEK8
 NtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695992038; x=1696596838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=76gM6BDUUWAlgjRd9QMQTyUL0C7Q49QbZ5DAn9QkE6g=;
 b=hujiMkhptOF6/OMfdeaxE+IVn8W5KOXFf2SUqMen+h0Xjgii7tRMRyhFm5tOL08Loz
 mBh1WDqSqB1960H+lfjNJfZZZ2667f/U09msXXpUYbZ0r8LOTVWZFm5951ADuIUs+xwf
 EOPDpUpf9ys0JmvIMra0AblWJswqBRk0gvrBm7VoJnMjuo6XoFUvRbfeZ/kgJhg2tXPg
 ANhxQemenP/yonTRZCwxfXJVoKb+f7P8OM5sPuJJb0lz4Erx2lggtVR2g1FD+/fSHqSM
 sTbdygrZQ/BHckYUf9hKl3Rq0puUir98K0LXfpJ0gbHP986duXvB8DniTfrkL0rbj/sH
 ZZdw==
X-Gm-Message-State: AOJu0YxLV+vE3CGvoBUCOGybaUeB8c9Qno8YkWtpvrXSJKR7Naa1u2Ra
 /Gdpn/MjblA7KtO0xwZtzXEF7osOdRnZTVrJ
X-Google-Smtp-Source: AGHT+IE2N53vnfZ9QHFbyMOxxgoiNewsUxoq53+ellAryOcJ/cfMO0iR6bshi22LSzmRUbusGzGTFQ==
X-Received: by 2002:a05:6a00:22c3:b0:68e:2822:fb36 with SMTP id
 f3-20020a056a0022c300b0068e2822fb36mr4011566pfj.8.1695992038070; 
 Fri, 29 Sep 2023 05:53:58 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.87.78])
 by smtp.gmail.com with ESMTPSA id
 do17-20020a056a004a1100b00692b0d413c8sm12473465pfb.197.2023.09.29.05.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 05:53:57 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: capabilities: namespace create varies for root and
 normal user
Date: Fri, 29 Sep 2023 18:23:48 +0530
Message-Id: <20230929125348.13302-1-swarupkotikalapudi@gmail.com>
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

Change namespace creation for root and non-root
user differently in create_and_enter_ns() function

Test result with root user:
$sudo make  TARGETS="capabilities" kselftest
 ...
 TAP version 13
 1..1
 timeout set to 45
 selftests: capabilities: test_execve
 TAP version 13
 1..12
 [RUN]       +++ Tests with uid == 0 +++
 [NOTE]      Using global UIDs for tests
 [RUN]       Root => ep
 ...
 ok 12 Passed
 Totals: pass:12 fail:0 xfail:0 xpass:0 skip:0 error:0
 ==================================================
 TAP version 13
 1..9
 [RUN]       +++ Tests with uid != 0 +++
 [NOTE]      Using global UIDs for tests
 [RUN]       Non-root => no caps
 ...
 ok 9 Passed
 Totals: pass:9 fail:0 xfail:0 xpass:0 skip:0 error:0

Test result without root or normal user:
$make  TARGETS="capabilities" kselftest
 ...
 timeout set to 45
 selftests: capabilities: test_execve
 TAP version 13
 1..12
 [RUN]       +++ Tests with uid == 0 +++
 [NOTE]      Using a user namespace for tests
 [RUN]       Root => ep
 validate_cap:: Capabilities after execve were correct
 ok 1 Passed
 Check cap_ambient manipulation rules
 ok 2 PR_CAP_AMBIENT_RAISE failed on non-inheritable cap
 ok 3 PR_CAP_AMBIENT_RAISE failed on non-permitted cap
 ok 4 PR_CAP_AMBIENT_RAISE worked
 ok 5 Basic manipulation appears to work
 [RUN]       Root +i => eip
 validate_cap:: Capabilities after execve were correct
 ok 6 Passed
 [RUN]       UID 0 +ia => eipa
 validate_cap:: Capabilities after execve were correct
 ok 7 Passed
 ok 8 # SKIP SUID/SGID tests (needs privilege)
 Planned tests != run tests (12 != 8)
 Totals: pass:7 fail:0 xfail:0 xpass:0 skip:1 error:0
 ==================================================
 TAP version 13
 1..9
 [RUN]       +++ Tests with uid != 0 +++
 [NOTE]      Using a user namespace for tests
 [RUN]       Non-root => no caps
 validate_cap:: Capabilities after execve were correct
 ok 1 Passed
 Check cap_ambient manipulation rules
 ok 2 PR_CAP_AMBIENT_RAISE failed on non-inheritable cap
 ok 3 PR_CAP_AMBIENT_RAISE failed on non-permitted cap
 ok 4 PR_CAP_AMBIENT_RAISE worked
 ok 5 Basic manipulation appears to work
 [RUN]       Non-root +i => i
 validate_cap:: Capabilities after execve were correct
 ok 6 Passed
 [RUN]       UID 1 +ia => eipa
 validate_cap:: Capabilities after execve were correct
 ok 7 Passed
 ok 8 # SKIP SUID/SGID tests (needs privilege)
 Planned tests != run tests (9 != 8)
 Totals: pass:7 fail:0 xfail:0 xpass:0 skip:1 error:0

Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
 tools/testing/selftests/capabilities/test_execve.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tools/testing/selftests/capabilities/test_execve.c b/tools/testing/selftests/capabilities/test_execve.c
index df0ef02b4036..8236150d377e 100644
--- a/tools/testing/selftests/capabilities/test_execve.c
+++ b/tools/testing/selftests/capabilities/test_execve.c
@@ -96,11 +96,7 @@ static bool create_and_enter_ns(uid_t inner_uid)
 	outer_uid = getuid();
 	outer_gid = getgid();
 
-	/*
-	 * TODO: If we're already root, we could skip creating the userns.
-	 */
-
-	if (unshare(CLONE_NEWNS) == 0) {
+	if (outer_uid == 0 && unshare(CLONE_NEWNS) == 0) {
 		ksft_print_msg("[NOTE]\tUsing global UIDs for tests\n");
 		if (prctl(PR_SET_KEEPCAPS, 1, 0, 0, 0) != 0)
 			ksft_exit_fail_msg("PR_SET_KEEPCAPS - %s\n",
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
