Return-Path: <SRS0=ZuYk=KS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110ECC4707A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 08:11:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40DB761261
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 08:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40DB761261
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=remlab.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 027AE4040B;
	Sun, 23 May 2021 08:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2SSeF5Iuvm3; Sun, 23 May 2021 08:11:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA14240402;
	Sun, 23 May 2021 08:11:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDBE8C000E;
	Sun, 23 May 2021 08:11:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCCBDC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 08:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AED60400CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 08:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DhVJKN4DhzCh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 08:11:09 +0000 (UTC)
X-Greylist: delayed 22:35:55 by SQLgrey-1.8.0
Received: from ursule.remlab.net (vps-a2bccee9.vps.ovh.net
 [IPv6:2001:41d0:305:2100::8a0c])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85019400FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 08:11:09 +0000 (UTC)
Received: from philogene.localnet (localhost [IPv6:::1])
 by ursule.remlab.net (Postfix) with ESMTP id 14100C2C68;
 Sun, 23 May 2021 11:11:07 +0300 (EEST)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH v2] Phonet: fix kernel-doc syntax in file headers and
 remove file names
Date: Sun, 23 May 2021 11:11:06 +0300
Message-ID: <1794881.Lfz63IBmft@philogene>
Organization: Remlab Tmi
In-Reply-To: <20210522113408.8766-1-yashsri421@gmail.com>
References: <52313028.m8L9TnScQ9@philogene>
 <20210522113408.8766-1-yashsri421@gmail.com>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, courmisch@gmail.com,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Le samedi 22 mai 2021, 14:34:08 EEST Aditya Srivastava a =E9crit :
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> For e.g., the header for include/linux/phonet.h follows this syntax, but
> the content inside does not comply with kernel-doc.
> =

> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc:
> warning: This comment starts with '/**', but isn't a kernel-doc comment.
> Refer Documentation/doc-guide/kernel-doc.rst * file phonet.h
> =

> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> =

> Also remove the redundant file name from the comment headers.
> =

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: R=E9mi Denis-Courmont <courmisch@gmail.com>

> ---
> Changes in v2:
> - Remove file name information from comment headers as well, as suggested=
 by
> Randy and Remi
> =

>  include/linux/phonet.h      | 4 +---
>  include/uapi/linux/phonet.h | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> =

> diff --git a/include/linux/phonet.h b/include/linux/phonet.h
> index bc7d1e529efc..6117a0e462d3 100644
> --- a/include/linux/phonet.h
> +++ b/include/linux/phonet.h
> @@ -1,7 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> - * file phonet.h
> - *
> +/*
>   * Phonet sockets kernel interface
>   *
>   * Copyright (C) 2008 Nokia Corporation. All rights reserved.
> diff --git a/include/uapi/linux/phonet.h b/include/uapi/linux/phonet.h
> index a2f6b37a5937..e7e14b5e59c6 100644
> --- a/include/uapi/linux/phonet.h
> +++ b/include/uapi/linux/phonet.h
> @@ -1,7 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -/**
> - * file phonet.h
> - *
> +/*
>   * Phonet sockets kernel interface
>   *
>   * Copyright (C) 2008 Nokia Corporation. All rights reserved.


-- =

R=E9mi Denis-Courmont


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
