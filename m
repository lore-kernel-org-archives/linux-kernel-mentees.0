Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E5B361667
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Sep 2026 10:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790505158; cv=none; b=UkL5je0p9HereyR1psb1W03nGJNmWOnRArDg9DevF016iRVvgKSDPBNQsa1G5GE3UAcAFNN4TTYB/cohSKyIRvgT7yoTqXNcRyhiJ0aavws70aIt5lpQSoHgLKVUlTQw7G9cDEmSnizuCaM3OLk0zc//wXTw+kbleetRcKGZ04I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790505158; c=relaxed/simple;
	bh=VADAQDY3LuFUiFZ861zgafnVfH1m3pFcM9dQhwGfLg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IsMqQtKil7R4IEuDiS9w4yZoSWhrRmH21MVcRO6W67R46Zl5QeYbboU9gmid1TiXxIIqw5K91xxjxGUat22GgQ+hztWlH0GbLVUPS5j5wpJRZd10b1vgWxUglSQpxR2OtzwVLhjaanIICNBVB7uIslKxS7wGU78IxWvd26fsH+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mY4x5QsU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mY4x5QsU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso3235765e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Sep 2026 03:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790505155; x=1791109955; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45tBD3kZBcNwqDCe4McFRRFSHceImT3aj0kJG1xkuLo=;
        b=mY4x5QsUiYdSq+IVGgu3V5yqrIFjxRNfBw58Lav3lmjB49z5ZsvwSg13PCRt7yezEW
         rAbDfgri8Evjql+lE+9XOesL3UoajKA48dbc19kICSP1eUy5H2edKkxT44EG4sbxz6gA
         Hsz62VMIoUitEzO2Hl5xMMdpqntj/UAI94RyRmfdzxg44wdJhs8jn7EJVacXzEEV+pfr
         led/ryVzvsrw/CNlJ6gLYeridyibN4qaUIw0K5fcdHZOOMx0Ma8zGUpO+jr8MX6HSlgG
         BqcfszNRoTnu5x2wF763Hq4mpA/BQm4DPZ3gvtSczbjhbMDNsDTJWofGB5R0Nb4ESEMw
         tn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790505155; x=1791109955;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=45tBD3kZBcNwqDCe4McFRRFSHceImT3aj0kJG1xkuLo=;
        b=YXAJksjFrwdo9UbpXuH4aHO1qS/7OiSx2X+8BQk0NZZ8qmQD1toygomravdqm+Btgm
         D1aGRiyQRP6UaxZ2pDg401wEAaF2rrCYIB88SGEkW+rRhVdj1YzWsrk6/DCpUo4Isg8v
         O94EWitlKGy+hJv+dzFufrWlMJ1pktZR9co6xPvvMVpTXpPcfbVISpAvHaSQ5pM3R+2l
         8+DGgtHEESQ4eBvKCDWeyYqg9qBBkIFi4SJNnLED8gM1dLUC9MO6wpwIhjn8S7sq2Ljo
         GHcq7T0BOKTmKwNTaorrC561R0gZQ5iN+0xkxfRmJyUFpdk04f9ddi4Uajvh3EkTocfp
         EA6A==
X-Forwarded-Encrypted: i=1; AKwUvBzbtWeBzV1FkoYBvFbLIR+0HrCWXj47clPtgPsRIjfMCNBoQYvmDuwc/4g8HS0R065eT9e94wWd5qa9BXJDHBqyfr2e2Q==@lists.linux.dev
X-Gm-Message-State: AFuF++nQ8dUzOk5ttCVIjSE1XbS5yzavUVxSBRrSO6p8WSu3dhXF2wCg
	zzSkfGuVCdSpyH8HNoH2ICpSEkM0J6fRJflSJ2me6ux8eia5KJGtAcxcZKUv6FXq
X-Gm-Gg: AYBFou1hi9trxvWUJ0r3RKQQvD8izZKNQOFwfFDjcCBixjFRp8lP3mODNq6ZR69nJyS
	Q4uRw/K64O15xW34Y4P2hccH77glPB6rLNZW+lIJx6t02N2hnFPQTIqaFeGpsH5pumTF/cdl2rA
	yTJpDm5tNqItqrHE8zMwJXvsmu8C/C7Ua/Cd43zCz2mAQQ5UrRuR1jmeGVslNN/0XW6zm5u+PDf
	3sPfRO/rgypOCM+P3lG8vwaoKoSGrWzE/TyLSyle/GpA/zOYlw2+i/BpCTRgYDY2hOsSyKJWvQb
	N504BN4bnC8gjbwZfL7fhJjx33Gp1UgXBzrDeRExVGJf2Ev/YDudbmtcYNfdNhz8EDvHjDEXq8n
	POCPpNv/Zv+66TZ/WI2y2Ysygchm31fm4HYbZ1SWzkz9XXcoreLViKKax9BQsIbE6Y0b3rvlztw
	ZVHYfzdeo/TDBpdCPQfe88h48vTc7ynn2/B0sUz6cw4a76X0Aoa+PFRuFiEFRsrAR8rvl6sJ/uf
	WKRgu6/i+lMZduOhBOso84dEo5ME/ixPLD92agwuQYyo7yk6CyFilZoTiY0cA==
X-Received: by 2002:a05:600c:a00e:b0:49e:6865:904e with SMTP id 5b1f17b1804b1-49fe66f176dmr201357565e9.12.1790505155186;
        Sun, 27 Sep 2026 03:32:35 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ffd137346sm79586805e9.1.2026.09.27.03.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:32:34 -0700 (PDT)
From: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>
To: Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>
Cc: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v6] Memory leak error in qxl unbind
Date: Sun, 27 Sep 2026 12:32:27 +0200
Message-ID: <20260927103231.47692-1-megia.oscar@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I discovered an OOM after run the script below
(I updated it and added udevadm settle to allow the cache to
recover):

i=0;\
while [ 1 -eq 1 ]; do\
    i=$((i+1)); echo 0000:00:01.0 > /sys/bus/pci/drivers/qxl/unbind;\
    if (($i%1000==0)); then\
        echo loops=$i; free;\
        grep nr_free_pages /proc/vmstat;\
        grep -E "VmallocUsed|Slab|Reclaimable|SUnreclaim" /proc/meminfo;\
        sync; echo 3 > /proc/sys/vm/drop_caches;\
        echo 1 > /proc/sys/vm/compact_memory;\
        echo "running udevadm settle;";\
        udevadm settle;\
        free;\
        grep nr_free_pages /proc/vmstat;\
        grep -E "VmallocUsed|Slab|Reclaimable|SUnreclaim" /proc/meminfo;\
        uptime;\
    fi;\
    echo 0000:00:01.0 > /sys/bus/pci/drivers/qxl/bind;\
done

ttm_pool_mgr_fini() does not destroy the list lru leaving memory leak.

Fix: Add list_lru_destroy() after ttm_pool_type_fini().

This patch depends on patch ("[PATCH v4] drm/qxl: fix use-after-free in
qxl_irq_handler on PCI"), link [1] below.

Assisted-by: OpenCode:1.17.18-Big Pickle/DeepSeek V4 Flash
Assisted-by: https://claude.ai:Sonnet 5
Assisted-by: https://gemini.google.com:3.6 Flash
Link: https://lore.kernel.org/virtualization/
20260927101026.45411-1-megia.oscar@gmail.com/ [1]
Link: https://lore.kernel.org/dri-devel/
20260731053047.24503-1-megia.oscar@gmail.com/ [2]
Cc: <stable@vger.kernel.org> # 7.1.0
Fixes: 444e2a19d7fd ("ttm/pool: port to list_lru. (v2)")
Signed-off-by: Óscar Megía López <megia.oscar@gmail.com>
---
Changes in v2:
 - Bug 1: ttm_global_init ignores ttm_pool_mgr_init() return.
   If shrinker_alloc() fails under memory pressure, ttm_pool_mgr_init
   returns -ENOMEM with pool types already initialized (64 list_lru_init
   calls done). ttm_global_init ignored this and returned 0, leaving orphaned
   pool types with a NULL mm_shrinker.

   Fix: Check ret from ttm_pool_mgr_init; if non-zero, goto out cleans up
   refcount + debugfs.

 - Bug 2: ttm_pool_mgr_init leaks pool types on shrinker_alloc failure
   If shrinker_alloc fails after all 64 pool types were list_lru_init'd,
   the function returned -ENOMEM without undoing them. With Bug 1 now
   triggering proper error handling, this undo is necessary.

   Fix: err_shrinker: label that finalizes + destroys all 64 pool types
   before returning.

Changes in v3:
 - Fix: "Unchecked list_lru_init() return value in ttm_pool_type_init()
   causes a deterministic NULL pointer dereference in the newly added
   error path."
   Now check list_lru_init return value in ttm_pool_type_init() and
   returns error if any.

 - Solved pre-existing issues reported by kernel test robot:
   - [High] `ttm_pool_type_init()` ignores the return value of
     `list_lru_init()`, leading to a NULL pointer dereference
     if allocation fails.

     Fix: get return value from list_lru_init and return error if any.

   - [High] `ttm_pool_shrink()` assumes `shrinker_list` is never empty,
     causing memory corruption and crashes during module unload
     if triggered.

     Fix: Check if shrinker_list is empty and return 0 if it is empty.

Changes in v4:
 - removed check return value in ttm_pool_mgr_init, now in new patch
   ("[PATCH] ttm: Add error handling for ttm_pool_mgr_init()")
   link [2] above.
 - Fixed check empty shrinker_list.
 - Check return value from ttm_pool_type_init.
 - Move up shrinker_alloc.
 - Deleted dput(backup_fault_inject.dname);
 - Fixed issue [High] The patch introduces a use-after-free race condition
   between `ttm_pool_type_fini()` and the active memory shrinker
   `ttm_pool_shrink()` by calling `list_lru_destroy()` prematurely as
   reported by kernel test robot.

 Fix: separate ttm_pool_type_fini and list_lru_destroy. Then, add
 ttm_pool_synchronize_shrinkers between them.

Changes in v5:
 - In ttm_pool_init() return int and check return value from
   ttm_pool_type_init and propagate error. Free pt and pg->pages
   if returns error.
 - In ttm_pool_mgr_init() free previous ttm_pool_type_init() if returns
   error.
 - In ttm_global_init() check return value from ttm_pool_mgr_init() and
   propagate.

Changes in v6:
 - Add list_lru_destroy in ttm_pool_mgr_fini to avoid memory leak.
---
 drivers/gpu/drm/ttm/ttm_pool.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 278bbe7a11ad..09fdfe45e39f 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1453,6 +1453,18 @@ void ttm_pool_mgr_fini(void)
 		ttm_pool_type_fini(&global_dma32_uncached[i]);
 	}
 
+	/* We removed the pool types from the LRU, but we need to also make sure
+	 * that no shrinker is concurrently freeing pages from the pool.
+	 */
+	ttm_pool_synchronize_shrinkers();
+
+	for (i = 0; i < NR_PAGE_ORDERS; ++i) {
+		list_lru_destroy(&global_write_combined[i].pages);
+		list_lru_destroy(&global_uncached[i].pages);
+		list_lru_destroy(&global_dma32_write_combined[i].pages);
+		list_lru_destroy(&global_dma32_uncached[i].pages);
+	}
+
 	shrinker_free(mm_shrinker);
 	WARN_ON(!list_empty(&shrinker_list));
 }
-- 
2.55.0

