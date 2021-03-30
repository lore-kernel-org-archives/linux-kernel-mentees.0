Return-Path: <SRS0=Bfkk=I4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78629C433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 21:03:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1582D6199A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 21:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1582D6199A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC26840576;
	Tue, 30 Mar 2021 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kFZEf6YdHq3k; Tue, 30 Mar 2021 21:03:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 715CF40572;
	Tue, 30 Mar 2021 21:03:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA24DC000B;
	Tue, 30 Mar 2021 21:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DF18C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9879760873
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id blGDC8WD0-Th
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:03:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFEF860727
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=HUbATrNsHGZOy4VwMo16gFCkoyooGCF07RUQqafwLSU=; b=hPiYumTyzR5xFL+xzKLpGdYZzm
 FIY8lNix7wKiNQxDSphpiBA0G8QB2C1OZTOmHaK8r+r+QtLMsjBZFo+/eOEhmwvOTlJVMIPxqiXbW
 YjgACTw+p+u7KkRFLIylBbHp1NiuVeCKjpSSJ3EMSTUsA9eZNeW3w1Muq2Ku/EY9tsk/nJV31ykpU
 +Ll8gzgH9eQYuGMC2XmyFb46zxs2aqCkIeN2OOr3G450UxGbj4stz1tNc5RrKkxG2DNgHbBNJTdAu
 h04PRgUJfXb3Kl43kDlFNYnxHQ51QWk35c3VDW8Ibt7nAxXi2zNl5Ekock1z81XbD1XPY0qnVGPym
 M61MzbQw==;
Received: from [2601:1c0:6280:3f0::4557]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lRLVl-003bQT-GV; Tue, 30 Mar 2021 21:02:57 +0000
Subject: Re: [PATCH] ARM: mach-sa1100: fix incorrect kernel-doc comment syntax
 in file
To: Aditya Srivastava <yashsri421@gmail.com>, linux@armlinux.org.uk
References: <20210330204407.25690-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1fc5b958-da00-3f0f-5db0-b32cd129fd4f@infradead.org>
Date: Tue, 30 Mar 2021 14:02:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210330204407.25690-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
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

On 3/30/21 1:44 PM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for arch/arm/mach-sa1100/jornada720_ssp.c follows this syntax,
> but the content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes these warnings from kernel-doc:
> "warning: Function parameter or member 'jornada_ssp_lock' not described in 'DEFINE_SPINLOCK'"
> "warning: expecting prototype for mac(). Prototype was for DEFINE_SPINLOCK() instead"
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> * Applies perfectly on next-20210326
> 
>  arch/arm/mach-sa1100/jornada720_ssp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-sa1100/jornada720_ssp.c b/arch/arm/mach-sa1100/jornada720_ssp.c
> index 1dbe98948ce3..148bcee3ee58 100644
> --- a/arch/arm/mach-sa1100/jornada720_ssp.c
> +++ b/arch/arm/mach-sa1100/jornada720_ssp.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   *  arch/arm/mac-sa1100/jornada720_ssp.c
>   *
>   *  Copyright (C) 2006/2007 Kristoffer Ericson <Kristoffer.Ericson@gmail.com>
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
