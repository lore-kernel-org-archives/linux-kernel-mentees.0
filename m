Return-Path: <SRS0=Bfkk=I4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAA7C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 21:05:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B50DF619BD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 21:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B50DF619BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 886F04039F;
	Tue, 30 Mar 2021 21:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJU-k27lul-z; Tue, 30 Mar 2021 21:05:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id A70ED4037D;
	Tue, 30 Mar 2021 21:05:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88E8AC000B;
	Tue, 30 Mar 2021 21:05:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38CC4C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27591404D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRdDmPpbupoE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:05:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54019404DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=n6MY9RJyc519hB+O3xAcfsPoosUq/Ub7s3jI4orlYqg=; b=DGMpjjZdEM899ZiaIkxW/6v/64
 LKO23qZZwq5b7yd2zn8sTHoVyQMSEdX3+LFh/A6Y1bzYh1oN82dXRe3tqL3duDQAXVl1B3Y3/af/o
 7oi9QreFC2VfPwvG4vKkX49lTwYSLNfBaXSSdOjZxEyKXwaTKzAEgIwp2R2Wc/fjjU3ifUpXUNmUr
 06KP2XDCy+ufVBIuIcl2uxbOvrodIeFTrDPzDRZqpoBkB81BtBIX83eqyw/L2pH0ezHQwSisj+L4j
 g6obsVdTQY+srFsKrkMPB2+fKxPdXw3MmMavevyTCCDcT/FP2ueEZtpc/aMHS4pgPv0dW3lX7uP43
 ctyMm7TQ==;
Received: from [2601:1c0:6280:3f0::4557]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lRLY1-003bdb-Fy; Tue, 30 Mar 2021 21:05:15 +0000
Subject: Re: [PATCH] ARM: OMAP2+: fix incorrect kernel-doc comment syntax in
 file
To: Aditya Srivastava <yashsri421@gmail.com>, linux-kernel@vger.kernel.org
References: <20210330205908.26800-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <553c1956-d6fa-0540-c3d6-c2aa59d8ccd7@infradead.org>
Date: Tue, 30 Mar 2021 14:05:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210330205908.26800-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, tony@atomide.com, linux@armlinux.org.uk,
 linux-omap@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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

On 3/30/21 1:59 PM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for arch/arm/mach-omap2/omap_twl.c follows this syntax, but the
> content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc:
> "warning: wrong kernel-doc identifier on line:
>  * OMAP and TWL PMIC specific initializations."
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> * Applies perfectly on next-20210326
> 
>  arch/arm/mach-omap2/omap_twl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/omap_twl.c b/arch/arm/mach-omap2/omap_twl.c
> index a642d3b39e50..d4dab041324d 100644
> --- a/arch/arm/mach-omap2/omap_twl.c
> +++ b/arch/arm/mach-omap2/omap_twl.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * OMAP and TWL PMIC specific initializations.
>   *
>   * Copyright (C) 2010 Texas Instruments Incorporated.
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
