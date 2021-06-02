Return-Path: <SRS0=4M9n=K4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FF4C47083
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 11:19:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC8E613B1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 11:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABC8E613B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E71640238;
	Wed,  2 Jun 2021 11:19:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id smabz36LNIA3; Wed,  2 Jun 2021 11:19:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36AFF40146;
	Wed,  2 Jun 2021 11:19:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23973C000D;
	Wed,  2 Jun 2021 11:19:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E770BC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 11:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E38AC83981
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 11:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZHmfrA6XPeX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 11:19:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83B0B8392C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 11:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HDweTCl+XEUHn4S+CyKOejrxpiweHcZr8IDGuVHWUQs=; b=Tcy9hOUYXzaNYvb838lLrK5nCc
 5O8nyC5DFTersZ93EfzI5GQE21FOEITswYvUc1bzoXzAdmLrF9tATY/XDeKZrK6+Y7uDTo5SwI51V
 FR7b3yUH8ZgB9lTGbgNiLOmPV9WaVtGCr2o1NZ6zmpnEnirvy/vLeqagzG8OwvRtkfqctkQqmBwLF
 6eHNPe1uOWKY0CLOQJHqsjx2ew98SABPi+1IhMLEXUA+Fsr57UhENhx7uAjt2qKyo2SfVW15W8XR7
 BMcLuj4i65zASAENdaHGegVz1dnCwLR8NxGcvdydOTuvbYsXAOwarYwENq71hDSajiOaROsMPsWXk
 bTgtZoLg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1loOsx-00B1wM-Qt; Wed, 02 Jun 2021 11:18:13 +0000
Date: Wed, 2 Jun 2021 12:18:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: syzbot <syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com>
Subject: Re: [syzbot] WARNING in idr_get_next
Message-ID: <YLdo77SkmGLgPUBi@casper.infradead.org>
References: <000000000000c98d7205ae300144@google.com>
 <0000000000003e409f05c3c5f190@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0000000000003e409f05c3c5f190@google.com>
Cc: necip@google.com, eric.dumazet@gmail.com, ebiggers@google.com,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 fw@strlen.de, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 ebiggers@kernel.org, coreteam@netfilter.org, netfilter-devel@vger.kernel.org,
 manivannan.sadhasivam@linaro.org, linux-fsdevel@vger.kernel.org,
 kuba@kernel.org, syzkaller-bugs@googlegroups.com, kadlec@netfilter.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 pablo@netfilter.org
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

#syz fixed qrtr: Convert qrtr_ports from IDR to XArray

On Wed, Jun 02, 2021 at 03:30:06AM -0700, syzbot wrote:
> syzbot suspects this issue was fixed by commit:
> 
> commit 43016d02cf6e46edfc4696452251d34bba0c0435
> Author: Florian Westphal <fw@strlen.de>
> Date:   Mon May 3 11:51:15 2021 +0000

Your bisect went astray.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
