Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3111E748E9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Oct 2023 17:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6386760C15;
	Sun,  1 Oct 2023 17:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6386760C15
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ik0JOr8/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyTF_n5pj_oR; Sun,  1 Oct 2023 17:08:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 43FBA60BE8;
	Sun,  1 Oct 2023 17:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43FBA60BE8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E716C0039;
	Sun,  1 Oct 2023 17:08:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15D14C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 17:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D89B260C0A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 17:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D89B260C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id by5f9lE3-1za
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 17:08:27 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A31260BE8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 17:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A31260BE8
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6934202b8bdso4470339b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Oct 2023 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696180106; x=1696784906;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kMbPHvTg3KYTqU6lv7R86vabK04eeF0+vWPKUI7IZ2g=;
 b=Ik0JOr8/0EXorgj/zILa/f5/X08hpfiw+U5UhJoJnzq4YRxVBpJ2Zjj3kQRcHBACYs
 /wdHXbdWqM0ku1rKK28MMjly0j4PBY9ezS7q20XErx68LvRgER1X7KVy+8yi/0jzAQtI
 WSBjoTKDG1kjDZS18aupmsbg8zbf2p05OafA2t9qNo+IUN1gg8C8vKTYwiiB8PL7v8Iw
 HbCpJt70+LjctSARq1wZiaQg90ilvHpesLfsnLyDAUDPhD7zwPzsTNvas0/Yeaa6WP4M
 sRidNA9jTJorRQEmK9lYWH+XqKcWoo4gMeUVxqsh1dBWRJOdhWlJEIF3OAL7Kck3/L9o
 8NZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696180106; x=1696784906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kMbPHvTg3KYTqU6lv7R86vabK04eeF0+vWPKUI7IZ2g=;
 b=IdVJR83xa1hxuHy4W/vaZYQKwvLrFk0tzaWVIbavgq3z5F5xxLhBM0CZos3Tv99Zk4
 EgO5MY5mkSyTsXeZ7lAiGAWvF/jIRdrl/xsrbmntA/XsnKPSDJY6TIFG6Y/k3REfcPr0
 3KSvrDfCCNT8650zwlKv9QujpstH2wVqF0RVQGRmh23FLFHzbmctk4PVaS6RO500/ahy
 4J3YIxWSjpoXakc1lZpaUCZwwHPNMtSyH5cuw1BIK4t56yJFXoCXfErTuEX2So2eO3H6
 gYi2YcU7iQlnIMYDbzZ3qx/qDEMlVfnjWnCIis2JCly+lHflAoBV1rmI29kJGdkua/Z9
 /e7Q==
X-Gm-Message-State: AOJu0YyOXF0q1viF/J2DGQduwNcs1BJdH1bXeeBddpbi8o5P5OGanbgg
 N0lTm7Itl99VukAYUbQSQpc=
X-Google-Smtp-Source: AGHT+IGKB2PYrd5YyfAoImdg/5wvtBJ7JlGl0wk4+u0Zr0inVTGJQz2PAyH7NqOVLNxcLrhiRbDPbA==
X-Received: by 2002:a05:6a20:96c3:b0:152:238a:f05b with SMTP id
 hq3-20020a056a2096c300b00152238af05bmr8105216pzc.53.1696180106449; 
 Sun, 01 Oct 2023 10:08:26 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.87.78])
 by smtp.gmail.com with ESMTPSA id
 n3-20020aa79043000000b0068e12e6954csm7590138pfo.36.2023.10.01.10.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 10:08:25 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: shuah@kernel.org, akpm@linux-foundation.org, adobriyan@gmail.com,
 hughd@google.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] selftests:proc Add /proc/$(pid)/statm output validation
Date: Sun,  1 Oct 2023 22:38:16 +0530
Message-Id: <20231001170816.28241-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: swarupkotikalapudi@gmail.com
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
and compare length of output is
equal or greater than expected output

Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
 tools/testing/selftests/proc/proc-empty-vm.c | 38 +++++++++++++++++---
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index b16c13688b88..4b51b5d617e4 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -302,6 +302,37 @@ static int test_proc_pid_smaps_rollup(pid_t pid)
 	}
 }
 
+static const char g_statm[] = "0 0 0 * 0 0 0\n";
+
+static int test_proc_pid_statm(pid_t pid)
+{
+	char buf[4096];
+
+	snprintf(buf, sizeof(buf), "/proc/%u/statm", pid);
+
+	int fd = open(buf, O_RDONLY);
+
+	if (fd == -1) {
+		if (errno == ENOENT) {
+			/*
+			 * /proc/${pid}/statm is under CONFIG_PROC_PAGE_MONITOR,
+			 * it doesn't necessarily exist.
+			 */
+			return EXIT_SUCCESS;
+		}
+		perror("open /proc/${pid}/statm");
+		return EXIT_FAILURE;
+	} else {
+		ssize_t rv = read(fd, buf, sizeof(buf));
+
+		close(fd);
+		size_t len = strlen(g_statm);
+
+		assert(rv >= len);
+		return EXIT_SUCCESS;
+	}
+}
+
 int main(void)
 {
 	int rv = EXIT_SUCCESS;
@@ -388,11 +419,8 @@ int main(void)
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
