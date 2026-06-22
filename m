Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77DB37BE72
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 22:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168263; cv=none; b=OFG/gTRvbObXF+3sW7D2i1DkDxwdndZU2WMwf9AH71zh/h8JYi9kEq53R0A8jKbB0ScoUGuIPWEKHosjku8rUtCwUfyYGS6SnRWNlhREHWBDbD5DmG73OMOOfxKzVdS7WfYP4lE6j1MD+wUd0z/MTK/TJm8nBr2+OpieqNA0xXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168263; c=relaxed/simple;
	bh=eAQ4oMX0/Xkapoymki25CS2DNK7+/uNx6TNxx66H3KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdD2r2BvmSbEfcgoDrHXc4AZ5zKzeR3e1HMJvGJJjh4L0UjIGUHIo+PtkERGeZgj2VsAMlqSqBgu2CnD2EeJVa+YPSMcqtmAzLyD5M5Knk0j4hWT/eRehl0khXTpKMTOxDJCzARua07t0X0jvWhGyBI1pnn3p6DnP6H8BDBw9wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF4kTc8t; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF4kTc8t"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30bcdf8232fso10435194eec.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Jun 2026 15:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782168262; x=1782773062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4xS8phRqWxiljJHmmeogtt69A2jDuGD7tOCK9G/dU0=;
        b=EF4kTc8tGWRi3z7LNA6LDyYGFcuQ37UHCDEO6xwhJ95Q0nyY5WEMvNeFN31ZPs7qFy
         pd273wSa8U7mc+aTT7eM83vcShD/7PBIiz8KRdLlp4m9m11frGK5kNfdm1olrc9M2JOT
         FEOPEV+K9Dd1GFjRMo3DetxM/iKoKkKd5on5zJL6RqkcqVvchK5LgqBf+Yyp6wY2hX2/
         ME5r1mM018b681IRdhvDh0mH4hPThxdtk4zwiglb4dOIZ7nEpungfjwJ7AmCVSVq6dzm
         I6sAX/M34kiy4A3jXNfp4sH02MnVGUJzYKkyiNTksbFT+tDuAbJC592BM75+OBDWYkUM
         XwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782168262; x=1782773062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z4xS8phRqWxiljJHmmeogtt69A2jDuGD7tOCK9G/dU0=;
        b=Lcmh13/xbaD7BPQ21TFSw4mu2MYRLn3i4A5K7N9c1/WBk5QBuR85QzhYLsPyNQWC2c
         AhmPQ/n8SoJKipFYlZdl6PkGt2w/RC3GzXaNuG732//RSSjrMj9ol5XZg3RgH0rWHU8J
         wtigpbBrvupDykysYPapzqx2AZskCNWV3z59SRu1t7S/kh/PaFOPaELA5XSG5+BvF68d
         5qNM1iwtfNzT5zFFQW3llWaW2uXw16S5AB0NjH0kj/bMiMtkcmKjFWJv/zekBp+PkH20
         7vOoRTa0OTcVlVqjI//VPS87LNyZ85RUU69ciWfmS0synGDBAxvW5Ya1fer6wsDf0EIT
         muTg==
X-Forwarded-Encrypted: i=1; AHgh+Rro7CUfZigsBwfZF0oJP7D3r+9etvv40DXXpmfO+7OYv6inynHHWUHvEfJ5t4mZRf+qKNxpcMxXMQIL5Y6T/KICAN/3xA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy66LsMZ1Q9m5K1yhra7FcvNa7HxGyZIp8Bpg9GwqyscwvgUDI3
	bFquhNgIHnjaHoRB89r59WTMe944i3hSa8fm3audhJOOn8oHak7wy8Ak
X-Gm-Gg: AfdE7cmd42i7W/RO7MXKI0NqipKPkZ0x/3KMmAmob3VZUbsdc+69jWAR00t2tr9o/EN
	3mTI7Ri1lkQ1Qg/0VAk/a4ScHFmqWqlcrWhAdjYpPrQ4laGIaPXXdZ3S4XdgeI3I1RPvRtco8+p
	sJx2CFeZ7/CrCh6cem6oPpAjBlxIsIqhVv2lkKAYOTWZihnlItTfnrGCOzL5LF1ouG8pyTWSi9t
	sk22eSoj9nUdRnPzrIhNiqaT8CRo61teUT+nvWxXq+VPQXLuoa+QwGFb+JchKJuXpf56aKl4JNT
	myMk3QzcOPOmybpNDV7W29t7SRbLqoEJFAlW2xdClejhweF7tA66fOCliRIvyOfiBMaPE6STWJ0
	pYwhkEMbTSMIHsj0axk3FGIDeYuRK0PYMTQJ9w9Jc+JwvEuDHgUSkOhjrcCoKXkdd8+d254FmqF
	R+JPz+nbEFK3Y1Q10Y+6OwIR81SEjsvjgM14TytJ9DUhYgXq/EFpmwX5LY5ob4ZsJsSZc=
X-Received: by 2002:a05:7300:80ca:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30c06e3177amr12392623eec.11.1782168261837;
        Mon, 22 Jun 2026 15:44:21 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:691c:629b:eda4:7c2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c376sm13087954eec.3.2026.06.22.15.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 15:44:21 -0700 (PDT)
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
Subject: [PATCH v2 1/3] staging: media: atomisp: use kvmalloc_objs() in make_histogram()
Date: Mon, 22 Jun 2026 19:42:42 -0300
Message-ID: <20260622224402.34001-2-rodrigo.gobbi.7@gmail.com>
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

