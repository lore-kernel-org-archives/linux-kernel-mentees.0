Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D484D1ADC93
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 16:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754930993; cv=none; b=iwSnyZF5juQ2L+yWF4VZimf8v6LqV8bWiaqxsGzO4l0AoS1/xSeAe5AUqCiQCbaTurNinsO9GLun5sPF0mmj/Hk7NW8wxzEw3AshxjKBfLVbv3HL6HrxHZtC18yowx/NKbkDCGCMSgRRwpCy8QUAG6lpYp6YJNFEvEVjUZdIHxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754930993; c=relaxed/simple;
	bh=r3SklTF/J28zldzKGFpkhzr6DqkcSyicNNJtCcisZS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SsUFDg84mk66cgY5FBm+X+69D+c9ZSDcxEq/iDjSpLf56ngJ7Y024Qs4QaxMzaBMWJEEK8P9T4ReCB9wWUJnaW0h/JUoa34+hmnxPcXfFc4jyAIeybfm8izQ/kfOs8xmW0yva4mr3jY+xsgH1tTg4+GlVESTtjxi9lLT85uKgjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVLLOP27; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVLLOP27"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76c18568e5eso5098956b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754930991; x=1755535791; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kN7nybJBSUg9GTrQwRnc+qxQzY/TYZwbF8aIFzNGiuc=;
        b=ZVLLOP277utB4LMnQ6PV9vM5KlrwPyxmZq7mhTJoQz7Rtoz/qtdbo0VKbEbr+m3V5M
         mpPvXqnnKIJGGg41FLjn4g0tH5B64XlGYPQZlQRL4Oo9g7mImqpuMzoQTpYPTq1tJyAD
         RMDZk1HasqSp8ErtkVj3wDkcyCvKWYmA+toatLIVOVHt3r4q4+LmD1HUNIX8SlA/LKU5
         4siCN4qZwDH+GIK35YTApJHTOFzxSam1mpIfuQgZe5ljQ8CWAPjy7ohgbDkxm6Kl5uP7
         0lk1eaUsfDfc3PSOGzkYTmoeWiyY8TXmjGeE52JflA2Xq41zR6WZ70qvdwCoMTbWaPxH
         GDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754930991; x=1755535791;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kN7nybJBSUg9GTrQwRnc+qxQzY/TYZwbF8aIFzNGiuc=;
        b=YC8PHsoDc3Aq/W/XfbIuKeQB+SGfMzzoEqjsGDEz2g8iZdDBTmMvopVkUeeH6bWs0k
         b7V3SbVvo1FDqI84ZOMU8KOAfFwdZU8fG4jjq5yWeIzMjNsthkp35/i/evcbIQfKYZSv
         5zvwF/apNE3D4xO0iGzVEK59L4kI3/x+7C5mQ8K+d4gwTNMP30MifYYgP+zMxyAHx4L1
         QrBvkooWBgJyD0sOP+jILp8zdrAdTyYkNTIn4vv8XP+arIVrSMvbiDAgE8G9DL/wPlv/
         BUOFTrUsfT1fknBwkFoQ1W1zF5AHzfbu/M/v6mktSmxAyDUd98QLzeCkoHwtgj3xKgir
         1HLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9kXGzwhR71FrpRkPz8g23Z0V88Gkt2PUdKlFymLsc1kByPCR2Pb5PwLNBcK4Ay3XC2MiMlXLfKGzgGHYjB7jEPmpVIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxpZFddkiLIBsDQk2MdBA7B3HyAR4zeRMFkvKsR/C1CYuL5Yfh
	7p7OV+/R8nKeVq4jckNhU2a9hGHnTaX8SKe5x4QS64RgBEQU07H5MBZy
X-Gm-Gg: ASbGncvjmQHfQ4As3UrhE2CtLfHEunEZ/EaCgwVm1C2koJ08ap5TEVhG+CzMn0ac8nL
	807MBlMLDoKzDLRVO5F+yDxX0nV9p/iR7By+k7wuGmHFrgD628y1tmV0Az20IIUtwq3RiC6RaS3
	HIubyzArtGkaGzucFg/0rh3ZUt44hhGbnTDFoHvuu2O4Q1NzBGYvYSOXDFBhtFxQBPTUsU8jqvh
	3aVuxvNzsvISQCu2REuu5wMjciw5d+TLRJjpeunMaJo2eNEcECGM1DU7SuCIteEXXukiy4o4DJE
	k8nWTVLfYcs6eaJE0+icVdlv7YyPLjxfpPsjKfRlwNcZN+94F8BaaIKo/bn+jg5EoBvP5+79ajF
	lv2aKefOQjKdHVN99jeNg
X-Google-Smtp-Source: AGHT+IHX0e/PO4Z3IwmNT2g44cWPgFEvNfHjvzx7OGW61t+9EdTI2FUpffbo9A0LBSYC4/7QS364CA==
X-Received: by 2002:a05:6a00:2d9d:b0:749:b41:2976 with SMTP id d2e1a72fcca58-76e0de36131mr468710b3a.3.1754930990889;
        Mon, 11 Aug 2025 09:49:50 -0700 (PDT)
Received: from localhost ([159.117.70.219])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76c09adf8efsm18808340b3a.68.2025.08.11.09.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 09:49:50 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
Date: Tue, 12 Aug 2025 00:49:46 +0800
Subject: [PATCH] cxl/region: use str_enabled_disabled() instead of tenary
 operator
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-cxl-region-string-choices-v1-1-50200b0bc782@gmail.com>
X-B4-Tracking: v=1; b=H4sIACofmmgC/x2MQQqAMAzAviI9W9DpRP2KeBizbgWZ0ooI4t8dH
 gNJHlASJoWxeEDoYuU9ZajLAnx0KRDykhlMZWzV1wb9vaFQyBrqKZwC+rizJ8XVOjf0jWnajiD
 3h9DK9/+e5vf9AFmqYxRrAAAA
To: Davidlohr Bueso <dave@stgolabs.net>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Dan Williams <dan.j.williams@intel.com>
Cc: linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, Nai-Chen Cheng <bleach1827@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754930986; l=1250;
 i=bleach1827@gmail.com; s=20250730; h=from:subject:message-id;
 bh=r3SklTF/J28zldzKGFpkhzr6DqkcSyicNNJtCcisZS4=;
 b=RmrHqhWXztlnPYHIiYy0fLMXBeWj3a9h4BobSSZiAzZsOkanJ5yunaC+jR0Rs1ULm2fOlqXDs
 lfJwZzUvlM3DobMEhFxNVjW9SL4KwYG+ODfoN2qNQHOsf8LrYsoglF4
X-Developer-Key: i=bleach1827@gmail.com; a=ed25519;
 pk=jahFPRplw20Aaim8fIt8SxlFMqkHbJ+s8zYBGbtHH5g=

Replace tenary operator with str_enabled_disabled() helper to enhance
code readability and consistency.

Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>
---
 drivers/cxl/core/region.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index 71cc42d05248..83d58787b5af 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -10,6 +10,7 @@
 #include <linux/sort.h>
 #include <linux/idr.h>
 #include <linux/memory-tiers.h>
+#include <linux/string_choices.h>
 #include <cxlmem.h>
 #include <cxl.h>
 #include "core.h"
@@ -1468,9 +1469,7 @@ static int cxl_port_setup_targets(struct cxl_port *port,
 				dev_name(port->uport_dev), dev_name(&port->dev),
 				__func__, cxld->interleave_ways,
 				cxld->interleave_granularity,
-				(cxld->flags & CXL_DECODER_F_ENABLE) ?
-					"enabled" :
-					"disabled",
+				str_enabled_disabled(cxld->flags & CXL_DECODER_F_ENABLE),
 				cxld->hpa_range.start, cxld->hpa_range.end);
 			return -ENXIO;
 		}

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250812-cxl-region-string-choices-f5aa9832346e

Best regards,
-- 
Nai-Chen Cheng <bleach1827@gmail.com>

