Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA349C636C9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 10:09:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BFF16115A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 10:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BFF16115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BD1940118;
	Sat, 17 Jul 2021 10:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Qg11nJmuHjW; Sat, 17 Jul 2021 10:09:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5AAE240111;
	Sat, 17 Jul 2021 10:09:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21D5EC001A;
	Sat, 17 Jul 2021 10:09:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5D3DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 10:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB49D423A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 10:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V1e_CJt4R1Tw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 10:09:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29C4E42388
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 10:09:29 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id y3so2216201plp.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 03:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=83GbSGpZBfJHGXq15Yg2ngQ7/7/5XwVRHY0b6SDhljI=;
 b=uyXB+/16nvqrz8OL63K/aowqr/Mq1BwOMmDr72vNEAEScOUTTnm6SSGvF+7rT2Dgcc
 KAaxegtG0c2E5MqZqFgrQi7mXbG5gTKdIXV1ewE+kqwHm3m/31T6RjUeyzLSEfrgQGe5
 oU2E1Ke4aSeZ7P9uNVPxWhRRkcmgVn5AOjrOhRcbVyzcHmjyuipoRoWPK2E2yeYBVvJ/
 etVdo8RG4HSWZRau145JybWep6I7xLI1pw+NdAK3m+Wtt6J7Rp4CkKv9NC05XatnC9Xx
 h9x+XMC3KoTFBdcQQJmkO8uX/FzxE6AUsCeCST/DmMtSIFch2SlP5QpbALz0/ExX+yo7
 feOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=83GbSGpZBfJHGXq15Yg2ngQ7/7/5XwVRHY0b6SDhljI=;
 b=KlqVvH3KgAqr/p9V4Yf7A/UL6tJ1KzyHUGQgysxJFs6iiQsJwf7qrpIKHQ69/Han/O
 QHCw0fZ0tLOcgnW1mZ2FU9T75inY8wDfiixSWVWNUT25dzRYz3sbGDJyiMgIWGm9UQf6
 /2p1P9W7Ob/1pTKQMrzulzr2iZlvPuxk4UpRjAtDXxpizDAN+z23wPK/8c6FmWHFRplu
 pW3goQ2Q5/xhBaKXphvwJQzr4yDwGJhasyLScUZF/nsFKvu6JIHV76v/6k/LsEO+XO8K
 xn6MZRKOERj2stzA0NNRcaI0FnneyeUMoEC6jQA51fJn13bx7jIooLRil1zglE1Bonov
 lNYg==
X-Gm-Message-State: AOAM530Hv4szk96P+0HHHz1B9NfW/i/5b9s6aPw7TIe1Tqaiys1e0vIk
 h26TQNmMzSN9h1WgauDVoUE=
X-Google-Smtp-Source: ABdhPJzLcYMp6ta5QAnBuXu8Uqc4NgXwYejLU9B7Rfgy3g02aqr/l8DR6Z3DASRCSSw/6zqZKTBXUQ==
X-Received: by 2002:a17:902:9a8c:b029:113:d891:2eaf with SMTP id
 w12-20020a1709029a8cb0290113d8912eafmr11286452plp.61.1626516568517; 
 Sat, 17 Jul 2021 03:09:28 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id p24sm13487926pfh.17.2021.07.17.03.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:09:27 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: [PATCH] mtd: fix lock hierarchy in deregister_mtd_blktrans
Date: Sat, 17 Jul 2021 18:07:19 +0800
Message-Id: <20210717100719.728829-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Hillf Danton <hdanton@sina.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

There is a lock hierarchy of major_names_lock --> mtd_table_mutex. One
existing chain is as follows:

1. major_names_lock --> loop_ctl_mutex (when blk_request_module calls
loop_probe)

2. loop_ctl_mutex --> bdev->bd_mutex (when loop_control_ioctl calls
loop_remove, which then calls del_gendisk)

3. bdev->bd_mutex --> mtd_table_mutex (when blkdev_get_by_dev calls
__blkdev_get, which then calls blktrans_open)

Since unregister_blkdev grabs the major_names_lock, we need to call it
outside the critical section for mtd_table_mutex, otherwise we invert
the lock hierarchy.

Reported-by: Hillf Danton <hdanton@sina.com>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 7d26cfe24d05..87e26788ef60 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -563,8 +563,8 @@ int deregister_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	list_for_each_entry_safe(dev, next, &tr->devs, list)
 		tr->remove_dev(dev);
 
-	unregister_blkdev(tr->major, tr->name);
 	mutex_unlock(&mtd_table_mutex);
+	unregister_blkdev(tr->major, tr->name);
 
 	BUG_ON(!list_empty(&tr->devs));
 	return 0;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
