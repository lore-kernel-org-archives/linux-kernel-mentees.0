Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FD4267B92
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758134788; cv=none; b=D+O7f5lJ6aQBaJ7fSOr4YkxrToTIlAUziYppmGbWAc8P/UfTTJdOABkA0BPdoBAaVZTstYF1pDAbz3f58S2XZ4BEMQLhf/jqIifoYzmsrkFHbOGASuXTuY6AE6wFsPyosH0G8B2cCpFAzp3BLVJdrqQtLrtC0skZcOQVMpaQ3mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758134788; c=relaxed/simple;
	bh=btH0t94NpPvDHFTHl7A5rtmlTOTJwOQnsxlnzjc77To=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oiJDfq8UgLhlXOCVn0E5fKxRxVfSQrH5P4cu2PkjxqoEvrxVaWzxzAbr7DqmcALWx/F1u+Nt8ilJzb9Afhf1asnhUJqKgMSgH9ip2cS16JsCpOxEbGIymL97lUpiT9Zf22gF1OZZg8ovvY50ze9s/zJIe1ucpyrNrQrC27ykOtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VI+be8PA; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VI+be8PA"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-32ec2f001abso50624a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758134786; x=1758739586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4CUH1cxrzGbtKg/vcM5DH0s3j2Zg6HTRa2VG9pGeCYA=;
        b=VI+be8PAeGFvkLC4pBQdHkTzq4yTOGzZxZOBLSAAqUvqjJFB6zviog/S7biOMaGTUq
         4V6AzrgvEtJnAMVcE3F8TEJZDQNmY6FsWth2BVqc6Ibs8Y10ZUfxyjM22dkfIeXfdRME
         Riu5jCl3VLO6cxQn/XmS3lsAcnQTJ9muptvpnpW/kkR1OYG7h6NNtjRPSeen7xjw8UYO
         M8F0LzBcXNAeje5czr2E5q6OD52jq/xHuxWRNpdHchKbeleWMjxAt8FMMj3UwackOuqR
         Ub7oWG0Z6R/72011X02MKLyRaG7sWCp99BOziHMXuO2blM5t8PDMtk0fFn/1TSTTefxF
         tAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758134786; x=1758739586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CUH1cxrzGbtKg/vcM5DH0s3j2Zg6HTRa2VG9pGeCYA=;
        b=oV5aIkxNDbow+IB5T/lxp4m9+TvSEIOcfq4puX9ddoSJfezR6CxiMOBU0RGbIwgJ8z
         tqVqpS4Sbd7xQpPXJrZ/UHm88Na3/rwv8KTBkzwy3Hnz51sRP69sZIITXNFnpBfm7Soa
         Orozsd3Y22not2UiXLtZr0+lMHXJZlEYPT9OmcBu5S5awSeUCuzaPxSUqgSb8ZCYfwTu
         FWpvwdjWv3XG3pgzO5OrZ1nxe7+QE6PIT2zxnnnhCc+/p2taH7e+MXTk3U3ZYVp7GcRB
         rIyDSzbl4JSBeFe3c+DTCarR3yuBiqVnuIjltBiCdQA4oKKvgd+PUeKKQU0uS1VJLkEy
         VYRg==
X-Forwarded-Encrypted: i=1; AJvYcCVfKfdopSxx66vS1QQ0mbRkzIu9n1MCHBuk2sE3LXEMwCA/vwNuxZtA0rhFb75627TEetGvViGSDse7QaT+iuLJuOt2cA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx50Oks9yIoYJRpwTe/RGV0ZPGlJfsk7IWHfERqmNdIK/k6A3Np
	Vn4bNs+s+2Fuw+X7+ID1GsyLbWmcYT9hMnnlvLe7nBVd2xLUmHE27F8/
X-Gm-Gg: ASbGncs9woI/4diDM0qvA7i6W6xwuwne6bP+RFz82J6xzjnI1qwwVdotbFV+r/KSPBm
	bk33rmDz7GmAKthkWRjU6YwJyz4+6maUGbq+LxLZhh0METAyFF02imgFMde9ncFFCQvOVt2ikt9
	6tlr0KsGgC5cmw41H7edEraK9VjTl8HSV2lVZdrRzguKfoLSxuYtdaKMBy+pO++r0EvqXQnPBFt
	HXmL6FkUrxrDhDxnvxZ1hlN1TPed3h/i3zmcY/cW0tYhgBKaZF12E+osYvVFZXIjvZ0kB9w39+a
	6DD9+RLgZfCNbA9RdIE7HNIQi2H90LBwc7SGqeW2c/eeACy4WPpRUQSn9CwacuNqyfn8EtaoQuF
	zTm+TjLwKOBRzj43Y21gSnbd89fhU7k3AGG6FnxTz4g==
X-Google-Smtp-Source: AGHT+IEATHK4oZBUQ2XFmupV9qFdWwS+bGbZy20FnYjT9stAUVExIl1DxfPhf6kzlDTzmLMxk2zr3A==
X-Received: by 2002:a17:90b:4986:b0:32b:4c71:f423 with SMTP id 98e67ed59e1d1-32ee3f75457mr3359863a91.32.1758134786351;
        Wed, 17 Sep 2025 11:46:26 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306082eff4sm187852a91.25.2025.09.17.11.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 11:46:25 -0700 (PDT)
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
Subject: [PATCH] drm/msm: Add NULL check in vm_op_enqueue
Date: Thu, 18 Sep 2025 00:16:14 +0530
Message-ID: <20250917184616.85797-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vm_op_enqueue allocates an msm_vm_op struct with kmalloc,
but the return value is not checked for NULL value which
can be returned by kmalloc under low-memory conditions.
This can result in NULL pointer dereference when the pointer
is dereferenced.

Add NULL check after the allocation and propagate -ENOMEM back
to the caller in case of a failure.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
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

