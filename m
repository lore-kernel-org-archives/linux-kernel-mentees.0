Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E94C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 01:28:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1342610E7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 01:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1342610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A471401F6;
	Thu, 21 Oct 2021 01:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sFmv6PGRzK7q; Thu, 21 Oct 2021 01:28:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4DA9C4012E;
	Thu, 21 Oct 2021 01:28:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 252B1C000F;
	Thu, 21 Oct 2021 01:28:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EA2EC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 01:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5625B401F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 01:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQlba5Y8czej
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 01:28:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB52F4012E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 01:28:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10C33610D0;
 Thu, 21 Oct 2021 01:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634779682;
 bh=581D5arqTdICaxjPymvl/NeoZRuwRu4qgW9ioIvz0pA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=HYfFdUOLbIbTRC5R74jDV06L85sng277gtjuYVk7lWQC/lhKvcWc2ipBS3m89EiBU
 W94lNQM8jkuVIZee/uDff4yYuH1mbb5dNn5D7ldlusXiMy4BnXI11vJVXZb/y1+l+i
 UabtyFWkDR4QnUPvVZQ+MVxfZm/Zlqu6koy7Af8/wb4EdnHS5lPDOoty8dZkQ3xrsZ
 WHncjxH5nyVClzzGpBGIrUiEFQ626FpucYnLUuJMfvjy0rJ61B17bPkeDMc3+pfXdT
 iGg7Jy1inIkQRUbadjB7uwMIyJ7dOGdyzo1ztoUqd7L0ItcoKNILWhu2a0LbSDB4Kt
 w/klqSqaCmEZQ==
Date: Wed, 20 Oct 2021 20:28:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v4 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
Message-ID: <20211021012800.GA2656128@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ebe87f18339d7567c1d91203e7c5d31f4e65c52.1633453452.git.naveennaidu479@gmail.com>
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

On Tue, Oct 05, 2021 at 10:48:10PM +0530, Naveen Naidu wrote:
> In the dpc_process_error() path, info->id isn't initialized before being
> passed to aer_print_error(). In the corresponding AER path, it is
> initialized in aer_isr_one_error().
> 
> The error message shown during Coverity Scan is:
> 
>   Coverity #1461602
>   CID 1461602 (#1 of 1): Uninitialized scalar variable (UNINIT)
>   8. uninit_use_in_call: Using uninitialized value info.id when calling aer_print_error.
> 
> Initialize the "info->id" before passing it to aer_print_error()
> 
> Fixes: 8aefa9b0d910 ("PCI/DPC: Print AER status in DPC event handling")
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/pcie/dpc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index c556e7beafe3..df3f3a10f8bc 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -262,14 +262,14 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>  
>  void dpc_process_error(struct pci_dev *pdev)
>  {
> -	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
> +	u16 cap = pdev->dpc_cap, status, reason, ext_reason;
>  	struct aer_err_info info;
>  
>  	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
> -	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
> +	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &info.id);
>  
>  	pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
> -		 status, source);
> +		 status, info.id);
>  
>  	reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;

Per PCIe r5.0, sec 7.9.15.5, the Source ID is defined only when the
Trigger Reason indicates ERR_NONFATAL or ERR_FATAL.  So I think we
need to extract this reason before reading PCI_EXP_DPC_SOURCE_ID,
e.g.,

  reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;
  if (reason == 1 || reason == 2)
    pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &info.id);
  else
    info.id = 0;

>  	ext_reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT) >> 5;
> -- 
> 2.25.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
