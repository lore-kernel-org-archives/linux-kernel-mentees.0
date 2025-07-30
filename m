Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBC42D97BC
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753886530; cv=none; b=gJnpeK1OAJghd4+S8S3dGPHz/bNHKB6VP2eJLbzJPkgFJ25u4nlsiQY98TX5GSTU4AljjOy71qjOMt4Hut0gndYxZXzp9/r2Vxu4tV8Nk/7EZI+h/5KtOD4syLTtdq1LemEOeFr85kgL+KRKSac/WptR04OSg00fOUj1XdaX1Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753886530; c=relaxed/simple;
	bh=yBKebHSmHOfmlKzt4dxWwUdm5H/+xqmsFAEGPRL8Vqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZwZPLVc/X2ugY5SoXLHTTkVeCKsmDs601+0zQlSrs1UnnfLVL9S5fusZXDPQ5VJCzdJMW2/uPVEfI289mShyvuSedT4WIQBOcyQQ/yxmckxwLOpbXDi2IwXlJZAsvvMWS2fkqMln8PfCwPgk+mcULVh4KDD/yvMRKTaoXESVMqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eos/e5uY; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eos/e5uY"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b42099901baso2572470a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 07:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753886528; x=1754491328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYHDRzJKOaAYMNCXSgPR1P5klbcOxCCuVtkaiNHOnc4=;
        b=eos/e5uYaBZATOXuda2mWCDxEo7X8TXFr3goyhGqLk6SawHW2jQpL8Cp+F45VJooFv
         S1KTex7rNMIYmQvUXyBAngvQArhL0DMjtmsLLjuXAP8/pZRBG0tfgUeAGqPaZ5RxbpR1
         9AqiQ3Cpwv0Os2D5ZnfwZbE+A4YSSXjjrJpguAy4rN7lgNflDEs5WNJwuBpw7iv8ZYOG
         h36ZvQXzGf5xmv++4p/sQJspT6GRC6Nv/xXbBG3F7pX8+vrj6k1MTf2QONjAM8419GzS
         UnzwZthmx9PmTDhxoo9M1CTxhQmMvc0/2A1lP6nno/nKwFkULDcqHLUslKGe/Xq2A8Ks
         arWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753886528; x=1754491328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYHDRzJKOaAYMNCXSgPR1P5klbcOxCCuVtkaiNHOnc4=;
        b=fE+rKEE9tWqkq4QsNuFqANiPCG7Wsr3oNyMk/PTlI7BPmTC/p6gkDvkOv1Nlw78qtv
         Sb3eEt+hS44QFnSPFbR90dl/PUU9TSJND/M14bVa3iD94xzGuV7oAV6RQl/WHEs+iMjI
         Hk2dO5PVWWl46wC6UobApaY5RLKnSBi/A+nOkkAZmBnOp++7M6+j/y4Zk9aG8/IdRyx6
         I/IeSad8Ma8KMytOvFVJZCr8nU4TiHqKyq4KAPtgtEc9NifxERjklSnjhACQgbnUX/Dt
         P2VgTd3faRLH32AzRWQCPGw2BG4qH2Udg4xg5pumH9rzqXGi9fQu4zSYNSTNPdTaFGzZ
         L7oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAP4e7O2+zDk20F8Okw+QxItzD2B/9d9fPADkGNBhUECSEuFELiCjHzb0NIdq90xdPhksDrqEcugzlAPXEWk5ySQQ+AA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZgpKi6awDOKXeY6IqRE1JJn7+vTjc0ykopABFYTQ46fHCoEfh
	bCbmY7JR3hS25Ui81PSfjB405o0fKl3wd9WAgvUV9EY6BU+AdLpY156Q
X-Gm-Gg: ASbGncueZDXhIKiwe3LZCYV9mzWTwslEQP8uIL6FXppeWZxEak6p+XKz+emUSDmxPmK
	ShBTWW+q35ffoVEOT8cW4RHqgUCnL7sDi7ksreZAPQiHrhVp/4tDL3VYw9Nse3CPFFKgtzBX489
	0mR5tA1qsQ7EOl6hCGhikb/AZe5NlntdPANImZJaUv8Al8lbEiYYlRpunhi6Pykdm47HhnbyN50
	hzWmdXBomjpGDfYQED8cshh+/tb0udnwP+7wH8h51s/5WCBk4bpVZp4sj5USYqlBm0gle8PUtxX
	+B5gd1sUYhxvj/I0csoqVHtSGl3peFZMYHdooj+cQE2XlG6d6ssBwCMvhssvMG4j2afPtc3h4Zi
	hPmlSuaWDlrk=
X-Google-Smtp-Source: AGHT+IHHhMReMrcHM0rLPnguJMUg4v42TJz2pDtZFa86c15cEiGMS6XSNlbDGKZ7Gy8VKfe9R0BtaQ==
X-Received: by 2002:a17:903:41d1:b0:240:8cca:50fb with SMTP id d9443c01a7336-24096b49247mr42457225ad.37.1753886528338;
        Wed, 30 Jul 2025 07:42:08 -0700 (PDT)
Received: from Arch ([103.87.142.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ff6e201a3sm87342125ad.150.2025.07.30.07.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 07:42:07 -0700 (PDT)
From: Ayash-Bera <ayashbera@gmail.com>
To: skhan@linuxfoundation.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	corbet@lwn.net,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Cc: Ayash-Bera <ayashbera@gmail.com>
Subject: [PATCH] fixed typo in the DRM UAPI documentation.
Date: Wed, 30 Jul 2025 20:10:23 +0530
Message-ID: <20250730144158.7926-1-ayashbera@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix a minor typo for the drm-uapi Documentation. 

Signed-off-by: Ayash-Bera <ayashbera@gmail.com>
---
 Documentation/gpu/drm-uapi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..64e002c6383c 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -518,7 +518,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
-- 
2.50.1

