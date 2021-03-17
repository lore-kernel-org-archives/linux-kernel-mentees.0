Return-Path: <SRS0=IeUe=IP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED67C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Mar 2021 21:26:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9374B64EEE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Mar 2021 21:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9374B64EEE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C42083FFD;
	Wed, 17 Mar 2021 21:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GfF7VUL5ZXfN; Wed, 17 Mar 2021 21:26:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42B4583EEB;
	Wed, 17 Mar 2021 21:26:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F4C4C000A;
	Wed, 17 Mar 2021 21:26:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7F95C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 21:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAD646F995
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 21:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJ6966nE3ylb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 21:25:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D54F60689
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 21:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=fK5+i0hUGolj7mGml8H6sgNsoTx8ktey7VXlunodqoc=; b=gyveDLk2NfrD+0kIRX7/a/8CmJ
 5B+MQc2Gh+CU2p4pb0ZXka3536nmzos8MxHntbrgopxz2A+bUVQJA6PDdAcMBm7+q4dE0smSRq3Yt
 1drP/x50jfEDRlVhK0NRiPqYNtkx/DhJaBg/R6U19zoN21PEjMH3de5sJH9fFkiP/GDXoDh/Fmc1c
 g9SUPWESptQdvmlPJdyd6XOw+H+V38lZUi+EI1siB9q/6Hfl0dADdC4CfOQkzqqGPEUEqdi2crd+6
 kOhbEITb1nAj2tG8M9uy08tyK/l/46Hq6hsJ+zTPpgGfTs/HkoBtXpbDzBJDHifzwYaC84qmwyf12
 oxh9gMAw==;
Received: from [2601:1c0:6280:3f0::9757]
 by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMdfW-001gnN-AK; Wed, 17 Mar 2021 21:25:36 +0000
Subject: Re: [PATCH] block: fix comment syntax in file headers
To: Aditya Srivastava <yashsri421@gmail.com>, linux-kernel@vger.kernel.org
References: <20210317205245.24857-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <087c2cf0-2085-be13-f6db-8ebacb22b252@infradead.org>
Date: Wed, 17 Mar 2021 14:25:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317205245.24857-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: axboe@kernel.dk, linux-ntfs-dev@lists.sourceforge.net, ldm@flatcap.org,
 linux-block@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On 3/17/21 1:52 PM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are files in block/partitions/ which follow this syntax in their file
> headers, i.e. start with '/**' like comments, which causes unexpected
> warnings from kernel-doc.
> 
> E.g., running scripts/kernel-doc -none on block/partitions/ldm.h
> causes this warning:
> "warning: expecting prototype for ldm(). Prototype was for _FS_PT_LDM_H_() instead"
> 
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e., "/*", to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> * Applies perfectly on next-20210312
> 
>  block/partitions/ldm.c | 2 +-
>  block/partitions/ldm.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/block/partitions/ldm.c b/block/partitions/ldm.c
> index d333786b5c7e..14b124cdacfc 100644
> --- a/block/partitions/ldm.c
> +++ b/block/partitions/ldm.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * ldm - Support for Windows Logical Disk Manager (Dynamic Disks)
>   *
>   * Copyright (C) 2001,2002 Richard Russon <ldm@flatcap.org>
> diff --git a/block/partitions/ldm.h b/block/partitions/ldm.h
> index d8d6beaa72c4..ffdecf1c6bb3 100644
> --- a/block/partitions/ldm.h
> +++ b/block/partitions/ldm.h
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * ldm - Part of the Linux-NTFS project.
>   *
>   * Copyright (C) 2001,2002 Richard Russon <ldm@flatcap.org>
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
