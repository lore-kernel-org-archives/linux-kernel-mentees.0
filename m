Return-Path: <SRS0=auPP=PI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F78C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Oct 2021 13:24:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91CFB6136F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Oct 2021 13:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91CFB6136F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FE02817EB;
	Wed, 20 Oct 2021 13:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21SG2fm0gsTx; Wed, 20 Oct 2021 13:24:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2E65B80EA0;
	Wed, 20 Oct 2021 13:24:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06DB9C000F;
	Wed, 20 Oct 2021 13:24:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F26E2C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE60480EA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Fy7B8FGZ2bE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:24:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A39BF80E8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:24:32 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 l24-20020a9d1c98000000b00552a5c6b23cso8184146ota.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 06:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RNWWP9bTOkCgW0tcCeT8WC0sybKGetWwgWvpGMhElmI=;
 b=FSz3TX6r4c3s5zrGtOB5a8dgeJsZtTaz0CL0KTBnuncxyrXVOlgKuAXhVIEqd+ZHj+
 BTGh7tn5cFAynZwec3FzlYNdPzriCCmJMLjarhZuV+7prpyXY/JgNqAo7VY0lObhXYh2
 zStJAaOT9VrOvi7BubLDV9WwHkEbuoMphGS7QmodNjZ8FRE8MpijrbUK9llyIsOpaKQ4
 jMRzYFiDpxSbSOBs+o8vdWo4znh6HwFkOWNfLh0nFlwEGSuB5UhLWVesHJ4LrVgxtn+e
 zxVGGiva8q8bi64LW+yqCOeC7eiTieOhju9LthoSFrKCUoDBRgLlUHX0aWZfeM3l2MfA
 3/FA==
X-Gm-Message-State: AOAM531hRQpJ2h/8tvoJ3wEakc/NUmTzMAQKKr90VRjTuiEKUSf0P5Ea
 deFY8hIY6LSaBgwmTBmLHQ==
X-Google-Smtp-Source: ABdhPJzLB3PDzuaVVTWKIo94MOknTyjcODSHeAoxM/rtWZy+oDjpMr99UBRFJbGqlHrtrpiwAtmyXA==
X-Received: by 2002:a9d:3e5c:: with SMTP id h28mr10960461otg.50.1634736271605; 
 Wed, 20 Oct 2021 06:24:31 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i13sm442681oig.35.2021.10.20.06.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 06:24:30 -0700 (PDT)
Received: (nullmailer pid 2224276 invoked by uid 1000);
 Wed, 20 Oct 2021 13:24:30 -0000
Date: Wed, 20 Oct 2021 08:24:30 -0500
From: Rob Herring <robh@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v2 01/24] PCI: Add PCI_ERROR_RESPONSE and it's related
 definitions
Message-ID: <YXAYjkLyS53Bod3j@robh.at.kernel.org>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
 <4516b02d3c0fe3593a1a9f59bab47e99cdb65f02.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4516b02d3c0fe3593a1a9f59bab47e99cdb65f02.1634306198.git.naveennaidu479@gmail.com>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On Fri, Oct 15, 2021 at 07:58:16PM +0530, Naveen Naidu wrote:
> An MMIO read from a PCI device that doesn't exist or doesn't respond
> causes a PCI error.  There's no real data to return to satisfy the
> CPU read, so most hardware fabricates ~0 data.
> 
> Add a PCI_ERROR_RESPONSE definition for that and use it where
> appropriate to make these checks consistent and easier to find.
> 
> Also add helper definitions SET_PCI_ERROR_RESPONSE and
> RESPONSE_IS_PCI_ERROR to make the code more readable.
> 
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  include/linux/pci.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index cd8aa6fce204..928c589bb5c4 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -154,6 +154,15 @@ enum pci_interrupt_pin {
>  /* The number of legacy PCI INTx interrupts */
>  #define PCI_NUM_INTX	4
>  
> +/*
> + * Reading from a device that doesn't respond typically returns ~0.  A
> + * successful read from a device may also return ~0, so you need additional
> + * information to reliably identify errors.
> + */
> +#define PCI_ERROR_RESPONSE			(~0ULL)
> +#define SET_PCI_ERROR_RESPONSE(val)	(*val = ((typeof(*val)) PCI_ERROR_RESPONSE))
> +#define RESPONSE_IS_PCI_ERROR(val)	(*val == ((typeof(*val)) PCI_ERROR_RESPONSE))

No reason for val to be a pointer.

Also, macro parameters need () around them. val could be an expression 
like 'ptr + 1' which would blow up for example.

> +
>  /*
>   * pci_power_t values must match the bits in the Capabilities PME_Support
>   * and Control/Status PowerState fields in the Power Management capability.
> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
