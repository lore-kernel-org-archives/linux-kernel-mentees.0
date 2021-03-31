Return-Path: <SRS0=BNqc=I5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2EEC433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 31 Mar 2021 02:56:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A2B619CF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 31 Mar 2021 02:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53A2B619CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18E8E4062E;
	Wed, 31 Mar 2021 02:56:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0lKkIKXViyzJ; Wed, 31 Mar 2021 02:56:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1733D4062F;
	Wed, 31 Mar 2021 02:56:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0690C000B;
	Wed, 31 Mar 2021 02:56:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCF8FC000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Mar 2021 02:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8BDA4021B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Mar 2021 02:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dmarBjR1Woy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Mar 2021 02:56:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2622A40002
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Mar 2021 02:56:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C159619D8;
 Wed, 31 Mar 2021 02:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617159380;
 bh=u773bDbsKRyPswjZDFIZbgSjt0NBivr0gD8iiCtpke0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=atRZlUClz2KWQhd2L7kr8ViPVzNOyxB7TFuVTEz33kBF3GObAwPE4tSucGLgYpMEJ
 dgFTw4zsx3RclH0+S5IkneNsawvFPqtZOTb+UCJrXY2KuhSenPdW6/4PaP8+bXhljE
 qmHRzfaGB863IsXwKCHmw6V8gVidqRLKgx5Cus5PXItXhrKzmyUi75s3sQ/tmFriIU
 R7h2fd+cjKBYsCxWHgXzHW4EqO94ZOwgfPU6xHOxkjF7Gtk8pOiEJCKT1v6EonieAW
 vUM2+KQsdJnLgVklRQXB6Yhs0z5O1WqHW5833hY2Mp7HmqTvngobWS5tBelHCXQ8t5
 J/4Z5dspEhXiA==
Date: Wed, 31 Mar 2021 05:56:18 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] x86/sgx: fix incorrect kernel-doc comment syntax in files
Message-ID: <YGPk0h8OikOdRnyb@kernel.org>
References: <20210330211813.28030-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330211813.28030-1-yashsri421@gmail.com>
Cc: x86@kernel.org, dave.hansen@linux.intel.com, linux-doc@vger.kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-sgx@vger.kernel.org
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

On Wed, Mar 31, 2021 at 02:48:13AM +0530, Aditya Srivastava wrote:
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
> -- 
> 2.17.1
> 
> 

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
