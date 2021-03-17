Return-Path: <SRS0=IeUe=IP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69267C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Mar 2021 20:51:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C34E764E90
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Mar 2021 20:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C34E764E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA7D4ED7D;
	Wed, 17 Mar 2021 20:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f71CSm8fj6KL; Wed, 17 Mar 2021 20:51:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A3304ED3B;
	Wed, 17 Mar 2021 20:51:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BE87C000B;
	Wed, 17 Mar 2021 20:51:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C54FC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 437096F98B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLC87t1-hJKB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:51:22 +0000 (UTC)
X-Greylist: delayed 00:09:27 by SQLgrey-1.8.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C422560699
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Mar 2021 20:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=D5D89/TKIGeXZgkbBE6j29aBo7eeo92Jhg5zvf77KOQ=; b=xfJW51k+Ypgc4yunBzBb3XyJ/d
 NpavTMH96gs/TV/mpS3LNicoztscHjRempy6YpFsxMK6VyFyJBePLAUxF0Dn/Lsy1IbgKhozj65u2
 BXBYp4I8GB/KHL+/2vIEigEvoRbXE6cYN0x9iBufHpXvoBf6jYw97s6mIhGzr5UIJF3n4Iq+J9lUx
 ROh2AlBIfu+3MT9Q3AQ5o8BpVnaQi9TSokRSTT5HpwUrWYfG59gcwGfM+jaeZaRogecAAUkWXiZXy
 dWIipXCO/IrDuzXUUkDBApIGC7u4QlScA1GdFtmsiP1P7Ktk0IgPEu5TK1FPSyFXFWceEVpb4c/sB
 zvFGYqaA==;
Received: from [2601:1c0:6280:3f0::9757]
 by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMd8C-001ggk-41; Wed, 17 Mar 2021 20:51:09 +0000
Subject: Re: [PATCH] ALSA: ctxfi: fix comment syntax in file headers
To: Aditya Srivastava <yashsri421@gmail.com>, alsa-devel@alsa-project.org
References: <20210317203932.23993-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <68e0dfd9-ed58-dec3-31b7-c5384d8640f8@infradead.org>
Date: Wed, 17 Mar 2021 13:50:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317203932.23993-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, perex@perex.cz, linux-kernel-mentees@lists.linuxfoundation.org
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

On 3/17/21 1:39 PM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are files in sound/pci/ctxfi which follow this syntax in their file
> headers, i.e. start with '/**' like comments, which causes unexpected
> warnings from kernel-doc.
> 
> E.g., running scripts/kernel-doc -none on sound/pci/ctxfi/ctresource.c
> causes this warning:
> "warning: wrong kernel-doc identifier on line:
>  * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved."
> 
> Similarly for other files too.
> 
> Provide a simple fix by replacing the kernel-doc like comment syntax with
> general format, i.e. "/*", to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  sound/pci/ctxfi/ct20k1reg.h  | 2 +-
>  sound/pci/ctxfi/ct20k2reg.h  | 2 +-
>  sound/pci/ctxfi/ctamixer.c   | 2 +-
>  sound/pci/ctxfi/ctamixer.h   | 2 +-
>  sound/pci/ctxfi/ctatc.c      | 2 +-
>  sound/pci/ctxfi/ctatc.h      | 2 +-
>  sound/pci/ctxfi/ctdaio.c     | 2 +-
>  sound/pci/ctxfi/ctdaio.h     | 2 +-
>  sound/pci/ctxfi/cthardware.h | 2 +-
>  sound/pci/ctxfi/cthw20k1.h   | 2 +-
>  sound/pci/ctxfi/cthw20k2.h   | 2 +-
>  sound/pci/ctxfi/ctimap.h     | 2 +-
>  sound/pci/ctxfi/ctmixer.h    | 2 +-
>  sound/pci/ctxfi/ctpcm.h      | 2 +-
>  sound/pci/ctxfi/ctresource.c | 2 +-
>  sound/pci/ctxfi/ctresource.h | 2 +-
>  sound/pci/ctxfi/ctsrc.c      | 2 +-
>  sound/pci/ctxfi/ctsrc.h      | 2 +-
>  sound/pci/ctxfi/ctvmem.c     | 2 +-
>  sound/pci/ctxfi/ctvmem.h     | 2 +-
>  20 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/pci/ctxfi/ct20k1reg.h b/sound/pci/ctxfi/ct20k1reg.h
> index d4bfee499fb1..05bb006c0f4c 100644
> --- a/sound/pci/ctxfi/ct20k1reg.h
> +++ b/sound/pci/ctxfi/ct20k1reg.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   */
>  
> diff --git a/sound/pci/ctxfi/ct20k2reg.h b/sound/pci/ctxfi/ct20k2reg.h
> index af94ea66fdda..02f67828eabe 100644
> --- a/sound/pci/ctxfi/ct20k2reg.h
> +++ b/sound/pci/ctxfi/ct20k2reg.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   */
>  
> diff --git a/sound/pci/ctxfi/ctamixer.c b/sound/pci/ctxfi/ctamixer.c
> index d4ff377eb3a3..da6e6350ceaf 100644
> --- a/sound/pci/ctxfi/ctamixer.c
> +++ b/sound/pci/ctxfi/ctamixer.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	ctamixer.c
> diff --git a/sound/pci/ctxfi/ctamixer.h b/sound/pci/ctxfi/ctamixer.h
> index 4fafb397abed..4498e6139d0e 100644
> --- a/sound/pci/ctxfi/ctamixer.h
> +++ b/sound/pci/ctxfi/ctamixer.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	ctamixer.h
> diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
> index f8ac96cf38a4..78f35e88aed6 100644
> --- a/sound/pci/ctxfi/ctatc.c
> +++ b/sound/pci/ctxfi/ctatc.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File    ctatc.c
> diff --git a/sound/pci/ctxfi/ctatc.h b/sound/pci/ctxfi/ctatc.h
> index ac31b32b277b..0bc7b71d910b 100644
> --- a/sound/pci/ctxfi/ctatc.h
> +++ b/sound/pci/ctxfi/ctatc.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	ctatc.h
> diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
> index 4cb47b5a792c..f589da045342 100644
> --- a/sound/pci/ctxfi/ctdaio.c
> +++ b/sound/pci/ctxfi/ctdaio.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	ctdaio.c
> diff --git a/sound/pci/ctxfi/ctdaio.h b/sound/pci/ctxfi/ctdaio.h
> index 431583bb0a3e..bd6310f48013 100644
> --- a/sound/pci/ctxfi/ctdaio.h
> +++ b/sound/pci/ctxfi/ctdaio.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	ctdaio.h
> diff --git a/sound/pci/ctxfi/cthardware.h b/sound/pci/ctxfi/cthardware.h
> index 9e6b83bd432d..f406b626a28c 100644
> --- a/sound/pci/ctxfi/cthardware.h
> +++ b/sound/pci/ctxfi/cthardware.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	cthardware.h
> diff --git a/sound/pci/ctxfi/cthw20k1.h b/sound/pci/ctxfi/cthw20k1.h
> index b7cbe82d71bd..ffb019abf651 100644
> --- a/sound/pci/ctxfi/cthw20k1.h
> +++ b/sound/pci/ctxfi/cthw20k1.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	cthw20k1.h
> diff --git a/sound/pci/ctxfi/cthw20k2.h b/sound/pci/ctxfi/cthw20k2.h
> index 797b13dcd84c..6993a3d5277a 100644
> --- a/sound/pci/ctxfi/cthw20k2.h
> +++ b/sound/pci/ctxfi/cthw20k2.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	cthw20k2.h
> diff --git a/sound/pci/ctxfi/ctimap.h b/sound/pci/ctxfi/ctimap.h
> index 79bc94bce4d5..49b1bb831410 100644
> --- a/sound/pci/ctxfi/ctimap.h
> +++ b/sound/pci/ctxfi/ctimap.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	ctimap.h
> diff --git a/sound/pci/ctxfi/ctmixer.h b/sound/pci/ctxfi/ctmixer.h
> index 770dc18a85e8..e812f6c93b41 100644
> --- a/sound/pci/ctxfi/ctmixer.h
> +++ b/sound/pci/ctxfi/ctmixer.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	ctmixer.h
> diff --git a/sound/pci/ctxfi/ctpcm.h b/sound/pci/ctxfi/ctpcm.h
> index dfa1c62f7d1e..8b39bdd262b4 100644
> --- a/sound/pci/ctxfi/ctpcm.h
> +++ b/sound/pci/ctxfi/ctpcm.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	ctpcm.h
> diff --git a/sound/pci/ctxfi/ctresource.c b/sound/pci/ctxfi/ctresource.c
> index 6d0a01b189e1..81ad26934518 100644
> --- a/sound/pci/ctxfi/ctresource.c
> +++ b/sound/pci/ctxfi/ctresource.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	ctresource.c
> diff --git a/sound/pci/ctxfi/ctresource.h b/sound/pci/ctxfi/ctresource.h
> index 93e47488a1c1..fdbfd808816d 100644
> --- a/sound/pci/ctxfi/ctresource.h
> +++ b/sound/pci/ctxfi/ctresource.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	ctresource.h
> diff --git a/sound/pci/ctxfi/ctsrc.c b/sound/pci/ctxfi/ctsrc.c
> index 37c18ce84974..bd4697b44233 100644
> --- a/sound/pci/ctxfi/ctsrc.c
> +++ b/sound/pci/ctxfi/ctsrc.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	ctsrc.c
> diff --git a/sound/pci/ctxfi/ctsrc.h b/sound/pci/ctxfi/ctsrc.h
> index 1204962280c8..1124daf50c9b 100644
> --- a/sound/pci/ctxfi/ctsrc.h
> +++ b/sound/pci/ctxfi/ctsrc.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File	ctsrc.h
> diff --git a/sound/pci/ctxfi/ctvmem.c b/sound/pci/ctxfi/ctvmem.c
> index bde28aa9e139..7a805c4a58e1 100644
> --- a/sound/pci/ctxfi/ctvmem.c
> +++ b/sound/pci/ctxfi/ctvmem.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File    ctvmem.c
> diff --git a/sound/pci/ctxfi/ctvmem.h b/sound/pci/ctxfi/ctvmem.h
> index 54818a3c245d..da54cbcdb0be 100644
> --- a/sound/pci/ctxfi/ctvmem.h
> +++ b/sound/pci/ctxfi/ctvmem.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * Copyright (C) 2008, Creative Technology Ltd. All Rights Reserved.
>   *
>   * @File    ctvmem.h
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
