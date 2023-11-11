Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953671BDE2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 11 Nov 2023 17:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezjtN1j3"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2495B60F84
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 11 Nov 2023 17:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2495B60F84
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ezjtN1j3
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DFXtRkIrv9KE
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 11 Nov 2023 17:38:17 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E6D2260888
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 11 Nov 2023 17:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6D2260888
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-359d27f6d46so10148575ab.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 11 Nov 2023 09:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699724296; x=1700329096; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjn0mx0T4ELUgwN3eqbWBleZXpgBP6Grrg4uPvTk4DY=;
        b=ezjtN1j3jeWRC0IcU/X7RU0LGTifNasmCO57aqN8cAhfEAeDnsTBOLuZgKNzgWOna7
         3qMH9PWk3o4kBqhxwEW7Wf8ZF3t1VxeR9imBEb8GIeZyrsP/NIhjEhTY2OPLzhEYxq/B
         KiF5Zbm6jGkrRMTaYFOHNaIs6JRvlg7Cm1SrBb+gaVcCcTAVL4mYe2lXbLwoPlkJ/qfA
         IkkT0t7T/K4wR3h3KovDGvGG7QOQLgpMFezVNJ275s7wTM/06eqG3QzY+ihHhPApcHQA
         ppKMPk2N1xAUkT/ZjKbYSB0eLnlKh8vo/I3ex74TtNfeyJA81/nNCHRMkS2iS2EfSgmT
         Wyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699724296; x=1700329096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjn0mx0T4ELUgwN3eqbWBleZXpgBP6Grrg4uPvTk4DY=;
        b=VmgRgUUdL5vCNwIYJkp4jIYfoc3RQRAim+TDOxqlsEfEOYE/fY8UMuHKoNuDAhbZZm
         Hxj1VSCOtUzdFlbdbnDzZsIgoMsbbORWITyg7y/7VaWiD5KMJ8G7rOXHyHnA/7JlBAp+
         GcIUrnQGAlcDcYRn9sbQ5RiKXb2RAvt2rU/QQb5MCqHS4FwXuPz0OZBdtdLAzHAbr9TK
         THbu4eD/hd13bMA7dA+mWNS6dWZpFuGcOpGqYh5GBebDlx3gY7ImUIH5eIFDuskFzk8x
         MzJ13HRFZx3xl66nmMJyTQD4gnNfUMmlJMpTrwsLZRescs3MEgxhqu03bGRkn1ioerXv
         lhWQ==
X-Gm-Message-State: AOJu0Yy/i9wHbvVtyi1BO2XLcOO/BtVE+Eqjbh6IkIIbcPTHisnxaUBc
	1TDOi/iJhcPx8PTdp+mr+Ss=
X-Google-Smtp-Source: AGHT+IF0rJDB1rx0Fbj9KRFWhR+y0qz9rCr0UJv6agGt7mcvW3RqlLKjHpM9emqlz/vIORxwMf8b7Q==
X-Received: by 2002:a05:6e02:16c6:b0:359:3150:c69d with SMTP id 6-20020a056e0216c600b003593150c69dmr4152096ilx.9.1699724295984;
        Sat, 11 Nov 2023 09:38:15 -0800 (PST)
Received: from swarup-virtual-machine.localdomain ([171.76.83.22])
        by smtp.gmail.com with ESMTPSA id w12-20020aa7858c000000b006b76cb6523dsm1511226pfn.165.2023.11.11.09.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 09:38:15 -0800 (PST)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	luto@kernel.org
Cc: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
Subject: [PATCH v2] selftests: capabilities: namespace create varies for root and normal user
Date: Sat, 11 Nov 2023 23:08:06 +0530
Message-Id: <20231111173806.16775-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZU+xkpH09xjzO5IS@swarup-virtual-machine>
References: <ZU+xkpH09xjzO5IS@swarup-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset fixes TODO:
"If we're already root, we could skip creating the userns."

Change namespace creation for root and non-root
user differently in create_and_enter_ns() function
in this file:
tools/testing/selftests/capabilities/test_execve.c

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

Changes in V2:
 - Change the commit message explaining
   why this patchset is needed.

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

