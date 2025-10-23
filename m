Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED08302CAC
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Oct 2025 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761224692; cv=none; b=Tn9gn2AmJcWAUCDwOlU9c0rXZesApllyUjpCbf+GHkSf8Uw4yN9RQCNDE6GM96WACXeYMBtl91pf/KySYmiwAF68cvrOLwXQ8nA6Lgm7uFvn9aVWaYPC9jSHJmbeVyfKtkQGAu9QIC2qWRB1YwQI8/XXVxK7n264UfUvp1ik+1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761224692; c=relaxed/simple;
	bh=MZntrYzYxpIKR4lTEuQ8vg90cnWJfjxVo3eqGMp0mdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XI5SyhF1hQuTTNT7gZd3U+R456wQ2fZnEXv33w87qt6JffdTszDi7/GUbgVNAGxb41yV0Ku7aSYsrG9KfKSrHnkQ2PrkBZb58LM3SGH7o3gEJc3QV00umG+vUIjlUCKIMrkV3Xf/8lIjovUgE50UL/WrRiMoo+qs4+n4JI/cwkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbxacUWc; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbxacUWc"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77f67ba775aso986708b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Oct 2025 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761224691; x=1761829491; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=id+wIYbTFy4GJ5sovEHifiUi3WKFfS9SlpVUAwl/jlY=;
        b=ZbxacUWcVybkV0RbnD2dbuXRLYXhUGc3nrOYWTNRDgQC/tWuS/hyPQJ36Ocx5AiFaQ
         SuL6IMp1gicZJ5PzscUCC9jG2wzk++JJ7LaUDxfYSpelNGNWIcbBnsXtw9zTDb94lDLw
         7cKT4tPPUOvlGHVD3PZqHqLucLZOr+Bodz/lvKGgbv+C9YhbCLa+/Lgqcue2n15shb6a
         SfyXcepjiyYgLdTSa4MJZDMHvvB/7p4eHg04ib6t5dIARRy6rPY2PHbjw8VeXP6Df02K
         xsOY1KEkxqI4q0Xlm5q6RwAXCnMmom4VNBKNZPtSQw+H4Jh/BaLGB8rbliUyi0xFvY+g
         NTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761224691; x=1761829491;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=id+wIYbTFy4GJ5sovEHifiUi3WKFfS9SlpVUAwl/jlY=;
        b=QQZNI5vhvPm9eix5ggEp/ZCIoWrW5CxqD4C8eQkqdJMqcPPiQL6mBaKymYH8NO7Wir
         4ln0CRumBz3BDGmxZaeKgeWaIYqCJJ4sUo8T2dn718pDGfrXiJEDEVhm5elDKxTUTwVO
         3e/i3dTYofio2g+GGK7XQkW0Jwf8A4jsJdmEcNI1UOa6LTLOpS7TOImE2Y37VKUsGZdy
         KfLV83ISfJPrG16lpc/G78Sdk6XnK38OyKFTuuMDbeBgyVPIywaI49LnSr79gPWC4ewu
         m2hfA+QZ71GeUOKnPNrOYbyhQ7Oa0lJvgXYDa5MVpz3sXw28p06zLhD02qoncq4WgcrI
         DpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh5XWfNlS3mfZYU4t/vFQKFi2Si8Pe/xUrxOnJNQOdRZL8Lk0LY7yWq9hD3Qc3lr6+hkyVBQPe4vD7IyG+Bq0SObi5Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrnBG9q8Iw20UEjzRRlBR4waUfwnWwDBOTFIjFU+Q2wLHmDlkO
	ruTBo7wO+aM7zjq+aLxMNXvLGU+tSMSR7QKX1Nd67W+lXCs9Nadx2XsU
X-Gm-Gg: ASbGncuTWOn0KHunUa6pASuEQraMi+J4bI+LPhMzTLypbAizHMIbgngKmsPMokE6dQs
	oiEWVBuEoTocWO9BcQiNg9ztWwfGbkVhIzpYY+oplIGqiUKn6eizw/iiE7XTMkeftEK/kobMGh2
	GNmSaqU3OqDwR9Tjn+keVpYvM51htjqG0h+IMvEnNPYeUIVB8m7fQRl5XUy7As3SJIgI0PhB1af
	L+P22dLUmBQKBbdm+fKjkFMJwvG698PFZQsNHutXQIcwc1ja8FmSKrEhXqQt3SZC3Rj1k88El+a
	+kK8jGv1yzT91YQUbn2GRiiJux9mczXze924v2+/i+1HnoCbsvmMT/ryStp3JAGjEvSdEejUXq6
	KnWzKwj1n6YmvzuwcY5SpW7OLxfWgHLivrJKeA3xZ7c9XjDy+vGJkCoTZC0HBeVtAoqdIg3O0wx
	3BpFnzosKx
X-Google-Smtp-Source: AGHT+IEcdM7hV7nizE7lspbXruEQ0gaeKJxvv0wIeUknnaa/wTQkABYZuABFdsJHbIclfJ2CGnpjFQ==
X-Received: by 2002:a05:6a00:4f81:b0:7a1:373f:c216 with SMTP id d2e1a72fcca58-7a220a9ded3mr30485012b3a.14.1761224674688;
        Thu, 23 Oct 2025 06:04:34 -0700 (PDT)
Received: from [10.248.7.103] ([2409:40f4:2040:16ed:f15f:ed0a:f0b7:34d2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274b8b291sm2509346b3a.42.2025.10.23.06.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:04:34 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
Date: Thu, 23 Oct 2025 18:34:13 +0530
Subject: [PATCH] wifi: mt76: mt7996: remove redundant NULL check in
 mt7996_msdu_page_get_from_cache()
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mt7996_mac_c-v1-1-580a3cbb2678@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMwn+mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMj3dwSc0tLs/jcxOT4ZN1UQwMLS5Mki6SkJBMloJaCotS0zAqwcdG
 xtbUA48HPY14AAAA=
X-Change-ID: 20251022-mt7996_mac_c-e10894b8bbb4
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rex Lu <rex.lu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 david.hunter.linux@gmail.com, khalid@kernel.org, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Rakuram Eswaran <rakuram.e96@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761224666; l=1686;
 i=rakuram.e96@gmail.com; s=20251022; h=from:subject:message-id;
 bh=MZntrYzYxpIKR4lTEuQ8vg90cnWJfjxVo3eqGMp0mdI=;
 b=jgYbQsrBeTw7tVtVJy36z0p2uDhIq4lvHZ86UI3xTp4Zr4APqXvIxFrHqF4MZMKViKRawY9Ky
 POX/j+CfAclAH0ZtDNhHsqHPK1379DlAhezZtod7if6PDUPry4Wh5CG
X-Developer-Key: i=rakuram.e96@gmail.com; a=ed25519;
 pk=swrXGNLB3jH+d6pqdVOCwq0slsYH5rn9IkMak1fIfgA=

Smatch reported a warning that the NULL check on `p` in
`mt7996_msdu_page_get_from_cache()` is redundant:

  drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1651
  mt7996_msdu_page_get_from_cache() warn: can 'p' even be NULL?

The function first checks `list_empty(&dev->wed_rro.page_cache)` before
calling `list_first_entry()`. When the list is not empty,
`list_first_entry()` always returns a valid pointer and can never be NULL.

Hence, the `if (p)` condition is unnecessary. Removing it cleans up the
code.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202510100155.MS0IXhzm-lkp@intel.com/
Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 9501def3e0e3e20132fdbcfe0b1f489694afdc5f..284f2eea71e5bf0a34c7fe84084d998164a31a05 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1681,8 +1681,7 @@ mt7996_msdu_page_get_from_cache(struct mt7996_dev *dev)
 	if (!list_empty(&dev->wed_rro.page_cache)) {
 		p = list_first_entry(&dev->wed_rro.page_cache,
 				     struct mt7996_msdu_page, list);
-		if (p)
-			list_del(&p->list);
+		list_del(&p->list);
 	}
 
 	spin_unlock(&dev->wed_rro.lock);

---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251022-mt7996_mac_c-e10894b8bbb4

Best regards,
-- 
Rakuram Eswaran <rakuram.e96@gmail.com>

