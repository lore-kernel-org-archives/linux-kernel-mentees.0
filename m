Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0537A38B12F
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  7 Jun 2026 11:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830390; cv=none; b=XUQ3Vh5SyTPaT4MT9/2RULNVEuVxV4lwNQkocvqn5lQwWnipqT2mxgtKX1nyIqsKpPJMZNXmaPjIe2U+5/gLweYfkscvMKqAgy+VepeD+xunpGv5eXw40H9ledp7NH9FnqcsYRQ31EB9rKk1piVrwLqfxAThX1oDqJV9uaAz00Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830390; c=relaxed/simple;
	bh=9n4iO9VgRTGZwsOkpr6hqey7LOXePB379ZbrIQuvA+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tp0uJEax1IBTuP2hpqXknlawNEg/K+hX/ojiySG/50RQD/JoWX0DuIpoaNhPdNLaFK48Ostg+uMOCdHS/c0Gg5A+BG0pmzyHQnrGrI81hjnt274ZytJd7U9Y9nkHyIglzv/WhSEpRNZl2EJw3lZPO3nGMAPz8taMpbvtCGJUxu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKPv0SSc; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKPv0SSc"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36d5b11201aso2136003a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 07 Jun 2026 04:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780830388; x=1781435188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cSHKcQcPLYJJJW+spAIjHqERoe3xOlP4fC68/c2Zs+4=;
        b=UKPv0SScgoahq7hfEVL+IIUgtQeHRcL03gwEbkC7y+0eicBBqSNC+f6vv2XJrYlMXc
         U4UTjaPFvaC76vj+1AZWA/LRDsx7aRf428+eGxauuKjEQ5ntQMSEImT7HPCcG9nm3MiU
         G0t7E9+KDclKGF5c+cFimnOoxVS54EoS6SpcUIySMjS5M+hHMWgUpVwHCQaXLqV/0zHr
         uxuk+f19tb5UFz9BNB5T5E/NvCqSHdh2xx73kNEbw5KCRlk+U1CmNJ1+FhYHIIflOjPT
         2B1wWfdCNkAdUNk817Ygshzw4bqAn2l2SItxv080xeN7y2dELcOdb6HKiJ0x+K28SCSS
         IZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830388; x=1781435188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSHKcQcPLYJJJW+spAIjHqERoe3xOlP4fC68/c2Zs+4=;
        b=hyPvIjvYy0BhMSbMEAz+1N9HvhPmJxlGECRVCdYYV4x/SwpYa8G4+xvR7JXa3PAitO
         w5N1YZLASXgx36Tf/sB+600HnXt3ODRcOCjqFpt1PPaG4E0tX2WVUQNd3DluNZAczeKO
         xss9fNLfs/Tq5tTAdgycr4PEUeGmBo+UNfHxLnqFK5E1x3NNGkWlOYi6wZvDcUQQX/AT
         RlWxNZk1kehTfi0IPGka+vbaCtFVD7N7r9YZmXZ15OfrfEQzngaUfhiP5f8iznTWvrD5
         qKYxkbK5qwLCxGh2fVx2xeGgkMYlUL3KA4XmYMmVQVZHIk3lU7lAQIwJXLjo7HeIru7I
         /Xhw==
X-Gm-Message-State: AOJu0YyhjNKNECgeQR7Aw6GsIyYtD8At3TSnAT5EezTIzWHTReI4SKYg
	mXHkZOOPPFzX5+IdGiIbK2BU5bDbhs3zHmqmnaMrpLmLDx9Uum8TqCgS
X-Gm-Gg: Acq92OEpoj4j4kASfxOLBWDa25Sfbs0NtBP4tiHbr0j/fXGtMgawiTWAYcU3RqyHtTS
	EZm9fZELbIe2zYxVcZ4i9jlZw3QXSIGOTYhcvNyGSgu0Fv885YmgL04A7rP9vLncyQf8KlmswIb
	mXGdIdnFWAuFD0PQV1N0zVXN600TjoV8QfchaJ28u8AsRh3XxhaESGr5/c3mAZomGoO2sWfPM4u
	FjICw/vdfu/r/Pk0Lg+DimQ3z4z/Nj2PbN30DQv7tfCS3WDCOQA0Tp4sW3ELPJaIcyTbUD0Rvhl
	ncIs3NyGmc0lsgMlfd5Ec96MGBODZj+rqbZX/Y+8w0J7ex6u+tb85z5RiwLyMrN6edc/QKkt+9W
	8mLWYROkPZBxwAzU/ZLxLR/VRSAJY6NsasncgDjgvqu5EjbB2/BGeD0Q5EARNMmfdGwj5pGsKoW
	IhZlX5t4O/xJ9ewdpAwPT7ufE4koV7mHb33WO4Q1r5bUPl8uXgyU4UTgtffIV2uqH3mR8yj5HuZ
	VDUgJMLNo3CG1RFeX0hJzQoBx7UG1Er2q0RNs3HaL+BooQnQP2bRb/Ij8BP6/VHAgt2kNYEJX0Y
	4dMY2byMX9IwGVTNxgtosc0=
X-Received: by 2002:a17:90b:57c4:b0:36b:75:6387 with SMTP id 98e67ed59e1d1-370eea202f0mr11781488a91.8.1780830388267;
        Sun, 07 Jun 2026 04:06:28 -0700 (PDT)
Received: from debian13.localdomain ([129.126.14.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm12357969a91.10.2026.06.07.04.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:06:27 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: rafael@kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Adi Nata <adinata.softwareengineer@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PM: hibernate: Fix kernel-doc comment for add_rtree_block()
Date: Sun,  7 Jun 2026 19:05:55 +0800
Message-ID: <20260607110555.53248-1-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment for add_rtree_block() was missing @param
descriptions for all four of its parameters (zone, gfp_mask,
safe_needed, ca), causing build-time warnings (make W=1)

kernel/power/snapshot.c:469: warning: Function parameter or
  member 'zone' not described in 'add_rtree_block'
kernel/power/snapshot.c:469: warning: Function parameter or
  member 'gfp_mask' not described in 'add_rtree_block'
kernel/power/snapshot.c:469: warning: Function parameter or
  member 'safe_needed' not described in 'add_rtree_block'
kernel/power/snapshot.c:469: warning: Function parameter or
  member 'ca' not described in 'add_rtree_block'

Add the missing @param tags, reusing the wording from the
neighbouring alloc_rtree_node() for the shared parameters.

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 kernel/power/snapshot.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index a564650734dc..cd582be86412 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -459,9 +459,13 @@ static struct rtree_node *alloc_rtree_node(gfp_t gfp_mask, int safe_needed,
 }
 
 /**
- * add_rtree_block - Add a new leave node to the radix tree.
+ * add_rtree_block - Add a new leaf node to the radix tree of a memory zone.
+ * @zone: The memory zone's radix tree bitmap to extend with a new leaf block.
+ * @gfp_mask: GFP mask for the allocation.
+ * @safe_needed: Get pages not used before hibernation (restore only)
+ * @ca: Pointer to a linked list of pages ("a chain") to allocate from
  *
- * The leave nodes need to be allocated in order to keep the leaves
+ * The leaf nodes need to be allocated in order to keep the leaves
  * linked list in order. This is guaranteed by the zone->blocks
  * counter.
  */
-- 
2.47.3

