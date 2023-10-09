Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA10CD612A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Oct 2023 19:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C023281B60;
	Mon,  9 Oct 2023 19:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C023281B60
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FtKqgXEG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0C04SWeRJEPv; Mon,  9 Oct 2023 19:20:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 770E081BD6;
	Mon,  9 Oct 2023 19:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 770E081BD6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50BCCC0039;
	Mon,  9 Oct 2023 19:20:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28247C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 19:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 112C460B6A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 19:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 112C460B6A
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FtKqgXEG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5wp-FV3zyXA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 19:20:29 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55DB0612D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Oct 2023 19:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55DB0612D5
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-578e33b6fb7so3089348a12.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Oct 2023 12:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696879229; x=1697484029;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/g1j9HiKSnjL7yGbF4RkqOe02EOquhx1LcTcmnYbMcQ=;
 b=FtKqgXEGJEKh2/ZGIi+9FzNLUpuKsJ1eagt2N2QqVpxwQsEiaH0dyWqFrX+nVXvujQ
 ynI3AA0fP3CVdYXNDERaepnBAF13ozZfEgSlrsoW5wnzmehHmRv6RKvyYqK9Bkdg4U7v
 x/JgJm8dID7jFS02kaHULpy6f/Ms13TuggQwEX6mMGd6eOxIsjWTZTYVQO+X0mnyKEve
 GX1oYqe3Mn69+EitFWkPVbBxjd4M2wH/dcKbAcp2wdGooDAB109ZvK6gP/Qe1gJIITS9
 LlgU4VknbFFWplHUk2x18piuKW/0dIrHgzW1i0N5Vdf4RDOej4l30m4TbJHqmiEqhtm/
 kIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696879229; x=1697484029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/g1j9HiKSnjL7yGbF4RkqOe02EOquhx1LcTcmnYbMcQ=;
 b=NdJi7oZ2lIZtzVTBosMDaQ9QB3ZrlziC0/eg3O0z885QSIiIaGAYfz4MQ5znKQeyBP
 yy1HTRGxotutDKIUus2sEHHlfurgtiZz29Kb1FarM+wrF5f7rKB4MEb+PK89fjgIOlnB
 lDGu+XkYGSpLVzMFTsHiKqtHjbSykc/MYfTAc5vFwUDKBsnF7vC3nsJ/XJKbKgPNj66h
 erjFHGdK1fE0gCx+jhI98uS8xcloce6fZisaddGmwyywMGzrYknDRkvuBN+qZs2Sjruh
 XkOHWwPwLdRazusLFurmM1rO8UVUpPoMSnqt1JBFlt7MUg/ZThX8BpWQOB2NJPlKHyDD
 MkZQ==
X-Gm-Message-State: AOJu0YwejVT8goyus2S6HzMcnCVI5Dj1jXxqRSQqvxK1Yjg0Qesu+bU6
 suRG60XvCtqZLiOfAlxTtPQ=
X-Google-Smtp-Source: AGHT+IFrYk6upoIKzXF/DQuWt1tnCOakUk+x6ZLBPpUhsKG7M6OsjazGNh91QAd63xstpiP5gi4DYQ==
X-Received: by 2002:a17:90b:88e:b0:269:3771:7342 with SMTP id
 bj14-20020a17090b088e00b0026937717342mr12380407pjb.18.1696879228566; 
 Mon, 09 Oct 2023 12:20:28 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.87.78])
 by smtp.gmail.com with ESMTPSA id
 23-20020a17090a199700b00278ff752eacsm9472837pji.50.2023.10.09.12.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 12:20:28 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: adobriyan@gmail.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org, hughd@google.com,
 mm-commits@vger.kernel.org
Subject: [PATCH v3] selftests:proc Add /proc/$(pid)/statm output validation
Date: Tue, 10 Oct 2023 00:50:10 +0530
Message-Id: <20231009192010.10456-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231004201701.87CB5C433C7@smtp.kernel.org>
References: <20231004201701.87CB5C433C7@smtp.kernel.org>
MIME-Version: 1.0
Cc: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
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

Add /proc/${pid}/statm validation

/proc/$(pid)/statm output is expected to be:
 "0 0 0 * 0 0 0\n"
Here * can be any value

Read output of /proc/$(pid)/statm
and check except for 4th position,
all other positions have value zero.

Fixes: 5bc73bb3451b (proc: test how it holds up with mapping'less process)
Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---

 Changes in V3:
- Remove wrong comment "/proc/${pid}/statm is under
  CONFIG_PROC_PAGE_MONITOR"
- read() function usage is change

 Changes in V2:
- 4th field if zero it will assert
- field other than 4th field is checked for zero value
- clean up of function test_proc_pid_statm()

 tools/testing/selftests/proc/proc-empty-vm.c | 60 ++++++++++++++++++--
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index b16c13688b88..bc76e8bba7e4 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -38,6 +38,8 @@
 #include <sys/wait.h>
 #include <unistd.h>
 
+#include "../kselftest.h"
+
 #ifdef __amd64__
 #define TEST_VSYSCALL
 #endif
@@ -302,6 +304,57 @@ static int test_proc_pid_smaps_rollup(pid_t pid)
 	}
 }
 
+static int test_proc_pid_statm(pid_t pid)
+{
+	char buf[4096];
+	char *tok;
+	char *string, *p;
+	int non_zero_value_indx = 4;
+	int i = 1, len;
+        size_t left;
+
+	snprintf(buf, sizeof(buf), "/proc/%u/statm", pid);
+
+	/*
+	 *  Output can be "0 0 0 2 0 0 0\n" where "2" can be anything.
+	 */
+	int fd = open(buf, O_RDONLY);
+
+	if (fd == -1) {
+		if (errno == ENOENT) {
+			return EXIT_SUCCESS;
+		}
+		perror("open /proc/${pid}/statm");
+		return EXIT_FAILURE;
+	} else {
+		memset(buf, 0, sizeof(buf));
+		left = ARRAY_SIZE(buf);
+		p = buf;
+		while ((len = read(fd, p, left)) > 0) {
+			p += len;
+			left -= len;
+		}
+		close(fd);
+		string = buf;
+
+		while ((tok = strsep(&string, " ")) != NULL) {
+			if (i == non_zero_value_indx) {
+				if (!strncmp(tok, "0", 1))
+					goto err_statm;
+			} else {
+				if (strncmp(tok, "0", 1))
+					goto err_statm;
+			}
+			i++;
+		}
+	}
+
+	return EXIT_SUCCESS;
+
+err_statm:
+	assert(0);
+}
+
 int main(void)
 {
 	int rv = EXIT_SUCCESS;
@@ -388,11 +441,8 @@ int main(void)
 		if (rv == EXIT_SUCCESS) {
 			rv = test_proc_pid_smaps_rollup(pid);
 		}
-		/*
-		 * TODO test /proc/${pid}/statm, task_statm()
-		 * ->start_code, ->end_code aren't updated by munmap().
-		 * Output can be "0 0 0 2 0 0 0\n" where "2" can be anything.
-		 */
+		if (rv == EXIT_SUCCESS)
+			rv = test_proc_pid_statm(pid);
 
 		/* Cut the rope. */
 		int wstatus;
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
