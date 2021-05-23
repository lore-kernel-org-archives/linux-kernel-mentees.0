Return-Path: <SRS0=ZuYk=KS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94415C4707A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 16:08:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2815461166
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 16:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2815461166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D17304040F;
	Sun, 23 May 2021 16:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IImHSK4KgKtS; Sun, 23 May 2021 16:08:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F15403F9;
	Sun, 23 May 2021 16:08:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 935C6C000E;
	Sun, 23 May 2021 16:08:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7057C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 16:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABE8B83417
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 16:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZA0hCZ6Aan32
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 16:08:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CBE483410
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=YjMoxwr94CpOc6dJiHNAtzWBKsQW76MYcER0tgF7dRY=; b=L2/bywvmr7ZsZ1/cyT7PkdwupN
 RGX3WtpVC2pg0i+Dq2HdrHNvkJGjMww5w/mRYeY/gy0uEzieVbO1govHtQsdcir4/Jyao0dx9Hpz+
 tQ0EI5xejPMftoarc/gq7BpldSTZ6fRSapPYNSSvYeB0hnkQoF7csoPx8oMU9rFv8GRAEPIR8uuKl
 9GYuuhcSPdhq8jWgoXftBTI3UPzd7XhvRAllRohxe3KQZJSlnioAIn5ayRm8i78dnuauRUyhvdRpi
 hW2Sif7rQGvVp5/mxypsj8lUQ4G+y/1r/emgzQwfjMTE2HMSuEyx1tcI9o83+vNvGOpKNlLspY1VN
 caGVyoJQ==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lkqdv-000UQ5-NX; Sun, 23 May 2021 16:07:55 +0000
Subject: Re: [PATCH v2] samples: bpf: ix kernel-doc syntax in file header
To: Aditya Srivastava <yashsri421@gmail.com>, kafai@fb.com
References: <20210523150917.21748-1-yashsri421@gmail.com>
 <20210523151408.22280-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <33cd99d5-8d4a-df36-8ab0-e68da879aa69@infradead.org>
Date: Sun, 23 May 2021 09:07:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210523151408.22280-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: songliubraving@fb.com, daniel@iogearbox.net, linux-doc@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org, john.fastabend@gmail.com,
 linux-kernel@vger.kernel.org, ast@kernel.org, jgg@ziepe.ca,
 dledford@redhat.com, yhs@fb.com, andrii@kernel.org, bpf@vger.kernel.org,
 kpsingh@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On 5/23/21 8:14 AM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for samples/bpf/ibumad_kern.c follows this syntax, but
> the content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc:
> warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * ibumad BPF sample kernel side
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Changes in v2: Include changes for both, samples/bpf/ibumad_kern.c and samples/bpf/ibumad_user.c in the same patch
> 
>  samples/bpf/ibumad_kern.c | 2 +-
>  samples/bpf/ibumad_user.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/samples/bpf/ibumad_kern.c b/samples/bpf/ibumad_kern.c
> index 26dcd4dde946..9b193231024a 100644
> --- a/samples/bpf/ibumad_kern.c
> +++ b/samples/bpf/ibumad_kern.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
>  
> -/**
> +/*
>   * ibumad BPF sample kernel side
>   *
>   * This program is free software; you can redistribute it and/or
> diff --git a/samples/bpf/ibumad_user.c b/samples/bpf/ibumad_user.c
> index d83d8102f489..0746ca516097 100644
> --- a/samples/bpf/ibumad_user.c
> +++ b/samples/bpf/ibumad_user.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
>  
> -/**
> +/*
>   * ibumad BPF sample user side
>   *
>   * This program is free software; you can redistribute it and/or
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
