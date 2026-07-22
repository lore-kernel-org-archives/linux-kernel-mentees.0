Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88A64D2EC6
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 22 Jul 2026 11:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784720036; cv=none; b=CVNK3gXP2mOoBX3c/kjCKIPIPHm3h1XQRkqmL/Yeq5MOsODXYAYTJI0xOxE3ujIM1mSJxm122Cs7b92humeshWA9vUNvUt64RdeUG9worbj46XCaR+ozA3RRUjmD0O+0n+PFqL+/wdqOgN9P9L89KCeu8ShzeP2SuLarqCe3jrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784720036; c=relaxed/simple;
	bh=fdoT408pXeHyekonjoqrqHOqGsBjQl2gf0u8gJMxTvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sl4UtZaBD+CvPzwwIKaD3ebFT/PrYgHVcX+czLsbBW96LW4MJ8ya8Q6/mx86KFubNDdkErWd8h0qmMZlNW/X6K+Erp+5w/NWzRFzNPLY+up2e8F73GpaGgnz5xMwGZdtjl7MniyGHOLJnwBr90z6XE0UzCArAg/AO64z8mRXTT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cB6eM9Ef; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cB6eM9Ef"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so7317899b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 22 Jul 2026 04:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784720035; x=1785324835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LUhTDedR70ZXXTiOjTiOLU7QAjd8TnaNf50qKPQfc+o=;
        b=cB6eM9Efd9nnclO6x5zEH6vgF7Qjh3rQmAcqvJCVxJw9wFdqEcZGb4yeTMVpGLzmfi
         i/HIqM7fIVFD/7i2kGZwjevqsCS+iBNnsJRH3LVmx0uwEQoi74vgNMMqbk7nIQhznmUz
         8HGs++M6W9YR9X6i9AldwUNse2fKrf3Wn0Tq77d3Y9tAaPmSdCsfbQUDP/bArH23d8Xi
         TbLmXGyxIdFu7UB5Wk+9DTgjzqmW1dQPcjL0ycDT5frZbteE4Qz3cM97lotk78dS6wxr
         j9xri0aBx52vRLAx5dRJUNkwL1Xa8LT5GAys+OWcEaskh3LJCLdqKsVkbEw1c9/7k/6f
         r6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784720035; x=1785324835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LUhTDedR70ZXXTiOjTiOLU7QAjd8TnaNf50qKPQfc+o=;
        b=F1paZ/pyckVC4gajfPjoAttRM190WPEfMyvak8qNEuT+c6BRe949VOgzDOLfSbf3He
         u/nVm2XkfPuaL81acFjq4cSD9DUWWqlq+wqd++jnHpPthbjkP/+zxmDo0mz48AYPma+F
         TMEusVrc43nmr9RZ7hYCxcplPre8it8KSM9Aze1pHG3Kblb1TISZ6ITn7Af+VBi6kfnz
         gmxVff1j+hrRR44eYYX3OXD14U5EUYCzpOaCSIzynpOa1Ii4XEhUx2+CRfBT7+5F37vg
         WM/AUNSyJRcvxpdQyDy8PFuT7f4Lp/mUOnQoKzt23sttwnd/P0DavJ3xN7QRt0/gX89j
         xG2g==
X-Forwarded-Encrypted: i=1; AHgh+RrPdapgo2z1m52EY5Jo02ZAEg/sO90aKcr6rsWN0TR3f8j9qQj6BiQm+THEZtihFLxyNiMbxmMszARtYqsOcQWrbkxKVg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5Y1tpZ4H01V4m+CdECAwDYb5AbDZR2LkAK/EQLNr9D+suxQV7
	6u+P4VJsDiA22bjBwVu0idnzPP3mTob5jf2JSHzu0v9z3LHQTIoElbbu
X-Gm-Gg: AR+sD125RphzU7uj8X78BfFNiqFAyCM4+1+jmeiWZ2bIIwUpfjQfRA73Nz4/nye0Tmv
	mveSP2tf5HlmfZHaNAWL8h+Atru1XKvNL40dSUSZNjWV6JHLWEMGfpuSYl6DBfzYwF0IwG1UcZy
	WXKVTp8bbjexAf5zfegtfRf6PVwW/JubzTaIjF/zL80WpMbPUNVSSbVUOaF1coJsdoxAyDhPsph
	2e+N3TGBeDh8h7zrB4neySPQABrbPd68+JLB0Rj9+TlyM8pxaS/VoheJWCmSsegRi0v96+/qVM0
	D5fGvkKK0Uixn7MlLVWNG1iLCZZJlo6JeZKgDx94EfjTov2XtnvoFXL9YmYPkcBv2GdFIMUkuf3
	RbPciGwiip2ixyMFUh8omXkv7DdwppruBNYdZWR0o3ZMuKxKeODTlVWYJ5L7kbKRTDrEXWNaJ0I
	5wF/JpOazV/pNlS7IPLA==
X-Received: by 2002:a05:6a00:986:b0:848:7071:9863 with SMTP id d2e1a72fcca58-84c29532099mr22204146b3a.53.1784720034864;
        Wed, 22 Jul 2026 04:33:54 -0700 (PDT)
Received: from apt.tailc82bd0.ts.net ([140.123.97.23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1c376esm980979a12.29.2026.07.22.04.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:33:54 -0700 (PDT)
From: Cheng-Han Wu <hank20010209@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Cheng-Han Wu <hank20010209@gmail.com>
Subject: [PATCH 1/2] mm/damon/core: remove unused damon_targets_empty()
Date: Wed, 22 Jul 2026 19:33:37 +0800
Message-ID: <20260722113338.302603-2-hank20010209@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260722113338.302603-1-hank20010209@gmail.com>
References: <20260722113338.302603-1-hank20010209@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_targets_empty() has had no in-tree users since commit
5ec4333b1967 ("mm/damon: remove DAMON debugfs interface") removed
its last caller.

Remove the unused declaration and definition.

Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
---
 include/linux/damon.h | 1 -
 mm/damon/core.c       | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 0c8b7ddef9ab..8e5589ccf50f 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -1054,7 +1054,6 @@ int damos_commit_quota_goals(struct damos_quota *dst, struct damos_quota *src);
 
 struct damon_target *damon_new_target(void);
 void damon_add_target(struct damon_ctx *ctx, struct damon_target *t);
-bool damon_targets_empty(struct damon_ctx *ctx);
 void damon_free_target(struct damon_target *t);
 void damon_destroy_target(struct damon_target *t, struct damon_ctx *ctx);
 unsigned int damon_nr_regions(struct damon_target *t);
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 644daf5a1656..da97b2dc39d1 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -795,11 +795,6 @@ void damon_add_target(struct damon_ctx *ctx, struct damon_target *t)
 	list_add_tail(&t->list, &ctx->adaptive_targets);
 }
 
-bool damon_targets_empty(struct damon_ctx *ctx)
-{
-	return list_empty(&ctx->adaptive_targets);
-}
-
 static void damon_del_target(struct damon_target *t)
 {
 	list_del(&t->list);
-- 
2.52.0

