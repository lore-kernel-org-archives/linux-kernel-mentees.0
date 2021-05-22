Return-Path: <SRS0=hd2V=KR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3CEC2B9F2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 15:09:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA8A460FE5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 15:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA8A460FE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 779094043C;
	Sat, 22 May 2021 15:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9COEop7drRv; Sat, 22 May 2021 15:09:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA3414043A;
	Sat, 22 May 2021 15:09:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E210C000D;
	Sat, 22 May 2021 15:09:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84F49C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 15:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ACE7605D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 15:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xc7ACJGjkwuI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 15:09:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33F98605D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=GH2mOBNX+XONeUL9wOPO8w6Hzq2geF/gsdvnEgGHARM=; b=o5QiuCeOylxsThRB1fFFONEBmd
 iseDMDCLETC5yuMhVcyMlEGS9GgTDYIDwCrzfsVF0ACYBV04jmz4YsLf90/94OFy9iVg3woixW318
 K1HX9VYV3pavqhVdPW4psXdCZM5keZFvhAF+q+7VtSVmKxf5VSwyXXb2JOyno3U0GxFU9mQtwAv4r
 Am+R6q6Ykbsq+lgcq9q1EyS97r9wZ1sAdBrM1XWOfvD1kMjAd+dUOljKICg1O5ZtzwpErn9J0zFjH
 rptEH0qGhRGnufMxhb9f9TP9ySbH/Y+hDl78OY0c/doCtWiDbgoQrwMlWHBTycrohrGjI/FKMMx4y
 xFRxdLUA==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lkTGA-0008Zi-If; Sat, 22 May 2021 15:09:50 +0000
Subject: Re: [PATCH] USB: gadget: udc: fix kernel-doc syntax in file headers
To: Aditya Srivastava <yashsri421@gmail.com>, balbi@kernel.org
References: <20210522115227.9977-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4869ba22-58e0-e101-c0df-51816abd0da9@infradead.org>
Date: Sat, 22 May 2021 08:09:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210522115227.9977-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On 5/22/21 4:52 AM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for drivers/usb/gadget/udc/trace files follows this syntax, but
> the content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc.
> For e.g., running scripts/kernel-doc -none drivers/usb/gadget/udc/trace.h
> emits:
> warning: expecting prototype for udc.c(). Prototype was for TRACE_SYSTEM() instead
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/usb/gadget/udc/trace.c | 2 +-
>  drivers/usb/gadget/udc/trace.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/trace.c b/drivers/usb/gadget/udc/trace.c
> index 7430624c0bd7..19e837de2a20 100644
> --- a/drivers/usb/gadget/udc/trace.c
> +++ b/drivers/usb/gadget/udc/trace.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*
>   * trace.c - USB Gadget Framework Trace Support
>   *
>   * Copyright (C) 2016 Intel Corporation
> diff --git a/drivers/usb/gadget/udc/trace.h b/drivers/usb/gadget/udc/trace.h
> index 2d1f68b5ea76..98584f6b6c66 100644
> --- a/drivers/usb/gadget/udc/trace.h
> +++ b/drivers/usb/gadget/udc/trace.h
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*
>   * udc.c - Core UDC Framework
>   *
>   * Copyright (C) 2016 Intel Corporation
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
