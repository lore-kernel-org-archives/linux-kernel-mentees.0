Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B823331A71
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Dec 2025 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788552; cv=none; b=M8ZZLfbRKVQPR1K0dj/nz3e97HphrTmfaqVbJlp2Ur/MXgW3J2G2PEbkQJGdLZvfZMUwk0YnM70kX0H6MEb0uU50dZ98C83jmGJTASgrxfr+KoBT4pVc4m6p/3NSwezIFBuIF9En7HNbh6fDMjLt2B9nB+Sb0pexvuej+Q7Axmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788552; c=relaxed/simple;
	bh=8i1Q4oq+cytJl0IcVUuiEN7sbmcQ3V9vJUtywYQr9Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g9FBsX01Mv719g4hKUvDcXFw+3oLsBL8zWl2ZrW7/KpHHochIUKuk+XAL+0mxggKDHhSjZxNzCyRxMJTPu3UJa5yoZDaz9EtO0RDNJ2KsWgPwZVbNn52VzGIyt5YFOdfwLcTlaaVoXeUYPWknJz8O3n4n6IagglVgp1JB4AAlp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jadogFa/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jadogFa/"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso2514704b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Dec 2025 00:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765788548; x=1766393348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZ3tmZ1IHwFtnfG4tSNUz05gU5jSKEuY1R6lKbDLdrU=;
        b=jadogFa/vKLe7rxSHty712bk0DtQCFVaSi57Mq/AHuYA3iIOtPiA7ScVWBHVodq1zi
         Czze1tEgEeSdD90c4qllhrFK745/0h6ZS7Bn5JcFUqRUscs3/LFGwIPCDYQeB1d7s61f
         zc4cXgl1kN4h8pB0ZpO6jZfHhHWMyPM6YPBAvUnGKujtR+piB58VMuHInU21bdRV0i94
         Ge53QcYbIu9xNO1hAnasXbmF1GP5eDQKRRhssWMkGFf5g2CKPepSWMIzXKleeTj3r+Y7
         6sICYIF3t2QBVnRlUCalvsl6QAqtAu6a6cJ5q0PVpEDwgGz/PBH+cDruocYlLY3Fs5uj
         GoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788548; x=1766393348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZ3tmZ1IHwFtnfG4tSNUz05gU5jSKEuY1R6lKbDLdrU=;
        b=XP7QhP/kFdtwfxj9jD9efoYBv5IsnXb8ZKvl/x4O4uhmU7meiWK4kUKQeobBhTw5kH
         IWPY0SUbhLxepzFW8JYkG6v6JNTngAbqzQbS4Elbt0mGCLzIcgKg14Mml9fWfYjoL+Kf
         KqEmUGXl0IR43IuibkufLM9nVucaJjlrDZUVYM+7UZs+5TL7Xw3p2QXMIy/WHhVotc3k
         3TQ7r7w471Gd1GZDXiWiRPmw++s228bXqX6bqO2vaw2af+gYzq+CZb91BleoTy1RxyBL
         8m9HAu0c8RKJKfEL07WhJTir1CBrn4ofHWQ9pXOJY+4p8QNMs3HETEwM5z1dcCQmeZiW
         mGhA==
X-Forwarded-Encrypted: i=1; AJvYcCUuDTI1H6hVEEkgtRODtZQQAofXx+Q/S6mdRcVXgioOd9Txv99Mru7EcY2Rd/RsMy8YgjLuran8jbXV8iZc/Uzhl4S6AQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLNTKE8hrVZpZ0BihVj3j0QzP30ad3phIF5iNhnryyuhsBDVr8
	8VotT35eg76lSLGW0/FCxEKPdIVLT8KrLCC3X08VnVGVQscYDNIgfe6w
X-Gm-Gg: AY/fxX5uZap6Pmr6E4EPAeMfWVY9/1Mv1d5agXfNGVsOTC6Nz43w9XvQQhKxyJkiSId
	n71niSMqjs+AugJUkIAeW+Cr7vqXjgMGnJw+aA5QqY6Uq/5OVjWCKu9dC4ET3VK7+uWqwwjLx6Q
	7RzDdnh6NUtCbcMMfzcboEYhYnOe1RKxQN/WkH0PRuRHQyRtNdDBmf6c7KG4Ypx76X21xgc6vrK
	SVmygvRbgZvsvD5V3hWvjdcFebD7oBXmiVUgUOp3d8QcxUl2rweWqCXXrXLxndNDjlLaFr8q3YL
	ofbcb5ZMQ9NdLdYD/fT2UgtXo0SjcYBBv3R8g6AQdFwo6mroHp/PbAAIGFxcvTc/cAL5O2FrFRz
	TUlpfZue1fwRYAOlwMt+ntiws6TcJklXr8U/Z5GzDEF7FR+n61twovzltxavDivoXWNIXfg/cEe
	SeqYXWXSR93+M2aA70bNrB0ia6ThuIWrEwheYpdTqqpxHBGA==
X-Google-Smtp-Source: AGHT+IGFOLhOHUN0HBIHPChEhB8BYMiAZvuRpj05aTiyNpnf/kXx8TbMc7tFpRcia34euXu/C2dH3g==
X-Received: by 2002:a05:6a20:6a26:b0:366:14b0:4b07 with SMTP id adf61e73a8af0-369afdfcb23mr9317176637.67.1765788548220;
        Mon, 15 Dec 2025 00:49:08 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.180.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c509cb51sm12035577b3a.54.2025.12.15.00.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:49:07 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH] kselftest/anon_inode: replace null pointers with empty arrays
Date: Mon, 15 Dec 2025 14:19:00 +0530
Message-ID: <20251215084900.7590-1-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make use of empty (NULL-terminated) array instead of NULL pointer to
avoid compiler errors while maintaining the behavior of the function
intact

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---

[] Testing:
The diff between before and after of running the kselftest test of the
module shows no regression on system with x86 architecture

Let me know if any more testing is needed to be done

[] Error log:
~/Desktop/kernel-dev/linux-v1/tools/testing/selftests/filesystems$ make LLVM=1 W=1
  CC       devpts_pts
  CC       file_stressor
  CC       anon_inode_test
anon_inode_test.c:45:37: warning: null passed to a callee that requires a non-null argument [-Wnonnull]
   45 |         ASSERT_LT(execveat(fd_context, "", NULL, NULL, AT_EMPTY_PATH), 0);
      |                                            ^~~~
/usr/lib/llvm-18/lib/clang/18/include/__stddef_null.h:26:14: note: expanded from macro 'NULL'
   26 | #define NULL ((void*)0)
      |              ^~~~~~~~~~
/home/clint/Desktop/kernel-dev/linux-v1/tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:535:11: note: expanded from macro 'ASSERT_LT'
  535 |         __EXPECT(expected, #expected, seen, #seen, <, 1)
      |                  ^~~~~~~~
/home/clint/Desktop/kernel-dev/linux-v1/tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:758:33: note: expanded from macro '__EXPECT'
  758 |         __typeof__(_expected) __exp = (_expected); \
      |                                        ^~~~~~~~~
1 warning generated.


 tools/testing/selftests/filesystems/anon_inode_test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/anon_inode_test.c b/tools/testing/selftests/filesystems/anon_inode_test.c
index 94c6c81c2..2c4c50500 100644
--- a/tools/testing/selftests/filesystems/anon_inode_test.c
+++ b/tools/testing/selftests/filesystems/anon_inode_test.c
@@ -42,7 +42,10 @@ TEST(anon_inode_no_exec)
 	fd_context = sys_fsopen("tmpfs", 0);
 	ASSERT_GE(fd_context, 0);
 
-	ASSERT_LT(execveat(fd_context, "", NULL, NULL, AT_EMPTY_PATH), 0);
+	char *const empty_argv[] = {NULL};
+	char *const empty_envp[] = {NULL};
+
+	ASSERT_LT(execveat(fd_context, "", empty_argv, empty_envp, AT_EMPTY_PATH), 0);
 	ASSERT_EQ(errno, EACCES);
 
 	EXPECT_EQ(close(fd_context), 0);
-- 
2.43.0

