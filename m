Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD623112B6
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Sep 2025 17:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758560671; cv=none; b=lg/644XCzes5V8XGKpRGf4T9ef/TCKdLI+SW4svruK0sGde3BwyMOQPNdCAzPFc4VnR/lAAfhjIaEsCTDp7WloKs+lI8z6aembLZPEQ4xAWb17YUhpzpOziUHSMepA7unKdwZyQk36Ya/bhMqWiCV4k7bXO2BpfKR9nmDIC26K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758560671; c=relaxed/simple;
	bh=wyAJ+dw6+0xkuSAfp7XvJJhDyY7mJhDVkZ4H6eaoR4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S9Xp1koxewn7pDAHdyUz+zZscSw1po1ZiiCQTf82XgIoa/IR5ebGhBFWwTR9QJkxfNGDQFG8rMOlv7BQwQZsBZZ5GUGGmR2IIndWmIRyVPiEllNeWByl3i29P7SNfR0cAnMUsQa2jmY5oAPr1NGah0BSWCvv0fiPa3LT3wTrjqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2+HYrfr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2+HYrfr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-26f0c5455e2so17177015ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 22 Sep 2025 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758560669; x=1759165469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nc77MFzorwqtfxO6TersZ0PGs14XrPU5kx6kkJpwm/c=;
        b=R2+HYrfrdAn91UCpSJMEWd4AVBAgqrz9g5dKQz28dAV5J8UqPVlZKILQ3aqjWiJccd
         VUblGdy1I6FHr25YKZQ9rMeZqdhyqM2CtfPfBTXUpri5BMZXVPUhMSYYD54v/v5RVpfc
         jgmNEXJsO0O5yNlysaxjl1lwgF73cgUgZMasbg3nnlwNAOWMJ09+0x+qkFh6EQNqoT++
         lUx2AQdZFZgFMc7Ux5X1Z/v4cBGsAHylZI8mv3tBOmUb877ElKbDLgZKX7B5gYFMxC48
         atc/yKr3PtCwRImRGi4gcmQlSdjhqxGT+KtZVLfzPfw1zwGWuxNfa94wZlBzisAxg4kl
         L6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758560669; x=1759165469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nc77MFzorwqtfxO6TersZ0PGs14XrPU5kx6kkJpwm/c=;
        b=t32erfhS2UFho39p+IsoP0vpiSAWKkJzWDCuEqNOJLiWwdF5LPzPSJb61VGAnnn5KU
         T0W50ZGkvBmx94Yx29Pw6/QmGrBrMuu+2OUXFY3ibmwbuDGmmRwsiqSwkx1cA2xxbRmK
         aMnLi5JA/Ox2FxuMYmWwMXw5CZyOA4l9ZunpfQmEkCZ0cIqC6wHxYzQ2mDnKGOw4g+P7
         Jro1Y3IVBhdjkgbXqO+87H34qr3MAuY7Vb7a8gTRV4ghOBmE2Ls1N+HtceSbg7bn6PKq
         5vLmbEjOfel0srxcye8QL5Z7QYHFlU2zANevBg6929k9LLbWK83h8AhhM5pWNxHYEJju
         3lZw==
X-Forwarded-Encrypted: i=1; AJvYcCU6GlTjqGXuuuDiA4T7Q9rE4MwU0HOdXgOpMVimRrAl9bxu7sOybmiuB5nqYvF2j8XnhpidKCGe80Wx79KJxApVB/iVvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyheVRZxMlT18ACO5KdakOpndncFTwwqzHsgCMM934htJV6OydK
	/4cDAK2dEN3KAjzz7dRFlkwtrt3GEI477UduDMuIR7qQmIjyyRsUB2nf
X-Gm-Gg: ASbGnctEmZcmofQbQsKUzCV+3SYBXXoNnMmUDLPS75IC4WgAJARtFelSunVcP933Kjk
	cJQxclld3LkxmjVc3dXr3NWrQ0FqDYe7jeED4p/8gmndbUP3enKRyMd1f9bBVN1XL6XmVSCNJpn
	Qdz0+87tSqWnsVjAkqxCec3Egk7UnMjHPMgPxl4pDHvhbFNJOVkRJNwTbyoIA+f7g93FqZmfnQC
	PiK1guxySDghrQ1sLsGr1hkvMl92Rr9WZe+eZti3uF4JiAym0oqX4zzbFESF49devz6UF86/Kk5
	SFXQu98zj/7GRhv4WajjzV/kyciK7iNq6cJbkKX5vVwxQec7NMzFqMge9sEepbUvTYPR01D2D/l
	kvJMiHiz+GWEVJTlReK9xu7Zk+o9PsBBVcYPUunJ4LhSGOsXooaMjg7C9rOi9WhzZUDciZtKKoa
	8zVKiKRQQZgH34
X-Google-Smtp-Source: AGHT+IGsd8HkhcTtxst8+Dgce85bwqndE2KThGl7pjmFBv8FiVKOmjblKihFJmQw3vbhuDw9HB4q/A==
X-Received: by 2002:a17:903:b48:b0:264:1afd:82e6 with SMTP id d9443c01a7336-269ba5628fdmr135333825ad.53.1758560667816;
        Mon, 22 Sep 2025 10:04:27 -0700 (PDT)
Received: from debian.domain.name ([223.181.114.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980310e41sm138227825ad.108.2025.09.22.10.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 10:04:27 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: vbabka@suse.cz,
	akpm@linux-foundation.org,
	cl@gentwo.org,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	harry.yoo@oracle.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>,
	syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
Subject: [RFC PATCH] mm/slab: Add size validation in kmalloc_array_* functions
Date: Mon, 22 Sep 2025 22:33:57 +0530
Message-ID: <20250922170357.148588-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported WARNING in max_vclocks_store.

This occurs when the size argument fits into a u32 but is too large 
to allocate, i.e., when it's between KMALLOC_MAX_SIZE + 1 
and UINT_MAX (both limits included)

Add validation to kmalloc_array_noprof() and related functions to 
return early if the requested size exceeds KMALLOC_MAX_SIZE.

This seems like the most reasonable place for this guard.

Would it be a good idea to move the check down to 
the lower level functions like __kmalloc_node_noprof()?

Moving it up is not a good idea because
max_vclocks_store shouldn't reason around KMALLOC_MAX_SIZE, 
a mm specific macro.

Should the Fixes: commit here be the one in which this file 
was added?

Reported-by: syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
Tested-by: syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=94d20db923b9f51be0df
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 include/linux/slab.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index d5a8ab98035c..6db15c5b2ce7 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -943,7 +943,7 @@ static inline __alloc_size(1, 2) void *kmalloc_array_noprof(size_t n, size_t siz
 {
 	size_t bytes;
 
-	if (unlikely(check_mul_overflow(n, size, &bytes)))
+	if (unlikely(check_mul_overflow(n, size, &bytes) || (bytes > KMALLOC_MAX_SIZE)))
 		return NULL;
 	return kmalloc_noprof(bytes, flags);
 }
@@ -973,7 +973,7 @@ static inline __realloc_size(2, 3) void * __must_check krealloc_array_noprof(voi
 {
 	size_t bytes;
 
-	if (unlikely(check_mul_overflow(new_n, new_size, &bytes)))
+	if (unlikely(check_mul_overflow(new_n, new_size, &bytes) || (bytes > KMALLOC_MAX_SIZE)))
 		return NULL;
 
 	return krealloc_noprof(p, bytes, flags);
@@ -1013,7 +1013,7 @@ static inline __alloc_size(1, 2) void *kmalloc_array_node_noprof(size_t n, size_
 {
 	size_t bytes;
 
-	if (unlikely(check_mul_overflow(n, size, &bytes)))
+	if (unlikely(check_mul_overflow(n, size, &bytes) || (bytes > KMALLOC_MAX_SIZE)))
 		return NULL;
 	if (__builtin_constant_p(n) && __builtin_constant_p(size))
 		return kmalloc_node_noprof(bytes, flags, node);
@@ -1059,7 +1059,7 @@ kvmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags, int node)
 {
 	size_t bytes;
 
-	if (unlikely(check_mul_overflow(n, size, &bytes)))
+	if (unlikely(check_mul_overflow(n, size, &bytes) || (bytes > KMALLOC_MAX_SIZE)))
 		return NULL;
 
 	return kvmalloc_node_noprof(bytes, flags, node);
-- 
2.47.3

