Return-Path: <SRS0=0o+h=I3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C933C433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 17:07:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27F886196E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 17:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27F886196E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B60837AC;
	Mon, 29 Mar 2021 17:07:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xTeHe1BWbWoW; Mon, 29 Mar 2021 17:07:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0A2982E90;
	Mon, 29 Mar 2021 17:07:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D09D5C000B;
	Mon, 29 Mar 2021 17:07:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 775D0C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 17:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56A514011B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 17:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uAwnCnkwL-1H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 17:07:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 926AA400A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 17:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=upsa9Q1nGEpyCmVrRsSKfVCiWk/ftvGAAkKdDkT7cfk=; b=K4jqMihSNW1ZqKa8wXHdqnwgld
 QfZiJiPDJxjU31nsSxI/1x3bNdhqCpWdfNYXakB+j68aVK0MikbriuFbp0umiuWWz+CGvcgHQ65iZ
 sj4Ou1Xh9Xpl4Cx//jaUFfzPBu0kdIO7sjCj0MtizMGV7q8H8OT0DVRDwIqTCmzMQ5N4RDPesrDdb
 y2mWkE4KiWyiASoRkjrL7P88Abmno0+9EA6CAMdLTLKkmQwY5hGGuuLv5zZeaDShn6+S95dc8TAH8
 W9wv2ClET591OaQpDEcSz4ox13qRqcBogQfa90RkJ46lB3GYV03hyX4rM2KMDTSWww89MhrmaLH2W
 OwK6ZaGw==;
Received: from [2601:1c0:6280:3f0::4557]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lQvMA-000qy0-13; Mon, 29 Mar 2021 17:07:14 +0000
Subject: Re: [PATCH] lib: fix incorrect kernel-doc comment syntax in file
To: Aditya Srivastava <yashsri421@gmail.com>, linux-kernel@vger.kernel.org
References: <20210329121054.20474-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3c08eedb-1cc3-c058-ef55-341925eaff56@infradead.org>
Date: Mon, 29 Mar 2021 10:07:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210329121054.20474-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: ojeda@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 gustavoars@kernel.org, linux-doc@vger.kernel.org
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

On 3/29/21 5:10 AM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are certain files in lib and lib/zstd, which follow this syntax,
> but the content inside does not comply with kernel-doc.
> Such lines were probably not meant for kernel-doc parsing, but are parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc.
> 
> E.g., presence of kernel-doc like comment in lib/zstd/compress.c at
> header causes these warnings by kernel-doc:
> "warning: cannot understand function prototype: 'const U32 g_searchStrength = 8;  '"
> 
> Similarly for other files too.
> 
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> * Applies perfectly on next-20210326
> 
>  lib/win_minmax.c         | 2 +-
>  lib/zstd/compress.c      | 2 +-
>  lib/zstd/decompress.c    | 2 +-
>  lib/zstd/error_private.h | 2 +-
>  lib/zstd/mem.h           | 2 +-
>  lib/zstd/zstd_common.c   | 2 +-
>  lib/zstd/zstd_internal.h | 2 +-
>  lib/zstd/zstd_opt.h      | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/win_minmax.c b/lib/win_minmax.c
> index 6bdc1cd15f76..ec10506834b6 100644
> --- a/lib/win_minmax.c
> +++ b/lib/win_minmax.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*
>   * lib/minmax.c: windowed min/max tracker
>   *
>   * Kathleen Nichols' algorithm for tracking the minimum (or maximum)
> diff --git a/lib/zstd/compress.c b/lib/zstd/compress.c
> index b080264ed3ad..42604785c4f2 100644
> --- a/lib/zstd/compress.c
> +++ b/lib/zstd/compress.c
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
>   * All rights reserved.
>   *
> diff --git a/lib/zstd/decompress.c b/lib/zstd/decompress.c
> index 66cd487a326a..b28f10f21a6c 100644
> --- a/lib/zstd/decompress.c
> +++ b/lib/zstd/decompress.c
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
>   * All rights reserved.
>   *
> diff --git a/lib/zstd/error_private.h b/lib/zstd/error_private.h
> index 1a60b31f706c..f7dfa4a18f27 100644
> --- a/lib/zstd/error_private.h
> +++ b/lib/zstd/error_private.h
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
>   * All rights reserved.
>   *
> diff --git a/lib/zstd/mem.h b/lib/zstd/mem.h
> index 93d7a2c377fe..97d92eb431a5 100644
> --- a/lib/zstd/mem.h
> +++ b/lib/zstd/mem.h
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
>   * All rights reserved.
>   *
> diff --git a/lib/zstd/zstd_common.c b/lib/zstd/zstd_common.c
> index a282624ee155..ebf848c1f348 100644
> --- a/lib/zstd/zstd_common.c
> +++ b/lib/zstd/zstd_common.c
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
>   * All rights reserved.
>   *
> diff --git a/lib/zstd/zstd_internal.h b/lib/zstd/zstd_internal.h
> index dac753397f86..5f02411bded1 100644
> --- a/lib/zstd/zstd_internal.h
> +++ b/lib/zstd/zstd_internal.h
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * Copyright (c) 2016-present, Yann Collet, Facebook, Inc.
>   * All rights reserved.
>   *
> diff --git a/lib/zstd/zstd_opt.h b/lib/zstd/zstd_opt.h
> index 55e1b4cba808..b4a02b9f76d8 100644
> --- a/lib/zstd/zstd_opt.h
> +++ b/lib/zstd/zstd_opt.h
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * Copyright (c) 2016-present, Przemyslaw Skibinski, Yann Collet, Facebook, Inc.
>   * All rights reserved.
>   *
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
