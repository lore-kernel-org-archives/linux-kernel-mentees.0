Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51662341674
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Dec 2025 11:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765884765; cv=none; b=X+KDDNs+32+aK1fMKvIbxvmttatA56fgP/XM9rbPDnsb6TnbveK8B6+l0f0mlXSE0GeM744rwjT3d/37MhzJPM8oggzjxfN+AdZ//fyJmvqUKPuH1vsMyLhbeZl+b8F1wlQfZ6sJcz7lCxcVmjMsNdbum1uYPWpFUMY7Ok3lstI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765884765; c=relaxed/simple;
	bh=8i1Q4oq+cytJl0IcVUuiEN7sbmcQ3V9vJUtywYQr9Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uwqThz/S47CTiFZ2oV9Vo/nBhpbvGdUGBRP+FWT1TgZKFnwm9SK7VDkgwcD9HNiEvl7MtgqOwc6ZRbLtDX3ZXKDxfxrNbPVLXsNNpvRCvO2NEKKP0mD0SaxQkaR9X6debi/b3b+AODdeo23eRsZCgstpwB50XrOBR6SpTjQ3i5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcrjaYNi; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcrjaYNi"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so4765407b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Dec 2025 03:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765884763; x=1766489563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZ3tmZ1IHwFtnfG4tSNUz05gU5jSKEuY1R6lKbDLdrU=;
        b=mcrjaYNiytHEo44JhiYjJsMw9CdUfIst52X61SrMLkNNA/7+LR6kfTQlSn44iL3X0d
         bOQZdWNUST63rDfc7e4YrXPBqKkcrJgDNRNRZ9ts8dRH1qyYqK/fE1d5+5CUEQ3TOjD/
         ysqNDZzYQHAtVxFhM6EHVRHaPhgeS/kTOE6e0mdJyJX2BLpZwAI0OlLQ+xh8NIbMJ7k9
         kg2rNLJavYh9u1WKvc8mE2BTakJpBIbUUtpJByJzsS1Y0VrdOqHOjqpyuQmBo5rv03Yx
         AfM7PqFuvS5OZb36jFBZBX/99QqMPXRle/af6bViAAs7tuKDHi4M6c9XwQfeWuw5K6Hi
         dtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765884763; x=1766489563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZ3tmZ1IHwFtnfG4tSNUz05gU5jSKEuY1R6lKbDLdrU=;
        b=WVyW2/LL+fWvEkzHn/8RnxaV1ww3y8XeECdCruVcPQUSNRbElZ29Ke/XgWPAgDUPGU
         PHre1RPN1hiiz5fO5b1zwTVAbojA+yIiDhQcFEC7RBX0DEj3n8XrUSwo85MT0O7hXIYJ
         0ws8UP5H1tgaNc0azmifdYPj6m59llr+QLdu3KvSfsLwCQXBRyrNoPjGDnbNYW1I7Imz
         blkqdr4agLKjxSzxbp5qYs43yo0e4ZsQ/5l/q9cUcvJlsbztwSC8pYioE6S9UQjYxRF0
         kXKtXuqp2ymIJGFIhgnGPOQPrJfcvaTohPJaoyrx9EWhHH3YUrc4CSRzIaXPxkbygd47
         6NmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw6r8nKSvEemiUF/JA0/OmxJwLCrIcVV+m87P2y3dpveXdfxjfUx98PcP92YKk6D0ImEswCOrHVFjYYemJpA4U7P9HPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAKafYKjCuRro2JYJZJ6GaS01vm6hYcweRDmRS8T4R8DNNO0ib
	nEEGN6kfMi1JtzY2Hl3fyqM2/JqhpOPlHfcGOOQZHMZRlJ31EFKeGh/o
X-Gm-Gg: AY/fxX6dTfQy+nwDw3nZsqRp/rnnLvetLDLX0Qh5GZ/Zr0i68CQ3iaOY527RGlj+C6/
	qXc1/Qvv1TA71reV4bj8L4DuVd+BlXcp6Y6rlLNMHSarrjjuxRYNTKyXmRwzwtFexJsJk4bpFgZ
	SsqyV6g0LZnjpoIzpsj9dfkWL4Caw+ME3WgGf4Fvr484IAY5hBj6vZ4yM7BuDi9imHpK0FMD5Cm
	WBfTqQMZSLYfCgBkZXzjB6/pPtznhqQ5j1N4iuavEdRkPgqc/+yw46qZOg90Zb0t26OJLi4njoZ
	dbcBXyRF9Juf1dOKuXw271QNfe9p9kyhQQmMAJ46IA6tkEA3FMuAErbq4rt1anyIiEm9/ERF7Xi
	OLXKKjvTB8dLdmt7vALUAK5PL1TJaY+mDDaYDXzChJzWUVl5YHDwCZGfFUB6iNu5p/pu6YsN0FK
	2176E3jbRgsr+PGri29/GvHxdQPHtUiDWo664=
X-Google-Smtp-Source: AGHT+IFHsfLEVVPCBJUNo6ehMO6o3DkxZJTvcaro+U6PBAF85TV3OLtEPW0YkxInyTeBVEV720SCaQ==
X-Received: by 2002:a05:6a00:3007:b0:7e8:450c:61b1 with SMTP id d2e1a72fcca58-7f67156b80amr14130957b3a.33.1765884763520;
        Tue, 16 Dec 2025 03:32:43 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.180.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm15317899b3a.3.2025.12.16.03.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 03:32:43 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH] kselftest/anon_inode: replace null pointers with empty arrays
Date: Tue, 16 Dec 2025 17:02:35 +0530
Message-ID: <20251216113235.4896-1-clintbgeorge@gmail.com>
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

