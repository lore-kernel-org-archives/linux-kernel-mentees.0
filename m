Return-Path: <SRS0=hd2V=KR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB777C4707E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 15:11:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5553860FE5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 15:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5553860FE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C66E605EA;
	Sat, 22 May 2021 15:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXF8-T8FfCE9; Sat, 22 May 2021 15:11:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36C47605D5;
	Sat, 22 May 2021 15:11:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14124C000D;
	Sat, 22 May 2021 15:11:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 310A5C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 15:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EB88404C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 15:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gVRdJ201bJE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 15:11:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39994404BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=aHoWqS6wBA7auWs741xKAHDKHGtZ/8QwNVQ3vHvVUzU=; b=0DHTjS7S9U1aCaxLl0zaAQ+GZi
 gkqH0xt5ITJJJproyTzuKh0voqLTDx706Afp/xjqt0WrLtQhQgpJDzaRYFpdg7+EbV49nfVab+gPW
 lGytLrSM/EKenAQLWXlfa+CrMe4P99Ou2Pei7coiJg6oTGe4BYSzGVA1m8DFSdHXB98AW0k0kaPqm
 hkRpchh+bLeVfX6FHHeQq98PMYlRVJHwnnsJ+YJXtjDit8B6QeKbHIsBBtSMqnZOWJ4KqVAu2yor2
 tDKg6X7rWB2iWkd6wxuQs7zoeaZN1f19r2/k99JeKxpgPChvCgZCliOixelQOFZJ/7S8Z2x/sPkmT
 MWsElMdQ==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lkTHv-0008c4-C4; Sat, 22 May 2021 15:11:39 +0000
Subject: Re: [PATCH] ipac: tpci200: fix kernel-doc syntax and remove filename
 from file header
To: Aditya Srivastava <yashsri421@gmail.com>, siglesias@igalia.com
References: <20210522124051.12540-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a6e13d99-d08c-cc4d-d159-6aba5a2dca09@infradead.org>
Date: Sat, 22 May 2021 08:11:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210522124051.12540-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, jens.taprogge@taprogge.org,
 linux-kernel@vger.kernel.org, industrypack-devel@lists.sourceforge.net,
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

On 5/22/21 5:40 AM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for drivers/ipack/carriers/tpci200 follows this syntax, but the
> content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc.
> 
> For e.g., running scripts/kernel-doc -none on
> drivers/ipack/carriers/tpci200.c emits:
> warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * tpci200.c
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Also remove the redundant file name from the comment headers.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/ipack/carriers/tpci200.c | 4 +---
>  drivers/ipack/carriers/tpci200.h | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/ipack/carriers/tpci200.c b/drivers/ipack/carriers/tpci200.c
> index ec71063fff76..a867906777bd 100644
> --- a/drivers/ipack/carriers/tpci200.c
> +++ b/drivers/ipack/carriers/tpci200.c
> @@ -1,7 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> - * tpci200.c
> - *
> +/*
>   * driver for the TEWS TPCI-200 device
>   *
>   * Copyright (C) 2009-2012 CERN (www.cern.ch)
> diff --git a/drivers/ipack/carriers/tpci200.h b/drivers/ipack/carriers/tpci200.h
> index 2619f827e33f..e79ac64abcff 100644
> --- a/drivers/ipack/carriers/tpci200.h
> +++ b/drivers/ipack/carriers/tpci200.h
> @@ -1,7 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> - * tpci200.h
> - *
> +/*
>   * driver for the carrier TEWS TPCI-200
>   *
>   * Copyright (C) 2009-2012 CERN (www.cern.ch)
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
