Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D4024C07A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 18:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755714208; cv=none; b=K4tP38w2N6a9i5RFNjLxl6dDswQfbALzTgN91jnz99UYON50zuOnbehs9YXpeJs3d0L7hze3iBjjqwuo3cQYyzzZ3Z0ekqe/MibDMDbFFX3LnT0+XKADPcVpm/cdGdI4sHC++jkZXp/5gTxtl71bzfMSFeNgMQorodJkHOQ5EcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755714208; c=relaxed/simple;
	bh=smGnO2fyg7RPOwg+W0wmpugItFInhBMUzvPKGjXle+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lNcfFnSBgHcQg4u7K2IojcwQrrNSqtBKNtF39XoH5vWt0z9ecje+ZZa/zv32D8USSuJ8Mk2R8bk6Xy84vnKmkDhECI0X0BB7gS2xXfbENa7hWkvvQvWhHAXCOnFvJ8SnjyN0Nj/ah9rlO/l1f4mSo8hSYKkGypYfieZEBVOYUWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VB8A6joR; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VB8A6joR"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C1AC83C33
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 18:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-yxbNCVyQ9T for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Aug 2025 18:23:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96A6883C2C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96A6883C2C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VB8A6joR
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 96A6883C2C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 18:23:26 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-245fb4c8738so2013725ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 11:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755714206; x=1756319006; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJD17dHXBpBddqd9ZQM59zYB7xSPsARGmN3EqdaDYYk=;
        b=VB8A6joRPQOAdL4vbo3xBhCAlb+rx1EBSZJByK6ctxDjJ1BaodTMFtAoozQzA97pxu
         fB5h9QGPkQtHXtyMQCpnzTuxfTopY6IWR1N7H9VbrAMDXRK+UcErkRjY9Unc1K8CF6K1
         QUfy4E4W4/1l0gejIq619b52WYgXcRC22nUff3+/BJERsyUQA2X93xZJlVnPCg8HsSJp
         Jg4EWq01h9ViNJOym9ZEUKw8pZWzN5mNHqe+oS2QGGbmOD0PloI6xYE53HqbLbogdZzE
         C9Kp9FndAoXoZnB3oqwuUVQ5avzFNHJ85sv0QLsnhUOe7DsbK2kycAEANol7ruwfP6Ev
         kBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755714206; x=1756319006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJD17dHXBpBddqd9ZQM59zYB7xSPsARGmN3EqdaDYYk=;
        b=e2S/dBwC3lefVGDoA6auwPyvM/MwYc0cksp0wacdoEfSbfdC3VbX6xQkVugtYpdWP9
         9+rW/KkQr/g3oSG0Xr99sdTUe2t+0Yapoqh9/+kyXFJw7YSIrVt01dqlbR0/6G4i7g9U
         Lp+UVK5l6v0v38py8zgn2lFJqf9mvLQF01rOsQ+w3bF/fb1F+34HYzGXDvXKtGpKQ7pj
         Hyno1fuFnmgC/CtySRVkyFOa+DSBEwVNgBqkS7L1QDpe+VJZVDeM1lPlKrf1eTS0p+8m
         u6DqvugWaxEgnu3GzQSGxoHnOux9XmNGTYXf/WlCXw8T7znix0FIT5e+QDO+YeOl/BdM
         plkA==
X-Forwarded-Encrypted: i=1; AJvYcCW69S23nIGvuMJ4EAyrDUZVnL2DKV3Gg85v6EuhAdGmY3Ua7x1AZvOKiMyByvZFadPbTsXjyQRJi7J6zitDShFF/ZwyuQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyHAvzdjPtg8t6E8IuY7HqZLIr4RgvqLLgI7FIEAJB9/k+c4Qu0
	K1hbUnSXGow9h4qGgFxiEAg4DIVsi4p1nqMUCPB/Q7O8iFbuIdIPLKf0
X-Gm-Gg: ASbGncvgtPriu2tNosm4Y9J+M5YzbEDmnF/9FYY0acz+Vg2WSeYuSTK82s3u8vHvjdx
	12yYnm+bpwHrr0DTt/gNMt7K6W96a/EMrSiQA9L6fL2JZPEjEj8+K69JDLewfJGreblwVe5yyE8
	qKFelce4PA4+RzlUygZTzswvwMyVzKZ6qwrXmAJzfiXlHQsRpY25ZsMAfo+8InHATHrcLl/L8Go
	l09i7kAxyIjwA1V5Myn2BOVAAYc3hesZyaFX6E0Vu7BtkN+rruv+Qp2jhmYKkWuOuAS+hhLsf+f
	mHVAB1XhjuEjtgeDWEdnB4Vii8dJfAYusbpdfm5ADJbZdW+PGX1doqVOA+wSJgn90/TPfivZsGw
	0LqDC1C9vfenp8Y56a/MjUpSUMOQ=
X-Google-Smtp-Source: AGHT+IGxVHwxWzd0VLZskRkya2/ny1iDGS9Hg+m0NaghOzwqRevtboYxJh4mBs1hCDsOMv5cLgK6Fg==
X-Received: by 2002:a17:903:13cf:b0:240:150e:57ba with SMTP id d9443c01a7336-245ef0d5a4dmr50329185ad.3.1755714205396;
        Wed, 20 Aug 2025 11:23:25 -0700 (PDT)
Received: from lkmp.. ([49.37.163.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e2643bafsm2956636a91.23.2025.08.20.11.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 11:23:25 -0700 (PDT)
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
	rakuram.e96@gmail.com
Subject: [PATCH] docs: gpu: Fix spelling mistakes
Date: Wed, 20 Aug 2025 23:52:58 +0530
Message-ID: <20250820182259.11227-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed following typos reported by Codespell

1. filp ==> flip
In Documentation/gpu/drm-mm.rst

2. complection ==> completion
   implementions ==> implementations
In Documentation/gpu/todo.rst

3. unpriviledged ==> unprivileged
In Documentation/gpu/drm-uapi.rst

4. propogated ==> propagated
   aperatures ==> apertures
In Documentation/gpu/amdgpu/debugfs.rst

5. parition ==> partition
In Documentation/gpu/amdgpu/process-isolation.rst

6. conections ==> connections
In Documentation/gpu/amdgpu/display/programming-model-dcn.rst

Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---
 Documentation/gpu/amdgpu/debugfs.rst                       | 4 ++--
 Documentation/gpu/amdgpu/display/programming-model-dcn.rst | 2 +-
 Documentation/gpu/amdgpu/process-isolation.rst             | 2 +-
 Documentation/gpu/drm-mm.rst                               | 2 +-
 Documentation/gpu/drm-uapi.rst                             | 2 +-
 Documentation/gpu/todo.rst                                 | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

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
index 6b6d70e357a7..c1297a9e4d09 100644
--- a/Documentation/gpu/amdgpu/process-isolation.rst
+++ b/Documentation/gpu/amdgpu/process-isolation.rst
@@ -26,7 +26,7 @@ Example of enabling enforce isolation on a GPU with multiple partitions:
     $ cat /sys/class/drm/card0/device/enforce_isolation
     1 0 1 0
 
-The output indicates that enforce isolation is enabled on zeroth and second parition and disabled on first and fourth parition.
+The output indicates that enforce isolation is enabled on zeroth and second partition and disabled on first and fourth partition.
 
 For devices with a single partition or those that do not support partitions, there will be only one element:
 
diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index d55751cad67c..3496ef28b15c 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -153,7 +153,7 @@ size in bytes.
 GEM uses shmem to allocate anonymous pageable memory.
 drm_gem_object_init() will create an shmfs file of the
 requested size and store it into the struct :c:type:`struct
-drm_gem_object <drm_gem_object>` filp field. The memory is
+drm_gem_object <drm_gem_object>` flip field. The memory is
 used as either main storage for the object when the graphics hardware
 uses system memory directly or as a backing store otherwise.
 
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 843facf01b2d..7435664a1ffe 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -535,7 +535,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..1d064e617699 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -319,7 +319,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
@@ -854,7 +854,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.43.0

