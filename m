Return-Path: <SRS0=oh/h=CM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789ACC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Sep 2020 06:56:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47E0A2071B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Sep 2020 06:56:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUtoHt8/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47E0A2071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0D0DC87356;
	Thu,  3 Sep 2020 06:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6l84Z59DfJhG; Thu,  3 Sep 2020 06:56:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 716798731F;
	Thu,  3 Sep 2020 06:56:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54602C07FF;
	Thu,  3 Sep 2020 06:56:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A222CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Sep 2020 06:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8FC712041E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Sep 2020 06:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cFMzD333tPVs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Sep 2020 06:56:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 419CE20400
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Sep 2020 06:56:08 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 5so1349415pgl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Sep 2020 23:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BazpodqJMZjq/eA7w6VjwOg3Rb3D/eai25A9EwRjKAA=;
 b=RUtoHt8/HuakKOk2y6NI2NmVOS0rjT4SDK3/UaSe6mBmZ2WSNiCSgppYYyauBfOtHp
 /rdy94+tG9N3pzZZgrK9B7Ae4S/G+9EC5Xaieit4DjXYXgIpKVDwWG+i4izuEFvoNpcA
 bEktwfuyUYhB+l7tsyCl4uG8ETTpJrrQUNdhkAOzQRuBxJ5Rgb00u6cY3p94hEv1FnzE
 HsMk05hvNIr2fprZTCupcmVHlt9WBXqVKGY/KjNEAMdORpDQwfMW6PTS9UI9gwc6d9cy
 KV9I/KhfGAXhO6lslnCurtvNtLUBaD+MqUmeZt9+PH8qr50SDe7GnGQ/roG8viILQ9T2
 OM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BazpodqJMZjq/eA7w6VjwOg3Rb3D/eai25A9EwRjKAA=;
 b=RYuQnXKZAvECLFYEgcxapP1opmu+387KBaR5qlCTHq/SvOLIoV6BgdWRSxUXSLMKNy
 zw5ha17gGM9YcZtMJR/cAc18TFUYctPUiEFrVWRXcO0vz7aR4Q/1vtZDs8/7FuHhQMog
 J/Q9z9F0iU9i9fux9no6yB8oTU13A9bn83ijJuOCp46kWAx8FEM5DNEp4V2LdzNX1QSO
 vyD+U/HIQDiKQOynT9HYjSjLGhYdX/2o0DlwAWhAuVuMltbMI8soOYTqDRfDOozmxFPs
 zJUsxCt8mIkgt68tbhZVT5llYIRQH9aubmdJoDPCFOtPTXYRYKCJr1c5lyiYtKEohmu5
 kA0g==
X-Gm-Message-State: AOAM5314q7a6tg3D2FJPMShCMQkAreKaJov9ezQ8iUl2ETBrlzjO6+Hl
 wNsmkPyacltMlvh+JDBGVg==
X-Google-Smtp-Source: ABdhPJwplfAe7Ql+adziTtMZVSHuhYR4WRwzSItQaBNYaPg/b7Sjqa2WrSjMOt7icwjmsUkLEvBGqQ==
X-Received: by 2002:a65:690f:: with SMTP id s15mr1758695pgq.124.1599116167775; 
 Wed, 02 Sep 2020 23:56:07 -0700 (PDT)
Received: from localhost.localdomain ([161.117.80.159])
 by smtp.gmail.com with ESMTPSA id x3sm1820456pfo.95.2020.09.02.23.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 23:56:07 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Sep 2020 02:55:34 -0400
Message-Id: <20200903065534.623691-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <000000000000520ffc05ae2f4fee@google.com>
References: <000000000000520ffc05ae2f4fee@google.com>
MIME-Version: 1.0
Cc: Hillf Danton <hdanton@sina.com>, Jan Kara <jack@suse.cz>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Peilin Ye <yepeilin.cs@gmail.com>,
 Konstantin Khlebnikov <koct9i@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] block: Fix use-after-free in
	bdev_del_partition()
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

In bdev_del_partition(), `part` is being looked up outside the critical
section. This is causing bdev_del_partition() to delete the same partition
more than once. Fix it by reverting commit cddae808aeb7.

Fixes: cddae808aeb7 ("block: pass a hd_struct to delete_partition")
Reported-and-tested-by: syzbot+6448f3c229bc52b82f69@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Cc: Hillf Danton <hdanton@sina.com>
Link: https://syzkaller.appspot.com/bug?id=09fc5ec437ea150f28e8a19f5011c08ee73381af
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 block/blk.h             |  2 +-
 block/genhd.c           |  2 +-
 block/partitions/core.c | 22 ++++++++++++++--------
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/block/blk.h b/block/blk.h
index 49e2928a1632..f5a46d0020fb 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -350,7 +350,7 @@ char *disk_name(struct gendisk *hd, int partno, char *buf);
 #define ADDPART_FLAG_NONE	0
 #define ADDPART_FLAG_RAID	1
 #define ADDPART_FLAG_WHOLEDISK	2
-void delete_partition(struct gendisk *disk, struct hd_struct *part);
+void delete_partition(struct gendisk *disk, int partno);
 int bdev_add_partition(struct block_device *bdev, int partno,
 		sector_t start, sector_t length);
 int bdev_del_partition(struct block_device *bdev, int partno);
diff --git a/block/genhd.c b/block/genhd.c
index 99c64641c314..40abc70b92ab 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -913,7 +913,7 @@ void del_gendisk(struct gendisk *disk)
 			     DISK_PITER_INCL_EMPTY | DISK_PITER_REVERSE);
 	while ((part = disk_part_iter_next(&piter))) {
 		invalidate_partition(disk, part->partno);
-		delete_partition(disk, part);
+		delete_partition(disk, part->partno);
 	}
 	disk_part_iter_exit(&piter);
 
diff --git a/block/partitions/core.c b/block/partitions/core.c
index e62a98a8eeb7..1fe1fe593423 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -310,17 +310,25 @@ int hd_ref_init(struct hd_struct *part)
  * Must be called either with bd_mutex held, before a disk can be opened or
  * after all disk users are gone.
  */
-void delete_partition(struct gendisk *disk, struct hd_struct *part)
+void delete_partition(struct gendisk *disk, int partno)
 {
 	struct disk_part_tbl *ptbl =
 		rcu_dereference_protected(disk->part_tbl, 1);
+	struct hd_struct *part;
+
+	if (partno >= ptbl->len)
+		return;
+
+	part = rcu_dereference_protected(ptbl->part[partno], 1);
+	if (!part)
+		return;
 
 	/*
 	 * ->part_tbl is referenced in this part's release handler, so
 	 *  we have to hold the disk device
 	 */
 	get_device(disk_to_dev(part_to_disk(part)));
-	rcu_assign_pointer(ptbl->part[part->partno], NULL);
+	rcu_assign_pointer(ptbl->part[partno], NULL);
 	kobject_put(part->holder_dir);
 	device_del(part_to_dev(part));
 
@@ -531,10 +539,10 @@ int bdev_del_partition(struct block_device *bdev, int partno)
 	if (!part)
 		return -ENXIO;
 
-	ret = -ENOMEM;
 	bdevp = bdget(part_devt(part));
+	disk_put_part(part);
 	if (!bdevp)
-		goto out_put_part;
+		return -ENOMEM;
 
 	mutex_lock(&bdevp->bd_mutex);
 
@@ -546,15 +554,13 @@ int bdev_del_partition(struct block_device *bdev, int partno)
 	invalidate_bdev(bdevp);
 
 	mutex_lock_nested(&bdev->bd_mutex, 1);
-	delete_partition(bdev->bd_disk, part);
+	delete_partition(bdev->bd_disk, partno);
 	mutex_unlock(&bdev->bd_mutex);
 
 	ret = 0;
 out_unlock:
 	mutex_unlock(&bdevp->bd_mutex);
 	bdput(bdevp);
-out_put_part:
-	disk_put_part(part);
 	return ret;
 }
 
@@ -627,7 +633,7 @@ int blk_drop_partitions(struct block_device *bdev)
 
 	disk_part_iter_init(&piter, bdev->bd_disk, DISK_PITER_INCL_EMPTY);
 	while ((part = disk_part_iter_next(&piter)))
-		delete_partition(bdev->bd_disk, part);
+		delete_partition(bdev->bd_disk, part->partno);
 	disk_part_iter_exit(&piter);
 
 	return 0;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
