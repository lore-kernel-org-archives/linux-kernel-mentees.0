Return-Path: <SRS0=ZtpW=MH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBCEC636C8
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Jul 2021 22:50:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1571A613AF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Jul 2021 22:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1571A613AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C50D0400C8;
	Thu, 15 Jul 2021 22:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-18N-aVNc5t; Thu, 15 Jul 2021 22:50:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 48F694036F;
	Thu, 15 Jul 2021 22:50:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22DF8C0010;
	Thu, 15 Jul 2021 22:50:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5018C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 22:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAD9F421E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 22:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CNrkFTb22IZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 22:50:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70D6C421DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 22:50:44 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 79FB21BF208;
 Thu, 15 Jul 2021 22:50:40 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH v2] mtd: break circular locks in register_mtd_blktrans
Date: Fri, 16 Jul 2021 00:50:40 +0200
Message-Id: <20210715225040.66117-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210617160904.570111-1-desmondcheongzx@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'962bf783ef65d15b0f8ca9c33342cf3b20bf0d2e'
Cc: linux-kernel@vger.kernel.org,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 linux-mtd@lists.infradead.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Christoph Hellwig <hch@lst.de>
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

On Thu, 2021-06-17 at 16:09:04 UTC, Desmond Cheong Zhi Xi wrote:
> Syzbot reported a circular locking dependency:
> https://syzkaller.appspot.com/bug?id=7bd106c28e846d1023d4ca915718b1a0905444cb
> 
> This happens because of the following lock dependencies:
> 
> 1. loop_ctl_mutex -> bdev->bd_mutex (when loop_control_ioctl calls
> loop_remove, which then calls del_gendisk; this also happens in
> loop_exit which eventually calls loop_remove)
> 
> 2. bdev->bd_mutex -> mtd_table_mutex (when blkdev_get_by_dev calls
> __blkdev_get, which then calls blktrans_open)
> 
> 3. mtd_table_mutex -> major_names_lock (when register_mtd_blktrans
> calls __register_blkdev)
> 
> 4. major_names_lock -> loop_ctl_mutex (when blk_request_module calls
> loop_probe)
> 
> Hence there's an overall dependency of:
> 
> loop_ctl_mutex   ----------> bdev->bd_mutex
>       ^                            |
>       |                            |
>       |                            v
> major_names_lock <---------  mtd_table_mutex
> 
> We can break this circular dependency by holding mtd_table_mutex only
> for the required critical section in register_mtd_blktrans. This
> avoids the mtd_table_mutex -> major_names_lock dependency.
> 
> Reported-and-tested-by: syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com
> Co-developed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
