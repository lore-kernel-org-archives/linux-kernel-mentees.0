Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F723149C64
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747410015; cv=none; b=ZvMZNvayVv83iE12NYi94HtVH7E0aKStAPWt3YNGiWVjG0D2S4LwkshT4IXUNb2biV/xoodi7v1le2IwJi4hlOM0Nu3dmCmMBRDMgKYgZPZD+WgvwuFioikrDA67Y3t9LlnjfXOQonyaKVV10ME7w2NNRkjDjM3b4oJabEDipc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747410015; c=relaxed/simple;
	bh=OkmWPTjquT7Em9YA1xUAAyJ9lTFW7kG9d9lFkrcF1xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4FYiyLp668SRmNTTqdSyJZk6/wCMtLRM5tRuh8Ste9mCrWMJXH8jEl6wdSZooYN2LMX1zGAd5qVGmLZUmBy7tcARB5LI1ueG7EpJU6bgcdsW6fNfM80LCL7ocSJHRZ7z28J+3tjfu9OCpZHoKaUixN7iWf7q2VbdXpKRiB364c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3ZCa0+G; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3ZCa0+G"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22e331215dbso25422825ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 08:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747410013; x=1748014813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oVa+nx7ZX9lU3h4aLIs2hsaIJXIw40eNIECVbp/jk1M=;
        b=K3ZCa0+GMlP6NapfVZB8pYi4eUVDAbci+0yCfIL5iq6VVyPN8ZkvyvFSThXdveNhQG
         qOjqf/kXSuT7WJ4byFSdkncXYYBZecc69MGXJ5lTT92LyDCbRd+hS2bZpQKl3xxt8r5g
         M5HIYqfGkB6jDVq4s2KeYQd0wYEMJ8dMxBR/eXrWt/qeNdOoVOir8s6wWv1TL6qPAdk+
         cpUr1nhzVX7kDyoWlsgVJlmRRAHAZHxsG0igpVFkE+2qn9CJqMNeaz9GhdeEi2xkr6Id
         5MPe9l7PmJHWRmybhmrvqM/VyzCzIBrdfTxj6kAb6bgZKK1Z1/aML06X8zeroPRA71TH
         zQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747410013; x=1748014813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVa+nx7ZX9lU3h4aLIs2hsaIJXIw40eNIECVbp/jk1M=;
        b=Io6XTRhAXB1zWpO3sgixIYkq7Z+7Xn3wekqDcAZb/ze2JQVTgUrOc3Nn2eS3cI9LWw
         Spmx7ydkoUwmOtaOuIXS1ZsxcR3iQG2rzsbunMvPSJ1kvuIhZsJwWDuroFJUKpu2uSjD
         A4hteEyWNKVcoMeyx8vk88Ycqrwer8UETl+9ZXU9rRW0V9h4GHLIIgtn8jYZNSKkO9aO
         TvnDemExDqi+9cEBEvy+7YZGywhFtpZ+t2EyM9VruWls4jbCfxwfdJtIAq43CzxE+x0C
         fbkHbQ5LS0FPnh5+gjV+8gZ/IZ9L5w2waO175wTG/U+OsMstduJ/u/EuZm93U8Yj7uqw
         BLfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjesUDZKzh1uxs+fUlIvpX7D7aYo8pJVsMs4zaAL0ainVW+FmOsK+IDfuY5/uPr3Eqgoytp/4OP7k7dzknqpzIqfb3QQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPJTtq4tze1srqFyYj3APPK7ckhL6Ot4gDHsev9roLZF+ZEGfI
	hctix1eccD2x0jLpUsQ92L3SONm+O6YHRtB8HHgFmPTj0XQvElFBnpTA
X-Gm-Gg: ASbGncsJjKE7RHC1PUiIyP4SlLapqDi3XksArATJQHBt3gI/F+F5I02/BEkddse3jGf
	TmZhRoWbLeKzG2HhlxD/0V4FVDqMa12hdLV369B2gnII2U3r1GOukvNj0RV8xsPODW1JpsbFeIL
	qUeNjS3r+zAEJbuGH8qODUZKjqwA9QPCZj2smSXUX5X38fppPAyBZ4wqMVAihudTYjkTWi6Z8kg
	7Ims6aTv1FAuguwFIsEAWtoyKPI6sk6j1HAaCqMk7G4Yuxyy6WScqJIoEg4faSiirerb6V2bIgp
	FyA/l3ZVAjooxzgr+LlSc7sWxShIWUSkqP7MDXfFbZVGE6eyIIlCDq8=
X-Google-Smtp-Source: AGHT+IHy1MRjqcETdIo/u3ddZC5u7do+au8+0mzwwoELqO0h9122LYf6ihu0l2hPu6Hx0SNxBvRd7g==
X-Received: by 2002:a17:902:c202:b0:231:c89f:4e94 with SMTP id d9443c01a7336-231c89f4f9amr57706715ad.21.1747410013439;
        Fri, 16 May 2025 08:40:13 -0700 (PDT)
Received: from harshPC.. ([2405:201:400a:31fb:ab0a:c20e:fff6:2111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e980c0sm15779495ad.126.2025.05.16.08.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:40:13 -0700 (PDT)
From: Harshal <embedkari167@gmail.com>
To: shuah@kernel.org,
	skhan@linuxfoundation.org
Cc: Harshal <embedkari167@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] selftests: firmware: Add details in error logging
Date: Fri, 16 May 2025 21:09:53 +0530
Message-ID: <20250516153955.111815-1-embedkari167@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specify details in logs of failed cases

Use die() instead of exit() when write to
sys_path fails

Signed-off-by: Harshal <embedkari167@gmail.com>
---
 tools/testing/selftests/firmware/fw_namespace.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/firmware/fw_namespace.c b/tools/testing/selftests/firmware/fw_namespace.c
index 04757dc7e546..deff7f57b694 100644
--- a/tools/testing/selftests/firmware/fw_namespace.c
+++ b/tools/testing/selftests/firmware/fw_namespace.c
@@ -38,10 +38,11 @@ static void trigger_fw(const char *fw_name, const char *sys_path)
 
 	fd = open(sys_path, O_WRONLY);
 	if (fd < 0)
-		die("open failed: %s\n",
+		die("open of sys_path failed: %s\n",
 		    strerror(errno));
 	if (write(fd, fw_name, strlen(fw_name)) != strlen(fw_name))
-		exit(EXIT_FAILURE);
+		die("write to sys_path failed: %s\n",
+		    strerror(errno));
 	close(fd);
 }
 
@@ -52,10 +53,10 @@ static void setup_fw(const char *fw_path)
 
 	fd = open(fw_path, O_WRONLY | O_CREAT, 0600);
 	if (fd < 0)
-		die("open failed: %s\n",
+		die("open of firmware file failed: %s\n",
 		    strerror(errno));
 	if (write(fd, fw, sizeof(fw) -1) != sizeof(fw) -1)
-		die("write failed: %s\n",
+		die("write to firmware file failed: %s\n",
 		    strerror(errno));
 	close(fd);
 }
@@ -66,7 +67,7 @@ static bool test_fw_in_ns(const char *fw_name, const char *sys_path, bool block_
 
 	if (block_fw_in_parent_ns)
 		if (mount("test", "/lib/firmware", "tmpfs", MS_RDONLY, NULL) == -1)
-			die("blocking firmware in parent ns failed\n");
+			die("blocking firmware in parent namespace failed\n");
 
 	child = fork();
 	if (child == -1) {
@@ -99,11 +100,11 @@ static bool test_fw_in_ns(const char *fw_name, const char *sys_path, bool block_
 			strerror(errno));
 	}
 	if (mount(NULL, "/", NULL, MS_SLAVE|MS_REC, NULL) == -1)
-		die("remount root in child ns failed\n");
+		die("remount root in child namespace failed\n");
 
 	if (!block_fw_in_parent_ns) {
 		if (mount("test", "/lib/firmware", "tmpfs", MS_RDONLY, NULL) == -1)
-			die("blocking firmware in child ns failed\n");
+			die("blocking firmware in child namespace failed\n");
 	} else
 		umount("/lib/firmware");
 
@@ -129,8 +130,8 @@ int main(int argc, char **argv)
 		die("error: failed to build full fw_path\n");
 
 	setup_fw(fw_path);
-
 	setvbuf(stdout, NULL, _IONBF, 0);
+
 	/* Positive case: firmware in PID1 mount namespace */
 	printf("Testing with firmware in parent namespace (assumed to be same file system as PID1)\n");
 	if (!test_fw_in_ns(fw_name, sys_path, false))
-- 
2.43.0

