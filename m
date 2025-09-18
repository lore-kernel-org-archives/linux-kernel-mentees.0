Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1CF2C0282
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Sep 2025 07:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758179555; cv=none; b=Qp+ISk/cGTw6qZKC3L8gfrLNWAFjP0psU7ITYoMHy9xn1D6Q1XAvN1pDgpcaCFhiO+IUwnU6z4FiROJcmK84Aw3KENy6SqvmdJVyifY8zQ+eM/1dWqRIuTon3Q/EW9/rtZ0jH1qCWFYnGxaWHJPS6Jb79HGE7xJjbVHm+uG1lWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758179555; c=relaxed/simple;
	bh=ud1Tmg51SfzqY6HtE7aDmCcSXYCOdVA2UHkFLQUePVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NCjSD0Yumku5TcdqpvE22zs8GiZn3mFKYTdeYMnyZEmJ75/7OpKsQfxtFeBf/pZbLDXP5EJhcshvSE6F52dcwNy2beg/6zyW5i9YLlHjqW0vs5YyKpzqE+9eV2h9/gUsOUwAw6enaHExFPG1TRP/Yv6kFf0y9eTdB7OGYh4GyzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=had3zMr9; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="had3zMr9"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62CAD60D92
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Sep 2025 07:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5iuW7AavRKv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Sep 2025 07:12:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=rk0006818@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 851DE60B83
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 851DE60B83
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=had3zMr9
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 851DE60B83
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Sep 2025 07:12:33 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-77256e75eacso601616b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 18 Sep 2025 00:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758179553; x=1758784353; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kkm5768qLYG/7lMt2aDpCtrK/g19VAgQZBHIXA7VzC8=;
        b=had3zMr9UrOmSMOoyR/3GTIIZ7QG5hUpuDxprQHn+3CWBTxuwyPCpU5Q9vNvn+veGQ
         8LMraACNcRsIStPf9gVY/qiey137XK1f4Y3W8yB1qtn/cBS5bf8NXtzqpI8N9a6E1ufY
         VMkqmCOAAbrtKOZxkwm5iYc4LlwaVYnraAND1HY6s0L0rE+FfdmoYMbPTo2t1H2nZVm9
         O/ciQYGkaoJqZVCoHcBg2qDN/9uMpIwMcsNNi3SvLcyMcoLm3Pz/8vQwPSR1adfT4KYn
         n1Cb25rv+FXnvjyj9yg1t2XP7qEhFVfQP2ag0qqrrlSTiyGyY2Ejuj1qREqEYxkYZ8hb
         GcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758179553; x=1758784353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkm5768qLYG/7lMt2aDpCtrK/g19VAgQZBHIXA7VzC8=;
        b=jPUkmSj6mHx4SE73yAk3/g6j1EPSM7d8p+qB2hM5TLWyICcmSrv31iH1retmYmmPJg
         3e1NVI78wOwVs5rbibDwlkZoJQk7xiCSNUyte0cisetjkjXFT+ifUUJ1D2al6JX97YXf
         g5FJQgdv3PDy0/VUgTIsEbXzABut8gi3KJnYz6svyDtWlFkTroCPFa9AbvQj0bT6gfTc
         XZ5r+mzM/c1eyaP1/SmGq2B2qLVmgBxAOA1MNWNFpQROkKnNKMAWCWLKmpRXeweHhw9x
         NWbZpcILUByOj5X6KCZ+7qi+8B9Loy0FDgm9k+uYDMFL0PvGGwtgzz1TVmaDDuFSNs3a
         PmlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXanPysv1ZW6HP2c0LJ2J03WePlYz46BfrMw4P+9cVueQyHPakRnqcVYnTgYWhBv6Q2r97taVVIvr17M9xK6O7KJEqanA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzFqChzsWbZV76hUU6/lwulBZNHhfEUNSdPobb/QWaQgaJi+bwi
	lS0fIOzLLDBCRycNNHWs4ad1QGXtZ7bR8Wjk+AXKVStkyAb3hQQMkQVw
X-Gm-Gg: ASbGnctMOfGeMUDI6PjzopbitIC68w3S6Ed7w+ZoyP1Wok/jLy0o9WZeaghxY6NZBUP
	kmg2b99DnKpkHloGkTCadNS6lE97xrQqXb/ZWLJWO+5/a5blZrsSv+inQLTiRZ7TjJYvZIEH37V
	+9dUNBR/5oaaZpdO+aI3Bcr7q8N+N8dQVf96vt1FR347uzqlYzDVvVLUHtJAE/dnrNU/IGBQU1o
	Oixen34EaVJaQjFZFfTbQC+L9D6zDMO2G7rEmqwUx6lpFlg018+JmGF8YUdUrNWrLvwKvwUHUa4
	ygDOLlMey5vPZwUAi9/UM6P9fRn5hRcPqFxfjIXuoBbWI5aVYSI/fp2ny9HzqIA6kuI3w9kH7Jc
	u2tTQkaBDeWL0izN7f10Zmh8txKiv7IPlautR5PGk0S0UY0afB6WQzUg=
X-Google-Smtp-Source: AGHT+IGdU2UHmJHhU9RR2jUy+RtSKtOMtaGZXLns5gxJCl2FXNsuL8oTowVvbbfw7QvNTE+aUNdCBQ==
X-Received: by 2002:a05:6a20:6a10:b0:23d:ab68:1b7c with SMTP id adf61e73a8af0-27aa99bdb9emr7214606637.46.1758179552545;
        Thu, 18 Sep 2025 00:12:32 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff3743bcsm1435597a12.20.2025.09.18.00.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 00:12:32 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: Felix.Kuehling@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com,
	Felix Kuehling <felix.kuehling@amd.com>
Subject: [PATCH v2] drm/amdgpu: Use kmalloc_array() instead of kmalloc()
Date: Thu, 18 Sep 2025 12:42:00 +0530
Message-ID: <20250918071201.350162-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/process/deprecated.rst recommends against the use of
kmalloc with dynamic size calculations due to the risk of overflow and
smaller allocation being made than the caller was expecting.

Replace kmalloc() with kmalloc_array() in amdgpu_amdkfd_gfx_v10.c,
amdgpu_amdkfd_gfx_v10_3.c, amdgpu_amdkfd_gfx_v11.c and
amdgpu_amdkfd_gfx_v12.c to make the intended allocation size clearer
and avoid potential overflow issues.

Suggested-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
Changes since v1:
- Extend fix to amdgpu_amdkfd_gfx_v10_3.c, amdgpu_amdkfd_gfx_v11.c and
  amdgpu_amdkfd_gfx_v12.c as suggested.
- Added Suggested-by tag.
Link to v1:
https://lore.kernel.org/all/f782159b-ad3f-4d0c-8476-50a701bf29e6@amd.com/
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c   | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c   | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 04ef0ca10541..0239114fb6c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -352,7 +352,7 @@ static int kgd_hqd_dump(struct amdgpu_device *adev,
 		(*dump)[i++][1] = RREG32_SOC15_IP(GC, addr);		\
 	} while (0)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
@@ -449,7 +449,7 @@ static int kgd_hqd_sdma_dump(struct amdgpu_device *adev,
 #undef HQD_N_REGS
 #define HQD_N_REGS (19+6+7+10)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
index 6d08bc2781a3..f2278a0937ff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -338,7 +338,7 @@ static int hqd_dump_v10_3(struct amdgpu_device *adev,
 		(*dump)[i++][1] = RREG32_SOC15_IP(GC, addr);		\
 	} while (0)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
@@ -435,7 +435,7 @@ static int hqd_sdma_dump_v10_3(struct amdgpu_device *adev,
 #undef HQD_N_REGS
 #define HQD_N_REGS (19+6+7+12)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index e0e6a6a49d90..aaccf0b9947d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -323,7 +323,7 @@ static int hqd_dump_v11(struct amdgpu_device *adev,
 		(*dump)[i++][1] = RREG32(addr);		\
 	} while (0)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
@@ -420,7 +420,7 @@ static int hqd_sdma_dump_v11(struct amdgpu_device *adev,
 #undef HQD_N_REGS
 #define HQD_N_REGS (7+11+1+12+12)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
index 6f0dc23c901b..e0ceab400b2d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
@@ -115,7 +115,7 @@ static int hqd_dump_v12(struct amdgpu_device *adev,
 		(*dump)[i++][1] = RREG32(addr);		\
 	} while (0)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
@@ -146,7 +146,7 @@ static int hqd_sdma_dump_v12(struct amdgpu_device *adev,
 #undef HQD_N_REGS
 #define HQD_N_REGS (last_reg - first_reg + 1)
 
-	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
 	if (*dump == NULL)
 		return -ENOMEM;
 
-- 
2.43.0

