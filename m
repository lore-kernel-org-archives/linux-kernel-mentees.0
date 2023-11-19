Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB31875
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 05:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vv8LzC89"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EC27418EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 05:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EC27418EE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vv8LzC89
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1K7win5sU1BU
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 19 Nov 2023 05:06:27 +0000 (UTC)
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ABBB1418DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 05:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABBB1418DD
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-670e7ae4a2eso7446076d6.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Nov 2023 21:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700370386; x=1700975186; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ad+7DeeKonJPGSO2EixeCkfPYP/580kvKkx8jJr6+Sc=;
        b=Vv8LzC89jYOKp8gETILyfGmrVkfEMszJ0e9OVVoOsFdEloSLSul3/SA6dIiuv10gMw
         EYC8BdXp9vpVBBmeFwOifGS/UFp6FTrY0/W29d+pKeq1Ahbfp8kP7Lkqg6GS+dXZFgvW
         V/22rUI4yscfBJVpqqNJ0J/mC6lzqE88nBG1KGstBD+rPKCNYyt6QgoW7Muuoal18+mx
         E8KwSjsgGHqhaoSV9W7YeJVmcefOuNiPTpgUN7DtSa4SKnPnJalt8ojNSaTVqKH9QN0F
         Oeg6J/dgqTiSNq3bTxQpt3WTmbLTkfIY8XseOAQY4/LiaXqnZrMEKCZX2MvlkyXGdPHn
         AbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700370386; x=1700975186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ad+7DeeKonJPGSO2EixeCkfPYP/580kvKkx8jJr6+Sc=;
        b=jGdqa9skIMwzKJChDXEpTq3b4MSbpsey1dhxPDQoE7sGwtDXA9lWma9Kg6IBaQXIi5
         HeXCqv3g1QgaYW5k3QHuN0CAFAm4W0G21SS6u0A+zYaWLkIQi8Ql/fZj4mIWAKWWjEi8
         rflEzGrMWGP6V53IJzHDlt/Q4cjDa3m6e9kGhS+BxaSke7LvXeThIl29MjeRgz1Jqtn1
         3mpwN7woEhLWXIwyGg0ye9b0qz96cGms3UMqXXs6jCkQZb+dZTdl2rocB3CRr9EPsawC
         bkpWCRcRM6nS6O/df++DPGGo+8ELROgNlnmd4Mf7LW958acodAdB29fU2JOyOBPawpgc
         dV7Q==
X-Gm-Message-State: AOJu0Yx6J8io1ehuY/4oaxsNkAIJGiKp2BHKgcoRg1DCzDVsaIJuYxr/
	OTu9j0Cnx85zbtAj+pfKBwE=
X-Google-Smtp-Source: AGHT+IE6ewIOz7fWAiRRlnSfkTDbduM6WX9t/1yTRHj2fOjEVYBSYH/vPjNG9c6Q0RtzPARe+XTosg==
X-Received: by 2002:a05:6214:2341:b0:675:ac72:f4ce with SMTP id hu1-20020a056214234100b00675ac72f4cemr5209912qvb.28.1700370386558;
        Sat, 18 Nov 2023 21:06:26 -0800 (PST)
Received: from angquan-linux.. ([72.36.119.4])
        by smtp.gmail.com with ESMTPSA id n5-20020a0cec45000000b00679d4021621sm177070qvq.145.2023.11.18.21.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 21:06:26 -0800 (PST)
From: angquan yu <angquan21@gmail.com>
X-Google-Original-From: angquan yu
To: linux-kselftest@vger.kernel.org
Cc: kvm@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernal.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	angquan yu <angquan21@gmail.com>
Subject: [PATCH] selftests:proc-empty-vm: Remove unused debug write callIn the function test_proc_pid_statm
Date: Sat, 18 Nov 2023 23:05:54 -0600
Message-Id: <20231119050554.52096-1-angquan21@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: angquan yu <angquan21@gmail.com>

In tools/testing/selftests/proc/proc-empty->because the return value of a write call was being ignored. This call was partof a conditional debugging block (if (0) { ... }), which meant it would neveractually execute.

This patch removes the unused debug write call. This cleanup resolves the compi>warning about ignoring the result of write declared with the warn_unused_resultattribute.

Removing this code also improves the clarity and maintainability ofthe function, as it eliminates a non-functional block of code.

This is original warning: proc-empty-vm.c: In function ‘test_proc_pid_statm’:proc-empty-vm.c:385:17: warning: ignoring return value of ‘write’ declared with>385 |                 write(1, buf, rv);|

Signed-off-by: angquan yu <angquan21@gmail.com>
---
 tools/testing/selftests/proc/proc-empty-vm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index 56198d4ca..74ef8627f 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -382,7 +382,10 @@ static int test_proc_pid_statm(pid_t pid)
 	assert(rv >= 0);
 	assert(rv <= sizeof(buf));
 	if (0) {
-		write(1, buf, rv);
+		ssize_t written = write(1, buf, rv);
+		if (written == -1) {
+			perror("write failed /proc/${pid}");
+		}
 	}
 
 	const char *p = buf;
-- 
2.39.2

