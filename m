Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71C236F916
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 22:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168269; cv=none; b=IaJUW/lc2DXKsCnADJNjDj2DONk9ncqqFui5XN3+PVeO7KEoVgqHeJFgyNTzfUi1wrAOjXmeldbY5QUOCNcEUhaDViTGjogrH2LW9ZHTmp10yAPhDPqvDpZMPPDwecv+bADVrVnvZ2VDHlah+fjMfVt6VXT0xcrjA/f2LuN6DfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168269; c=relaxed/simple;
	bh=bn1nCUdKY6brcFbeCzncsYtRcAG380V6bvWnypmIGuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dhFL97U0mDpNJNUqG9rOqVbgRr9a/yXwtG5fdpk9MghD9lXvj7gZk7nbMNA4wnZH6/aJrc3LLKnWtrc6cRicq0+IAuxor9IQo6fN7r7YrRtuY+RYKSimyYD/4rbIXcb4na3s3XRzYF1SUwcOJa0T2pFdbjtpPCxxNQHHFkHYlVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6q+PkSy; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6q+PkSy"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30c09f29b64so334743eec.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 15:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782168267; x=1782773067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SeMGMO5CHz03os8Q93xKr0Zz4ur/IPCKPm092KCihk=;
        b=e6q+PkSyEMw59gjLTRKe3FgRYQMmXLjK7eAVZWYNbUZ02qhOzfKnazK8enxvi30r9t
         dLP9QIRTeYWOJMZHaNH2v3UAbu2ai9XOo5P3UtkcGG3qP0E4pAZM1uFCzpqR1aiDMPLL
         qBV9KJN628wTfQEzdH5Zk9gkXgMUL2/YsLT/9w7q/YX5PDvSEAZug5TgzeldrtAQIUxH
         nrGxXA+3l3bNKwwzTz0xwMkVc7uq5Qv+dqx04ydySemKobBknyN0+DCRwI7XqSYZ4VxK
         uECDqzmZV8JZv5SypXNpj262onjYl4cGsrrocS1rIhGnv/XNXukYvrQxpIa1Ak/D9jAL
         DMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782168267; x=1782773067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6SeMGMO5CHz03os8Q93xKr0Zz4ur/IPCKPm092KCihk=;
        b=QQLubIIEXZSVmWxuNgErYLa9DAgTOwnXrJD/eNCpzr+UI4ZWpYVHjR6CyesKHgnkJC
         kFNnYCnpf6PLMsbmjFkADPy4ay0N7lmd0F7TrEW+vpeRaRyUebzZdf5AWB03uzI7/7jK
         DLklo3R0WW7EiaKuNLrEe+C6inEI3gnfxixbizIupU7dhpAgCH21BbEKSy6yOoo4aK48
         fwWukUPpEKLsTb6tK1lrfpsF/qGv9UzlQXNzZRMAbT4XPTOQE8PrnuMFg2+3X/rp5xFq
         KPTWqCVhhE+LhjHFT/E0Pt2rp7+gGmqUygTHYRLgP9lolB4j2lElLrL13L6HZy2DzfCx
         Ip/w==
X-Forwarded-Encrypted: i=1; AHgh+RpWbEdxqB8jZCtgWJdGzbojE0d8BIcpXuEw1q1MlxbwoEDHpULen4qdDOGVjIxkqKOuqnTnEPX9kYhzwIUZlC+T5jkzDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNcqJ/MXlcuwc1Og39g6VudiHWpXgOIkAtgL13Z215deszMNtH
	5cnrLh8VoD+j7hy4ukT2LtFDqjSVnuuj9YRdRVv3xDKdIzfi7dKyRbTV
X-Gm-Gg: AfdE7clLngRd72aqILIT98IIgcW5P3vsTjo/aXZ17LSI+BluRxD6fHRRuOSE1RrX56+
	XNUZ5Z2K9VkEKylKxeUDZhZpduv7Jctqqhet/k33rs5XGRC6l4d23ONppCdl7BumC1p5F6igSc/
	pUQWOdKdfjGwbiRaxABllZil6CSSRr0mdxDaUa+2wG+fGHvOe0ppfgf9Q5Sv5ndfPpxRdJ/diGv
	yPbUOVvcaEdjlLDG4yPCvusePCwy8iA3wqQsB0e4lVlM33MNsIW8SIHAl9OzS/VmF04qJpNChMp
	R/r7CFjoIiZVC4+dFDuTrsh5UjFwDG7IjW3SQHWQ2EiVR4RbKC1KOCEdgcOdCvUOBH831QF+/y4
	84U6I4ay7guicE8XZs+x2WYMn6hCb67Q+Jxr6C8YIL5DrRfQK4sboibclfy9qouGOra65GMCT+v
	nV1jda5+SIXmyPbJt7CMvnb5trVWJvsmZR4jL046iX+UOcTcAhxo+Cvn7b5ewXsN2mpr4=
X-Received: by 2002:a05:7300:642a:b0:2c9:ee15:a0ee with SMTP id 5a478bee46e88-30c555b8663mr1075252eec.12.1782168266974;
        Mon, 22 Jun 2026 15:44:26 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:691c:629b:eda4:7c2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c376sm13087954eec.3.2026.06.22.15.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 15:44:26 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 2/3] staging: media: atomisp: use kvmalloc_objs() for overflow-safe allocation
Date: Mon, 22 Jun 2026 19:42:43 -0300
Message-ID: <20260622224402.34001-3-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
References: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several allocations in sh_css_params.c still size their buffers with
open-coded multiplication (e.g. width * height * sizeof(*p)), which can
silently overflow and under-allocate.

Convert them to kvmalloc_objs() with array_size(), which saturate to
SIZE_MAX on overflow so kvmalloc() returns NULL instead of allocating
too few bytes.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
 1 file changed, 36 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 8420a22fd8f0..50dbda6b3f0a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -6,6 +6,7 @@
 
 #include <linux/overflow.h>
 #include <linux/math.h>
+#include <linux/slab.h>
 
 #include "gdc_device.h"		/* gdc_lut_store(), ... */
 #include "isp.h"			/* ISP_VEC_ELEMBITS */
@@ -4151,7 +4152,6 @@ struct ia_css_3a_statistics *
 ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 {
 	struct ia_css_3a_statistics *me;
-	int grid_size;
 
 	IA_CSS_ENTER("grid=%p", grid);
 
@@ -4162,8 +4162,8 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 		goto err;
 
 	me->grid = *grid;
-	grid_size = grid->width * grid->height;
-	me->data = kvmalloc(grid_size * sizeof(*me->data), GFP_KERNEL);
+	me->data = kvmalloc_objs(*me->data,
+				 array_size(grid->width, grid->height));
 	if (!me->data)
 		goto err;
 	/* No weighted histogram, no structure, treat the histogram data as a byte dump in a byte array */
@@ -4245,15 +4245,15 @@ ia_css_dvs_coefficients_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	me->grid = *grid;
 
-	me->hor_coefs = kvmalloc(grid->num_hor_coefs *
-				 IA_CSS_DVS_NUM_COEF_TYPES *
-				 sizeof(*me->hor_coefs), GFP_KERNEL);
+	me->hor_coefs = kvmalloc_objs(*me->hor_coefs,
+				      array_size(grid->num_hor_coefs,
+						 IA_CSS_DVS_NUM_COEF_TYPES));
 	if (!me->hor_coefs)
 		goto err;
 
-	me->ver_coefs = kvmalloc(grid->num_ver_coefs *
-				 IA_CSS_DVS_NUM_COEF_TYPES *
-				 sizeof(*me->ver_coefs), GFP_KERNEL);
+	me->ver_coefs = kvmalloc_objs(*me->ver_coefs,
+				      array_size(grid->num_ver_coefs,
+						 IA_CSS_DVS_NUM_COEF_TYPES));
 	if (!me->ver_coefs)
 		goto err;
 
@@ -4277,6 +4277,7 @@ struct ia_css_dvs2_statistics *
 ia_css_dvs2_statistics_allocate(const struct ia_css_dvs_grid_info *grid)
 {
 	struct ia_css_dvs2_statistics *me;
+	size_t cnt;
 
 	assert(grid);
 
@@ -4286,59 +4287,37 @@ ia_css_dvs2_statistics_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	me->grid = *grid;
 
-	me->hor_prod.odd_real = kvmalloc(grid->aligned_width *
-					 grid->aligned_height *
-					 sizeof(*me->hor_prod.odd_real),
-					 GFP_KERNEL);
+	cnt = array_size(grid->aligned_width, grid->aligned_height);
+
+	me->hor_prod.odd_real = kvmalloc_objs(*me->hor_prod.odd_real, cnt);
 	if (!me->hor_prod.odd_real)
 		goto err;
 
-	me->hor_prod.odd_imag = kvmalloc(grid->aligned_width *
-					 grid->aligned_height *
-					 sizeof(*me->hor_prod.odd_imag),
-					 GFP_KERNEL);
+	me->hor_prod.odd_imag = kvmalloc_objs(*me->hor_prod.odd_imag, cnt);
 	if (!me->hor_prod.odd_imag)
 		goto err;
 
-	me->hor_prod.even_real = kvmalloc(grid->aligned_width *
-					  grid->aligned_height *
-					  sizeof(*me->hor_prod.even_real),
-					  GFP_KERNEL);
+	me->hor_prod.even_real = kvmalloc_objs(*me->hor_prod.even_real, cnt);
 	if (!me->hor_prod.even_real)
 		goto err;
 
-	me->hor_prod.even_imag = kvmalloc(grid->aligned_width *
-					  grid->aligned_height *
-					  sizeof(*me->hor_prod.even_imag),
-					  GFP_KERNEL);
+	me->hor_prod.even_imag = kvmalloc_objs(*me->hor_prod.even_imag, cnt);
 	if (!me->hor_prod.even_imag)
 		goto err;
 
-	me->ver_prod.odd_real = kvmalloc(grid->aligned_width *
-					 grid->aligned_height *
-					 sizeof(*me->ver_prod.odd_real),
-					 GFP_KERNEL);
+	me->ver_prod.odd_real = kvmalloc_objs(*me->ver_prod.odd_real, cnt);
 	if (!me->ver_prod.odd_real)
 		goto err;
 
-	me->ver_prod.odd_imag = kvmalloc(grid->aligned_width *
-					 grid->aligned_height *
-					 sizeof(*me->ver_prod.odd_imag),
-					 GFP_KERNEL);
+	me->ver_prod.odd_imag = kvmalloc_objs(*me->ver_prod.odd_imag, cnt);
 	if (!me->ver_prod.odd_imag)
 		goto err;
 
-	me->ver_prod.even_real = kvmalloc(grid->aligned_width *
-					  grid->aligned_height *
-					  sizeof(*me->ver_prod.even_real),
-					  GFP_KERNEL);
+	me->ver_prod.even_real = kvmalloc_objs(*me->ver_prod.even_real, cnt);
 	if (!me->ver_prod.even_real)
 		goto err;
 
-	me->ver_prod.even_imag = kvmalloc(grid->aligned_width *
-					  grid->aligned_height *
-					  sizeof(*me->ver_prod.even_imag),
-					  GFP_KERNEL);
+	me->ver_prod.even_imag = kvmalloc_objs(*me->ver_prod.even_imag, cnt);
 	if (!me->ver_prod.even_imag)
 		goto err;
 
@@ -4377,51 +4356,43 @@ ia_css_dvs2_coefficients_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	me->grid = *grid;
 
-	me->hor_coefs.odd_real = kvmalloc(grid->num_hor_coefs *
-					  sizeof(*me->hor_coefs.odd_real),
-					  GFP_KERNEL);
+	me->hor_coefs.odd_real = kvmalloc_objs(*me->hor_coefs.odd_real,
+					       grid->num_hor_coefs);
 	if (!me->hor_coefs.odd_real)
 		goto err;
 
-	me->hor_coefs.odd_imag = kvmalloc(grid->num_hor_coefs *
-					  sizeof(*me->hor_coefs.odd_imag),
-					  GFP_KERNEL);
+	me->hor_coefs.odd_imag = kvmalloc_objs(*me->hor_coefs.odd_imag,
+					       grid->num_hor_coefs);
 	if (!me->hor_coefs.odd_imag)
 		goto err;
 
-	me->hor_coefs.even_real = kvmalloc(grid->num_hor_coefs *
-					   sizeof(*me->hor_coefs.even_real),
-					   GFP_KERNEL);
+	me->hor_coefs.even_real = kvmalloc_objs(*me->hor_coefs.even_real,
+						grid->num_hor_coefs);
 	if (!me->hor_coefs.even_real)
 		goto err;
 
-	me->hor_coefs.even_imag = kvmalloc(grid->num_hor_coefs *
-					   sizeof(*me->hor_coefs.even_imag),
-					   GFP_KERNEL);
+	me->hor_coefs.even_imag = kvmalloc_objs(*me->hor_coefs.even_imag,
+						grid->num_hor_coefs);
 	if (!me->hor_coefs.even_imag)
 		goto err;
 
-	me->ver_coefs.odd_real = kvmalloc(grid->num_ver_coefs *
-					  sizeof(*me->ver_coefs.odd_real),
-					  GFP_KERNEL);
+	me->ver_coefs.odd_real = kvmalloc_objs(*me->ver_coefs.odd_real,
+					       grid->num_ver_coefs);
 	if (!me->ver_coefs.odd_real)
 		goto err;
 
-	me->ver_coefs.odd_imag = kvmalloc(grid->num_ver_coefs *
-					  sizeof(*me->ver_coefs.odd_imag),
-					  GFP_KERNEL);
+	me->ver_coefs.odd_imag = kvmalloc_objs(*me->ver_coefs.odd_imag,
+					       grid->num_ver_coefs);
 	if (!me->ver_coefs.odd_imag)
 		goto err;
 
-	me->ver_coefs.even_real = kvmalloc(grid->num_ver_coefs *
-					   sizeof(*me->ver_coefs.even_real),
-					   GFP_KERNEL);
+	me->ver_coefs.even_real = kvmalloc_objs(*me->ver_coefs.even_real,
+						grid->num_ver_coefs);
 	if (!me->ver_coefs.even_real)
 		goto err;
 
-	me->ver_coefs.even_imag = kvmalloc(grid->num_ver_coefs *
-					   sizeof(*me->ver_coefs.even_imag),
-					   GFP_KERNEL);
+	me->ver_coefs.even_imag = kvmalloc_objs(*me->ver_coefs.even_imag,
+						grid->num_ver_coefs);
 	if (!me->ver_coefs.even_imag)
 		goto err;
 
-- 
2.48.1

