Return-Path: <SRS0=6b0c=JI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FE5C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Apr 2021 16:04:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F39860C3D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Apr 2021 16:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F39860C3D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AE82831DB;
	Sun, 11 Apr 2021 16:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7G5UiA3WGzHZ; Sun, 11 Apr 2021 16:04:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FC9F83123;
	Sun, 11 Apr 2021 16:04:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D7CAC000B;
	Sun, 11 Apr 2021 16:04:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B7C4C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Apr 2021 16:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12C774030E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Apr 2021 16:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJMKeK9xxKKt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Apr 2021 16:04:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDBD24029C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Apr 2021 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=OfYeXEbcZ2dQLXe32NAiMreYt7e+j2YilXYgYD7vcYM=; b=wJnQe9XDsqBi47Cv39rJhU6S8L
 q3CvSKCWWgj/BFOQ1TuwfakZGrXuGlaH8VkKR0jtDZ18aqx/eGe3MGZ8IqS2NdU37GbQDkLu3KTj2
 pi/annc4J68zHWeWKa+zkN1tkviKkW/THTKhpkQalt+4vr0sSoAhPUDyE/FjdrWlrg8/FBOY1zADi
 gXp9BTnp58YalRmnZwApQTf8PvT1eqeyjRhKUF5n/0gpP7l458s96fJnIVtDUP0Sp8IatyhGof8Pe
 84PgfgxcGbSxsA8Tu4RwnKz55gV03FmShQCOFZbzi3D9De9iXx1eRok1CwpKmUzpVWorDlQkUwD7v
 YOxe3RHA==;
Received: from [2601:1c0:6280:3f0::e0e1]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lVcZk-0039xe-EG; Sun, 11 Apr 2021 16:04:42 +0000
Subject: Re: [PATCH] PCI: endpoint: fix incorrect kernel-doc comment syntax
To: Aditya Srivastava <yashsri421@gmail.com>, bhelgaas@google.com
References: <20210411101508.11065-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <42f7fe6e-6f53-5572-f3e0-0dfd0e3d921b@infradead.org>
Date: Sun, 11 Apr 2021 09:04:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210411101508.11065-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
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

On 4/11/21 3:15 AM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are certain files in include/linux/pci*, which follow this syntax,
> but the content inside does not comply with kernel-doc.
> Such lines were probably not meant for kernel-doc parsing, but are parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc.
> 
> E.g., presence of kernel-doc like comment in include/linux/pci-ep-cfs.h at
> header causes this warnings by kernel-doc:
> "warning: expecting prototype for PCI Endpoint ConfigFS header file(). Prototype was for __LINUX_PCI_EP_CFS_H() instead"
> 
> Similarly for other files too.
> 
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  include/linux/pci-ep-cfs.h | 2 +-
>  include/linux/pci-epc.h    | 2 +-
>  include/linux/pci-epf.h    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/pci-ep-cfs.h b/include/linux/pci-ep-cfs.h
> index 662881335c7e..3e2140d7e31d 100644
> --- a/include/linux/pci-ep-cfs.h
> +++ b/include/linux/pci-ep-cfs.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0+ */
> -/**
> +/*
>   * PCI Endpoint ConfigFS header file
>   *
>   * Copyright (C) 2017 Texas Instruments
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index b82c9b100e97..80197a6df371 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -/**
> +/*
>   * PCI Endpoint *Controller* (EPC) header file
>   *
>   * Copyright (C) 2017 Texas Instruments
> diff --git a/include/linux/pci-epf.h b/include/linux/pci-epf.h
> index 6833e2160ef1..c43912b1d2d0 100644
> --- a/include/linux/pci-epf.h
> +++ b/include/linux/pci-epf.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -/**
> +/*
>   * PCI Endpoint *Function* (EPF) header file
>   *
>   * Copyright (C) 2017 Texas Instruments
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
