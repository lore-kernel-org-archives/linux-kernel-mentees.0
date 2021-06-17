Return-Path: <SRS0=8Gt8=LL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630E9C2B9F4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Jun 2021 11:52:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B2C613BF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Jun 2021 11:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1B2C613BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3E3C60736;
	Thu, 17 Jun 2021 11:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ysn6_gT_3F6t; Thu, 17 Jun 2021 11:52:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5A833606F9;
	Thu, 17 Jun 2021 11:52:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4687EC000E;
	Thu, 17 Jun 2021 11:52:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22526C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 11:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10F2B40103
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 11:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGOpS9zlYSex
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 11:52:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 428E6400D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 11:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eWfLpTUm88WigYNAtGgk0puveZH4s8vjCO/lhD+KZFA=; b=Ksd9U+/hjhk7n5mA5nDGHYSxdq
 ZjKymSIxqpChMzh0uIjvW46GqzQIAUbUkc2KgZ9iAtw8Occ48KXpEdrwhf1V/SOTILfcoq15YzLe3
 pd2CTMHOibHCqPeQRFeJ+4BC4ILcOzzZlwMQ2XJdFSZSJQvxqsSIiiB86v16VD2X6LhGwWc2G4m1t
 uFkCcygCch96mtPisbW0Rcu8S0F+xiZ7w0iBJigWj0LIkJiT4+ftv1HKs+Gl2mWC+/9jGuRXczqQu
 giuqpDjJl4ppLa1xG1/FiE+jjtHCtzBVDRSSiR/xwcuf8YQMDOUoC40mvQmMTWu7Ez0sr24mI8Vhz
 GU+A0e7g==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1ltqYN-0095Tm-BZ; Thu, 17 Jun 2021 11:51:30 +0000
Date: Thu, 17 Jun 2021 12:51:23 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH] block: break circular locks in blk_request_module
Message-ID: <YMs3O/cg4V7ywlVq@infradead.org>
References: <20210617092016.522985-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617092016.522985-1-desmondcheongzx@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 vigneshr@ti.com, miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, richard@nod.at, linux-mtd@lists.infradead.org,
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

On Thu, Jun 17, 2021 at 05:20:16PM +0800, Desmond Cheong Zhi Xi wrote:
>  	mutex_lock(&major_names_lock);
>  	for (n = &major_names[major_to_index(major)]; *n; n = &(*n)->next) {
>  		if ((*n)->major == major && (*n)->probe) {
> -			(*n)->probe(devt);
> +			probe = (*n)->probe;
>  			mutex_unlock(&major_names_lock);
> +			probe(devt);

And now you can all probe after it has been freed and/or the module has
been unloaded. The obviously correct fix is to only hold mtd_table_mutex
for the actually required critical section:

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index fb8e12d590a1..065d94f9b1fb 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -529,13 +529,11 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 		register_mtd_user(&blktrans_notifier);
 
 
-	mutex_lock(&mtd_table_mutex);
 
 	ret = register_blkdev(tr->major, tr->name);
 	if (ret < 0) {
 		printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
 		       tr->name, tr->major, ret);
-		mutex_unlock(&mtd_table_mutex);
 		return ret;
 	}
 
@@ -545,12 +543,12 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
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
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
