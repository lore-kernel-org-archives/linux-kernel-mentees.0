Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220F83C2B80
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Jun 2026 22:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252646; cv=none; b=p4cDkOcePOMpocgbW6nLMo+eP4O/0ZKeDZ4QFP9l2IlVIYvJQEi5/8ez6QOYa/borHOWMNomHFwNSbWfrjWLjfRamxPtoeq96rfZfrG91gZ//oHyQVI/uHNNxdJW90v1dMAhYYAw/wTb4F2/4qdDFzwVv0gT8zJQRUQ9K+fyQas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252646; c=relaxed/simple;
	bh=5Quy3AwSC2bBXWPKe5RE+1ZzgFALSjzDTW6lstWMxQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6r0LfxbLguG3dSVkG+rOA6O0Jh1/xg2xtRfzwkbjU1jHfE39U6lNeVrianIk5zWh6A3j+GyS3SukOmSluhsQGZjAhSS3hDYGO7FKC4i1QODYMQuAy6E80/eYfCMISQSjGmUBhW6KpCaB3vQ5bn9JcPy3cWxR5CYv5WXDY4g0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cymm2DeV; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cymm2DeV"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30c6c8d7503so37387eec.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Jun 2026 15:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782252644; x=1782857444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4+uQXuijZnEK5sxR6O5Jnnm3H8Px01U81Fdw7NimSA=;
        b=cymm2DeVJBFY/7zAtpIEctHWq6RGP0+CabX/6wKTvY2uIBm9k4L4rN0QnWp1tVyWVg
         pHJjr45nj1BXoJdDli8lmKgcpRbvlWOn4M9Y6W1S+zb+E7ptyWWU9bDf5gfhe3hfMwV7
         FBn+prl6oaEnmFahEFZOIBp7UJuPXTNLDnBc0jixNAyjWi3/mckpJbDmO8OxQR00Qh1a
         hE+/crXZKada95/dCURPa2w+3GV8hzwIJbi4Thjx8yE0C3+uFXjr5rAlEaCu+PG5MRGJ
         +/NmA/582/mhC17tQQlTd8Ohgjv+2IpC6ERm8LgW4vG2e73XiMO46NqxrOaDPQNiNJRL
         rE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782252644; x=1782857444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4+uQXuijZnEK5sxR6O5Jnnm3H8Px01U81Fdw7NimSA=;
        b=Sna9XrDBUpwK1JheUXqEb3eSbG7za/scv0QBfZYbVlUsdtZ240fupoaroU9fSSAZX5
         xN6EiQBFga/19XlocMVNIZTsqR8cCvGyNSoOy3zQUpRquTIfZLgBXpXVCYzCAu17AQlh
         p4SVTMN4mExhuT78wBbiu/nEc95uJUvzFt2+HBXeaxqa3fVJQ59NxSp3VawF3MrxNqdF
         SZ0AZe/094MLAo3dBnnwLnFcITPAvD5hvg+xQYZqRc1UmrZmG/0CrrZfz7sD2OMVVnwM
         LmkVcRyYLtJP+CBDk1rHwZk//VRhzM3qOmf5HFRo4e5D1Omci5xn5HYQcaljTjn70Lxz
         swYg==
X-Forwarded-Encrypted: i=1; AHgh+RrciW3nnvIncdPbF9nWT2+H3wpDEL/vYMgqt/wvA/F0d8XJpyKQzH0TyTc1vY8a4VCsgyi0g61yYjhim9CALcvz9TUKYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLKUQDQSv8TVXM4BzH/qsvem+tUqY+lfQ3iO0heqSRfzH51Jza
	DjqpzTwX6Frv30FI4xQbuus7BtsvUkOKZM48wFYe2EcOJmbjOyOopVh5
X-Gm-Gg: AfdE7cmowLIo1VPdP/Lkz6V1JG+ejVjwVdjfkLo7p3s4VBOdeco9dnOS6U8xa2N0DJh
	LIZsFoL0O2oecW5tzvQsFx9qctioPrxlak+1tg/G/WyQ69XJ8MIUb++wjQijgQ1Hz0MWq+qrb2A
	VjI4nVwABz1f5VJIJuhBPjI28UVZVjNPQUMXHjRZoOQsw9ARcPWfnk3VlZYjEhsWsU2Iak5K83q
	07ylQZecwcLiVThi5d/i8r+KvZ5gVOb+W89MRs9KF4eDQvSIVzFfKEE+nhFJQ7SymGdnxHc7WAl
	dEhkURVMIYiZUXLrWZip/cAMDfxO3eFAMt4mhChMFX6MzB10LG6ecplF/gizzNt1Qq4jWF+pudR
	ICaHv8+e5ptkEngEofEoqXhPbvPKW6sGIE58cOi0jFIthrnuIYTzXmQJxvsy+UYSFK07xo2Mxy8
	w44UrjRM+dzoESK+K5AoDK2RpQDaq05C6qpXkHVtGX+p8/9c0SJf2GcxlX/TTJfnbRQF8=
X-Received: by 2002:a05:7301:685:b0:30c:38ed:46a5 with SMTP id 5a478bee46e88-30c69394a09mr987617eec.30.1782252644170;
        Tue, 23 Jun 2026 15:10:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:c10d:2699:12a0:58d6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5178a68dsm9059903eec.22.2026.06.23.15.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:10:43 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 2/3] staging: media: atomisp: use kvmalloc_objs() for overflow-safe allocation
Date: Tue, 23 Jun 2026 19:09:27 -0300
Message-ID: <20260623221028.40238-3-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
References: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Feng Ning <feng@innora.ai>

Replace open-coded width * height * sizeof() multiplications with
kvmalloc_objs() and array_size() to prevent integer overflow in buffer
allocations.

The atomisp driver computes DVS and statistics buffer sizes using
unchecked arithmetic.  When dimensions are large, the product can
silently wrap, causing kvmalloc() to allocate an undersized buffer.

kvmalloc_objs() uses size_mul() internally, which saturates to SIZE_MAX
on overflow, so kvmalloc() returns NULL instead of succeeding with too
few bytes.  array_size() provides the same overflow protection for the
two-factor dimension products.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Feng Ning <feng@innora.ai>
[rodrigo: rebased; convert only the sites left open-coded after
   commit d178c7ca8fef]
Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
 1 file changed, 36 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 8420a22fd8f0..adc329be8b0b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -6,6 +6,7 @@
 
 #include <linux/overflow.h>
 #include <linux/math.h>
+#include <linux/slab.h>
 
 #include "gdc_device.h"		/* gdc_lut_store(), ... */
 #include "isp.h"			/* ISP_VEC_ELEMBITS */
@@ -4151,7 +4152,7 @@ struct ia_css_3a_statistics *
 ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 {
 	struct ia_css_3a_statistics *me;
-	int grid_size;
+	size_t grid_size;
 
 	IA_CSS_ENTER("grid=%p", grid);
 
@@ -4162,8 +4163,8 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 		goto err;
 
 	me->grid = *grid;
-	grid_size = grid->width * grid->height;
-	me->data = kvmalloc(grid_size * sizeof(*me->data), GFP_KERNEL);
+	grid_size = array_size(grid->width, grid->height);
+	me->data = kvmalloc_objs(*me->data, grid_size);
 	if (!me->data)
 		goto err;
 	/* No weighted histogram, no structure, treat the histogram data as a byte dump in a byte array */
@@ -4236,6 +4237,7 @@ struct ia_css_dvs_coefficients *
 ia_css_dvs_coefficients_allocate(const struct ia_css_dvs_grid_info *grid)
 {
 	struct ia_css_dvs_coefficients *me;
+	size_t cnt;
 
 	assert(grid);
 
@@ -4245,15 +4247,13 @@ ia_css_dvs_coefficients_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	me->grid = *grid;
 
-	me->hor_coefs = kvmalloc(grid->num_hor_coefs *
-				 IA_CSS_DVS_NUM_COEF_TYPES *
-				 sizeof(*me->hor_coefs), GFP_KERNEL);
+	cnt = array_size(grid->num_hor_coefs, IA_CSS_DVS_NUM_COEF_TYPES);
+	me->hor_coefs = kvmalloc_objs(*me->hor_coefs, cnt);
 	if (!me->hor_coefs)
 		goto err;
 
-	me->ver_coefs = kvmalloc(grid->num_ver_coefs *
-				 IA_CSS_DVS_NUM_COEF_TYPES *
-				 sizeof(*me->ver_coefs), GFP_KERNEL);
+	cnt = array_size(grid->num_ver_coefs, IA_CSS_DVS_NUM_COEF_TYPES);
+	me->ver_coefs = kvmalloc_objs(*me->ver_coefs, cnt);
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

