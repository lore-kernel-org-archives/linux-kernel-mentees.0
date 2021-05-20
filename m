Return-Path: <SRS0=G2n4=KP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9AEC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 18:30:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6D09611AB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 18:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6D09611AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89DE48443E;
	Thu, 20 May 2021 18:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x2ruM_E2Dqsb; Thu, 20 May 2021 18:30:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B3BA8442A;
	Thu, 20 May 2021 18:30:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28082C000E;
	Thu, 20 May 2021 18:30:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4556AC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32F1F40F36
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WpAWzptjq2Zg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:30:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAFDB40F25
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 18:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=agiakZtvhMa1O9T2XzsnpNjO6uMLLfnHhIvJ8sxlh1Y=; b=Ew5DIjR56nVHadIx3pywARpTvd
 Kgq0VyI+O62d0VLyFLIu4w7CjQvihMOMTaRgdL8VG7HB0i6DOjHbQxlwccFvsRL6HlnU87Kle5NKO
 T/EvFNAW3TnfAReeo8nt1ucuvPbyUmN5KKzlmEI/Nbie6KLnfjxukn2+fTEL7ic/44bk/PK5pnYW6
 6eF40guPIS7n/zLzzE+mrKkKw7N0FSq9BObMkmzj1B6W7Mdn9CDYem5oEFLFi0RNu1vQSLlwkNaVK
 lm7gK8J0uTRyq/zLQa0fmnnqamK5wzCi3XycoZ+rz1lsaWlkTcgZ3o8T8BxPLEl5gbVjTih08AIF/
 OMutOsyA==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljnRJ-00GZgm-Jd; Thu, 20 May 2021 18:30:33 +0000
Subject: Re: [PATCH] Phonet: fix kernel-doc syntax in file headers
To: Aditya Srivastava <yashsri421@gmail.com>, courmisch@gmail.com
References: <20210520182159.31462-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7cb9bfad-55b1-b5f3-5051-a2e837dda736@infradead.org>
Date: Thu, 20 May 2021 11:30:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210520182159.31462-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

On 5/20/21 11:21 AM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for include/*/linux/phonet.h files follows this syntax, but
> the content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc.
> For e.g., running scripts/kernel-doc -none include/linux/phonet.h emits:
> warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * file phonet.h
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Hi,
This all looks good, but it would be even better to remove
the file names. We tend to prefer not to have filenames in their files
because they get moved or renamed -- and because it's redundant info.

Anyway,
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  include/linux/phonet.h      | 2 +-
>  include/uapi/linux/phonet.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/phonet.h b/include/linux/phonet.h
> index bc7d1e529efc..09ecb1f94c5e 100644
> --- a/include/linux/phonet.h
> +++ b/include/linux/phonet.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/**
> +/*
>   * file phonet.h
>   *
>   * Phonet sockets kernel interface
> diff --git a/include/uapi/linux/phonet.h b/include/uapi/linux/phonet.h
> index a2f6b37a5937..6b873c460994 100644
> --- a/include/uapi/linux/phonet.h
> +++ b/include/uapi/linux/phonet.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -/**
> +/*
>   * file phonet.h
>   *
>   * Phonet sockets kernel interface
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
