Return-Path: <SRS0=8Gt8=LL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A0AC2B9F4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Jun 2021 16:11:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3CAF61428
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Jun 2021 16:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3CAF61428
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65C4440149;
	Thu, 17 Jun 2021 16:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bc8rJLbilvAT; Thu, 17 Jun 2021 16:11:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7195840447;
	Thu, 17 Jun 2021 16:11:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 395A2C000D;
	Thu, 17 Jun 2021 16:11:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92661C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 16:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CA8E83E26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 16:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGJruxC2rBsL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 16:11:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E11283E0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 16:11:26 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id e1so3181815plh.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ax6cETdinXWixOBfa2JXuuJreyz/2EakPhTszPVNovE=;
 b=i2QXD0vhjVadbjwCmRdyNJqmCJfF+D+qzE+5On//JOZFpoHUgMErQ2ApsO0fvPgBrh
 WB0J16l5X7WlSWdjxiYJPOKw5I3EWB990vCX8td+8KS8DcuNK64Fufah0VfpTZB974ut
 F1zqdkpTJXa/XRMpt2nkaZ6DrDW5y2qblxKoNcQWrPpVx2TaFULd4vJd09aBovLSir80
 KqgIBeu9fB9/8aGrWyTYmiOjQn6oUAudcN17lDi9OXG2KyeqX9MkERC3sLhTEHeZRt+J
 p/JpjX4ALsoqTASC5bZvSmcETVpAm4voc7uT7gegQ6EJ+yvf6+F/vYtqbL7OfIl8UxtX
 DTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ax6cETdinXWixOBfa2JXuuJreyz/2EakPhTszPVNovE=;
 b=pdz57NonXK+k4c7VINRJ311jctEQ1Vupdzmn1SbRZWxWG6im0MPe0Dtt+GZ29ABAMC
 AyZjY7g8ROGLMG7IeCltPkHQDqKPKWkpVlw8sRZBGwdlOedmuw53d2vakiDw7ObwsdqO
 xU+jYAuhOZ7GcL1sjZxzOw79Y/cEed3NdkSigF1iTFpUCz9Qu7nTAiNpuwC4nG2NRfnR
 4pvxJtGtaej1P4c0GZrfj3mOfQn2lhl2hkCfhUbFi2UukHPO1powdIQhY9FOaz1fI2P7
 RXbrGoV0XEpMFRoNG4PYneoJw5IEleC1WTnOqEyz2dZpisylP+VSSZNLawKQ43CIuk0Z
 lDSA==
X-Gm-Message-State: AOAM531bhKL8d1OlgjoGp5cwxpMM6cPZyxB0H++jqS4ZwPEUJbUkjeMi
 wrWPanqiNhbWEZQs3GpCHMk=
X-Google-Smtp-Source: ABdhPJxA7oUNbFsGjhbNIo746b9a5E8ZEjnY31bzeD1lZjEFk7hoeAfcyTpUfGXFvil2uefPLd8A/A==
X-Received: by 2002:a17:902:be10:b029:109:7460:cc41 with SMTP id
 r16-20020a170902be10b02901097460cc41mr612469pls.4.1623946286013; 
 Thu, 17 Jun 2021 09:11:26 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id 4sm8090293pjg.30.2021.06.17.09.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 09:11:25 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: [PATCH v2] mtd: break circular locks in register_mtd_blktrans
Date: Fri, 18 Jun 2021 00:09:04 +0800
Message-Id: <20210617160904.570111-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 linux-mtd@lists.infradead.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, Christoph Hellwig <hch@lst.de>
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

Syzbot reported a circular locking dependency:
https://syzkaller.appspot.com/bug?id=7bd106c28e846d1023d4ca915718b1a0905444cb

This happens because of the following lock dependencies:

1. loop_ctl_mutex -> bdev->bd_mutex (when loop_control_ioctl calls
loop_remove, which then calls del_gendisk; this also happens in
loop_exit which eventually calls loop_remove)

2. bdev->bd_mutex -> mtd_table_mutex (when blkdev_get_by_dev calls
__blkdev_get, which then calls blktrans_open)

3. mtd_table_mutex -> major_names_lock (when register_mtd_blktrans
calls __register_blkdev)

4. major_names_lock -> loop_ctl_mutex (when blk_request_module calls
loop_probe)

Hence there's an overall dependency of:

loop_ctl_mutex   ----------> bdev->bd_mutex
      ^                            |
      |                            |
      |                            v
major_names_lock <---------  mtd_table_mutex

We can break this circular dependency by holding mtd_table_mutex only
for the required critical section in register_mtd_blktrans. This
avoids the mtd_table_mutex -> major_names_lock dependency.

Reported-and-tested-by: syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com
Co-developed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---

Changes in v1 -> v2:

Break the circular dependency in register_mtd_blktrans instead of blk_request_module, as suggested by Christoph Hellwig.

 drivers/mtd/mtd_blkdevs.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index fb8e12d590a1..7d26cfe24d05 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -528,14 +528,10 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	if (!blktrans_notifier.list.next)
 		register_mtd_user(&blktrans_notifier);
 
-
-	mutex_lock(&mtd_table_mutex);
-
 	ret = register_blkdev(tr->major, tr->name);
 	if (ret < 0) {
 		printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
 		       tr->name, tr->major, ret);
-		mutex_unlock(&mtd_table_mutex);
 		return ret;
 	}
 
@@ -545,12 +541,12 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	tr->blkshift = ffs(tr->blksize) - 1;
 
 	INIT_LIST_HEAD(&tr->devs);
-	list_add(&tr->list, &blktrans_majors);
 
+	mutex_lock(&mtd_table_mutex);
+	list_add(&tr->list, &blktrans_majors);
 	mtd_for_each_device(mtd)
 		if (mtd->type != MTD_ABSENT)
 			tr->add_mtd(tr, mtd);
-
 	mutex_unlock(&mtd_table_mutex);
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
