Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2952371885
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Jun 2026 21:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782422907; cv=none; b=lmdYIYMMrL31+7fEnEec7kh8RzmeJB2HMXbCHdb0QN5HYsZ6vWpfcT99+5w0OoLh6BqkkBdKUKgxlc/LC+n0nGGgACP6Z/oJW8d/Q+8+aQEu9gCzsCaD5fQy8BhWidhJszsrFF6eaCHUnMySHEX0lIc6eEpbFSmTfeYMDC3s7bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782422907; c=relaxed/simple;
	bh=zBU9t405Chy2n1XXD9tDen5hcas/BXe/S1edh++kQpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TyLYF9pr6fg6HjIjJAHKnjqMCtNHLONmkYxAxlfVye0lopCa2kI4qPh+G/Ek1f4OqCDqjhiXZ8GuTTeDXzgUG1hJfHItGIet1a22aosxondZFex0Kar/JyyZfAwKhuTsFO00gt90i6lAWLbJyBIJtH+wh5LlYZv+zSflzkOY0Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBDAA/+e; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBDAA/+e"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-46dc0d0eb2aso175692f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Jun 2026 14:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782422904; x=1783027704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJUjpU1D0+bsNa5J5MmmoMrwOEGi/vBVmQ8kR01gZEE=;
        b=MBDAA/+e2zbKUlwzCZzVrAfVZR/dwsr7B6KefxDKJ8RasnofCB7u7F7fa3KMCAr7m3
         9wj23RYkwxplIehEuNM2PgxKovvs1tZ79clXhuhbiSVg12fi8v7ZX7ZSI2y/824EDgbs
         pdPQ63o4vzVQHmtodeFAcI/bLj1APnzadSSvvW4vhhNE9vhs7KsMCKDEq8h/eDbC2nT8
         ZFdfEg3Imt/z3BhWuCRtxmXo+F9CefGxSzw3b2WNGS0gwZZPXCpbnCM8Kb1WTfB0KsSp
         skQDdlvj3mTBP7DcdGqqOEZBqZf1mXG2TLzf9lKZdfyn4Je63fKyCN2dko6eNtgq78dD
         YuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782422904; x=1783027704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJUjpU1D0+bsNa5J5MmmoMrwOEGi/vBVmQ8kR01gZEE=;
        b=D/0MhUtyU2mUg0p1Ds0msVAvmOGPGhaqrwfImYppAqIlNetdh6yzqG0MurtNTYFTjW
         /8YZ5YHfa8URTeVn0y9CFRJTNtGOL7UaXn/VDJ3hCQv2H10JyEhrhS96iVQoI2uBW0AN
         B/r+9lxJv+GXk9S1cpzXz5Q88YpF7BLU8EJXGo4gpZpLCmhxpW4Ws+RaHq6KDRT95xl+
         YpFHbTBWtOYBd4i4odVowGn5ruC++4SV64FtXraR2yr79HdskdWjrh2GCMu1gHpYXFJe
         +usOC5VkNGdr2cXjZ9hwxw3bsXYX6cuVQGuhnNnwK6Hcx9rzyF9RMQTFX3QxKx3hH8Kl
         33YQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjtJnM9FCLPMlbfbdS/0LmmqnJUpma0BreeuuMZetumN6GmF9USsSaPJXXQELgltTZE1EDDYvrdk6ZntaaZoZ7iE6/6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmK+H8nsTzLwGJawI7YbU4f52m/2e2NDwcUDhfo+Tgpg2P8xnd
	edeNMKw7zdUH8Of5ledZm5+ElLE3QXpFWBb+9wkKtlRjVn871/ZmGUI=
X-Gm-Gg: AfdE7cnb5EXp2gXmkQ2XKTtLnTxVtoru+NYcg5sa2oHWlYcm2gaIMkgfVA3en0xDcT7
	q7PX1x/ntJkPLGjaDOIBYqc7fCe1ZBAUtSVBev+cB55d7lzKUeQrpT1G3dd9XrnZqvRL+I3iRw0
	PQ6YIwCLfDmIKk5ElwLPPNn2eMJpdFcxQw2sea+pEplcTo/4uuTQgb+30rcB11Mp4oaAHsbw5tC
	yaNlWyM4MMwoNB2zZAcftf31L6Xlk1sQakYgp78VWgd0pso0A9c4aIx/cMPCDU8NCbs773nOugO
	7ObHfy5JLCVZZ4NB73EwjDExQ7GslhPxNBPz+UOeDGujtnlxTe+l9vNhIrfeq4izTKQ1gbJrKEm
	zoHRBlJzKBeDeUMMotKuEtobNxeR2HyRyMe13PqxqLEUKB7lUuK7BDpSijeZjuN6HA4MFvCjjH7
	0bfsXnS7URIDx5Rl8fFkMBhI1N9DFYGjk4yeMT+3NXKmsXM/+lZTfuoyoKsG+0Wm1hGVcdULp4q
	ccrVA40yFuqKDZKtmfz/ptuLSVWkUPut48xXSTAbns=
X-Received: by 2002:a05:6000:46c7:b0:46e:5c5d:b2cc with SMTP id ffacd0b85a97d-46e5c5db779mr3370997f8f.23.1782422903900;
        Thu, 25 Jun 2026 14:28:23 -0700 (PDT)
Received: from archtop.localdomain (92-242-248-94.broadband.mtnet.hr. [92.242.248.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46cf775a4f0sm13209676f8f.17.2026.06.25.14.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:28:23 -0700 (PDT)
From: Jakov Novak <jakovnovak30@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kernel-mentees@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yu Zhao <yuzhao@google.com>,
	syzbot+03fd9b3f71641f0ebf2d@syzkaller.appspotmail.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH 6.1.y] mm/mglru: skip special VMAs in lru_gen_look_around()
Date: Thu, 25 Jun 2026 23:27:51 +0200
Message-ID: <20260625212751.23612-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yu Zhao <yuzhao@google.com>

[ Upstream commit c28ac3c7eb945fee6e20f47d576af68fdff1392a ]

Special VMAs like VM_PFNMAP can contain anon pages from COW.  There isn't
much profit in doing lookaround on them.  Besides, they can trigger the
pte_special() warning in get_pte_pfn().

Skip them in lru_gen_look_around().

Link: https://lkml.kernel.org/r/20231223045647.1566043-1-yuzhao@google.com
Fixes: 018ee47f1489 ("mm: multi-gen LRU: exploit locality in rmap")
Signed-off-by: Yu Zhao <yuzhao@google.com>
Reported-by: syzbot+03fd9b3f71641f0ebf2d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/000000000000f9ff00060d14c256@google.com/
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
[fix conflicts with variable declarations and vma pointer usage]
Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 mm/vmscan.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 1f7a90ecc700..f6f8c18dc45f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4622,6 +4622,7 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	struct lru_gen_mm_walk *walk;
 	int young = 0;
 	unsigned long bitmap[BITS_TO_LONGS(MIN_LRU_BATCH)] = {};
+	struct vm_area_struct *vma = pvmw->vma;
 	struct folio *folio = pfn_folio(pvmw->pfn);
 	struct mem_cgroup *memcg = folio_memcg(folio);
 	struct pglist_data *pgdat = folio_pgdat(folio);
@@ -4635,11 +4636,15 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	if (spin_is_contended(pvmw->ptl))
 		return;
 
+	/* exclude special VMAs containing anon pages from COW */
+	if (vma->vm_flags & VM_SPECIAL)
+		return;
+
 	/* avoid taking the LRU lock under the PTL when possible */
 	walk = current->reclaim_state ? current->reclaim_state->mm_walk : NULL;
 
-	start = max(pvmw->address & PMD_MASK, pvmw->vma->vm_start);
-	end = min(pvmw->address | ~PMD_MASK, pvmw->vma->vm_end - 1) + 1;
+	start = max(pvmw->address & PMD_MASK, vma->vm_start);
+	end = min(pvmw->address | ~PMD_MASK, vma->vm_end - 1) + 1;
 
 	if (end - start > MIN_LRU_BATCH * PAGE_SIZE) {
 		if (pvmw->address - start < MIN_LRU_BATCH * PAGE_SIZE / 2)
@@ -4660,7 +4665,7 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	for (i = 0, addr = start; addr != end; i++, addr += PAGE_SIZE) {
 		unsigned long pfn;
 
-		pfn = get_pte_pfn(pte[i], pvmw->vma, addr);
+		pfn = get_pte_pfn(pte[i], vma, addr);
 		if (pfn == -1)
 			continue;
 
@@ -4671,7 +4676,7 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 		if (!folio)
 			continue;
 
-		if (!ptep_test_and_clear_young(pvmw->vma, addr, pte + i))
+		if (!ptep_test_and_clear_young(vma, addr, pte + i))
 			VM_WARN_ON_ONCE(true);
 
 		young++;
-- 
2.54.0

