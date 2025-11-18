Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87784327219
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 15:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478197; cv=none; b=XJPbDuqgQ8es2QkFAfJiLC53utVMrLABycZBLDe2ajk2Fc+aUUJ3seZ+JjXWaMHWeWhbXSsxjW/l6MQFAj2erMMfLsBw2oJNcljwSOiSUgKbJ/kySAKk6JGAnmDCfYFRu36skOC75c1g0QFLsezvxRNmn69AOl0aWQC/rlSluak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478197; c=relaxed/simple;
	bh=ja/LkSN1dbpDQVhNZhk44Tv9iiJnHW6JXYkdYusMa/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DN7fzIwrs7vc+v9UVToIWs+VbyUN+VXM0p6Gclf9bAgmw1zrqBIXN5k3Q6Jqk88OuSSo+JVAAvsqablk28m7RPI1AGz7NPKE4JYDAfIfTxBpbyKioNJRlH/eW158Gc3Ab0t9l/6b1/MJ7kqVVqA9eziPPjiK7AnGgTSfWfJdQJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=XrAYdgET; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="XrAYdgET"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso6355622b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 07:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1763478194; x=1764082994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQlkNWnVWNMGqknsz6LYkGe/xvDLcv9mS0GeDyFf+Uw=;
        b=XrAYdgETJBlHt0wc9KXqRHr6qqsjtmD5imT0sisnTlirvMMgz6gHG0UPooO2i1G0gg
         TpxdLkIdr04n8loIhVNjEq2iP0kmS+iWVPmBwAYphQRdJ6K8I2iVq7wwWkC6jvIPl6U9
         29JzCe4FVgDwOUA3rorqPE7Z4im/Wc5FrzCPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478194; x=1764082994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQlkNWnVWNMGqknsz6LYkGe/xvDLcv9mS0GeDyFf+Uw=;
        b=Djj+egCd3dl+YplkVrD2DCaQEAYI9T5hZmuX4HCYIuLbSJXhya6jhdRheMAtJbWsT4
         TJwUGmoSgUL6J6dRcyXdJpPVkLUNLNkpobL2/yPa+6EsSvdyxWjjvPDwOCqWio9QvhLs
         1zWOdJzKAOXhTrAGuPJyTLLsOxuI46M/NlFRpp7FfssoE5o9PNmQ2KA0xIZSis0R24iZ
         Xs915/lPrCql7sq8OCxWWeuj4Ur2027lPZa4vjQdM7lzA+4MkxAWkNnXyyY+l4taBYAc
         YSwD6eMuq2jG1RDAYQXHcxu6tT59C1rmmQnOmCFxLttXK0Q+FaVsGa521YABHcFhmXNS
         6/5g==
X-Forwarded-Encrypted: i=1; AJvYcCWs2yOWBoTPW9CAE3hkGFwQahlFnzsexty8Vb/krUrF8GdV9XUI07uWzTHgxNuxPU09BSU9d4L9ilONkVqPlDpSGSdIgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxS/uDFKUzUFstJ6/omVh2zJdS0Wfsx5VpF6GKld9NE+OlNVDKG
	zH2Fn8JvNUc6IZ4gUVJV9mgfceLjHlHaTtSU5VQcGKVKrpFoWkWqbdmLPXE2yx60pQ0=
X-Gm-Gg: ASbGncsfcDaRz2HwS7wcQY9qZdZC1dTESMdaX20lyA0/AJdyI0FCuOFCxC7gRS9xjf5
	7Wmhs4g/X7wNtW8yzv6MShattVcCKAG6ZgPnmNeZ1mPxTq0ZgIyJvGtlptBQZmK7ruKd+nTvVAj
	6CxqQwu77zcYbrvXmn3F2Ezd6VV/jmbM9tnn8DcrewlSid+acXRssJHbcU1hIotGGlBspaba2/N
	LdGNagJKQ+Q/DQuF9dfHqRd4MU6GEV9JWtJEcBRqUTfOOmZ9QDRgQKsM8PtIv0ukx85ZT6HGgsp
	JBx6snUA39QgTCoIJkTQUVqhAAzTypVyXvW4Iiv0CTbeuz3RCsQ60mger3VMzQ4r1RCTywdohy2
	1RrAdorzxGdDTniBhR0b1N7ebXpXy0n4pGlEpNDOh06+a9K/UYAJSNwMmc9Fu93o/pb1EAheqAZ
	5nanQwiVdnMFkrJTGoaMxHIiiXM08j1hEkJplmayHPwt5lEe+J3JadvrzF
X-Google-Smtp-Source: AGHT+IHFIIwmUCgaGWygfpulmoTV8AMhwsMJO4oc5YwSM+A51tW7KkpVK+NA+2DZsJUMTDiHbm2Feg==
X-Received: by 2002:a05:6a20:7352:b0:253:1e04:4e8 with SMTP id adf61e73a8af0-35ba209f362mr17860446637.56.1763478193712;
        Tue, 18 Nov 2025 07:03:13 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d016:3cef:9de1:d6ad:21b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36db21e8esm15297990a12.5.2025.11.18.07.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:03:13 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: sfrench@samba.org
Cc: pc@manguebit.org,
	ronniesahlberg@gmail.com,
	sprasad@microsoft.com,
	tom@talpey.com,
	bharathsm@microsoft.com,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+87be6809ed9bf6d718e3@syzkaller.appspotmail.com
Subject: [PATCH] cifs: fix memory leak in smb3_fs_context_parse_param error path
Date: Tue, 18 Nov 2025 20:32:57 +0530
Message-Id: <20251118150257.35455-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

Add proper cleanup of ctx->source and fc->source to the
cifs_parse_mount_err error handler. This ensures that memory allocated
for the source strings is correctly freed on all error paths, matching
the cleanup already performed in the success path by
smb3_cleanup_fs_context_contents().
Pointers are also set to NULL after freeing to prevent potential
double-free issues.

This change fixes a memory leak originally detected by syzbot. The
leak occurred when processing Opt_source mount options if an error
happened after ctx->source and fc->source were successfully
allocated but before the function completed.

The specific leak sequence was:
1. ctx->source = smb3_fs_context_fullpath(ctx, '/') allocates memory
2. fc->source = kstrdup(ctx->source, GFP_KERNEL) allocates more memory
3. A subsequent error jumps to cifs_parse_mount_err
4. The old error handler freed passwords but not the source strings,
causing the memory to leak.

This issue was not addressed by commit e8c73eb7db0a ("cifs: client:
fix memory leak in smb3_fs_context_parse_param"), which only fixed
leaks from repeated fsconfig() calls but not this error path.

Reported-by: syzbot+87be6809ed9bf6d718e3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=87be6809ed9bf6d718e3
Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
 fs/smb/client/fs_context.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
index 0f894d09157b..975f1fa153fd 100644
--- a/fs/smb/client/fs_context.c
+++ b/fs/smb/client/fs_context.c
@@ -1834,6 +1834,12 @@ static int smb3_fs_context_parse_param(struct fs_context *fc,
 	ctx->password = NULL;
 	kfree_sensitive(ctx->password2);
 	ctx->password2 = NULL;
+	kfree(ctx->source);
+	ctx->source = NULL;
+	if (fc) {
+		kfree(fc->source);
+		fc->source = NULL;
+	}
 	return -EINVAL;
 }
 
-- 
2.34.1

