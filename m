Return-Path: <SRS0=8tby=Z3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992F8C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 01:08:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77D802073B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 01:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77D802073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 47A2F87111;
	Thu,  5 Dec 2019 01:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzCV68YvY7wC; Thu,  5 Dec 2019 01:08:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D7B9D870F8;
	Thu,  5 Dec 2019 01:08:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC1D2C1DD6;
	Thu,  5 Dec 2019 01:08:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59EC4C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 01:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4357D87100
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 01:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5BHbzvCTDKNI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 01:08:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D4E75870F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 01:08:47 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id C54B914F35C6E;
 Wed,  4 Dec 2019 17:08:46 -0800 (PST)
Date: Wed, 04 Dec 2019 17:08:46 -0800 (PST)
Message-Id: <20191204.170846.1266614281989376759.davem@davemloft.net>
To: jaskaransingh7654321@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191204114013.31726-1-jaskaransingh7654321@gmail.com>
References: <20191204114013.31726-1-jaskaransingh7654321@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 04 Dec 2019 17:08:47 -0800 (PST)
Cc: aelior@marvell.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 GR-everest-linux-l2@marvell.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] drivers: net: qlogic: apply
 alloc_cast.cocci to qlogic/qed/qed_roce.c
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

From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
Date: Wed,  4 Dec 2019 17:10:13 +0530

> coccicheck reports that qlogic/qed/qed_roce.c can be patched with the
> semantic patch alloc_cast.cocci. The casts on the function
> dma_alloc_coherent can be removed. Apply the semantic patch and perform
> formatting changes as required.
> 
> Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>

This is a cleanup and therefore net-next material.

net-next is closed, please resubmit this when the net-next tree is
open again.

Thank you.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
