Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195C4220698
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 27 May 2026 01:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779846075; cv=none; b=pZUto0sj3DupQ2MT4IaJjL1painHTlu7ULmRwN3sC1Yao3LPXZd0EAaou4vRP4NHtd+apCxsEzqvORFd5RwGt5pbzW8bRGkkorqyTsaEdjMCloo0OarLSCwbISHPc/oi1paMlE3u4wdy3CJ+rvWN0eRvnrIKZFQHv00cDBD8tEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779846075; c=relaxed/simple;
	bh=CkD6//8V94FznknCbIOJYRCz8ULjPJV4dnh8lRkdkPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CuFAvuGWGWSmiwPhE5JVcLv3XJh1+Kt1B8jcqQOjogsrRDoXpa6bWJWyF+XauAd8FCmZF4QZ/ILLrZddDAFtsJHfSH9PSYyjJgP7WKIZ0bXYguIAK6oBlkRjZkL+2vWs7/ACTOWBcsYHC+pva66RJtsYDs+VITgKOcoEBt6Clkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXMqhjHB; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXMqhjHB"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95cd8b71105so7132169241.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 May 2026 18:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779846073; x=1780450873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9H50iNGtKOm0zzGSjh1Nvv2QB7eK0iZJNgUcSL7MPk=;
        b=aXMqhjHBkfZn48a+huy9onM+ln0FSXtpO9Sxce2ASjWWAOIHBzp+C1lY0hlFDB4RWd
         NN9wIBQB3VPYuJFHl5pzP62IyoUxzBSu6+JUlqYyYp1doLrdrwjTVSd0/mTcyVo5l5rB
         dpWdW0sMmdptEsh7HHQGM7wpALMqk1bcgzXGkNVrhD5Zd6zExS9myg1y4AiiMYSx3q9v
         2+P+zCVWAQqEED7cRYio0JUoikN8EAAAwp94oEmJxNt+ATAsD18ceEBZxzI4qNqTYqfY
         t5c/s/l+mTh5XIrTbKifO9uaqJXxHYVivuI5oogdNiqSkLT+FAumL4rtuQ1W3u/rnV8r
         9cQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779846073; x=1780450873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D9H50iNGtKOm0zzGSjh1Nvv2QB7eK0iZJNgUcSL7MPk=;
        b=qfZcTJMwAQDXNLNaE+2JkWGHJf/SVVF1b2wHtUtoSaXL+fQxImPZ8nmAyDV3aI+bxq
         guoH8UQQXW+bCUh0VZE+ZZoXmR3OhfsLOQ3BSqa0usUohZgo0JF1GxFTi7/+lCPRS++l
         3ROr1YCFrWyLe8njxTinLho7LZeKA6x8zIMn6P8bCg5+OhFs/zD8WjnZRK7USXLVnG1b
         ofsOEtQvKmsKuWO3JxqG0jrJAN6sWJOjXeVgrDynQ8rQSYlIGYK8UgDKDxLrut/5WGqe
         h6nGuKoQvz7H1pXb2lh73oG1Kp9d0FQHH4zNvww6c5SSv9nJKF2fjYcvIKU0Uy+8jP2b
         GZJg==
X-Forwarded-Encrypted: i=1; AFNElJ9uBL+FE59t2wDCGytlvB5txv5no+YRSAzhmuqZwLWaTDbUano0TaocVaNSXB+9CRT+P1PitK5ah8YtLznjeeqGNkRfNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeQ6vxlcg9Kv1MlktlLPAi6p6DyRTlTQTvoR/yFwNIcM4jycJE
	ewfJ+3vltlUhKtpvYLfeSCeZp4mDGKRsgkvgEhX7EzyrNmb/605DnFVl
X-Gm-Gg: Acq92OH9EUC9jc/jOnEF4znPufKvKpQA/RF5L85zvrdIfEfFHr/muYEB5WfJr+js4pP
	djYLc20wfrgW3VXI6fZPJWxdD8EzFEj3V3SGqWXADCpQ4weeccT+M5U+0hUg2NgdBNo4nt57jQ7
	sygkMkIBkenLS7hXqNBek31LTcj43C+Ldpoad6wiB+SLez5ocVB+cmAwCdBXXswp2nKJSSgIRd/
	HNccMRtPXEAIIGCRdfeRb5gWuggA+RHf3FgsxcfTCcYR7Yoe5sv+i49+3I/3PEIFZiX7EOvGhkm
	Al5Utvpw2QFdEENPWtmVzr5sHoeVZpZDdmSUjgKLq1lKYYHZJMuX1vKgeAb7JNk6DFEOud7ksfz
	bIMLLmWwILYRRJXsejKMHGjQ8DdgrtWZRZ1Fh+KOhAIry+fZnksDBx/F0W3Fb4kNihm5l+wBiAs
	oZFIoU4DxJBjs4e2YdXEWzbPlDgjJpph5yyaaDWnXEfrOcQ3rQ64WV638BFMjca2xzshnfC89Bc
	Lo=
X-Received: by 2002:a05:6122:4885:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5865fc03296mr12522692e0c.6.1779846072974;
        Tue, 26 May 2026 18:41:12 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:730:757b:d7ca:355])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f2f791d1sm18491348e0c.5.2026.05.26.18.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 18:41:12 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] iio: adc: spear_adc: sort includes alphabetically
Date: Tue, 26 May 2026 22:36:39 -0300
Message-ID: <20260527014058.35265-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260527014058.35265-1-rodrigo.gobbi.7@gmail.com>
References: <20260527014058.35265-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort includes alphabetically, no functional change

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/iio/adc/spear_adc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/spear_adc.c b/drivers/iio/adc/spear_adc.c
index 91995489bb1c..efde6afc54fd 100644
--- a/drivers/iio/adc/spear_adc.c
+++ b/drivers/iio/adc/spear_adc.c
@@ -5,19 +5,19 @@
  * Copyright 2012 Stefan Roese <sr@denx.de>
  */
 
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
-#include <linux/interrupt.h>
-#include <linux/device.h>
-#include <linux/kernel.h>
 #include <linux/slab.h>
-#include <linux/io.h>
-#include <linux/bitfield.h>
-#include <linux/clk.h>
-#include <linux/err.h>
-#include <linux/completion.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
-- 
2.48.1

