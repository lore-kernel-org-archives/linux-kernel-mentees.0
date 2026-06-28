Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E0E355F41
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Jun 2026 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782661272; cv=none; b=bRGDQti+ntBc7Ezi+OAnUX0XUt9Yt5dm6tps9+BGqZW65Mh99lOH+LDDY928zqiGfLr8A77khZUURY/OjLmubZeaeNLEPxTNiYcWRPItaYIqGMP9//gqNuFRLBFZKh0kh2yVHuJoOMUMLusVxUjiw2sTcVdFdUrUUTPhB3lBEP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782661272; c=relaxed/simple;
	bh=QvFemZzsQhTAE5tHNh0abPt1RWzBZZji6FWWT2yknho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jjyDEwd5xxW+vMJmmBcVruPFzlpH51XY6VYuMmaclPyq5k/zTOMHO1tYOZn6NBgsAX6tTVpBmAxUsP4RswRdZmSIv3/aghI3YQJNww84U1aBxeZQCs6qg51odTu+02P1Eaq5C+zcbckXBSx/CH9QUTa2DhOYHU2q+3TE9LWZ5Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEXK8evW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEXK8evW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so6814845e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Jun 2026 08:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782661270; x=1783266070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdP/kJNcUoKP2dTQekglHV9xkq62178db/T4WFfvdsg=;
        b=jEXK8evWrXgp5SYMdoQcWsf9gW42fwFpLegH+2pKi/VxqDt5fw/BwNei56GniBsg0U
         Ol/egwis4BuOmuGq/uom26uApwXO7plmrhxh59IDzatti82UdpbQao6V2fWFIiRFhHH3
         43loZ4iv/RenW3D3CwFpodmyE6hRXScAGKM16DpRFCrPGm8FjR60v3ijXuzFcB4qcthZ
         /SW2LnSamgdOOvvcwHp1vIydl5MvyMoqELtEIMqWjRoRTdiW/jfpcvQjqZw1fa3dYhyP
         KM4P/zWCErGG2OAjwpOIqrz9uHi6l75ToBCmU76/zH98OmWfAUgLQ5kDqKW1/fZiy00w
         /N/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782661270; x=1783266070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdP/kJNcUoKP2dTQekglHV9xkq62178db/T4WFfvdsg=;
        b=Oi7h834MSfbLFH8e5NAnF/+5gctj6nyavXQoI4TGDE+Wioy9L/N1Ou3efHqOk+7J5K
         SNDyArI9RaLbDObVd94djybPmu8jO79u7OjcaNfYSEQOGx0871bu3jwqKKs6ckY/OT5g
         v/jy79GV2mQbD/upQrMwNILFVvRB1bwpRIW2UVq98Su+5NYnSQRLsykdL+eWQF1dmVkh
         jBXlOhYYXp9V2KVyqmBpvkm9hZZqvORwD0uLl44MzgW6GdgUIVhLOQpgnEl+pRJjhw8t
         bLpDlbNR5Xwvq1xxF8JwhpeaaISBNpelmRosG4kzb4OL1UlvuPdDc1gWB4IBKfbQZWrp
         v4Pg==
X-Forwarded-Encrypted: i=1; AFNElJ8hIZgSW098o97xKg7zDMCPG8L8lUuaOFEulbyik3LljX1RwFVOi20mwW8g4y2PSJiC8zZywskCSYRSBX3KgNpx/tvVYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj0hunGaef7uMci31zy/mQiEuBES7dUR/X4ttqeNbvCy8I0ipa
	9qE6HKsQxLo5ASZR84sMFMMH24MBUy7+MImir2JCPkbF+78U4MyOQjQX
X-Gm-Gg: AfdE7cnV7roXE/wVRuQtj1XajyuCoD3Bbzj2a51Y8wiBxt6AzbEiBkX/O9dbPSdv3wM
	5BSA0Zhu8cas5c1jvmVTcpJY8f80+y/b7LhPAuH7SaK43wuGxweWhBJIGpZRkXUkCP8v4oEcJrd
	JRuFh8CvuwX7ScQ3G+oTShsNWThZxL8RyuWH89jXGp/bEYFdJ3v0rcK3pxmSfMum2gSuzcRgEDf
	SYAP+JcZD8ox7WnZdF/ryWfzn1/leo364NgIj5ffDpK+3iK2eQqoXLtdc5eqlC3PDGgD5MI/07P
	BkIwXSU00JjHaMz2WggssykEWvcIKircrpMHlTwwhGCJaYyfazSPPzslG7SL230LXBoWlGH+Rds
	vmBUMVIcsdwVyugqYur/S8Za3XVTOKtrqHbWyVJVrhsRPACAY3MsWPtpzk8tknm4jLIoNTZaNYK
	GKvvaBr2GEC7Hktm9n9LOZsUjxpxJ3H5fjOJ9cUCrhtq/ZU1Pn/3oSq4QZ9kXvMST3yWtY7kd6i
	5DL
X-Received: by 2002:a05:600c:3b89:b0:492:37a3:acda with SMTP id 5b1f17b1804b1-4925a0444c4mr347631285e9.0.1782661269651;
        Sun, 28 Jun 2026 08:41:09 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4721c88bfcasm12707909f8f.10.2026.06.28.08.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 08:41:07 -0700 (PDT)
From: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>
To: Christian Koenig <christian.koenig@amd.com>
Cc: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] Memory leak error in qxl unbind
Date: Sun, 28 Jun 2026 17:40:43 +0200
Message-ID: <20260628154051.232214-1-megia.oscar@gmail.com>
X-Mailer: git-send-email 2.54.0
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

You must apply the patch from the link "[PATCH v2] drm/qxl: fix
use-after-free to qxl_irq_handler in PCI mode" before testing.
If you don't apply this patch, you will get a UAF error when running
the script above.

Assisted-by: OpenCode:1.17.8-Big Pickle
Link: https://lore.kernel.org/virtualization/20260627105445.89827-2-megia.oscar@gmail.com/T/#u
Signed-off-by: Óscar Megía López <megia.oscar@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_device.c |  5 ++++-
 drivers/gpu/drm/ttm/ttm_pool.c   | 37 ++++++++++++++++++++++++++------
 include/drm/ttm/ttm_pool.h       |  2 ++
 3 files changed, 37 insertions(+), 7 deletions(-)

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
index 278bbe7a11ad..e0c82804a07d 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1198,6 +1198,17 @@ void ttm_pool_fini(struct ttm_pool *pool)
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
 
@@ -1386,6 +1397,7 @@ static inline u64 ttm_get_node_memory_size(int nid)
 int ttm_pool_mgr_init(unsigned long num_pages)
 {
 	unsigned int i;
+	int ret = 0;
 
 	int nid;
 	for_each_node(nid) {
@@ -1423,8 +1435,10 @@ int ttm_pool_mgr_init(unsigned long num_pages)
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
@@ -1434,6 +1448,10 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 	shrinker_register(mm_shrinker);
 
 	return 0;
+
+err_shrinker:
+	ttm_pool_type_fini_and_list_lru_destroy();
+	return ret;
 }
 
 /**
@@ -1442,17 +1460,24 @@ int ttm_pool_mgr_init(unsigned long num_pages)
  * Cleanup the global pools and unregister the MM shrinker.
  */
 void ttm_pool_mgr_fini(void)
+{
+	shrinker_free(mm_shrinker);
+	ttm_pool_type_fini_and_list_lru_destroy();
+	WARN_ON(!list_empty(&shrinker_list));
+}
+
+void ttm_pool_type_fini_and_list_lru_destroy(void)
 {
 	unsigned int i;
 
 	for (i = 0; i < NR_PAGE_ORDERS; ++i) {
 		ttm_pool_type_fini(&global_write_combined[i]);
+		list_lru_destroy(&global_write_combined[i].pages);
 		ttm_pool_type_fini(&global_uncached[i]);
-
+		list_lru_destroy(&global_uncached[i].pages);
 		ttm_pool_type_fini(&global_dma32_write_combined[i]);
+		list_lru_destroy(&global_dma32_write_combined[i].pages);
 		ttm_pool_type_fini(&global_dma32_uncached[i]);
+		list_lru_destroy(&global_dma32_uncached[i].pages);
 	}
-
-	shrinker_free(mm_shrinker);
-	WARN_ON(!list_empty(&shrinker_list));
 }
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 26ee592e1994..bda8e816a206 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -97,4 +97,6 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 int ttm_pool_mgr_init(unsigned long num_pages);
 void ttm_pool_mgr_fini(void);
 
+void ttm_pool_type_fini_and_list_lru_destroy(void);
+
 #endif
-- 
2.54.0

