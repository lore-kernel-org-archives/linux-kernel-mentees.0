Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC46B2D481D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755745298; cv=none; b=JQHyCgWbTcoh7eJCjrVVR4VgHuVDnAtS1dnik5gLQfX4zN/55i7b/suj8NTtf1YE4ejfVVD83509oHbpXo11l9UNSSGkZkIzTFai+sgQdHX0aw2EHlKLfOqBr8stJZz7u8spMiP7xG6/L3eMfJwGByZOftsVU8onPIR45nRrgDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755745298; c=relaxed/simple;
	bh=QFApcwOgKWEd9R8/HCG0mqwLQtvWC+pKwVKJG/IsTPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LnsX2xjisLph5xMIk26tSPE4wsFDG+b8OBKOVUDMfjid9byRlPEwW9TUuVS00i/AxlKcZyxNexTr4K5QlAhq2oLGs/WxDRpeA2O3BSmLJ+wFUa0dQKmaeMpftrLi/89Ljbybw2V8R6RcdZMhczPTP6GXWKM+1yIWGy2oYz4prG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTx1iFXm; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTx1iFXm"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E2BF61489
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id euevDySmuHc2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 03:01:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DDA226148C
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDA226148C
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YTx1iFXm
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DDA226148C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:01:35 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-244580591b0so4273245ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 20:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755745295; x=1756350095; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VBfgPDwHJj9xeq+UdTpIXwDQvBU8YAhfbNleYLr6cA=;
        b=YTx1iFXm1Ud4Obd4PvG5ZRagS9KL7mfHN61Lnl+n+CQ3Fv9YqeMMAOO+Ed2euXTWHS
         gj44DNZz6vPFNfx4txYx7aWw87Sxy3STZLtGm8BVvQrrHEF02Nwoj1/KeDW2V7c2Aztj
         4phTgzzhqP7ju83vsTUIDLjyDlr2782tgjQByOVQnjc507ciEgfAZzm6XE76h3ImurQ+
         u0tN5kJNVi6z+28T83BB74eHjetBM6UnTMEuwm2o4au8SJlowQIZCVf4nOUvToVMaATW
         xV4e3IhOmh8gZS4ExXrm90CZ8SOIHucZFPr2Z3Abmx/xLDUi8smL7dWYUu+BbMZ3cgMK
         seDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755745295; x=1756350095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VBfgPDwHJj9xeq+UdTpIXwDQvBU8YAhfbNleYLr6cA=;
        b=QFVQ3qef3yMz72K3Zz/O7hfLe8ce/d8LaNHaupOcv992h8zOvzMZ2qQofCoqxBu8HI
         HRk9bRf3bolyt70Ck8sc71mM9JwpsJEPb8Pil/vd4ZqvH0RjJgTo+L3/iHIGgcVSQjz0
         MRz32v8T1wrhhsU2AFk+w9qn6wysTg9AueSuxI01m/4bfGNuLeZVO+uMKYIoLVlYApr1
         TUt41aUrsn9OPWTa3QgIF6lNRKYQLmwLcS3QxNoPfsN8LEuHaIXu3rv+yLigMf8zJTwa
         X6iq7vCWcTPaxNpuY8A2K70pdgoXqYOREufzYYIXbvDP2reyY9STj1217OQPj0EVtvXv
         Rc0g==
X-Forwarded-Encrypted: i=1; AJvYcCUGGulTGwIzHn41dQqYzYcleC7ncHgMApOqzXCi01JvxzOwOSyzQlJ75iC2SGr2F1WOFNv2Yi6dwgAFsc/5a1W6uJpK8g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyQxqjOk1/VUz0bu4JWluCdEhCH50il5vIQVm+gp1IJlsf6DvE2
	3mWN6gShlPy+FS+T4wU/OlPG6lWD3SCv5pqJDUdu277X/SpKKON0FYBH
X-Gm-Gg: ASbGncu8NmUMQuKNadag4rwnhxJKZ6k5VF0/EQVzVpmoiCk3GLT/YPEfRbIXGHijud0
	VMF8vwvZu8uLIM1OOc0Qhe+9JmwPN8Nwea4jopdvvpDTeb+iou3Noh+ZSmRVblKAG03ru3vKuvK
	CWoHb0XYW9k/vJs38qah/lAzhu0pnv79sLp07tzPLq8NuFA3sDAQVpyDbCMTbOtJNWZOPCX3I/i
	BIgNVIcRBQGzk9KMduqrU+VpdpthCCGyzms+1k93KLkIAZeiPaiZmBpeQYVwi4y0s0cRW3h6IOc
	NQVlFmkgeaauLG7/3UaKSJAt32jwRMTfKX/7J/PHz+WiWEIv9KYH6J40ID0GveYc3jI3oHal5Q4
	bLJ9qVZDuHydR2NNNM4/3PhpK4qLTy6TbYC7eIQ==
X-Google-Smtp-Source: AGHT+IEV1Zcxig6B84KjoGLmnQxYJfI8WE6NEw3RyN2c/rW4MMbT3R26Q1g5buZcviTpIuDd25neeA==
X-Received: by 2002:a17:902:db07:b0:234:9656:7db9 with SMTP id d9443c01a7336-245fedcc650mr13272515ad.32.1755745294859;
        Wed, 20 Aug 2025 20:01:34 -0700 (PDT)
Received: from lkmp.. ([49.37.161.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c73f2sm40160695ad.94.2025.08.20.20.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:01:34 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: linux-doc@vger.kernel.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	corbet@lwn.net
Cc: tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	harry.wentland@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	rakuram.e96@gmail.com,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Deucher <Alexander.Deucher@amd.com>
Subject: [PATCH v2 1/2] docs: gpu: amdgpu: Fix spelling in amdgpu documentation
Date: Thu, 21 Aug 2025 08:29:55 +0530
Message-ID: <20250821025957.22546-2-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821025957.22546-1-rakuram.e96@gmail.com>
References: <20250821025957.22546-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed following typos reported by Codespell

1. propogated ==> propagated
   aperatures ==> apertures
In Documentation/gpu/amdgpu/debugfs.rst

2. parition ==> partition
In Documentation/gpu/amdgpu/process-isolation.rst

3. conections ==> connections
In Documentation/gpu/amdgpu/display/programming-model-dcn.rst

In addition to above,
Fixed wrong bit-partition naming in gpu/amdgpu/process-isolation.rst
from "fourth" partition to "third" partition.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---
 Documentation/gpu/amdgpu/debugfs.rst                       | 4 ++--
 Documentation/gpu/amdgpu/display/programming-model-dcn.rst | 2 +-
 Documentation/gpu/amdgpu/process-isolation.rst             | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/amdgpu/debugfs.rst b/Documentation/gpu/amdgpu/debugfs.rst
index 5150d0a95658..151d8bfc79e2 100644
--- a/Documentation/gpu/amdgpu/debugfs.rst
+++ b/Documentation/gpu/amdgpu/debugfs.rst
@@ -94,7 +94,7 @@ amdgpu_error_<name>
 -------------------
 
 Provides an interface to set an error code on the dma fences associated with
-ring <name>.  The error code specified is propogated to all fences associated
+ring <name>.  The error code specified is propagated to all fences associated
 with the ring.  Use this to inject a fence error into a ring.
 
 amdgpu_pm_info
@@ -165,7 +165,7 @@ GTT memory.
 amdgpu_regs_*
 -------------
 
-Provides direct access to various register aperatures on the GPU.  Used
+Provides direct access to various register apertures on the GPU.  Used
 by tools like UMR to access GPU registers.
 
 amdgpu_regs2
diff --git a/Documentation/gpu/amdgpu/display/programming-model-dcn.rst b/Documentation/gpu/amdgpu/display/programming-model-dcn.rst
index c1b48d49fb0b..bc7de97a746f 100644
--- a/Documentation/gpu/amdgpu/display/programming-model-dcn.rst
+++ b/Documentation/gpu/amdgpu/display/programming-model-dcn.rst
@@ -100,7 +100,7 @@ represents the connected display.
    For historical reasons, we used the name `dc_link`, which gives the
    wrong impression that this abstraction only deals with physical connections
    that the developer can easily manipulate. However, this also covers
-   conections like eDP or cases where the output is connected to other devices.
+   connections like eDP or cases where the output is connected to other devices.
 
 There are two structs that are not represented in the diagram since they were
 elaborated in the DCN overview page  (check the DCN block diagram :ref:`Display
diff --git a/Documentation/gpu/amdgpu/process-isolation.rst b/Documentation/gpu/amdgpu/process-isolation.rst
index 6b6d70e357a7..25b06ffefc33 100644
--- a/Documentation/gpu/amdgpu/process-isolation.rst
+++ b/Documentation/gpu/amdgpu/process-isolation.rst
@@ -26,7 +26,7 @@ Example of enabling enforce isolation on a GPU with multiple partitions:
     $ cat /sys/class/drm/card0/device/enforce_isolation
     1 0 1 0
 
-The output indicates that enforce isolation is enabled on zeroth and second parition and disabled on first and fourth parition.
+The output indicates that enforce isolation is enabled on zeroth and second partition and disabled on first and third partition.
 
 For devices with a single partition or those that do not support partitions, there will be only one element:
 
-- 
2.43.0

