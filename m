Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638AE3C1F45
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Jun 2026 22:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252643; cv=none; b=YVILRGBMHNF3ypuWNrrsn9sWsdsaWOPy0xTGWYm8nWGPRf1t3wUUd73YISVXmjT2+YIy+4Js4D9dKMEqiAf3dAmS5m92TKgNjht/LCxNwUtGSa7m8QVK/YVl+/3jfCp/qMRQMlAcEVgfU5ysABWS60Ix5Cd6klG+RzcKH9rVgMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252643; c=relaxed/simple;
	bh=eAQ4oMX0/Xkapoymki25CS2DNK7+/uNx6TNxx66H3KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXyoHsMbXYjUxEM6f0oL0XTTUtjHGHaxIElt9qUmiljGKyI0dhzJmNG791xgPwOv7NbH4TiXX9q/X4L1hakQPMhajOlGJdPNJpJIQsGZoQWYJuVPNneZ53UBrOc9tx9lPDyOYlqkIHpt4fX5F9o/FA3tj/kUIwon7Z2n2aZyFAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jK4Auq6i; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jK4Auq6i"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30c6c8d7503so37244eec.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Jun 2026 15:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782252640; x=1782857440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4xS8phRqWxiljJHmmeogtt69A2jDuGD7tOCK9G/dU0=;
        b=jK4Auq6isFqPU6cYmIGfEgioFQb7On7TxSDtkAehsZiupJTizqhNKaXeB1WmguDNsZ
         anl2UniP10VEC5vCbUNZQo5IO5poYasMc4ZFvyeraHw++EdO7MjwnfClUmYiNMHMnXhb
         Pb0yjBiw+rm1Ag/40hzO/0i4ZfAeOf34mvMPtqIlj+NQwt3UKqFnxAWOgap+MfhqSzBf
         VmdwXoQvRWAtuSizth8tYEy7ODkCDNrrEdAAV89Ebd6y+z+5lytoWgBwQEk1CmKhGqua
         kOkaC7wK3E/y2+TInQCCzBC3nh7dz7qQtsIhZyqOFkWCEEqqdETbIAbD9vOWS5ExC1l/
         PmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782252640; x=1782857440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z4xS8phRqWxiljJHmmeogtt69A2jDuGD7tOCK9G/dU0=;
        b=md1pxpF83LnNgf31xaJ4H6uYVKCpSb0fVQ7atm+NI3m6IRxJIMH38BGCwrH2eE9JA2
         PnA++AM9HVRdMLBgkJSZdNRSL1G8zfcp+nnf/0P0h2bq0a1lKi///MuDkD0AuZ+jAmo1
         Yf9tVuoFKdYcM1E8whrZlrnLrnqSepAb4OQMuUkee2bwYvrUc7r8eaRRRANsNTMUMR+c
         DsUlBRD7VfKJtsU+6+61I3qUWMtXcdWpKVT/l+8381JICZZhuiog4O+u9Yd+KPXDdZOv
         UJ4uKwNeZIwSRDkXqsLXBFk5FT4NzTNgtMJKlOM7wdIaV9KUCHzKjhmuMN4PpGngK99o
         /76Q==
X-Forwarded-Encrypted: i=1; AHgh+RpXpZipbJp4wlW/sI1xYLQjZDFOgLU98mFfzp3lHnuftUewitBq3mc30/oRKea+QsnP1vBgIwpUMnRGG3qPQrmF8xQWsw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9B52InhgGvliLTwLfeBgO7n3hw9IgnWr9nq1BUXNMTy3abvg1
	/J0UP8xj1sh/rEQaON4/9AiIUnABbtts/Fd4xcS4iSeHc3iTHJT67IlH
X-Gm-Gg: AfdE7ck4QffuZyn2t4mhsmwc9ENKitgFb2WrvYDm0E5YOltnVJiHPgbK7nsTSM8IcPB
	ejx+tGcI/9+JiJMNpKCCPq4qkMbGQqmiVN8JLm/re+srbREKRX6RzmcztZRiLbxdG7A1lXCuzYz
	++wDVj4tWIIHXejg84CaImHy3uruk25qMOk13p5qiKQ0P0L76u+fQg0xoXGB9JVm2ItiYJW8Qdk
	6Ue9vNfydFl17eJSLInZrkJHuV4agw3Ak2OGXTqeRVDF+aJTIyA4SdNquiUOir9GTgD38jjuTSx
	1/jcaUNSm+7l9JCsZlv1ETOiikPLUPCFYzU5L77FaZqQsIS/+Tg4uSYuXK9qPslxfg7Scj1XYVt
	2L7JlF1DFZX1SMdmcXK+noQANhZOEqHFXng6X7SeEmeErxoE4ELUO2LcbUe3omfz3iff8LOkymr
	86+HKJ/fpQ0VMqySxCKOd9mP2cnJm6Zdx2FZtU0iUB3VlgINHq4oXLTrkCAfJtcorrtKeJRGq+Q
	voQJw==
X-Received: by 2002:a05:7300:f191:b0:30c:5a7b:ae2a with SMTP id 5a478bee46e88-30c69343b90mr948131eec.24.1782252640508;
        Tue, 23 Jun 2026 15:10:40 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:c10d:2699:12a0:58d6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5178a68dsm9059903eec.22.2026.06.23.15.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:10:40 -0700 (PDT)
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
Subject: [PATCH v3 1/3] staging: media: atomisp: use kvmalloc_objs() in make_histogram()
Date: Tue, 23 Jun 2026 19:09:26 -0300
Message-ID: <20260623221028.40238-2-rodrigo.gobbi.7@gmail.com>
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

Replace kvmalloc() with multiply with kvmalloc_objs(), which handles
the size multiplication internally with overflow checking, silenting
checkpatch warn.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
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

