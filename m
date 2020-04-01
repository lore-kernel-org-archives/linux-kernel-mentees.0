Return-Path: <SRS0=IV6d=5R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B60DC43331
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 00:04:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4932320772
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 00:04:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WXHxeM0n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4932320772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 13C3687708;
	Wed,  1 Apr 2020 00:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O4YI261LzwJ1; Wed,  1 Apr 2020 00:04:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6A2B986686;
	Wed,  1 Apr 2020 00:04:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5ED5FC1AE2;
	Wed,  1 Apr 2020 00:04:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 441D9C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 00:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EDE6886686
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 00:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ug5jfzVc5d7w
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 00:04:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4856686C7E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 00:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5AHQT3HNoIfrpxFYcnKnT3xJDAyH56vM7k0YaLOkJVw=; b=WXHxeM0n35BJgssvOzHfB7PrVS
 gX96MWzJMJdJqAtFWyuzP/6IVMdYm37f63ftVeAokCU66LbE3016VYkHF9XAAJ1eBev/dxbwgRJs7
 eKChYRuBoPwOWq6s+BJO9+lV7rwoASQ82KFz+QBzDZDe626Y3w30pZVlZVZbEmsR73XYeqEAPYM0E
 Ptwp4VN7hB3MRLPa7SxBgo93TgjhgbJxXuZDVOEpf+3ZvGWRwmkCwNd4hp76Rfps9BuBAs6G+iFKu
 9NattIPbR5E7JQssNMR+E9s/vLQXAnsCxLs5mgiNXRMF+1a3p5H7waztpo1ty+KjCc7+oAY4PptsS
 TI5FDsyw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jJQs3-0006SZ-Pr; Wed, 01 Apr 2020 00:04:39 +0000
Date: Tue, 31 Mar 2020 17:04:39 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <20200401000439.GE21484@bombadil.infradead.org>
References: <cover.1585693146.git.vitor@massaru.org>
 <637c0379a76fcf4eb6cdde0de3cc727203fd942f.1585693146.git.vitor@massaru.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <637c0379a76fcf4eb6cdde0de3cc727203fd942f.1585693146.git.vitor@massaru.org>
Cc: corbet@lwn.net, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] Documentation: filesystems:
	Convert sysfs-pci to ReST
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

On Tue, Mar 31, 2020 at 07:28:56PM -0300, Vitor Massaru Iha wrote:
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> ---
>  .../{sysfs-pci.txt => sysfs-pci.rst}          | 40 ++++++++++---------
>  1 file changed, 22 insertions(+), 18 deletions(-)
>  rename Documentation/filesystems/{sysfs-pci.txt => sysfs-pci.rst} (82%)
> 
> diff --git a/Documentation/filesystems/sysfs-pci.txt b/Documentation/filesystems/sysfs-pci.rst

In addition to Jon's comments, for the next version, I would suggest
cc'ing the linux-pci@vger.kernel.org mailing list.  

Also, maybe add:

F: Documentation/filesystems/sysfs-pci.rst

to the 'PCI SUBSYSTEM' section of MAINTAINERS.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
