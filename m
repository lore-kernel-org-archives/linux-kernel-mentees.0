Return-Path: <SRS0=Bfkk=I4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3207CC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 21:20:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D13DC619B1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 21:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D13DC619B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97560403A4;
	Tue, 30 Mar 2021 21:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAUaCfJ4K5c7; Tue, 30 Mar 2021 21:20:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD2E140399;
	Tue, 30 Mar 2021 21:20:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7F07C000C;
	Tue, 30 Mar 2021 21:20:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C67AAC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B53D060877
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8Lya64TiOYM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:20:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB00360712
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 21:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=nGIouhZDUCYWUhXG6ttkQe/9Kl8gmJMxUxdH8264KVo=; b=rhrp1SxlUOXQVkBAatku9ZeQaD
 UF7YnSaF5xAgKOeSuK03fVKOS3StQ5eGvKvheN3brOwjXzEYNGgEpLsRIsOurmCTqo3dje9wSy0NI
 q3LKxPFfgggmOjSISRMiCEt/KF0cnXWk33H3943IIa9oKpd/ZIZzgJicrv8hvEqsJcEBeH7fh4qxl
 Oth16IXUdRaoIn8MHuYfEb8U8oSjxkhMVtA9NezZSbOxeJe6oRoqlHHS5sDPpxLCUHQzsEEmLbAWz
 cJ0oRedqRswhSdGxEaVeHkvOzSMnU5KfhlKQO0ArFR7NQL16M7wvwW0vJ8gS5cm5xiYqXYlJUYV1G
 As213jUg==;
Received: from [2601:1c0:6280:3f0::4557]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lRLmZ-003ckU-Qs; Tue, 30 Mar 2021 21:20:19 +0000
Subject: Re: [PATCH] x86/sgx: fix incorrect kernel-doc comment syntax in files
To: Aditya Srivastava <yashsri421@gmail.com>, linux-kernel@vger.kernel.org
References: <20210330211813.28030-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2449c5b6-852f-4e8e-6d71-3308938b12e0@infradead.org>
Date: Tue, 30 Mar 2021 14:20:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210330211813.28030-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: x86@kernel.org, linux-doc@vger.kernel.org, dave.hansen@linux.intel.com,
 jarkko@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 tglx@linutronix.de, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-sgx@vger.kernel.org
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

On 3/30/21 2:18 PM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are certain files in arch/x86/kernel/cpu/sgx, which follow this
> syntax, but the content inside does not comply with kernel-doc.
> Such lines were probably not meant for kernel-doc parsing, but are parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc.
> 
> E.g., presence of kernel-doc like comment in the header lines for
> arch/x86/kernel/cpu/sgx/encl.h causes this warning:
> "warning: expecting prototype for 2016(). Prototype was for _X86_ENCL_H() instead"
> 
> Similarly for arch/x86/kernel/cpu/sgx/arch.h too.
> 
> Provide a simple fix by replacing these occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> * Applies perfectly on next-20210326
> 
>  arch/x86/kernel/cpu/sgx/arch.h | 2 +-
>  arch/x86/kernel/cpu/sgx/encl.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/sgx/arch.h b/arch/x86/kernel/cpu/sgx/arch.h
> index 26315bea1cb4..70b84bbdaa1d 100644
> --- a/arch/x86/kernel/cpu/sgx/arch.h
> +++ b/arch/x86/kernel/cpu/sgx/arch.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -/**
> +/*
>   * Copyright(c) 2016-20 Intel Corporation.
>   *
>   * Contains data structures defined by the SGX architecture.  Data structures
> diff --git a/arch/x86/kernel/cpu/sgx/encl.h b/arch/x86/kernel/cpu/sgx/encl.h
> index d8d30ccbef4c..76b9bc1c5c30 100644
> --- a/arch/x86/kernel/cpu/sgx/encl.h
> +++ b/arch/x86/kernel/cpu/sgx/encl.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -/**
> +/*
>   * Copyright(c) 2016-20 Intel Corporation.
>   *
>   * Contains the software defined data structures for enclaves.
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
