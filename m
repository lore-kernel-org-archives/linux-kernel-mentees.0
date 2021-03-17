Return-Path: <SRS0=IeUe=IP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253C4C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Mar 2021 20:44:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B68364E74
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Mar 2021 20:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B68364E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDC834ECD9;
	Wed, 17 Mar 2021 20:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WpZrP6eb0NaD; Wed, 17 Mar 2021 20:44:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6070E484CB;
	Wed, 17 Mar 2021 20:44:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3ABAFC000B;
	Wed, 17 Mar 2021 20:44:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AC6FC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11CDC832C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org header.b="adgSEdzO";
 dkim=pass (2048-bit key) header.d=infradead.org header.b="ld5DyQF+"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBWyJtHybJZl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:44:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA58083134
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=wSTffLxRvbfWNiwQavgHvVZJbejq7y1KUbBR2HBcwJs=; b=adgSEdzOYB7dKAKM7ZMcMxU3BO
 yiuMUQlNvSKyuV64bnZFFNsySmrXvx6kV7kPm5K1tBcU1S8Hc1UGgfuSFRMHUsrz6yoQMLmidYLCr
 WXJyFh/4tJjO3BaWclMijUZCd2UmEqycYIiCO6xGZcoKBkZhTC0pwFJdDTdI8fxMw/PRazxtCS4tV
 zP9vGADa9rLGwjOIqf53MTs1EDhja3Za3mvqjqFARaX6vW2cMFAbw4hfCH1xhTPUr2YdCJHlheX8A
 LU8Mv1CCBqfRQL2YEpYjPvFhjDb5oE3oc5VCbD2joUPk7Dc/lmOjOT1/0XfLqkOvzhkjdK4XjbiDt
 Tbq2krFQ==;
Received: from merlin.infradead.org ([2001:8b0:10b:1234::107])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMd0J-003sTH-Jo
 for linux-kernel-mentees@lists.linuxfoundation.org;
 Wed, 17 Mar 2021 20:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=wSTffLxRvbfWNiwQavgHvVZJbejq7y1KUbBR2HBcwJs=; b=ld5DyQF+1/bh/cItmNZ3cdq8Kb
 653hzvRn2JLN72BXCkJyr40IsnfRW0UBpZ6hV3z22c69dyhbGLMfcJFT1Eg49ucejtjHx5+W6P6ze
 RCmrHdar7lx3x/P3oPWLdKvNNY1liLrv0nqepyueQyyUMD1hATKch1MNGChz5W74bTbTYzquU5A7P
 k4oKwY+pu0MuHD4hQMZI4+Mw/9z37f8PF8AaqhBmllWB9cu6Xtab8MaOdGC1Yr+LlMgnAs+ZJx+Ry
 155JE7wqJq4R+mwbgrcUqfXCSfl3FYUGc8vUdKmzZOGpWpHHHqruagMmJ4uSa/DyVFkmXb/SeH4Nd
 TRDEiApA==;
Received: from [2601:1c0:6280:3f0::9757]
 by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMcwu-001gdl-Dn; Wed, 17 Mar 2021 20:39:30 +0000
Subject: Re: [PATCH] ALSA: asihpi: fix comment syntax in file headers
To: Aditya Srivastava <yashsri421@gmail.com>, alsa-devel@alsa-project.org
References: <20210317202144.20290-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <608b4400-dfda-9702-ae3a-b1bc9aca6da6@infradead.org>
Date: Wed, 17 Mar 2021 13:39:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317202144.20290-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, perex@perex.cz
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

On 3/17/21 1:21 PM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are files in sound/pci/asihpi which follow this syntax in their file
> headers, i.e. start with '/**' like comments, which causes unexpected
> warnings from kernel-doc.
> 
> E.g., running scripts/kernel-doc -none on sound/pci/asihpi/hpidspcd.h
> causes this warning:
> "warning: Cannot understand
>  on line 4 - I thought it was a doc line"
> 
> Provide a simple fix by replacing the kernel-doc like comment syntax with
> general format, i.e. "/*", to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> * Applies perfectly on next-20210312
> 
>  sound/pci/asihpi/hpicmn.h   | 2 +-
>  sound/pci/asihpi/hpidspcd.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/pci/asihpi/hpicmn.h b/sound/pci/asihpi/hpicmn.h
> index de3bedd29d94..8ec656cf8848 100644
> --- a/sound/pci/asihpi/hpicmn.h
> +++ b/sound/pci/asihpi/hpicmn.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>  
>      AudioScience HPI driver
>      Copyright (C) 1997-2014  AudioScience Inc. <support@audioscience.com>
> diff --git a/sound/pci/asihpi/hpidspcd.h b/sound/pci/asihpi/hpidspcd.h
> index a01e8c6092bd..9f1468ed7096 100644
> --- a/sound/pci/asihpi/hpidspcd.h
> +++ b/sound/pci/asihpi/hpidspcd.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /***********************************************************************/
> -/**
> +/*
>  
>      AudioScience HPI driver
>      Copyright (C) 1997-2011  AudioScience Inc. <support@audioscience.com>
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
