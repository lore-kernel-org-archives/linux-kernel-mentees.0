Return-Path: <SRS0=ODY0=L6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF307C07E96
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Jul 2021 05:13:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D77D6198D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Jul 2021 05:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D77D6198D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42CE340474;
	Tue,  6 Jul 2021 05:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKnjW37y4XUx; Tue,  6 Jul 2021 05:13:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D6A5C40456;
	Tue,  6 Jul 2021 05:13:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B57A8C0010;
	Tue,  6 Jul 2021 05:13:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D103C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 05:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BC40400C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 05:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9f0rM0VlvzW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 05:13:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAEE540025
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 05:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HL8TXzIMAEiDs6New4fpmFiNo+lUInfaBflRDKvoc5k=; b=Qqqd5AK6Xkl+I69DpgFLrt62cS
 irSXMGizexUgIJpRLMozac0yiTiKfkl+RqrMjK5r2HjQU8ufQQ0O1zrZu9uDmxmNRsKRsgg4u4TMB
 1pQuwNXfkdf1DXCoMkOniI71yUgy9/g1nSppJ6OKxoI7BQVQIWoJHz21LOt0cAc696R6r06SF25uV
 8Xhv9aBWOFu3JgM1tQi6gGYdqU7h3BSVLXSai43OxDyCHT7OwxgRlA+3KMTSf9NstDnHuCmicMVRr
 r/c7SFMwFZSFNuDYaVYFxhhz6TWgQ8x4wgyijn85M5cBqp5snoJSMGK1WHo7l2YRv8066aWZ4940U
 ze2anFgw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m0dNZ-00Ar8t-QF; Tue, 06 Jul 2021 05:12:24 +0000
Date: Tue, 6 Jul 2021 06:12:17 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Rajat Asthana <thisisrast7@gmail.com>
Subject: Re: [PATCH] block: Avoid accessing an already freed kobject in
 delete_partition
Message-ID: <YOPmMZdMQgXAyEMO@infradead.org>
References: <20210702231228.261460-1-rajatasthana4@gmail.com>
 <YN/1DOeSA5ODf1AV@infradead.org>
 <0c623d71-6d99-2e0d-4d8b-63a1ff814dc1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c623d71-6d99-2e0d-4d8b-63a1ff814dc1@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, damien.lemoal@wdc.com,
 jack@suse.cz, Rajat Asthana <rajatasthana4@gmail.com>, rafael@kernel.org,
 syzbot+7d6c5587ec9cff5be65c@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, ming.lei@redhat.com,
 Christoph Hellwig <hch@infradead.org>, hare@suse.de,
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

On Tue, Jul 06, 2021 at 06:31:11AM +0530, Rajat Asthana wrote:
> 
> 
> On 03/07/21 10:56 am, Christoph Hellwig wrote:
> > This should be fixed properly by:
> > 
> > "block: check disk exist before trying to add partition"
> 
> Hi Christoph, thanks a lot for suggesting this fix. I have been
> working on implementing this and have tried the following:
> - I checked if the the kobject of device structure embedded in
>   gendisk structure is not NULL, to add the partition.
>   This didn't work.
> 
> - Then I checked the if kobject of the block_device struct (part0)
>   embedded in the gendisk struct is not NULL, to add the partition.
>   This also didn't work.
> 
> - Then I checked the i_state of the bd_inode field of block_device
>   struct embedded in the gendisk struct. I checked if the I_FREEING or
>   I_WILL_FREE fields are not set. The reason behind doing this was
>   to confirm that we only create partition on the disks which are not
>   being freed.
> 
> Am I going in the right direction? Can you point me to the correct
> direction if I am not?

No.  There should be no need to check anything, but the code needs
to ensure that the block device is alive.  I think the above mentioned
patch (now in Jens' tree) does that, so please try it.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
