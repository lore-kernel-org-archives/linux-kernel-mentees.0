Return-Path: <SRS0=oh/h=CM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8153C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Sep 2020 06:59:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9143A2071B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Sep 2020 06:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9143A2071B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 476B486B85;
	Thu,  3 Sep 2020 06:59:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m8VOYjHOKTOq; Thu,  3 Sep 2020 06:59:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1B09A86B82;
	Thu,  3 Sep 2020 06:59:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05A0AC07FF;
	Thu,  3 Sep 2020 06:59:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91078C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Sep 2020 06:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4EFC520434
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Sep 2020 06:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yis11MYqhasQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Sep 2020 06:59:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 9CDC32041E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Sep 2020 06:59:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 30B2968BEB; Thu,  3 Sep 2020 08:59:50 +0200 (CEST)
Date: Thu, 3 Sep 2020 08:59:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200903065950.GA19012@lst.de>
References: <000000000000520ffc05ae2f4fee@google.com>
 <20200903065534.623691-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903065534.623691-1-yepeilin.cs@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, Hillf Danton <hdanton@sina.com>,
 Jan Kara <jack@suse.cz>, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Christoph Hellwig <hch@lst.de>,
 Konstantin Khlebnikov <koct9i@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] block: Fix use-after-free in
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

On Thu, Sep 03, 2020 at 02:55:34AM -0400, Peilin Ye wrote:
> In bdev_del_partition(), `part` is being looked up outside the critical
> section. This is causing bdev_del_partition() to delete the same partition
> more than once. Fix it by reverting commit cddae808aeb7.

We've already fix the problem properly:

https://git.kernel.dk/cgit/linux-block/commit/?h=block-5.9&id=08fc1ab6d748ab1a690fd483f41e2938984ce353
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
