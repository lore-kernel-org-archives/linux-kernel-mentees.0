Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9F4C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 16:36:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F995613E6
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 16:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F995613E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50CC34072E;
	Thu, 21 Oct 2021 16:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iSfZCIdnlt5c; Thu, 21 Oct 2021 16:36:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4A9DE402E1;
	Thu, 21 Oct 2021 16:36:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2998BC0033;
	Thu, 21 Oct 2021 16:36:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 074C4C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 16:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA0944072E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 16:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G8vXa55ewHF8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 16:36:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1F37402E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 16:36:23 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id t184so1188577pfd.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 09:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XNFBhpllu7nc0pkg33R5r5Fh+arwoYW9tTFMhQ1Vz/c=;
 b=eJoLRrDvU48OXdI618MEts9VQqMnTVB76rawrzqlvVDGPfrCSgIUDwEHOZ8QSxSWIv
 EaszjXlmCqa2H6DXfha+r226SxX5gFyR4qsqJB2WbKTaWkgnInRYHF64yFqPI2MzbmEI
 5W/n9GwIZmwg/eX2+cTXZCaCPtxIFHfxXxW9EDzgz9bWQ1EXXQK7TinoCr6eLWih3WPC
 lCbeVXY+rpVEt05S2vw3tSradrUM2PvQ0HGno8RAktXq9EKUyJ2rY41VedAVdueoZNFC
 9/a5Zlzv7pGcEYfJNEBoKGvGEyRyQ/briuUYMqUPB6glvIXjqzzKXbXAAJoNvmZm23no
 y8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XNFBhpllu7nc0pkg33R5r5Fh+arwoYW9tTFMhQ1Vz/c=;
 b=rwa71mmb0ZdOYaRNAC5Zo8Jf49BfAYJz8kT/i9uklbktZO+/6yj4qPmZaa6q+EhdNZ
 fUe5SWYjSx29r/QtBswaEV2XE7OEC83+rLJ/zlKpIPbtMRYdr729KmvBronSajNpRe20
 TjsJi/ywcd9u8staGuJ3HyeBFmCL6mzork+BppGXnwQJMmKSDijZBvSJNzOyBwf5IgcC
 +dVz8rTfHKIj1DHMlgRyaXW1X9NqWFRa+rcinLzRvT4z4GWmekpSqHx/yLixSaoEHBQ+
 LZ7kqjIBYRcLaYKXK+OloSsfbb0e6qHuUBZqCi9WHlZ0RJIl3yV6AuiajpN1mUktLWX3
 66eQ==
X-Gm-Message-State: AOAM531hq5VwK4YYLENuGpB4kHMScNofSSVt76f5BGOxWFnNifwyx+jF
 Ym6hdelaCeUmcdTnshYR5LiDTHWvEcF2NAx8
X-Google-Smtp-Source: ABdhPJzfdFTwCbjg+oVZZtmNG4pN1rAlF1kcmD/+Gu6plGnZ8j/KLnhiiXFySrksPZ8TcD1MU9P6vg==
X-Received: by 2002:aa7:8609:0:b0:44b:346a:7404 with SMTP id
 p9-20020aa78609000000b0044b346a7404mr6653842pfn.86.1634834183113; 
 Thu, 21 Oct 2021 09:36:23 -0700 (PDT)
Received: from theprophet ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id m186sm6769249pfb.165.2021.10.21.09.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:36:22 -0700 (PDT)
Date: Thu, 21 Oct 2021 22:06:11 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4 4/8] PCI/DPC: Use pci_aer_clear_status() in
 dpc_process_error()
Message-ID: <20211021163611.rsfmberxw6dqn5gx@theprophet>
References: <f0d301cb1245a8e2fd9565426b87c22a97aa6de7.1633453452.git.naveennaidu479@gmail.com>
 <20211021014029.GA2657684@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021014029.GA2657684@bhelgaas>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com,
 ruscur@russell.cc, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 20/10, Bjorn Helgaas wrote:
> On Tue, Oct 05, 2021 at 10:48:11PM +0530, Naveen Naidu wrote:
> > dpc_process_error() clears both AER fatal and non fatal status
> > registers. Instead of clearing each status registers via a different
> > function call use pci_aer_clear_status().
> > 
> > This helps clean up the code a bit.
> > 
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  drivers/pci/pcie/dpc.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> > index df3f3a10f8bc..faf4a1e77fab 100644
> > --- a/drivers/pci/pcie/dpc.c
> > +++ b/drivers/pci/pcie/dpc.c
> > @@ -288,8 +288,7 @@ void dpc_process_error(struct pci_dev *pdev)
> >  		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
> >  		 aer_get_device_error_info(pdev, &info)) {
> >  		aer_print_error(pdev, &info);
> > -		pci_aer_clear_nonfatal_status(pdev);
> > -		pci_aer_clear_fatal_status(pdev);
> > +		pci_aer_clear_status(pdev);
> 
> The commit log suggests that this is a simple cleanup that doesn't
> change any behavior, but that's not quite true:
> 
>   - The new code would clear PCI_ERR_ROOT_STATUS, but the old code
>     does not.
> 
>   - The old code masks the status bits with the severity bits before
>     clearing, but the new code does not.
> 
> The commit log needs to show why these changes are what we want.
>

Reading through the code again, I realize how wrong(stupid) I was when
making this patch. I was thinking that:

  pci_aer_clear_status() = pci_aer_clear_fatal_status() + pci_aer_clear_nonfatal_status()

Now I understand, that it is not at all the case. I apologize for the
mistake. I'll make sure to be meticulous while reading functions and not
just assume their behaviour just from their function names.

I'll drop this patch in the next version of the patch series I make.

Apologies again ^^'

> >  	}
> >  }
> >  
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > Linux-kernel-mentees mailing list
> > Linux-kernel-mentees@lists.linuxfoundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
