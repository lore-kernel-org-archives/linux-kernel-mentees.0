Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BFEC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 17:09:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9BE020663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 17:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="P6ue5J2Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9BE020663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8950689747;
	Mon, 13 Jul 2020 17:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oiir33K8njDk; Mon, 13 Jul 2020 17:09:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D4C8589731;
	Mon, 13 Jul 2020 17:09:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8AF2C0888;
	Mon, 13 Jul 2020 17:09:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5132C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BCCCF8797F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rg94GgGZ-hJ3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:09:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 22A558458F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:09:43 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c30so12907700qka.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AjfD32HKP9GelxZOkg41v9V6Gzjw1JRj8RlOK03pams=;
 b=P6ue5J2QVyGR013c2UC25Q9bEjmGLQLJlmEuA1j5UoaACPlwGsRU5oPQydR4VgHRAQ
 L1LLo1DsbWsmVVz1JJH+XrYRnbQxNVDp0Tbzha5dqUAB1U3rVrK0ZuloeI02R3+Ohmck
 nIhcHDRdSQZbeXNk1VGmdTIpJpVNzm4aXapDBvkADLvm+N6wGsC0Vuj5SRCjoLtTpbM6
 3YNMYd60otly0jlZeIyCvHepWSBprUXUrUnc1mbSIi5+zMPYtY/xp7pglqsia5XJhfiB
 F8DgDcnW27IcL2XuD2u0H8FjQS8bqlDG91XFUgIbJjfpl7taOGEyt92W8DFNPIX8mT3F
 fvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AjfD32HKP9GelxZOkg41v9V6Gzjw1JRj8RlOK03pams=;
 b=TMVs7ojVzLiZqZINpwivoiHpjiKRUst2CbD08ULnuOumBlOY8LY547Ea9OUKtWcfJD
 iNAYl/1f2t0dcdy8fuNTk22qgpENR0E4Hfr1piN1SPMS7cWEb/Lb4/iyc6cHExv+2ETO
 GsUB1UJcqmskJIlE2d1rr0c/K6xNZ8PxJ+bW5T1mGOLNeVJKi8665TzwG45r0dcuNYhw
 DMLicH36oWwZQxs96J98XIB/y9TY9OQxLn+5ZNQEturUlcORvlAV3exkBgSDfm9dXDup
 x6+2Myr5SDI6lNzKLPH4bt4Qatxz2PallLCx+I9BQfwU/pogVl6h/9M8BILovQN/pS+x
 XApw==
X-Gm-Message-State: AOAM532hUlbHquE+ha117G4sAUzV2jZShA5p9oN+/e70CKdLFaQl33kV
 beWxnsSxAyzAHF3YxbqDysnD6w==
X-Google-Smtp-Source: ABdhPJzvbBBh0WGnYFjQ6KDKcJ34oSp591S6VrK9/KQzdFPP1pwlEgvCtv/HHrr6bK2VB24/hylh7Q==
X-Received: by 2002:a37:5bc4:: with SMTP id p187mr661575qkb.166.1594660182115; 
 Mon, 13 Jul 2020 10:09:42 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id i35sm19119142qtd.96.2020.07.13.10.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 10:09:41 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jv1xV-009lWJ-4g; Mon, 13 Jul 2020 14:09:41 -0300
Date: Mon, 13 Jul 2020 14:09:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
Message-ID: <20200713170941.GB25301@ziepe.ca>
References: <20200713175529.29715-1-refactormyself@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713175529.29715-1-refactormyself@gmail.com>
Cc: linux-rdma@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/14 v3] IB/hfi1: Check the
 return value of pcie_capability_read_*()
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

On Mon, Jul 13, 2020 at 07:55:25PM +0200, Saheed O. Bolarinwa wrote:
> From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
> 
> On failure pcie_capability_read_dword() sets it's last parameter,
> val to 0. In this case dn and up will be 0, so aspm_hw_l1_supported()
> will return false.
> However, with Patch 14/14, it is possible that val is set to ~0 on
> failure. This would introduce a bug because (x & x) == (~0 & x). So with
> dn and up being 0x02, a true value is return when the read has actually
> failed.
> 
> This bug can be avoided if the return value of pcie_capability_read_dword
> is checked to confirm success. The behaviour of the function remains
> intact.
> 
> Check the return value of pcie_capability_read_dword() to ensure success.
> 
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
>  drivers/infiniband/hw/hfi1/aspm.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/hfi1/aspm.c b/drivers/infiniband/hw/hfi1/aspm.c
> index a3c53be4072c..80d0b3edd983 100644
> +++ b/drivers/infiniband/hw/hfi1/aspm.c
> @@ -24,6 +24,7 @@ static bool aspm_hw_l1_supported(struct hfi1_devdata *dd)
>  {
>  	struct pci_dev *parent = dd->pcidev->bus->self;
>  	u32 up, dn;
> +	int ret_up, ret_dn;
>  
>  	/*
>  	 * If the driver does not have access to the upstream component,
> @@ -32,14 +33,14 @@ static bool aspm_hw_l1_supported(struct hfi1_devdata *dd)
>  	if (!parent)
>  		return false;
>  
> -	pcie_capability_read_dword(dd->pcidev, PCI_EXP_LNKCAP, &dn);
> +	ret_dn = pcie_capability_read_dword(dd->pcidev, PCI_EXP_LNKCAP, &dn);
>  	dn = ASPM_L1_SUPPORTED(dn);
>  
> -	pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &up);
> +	ret_up = pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &up);
>  	up = ASPM_L1_SUPPORTED(up);
>  
>  	/* ASPM works on A-step but is reported as not supported */
> -	return (!!dn || is_ax(dd)) && !!up;
> +	return !!ret_dn && !!ret_up && (!!dn || is_ax(dd)) && !!up;
>  }

what is all the !! for? boolean contexts already coerce to boolean

Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
