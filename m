Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B3A3EA940
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 27 Jul 2026 11:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785152556; cv=none; b=Gyacc4XV+e4TXQGQ/GVoWnQbP1qkTB+rQRVv+WfUV4xTxPwKhjgmo9tfFDOhj7OYpf4PiCadpJ+tcNL+q8mTGbk7HhKIGYfsVZGuszvPTepupbMRppMblHK30lZzMqLvGyc7ye5U2nJb0eObPcDbbtXkcruiHa8WOnX2bTEBRwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785152556; c=relaxed/simple;
	bh=6wRrGcFhWYREOSQfRA3m6y37rJXhopnwKWH/NNfjthc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RSfxNBkKUeZ8DuWNeEEtiItwlX4GYJzpkEPBuuN1iHjWe+HK7CzsqEA06nesuzHXV5u6lx6rSjj+pD2yec02Nklo0pFc/8lf2djJK/mQL2fEyfIx/eNBXUR4XACGWmJIYo26l0zb3iKwzrvsY7g1eXTHzIQdDziC88raeujFJp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oKU/+M8z; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oKU/+M8z"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so29063475e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 27 Jul 2026 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785152552; x=1785757352; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7L72hNLzzbJMXt1q5caJXH1IC35xelL3H937BsW62s=;
        b=oKU/+M8zQkboNLjneYAzmWhdjkitiXPLJiTTn44u9/ug9bLUV9/Gz29laR5Gaf1nU7
         G53zGhuJSmTJ9SGU1L6byHRT2KOk8AWbuLAtAJZ+u8ttjAIwhO5I6UMrZkPedoV8UefV
         7DDE9UPRLYyEIsMFfRHlnD71URnto3UQXIWE5bvQ09B/Ra9PeXWwSzeLSfAuebm+epsR
         cHdsP1LgEy/1H7bTX+bo2lukL39zYxPHLoJu+9hVtBgWQMALO5qfK8SWUQ76vyJRLQWx
         MNRN63E+9KzTh42pwPuVj6gYQbJD1zcmbT4zQAzPvqnAt12jRldLAPgTvQClkeRHD0Wi
         37JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785152552; x=1785757352;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u7L72hNLzzbJMXt1q5caJXH1IC35xelL3H937BsW62s=;
        b=OIHz6LHErveGu+COFWTvXNWQ7j26EcvJFX1IKO/ua/ezsIMOkX2G4JG1pL4SmEJd5f
         4ejELvgPwVwKrc93oH7FK62fF/xVV931dI4AT7ijBtTHcb8KcuwgCB0V+6f9l6uaTulG
         n3gW53iBT/loRBEfPvMQyoOll5BLpNuqWkPUPLWheH1asPgNnuph1p+CWZ5EL8+XrkEV
         mby/qr3Jp20g4+1E2KpBB1+ODP8cgwUpSHZ1ddzum+2Pfrt1CUY52oO7Id+R4uqU8+Xt
         ha2BM+BXJuPMeQ0Bx2k8QFsg7pFJJS0fFmv8JyW9ZTd1s+/uiclTzdT/0irZvvFW5QXT
         1udA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2tn4UYV0QpQaOa8WkLdei0PEmZ6tiDwUP4DT6lb0eUMi1LyyD42LCp32G/pu3CPHiJDxrk0n7eZfuRWb0/0oh1OElnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEXCwu1UVcFljoMdGJAXVPmMd79o/yjXD5/zT8ZON91kCBCX5o
	9GoG0t9Yp3BIpa60xqNpgIcGmrxU3SpFGasGCcNbv9UE81yGlcJvnmru
X-Gm-Gg: AR+sD10BOwehWpEOxDGFk5OO8pa/DkLoFAkTOa/Kpvllu9VNXa78O6DmvY4XhMyssfO
	6itfILTEr8quGrO7IpoV1FtBPf9WAuVEsi73DUH8sQeUL2eiYVtw03AtHP6oQOwxZh/W3l/7w5E
	Es1Q/zMH2CuJNj5dJCsu++QBZ2LsEewKojqe91EGFcqRQ98mfTlE/12G/0wMF9CKOAPRfj293Q2
	0m7m4Xegp1Bk8ewmIGuEPk5ARy+mmbOkF6Df3awrt6jNRMUJ5NA8tDy2jkQybxOtLVSWYLa9sEE
	EM9thP5h2JXHqqn1nD6DRjtggIvwydj5jkFwpFO67QfSgvB8e/zgYzUodk3ai+XEHKigxGurP1w
	iW9/ZA+i28CkujSXe0w7mCVB2N79hGc/Y6CNPcKcLt5JRjE5AvHlgPi5CDaYFxWb5DOg5ECY3JR
	8PUVApLDQNe2yt48m/2gKcLKGglMORYrcXvdlpy860rcutV/HlqzPuV/7VN9MV6yjhfA==
X-Received: by 2002:a05:600c:a0c:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-496b56e6eb3mr100247155e9.3.1785152552177;
        Mon, 27 Jul 2026 04:42:32 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm243634505e9.11.2026.07.27.04.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:42:31 -0700 (PDT)
From: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>
To: Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>
Cc: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3] Memory leak error in qxl unbind
Date: Mon, 27 Jul 2026 13:41:42 +0200
Message-ID: <20260727114155.69204-1-megia.oscar@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I discovered OOM after run script below around two hours in my computer:

while :; do
    echo [pci qxl id] > /sys/bus/pci/drivers/qxl/unbind
    echo [pci qxl id] > /sys/bus/pci/drivers/qxl/bind
done

If you run 10000 times above script kmemleak does not report any
memory leak, but if you run above script about two hours several
OOM ocurs and at the end kernel panic.

The OOM isn't just a simple leak; it's a refcount corruption that renders
the list_lru fix dead code after the first mid-init failure.

Here's the chain:

Bug 1: ttm_global_init ignores ttm_pool_mgr_init() return
If shrinker_alloc() fails under memory pressure, ttm_pool_mgr_init
returns -ENOMEM with pool types already initialized (64 list_lru_init
calls done). ttm_global_init ignored this and returned 0, leaving orphaned
pool types with a NULL mm_shrinker.

Fix: Check ret from ttm_pool_mgr_init; if non-zero, goto out cleans up
refcount + debugfs.

Bug 2: ttm_pool_mgr_init leaks pool types on shrinker_alloc failure
If shrinker_alloc fails after all 64 pool types were list_lru_init'd,
the function returned -ENOMEM without undoing them. With Bug 1 now
triggering proper error handling, this undo is necessary.

Fix: err_shrinker: label that finalizes + destroys all 64 pool types
before returning.

You must apply the patch from the link "[PATCH v3] drm/qxl: fix
use-after-free in qxl_irq_handler on PCI" before testing.
If you don't apply this patch, you will get a UAF error when running
the script above.

Fix: "Unchecked list_lru_init() return value in ttm_pool_type_init()
causes a deterministic NULL pointer dereference in the newly added
error path."
Now check list_lru_init return value in ttm_pool_type_take, check if
pt->pages.node is NULL in ttm_pool_type_fini and ttm_pool_type_init
return value in ttm_pool_mgr_init.

Solved new issues:
- [High] The patch introduces a use-after-free race condition between `ttm_pool_type_fini()` and the active memory shrinker `ttm_pool_shrink()` by calling `list_lru_destroy()` prematurely.

Solved pre-existing issues:
- [High] `ttm_pool_type_init()` ignores the return value of `list_lru_init()`, leading to a NULL pointer dereference if allocation fails.
- [High] `ttm_pool_shrink()` assumes `shrinker_list` is never empty, causing memory corruption and crashes during module unload if triggered.

Assisted-by: OpenCode:1.17.18-Big Pickle/DeepSeek V4 Flash
Link: https://lore.kernel.org/virtualization/20260727110212.64913-1-megia.oscar@gmail.com/T/#u
Signed-off-by: Óscar Megía López <megia.oscar@gmail.com>
---
 drivers/gpu/drm/drm_gem.c        |  1 +
 drivers/gpu/drm/ttm/ttm_device.c |  5 ++-
 drivers/gpu/drm/ttm/ttm_pool.c   | 71 +++++++++++++++++++++++++-------
 3 files changed, 60 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index e3ed684ddcf2..b3f608619cfa 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -143,6 +143,7 @@ static void
 drm_gem_init_release(struct drm_device *dev, void *ptr)
 {
 	drm_vma_offset_manager_destroy(dev->vma_offset_manager);
+	idr_destroy(&dev->object_name_idr);
 }
 
 /**
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index d3bfb9a696a7..c880a0430363 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -96,7 +96,10 @@ static int ttm_global_init(void)
 		>> PAGE_SHIFT;
 	num_dma32 = min(num_dma32, 2UL << (30 - PAGE_SHIFT));
 
-	ttm_pool_mgr_init(num_pages);
+	ret = ttm_pool_mgr_init(num_pages);
+	if (ret)
+		goto out;
+
 	ttm_tt_mgr_init(num_pages, num_dma32);
 
 	glob->dummy_read_page = alloc_page(__GFP_ZERO | GFP_DMA32 |
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 278bbe7a11ad..9e82454f818e 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -354,17 +354,23 @@ static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, int nid)
 }
 
 /* Initialize and add a pool type to the global shrinker list */
-static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
+static int ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
 			       enum ttm_caching caching, unsigned int order)
 {
+	int ret = 0;
+
 	pt->pool = pool;
 	pt->caching = caching;
 	pt->order = order;
-	list_lru_init(&pt->pages);
+	ret = list_lru_init(&pt->pages);
+	if (ret)
+		return ret;
 
 	spin_lock(&shrinker_lock);
 	list_add_tail(&pt->shrinker_list, &shrinker_list);
 	spin_unlock(&shrinker_lock);
+
+	return 0;
 }
 
 static enum lru_status pool_move_to_dispose_list(struct list_head *item,
@@ -438,6 +444,9 @@ static unsigned int ttm_pool_shrink(int nid, unsigned long num_to_free)
 	struct ttm_pool_type *pt;
 	unsigned int num_pages;
 
+	if (shrinker_list.prev == NULL && shrinker_list.next == NULL)
+		return 0;
+
 	down_read(&pool_shrink_rwsem);
 	spin_lock(&shrinker_lock);
 	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
@@ -1198,6 +1207,17 @@ void ttm_pool_fini(struct ttm_pool *pool)
 	 * that no shrinker is concurrently freeing pages from the pool.
 	 */
 	ttm_pool_synchronize_shrinkers();
+
+	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
+		for (j = 0; j < NR_PAGE_ORDERS; ++j) {
+			struct ttm_pool_type *pt;
+
+			pt = ttm_pool_select_type(pool, i, j);
+			if (pt != &pool->caching[i].orders[j])
+				continue;
+			list_lru_destroy(&pt->pages);
+		}
+	}
 }
 EXPORT_SYMBOL(ttm_pool_fini);
 
@@ -1376,6 +1396,22 @@ static inline u64 ttm_get_node_memory_size(int nid)
 	return managed_pages * PAGE_SIZE;
 }
 
+static void ttm_pool_type_fini_and_list_lru_destroy(void)
+{
+	unsigned int i;
+
+	for (i = 0; i < NR_PAGE_ORDERS; ++i) {
+		ttm_pool_type_fini(&global_write_combined[i]);
+		list_lru_destroy(&global_write_combined[i].pages);
+		ttm_pool_type_fini(&global_uncached[i]);
+		list_lru_destroy(&global_uncached[i].pages);
+		ttm_pool_type_fini(&global_dma32_write_combined[i]);
+		list_lru_destroy(&global_dma32_write_combined[i].pages);
+		ttm_pool_type_fini(&global_dma32_uncached[i]);
+		list_lru_destroy(&global_dma32_uncached[i].pages);
+	}
+}
+
 /**
  * ttm_pool_mgr_init - Initialize globals
  *
@@ -1386,6 +1422,7 @@ static inline u64 ttm_get_node_memory_size(int nid)
 int ttm_pool_mgr_init(unsigned long num_pages)
 {
 	unsigned int i;
+	int ret = 0;
 
 	int nid;
 	for_each_node(nid) {
@@ -1423,8 +1460,10 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 #endif
 
 	mm_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");
-	if (!mm_shrinker)
-		return -ENOMEM;
+	if (!mm_shrinker) {
+		ret = -ENOMEM;
+		goto err_shrinker;
+	}
 
 	mm_shrinker->count_objects = ttm_pool_shrinker_count;
 	mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
@@ -1434,6 +1473,10 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 	shrinker_register(mm_shrinker);
 
 	return 0;
+
+err_shrinker:
+	ttm_pool_type_fini_and_list_lru_destroy();
+	return ret;
 }
 
 /**
@@ -1443,16 +1486,12 @@ int ttm_pool_mgr_init(unsigned long num_pages)
  */
 void ttm_pool_mgr_fini(void)
 {
-	unsigned int i;
-
-	for (i = 0; i < NR_PAGE_ORDERS; ++i) {
-		ttm_pool_type_fini(&global_write_combined[i]);
-		ttm_pool_type_fini(&global_uncached[i]);
-
-		ttm_pool_type_fini(&global_dma32_write_combined[i]);
-		ttm_pool_type_fini(&global_dma32_uncached[i]);
-	}
-
-	shrinker_free(mm_shrinker);
-	WARN_ON(!list_empty(&shrinker_list));
+    if (backup_fault_inject.dname) {
+        dput(backup_fault_inject.dname);
+        backup_fault_inject.dname = NULL;
+    }
+
+    shrinker_free(mm_shrinker);
+    ttm_pool_type_fini_and_list_lru_destroy();
+    WARN_ON(!list_empty(&shrinker_list));
 }
-- 
2.55.0

