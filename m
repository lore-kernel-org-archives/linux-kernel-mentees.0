Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B019C25B6E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Oct 2023 19:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EBAB416FC;
	Wed, 25 Oct 2023 19:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EBAB416FC
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a1fDEuqG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-RhlH5ABuIw; Wed, 25 Oct 2023 19:36:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1371C416FA;
	Wed, 25 Oct 2023 19:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1371C416FA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EADB6C0039;
	Wed, 25 Oct 2023 19:36:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55407C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 19:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 240D760B79
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 19:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 240D760B79
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a1fDEuqG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eiyYCuFpxLiK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 19:36:37 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F48D60B6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 19:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F48D60B6F
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6b9af7d41d2so110186b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 12:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698262597; x=1698867397;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=26pJmtJb2RAX7qmuNdQwiZrEag4RUY/XohpxzktHJ4U=;
 b=a1fDEuqGRtYzo3DjOCz7n1giq77/o7xjmTrlpcpKVhjDsWkA6jckVvxBt7ugu6bJMf
 ouvnMfXxt1BWyqoFIyoP69LUPH1Es9cgNbc9K8ztpR1WHviM6jqn8Tz32m0jE2m0PwKM
 wUhea4x/0ONOREfAFdDASqIfFzKoDU2T/F6z2NOpx/7m+J6WcowZbv5HSAqg12GiPnZW
 57RBQCze6QZbSPp8e8ozfO0hXdLfkebkjMiK+Yjx0It5nODSS8FuNX5GFeAOhiDt5R8k
 JiuoyaTqXEPv+/9MJD45t6yWnO/d9zqB0LV8BmLFn+r9o+eCXgW+V5FMLlM7GnsxmNo4
 UKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698262597; x=1698867397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=26pJmtJb2RAX7qmuNdQwiZrEag4RUY/XohpxzktHJ4U=;
 b=ZeDOYJr6L4Pm5h+gVnMul89BfXS1W1cGu0tiXsnQQOfxQsqltiesm0czstaUD6gg+1
 DnNrHlWHtIWmUT0D7A5RMra8f4NofgSqTWv34wiY+kDs0+ZA93Ppx7GeSYSTpeXkWSMW
 H1ZGM41dJmdOe1k/mux4qs4XZdd2wfe+JYQSEm3lKteHj6H3YNbPb+8RRyghCF77REzc
 cQYfq4rk2VQSW9rhwM61X0U4V61hOZ2R/S2JIBwLZnMhkz4UjQqOXKgzFKTYFA8uMZDc
 54wQ6AJSLQsZenfgtc7l5dGBl4mDfaGdxqkpqZ8+rVNtIvnC3d/W1DkT2W1t0abIdW7L
 VGsQ==
X-Gm-Message-State: AOJu0YwpPodNh9t/YO6M4LiFnncM02hY5GjjbRn2axj1W0ctmeELi/xL
 ymFmSI0uZFHrBq+Rxa1Oy2k=
X-Google-Smtp-Source: AGHT+IGoFaKQntcdg64/063AgFh2wDd8nptiNikQFkrJcRhRt+2VvrD+F+KjeonLmYe9soZtWaYTOA==
X-Received: by 2002:a05:6a20:6a0b:b0:17b:129b:1817 with SMTP id
 p11-20020a056a206a0b00b0017b129b1817mr7106857pzk.45.1698262596525; 
 Wed, 25 Oct 2023 12:36:36 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.80.48])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a635209000000b00565dd935938sm9217483pgb.85.2023.10.25.12.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:36:36 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: shuah@kernel.org, akpm@linux-foundation.org, adobriyan@gmail.com,
 hughd@google.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] selftests:proc ProtectionKey check in smpas test
Date: Thu, 26 Oct 2023 01:06:27 +0530
Message-Id: <20231025193627.316508-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
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

Check ProtectionKey field in /proc/*/smaps output,
if system supports page-based memory permissions.

Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
 tools/testing/selftests/proc/proc-empty-vm.c | 38 ++++++++++++--------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index b16c13688b88..4842f923235c 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -37,6 +37,7 @@
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <unistd.h>
+#include "../kselftest.h"
 
 #ifdef __amd64__
 #define TEST_VSYSCALL
@@ -83,10 +84,7 @@ static const char proc_pid_smaps_vsyscall_1[] =
 "SwapPss:               0 kB\n"
 "Locked:                0 kB\n"
 "THPeligible:           0\n"
-/*
- * "ProtectionKey:" field is conditional. It is possible to check it as well,
- * but I don't have such machine.
- */
+"ProtectionKey:         0\n"
 ;
 
 static const char proc_pid_smaps_vsyscall_2[] =
@@ -113,10 +111,7 @@ static const char proc_pid_smaps_vsyscall_2[] =
 "SwapPss:               0 kB\n"
 "Locked:                0 kB\n"
 "THPeligible:           0\n"
-/*
- * "ProtectionKey:" field is conditional. It is possible to check it as well,
- * but I'm too tired.
- */
+"ProtectionKey:         0\n"
 ;
 
 static void sigaction_SIGSEGV(int _, siginfo_t *__, void *___)
@@ -241,13 +236,26 @@ static int test_proc_pid_smaps(pid_t pid)
 	} else {
 		ssize_t rv = read(fd, buf, sizeof(buf));
 		close(fd);
-		if (g_vsyscall == 0) {
-			assert(rv == 0);
-		} else {
-			size_t len = strlen(g_proc_pid_maps_vsyscall);
-			/* TODO "ProtectionKey:" */
-			assert(rv > len);
-			assert(memcmp(buf, g_proc_pid_maps_vsyscall, len) == 0);
+		assert(rv >= 0);
+		assert(rv <= sizeof(buf));
+		if (g_vsyscall != 0) {
+			int pkey = pkey_alloc(0, 0);
+
+			if (pkey < 0) {
+				size_t len = strlen(g_proc_pid_maps_vsyscall);
+
+				assert(rv > len);
+				assert(memcmp(buf, g_proc_pid_maps_vsyscall, len) == 0);
+			} else {
+				pkey_free(pkey);
+				static const char * const S[] = {
+					"ProtectionKey:         0\n"
+				};
+				int i;
+
+				for (i = 0; i < ARRAY_SIZE(S); i++)
+					assert(memmem(buf, rv, S[i], strlen(S[i])));
+			}
 		}
 		return EXIT_SUCCESS;
 	}
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
