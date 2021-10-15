Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76869C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 17:06:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D8AA60F25
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 17:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D8AA60F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4BE040687;
	Fri, 15 Oct 2021 17:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPbNof4_I6rW; Fri, 15 Oct 2021 17:06:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D79164075E;
	Fri, 15 Oct 2021 17:06:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA9C7C000F;
	Fri, 15 Oct 2021 17:06:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C7ABC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 17:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66E584041E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 17:06:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-KaiXbirQ4l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 17:06:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EEE2400BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 17:06:04 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id s136so5897372pgs.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 10:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fgXRhIDv4avAhYWPVKqD4fihMIZxTJmiPhjtzsC9r0g=;
 b=blvEzhzRWWIU/TZxsMK2Eh5RErZ/DFjMxSPdwQiUQELylPvjitlEA2KS+l/0PNDtzr
 gFi1fmsOpzzU4aeTXv4XEqxpYH9pDazJwktWCjuz0XjRoxCe5EyjCehBOyrKoPrpPNOf
 bzow4Pf69nfg6Gx5qGYdFuBJREmLyx7HNBAh+kT7f+VBGrADy6E4wkuRwy45RVEVVqzz
 BQdC2+yD2vCj0tKEqeqjsiv2EFoP2VOmUfPwTklwkp0Qjytc5RA9so9uZMXn8TImDK4M
 zKRA+NbzDx8cfy76+2szt6uqCWVJcGZn0Ob4I7HnaZfoCou6N6B6jJ2eqNZcbEPMnXJZ
 5PPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fgXRhIDv4avAhYWPVKqD4fihMIZxTJmiPhjtzsC9r0g=;
 b=d/OZSPp/fOGpWIelu8WrRmhGL+iFLKzhIVFdvstFLHqirgbpLWjTLTPzJSg79Az63h
 wALcKQtojiYCd58tFA2zm2bCQJKtOLvlk/7i6kmrEGg6EPjKRU9SDF/c9m89vEUlKXK5
 8HWcqXwJZChh18kleLQaZ+w+YRjiB6WbsIetVIGlEfYqM2YpzPT283y90XsEmht0bNjG
 IAoe2oS7FhUX0B1n6fNknzBJcJJTWEPZMt0tkYFIAlzLutQ3m2XEeThHMf7DAsSU2THk
 nrxvcHy++Lv6uAG7O15Fwo1hgsle69YVh3OGr10ynl+WH5LVkWQY7ENc3NRFrfuqjMSr
 Ob1g==
X-Gm-Message-State: AOAM532lwOFLyR584gBU7wN8Rs7RO1ZxTCls2PsU3C1rrLwrHXUi/Hd2
 qoArDkysZthO05YoPAcb3aKjZ2nRJ9gcgDuy
X-Google-Smtp-Source: ABdhPJwm9rJNVdj0Qh6+rCPdEpEM9SAT0p+nmVQMRFCjROXihNP69pqeyY8uGOfEu5PUiAhQgGi4Hw==
X-Received: by 2002:a63:1a1b:: with SMTP id a27mr9985068pga.220.1634317563746; 
 Fri, 15 Oct 2021 10:06:03 -0700 (PDT)
Received: from theprophet ([2406:7400:63:4806:ba0d:a155:7e81:f0b2])
 by smtp.gmail.com with ESMTPSA id m22sm5376221pfo.71.2021.10.15.10.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 10:06:03 -0700 (PDT)
Date: Fri, 15 Oct 2021 22:35:52 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH v2 06/24] PCI: iproc: Remove redundant error fabrication
 when device read fails
Message-ID: <20211015170552.kl2unzbynygvw3lv@theprophet>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
 <71757601a719e2ff6ca27615183e322a7709ff65.1634306198.git.naveennaidu479@gmail.com>
 <a3f9ab4e-094b-437e-5c7b-7f72c50b3ff5@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3f9ab4e-094b-437e-5c7b-7f72c50b3ff5@broadcom.com>
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Scott Branden <sbranden@broadcom.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 bhelgaas@google.com, linux-kernel-mentees@lists.linuxfoundation.org,
 "moderated list:BROADCOM IPROC ARM ARCHITECTURE"
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

On 15/10, Ray Jui wrote:
> 
> 
> On 10/15/2021 7:38 AM, Naveen Naidu wrote:
> > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > causes a PCI error. There's no real data to return to satisfy the
> > CPU read, so most hardware fabricates ~0 data.
> > 
> > The host controller drivers sets the error response values (~0) and
> > returns an error when faulty hardware read occurs. But the error
> > response value (~0) is already being set in PCI_OP_READ and
> > PCI_USER_READ_CONFIG whenever a read by host controller driver fails.
> > 
> > Thus, it's no longer necessary for the host controller drivers to
> > fabricate any error response.
> > 
> > This helps unify PCI error response checking and make error check
> > consistent and easier to find.
> > 
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-iproc.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
> > index 30ac5fbefbbf..e3d86416a4fb 100644
> > --- a/drivers/pci/controller/pcie-iproc.c
> > +++ b/drivers/pci/controller/pcie-iproc.c
> > @@ -659,10 +659,8 @@ static int iproc_pci_raw_config_read32(struct iproc_pcie *pcie,
> >  	void __iomem *addr;
> >  
> >  	addr = iproc_pcie_map_cfg_bus(pcie, 0, devfn, where & ~0x3);
> > -	if (!addr) {
> > -		*val = ~0;
> > +	if (!addr)
> >  		return PCIBIOS_DEVICE_NOT_FOUND;
> > -	}
> >  
> >  	*val = readl(addr);
> >  
> > 
> 
> I think it would be helpful if you include us in the review of the PCI
> core code change (pci.h and access.c) so we get the right context to
> review this change at the individual driver level.
>

I apologize for the rookie mistake ^^', I'll see to it from next time 
that I always add proper recepients to the patches so that everyone 
gets enough context.

> The driver change looks fine to me, as long as the change in the core is
> reviewed and approved.
> 

Thank you very much for taking the time to review it.

> Thanks,
> 
> Ray


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
