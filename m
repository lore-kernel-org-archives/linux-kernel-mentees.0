Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E6AC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 02:09:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC1D0611F2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 02:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC1D0611F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B78BE401F8;
	Thu, 21 Oct 2021 02:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMx_oxXm5X8A; Thu, 21 Oct 2021 02:09:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 98D234012E;
	Thu, 21 Oct 2021 02:09:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BDA6C000F;
	Thu, 21 Oct 2021 02:09:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38AAEC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 02:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 216AD823C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 02:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aRapTujzVanw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 02:09:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B0BB8186A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 02:09:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DC4C611EF;
 Thu, 21 Oct 2021 02:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634782176;
 bh=OeCANWiIxbjWy7FsfrlKIJcqjEQLoICjJk/ns5OJfj0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=P6n2CEr0dvET9DIAeoWpJ3OaDWFxIuxjKceWjdNB0ecaC13tqRoWfxJ+fm3vmHZhU
 LPk3HoxUxjGkJ+H4B7WJZ8Jekt/yiLGwoIZoxMkLc9wLVg3jKgvtnoi0AZWCGHrESS
 4CcPhdPPCa3qhLfkANqaGo+373ZvorRmpCO18YVc+vol8Re4GWTVoUgpfqTNviAKRe
 Cmfm7AjaIU8kWDzYtQa0/zw/uafDf3N0ypH7ocfwwWl8Zd41AW23N438tYRoqa8kmA
 vZRUrSLZJHnZ6PQz9VMwLBOYi21dzXCcyrCUBdk5JYxCGQOv8Rq21vPcaDwvosVFho
 WHZYnEULhmq0g==
Date: Wed, 20 Oct 2021 21:09:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v4 5/8] PCI/DPC: Converge EDR and DPC Path of clearing
 AER registers
Message-ID: <20211021020934.GA2658296@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a443323ab64ba8c0fc6caa03ca56ecd4d038ea3.1633453452.git.naveennaidu479@gmail.com>
Cc: Oza Pawandeep <poza@codeaurora.org>, linux-pci@vger.kernel.org,
 Sinan Kaya <okaya@kernel.org>, linux-kernel@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, oohall@gmail.com, ruscur@russell.cc,
 bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org,
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

[+cc Keith, Sinan, Oza]

On Tue, Oct 05, 2021 at 10:48:12PM +0530, Naveen Naidu wrote:
> In the EDR path, AER registers are cleared *after* DPC error event is
> processed. The process stack in EDR is:
> 
>   edr_handle_event()
>     dpc_process_error()
>     pci_aer_raw_clear_status()
>     pcie_do_recovery()
> 
> But in DPC path, AER status registers are cleared *while* processing
> the error. The process stack in DPC is:
> 
>   dpc_handler()
>     dpc_process_error()
>       pci_aer_clear_status()
>     pcie_do_recovery()

These are accurate but they both include dpc_process_error(), so we
need a hint to show why the one here is different from the one in the
EDR path, e.g.,

  dpc_handler
    dpc_process_error
      if (reason == 0)
        pci_aer_clear_status    # uncorrectable errors only
    pcie_do_recovery

> In EDR path, AER status registers are cleared irrespective of whether
> the error was an RP PIO or unmasked uncorrectable error. But in DPC, the
> AER status registers are cleared only when it's an unmasked uncorrectable
> error.
> 
> This leads to two different behaviours for the same task (handling of
> DPC errors) in FFS systems and when native OS has control.

FFS?

I'd really like to have a specific example of how a user would observe
this difference.  I know you probably don't have two systems to
compare like that, but maybe we can work it out manually.

I guess you're saying the problem is in the native DPC handling, and
we don't clear the AER status registers for ERR_NONFATAL,
ERR_NONFATAL, etc., right?

I think the current behavior is from 8aefa9b0d910 ("PCI/DPC: Print AER
status in DPC event handling"), where Keith explicitly mentions those
cases.  The commit log here should connect back to that and explain
whether something has changed.

I cc'd Keith and the reviewers of that change in case any of them have
time to dig into this again.

> Bring the same semantics for clearing the AER status register in EDR
> path and DPC path.
> 
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/pcie/dpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index faf4a1e77fab..68899a3db126 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -288,7 +288,6 @@ void dpc_process_error(struct pci_dev *pdev)
>  		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
>  		 aer_get_device_error_info(pdev, &info)) {
>  		aer_print_error(pdev, &info);
> -		pci_aer_clear_status(pdev);
>  	}
>  }
>  
> @@ -297,6 +296,7 @@ static irqreturn_t dpc_handler(int irq, void *context)
>  	struct pci_dev *pdev = context;
>  
>  	dpc_process_error(pdev);
> +	pci_aer_clear_status(pdev);
>  
>  	/* We configure DPC so it only triggers on ERR_FATAL */
>  	pcie_do_recovery(pdev, pci_channel_io_frozen, dpc_reset_link);
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
