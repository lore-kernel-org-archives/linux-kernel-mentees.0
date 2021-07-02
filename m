Return-Path: <SRS0=QgwC=L2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664AEC07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 23:12:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06CD361416
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 23:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06CD361416
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE51583260;
	Fri,  2 Jul 2021 23:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYofdQ2OIHZn; Fri,  2 Jul 2021 23:12:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A615E83163;
	Fri,  2 Jul 2021 23:12:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79E5CC001A;
	Fri,  2 Jul 2021 23:12:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 833B6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 23:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68B414229B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 23:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9KOQHFi4cBIj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 23:12:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4844342291
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 23:12:52 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id s13so3490120plg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Jul 2021 16:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jY+Z2YyKhtF3PNCdzDFu/6GyliQKTIVwJ/BKyrLM32U=;
 b=Ir+c3bJBWlhZgHglJGD0HMWxwrLHYSkAOAcbHoE4b3ITnO0prn0Zr64LJp0rb/idY7
 Z1Kjqq/LG+cgIa17iEyjiVPOldj+d/TMVXj0pe0beTLUQsP28SsOQRJePI9UBWlgurrQ
 xM7VXU+xVPDjNkri4DBbEKhfMdizv+cQMpn3kl2vl/myeaRxYO7H8o8DbzabOf5jE7De
 pm3QriMjKfgrdECxWMII9d6vdLDRYWewTHEKyjxFz5NLAVy5NRPjYVo0Ejcbjjrn/KI8
 5LGrQG0iPCv0BI+V5ITlKmFrwQ14lWp5aVY/ZtTr6GXihArEd4B0MmgMpCuIenkKC0v3
 VIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jY+Z2YyKhtF3PNCdzDFu/6GyliQKTIVwJ/BKyrLM32U=;
 b=HiLlm3NgrO4VzatYyKQ+h/oWUI0agG8H/q6ryUiT8BKfeCFaBHNFbwtn3vS0kuLjXm
 8mK6+mRrr8IZhxt4JFAxTYXR6xWZjaMJiDcxMU+3JFyEC5yTjvm0bNTXTxJhPDrto7of
 MbT/z+NLjE95hTPWdbioQ3BbFsroSicMV+2DiF2E5fXtdo1iu6MSSi0elFyOg48NRp+Q
 +cBNKVWmdubqih4LVDrhyDiSFtvf0Q44z9QiytQTaejFpOihNss+f+ouI1fTh3z4dQtb
 EfE6k87+z/qupf4pLmupyKkzQlFDGv0Xd30I+IN4B8F+SDsVidEMkfYj8NEnYcx5m0hS
 sh9A==
X-Gm-Message-State: AOAM532tNPjzWxvL4K9Xmnl4HNTtkbVEE4NZ0LPt7g/bw289XNcGBrqy
 Y/UxxobdZb76zl5tX1DuEYg=
X-Google-Smtp-Source: ABdhPJy0XV+iHxvy176r6zoC+htH6b1BUvuR/fZzRzC7Zgo9U72y8Q4+PIltQl7Krb+pradU6rZLNw==
X-Received: by 2002:a17:90a:66c9:: with SMTP id
 z9mr2020628pjl.122.1625267571554; 
 Fri, 02 Jul 2021 16:12:51 -0700 (PDT)
Received: from novachrono.domain.name ([122.163.170.78])
 by smtp.gmail.com with ESMTPSA id w7sm4853645pgr.10.2021.07.02.16.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 16:12:50 -0700 (PDT)
From: Rajat Asthana <rajatasthana4@gmail.com>
To: axboe@kernel.dk, hare@suse.de, ming.lei@redhat.com, damien.lemoal@wdc.com,
 jack@suse.cz, gregkh@linuxfoundation.org, rafael@kernel.org
Subject: [PATCH] block: Avoid accessing an already freed kobject in
 delete_partition
Date: Sat,  3 Jul 2021 04:42:28 +0530
Message-Id: <20210702231228.261460-1-rajatasthana4@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org,
 syzbot+7d6c5587ec9cff5be65c@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Rajat Asthana <rajatasthana4@gmail.com>
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

When several processes, which interacts with block devices, are created
and killed continuously, a case happens when the kobject freed by a
process is accessed by another process in delete_partition.

This causes a use-after-free bug and is being reported by syzbot here:
https://syzkaller.appspot.com/bug?extid=7d6c5587ec9cff5be65c

Add a condition to check if the kobject for a device exists, if it
does, then go ahead and refer the kobject, else avoid referencing it.

In this scenario, when more than one processes are interacting with the
block device, one process might have deleted the device from the system
and the other process might try to delete an already deleted device,
which will result in several null pointer dereference errors. So, check
if device has a sysfs entry before calling functions to remove it from
sysfs. We should also check if the knode belongs to any list before
calling the function to remove it from the lists.

Reported-and-tested-by: syzbot+7d6c5587ec9cff5be65c@syzkaller.appspotmail.com
Signed-off-by: Rajat Asthana <rajatasthana4@gmail.com>
---
 block/partitions/core.c |  6 +++++-
 drivers/base/core.c     | 21 ++++++++++++++-------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/block/partitions/core.c b/block/partitions/core.c
index 347c56a51d87..3fc0364c1c35 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -291,7 +291,11 @@ static void delete_partition(struct block_device *part)
 	__invalidate_device(part, true);
 
 	xa_erase(&part->bd_disk->part_tbl, part->bd_partno);
-	kobject_put(part->bd_holder_dir);
+
+	if (!part->bd_holder_dir) {
+		kobject_put(part->bd_holder_dir);
+	}
+
 	device_del(&part->bd_device);
 
 	/*
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 2a61003ea2c1..d4f43fd0d0ae 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3486,16 +3486,20 @@ void device_del(struct device *dev)
 		blocking_notifier_call_chain(&dev->bus->p->bus_notifier,
 					     BUS_NOTIFY_DEL_DEVICE, dev);
 
-	dpm_sysfs_remove(dev);
-	if (parent)
+	if (dev->kobj.sd)
+		dpm_sysfs_remove(dev);
+	if (parent && klist_node_attached(&dev->p->knode_parent))
 		klist_del(&dev->p->knode_parent);
 	if (MAJOR(dev->devt)) {
 		devtmpfs_delete_node(dev);
 		device_remove_sys_dev_entry(dev);
-		device_remove_file(dev, &dev_attr_dev);
+
+		if (dev->kobj.sd)
+			device_remove_file(dev, &dev_attr_dev);
 	}
 	if (dev->class) {
-		device_remove_class_symlinks(dev);
+		if (dev->kobj.sd)
+			device_remove_class_symlinks(dev);
 
 		mutex_lock(&dev->class->p->mutex);
 		/* notify any interfaces that the device is now gone */
@@ -3504,11 +3508,14 @@ void device_del(struct device *dev)
 			if (class_intf->remove_dev)
 				class_intf->remove_dev(dev, class_intf);
 		/* remove the device from the class list */
-		klist_del(&dev->p->knode_class);
+		if (klist_node_attached(&dev->p->knode_class))
+			klist_del(&dev->p->knode_class);
 		mutex_unlock(&dev->class->p->mutex);
 	}
-	device_remove_file(dev, &dev_attr_uevent);
-	device_remove_attrs(dev);
+	if (dev->kobj.sd) {
+		device_remove_file(dev, &dev_attr_uevent);
+		device_remove_attrs(dev);
+	}
 	bus_remove_device(dev);
 	device_pm_remove(dev);
 	driver_deferred_probe_del(dev);
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
