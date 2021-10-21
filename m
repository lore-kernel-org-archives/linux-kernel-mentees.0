Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD842C4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 16:31:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6462761439
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 16:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6462761439
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 352214072E;
	Thu, 21 Oct 2021 16:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jEpsKsJmKbJo; Thu, 21 Oct 2021 16:31:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2523640218;
	Thu, 21 Oct 2021 16:31:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3AE6C0033;
	Thu, 21 Oct 2021 16:31:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EDE6C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 16:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A75840218
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 16:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6iGhB-W5zm0T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 16:31:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1150A4021A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 16:31:39 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id oa4so896008pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 09:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IQdbcLoiSTUVND1y3yU1tj63RV90osj4TBuWtLbjx9w=;
 b=YQjnOjoxdmAAAhECuj0KPEKt27H/wOxmKMev/Jh3JFVzpa0cOV5dXDMot1AjIrEG5o
 wOgYSn95J/UqizuILvkc6+g5OAsT+ytgws2SQSx86fqrfx1zMQ8ub37GSDr+YFHAQWu7
 AiWqL+msiWD7SYSJShRzFd0h2Q5F/ABIdful5MVcYO6wioowEDKbPy6e7Sm+06weThUK
 Xui6felse6F+NGA1x77OkV/oukWj2d4a0wErt7nwUKfhe9DAWWStrAp+/vnrkZACqZG9
 zRSQApaprEZtWr6+t2qcRju9au7ZSuNDzMcfd3rLEbaYobAayt/iGBCC+2VoAJJnu/RG
 t0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IQdbcLoiSTUVND1y3yU1tj63RV90osj4TBuWtLbjx9w=;
 b=qoJhuZBM8i2C92mz+Wmz/XY5MbyDYiPHFDmw4CZftWfXiiiLLt9ZlT9AKxIIFhATcD
 t4Hyklhplgx8U04b4egVmPfuS+0vKIzv9ckPCg2kJ5W4x9dd5xMVIZ61XMTOWeAbkpbB
 RwM4b0XfqShTnMY/R0UBbINmPVuYFib6ZIRv7Htr3pQLG084T7PHFxj27Cf470kdFk4d
 DfhE1D8kjP3i+nQ3g/Im61EHDo8y+pj0oo2G3H/spMkPysvJ2hW+zMeZzg3/jvaCnWn4
 AuHziKiPQM2btYfJizz5s6ZxKB6J3GfmS3J79XBUHR2n08PnhryoIv8axrv9eAzapWKG
 yGTw==
X-Gm-Message-State: AOAM533Ckpsmi55svUow+7ABQCgF8JZwioxHMzRwhEHERXby+DocBPPL
 Ze+JyOkCscTdtH/Qo2reYz8=
X-Google-Smtp-Source: ABdhPJy79KDoQD2rK1TbZ1HD9yKVRke6nSbvrV7cMQ1pA2KVnMKpIrwtRe7TAmT4oeznWwGCwsdqBw==
X-Received: by 2002:a17:90b:4a47:: with SMTP id
 lb7mr7615497pjb.192.1634833899480; 
 Thu, 21 Oct 2021 09:31:39 -0700 (PDT)
Received: from theprophet ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id c9sm5669933pgq.58.2021.10.21.09.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:31:39 -0700 (PDT)
Date: Thu, 21 Oct 2021 22:01:28 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
Message-ID: <20211021163128.rud3fv3jtnbi3ifp@theprophet>
References: <5ebe87f18339d7567c1d91203e7c5d31f4e65c52.1633453452.git.naveennaidu479@gmail.com>
 <20211021012800.GA2656128@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021012800.GA2656128@bhelgaas>
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
> On Tue, Oct 05, 2021 at 10:48:10PM +0530, Naveen Naidu wrote:
> > In the dpc_process_error() path, info->id isn't initialized before being
> > passed to aer_print_error(). In the corresponding AER path, it is
> > initialized in aer_isr_one_error().
> > 
> > The error message shown during Coverity Scan is:
> > 
> >   Coverity #1461602
> >   CID 1461602 (#1 of 1): Uninitialized scalar variable (UNINIT)
> >   8. uninit_use_in_call: Using uninitialized value info.id when calling aer_print_error.
> > 
> > Initialize the "info->id" before passing it to aer_print_error()
> > 
> > Fixes: 8aefa9b0d910 ("PCI/DPC: Print AER status in DPC event handling")
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  drivers/pci/pcie/dpc.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> > index c556e7beafe3..df3f3a10f8bc 100644
> > --- a/drivers/pci/pcie/dpc.c
> > +++ b/drivers/pci/pcie/dpc.c
> > @@ -262,14 +262,14 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
> >  
> >  void dpc_process_error(struct pci_dev *pdev)
> >  {
> > -	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
> > +	u16 cap = pdev->dpc_cap, status, reason, ext_reason;
> >  	struct aer_err_info info;
> >  
> >  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
> > -	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> > +	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &info.id);
> >  
> >  	pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
> > -		 status, source);
> > +		 status, info.id);
> >  
> >  	reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;
> 
> Per PCIe r5.0, sec 7.9.15.5, the Source ID is defined only when the
> Trigger Reason indicates ERR_NONFATAL or ERR_FATAL.  So I think we
> need to extract this reason before reading PCI_EXP_DPC_SOURCE_ID,
> e.g.,
> 
>   reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;
>   if (reason == 1 || reason == 2)
>     pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &info.id);
>   else
>     info.id = 0;
>

Thank you for the review, I'll make this change when I send a v5 for the
patch series.

> >  	ext_reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT) >> 5;
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
