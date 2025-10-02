Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF4C80C02
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 02:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759371786; cv=none; b=JYI/71WxUJoni9f+ShVkgcJtuWlSbeqbETarJsknwLEdSS6HxCncxS+aI0A/BNa1BhB9vMtwzXjtotyM/c/R3mr2AvBnpWdrJ7E8gj5UW0rjiVuWydBx8rWEucLtIHfzyaxyXD9dEiWx6MnZFYMojzTTkrHZQzik7dZf5RELWFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759371786; c=relaxed/simple;
	bh=noOVzFBtrlmWjjXtT8Z8WawlBMEgNebeu2HlTJ7LS1U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D2R68IzubsfhQC2OYGrq/3FPvPcu+Sq8ZqLnxCvtyScagWK1z/7BzR/YYxoXKVB8JTlvDOqlOxv4iIspSAxYSa6brT3+aTJV9tNlJdekyfjkCkn63IGsrPOjLa5yqwJwN9WliRsyLllk22zLU+5vsIan4SQy8x7sp09V1QXcN68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcNaxdCz; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcNaxdCz"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37E114132E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 02:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4y8C7K_qhlOw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Oct 2025 02:23:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A7E241316
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A7E241316
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AcNaxdCz
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9A7E241316
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  2 Oct 2025 02:23:03 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-77f343231fcso369414b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 01 Oct 2025 19:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759371783; x=1759976583; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mF3LfHpef/3mN9CeEleeS0pHSg8cp/5+RdXD9b+jUXQ=;
        b=AcNaxdCzXgy0847o2GxDa1lqTvSOTtdkY61t5LA55NapntjGeXzZgrkuqG0wkTIxkt
         0kI+LG2wOmQPhkzy2kec37jdZGVdou0GXKwSHoKGuPNLp+8R2+lYOYOEnrkBv8WerQ5d
         D/KUg3lZdAaLqoOisWSRxzfJ7brRjzwxlni80O3ZmqPqDebiIaVZ3afQuzgqENROYGNH
         rSNJIdIWcvwG5OKA+dBKO7u/doeW5pwUllW9me/bsn0K3oiZQ8GrZ2SFU99+ubpsESZs
         PKBhyU8mW7x9AoMS+lyFAg3zvLllCdX2sg0KO5b3ypXu+ZyGwG7qr1lTyqmkfl54D6x6
         fecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759371783; x=1759976583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mF3LfHpef/3mN9CeEleeS0pHSg8cp/5+RdXD9b+jUXQ=;
        b=J8/s+Hgiu2KSLCPNc1O4aRQl1sBRc1gVEmPz/LFvTcIjxljaqh4/9OhPjBcE01uJGe
         g+JRXWetZGG0hhLTvB3cKCNN22h/Z1z94fHi+ZBFH1hUT16DdffhqVpDRUXjqbqM56z/
         OXXY7kbSNnraBRHjd6kLM3dbVnzxyxsP+QTk7D1cdPWKSpsKO+X4etDixEvRCABvOjzS
         J5aX8MMEK6KLdXzRqZ/ZavK2A5KgGrsFV/o39Zk3sqFY7mWIZmJAEmsIrbhpDoQeDSOa
         RzqiZX57lw2Su71fVseOMfAWbiHJ3ydko8+f4HBYdRd6u5kl7XKtDy/WTitbIlUiCFjS
         3Cjw==
X-Forwarded-Encrypted: i=1; AJvYcCWIt1I6HUaXtBaE1/mMb+QqzPqD+gXaxQRyRLjEbu9JN5hVWz3bvDvtBNe0yafmoWF4RYOcT7mQJNSj7Q3y2asoZUYy2Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx9/P11p/ct5UclThzHXaL3eKlFwUQ4k+Xxc+KU4TusEp+AW2OO
	aghhASGbwS2SFrh9Wu07j5zEB3CcedLrwSQMBnFLFHfnuM0WDuddzOKt
X-Gm-Gg: ASbGncv0yATr5XWbXU8Uu5xi74/GtqY4EPE6pzE1nmtsfmX2bwAZrYWoM+b97jhUcji
	CQikh5fCF2HMMBR/pOsbVwHfJMiZ6TYjtG4lEuBpE4ghes5LVvj1Ifp8bYIxvcH9SDPa/fmW5VD
	eerQM1YXQTsh9276JS9D6kYynGkimDH/LYP6tXUq7AIWE66AZJTMuxzTnsVxH2gxP85YgnR0RTV
	wJQuR9WnJvPXQgcrfB4u2/1WgK6k2++j7g/5A1g9+MMc04hURllyIdGNyqcblG6U17eTLKXjM+A
	wMKGKyGJKyigWbfm9Ay7hrLDK5mrzJrUZuCqNNejqu537mehGCSW8NVplqtn8rZFGGjAIBTShXi
	LXB669RoiUCVt55YTfscqTCCKqCtLmwrlnA6MqpZOb49e6qfqvKBC2Kdr8Mld8iR+xTlC3BMySS
	q+50g2CZ1+Tw==
X-Google-Smtp-Source: AGHT+IHxLShFCm76xin7rHm8qNL6ADQW6sxwH14YEVEejbEnDXp8CfZFyeDbyzek8/KKOZq8n0qs+g==
X-Received: by 2002:a05:6a00:17a6:b0:781:556:f33 with SMTP id d2e1a72fcca58-78af3fe8bcbmr6233829b3a.5.1759371782828;
        Wed, 01 Oct 2025 19:23:02 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.91.136])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f99acesm1046229b3a.5.2025.10.01.19.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 19:23:02 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Tao Zhou <tao.zhou1@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	ganglxie <ganglxie@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Candice Li <candice.li@amd.com>,
	Victor Skvortsov <victor.skvortsov@amd.com>,
	Roman Li <roman.li@amd.com>,
	Alvin Lee <Alvin.Lee2@amd.com>,
	Karthi Kandasamy <karthi.kandasamy@amd.com>,
	David Rosca <david.rosca@amd.com>,
	=?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com
Subject: [PATCH] drm: amd:  Use kmalloc_array to prevent overflow of dynamic size calculation
Date: Thu,  2 Oct 2025 07:52:41 +0530
Message-Id: <20251002022241.77823-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kmalloc_array to avoid potential overflow during dynamic size calculation
inside kmalloc.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note:
 Patch is verified for compilation.
 
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c                 | 4 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 540817e296da..642addf70466 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2566,7 +2566,7 @@ static int amdgpu_ras_badpages_read(struct amdgpu_device *adev,
 		goto out;
 	}
 
-	*bps = kmalloc(sizeof(struct ras_badpage) * data->count, GFP_KERNEL);
+	*bps = kmalloc_array(sizeof(struct ras_badpage), data->count, GFP_KERNEL);
 	if (!*bps) {
 		ret = -ENOMEM;
 		goto out;
@@ -2722,7 +2722,7 @@ static int amdgpu_ras_realloc_eh_data_space(struct amdgpu_device *adev,
 	unsigned int old_space = data->count + data->space_left;
 	unsigned int new_space = old_space + pages;
 	unsigned int align_space = ALIGN(new_space, 512);
-	void *bps = kmalloc(align_space * sizeof(*data->bps), GFP_KERNEL);
+	void *bps = kmalloc_array(align_space, sizeof(*data->bps), GFP_KERNEL);
 
 	if (!bps) {
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 3d2f8eedeef2..e027798ece03 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -146,7 +146,7 @@ static void amdgpu_dm_plane_add_modifier(uint64_t **mods, uint64_t *size, uint64
 
 	if (*cap - *size < 1) {
 		uint64_t new_cap = *cap * 2;
-		uint64_t *new_mods = kmalloc(new_cap * sizeof(uint64_t), GFP_KERNEL);
+		uint64_t *new_mods = kmalloc_array(new_cap, sizeof(uint64_t), GFP_KERNEL);
 
 		if (!new_mods) {
 			kfree(*mods);
@@ -732,7 +732,7 @@ static int amdgpu_dm_plane_get_plane_modifiers(struct amdgpu_device *adev, unsig
 	if (adev->family < AMDGPU_FAMILY_AI)
 		return 0;
 
-	*mods = kmalloc(capacity * sizeof(uint64_t), GFP_KERNEL);
+	*mods = kmalloc_array(capacity, sizeof(uint64_t), GFP_KERNEL);
 
 	if (plane_type == DRM_PLANE_TYPE_CURSOR) {
 		amdgpu_dm_plane_add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_LINEAR);
-- 
2.34.1

