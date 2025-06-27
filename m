Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEFC2AD2D
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Jun 2025 03:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750996407; cv=none; b=gLGkYM7TcVvCUe1qp5jPc4Aym6W1DNKmafraW6z771ubhs0yJrXFKgS7hhsq39+H+vTJX9dUOS8vu9PXZ1xr8d1mEX0sVNelL+pN8Gqyoe0aJgOY/SGLWLsCxY1aGCkr7zzzlsyByb5E0+UlXo93FDd+kViwegfLfOuMWHAb85w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750996407; c=relaxed/simple;
	bh=Gk7kFiL+rrU52+4FUyQNDVBOPxsbEg3rY7ghxnKefLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k+7nDTUVTDQqD379Tvrh6E73kVS3bO8BQRdeOH+697w059UttyUyiPJz+AJu61LM5fO32JLe7D41MUojPgoXb4yRcD/I6LGF7HasRlqf9t6INzto3bG3ax1aRxztl5C4Z8EoRgiPymsB5UBNCoczVgZiqd7e3BB1GMB4C7blwSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjS0Z0sP; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjS0Z0sP"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7490702fc7cso1205703b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 20:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750996405; x=1751601205; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K87WAvZZg6aBFOTATYCqslzfrGhe3K40+/UhVUBzSYs=;
        b=LjS0Z0sPN72GxLb+3ErODSIXHnGZC1Ouf39QSokniNkQ16GFM9AAOP5qs8sX0n7XrH
         uNgcy5MdB5KL0DoD7V2n+3cJTLnxpHriEEP3tJO5vAOkcFsK7OxzfjHjVygQ55ts/T+5
         0wIeYWB304GYs2Uz84QNtsTJSlFdqq9vy/w9M2oWCrG9+IgX8FfxbaztCFYwVUbYbTA8
         yfv6kb0C9eUdJlqTWO6Mg0liB+nBxseIWzIv79u+EAW83nJ47ehzglJTwwY2w5xZ5P+V
         xCEfNLVt066Uzb3bh4wb7aXpPggZIepmpv6tYquBjiKt4M792YHxNN0jEwsQOnT2XJi9
         zUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750996405; x=1751601205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K87WAvZZg6aBFOTATYCqslzfrGhe3K40+/UhVUBzSYs=;
        b=OPc/ZxInAECI0/VWjwRME+exFqjkDnSOQdJtTwjLfbDit0lIexh4jbrlM/U6wHDtPR
         eB9w7q5dwgp2EBRSd3KoWZQxzSctAv4vpTmiPEJUh5UzSdXdeJ4nQYcCbMjhOovn3xC/
         KrHuw0uxNnQ0/23ELu54n/9w0oo4+L1CeUf1u2/zmD9unAHg7xieDcaVbFbkgyc+I0TK
         eZlw2rIeZ+b3ECSWRm9061ornQAEtcoEbts5uPSeZm4upmXgkAK5MbmHFgYtRN25KVfv
         +N7eWm/qpYCW2UuhQGAYdgaZLFUGsJUW4qzi1rmoDDMZS+SDCVbD+CfgmTixaKVgiRev
         i6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxzVZ32WsC8iICfio6RHo7OLWMyTgQC0M37/I2bDT3V0J3ST4R0WBOwHJ1e8/9zY+1y378l/jsBN4nDMYAgpXjE5YG9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlDs6ribFa4/sgHnb6SgffEA0F7s8KO0wGZjl+SgLLWBBzZA1L
	BHHVqUnG9N3S4WljbcMKnSnYCZ/Z0YA/kfOibnZcdwL+U+mwpucW73Xs
X-Gm-Gg: ASbGnctzxVV5RPDcrQcotvnof4qvnoWFtFASIFb5e5zrRV9xuX3GchPg5lMBIjcGJ3K
	83D3yRJr8dd6NHxuhIPBXZZLlzLUsy22/5tFs7yCpFmn4Fp6ZgnFDLI8CuHcfSHBKjPW8Qb/Ek7
	ZAhROra83GAj5MuX929Rwrggw5jQ+73xopRmRI3MxzoAuqNfdWkyHwNci5+8iLqSE052F3XuKME
	jfOHloxBjLa4TkBTb2IrAf4knBzetAJ9QDn0FMqntmk1kr8AwLl2tdIjdjgjGCmjcOlXt7f9hCI
	IW6iTZAe+AOVy9fHZVB6B0FgQJRrSa+XxnoHcXs/EOFDPGub+L6c7rNwbiGDZ8YZptXhHgHyTtV
	Z
X-Google-Smtp-Source: AGHT+IF7R5hjRTDRDCQN9AaGEHThNKiPKHDQS9ya7XZS3RcjsRj8yG10vQFi6xfY9LoKiuNBh6EX2w==
X-Received: by 2002:aa7:88c9:0:b0:736:33fd:f57d with SMTP id d2e1a72fcca58-74af6f7e449mr2262434b3a.17.1750996404849;
        Thu, 26 Jun 2025 20:53:24 -0700 (PDT)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557b3bcsm1110713b3a.101.2025.06.26.20.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 20:53:24 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: minchan@kernel.org,
	senozhatsky@chromium.org,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com
Subject: [PATCH] block: zram: replace scnprintf() with sysfs_emit() in *_show() functions
Date: Fri, 27 Jun 2025 09:22:56 +0530
Message-ID: <20250627035256.1120740-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace scnprintf() with sysfs_emit() or sysfs_emit_at() in sysfs
*_show() functions in zram_drv.c to follow the kernel's guidelines
from Documentation/filesystems/sysfs.rst.

This improves consistency, safety, and makes the code easier to
maintain and update in the future.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/block/zram/zram_drv.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index fda7d8624889..a1f2f45d4b99 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -373,7 +373,7 @@ static ssize_t initstate_show(struct device *dev,
 	val = init_done(zram);
 	up_read(&zram->init_lock);
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n", val);
+	return sysfs_emit(buf, "%u\n", val);
 }
 
 static ssize_t disksize_show(struct device *dev,
@@ -381,7 +381,7 @@ static ssize_t disksize_show(struct device *dev,
 {
 	struct zram *zram = dev_to_zram(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%llu\n", zram->disksize);
+	return sysfs_emit(buf, "%llu\n", zram->disksize);
 }
 
 static ssize_t mem_limit_store(struct device *dev,
@@ -532,7 +532,7 @@ static ssize_t writeback_limit_enable_show(struct device *dev,
 	spin_unlock(&zram->wb_limit_lock);
 	up_read(&zram->init_lock);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t writeback_limit_store(struct device *dev,
@@ -567,7 +567,7 @@ static ssize_t writeback_limit_show(struct device *dev,
 	spin_unlock(&zram->wb_limit_lock);
 	up_read(&zram->init_lock);
 
-	return scnprintf(buf, PAGE_SIZE, "%llu\n", val);
+	return sysfs_emit(buf, "%llu\n", val);
 }
 
 static void reset_bdev(struct zram *zram)
@@ -1292,7 +1292,7 @@ static ssize_t recomp_algorithm_show(struct device *dev,
 		if (!zram->comp_algs[prio])
 			continue;
 
-		sz += scnprintf(buf + sz, PAGE_SIZE - sz - 2, "#%d: ", prio);
+		sz += sysfs_emit_at(buf, sz, "#%d: ", prio);
 		sz += __comp_algorithm_show(zram, prio, buf + sz);
 	}
 
@@ -1365,7 +1365,7 @@ static ssize_t io_stat_show(struct device *dev,
 	ssize_t ret;
 
 	down_read(&zram->init_lock);
-	ret = scnprintf(buf, PAGE_SIZE,
+	ret = sysfs_emit(buf,
 			"%8llu %8llu 0 %8llu\n",
 			(u64)atomic64_read(&zram->stats.failed_reads),
 			(u64)atomic64_read(&zram->stats.failed_writes),
@@ -1395,7 +1395,7 @@ static ssize_t mm_stat_show(struct device *dev,
 	orig_size = atomic64_read(&zram->stats.pages_stored);
 	max_used = atomic_long_read(&zram->stats.max_used_pages);
 
-	ret = scnprintf(buf, PAGE_SIZE,
+	ret = sysfs_emit(buf,
 			"%8llu %8llu %8llu %8lu %8ld %8llu %8lu %8llu %8llu\n",
 			orig_size << PAGE_SHIFT,
 			(u64)atomic64_read(&zram->stats.compr_data_size),
@@ -1420,8 +1420,8 @@ static ssize_t bd_stat_show(struct device *dev,
 	ssize_t ret;
 
 	down_read(&zram->init_lock);
-	ret = scnprintf(buf, PAGE_SIZE,
-		"%8llu %8llu %8llu\n",
+	ret = sysfs_emit(buf,
+			"%8llu %8llu %8llu\n",
 			FOUR_K((u64)atomic64_read(&zram->stats.bd_count)),
 			FOUR_K((u64)atomic64_read(&zram->stats.bd_reads)),
 			FOUR_K((u64)atomic64_read(&zram->stats.bd_writes)));
@@ -1439,7 +1439,7 @@ static ssize_t debug_stat_show(struct device *dev,
 	ssize_t ret;
 
 	down_read(&zram->init_lock);
-	ret = scnprintf(buf, PAGE_SIZE,
+	ret = sysfs_emit(buf,
 			"version: %d\n0 %8llu\n",
 			version,
 			(u64)atomic64_read(&zram->stats.miss_free));
@@ -2682,7 +2682,7 @@ static ssize_t hot_add_show(const struct class *class,
 
 	if (ret < 0)
 		return ret;
-	return scnprintf(buf, PAGE_SIZE, "%d\n", ret);
+	return sysfs_emit(buf, "%d\n", ret);
 }
 /* This attribute must be set to 0400, so CLASS_ATTR_RO() can not be used */
 static struct class_attribute class_attr_hot_add =
-- 
2.43.0

