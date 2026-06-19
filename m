Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3974537FF62
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 19 Jun 2026 11:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781869022; cv=none; b=MwaiZg6iLKpKHfpHqGZfq1CdCZxBtx5e3diItLumrtMRBiRG8g028vXuu5SM4tUoeoSI9vF+t5lL6mFcrkMbn1EgAX2SEYYpIU9eraClen0hWmV1ycWFoOvF5rqZ5rMJ3zOd7tyUKvlou1JPcxjbiBrTFbho85YhTOmdbyqOMJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781869022; c=relaxed/simple;
	bh=JPEO11aaCk61b1MyssaBzdmL37sGUcdnybx1cLx2L7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=svCH8KNkB9y1qWHJ8h91c6lSXhJ9X4LZpwOeQAmeqAzm+Xy6RRpQwJmOlV6xt9KNd5tpfWZgM+cQ92fWdKtswKKScoqFaOO8VXyJM5Z3OMSLMO7f0vtBU2gt0SjGSKvzfK/1zo+RSw3jRhaZLzSyIAdwux1H8MQJbkE4oMTuNcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pD6JQzGU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pD6JQzGU"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1813279f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 19 Jun 2026 04:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781869020; x=1782473820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OOnLthBK1ZaLDe8IBLdmwVbR76i2jOQdkD1UWnvKsDI=;
        b=pD6JQzGUp2tVOdPfHrA99fF2GDqKcuX2pwuITsKXxOFBUUOuIfh8OTpUiUT7xlYHJ2
         tA1RmFVrKPFYve6ZnBYy0eg1er1TE6MxfTR/ex3TPsdReQTGaUr6smzDD2xna8uCJSBH
         eQa0HZc2vU8111MAmdhagwOAmtXxfSwOl/KQdroK/YaznSib00cojo4Yuw/Xq8Vfzzqh
         6SsBnjmydPcx45oWYw9/9z7pxd7lzX3+6zkFPBdZYnPl/Xveq5uoEaUAw+OtJW44TA4W
         w0lqb8sD2NjgJxLwBkGZm8qDj2ata7zaAxMDJ2BoHgiGiynYl7meB2RyBC+DJhFCcG8i
         8uEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781869020; x=1782473820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOnLthBK1ZaLDe8IBLdmwVbR76i2jOQdkD1UWnvKsDI=;
        b=Cmzx5qUUblHYwi++xEDOv4DTVUZ3Mf5PMCtpNcvTCPuJrrwf+hX/mwWNFSOIPdjEsD
         zN8XyD4NHG4g9e9b7UeefQ7EjqNwBPD+LcKCEcSQndX6WOvCmv+iU/30jforuOkBH/Yr
         7w3wDq5/RqC2mDYs2sHkqK3VABNl1e1myOAMrwYprE5o608Z0V96WQ4hiEwBe3Oyddku
         3RgHEfG4qF08YeGAQvEjQ/v+qVyVvZDvtKM+4/kezg0tmTeEi7XbtSuQ4zH3uwSZPlcZ
         wdC2wOMUufEH/ngnnLrBHjqOkg1Ko4lHGJJ4AG0IEZgzYodXjL1k6+pHnxlRvHt1oQ2N
         e5SA==
X-Forwarded-Encrypted: i=1; AFNElJ+Qgawn7djRrBEmoMWqW1pcsK4Y9WiJWp1zCBOBlqL7PEYsjwzanAgvhVn848AowcPaeFknBKluWFEvv2+x7Gw2SBIUnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPJJPSEXJkhQNXmta4aiwpNqu++5EzvQUj9Ih2xvcXJKSRuI0O
	w4LIq53wdPovEibfnQUoYijIZsXyzO3xjGJ32OjMaFkComveKFDtyIM=
X-Gm-Gg: AfdE7ckpZaahTrgDGa6q8v1DLBnQHKzNRnPzPUSIZEKZd3dmYiFANkxkHwUHRbwoYvn
	iFhqvf3419eJTkl9/L2XO0OWJA9MnaLwXNbya2L3eiV6sGf2SFHZmtsnO9BuYahZGSCJbglgOZi
	BUu9sja0L2P4TOz3FN3YGxUdWg+hMgUGZaUtl4uz8GUWROb52D/OppuwguSFsybsHGjSlRqLEpk
	blX0TTKpK43GTowkyixhJcqKoJ1DNTy2Atbq/vXV9KzE9oDs+boDDlL9AvaHcYOd+3htTFMQ7Qd
	sKefaHge2/8MZKzBXB0rwqCHR266LWN84yIoBM+KVtb3Sl3mZqNbJ5Hl4SKY0KDCtNvx7eDxeMt
	APr99ORtVnxUMmYXP0TLxk5LgyJkRATuRJa4K15rQmJ86ZnMjqBJpd5kvaZEUd0MHII6zYKnw/h
	RzrKbkdCQMbQxA+g/tdNqUsRsL7cTRW9O8yvn8oLWLGcMsAhJTMbEBWS22tDpBXYw8LfKoe0TC6
	OdiVjImrI3pzB6QynixZaSIJhuSHBMm4Jjl/RnS+ts=
X-Received: by 2002:a05:600c:5010:b0:490:e19b:9632 with SMTP id 5b1f17b1804b1-49240a59ademr40537095e9.17.1781869019472;
        Fri, 19 Jun 2026 04:36:59 -0700 (PDT)
Received: from archtop.localdomain (92-242-249-25.broadband.mtnet.hr. [92.242.249.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm50419445e9.2.2026.06.19.04.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 04:36:59 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-kernel-mentees@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH] Docs/mm: fix documentation warning for GFP parameter in kmalloc_obj, kmalloc_objs and kmalloc_flex
Date: Fri, 19 Jun 2026 13:36:22 +0200
Message-ID: <20260619113622.11712-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compiling the documentation currently gives the errors:

WARNING: ./include/linux/slab.h:1100 Excess function parameter 'GFP' description in 'kmalloc_obj'
WARNING: ./include/linux/slab.h:1112 Excess function parameter 'GFP' description in 'kmalloc_objs'
WARNING: ./include/linux/slab.h:1127 Excess function parameter 'GFP' description in 'kmalloc_flex'
WARNING: ./include/linux/slab.h:1100 Excess function parameter 'GFP' description in 'kmalloc_obj'
WARNING: ./include/linux/slab.h:1112 Excess function parameter 'GFP' description in 'kmalloc_objs'
WARNING: ./include/linux/slab.h:1127 Excess function parameter 'GFP' description in 'kmalloc_flex'

This effectively omits the GFP parameter from the current kernel
documentation. This patch marks the "..." parameter with the previous
description of the GFP parameter along with an "optional" tag in
parantheses.

Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 include/linux/slab.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index d4a873a16289..ee952784a150 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -1093,7 +1093,7 @@ void *kmalloc_nolock(size_t size, gfp_t gfp_flags, int node);
 /**
  * kmalloc_obj - Allocate a single instance of the given type
  * @VAR_OR_TYPE: Variable or type to allocate.
- * @GFP: GFP flags for the allocation.
+ * @...: GFP flags for the allocation (optional).
  *
  * Returns: newly allocated pointer to a @VAR_OR_TYPE on success, or NULL
  * on failure.
@@ -1105,7 +1105,7 @@ void *kmalloc_nolock(size_t size, gfp_t gfp_flags, int node);
  * kmalloc_objs - Allocate an array of the given type
  * @VAR_OR_TYPE: Variable or type to allocate an array of.
  * @COUNT: How many elements in the array.
- * @GFP: GFP flags for the allocation.
+ * @...: GFP flags for the allocation (optional).
  *
  * Returns: newly allocated pointer to array of @VAR_OR_TYPE on success,
  * or NULL on failure.
@@ -1118,7 +1118,7 @@ void *kmalloc_nolock(size_t size, gfp_t gfp_flags, int node);
  * @VAR_OR_TYPE: Variable or type to allocate (with its flex array).
  * @FAM: The name of the flexible array member of the structure.
  * @COUNT: How many flexible array member elements are desired.
- * @GFP: GFP flags for the allocation.
+ * @...: GFP flags for the allocation (optional).
  *
  * Returns: newly allocated pointer to @VAR_OR_TYPE on success, NULL on
  * failure. If @FAM has been annotated with __counted_by(), the allocation
-- 
2.54.0

