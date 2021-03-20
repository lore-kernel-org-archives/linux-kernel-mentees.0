Return-Path: <SRS0=sDOq=IS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A15C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 20:28:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DABEE6193B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 20:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DABEE6193B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4EDF60703;
	Sat, 20 Mar 2021 20:28:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiQ4fQ1Ei1W8; Sat, 20 Mar 2021 20:28:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9F18605E1;
	Sat, 20 Mar 2021 20:28:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 934F2C000A;
	Sat, 20 Mar 2021 20:28:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC912C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 20:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C369F835FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 20:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_lCYr7I1ys5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 20:28:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2515A835EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 20:28:13 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so6541047pjv.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 13:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MtDPAYRcgoKhNvOnwBKVTpKGnkV7Ny1myKZl3a7aiQ8=;
 b=B2v6SY+HsDx9ccRoO6D9UCFgTWML5p+hgle+Qfn5s+VI6nkSKKAf5dN3EZLDOSq45y
 JQ8n+hDSJ9ZNr8yFLPF6iMf8vdkvwpRmQwQzdKyZdY5JKL33kfpQYhRc6VzXCk28g6g+
 3V3UF6RHrEx/td0xtfiAxYietGeJv3OaaVRzp+xdUx7tXdBerQ/R2fBHHckpNV8iyJAz
 3jN01lzuKqRMz9JCxFaj9YWm4Ikm+1Z9LcTFRmXEqF6N8T07vOQPwlc+T5fBdPV+g/N2
 A5s2dN8F3EHP6fOtEVQekCYjPyPogYSa9c59nM0PZC6Zxn1IcKCsf1bF7Rpf6o0TmZ2a
 wfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MtDPAYRcgoKhNvOnwBKVTpKGnkV7Ny1myKZl3a7aiQ8=;
 b=jqJagEnZfF3IEgYY5MFuC+4B6FPfyTCQv2j2DDKwBwd0+hVYn27fXUlFMjnK79JsG1
 ITi+MoRcIfMSgfvB0AMW/dj9NQ6FACYjiTAQxSetif9fIcEfUndnp3eBC+n9livthcoP
 3ahoVFMsmt1yg4dYZeTCpJogLrKbKpwJuSIoD2w31Kk+K0dQM4NoBXnLkfAga/fcg8b7
 932WyYtL1XHCQLHV+k6bvDaNDPFE9M6C5wliGkRhKe/R9NO/hXCx5NATtkOj4dLnzhZS
 LQElFHa1P+ytFDKr4omMUY7JeT2ylP+XGqqZUyKY7RN9jCXOa/hzCkgdgWICWur5pSoN
 SMug==
X-Gm-Message-State: AOAM5325y04E1XQWfimv2T0pIIkboDOHOWBiOVhnlcNHDBux7L+0eZu8
 LnQC6BKIxpfXqc8OrmrwxWrGLU/xjSTVSPdH
X-Google-Smtp-Source: ABdhPJx+71NFrbGHHoMBI5knJo6F/9a3vuxkvx3NzJyyJOzsyExNZHv+lrSOdAjjeYx8tcx0vXiF1w==
X-Received: by 2002:a17:90b:e18:: with SMTP id
 ge24mr5081723pjb.199.1616272092382; 
 Sat, 20 Mar 2021 13:28:12 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a089:1ce8:18d9:6e3d:8c29?
 ([2405:201:600d:a089:1ce8:18d9:6e3d:8c29])
 by smtp.gmail.com with ESMTPSA id gi21sm8458910pjb.2.2021.03.20.13.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 13:28:12 -0700 (PDT)
Subject: Re: [PATCH] crypto: vmx: fix incorrect kernel-doc comment syntax in
 files
To: leitao@debian.org
References: <20210320202053.12328-1-yashsri421@gmail.com>
From: Aditya Srivastava <yashsri421@gmail.com>
Message-ID: <f65360a3-1947-8c7c-275e-6d052826277d@gmail.com>
Date: Sun, 21 Mar 2021 01:58:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210320202053.12328-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: rdunlap@infradead.org, linux-kernel-mentees@lists.linuxfoundation.org,
 corbet@lwn.net
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

On 21/3/21 1:50 am, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are certain files in drivers/crypto/vmx, which follow this syntax,
> but the content inside does not comply with kernel-doc.
> Such lines were probably not meant for kernel-doc parsing, but are parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc.
> 
> E.g., presence of kernel-doc like comment in the header line for
> drivers/crypto/vmx/vmx.c causes this warning by kernel-doc:
> 
> "warning: expecting prototype for Routines supporting VMX instructions on the Power 8(). Prototype was for p8_init() instead"
> 
> Similarly for other files too.
> 
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> * Applies perfectly on next-20210319
> 
>  drivers/crypto/vmx/aes.c     | 2 +-
>  drivers/crypto/vmx/aes_cbc.c | 2 +-
>  drivers/crypto/vmx/aes_ctr.c | 2 +-
>  drivers/crypto/vmx/aes_xts.c | 2 +-
>  drivers/crypto/vmx/ghash.c   | 2 +-
>  drivers/crypto/vmx/vmx.c     | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/crypto/vmx/aes.c b/drivers/crypto/vmx/aes.c
> index d05c02baebcf..ec06189fbf99 100644
> --- a/drivers/crypto/vmx/aes.c
> +++ b/drivers/crypto/vmx/aes.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * AES routines supporting VMX instructions on the Power 8
>   *
>   * Copyright (C) 2015 International Business Machines Inc.
> diff --git a/drivers/crypto/vmx/aes_cbc.c b/drivers/crypto/vmx/aes_cbc.c
> index d88084447f1c..ed0debc7acb5 100644
> --- a/drivers/crypto/vmx/aes_cbc.c
> +++ b/drivers/crypto/vmx/aes_cbc.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * AES CBC routines supporting VMX instructions on the Power 8
>   *
>   * Copyright (C) 2015 International Business Machines Inc.
> diff --git a/drivers/crypto/vmx/aes_ctr.c b/drivers/crypto/vmx/aes_ctr.c
> index 79ba062ee1c1..9a3da8cd62f3 100644
> --- a/drivers/crypto/vmx/aes_ctr.c
> +++ b/drivers/crypto/vmx/aes_ctr.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * AES CTR routines supporting VMX instructions on the Power 8
>   *
>   * Copyright (C) 2015 International Business Machines Inc.
> diff --git a/drivers/crypto/vmx/aes_xts.c b/drivers/crypto/vmx/aes_xts.c
> index 9fee1b1532a4..dabbccb41550 100644
> --- a/drivers/crypto/vmx/aes_xts.c
> +++ b/drivers/crypto/vmx/aes_xts.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * AES XTS routines supporting VMX In-core instructions on Power 8
>   *
>   * Copyright (C) 2015 International Business Machines Inc.
> diff --git a/drivers/crypto/vmx/ghash.c b/drivers/crypto/vmx/ghash.c
> index 14807ac2e3b9..5bc5710a6de0 100644
> --- a/drivers/crypto/vmx/ghash.c
> +++ b/drivers/crypto/vmx/ghash.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*
>   * GHASH routines supporting VMX instructions on the Power 8
>   *
>   * Copyright (C) 2015, 2019 International Business Machines Inc.
> diff --git a/drivers/crypto/vmx/vmx.c b/drivers/crypto/vmx/vmx.c
> index a40d08e75fc0..7eb713cc87c8 100644
> --- a/drivers/crypto/vmx/vmx.c
> +++ b/drivers/crypto/vmx/vmx.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * Routines supporting VMX instructions on the Power 8
>   *
>   * Copyright (C) 2015 International Business Machines Inc.
> 

Please excuse this mail. My --cc-cmd did not work as expected, as a
result the mail wasn't sent to everyone.
I resent the patch with everyone Cc'd.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
