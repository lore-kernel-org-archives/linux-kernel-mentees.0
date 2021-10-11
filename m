Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DD9C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:09:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FB5A60EB4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FB5A60EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F11C401E7;
	Mon, 11 Oct 2021 18:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5Bp2iGJW4nt; Mon, 11 Oct 2021 18:09:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 67C9A4021E;
	Mon, 11 Oct 2021 18:09:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46FA0C0011;
	Mon, 11 Oct 2021 18:09:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3304C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9D9A402C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nMotyAlgwgrc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:08:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB100401E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:08:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F72C60EB4;
 Mon, 11 Oct 2021 18:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633975733;
 bh=znvt7lXTrjz8Q7uFKJ50VwboQPdEorWs9uuIA7tBazI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CzTduaqzuCsLQPm6VXtRH2KVlfxrgwAeezXN8LIoJto9GnO4HarUxbwIRF+OXLcgG
 CwjE9u/52RytsnFKZXPva+CQiHJKAq/NFa2ZmAqb/yFosQ/JPVq21eChF9PyUjT+c+
 JXeH2y/MI9mOL2FudCVWGv25ImJZ9uCWOIBxZTkYR0gb04FM/UPGgaPr1I9bbli7KU
 QNwiHCeyh2xqZhtEF3dAb6yC1vqU3uVrehkvxsEL/KNcAfrkS5RKkiabqdcMlRVqI7
 5k6FV2b6Czrb9x0v2JiS1x71z3B1jTS3qqvG6HzllevLVtGJEuQbPnQYLvVV7st0us
 g4NT/kEUJrdGg==
Received: by pali.im (Postfix)
 id 0B6BB7C9; Mon, 11 Oct 2021 20:08:50 +0200 (CEST)
Date: Mon, 11 Oct 2021 20:08:50 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH 09/22] PCI: aardvark: Use SET_PCI_ERROR_RESPONSE() when
 device not found
Message-ID: <20211011180850.hgp4ctykvus37fx7@pali>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
 <f423dc9cc90e345680d289d5df7ff469e9b89c60.1633972263.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f423dc9cc90e345680d289d5df7ff469e9b89c60.1633972263.git.naveennaidu479@gmail.com>
User-Agent: NeoMutt/20180716
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "moderated list:PCI DRIVER FOR AARDVARK \(Marvell Armada 3700\)"
 <linux-arm-kernel@lists.infradead.org>
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

On Monday 11 October 2021 23:26:33 Naveen Naidu wrote:
> An MMIO read from a PCI device that doesn't exist or doesn't respond
> causes a PCI error.  There's no real data to return to satisfy the
> CPU read, so most hardware fabricates ~0 data.
> 
> Use SET_PCI_ERROR_RESPONSE() to set the error response, when a faulty
> read occurs.
> 
> This helps unify PCI error response checking and make error check
> consistent and easier to find.
> 
> Compile tested only.
> 
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/controller/pci-aardvark.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> index 596ebcfcc82d..dc2f820ef55f 100644
> --- a/drivers/pci/controller/pci-aardvark.c
> +++ b/drivers/pci/controller/pci-aardvark.c
> @@ -894,7 +894,7 @@ static int advk_pcie_rd_conf(struct pci_bus *bus, u32 devfn,
>  	int ret;
>  
>  	if (!advk_pcie_valid_device(pcie, bus, devfn)) {
> -		*val = 0xffffffff;
> +		SET_PCI_ERROR_RESPONSE(val);

Hello! Now I'm looking at this macro, and should not it depends on
"size" argument? If doing 8-bit or 16-bit read operation then should not
it rather sets only low 8 bits or low 16 bits to ones?

>  		return PCIBIOS_DEVICE_NOT_FOUND;
>  	}
>  
> @@ -920,7 +920,7 @@ static int advk_pcie_rd_conf(struct pci_bus *bus, u32 devfn,
>  			*val = CFG_RD_CRS_VAL;
>  			return PCIBIOS_SUCCESSFUL;
>  		}
> -		*val = 0xffffffff;
> +		SET_PCI_ERROR_RESPONSE(val);
>  		return PCIBIOS_SET_FAILED;
>  	}
>  
> @@ -955,14 +955,14 @@ static int advk_pcie_rd_conf(struct pci_bus *bus, u32 devfn,
>  			*val = CFG_RD_CRS_VAL;
>  			return PCIBIOS_SUCCESSFUL;
>  		}
> -		*val = 0xffffffff;
> +		SET_PCI_ERROR_RESPONSE(val);
>  		return PCIBIOS_SET_FAILED;
>  	}
>  
>  	/* Check PIO status and get the read result */
>  	ret = advk_pcie_check_pio_status(pcie, allow_crs, val);
>  	if (ret < 0) {
> -		*val = 0xffffffff;
> +		SET_PCI_ERROR_RESPONSE(val);
>  		return PCIBIOS_SET_FAILED;
>  	}
>  
> -- 
> 2.25.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
