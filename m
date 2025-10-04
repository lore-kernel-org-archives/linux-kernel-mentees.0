Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC5C1E9B0D
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  4 Oct 2025 11:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759575666; cv=none; b=Lb/WKETYk2hyiyz4RWuH+6TYCGlVMufGFQ5PEUn1ecybnIuFMSS9fwPRO4imt/Vvy+dfmxFYWmQhNVsI/Kw9ZC2N2/QTPmSfUdBQ3BaLY4FSYFhuo3M9Ge1mjeEVTfuZic4yasH9pQPtxHobvDXJMMVJ24jkw9wKIFwYwlXkRs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759575666; c=relaxed/simple;
	bh=mVhiB3XjjKvwry4rXBNKAAqKtNFxuZaSL16L+E/uJMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmyU9sv/dI/QCjb2ONbPoA6SZsrOryNV5Kzo8V2zmviLd6DFoQzSLcIN+Fuej3tmKMDrMgkU4VVqXzigeWbKo8reFH5T9f4zMJTgJ5uTTc6EooaPzuzzucckhzbkzJBSzxshQssmxmJLXAWcJCtOz/RosPK9HQztfanvKp2bVV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYvn1LV0; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYvn1LV0"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-32ed19ce5a3so2953867a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 04 Oct 2025 04:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759575663; x=1760180463; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCTDlQEGUynoAVbLn6xjoRk5lU8FKtAz6xcB6i4LhPk=;
        b=FYvn1LV0c3lfK4FiMq3VbQ6FdRU9HjVQHetGvObwX1bgCLPa1EfwKNvJf3YVtQlBSt
         or4MI2wUbgr+1QWJ5OgCNnWWoEGaclXbphWgrCPm81sHRMBwuY4AsGTYXFR+cDG7FOoX
         caB+y1fZc9ub6THkYHLCRm4WQfGP2ATvDqtkm8VClkJ/ZLkEcfuiIYjfYtMqX4wgqMx3
         4xz2LT+ibT4hrAkNzVIHFIx0cAvXCvH03jw5gzSr80dXnr7of9IG2bMbAXjelySSCd9S
         KqDBvHaoVEWnhhfBt1tDTlMo5MGyERMyPDMlkgSnLezEhDrftCBnaBN8SYb3vATM4k9J
         Lirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759575663; x=1760180463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCTDlQEGUynoAVbLn6xjoRk5lU8FKtAz6xcB6i4LhPk=;
        b=voumvGAQmDqJmYKfMPBfgjU57XpJE+osIJrrzSPK79iLViyLf+lIqmStEtmwFWYq/J
         NxJcQND1VOmT/FrbqT5jsYwt2O6NIXjgkilGcENjA2KdC4gZL9OZA7m892spmQz7gpBs
         /btOrKouv6wsR9oxgwc2rzU+8n6rg9iwhfd/Xl+oq627UpKvreFH6ffvoMAWY2f8Fk38
         hwOpvBhryPfN16c+o+nelvhGd1ySjWeBgwdJ54wmpxsE5E6VyDJW+5UOr83/pV0k9j/F
         SX3KWvlF2gDAgnJ15UceaEpXP93ZfQw9BRYvoXZVuiM4+pJlZ6pfXbKmyKrpEXe1aeiq
         O4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXk/KYrE4APysZAD06UPQVztfy0mdxbWpAkeyhmyvGtj98GfWmriL/WJwXBe7DA8qL/cECML6L0ZtGH1h58VUfgSkYJog==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcZrV9FvLsfA0O2kiMgkk5iBmdpKS2rLctB6nwu9KGn0Xa91It
	NDFmO36Uo7GskIq4gsi02CZJWyJhYbr4zcVO0LpOFoWkdXgQy2rR/WYc
X-Gm-Gg: ASbGnctegtkoBfgRyOiunEiayU60EqniDJrpT0GXRnNwyNMinsOG4NcxfWNUbPU/lDL
	xJVBDZwaROxaP7FfqoOIH+B3K/9uqunMRNL+6KZ9lLyuzxk+wXwONBIBFcK2EA15Ij2JG6ZMgrp
	JEbwZGXlFGr0mXakXSHAONdDf3gQXhl7wC9XQeOaAATlN7Oa6MW4t1DxLzADUl7a4KZ61oO9z+B
	1vY8ZawZnv0VO0wFXNLxA/PnLVVCpeAkvZfwG/Bfefj6KGmOMh0UBgHRvttltAXFeyGY9d2pGrO
	3xIbsCQY7VXgEjl/ekLyL6fj/breHETs0cM2vLKMKZ7PexdbQn5uRgNfEaqWzg69Q7sFQXXfCiy
	T57uVSKRxvduSkmFwrgj+UByyBp4ihaOm0gaRQ0iqermfUy0se+uis+lZXKejQbTPazXgPfl2Dk
	ZsQK15uencdUs=
X-Google-Smtp-Source: AGHT+IF6KW+o3hALRSt3TlfMffAw7CjzidHyGOok+NoPUVDP1KnNL8mme1hIyP6Bkou2nnamx1XkdQ==
X-Received: by 2002:a17:90b:4f4c:b0:32e:a54a:be53 with SMTP id 98e67ed59e1d1-339c27348f6mr7738086a91.16.1759575662886;
        Sat, 04 Oct 2025 04:01:02 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099b1cf08sm7046135a12.22.2025.10.04.04.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 04:01:02 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	abhinav.kumar@linux.dev,
	jessica.zhang@oss.qualcomm.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH RFT] drm/msm: Add NULL check in vm_op_enqueue()
Date: Sat,  4 Oct 2025 16:30:04 +0530
Message-ID: <20251004110044.204269-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917184616.85797-1-krishnagopi487@gmail.com>
References: <20250917184616.85797-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vm_op_enqueue() allocates an msm_vm_op struct with kmalloc,
but the return value is not checked for NULL value which
can be returned by kmalloc under low-memory conditions.
This can result in NULL pointer dereference when the pointer
is dereferenced.

Add NULL check after the allocation and propagate -ENOMEM back
to the caller in case of a failure.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---

This patch is marked as RFT since the changes haven't been tested. 

 drivers/gpu/drm/msm/msm_gem_vma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 00d0f3b7ba32..639425849d86 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -455,15 +455,20 @@ struct op_arg {
 	bool kept;
 };
 
-static void
+static int
 vm_op_enqueue(struct op_arg *arg, struct msm_vm_op _op)
 {
 	struct msm_vm_op *op = kmalloc(sizeof(*op), GFP_KERNEL);
+	if (!op)
+		return -ENOMEM;
+
 	*op = _op;
 	list_add_tail(&op->node, &arg->job->vm_ops);
 
 	if (op->obj)
 		drm_gem_object_get(op->obj);
+
+	return 0;
 }
 
 static struct drm_gpuva *
@@ -482,6 +487,7 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 	struct drm_gpuva *vma;
 	struct sg_table *sgt;
 	unsigned prot;
+	int ret;
 
 	if (arg->kept)
 		return 0;
@@ -493,8 +499,6 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
 	       vma->va.addr, vma->va.range);
 
-	vma->flags = ((struct op_arg *)arg)->flags;
-
 	if (obj) {
 		sgt = to_msm_bo(obj)->sgt;
 		prot = msm_gem_prot(obj);
@@ -503,7 +507,7 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 		prot = IOMMU_READ | IOMMU_WRITE;
 	}
 
-	vm_op_enqueue(arg, (struct msm_vm_op){
+	ret = vm_op_enqueue(arg, (struct msm_vm_op){
 		.op = MSM_VM_OP_MAP,
 		.map = {
 			.sgt = sgt,
@@ -516,6 +520,10 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 		.obj = vma->gem.obj,
 	});
 
+	if (ret)
+		return ret;
+
+	vma->flags = ((struct op_arg *)arg)->flags;
 	to_msm_vma(vma)->mapped = true;
 
 	return 0;
@@ -531,6 +539,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 	struct drm_gpuvm_bo *vm_bo = orig_vma->vm_bo;
 	bool mapped = to_msm_vma(orig_vma)->mapped;
 	unsigned flags;
+	int ret;
 
 	vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
 	       orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
@@ -540,7 +549,7 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 
 		drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
 
-		vm_op_enqueue(arg, (struct msm_vm_op){
+		ret = vm_op_enqueue(arg, (struct msm_vm_op){
 			.op = MSM_VM_OP_UNMAP,
 			.unmap = {
 				.iova = unmap_start,
@@ -550,6 +559,9 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 			.obj = orig_vma->gem.obj,
 		});
 
+		if (ret)
+			return ret;
+
 		/*
 		 * Part of this GEM obj is still mapped, but we're going to kill the
 		 * existing VMA and replace it with one or two new ones (ie. two if
@@ -611,6 +623,7 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 	struct msm_vm_bind_job *job = arg->job;
 	struct drm_gpuva *vma = op->unmap.va;
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
+	int ret;
 
 	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
 	       vma->va.addr, vma->va.range);
@@ -643,7 +656,7 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 	if (!msm_vma->mapped)
 		goto out_close;
 
-	vm_op_enqueue(arg, (struct msm_vm_op){
+	ret = vm_op_enqueue(arg, (struct msm_vm_op){
 		.op = MSM_VM_OP_UNMAP,
 		.unmap = {
 			.iova = vma->va.addr,
@@ -653,6 +666,9 @@ msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 		.obj = vma->gem.obj,
 	});
 
+	if (ret)
+		return ret;
+
 	msm_vma->mapped = false;
 
 out_close:
-- 
2.43.0

