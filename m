Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89886C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 22:06:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A3960EB4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 22:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20A3960EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE9D6403F0;
	Mon, 11 Oct 2021 22:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZ4DASBOrWjL; Mon, 11 Oct 2021 22:06:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F38F7403C8;
	Mon, 11 Oct 2021 22:05:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE377C000F;
	Mon, 11 Oct 2021 22:05:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDA5CC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 22:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0B46403D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 22:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9AgecO-X4K40
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 22:05:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13C2C403C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 22:05:56 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id z126so12211043oiz.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 15:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oINn+ngnlK0guwerLyEgPMWYZbLevit1wsPrwjvEJcs=;
 b=0OEubAXq3aLqUARMAleTjTLuowSiy26BP7eh8I6JXP6YKHhOT3Dmt4/17DU+lQiS/u
 2IEsUJP3v+FiO1V9sxSV13U2FjyBnqSzgXHlYpFidSsNQr17rha15wCPCVaEW0ANsq5u
 JorIbn5cuAyvrlRVmVXXoXRNzbIUmxztR9VIfESRtc/SLZLMS2jPGvOCuwsaEXD1QlG4
 Wq8V6P7sSQVv4SxJYqR8gJ7fzueki2AJfHSdJrMgOfgHZPuOh5EaqYhSHF1pBpf7KLPM
 hFnk8ZedfIiWzxzB5g601LPSeZ7KZ3qG8REcr/TB8o8P/Xkjj2p2k7jRR2tKMCjuXy2R
 D2aA==
X-Gm-Message-State: AOAM531+swpIZoIni92f2oCc6lMbIYYnpZrRKjiKMC0Z+BgcDHHsqFrr
 oRB+hh2dr/5sVRWArnjZsA==
X-Google-Smtp-Source: ABdhPJz5Z2csSZa8MPZspzTrKP3JpclGaxTPGaD8wytGzZiZJm1+c9S+z/zVEDMJwCE9KuliaxI/cQ==
X-Received: by 2002:aca:3606:: with SMTP id d6mr1092094oia.35.1633989956086;
 Mon, 11 Oct 2021 15:05:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e2sm1733601ooh.40.2021.10.11.15.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 15:05:55 -0700 (PDT)
Received: (nullmailer pid 1251528 invoked by uid 1000);
 Mon, 11 Oct 2021 22:05:54 -0000
Date: Mon, 11 Oct 2021 17:05:54 -0500
From: Rob Herring <robh@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH 02/22] PCI: Unify PCI error response checking
Message-ID: <YWS1QtNJh7vPCftH@robh.at.kernel.org>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
 <c632b07eb1b08cc7d4346455a55641436a379abd.1633972263.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c632b07eb1b08cc7d4346455a55641436a379abd.1633972263.git.naveennaidu479@gmail.com>
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

On Mon, Oct 11, 2021 at 11:08:32PM +0530, Naveen Naidu wrote:
> An MMIO read from a PCI device that doesn't exist or doesn't respond
> causes a PCI error.  There's no real data to return to satisfy the
> CPU read, so most hardware fabricates ~0 data.
> 
> Use SET_PCI_ERROR_RESPONSE() to set the error response and
> RESPONSE_IS_PCI_ERROR() to check the error response during hardware
> read.
> 
> These definitions make error checks consistent and easier to find.
> 
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/access.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> index 46935695cfb9..e1954bbbd137 100644
> --- a/drivers/pci/access.c
> +++ b/drivers/pci/access.c
> @@ -81,7 +81,7 @@ int pci_generic_config_read(struct pci_bus *bus, unsigned int devfn,
>  
>  	addr = bus->ops->map_bus(bus, devfn, where);
>  	if (!addr) {
> -		*val = ~0;
> +		SET_PCI_ERROR_RESPONSE(val);

This to me doesn't look like kernel style. I'd rather see a define 
replace just '~0', but I defer to Bjorn.

>  		return PCIBIOS_DEVICE_NOT_FOUND;

Neither does this using custom error codes rather than standard Linux 
errno. I point this out as I that's were I'd start with the config 
accessors. Though there are lots of occurrences so we'd need a way to do 
this in manageable steps.

Can't we make PCI_OP_READ and PCI_USER_READ_CONFIG set the data value 
and delete the drivers all doing this? Then we have 2 copies (in source) 
rather than the many this series modifies. Though I'm not sure if there 
are other cases of calling pci_bus.ops.read() which expect to get ~0.

Rob
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
