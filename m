Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7DF3C9EE5
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Sep 2026 06:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749614; cv=none; b=nwqQ33fjIzARtCamBo6Z6hhm0ZQxHwFUNd6wA+4ybUXI50LsbXSTqaSFRYV8vWPOdg8GZ85pLzK/SOpyko0fk/7URJJmaWdFfkFcdmstHllErhTyCtz9soWA1nI60emwfjTdslfpX/FhnW0s2flaiJUsE1Dw/owT9XwX9fcQqbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749614; c=relaxed/simple;
	bh=F22y+hLCAnYJAYt6Xv8/W8DAmL+JuAlNySq4CKo7i/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=shOB0hbwUbC/0sWbriBMhbDI6nzgZkq5TCS8RJBnLYp2tMPbwNF0aUGyG1Pp/Zbw+QF8RPf9TTIh+xE+CTiLO/f1/Cne5kj6sqdQcaMg1Q/MiWR8Zk5ldJC1fTAvhChtr0fbkLXot6DektrY61DnELLkid+egA4tvh929RmYvAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skMvvJy0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skMvvJy0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so45982065e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 23:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790749611; x=1791354411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=StVMALYl7NrhXL0BqWH9nKh8uCpTcpQuXS9uSRoi8JE=;
        b=skMvvJy083TqpPheaHJmhmsmJ7nDx9WZ5DWpfVQFUqjSkFwThZlHT6nZyo/iRh+b/I
         PfyF0FfHKSu9MFyiv+BxD1+zucuaR/txYCNpWocSQZxKo3feZO32vyf8StV6/1Yzoixr
         CqpTCsUmLcv4HtKPsSxvS/T4QdwQBcDkZ9N/vcyFXTu/cTLktJvNqqwZEctyEF/6u7bD
         ujgG6JDC0FLOIYyaSt3rKWjOK1yp54gWHrk0uF5OflVpR5mTFgQLXiL/0FqCVYgPzopa
         VxanqV1FmD7NFfVpMRe0gMRYv/wyYUb5M2j/rsB2lTLxZQ+wPoo3dWFJgriMZLj7b9O0
         YT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749611; x=1791354411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StVMALYl7NrhXL0BqWH9nKh8uCpTcpQuXS9uSRoi8JE=;
        b=x8muUikBrDqqrI28MvrdOBJmk6TAyXLi8Lud9/LK7xaPpxG93UMX/sJVw+LLxFWeVT
         JAgjZMSvllO5N6BFCVHrlmTa2B8sys8b9+sbMRIRuiLS61l4t8GLlrRUc+FDDzwhWqNE
         VhemovGNZSw7RHPtFL7flxx3X6IHkK4J9iP3ufZDSl7yMcrnnJ/8CQP1J+aulP380IKf
         d7ceQNcxeWtbmHVa2tTZXYfkG+PhtebVGY0ORbRha3XeZA3ONQskogPCgTvj3mQ7f+AT
         hXmzJx/QVssdfv9bzinj5+c4+tHzXTL6nlY9zCXa8vpeqB9OLhPgQWRpwZR9DY+vvXAB
         xUWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxl/u3TifbSYVPHNz/Tpd14EHlygbVKRd76YLjsiKANCctpNJlavU74QpML1pDf056ZIkwoTBelq0ij9nr2AADphn8NDQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nFxWN8Ol0DwWVIZgVMC2NwiN02s32Hlu4AU6tMUrKRr5mK0NFU
	9In9rY+rKbCKgOgkvifgp5aYvM0yv3xYzRNpqCGWTDg0uHYxvIRz2YHa
X-Gm-Gg: AYBFou3SZ8Z+L02daeWaXfLXqvboBHlnAyyN8rk6GAG6mw9UPGDJf8xyhBU7IQMxnGa
	47bsmUhN0iCU9LmJ+unBAIGU4Gw/c2qiTjh2iPvHUAEW3ZLVKQQVpQkGgjjbnl+VfHJrt+HXOoq
	Eeje2Qf1RodybePxx77yCIhz6M3A0WbFFbJYn+kgGkd07FkLcgzVEwzRWG/JZFytz79EUSbaCVs
	I/zKKofhYC6pco34Z4lWqZjfX41xPNp84vBOEvJ982qnH+vw5zcAGCtXT53aNZ40H49s4u1VLMo
	/tvjyk5i/u8RW0ilToKseESDEeNANXpLbTvetBIjP+NhBV2dO2Tf29md3qSpjDFbq5Hmh4m8Dmw
	s0WlZawQS3cryCy+Ovty4jFq126nwHdPNHoZRLK9YJtDQKV2WaJ+YMFrr6AGt2T4uG3ZwXmBQ5n
	3jY4Mzt0zck9E9AyWMmWmvj9Hsp8zuK1hcdTqU2EWJ/12FYF0sTjYuQatAR5KLBWt5q1bR0/xPt
	bAtvHdoMx8xpFh4dKI6z4/XazqGMZ8FF1sCIoV/yU0RcC8ZeaC2O4v1N1+DqgaK204=
X-Received: by 2002:a05:600d:4448:10b0:49f:fd4c:cccd with SMTP id 5b1f17b1804b1-4a01b11e83bmr2983255e9.28.1790749610287;
        Tue, 29 Sep 2026 23:26:50 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e79e4sm6866825e9.2.2026.09.29.23.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:26:49 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Damien Le Moal <dlemoal@kernel.org>,
	Yao Sang <sangyao@kylinos.cn>
Cc: Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	linux-kernel@vger.kernel.org,
	syzbot+b0910be96b7c31314822@syzkaller.appspotmail.com,
	syzbot+2e02ccadb3c5522a5c59@syzkaller.appspotmail.com,
	linux-nvme@lists.infradead.org
Subject: [PATCH] nvme-multipath: revalidate head zones after unfreezing the head queue
Date: Wed, 30 Sep 2026 07:26:47 +0100
Message-Id: <20260930062648.73871-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a namespace on a multipath controller is updated,
nvme_update_ns_info() freezes the head disk queue, commits the new
limits, and then calls nvme_mpath_revalidate_zones() before it
unfreezes the queue again.

That is the wrong way round for blk_revalidate_disk_zones(). It starts
a limits update, which takes q->limits_lock, and it freezes the queue
itself while updating the zone resources. The block layer takes
limits_lock before freezing the queue, never the other way around, so
calling it with the head queue already frozen reverses that order.

syzbot has hit this twice. One report goes through q->limits_lock. The
other one is on linux-next, where blk_revalidate_disk_zones() also
takes disk->zone_revalidate_mutex and holds it across alloc_workqueue()
the first time a disk's zone resources are set up. Lockdep then sees:

  q_usage_counter(io) (frozen head queue, nvme_update_ns_info())
  --> &disk->zone_revalidate_mutex
  --> wq_pool_mutex --> fs_reclaim --> q_usage_counter(io)

  WARNING: possible circular locking dependency detected
  kworker/u8:10/3352 is trying to acquire lock:
  (&disk->zone_revalidate_mutex){+.+.}-{4:4}, at: blk_revalidate_disk_zones+0x1c5/0x1650
  but task is already holding lock:
  (&q->q_usage_counter(io)#75){++++}-{0:0}, at: nvme_update_ns_info+0x3ac/0x1200
  ...
   blk_revalidate_disk_zones+0x1c5/0x1650 block/blk-zoned.c:2560
   nvme_mpath_revalidate_zones+0x106/0x1c0 drivers/nvme/host/multipath.c:301
   nvme_update_ns_info+0x984/0x1200 drivers/nvme/host/core.c:2620

The rest of the driver already does this correctly:
nvme_update_ns_info_block() unfreezes ns->disk->queue before calling
blk_revalidate_disk_zones(), and nvme_mpath_set_live() revalidates the
head zones without freezing the queue. Do the same here, and only
revalidate the head zones once the queue is unfrozen and the limits
update has succeeded.

Fixes: 224041412693 ("nvme-multipath: revalidate zones for namespace heads")
Reported-by: syzbot+b0910be96b7c31314822@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b0910be96b7c31314822
Reported-by: syzbot+2e02ccadb3c5522a5c59@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2e02ccadb3c5522a5c59
Link: https://lore.kernel.org/all/2bfc96f2-7d0d-47e0-936e-8810abb31a9f@acm.org/
Cc: Shuah Khan <shuah@kernel.org>
Cc: Brigham Campbell <me@brighamcampbell.com>
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 drivers/nvme/host/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index ee7d09030c18..5d7dfd7a63d4 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2617,10 +2617,19 @@ static int nvme_update_ns_info(struct nvme_ns *ns, struct nvme_ns_info *info)
 		set_capacity_and_notify(ns->head->disk, get_capacity(ns->disk));
 		set_disk_ro(ns->head->disk, nvme_ns_is_readonly(ns, info));
 		nvme_mpath_revalidate_paths(ns->head);
-		ret = nvme_mpath_revalidate_zones(ns->head);
 
 unfreeze_head_queue:
 		blk_mq_unfreeze_queue(ns->head->disk->queue, memflags);
+
+		/*
+		 * Wait until the head queue is unfrozen before revalidating
+		 * its zones. blk_revalidate_disk_zones() takes the queue limits
+		 * lock and then freezes the queue on its own, so it must not be
+		 * called with the queue already frozen. This is also what
+		 * nvme_update_ns_info_block() does for ns->disk.
+		 */
+		if (!ret)
+			ret = nvme_mpath_revalidate_zones(ns->head);
 	}
 
 	return ret;

base-commit: 4a5e49ba0abb8b4328d6318c9aef0c0121f95507
-- 
2.34.1

