Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C83B42BE8D
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 22:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069575; cv=none; b=QYcAucEHu9rQ+27jOrye+cR/bm/oys2hfbIUH/oJyLjXcfzEUgKuO3vvHqORFtoqXvp66ZBJWMn3Wc99QRVVQ2HoUpOjc6xpepztRiRQjhy71xpfYFjaSN/6LCTNj/Z00fpax6YrlRIDVVUkn89EsI9rGQQERKKwAuRhnjexW5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069575; c=relaxed/simple;
	bh=5xD+gbAAQfa7Zz6DBWl8uQYu5cCVQd7fsutssEb695I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rwn7ZkeobK+s/ni2f88wjCbDIil9agCJvsdeRLWhj0uJH4rD9ERS8OcPjwJyozlnQJd4k16I2+Ry4nk00Xx5k5Tsmmp+3l9/DWiNloka/gc19rrFwEKu98TDMcm3agRl70TAoLEbr3auBLlg9VFIupe+AUkEpqemKqFLgir3AZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgBJYmWX; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgBJYmWX"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81e8fa1b8d6so39823517b3.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 15:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784069571; x=1784674371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fS/qYunkaEsTBnkedEsMK25XcSingk2GiGQfZYV0Pss=;
        b=ZgBJYmWXOC3UG8mTZOzgl5kcAEiP70k/O6L3SrlzXAOfFQjGOvy58fb4N5XlxPtM4l
         Py/kbDZhtMiI6jSldeX8XfOUewcrMr4J7NXnP5bj/EmXbEJZ6t3aPWh+3DVZPhrEXmxl
         145iR7UjVd+oewSP22Unr95XsLVH8jbjvE60fvmOFJEKGzdu8XqF2xlo3OFowWMU/CxO
         Rjinx5T1J5aVmgad7DWSET1JNeM9PE+rhbaBeF0AsVZU6dwbNWdmPdYgctH93OZY8/Pj
         +jTHdo3w1jhXUd6auToww/gFSgHERoElD96oW9l9PvVY6yrzrcvi5kN739M39e1QX9qg
         tIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784069571; x=1784674371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fS/qYunkaEsTBnkedEsMK25XcSingk2GiGQfZYV0Pss=;
        b=WBhHEKFLRUajEZLrQu+CP/bDBvyDixHbk+QAbCSrjro+KvQ/wyHiZb0CdicW48fECB
         VHM96rTiX19803cU1HqxPENMItkiqJ9XMLU0uRjO5f372r0VEakgjr5mBh4zWWwksayM
         RyNfexspV3XR5zloPOVO4JDmBVEEe5fyXhrU6uOX+jto54TPSnSpwxo06/70VU658GpS
         ICh0hLiRXwItmS5wgYygyTh+grKDvTSbN4cdWYz3f2DmnjiCG5dRy0T35Upkh2/adbjd
         2O4Sm3KMPRlzCY4l9TSUWvjpzNVCZZBNIhCmvXOOYvlwFn8Kq2H6ou8pcPdK0t5KLOu+
         phFg==
X-Forwarded-Encrypted: i=1; AHgh+RoWETOlYjSyVdoQTd0jJnlZUCcqelsB7CsQLQxLt9uFr9rwY5xYmswRCNcJhIdOuoUnSIPXUleEQtfJnOKg9jg1WMB9nA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCIO6JuW412TR+6+t9OkS6D6o+LtsdWSuDzP3KMndEdTNeD+5X
	JP2SaxmyyGw6hYv9oKgTmVTWxwxv2Prsk0eaOzp2Q1UC5CpZEFFJ5iFc
X-Gm-Gg: AfdE7cnYbIjKbpxdob0hrsXRh86ODhEguj2HDpSi1qP/28NOYFKOgE0r+kvpXRQmW1e
	s2XIfHpMDxt2JBCwLSQ5SgagRzPr4ssUl+Z0pouB4mKdZz9nPi/E0/sVJ5EZ95vunzW3gbot+Xz
	GHKDqeNgUBJ3rJkIrFmRN2rIkVSAdOpbNyu9c94hkpOW2UNfn7NKrHCdWM39mDr9ta0Y38ZHi33
	k6OVqlaFZtixEiMoIdCK9BaCJ7kgeJIDoTUZoaQ7Ml+FGWT6xxRWHaqWFCIdKlLi5nR+HK+4iaW
	WbjeTUTXygloy88COOJYqNmfHC25gio+sUwErhxUiTi4tACWVTc3fuIAr1b+fRYVdFfsNwhCuVT
	X5OOvVI0n8KykCTqNGQwZw+IJKlUcdhmRyffagog3srPPuO8zj4MZiYSpWEIpat8G07ue2fGYc+
	A84gR30Y3Tc+VfZkhR4/rMP/BchISlNw3n0iNSQ2s4kbMs90LCWqwl19yTwj/knTmuxw==
X-Received: by 2002:a05:690c:998b:b0:7fe:4069:d3fe with SMTP id 00721157ae682-81ebfdafedfmr30470587b3.30.1784069571383;
        Tue, 14 Jul 2026 15:52:51 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a510:f4e7:1a8:cf71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm153446897b3.49.2026.07.14.15.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:52:50 -0700 (PDT)
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
Subject: [PATCH v4 2/3] staging: media: atomisp: use kvmalloc_objs() for overflow-safe allocation
Date: Tue, 14 Jul 2026 19:49:01 -0300
Message-ID: <20260714225235.47134-3-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
References: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
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
 commit d178c7ca8fef ("staging: media: atomisp: use array3_size()
 for overflow-safe allocation")]
Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

