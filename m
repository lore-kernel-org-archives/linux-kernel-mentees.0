Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425E52E2F1E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Jul 2025 19:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753903689; cv=none; b=dtH+w7dI7bzaRCQrAQ4cbpB8GFi1xMOIBLxUmgmUI/f76HN+ccB5ObLy8Dr+qcbEE9Sgf4LtcZJ4bWANUz9BPeSb7B/1/nGENNROMnCQoxlz1d0ewE6Vl9PliJRv80tvTeuHoE658QgSPDJUzTUO7vF0gI7DhtjjTWz5shtUy5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753903689; c=relaxed/simple;
	bh=iR5+uRBldWlcUKs+VpB/kO7cqjcEx28y65V3BAPL9OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Avuf6gnWjmxPs1JlYboNjcy1fMYl5bURm2RVAff/gXyenhNVymXZMr3aEpPl5vVbeGbzY8Grd6u2DMNGR0cBaoZrxuJdCYWjhPnQQi3te5g7TI0ompA6rceqzU1jspMsHdGqKuxXmtUTQn1cg+7Fs0Z33f8q4hmOmfZ21p99T8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0VZfar5; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0VZfar5"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1D4F83FC1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Jul 2025 19:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7LBFN9wSWJUz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jul 2025 19:28:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2090283FB5
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2090283FB5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a0VZfar5
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2090283FB5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Jul 2025 19:28:05 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76ba6200813so32903b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Jul 2025 12:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753903685; x=1754508485; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNG8DXgwAP/5jPmamkbii8OoUAG4/pKAFcQJx/eZgY4=;
        b=a0VZfar5TXZtern+57YV1ZUdePHSyE5Q2vvv0/nLFPW7p4elA285U/JQvU5IbEEuB1
         mfs4nU+ODcDpZtqgftwjwJIrjLtRGS78UWKilB2V1zU/i29XUpUwZ03lAjf/jDGUB68/
         Dmq6awfsY8yiqnYI02J6nn6qZ0vGdeWX+XyhHPsfKSSvC0WvSk6ZcRKmixuzCnSq4P5e
         eQuYzxPNS6VedG99DbBcGbQbUqNjTcqA3Vr9kstPUbptzZgSXlOdvmQ1+ItJcVnCbONI
         D3usSg5+cgKTSZkEqPWToDTI/RSlJR0cyGf5UsF34jVk+SqCF36xXIk3VI5cwFzmf/Fw
         L5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753903685; x=1754508485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNG8DXgwAP/5jPmamkbii8OoUAG4/pKAFcQJx/eZgY4=;
        b=mqG6t4aea8FlHrHryXlbdwl02YR03hicKii7EzShvvdYzPengrnajXT9wUMvkEFmz8
         2dilCSeG+0KeDS6ITnR4dH4yBsAWK3Sa0TWdu+gCpTKqlqyL4UEDXG16R/lgoc4/4Vfn
         wumA6mdqqwpDRDMtja5z5Wr4+llq7ug6tkD9lAl2CfVPQVPkcMFsshapzvh7k8QknOZn
         HDaI6/Bl+2qUoPg74i/Z0STld/14V8FZEEpO8DDAp7Fir1Z9C2TKIBLFuoRg0mUIRhGF
         60vYbEeRwEi3T6EwqL7X6QL74k4q3m8NtLZpXg/8RQmEPPYS4ViTgMW+5cXTW2+w277o
         8upw==
X-Forwarded-Encrypted: i=1; AJvYcCXDxK+a8DZPV2RbZ1x04emP4cgiAXZXdGsUwDwuzvOKpN0n/HvIn1xPNkLSwJv5w4wc+alohtlGTZOEsblFonMPzeVzhA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzB7UZIKG17ujFkgRT0SUILeBOJHQkGFDyv3PkNCevJPKQsrV9w
	mll0XSDq74szJZqGHqLLPxuXuGOkpf0gMeU+JWx6RZSMb7S/ytaK9z0P
X-Gm-Gg: ASbGncvbtLEqGHlTlAq2+PjSzCXhGgYOxz74SEI2hsjJziRe+U+ey+du2sThUGXdFha
	4oYf4Du5CRpDcwRa0A/y0CZ+zN9sEVyIvQ3ZlktVGvGOq5d9cAYJWMddfqW/sbr2DXXRPG2ff0l
	hzxhlyw682qLkJIuxaz+HdrqALxKiDYhPK5i394AnLFwnDQKQb0DZ5/XAp2cCQRTirgkc8vxQEO
	X6jJf39ylqpaFT4MdhbiriIAPxpypvWX1GiU/r20vH+hSzHo9YaZygT/4J1q+pS3rdeBsEAX1l8
	VUx8sq494vzEBfurcLPLpbv7lvO7eYCbqiBoItiybzy19r0rZgHDT78UK2LQyNauiry14MjZW0L
	x5hZSVIcGqJe66SikybZ39o5X8xXIkg==
X-Google-Smtp-Source: AGHT+IEoZQqMr5MaOBTYKOEj+gA/zIED+BbftxKTZgXXgkW3/liGpeyXixM9xrSxleeRxCUjjW4w6A==
X-Received: by 2002:a05:6a21:9185:b0:231:242:2596 with SMTP id adf61e73a8af0-23dc0e90f22mr2890425637.5.1753903684654;
        Wed, 30 Jul 2025 12:28:04 -0700 (PDT)
Received: from ranganath.. ([2406:7400:98:2557:8eec:789f:9109:20e3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bb007b77asm1256508b3a.48.2025.07.30.12.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:28:04 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
To: shuah@kernel.org,
	jlayton@kernel.org,
	brauner@kernel.org,
	broonie@kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Ranganath V N <vnranganath.20@gmail.com>
Subject: [PATCH] selftests/filesystems: Fix build warning on anon_inode_test
Date: Thu, 31 Jul 2025 00:57:47 +0530
Message-ID: <20250730192748.39517-1-vnranganath.20@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang warning null passed where non-null argument is expected.

anon_inode_test.c:45:19: warning: argument 3 null where non-null expected [-Wnonnull]
   45 |         ASSERT_LT(execveat(fd_context, "", NULL, NULL, AT_EMPTY_PATH), 0);
      |                   ^~~~~~~~

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
 tools/testing/selftests/filesystems/anon_inode_test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/anon_inode_test.c b/tools/testing/selftests/filesystems/anon_inode_test.c
index 73e0a4d4fb2f..f796dad679db 100644
--- a/tools/testing/selftests/filesystems/anon_inode_test.c
+++ b/tools/testing/selftests/filesystems/anon_inode_test.c
@@ -38,11 +38,13 @@ TEST(anon_inode_no_chmod)
 TEST(anon_inode_no_exec)
 {
 	int fd_context;
+	static char *argv[] = { NULL };
+	static char *envp[] = { NULL };
 
 	fd_context = sys_fsopen("tmpfs", 0);
 	ASSERT_GE(fd_context, 0);
 
-	ASSERT_LT(execveat(fd_context, "", NULL, NULL, AT_EMPTY_PATH), 0);
+	ASSERT_LT(execveat(fd_context, "", argv, envp, AT_EMPTY_PATH), 0);
 	ASSERT_EQ(errno, EACCES);
 
 	EXPECT_EQ(close(fd_context), 0);
-- 
2.43.0

