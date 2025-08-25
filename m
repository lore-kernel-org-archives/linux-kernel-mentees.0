Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C51AAD21
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131079; cv=none; b=fW6rw/FUcVuujumZFLf3wGihGFp7gl/o7pi6xnUoSP3kP81913iUbrZFNZO5751x/2tTVfr59uS5pyNAP9teo+ONZJugoPmr3yGpQWiEwfcY/Iwkk0NA5Lf9xpAefbCmGK+lxLH3qs5CF73lBWDJDeGLEobq2amdWmaRBORCejo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131079; c=relaxed/simple;
	bh=8tUVEOHCd6vgZOjmZ6wGCyZD35jdxuSt3593rFQJiRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gm/CqR3KY88jd7wO79MFNoUMBKDQEUs2DTYgyJZPu6m+wNJQ5WnxdC+Usig5tRHDWD9n1YQd2WmJhD9GxOp+UVg34RL5W1fAmarID/NV9os599RoxCRI5KOZcYJj+j6p/JIQDUo/nUEZmw8i3UHA1HJdP83D3l2KgDzwRxZmOXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axqu25c5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axqu25c5"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77057c4d88bso968298b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 07:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756131078; x=1756735878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjnd6OOtdW9yy47zlEw4IHguBzP7Muvi9jj9yhTRBOE=;
        b=axqu25c5ztYYOj8zWG9LUW8RSDEmnbnlsE0Rr0AhK8kmFaLhWejw5n39dysGT2Z6Rz
         nbyzTD8AFWrGJn+1oGNUR6NfzGPjNaTbpoIvdJgh7l2TFQAKZlQ0eh9L5Tm89vyM1Iqb
         GueB/ssQnRwu0O78loYlvt9aATvcfJvRQwaZatF2nsEz2p+sGEMzOMRu0yFJwDpjiqFj
         +kUImxZCPu+KXWhJCMdP2Y0C/FOnT5E8bxowHfqr+3msb5lnNhY4DDXOUGUqsy5u7kOB
         +sGy3bBLeJbjuEgLqWtgoGLReePiaZnpxX+/6YvXis46mOeb3eigS3kN2lW3Lw5pDEwU
         56zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131078; x=1756735878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjnd6OOtdW9yy47zlEw4IHguBzP7Muvi9jj9yhTRBOE=;
        b=ZU8LkO7cJfmbm+LdUp7uhStBZNEh2A/MsSMWVIfLNl0s7q5zM21OTOzWd00YeWS7VI
         hotSIRoUpi+FvsrtSjaTTn1PXI9htxayqJ0P2Iu0frxD2a+6K4D1dwLUt4E6Oq3jNJaZ
         9wyf2OYdE4rIR/9G+8uNGUmKongvGVVpDoOLYmCg1NM9gCBH9IqjZnVd/c4FhuN+S0sq
         ffmQhnLahbxKdXUbkbsLo0v702RsQuyxomYH3XokaQbGdSRAjIchteBNumlHsryR+dur
         DllIAPAS6Bz8eQ5SmbECaAmKW/lPd+8Qm9fU16Fte4BvrYRz4ca9uQl52aabPZOehh3R
         m/og==
X-Forwarded-Encrypted: i=1; AJvYcCU/PeKtjYz6WHiUvBF6vnQKJEqFwhBYUR+lYrr2DFfZWkh/4zYwPvv02xfRbaHjBoF+JhkSdQrRkuxIc2OQLJV5shb6dg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywooh54dVN6XX1uG02SdloPLwje+4Ui9XEscKwnrMGhYWNGepiy
	lT8uSwQGXTNGE/Tg1p15FdJ4nzCGx9bfxhHvVkG92vMybu1g/pihxHl0
X-Gm-Gg: ASbGnctQSZmEnKaiW2SMPFC+hJgpRCbnyhWiuzz15dxp2JslI/+eOw/yyAlk8V/BNMV
	g3JeVauXtKcf+RTz1DE/UkaNoezP+wvIdDDFap0t+VkyAQFbkrvjD80HNLsJDcLd/UWXx6jt0Xo
	dmFdepJNitlhDBZURAIcBeoNApzl/lTy6RlWnFbkI0L74QTkMzAg44HpiCx6PFZbUBG603y8/+k
	GsSKbt9JsbvobZBwT5ooruZ92FQ6PxOGtJA7EXLurfOzS2qUMOVKOtoFePmhMkD+WraqFfD9rXP
	atn/l/PS2LHcd0+v8keRqzYLwjBvG1yHp99OSEQImk7o8QdB2DSp9DPG19CEtMDHzXKeyAPN/i6
	AoXgUTfFKndbehXuF6Cijl5bo8VxXYYk=
X-Google-Smtp-Source: AGHT+IH9IQ/cnIrvgdxRRwfnU8634VcDlonbLYpJ52WBpEUVMfMAEG7Ir/57MCsg9YgcQrfLjX/DgA==
X-Received: by 2002:a05:6a00:14d4:b0:769:1f94:85bd with SMTP id d2e1a72fcca58-7702fc4681emr12769053b3a.23.1756131077273;
        Mon, 25 Aug 2025 07:11:17 -0700 (PDT)
Received: from archlinux ([205.254.163.102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771e912e40csm2108786b3a.44.2025.08.25.07.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:11:16 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: apw@canonical.com,
	joe@perches.com,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH v3 RESEND] checkpatch: suppress strscpy warnings for userspace tools
Date: Mon, 25 Aug 2025 19:40:56 +0530
Message-ID: <20250825141056.7683-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checkpatch.pl script currently warns against the use of strcpy,
strlcpy, and strncpy, recommending strscpy as a safer alternative.
However, these warnings are also triggered for code under tools/ and
scripts/, which are userspace utilities where strscpy is not available.
This patch suppresses these warnings for files in tools/ and scripts/.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---

Changes since v1:
- Create is_userspace function to check if the file is in userspace
  directories

Changes since v2:
- Change regex pattern to match top level directories only

 scripts/checkpatch.pl | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e722dd6fa8ef..fe580b0810f9 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2636,6 +2636,11 @@ sub exclude_global_initialisers {
 		$realfile =~ m@/bpf/.*\.bpf\.c$@;
 }
 
+sub is_userspace {
+    my ($realfile) = @_;
+    return ($realfile =~ m@^tools/@ || $realfile =~ m@^scripts/@);
+}
+
 sub process {
 	my $filename = shift;
 
@@ -7018,21 +7023,20 @@ sub process {
 #				}
 #			}
 #		}
-
 # strcpy uses that should likely be strscpy
-		if ($line =~ /\bstrcpy\s*\(/) {
+		if ($line =~ /\bstrcpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRCPY",
 			     "Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88\n" . $herecurr);
 		}
 
 # strlcpy uses that should likely be strscpy
-		if ($line =~ /\bstrlcpy\s*\(/) {
+		if ($line =~ /\bstrlcpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRLCPY",
 			     "Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89\n" . $herecurr);
 		}
 
 # strncpy uses that should likely be strscpy or strscpy_pad
-		if ($line =~ /\bstrncpy\s*\(/) {
+		if ($line =~ /\bstrncpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRNCPY",
 			     "Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90\n" . $herecurr);
 		}
-- 
2.50.1

