Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CDA432E76
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 22:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069570; cv=none; b=XzApF+W5hUDRANi+eMiwcfRrxjShWh19SJtBd3BTgeFzhVnojDfv7+7ShiAT93ynnrwGtw7QPah7zqgDvWmrKpdkBC7cuHqihuQFrMBRdx6uFeNSZL4adspo1lnOtTx3gxdj0aPToAS0B3RPYjZzeMMTcLnJpiyR9TOnRoAMVE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069570; c=relaxed/simple;
	bh=A/qCooa4CX/pAneYM+GM5KmJMW5XYUBE0lCmM9t6q+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awG4ABkslYiZhv3SbsgyiadzR/agNkJ6NohlGfh2629NCOGIzObFoXWNLipzF329kxfGtYoncLjY5uSQJ2xgMAmsUD/CxHoQFXUiqQWzySwlLidLYHFOViepcecVyv7gd/EBSdGU3+XXF8lPbvC5e4HwGZaIDtgv5lunYzpiIgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyXWsOux; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyXWsOux"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-80cebd41372so48153957b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 15:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784069567; x=1784674367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/WWXOiE2bPExBcg+mH0smayeiXsP/dreEIzKLTojxg=;
        b=JyXWsOuxo0fZeMUK2gNawvkKYEtxWnqTVZkIfjQfv3UWzjJ0bEuGsKOLrii1TafSK9
         2xoAypENHj102yC8knSIAEfswn9+uKsRlnhHJKHytpvVjUP0tLEINn+UJfsvlhdY63Q5
         B8kjqKrQ14fFkjYrs9q2LFRlthUnqs47p5jgpBqBbBXYXlsntcn0P366D2H90ysZSng/
         +3zdG+LZWIjQo02Gjldvc7bUIrmy3wAFdM/GmTKWqzKJWBs9nJJBVeQOskM1IlO7D51g
         R0lI8TVMpjCkETlEJ/Iv2jhuY2NlydPEdUsHF3fGxfs1wT6A4dP2WmgG1DCRT8aLhMHf
         OE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784069567; x=1784674367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/WWXOiE2bPExBcg+mH0smayeiXsP/dreEIzKLTojxg=;
        b=ma4trclBitbbR8Reh34N80fQIIK3djGwdJePw1pSlAT4zoLwMJkZlw9NtwIfZMC3ym
         es2vUsGqZ2g7BjaIYmKxc5XcJHrkwhlQsOSWSnx+aahwi4JeOb9F+RwoTRynQjcLWuXU
         gv+1tFI+1lxaJeZ26wcxA+fJ7D6cx3+wEwBRwDkfP0fdlHckz7OlV5u9JGaoUL2NB3uT
         nyWxlWqA8PfjDwNN3jK/nBfHHFEl4Hc27SjQ8K0aabA9hsH3te/Zo/GW00iefhzbkYBh
         1H/Dy0uIgOG4OntLr2n473G3IXlw9LL4QDitYZxyLv5ktIPPttoT+GXNeqiY1CC8r6yV
         McsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqlcruTYrzyt7t+03VdU8VHhBFTtGqRswxZTX5LPlZRIuK0H4VfkWkPhIBhKtU3/z4VdiafIVlQBW53bgWqoypRrJ4Yw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywcd9bIckxi0uV5jHfU4wJqhd11pN2TPtCAk1LQZi2e8gcoFK5Q
	Ob/P3JNPbgO51ZIivyKVxnMtwIMwUy94jAr1CoemW1NoL2Ch6yavRCSJ
X-Gm-Gg: AfdE7cn2QkYoMKArp2oo+ZP1khqXqF8rRDNTi6qW82sKpeHN/HHfa2UWhbdbkc1kquS
	4LERtoOTyZf3QdB9Y2h3hDfKmQP1eZ4O//tEScrzhBifxynt4Mj8BpP8XFUP8gm3tPDMUuECDt+
	S0Wpj2fzzv1XDFYtCuu7wHcEYBPpByUKt7zw9sJr9pmH8vca5bOYQ8qXQQApdMFThR3N6p7lT6I
	P3NbjbIo+AGnpl17PwHA9YSUUSSDpUfm9oTf2ya2DowAgqk6C0ffokAFVb6dg9Hc0A4IxT3pSf2
	+YLY6Q51PXiUXFyO/uWqKCuoxyJMbBrgasr5w1ykTIaPM1xUVn+TJOjdG/Z1E3WwMUNR5IJLuQB
	eACrnjlH/uYN5Hs2gzPJNCE1f9w56P9dCIAPGsaNwFyzR74u3TuEkZ+GEdnF8VX/ByNANUvNHfe
	y4UPQfnk0bDiqwjBc3DuKrWYQMfovKSRquPQysb47PHFrIVHfoqrfMEek9xubZClQl0y9diGa7M
	bLB
X-Received: by 2002:a05:690c:6b86:b0:81d:2194:6c4a with SMTP id 00721157ae682-81ecfa39bdbmr4685007b3.47.1784069566934;
        Tue, 14 Jul 2026 15:52:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a510:f4e7:1a8:cf71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm153446897b3.49.2026.07.14.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:52:46 -0700 (PDT)
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
Subject: [PATCH v4 1/3] staging: media: atomisp: use kvmalloc_objs() in make_histogram()
Date: Tue, 14 Jul 2026 19:49:00 -0300
Message-ID: <20260714225235.47134-2-rodrigo.gobbi.7@gmail.com>
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

Replace kvmalloc() with multiply with kvmalloc_objs(), which handles
the size multiplication internally with overflow checking, silenting
checkpatch warn.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/media/atomisp/pci/sh_css_metrics.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.c b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
index edf473dd86ca..90d92ab8d52b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_metrics.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#include <linux/slab.h>
+
 #include "assert_support.h"
 #include "sh_css_metrics.h"
 
@@ -59,16 +61,13 @@ make_histogram(struct sh_css_pc_histogram *histogram, unsigned int length)
 		return;
 	if (histogram->run)
 		return;
-	histogram->run = kvmalloc(length * sizeof(*histogram->run),
-				  GFP_KERNEL);
+	histogram->run = kvmalloc_objs(*histogram->run, length);
 	if (!histogram->run)
 		return;
-	histogram->stall = kvmalloc(length * sizeof(*histogram->stall),
-				    GFP_KERNEL);
+	histogram->stall = kvmalloc_objs(*histogram->stall, length);
 	if (!histogram->stall)
 		return;
-	histogram->msink = kvmalloc(length * sizeof(*histogram->msink),
-				    GFP_KERNEL);
+	histogram->msink = kvmalloc_objs(*histogram->msink, length);
 	if (!histogram->msink)
 		return;
 
-- 
2.48.1

