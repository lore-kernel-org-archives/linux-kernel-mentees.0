Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5355C8C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Apr 2024 04:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714365650; cv=none; b=tSKRIEcCA+TB/PucmWtHuySBqxlmjV/lr3zgtTlL5e57PZw9tXbWeIpRYXkU+P6rZ9kpoNwkYLQWtaVMKTL80arR93H1A8DYOlNIsc3GB12pYmgPvLJZN8C9LWO4bODSH8vahTqSX6ZVbBRV45TSRRw+wm5cGeQFxx0xv24oPsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714365650; c=relaxed/simple;
	bh=5zPcB13L2TEYchA6zl5rtYTcXIkZ8sVxvp8s1ZUnN0A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DoGAnpopZ4i2RC9RJYVlXGz9ad5nfAmGDVwYXNSsUTBuzfRRv5Q2NnICuzi/hH+kbh35ec/FJGN/AIJQVhw6cC066NrXruhjhjtWlvnxzHqRqWFuNXstRDBnDy7H3lxwLfTw9hyEYbvJ41lKkIlm0QF8lkkxOIXa66nZVOv+bU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhK8S9et; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhK8S9et"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B1F960675
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Apr 2024 04:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grZnVkRsWxh4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Apr 2024 04:40:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=dorine.a.tipo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E7CD605BD
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E7CD605BD
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IhK8S9et
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5E7CD605BD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Apr 2024 04:40:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-41b79451153so20071095e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 28 Apr 2024 21:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714365646; x=1714970446; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=solEmZTLUT9rrgpr8rWc5di4N0OBO3L9+P0yMo2Rqts=;
        b=IhK8S9etXV13aSwZTjNbQ7sRkRlwshT8lssI/vUkGNdUG1yO8bJWhMawKdDSQxDm/E
         nInnv6M6JiOFmSB8DCazzbsqPSFylP3aj+/iAqwP/WaKPnb4EWzcVPf+4Q+oBVP5nWmh
         oi6hTm0JuUCLLiwCs3/i9IpdQMVgPRLm4bYI2py23rR7ksDVBDdeCnBwqDHxsVo8bHjO
         LtIsxF1z5oh6kRbCXy9kJF7eJE8AFPUbmTats9Zmq7HyIKlQA6jrH0n4aUM7KcWwYzXC
         nOwkbnMVP1KZRkuefhNig3s+RC2rz0lJQEAVy9A0oRlS/2NIfQ+ifv0lvenFxFAD1/xd
         yfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714365646; x=1714970446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=solEmZTLUT9rrgpr8rWc5di4N0OBO3L9+P0yMo2Rqts=;
        b=pfxVGO0QjUFWxOKQ090Axg0zPlE5KnmCEbzq4H5QhK7mcdrcR/tI3BK2Mj3cH+9WnE
         1aIg2A1G3GJ1QSpGtrkMvNRAImjf0wB5FAKUvW67JYdc7bNtYSejahnCoqLr17u3oVcv
         ku1PIxLciPo01GtdC6KHkqiSP9n/UalR3BnxKYS6L2zSAQVJBp7InxRD4CI3SjYP+7Kq
         D4kRH51yGTgPL5BVaph9neV26O0WSdlCs3YV5mWaWxcgrqBUWB19Y55Cy1nX+0vVqjPk
         OySRK6VOHh5U3EMZ0Ty6Xm/RAucC39kMgVTKnZlLscaQvIZBj5bOjgJ+SmJdVWqQr4k0
         0KUA==
X-Forwarded-Encrypted: i=1; AJvYcCUVUssiTf3UCI+YiMQhbfJuNzIGvaL/AwHoPlA45dESEYHwLdIvDUtFsmqUtQtZlsWsz7eA2U8wSjf/PDApG5UIqF+ReIykiDDT/AGkwK6WxzuY1c4LfgdoovEIKwKE
X-Gm-Message-State: AOJu0YxQLikILWY8fBb7HNi/Yyq96YWG1DGC3Rzf5tsl+F4cw25g8fPg
	joCl7Nu3ZFziYTiJqTlK67EBDeEUz9KMBe+4IK9DFJWf+3YpSuFi
X-Google-Smtp-Source: AGHT+IGLyIURNb/0G7vU9X1cZNkRP4t+/yiUDBQmcmDw3eUtAqWgWVXNvatw9THmMZMddpB4KawfaQ==
X-Received: by 2002:a05:600c:500c:b0:41b:e416:43d3 with SMTP id n12-20020a05600c500c00b0041be41643d3mr4112231wmr.35.1714365645751;
        Sun, 28 Apr 2024 21:40:45 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id u5-20020a05600c138500b0041c5151dc1csm1409367wmf.29.2024.04.28.21.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 21:40:45 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH] selftests:arm64: Test PR_SVE_VL_INHERIT after a double fork
Date: Mon, 29 Apr 2024 04:40:12 +0000
Message-Id: <20240429044012.5018-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new test, double_fork_test() to check the inheritance of the SVE
vector length after a double fork.
The `EXPECTED_TESTS` macro has been updated to account for this additional
test.
This patch addresses task 7 on the TODO list.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 tools/testing/selftests/arm64/fp/za-fork.c | 95 +++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/za-fork.c b/tools/testing/selftests/arm64/fp/za-fork.c
index 587b94648222..35229e570dcf 100644
--- a/tools/testing/selftests/arm64/fp/za-fork.c
+++ b/tools/testing/selftests/arm64/fp/za-fork.c
@@ -11,7 +11,7 @@

 #include "kselftest.h"

-#define EXPECTED_TESTS 1
+#define EXPECTED_TESTS 2

 int fork_test(void);
 int verify_fork(void);
@@ -69,6 +69,97 @@ int fork_test_c(void)
	}
 }

+int double_fork_test(void)
+{
+	pid_t newpid, grandchild_pid, waiting;
+	int ret, child_status, parent_result;
+
+	ret = prctl(PR_SVE_SET_VL, vl | PR_SVE_VL_INHERIT);
+	if (ret < 0)
+		ksft_exit_fail_msg("Failed to set SVE VL %d\n", vl);
+
+	newpid = fork();
+	if (newpid == 0) {
+		/* In child */
+		if (!verify_fork()) {
+			ksft_print_msg("ZA state invalid in child\n");
+			exit(0);
+		}
+
+		grandchild_pid = fork();
+		if (grandchild_pid == 0) {
+			/* in grandchild */
+			if (!verfy_fork()) {
+				ksft_print_msg("ZA state invalid in grandchild\n");
+				exit(0);
+			}
+
+			ret = prctl(PR_SVE_GET_VL);
+			if (ret & PR_SVE_VL_INHERIT) {
+				ksft_print_msg("prctl() reports _INHERIT\n");
+				return;
+			}
+			 ksft_print_msg("prctl() does not report _INHERIT\n");
+
+		} else if (grandchild_pid < 0) {
+			ksft_print_msg("fork() failed in first child: %d\n", grandchild_pid);
+			return 0;
+		}
+
+		/*  Wait for the grandchild process to exit */
+		waiting = waitpid(grandchild_pid, &child_status, 0);
+		if (waiting < 0) {
+			if (errno == EINTR)
+				continue;
+			ksft_print_msg("waitpid() failed: %d\n", errno);
+			return 0;
+		}
+		if (waiting != grandchild_pid) {
+			ksft_print_msg("waitpid() returned wrong PID\n");
+			return 0;
+		}
+
+		if (!WIFEXITED(child_status)) {
+			ksft_print_msg("grandchild did not exit\n");
+			return 0;
+		}
+
+		exit(1);
+		}
+	}
+	if (newpid < 0) {
+		ksft_print_msg("fork() failed: %d\n", newpid);
+
+		return 0;
+	}
+
+	parent_result = verify_fork();
+	if (!parent_result)
+		ksft_print_msg("ZA state invalid in parent\n");
+
+	for (;;) {
+		waiting = waitpid(newpid, &child_status, 0);
+
+		if (waiting < 0) {
+			if (errno == EINTR)
+				continue;
+			ksft_print_msg("waitpid() failed: %d\n", errno);
+			return 0;
+		}
+		if (waiting != newpid) {
+			ksft_print_msg("waitpid() returned wrong PID\n");
+			return 0;
+		}
+
+		if (!WIFEXITED(child_status)) {
+			ksft_print_msg("child did not exit\n");
+			return 0;
+		}
+
+		return WEXITSTATUS(child_status) && parent_result;
+	}
+}
+
 int main(int argc, char **argv)
 {
 	int ret, i;
@@ -86,11 +177,13 @@ int main(int argc, char **argv)
 	ret = open("/proc/sys/abi/sme_default_vector_length", O_RDONLY, 0);
 	if (ret >= 0) {
 		ksft_test_result(fork_test(), "fork_test\n");
+		ksft_test_result(double_fork_test(), "double_fork_test\n");

 	} else {
 		ksft_print_msg("SME not supported\n");
 		for (i = 0; i < EXPECTED_TESTS; i++) {
 			ksft_test_result_skip("fork_test\n");
+			ksft_test_result_skip("double_fork_test\n");
 		}
 	}

--
2.25.1

