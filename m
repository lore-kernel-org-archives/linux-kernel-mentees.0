Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CE3331A49
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Dec 2025 08:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788471; cv=none; b=JifANv/CFaTwU6SheLeJwaTnqMUss3hNk+lfA0XgPWv1OELJRNunr5H0W7Ts8vegFBWDMVrZXUJXJdm7CFroLkf9XZ+nuONwNSJTcgCaPDMPZnv++WJ/znE9NSk3vJke9JsMtQTcNyetC1KVj9POIrA4m178IVMrL6wygyLg3Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788471; c=relaxed/simple;
	bh=ntbk0Qg64mB+eRdow45mqcltJofKTd87yIfqFj6CdOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bquKCwu5u0MVVYwQK94znCNGvmRHAMlTCuqE4IIDfSjNyvgSndnidnPgP6fpAVIP9SZbJqtMT5yEJi5ay6fxYhC41JAW6nFVSysIf/tIjsvVsSOxy4ARtGrMnqvNJgbcSUiMekd1V8zmI6El+A0FHHBOe0pHNkWMhPGFZLFwNWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ml9KlTpJ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ml9KlTpJ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a081c163b0so19269725ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Dec 2025 00:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765788466; x=1766393266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPjuXZ4/6Ll8iE3Rz28AaFI0svhctDC7vgBQffR8h0U=;
        b=ml9KlTpJl+hrw4kbbtRhaEmW+AO4xE+tNeFhERcrzH+I23pYYzkkaJ9kTZNY4pvLPd
         N9+yqcHqd3c81zBZBFhuGPV1EpjkBvGl7SK55W157jLT0sxi3Gxe0stw83KEj/Wgbh/m
         8sU5+y6Q82EJkmtyFPYC8yjbT+Gbh0XH9jFfZbh81CoUNGdQ47dEW8gO4YduX3u+NWvD
         SBeHmZabmkc0WtWIMgB2dxTqOB6JjIA+gpPNvRU7c0t/ew3D44Wot+9SBf4iifOGXIXC
         VvHa4hnTJmDtj3kBzE9Th6woQgLROtP2TuCkK1fV0VvR9ZulyuyREERXSx8XeqsFahR2
         cFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788466; x=1766393266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPjuXZ4/6Ll8iE3Rz28AaFI0svhctDC7vgBQffR8h0U=;
        b=uUayKtv8ZksgulTBB4K53ZTamxdp6GuZ5jsZv6B7mz2/EXfblJpA8Z31rrBkB1E3Vs
         U2OyKZkpalz4ykhzYtMTYRIEKwLYZAI8nopPZogzdgbnsyW92gorHl6jAiVh/qrVR/MJ
         oZIHBPx7RTjp9KucbAvT2DKH78HmfVZQ2n/Ho2AYIi1U51trNU8ZEki0nfBQE6yqnT/S
         tBM80Zn8Hmz8I1QJLBWZKC5olnCLwE3vZx8ywukMzg8igSnyxuN21wF7nJgwbcDWFPBI
         WJiaIHkfpmBY/CYqHG/bB8L+n/F9K+jaPML2ogriGMx03+YnffbQJP8JFIAc5XLuOBAd
         kgtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZi8+EtJtcahLSRrxUr3TKyxy4m6ImCMHKqnEA3R57raOK2MVYb4nDSfW0GWtoVvgGyVyAoxuiZubMOC2rMQ4HqkpE5g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2ftw1ClmqYDJXJtbG9qgnzmVgdgySNL92dbyoNKbUHIyRdU0p
	rz1vdX29eQ+tUFohFmr6WBScHKUzTHBdPlobTWu03Gc0cM4Qrc/jbA6l
X-Gm-Gg: AY/fxX68gPTSHOIf5Thk/Q440nityY0oXh/SyKRB3N0kqFsvnUl47b5GNHNZWLLMVvz
	idxxDCbpsJ9SJPkBIDq99En/OstGVn1NNCHw2OXeFfu2Kt7AXwp/yIsjquyTXAzu3YJvL2t+tLr
	6WcKqyOXP8iCBRniELZ207ULHkGbMqoEXVLUrHfpNTAOJi8eh7LwELZZy2rYA4KHx0DwUcI8sl2
	6wdStUkvg1NuoYtKcDk8kWrDjZXwtW9R2SpGi3S6J4mhfJfopEWrr1Uf1Zbo5spUUJTspZXc9Y1
	BfrffUQ3yAreakPu/QnnScgPe6iNV434XQkHtmzuLFrOR3/Vr4nFtKQlOF2OBHdDXv7R4gTbNY3
	0QEGEcTuOQSFNbzOmLygGS/Zfk+gLD+/ZJ13fdCryV760eKfspK+wQrJ7qzpEB69n5c1T7SA4mz
	Mc/YerdDZByT8LurJX/B1fIt/d4U6oLnPribI=
X-Google-Smtp-Source: AGHT+IEPumXAp9HZLmoAIfnYbxYk6w+/T3dU7w+yjiyvqFmWqDIigTjRbVkztYzivR4UDHXsX7nkpA==
X-Received: by 2002:a17:903:1109:b0:295:a1a5:bb0f with SMTP id d9443c01a7336-29f23e1e3f4mr96736705ad.18.1765788465873;
        Mon, 15 Dec 2025 00:47:45 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.180.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea06b49csm127573265ad.95.2025.12.15.00.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:47:45 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH] kselftest/coredump: use __builtin_trap() instead of null pointer
Date: Mon, 15 Dec 2025 14:17:37 +0530
Message-ID: <20251215084737.7504-1-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use __builtin_trap() to truly crash the program instead of dereferencing
null pointer which may be optimized by the compiler preventing the crash
from occurring

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---

[] Testing:
The diff between before and after of running the kselftest test of the
module shows no regression on system with x86 architecture

Let me know if any more testing is needed to be done


[] Error log:
~/Desktop/kernel-dev/linux-v1/tools/testing/selftests/coredump$ make LLVM=1 W=1
  CC       stackdump_test
coredump_test_helpers.c:59:6: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
   59 |         i = *(int *)NULL;
      |             ^~~~~~~~~~~~
coredump_test_helpers.c:59:6: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
1 warning generated.
  CC       coredump_socket_test
coredump_test_helpers.c:59:6: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
   59 |         i = *(int *)NULL;
      |             ^~~~~~~~~~~~
coredump_test_helpers.c:59:6: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
1 warning generated.
  CC       coredump_socket_protocol_test
coredump_test_helpers.c:59:6: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
   59 |         i = *(int *)NULL;
      |             ^~~~~~~~~~~~
coredump_test_helpers.c:59:6: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
1 warning generated.


 tools/testing/selftests/coredump/coredump_test_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/coredump/coredump_test_helpers.c b/tools/testing/selftests/coredump/coredump_test_helpers.c
index a6f6d5f2a..5c8adee63 100644
--- a/tools/testing/selftests/coredump/coredump_test_helpers.c
+++ b/tools/testing/selftests/coredump/coredump_test_helpers.c
@@ -56,7 +56,7 @@ void crashing_child(void)
 		pthread_create(&thread, NULL, do_nothing, NULL);
 
 	/* crash on purpose */
-	i = *(int *)NULL;
+	__builtin_trap();
 }
 
 int create_detached_tmpfs(void)
-- 
2.43.0

