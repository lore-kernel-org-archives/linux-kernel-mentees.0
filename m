Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DDD13D893
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 23 Mar 2025 03:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742701652; cv=none; b=a6HTMNKbDvba9xIZatP8ISnHjzsyLmhxiftqMs5I6D/YCP+qooOykLwvSMFbuhZSp52m/1BN8rCabXnQcCaupjXiMkFfUGECahX4rNIhDsgSd8zmfRWq28WkDN6LlTFjgw1s37fKzt54v1SLyB3RiXSVzXBiy3eepxei6gJDq/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742701652; c=relaxed/simple;
	bh=WEU78p+4ISCb1u0XqjPlV+IporpqnM/H0CSjyncfgQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j0ggCx4GvECzZAjeMw5dMwTm7AwVwQXy2R8SrDpWG84tkX7Q6O1owMYxhkkRTUkJP12J7pVN9bxxBUf1eEZlsXrDBdSUtvwzhrfdH6Z/m3XdHlwVAfu/py8F1E7DAy4IWhVfMEqbaU6Tv6gJy1pJkvJxBf8N5IcFWm257I35eXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBx4dVxD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBx4dVxD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-226185948ffso63320135ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 22 Mar 2025 20:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742701650; x=1743306450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6XOCol3u2a6nPObOOGbkI8Fg5Rq3rgeqOQ9YANUzBs=;
        b=VBx4dVxD5Hlo8VgzljkJkK8UR0d+6T/FnDK6HghoRncpmjcYXMBKtLHT7ZLf6n06xZ
         pcFUHcZLvvgqKMmIRZjOuJc5QfeYikRQldZRk9F9epGGtmV6cjYC1/j7feeKBMFo4F/9
         zdWAxMW/CKTe4zz60M8eBgXCJ7vYmrswttYUvgjR5Vlfykh/CbiD6mtyKK15GC06PUEu
         GZM/EPnLFHbI/lfb3VKsMLQtESpVB/sSnGNU8AqloOpGtlxBjXavdnPbm65uotimNeG1
         WrA/+jWHTD19lQG+ub0JY1siZbiSPCxefC1vkfhZ8L3P63pP1Dal73E8om/OCHSmBbxj
         J1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742701650; x=1743306450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6XOCol3u2a6nPObOOGbkI8Fg5Rq3rgeqOQ9YANUzBs=;
        b=Vwp1idCkjFzMiQcy1MKb9IsQ4Toq6GjC8aPrSo2SR+8TBHAH72rfzR+9jZi8lnmoQU
         68khholPegzsnwJiOLjBWB7ROi7/7pYVxQe9yxOCEY7mFt1dR55gbWtna7NzcZTJt6Kw
         Wjgr0pMod9EoE5ZmkpBs5Bmaqi0IJ9KqeNC2O0t0k3D4zmbf/v55ZOixPZcCLFpq1k8H
         SVRnpQRCF42Do3tuFg40A5jAjSLCrinP75t7qe8mfZjjMUE6DhRTkW1+mRBS8Ku1jedZ
         WmLWN/7qRby6ZwCMMPAxLoYnJDZV4wamsqUpM/3OBH9dHNQ3u1+8yGMz4HJjwjnfQjou
         O30Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlW+qCSV/LbnMkoDRrdC7grfajdUosB+SARuOzmkhELUogEuw6Py9MMsdJemul1D1KhQNKqX6qvs0NjVjSozGFli1uwg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxlh1EToYxJzhk9QZ9P2v9iLH79xQD4mHvrrbAEwxH3/7wcjt1w
	fWWetBw2FpBpTSxVkQGggPSuCLZW8sGRPP9dIWx9FOyANfbA/5wo
X-Gm-Gg: ASbGnctjpq5kqa0AHHS4AChGyuCBOHLswhLb4DFgDoyM+y/DABuRUebmL/l0PnBJPxf
	ep4E7jlCOOz4PqXg42DbiAKHduAQFiqjjkcDZaAPM1ZLRRl/nNCv1QeRlHWuywZgVDSMFUQrOKm
	sGio+w2yRRtuvkE2nuXEaT6rjqA65zEE44Ea5VJLvQaiWKqHz8rwMKS/uSA5flmCdycVftawyHP
	mVhHWzR17N36R1wOtsPLAhkssbLlaawvk2p5XG2SV/d6DMX6dgq8kNLaBzLEcoAVNsIGXydKrcF
	RAQRc2GiwZE3rJZQfTp6/vRSCixcZimBBLvVnfUB6f4QA2LWJ4X/1Y8u1TriA/SrtdkGsleFM/o
	=
X-Google-Smtp-Source: AGHT+IGUsaWLVZsiSf2Nx/UAovAOD7/IzjSlUccrMhNTRIciOQVi+kOE55M63M4IOxnqDRElDxhI9g==
X-Received: by 2002:a17:902:f54e:b0:223:fb3a:8647 with SMTP id d9443c01a7336-22780e0a4b3mr137083985ad.41.1742701650031;
        Sat, 22 Mar 2025 20:47:30 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:ea7b:3f3b:ca04:6bed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3962esm43771985ad.4.2025.03.22.20.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 20:47:29 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: corbet@lwn.net
Cc: willy@infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] docs: vfs: Update struct file_system_type
Date: Sun, 23 Mar 2025 11:47:25 +0800
Message-ID: <20250323034725.32329-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The structure definition now in the kernel adds macros defining the
value of "fs_flags", and the value "FS_NO_DCACHE" no longer exists,
update it to an existing flag value.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 Documentation/filesystems/vfs.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index 31eea688609a..4e7fa09ffb6d 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -115,6 +115,14 @@ members are defined:
 	struct file_system_type {
 		const char *name;
 		int fs_flags;
+	#define FS_REQUIRES_DEV		1
+	#define FS_BINARY_MOUNTDATA	2
+	#define FS_HAS_SUBTYPE		4
+	#define FS_USERNS_MOUNT		8	/* Can be mounted by userns root */
+	#define FS_DISALLOW_NOTIFY_PERM	16	/* Disable fanotify permission events */
+	#define FS_ALLOW_IDMAP         32      /* FS has been updated to handle vfs idmappings. */
+	#define FS_MGTIME		64	/* FS uses multigrain timestamps */
+	#define FS_RENAME_DOES_D_MOVE	32768	/* FS will handle d_move() during rename() internally. */
 		int (*init_fs_context)(struct fs_context *);
 		const struct fs_parameter_spec *parameters;
 		struct dentry *(*mount) (struct file_system_type *, int,
@@ -140,7 +148,7 @@ members are defined:
 	"msdos" and so on
 
 ``fs_flags``
-	various flags (i.e. FS_REQUIRES_DEV, FS_NO_DCACHE, etc.)
+	various flags (i.e. FS_REQUIRES_DEV, FS_BINARY_MOUNTDATA, etc.)
 
 ``init_fs_context``
 	Initializes 'struct fs_context' ->ops and ->fs_private fields with
-- 
2.43.0

