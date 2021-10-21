Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA80CC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 01:40:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9759D6113D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 01:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9759D6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6061C60D64;
	Thu, 21 Oct 2021 01:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RRAkHMbo_nZw; Thu, 21 Oct 2021 01:40:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7A86A60D5E;
	Thu, 21 Oct 2021 01:40:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D7DAC000F;
	Thu, 21 Oct 2021 01:40:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F9C4C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 01:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5C9D60D61
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 01:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fUeVZTWKxisp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 01:40:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3131E60D5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 01:40:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A5E2610A3;
 Thu, 21 Oct 2021 01:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634780430;
 bh=EUralENv330ewn9XRHZ1BpnRh5NsqZGkLbfXk4z3Pp4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Gwao20C+ItQvfrCBBPmm3C7nTwca5rnymIgfSohDSW6Pc4PPCRFrYTr436hrKPK1z
 aMhokgwHFzO+bAKE/Ts92ViYsQRHRUMq8twvA1r0ojQyXEf0FtjLlLsHUVFsL4k9PA
 WT/vW7LD6FQEI8OGTSWU/FqPEQFUd0hKkAx2u1zLU7/4Y07jgIFzZScMfWgwZp+a/F
 sjLQ5xwSZIrzPzbryfd0scaNOoGG1hCwjDxSZCPbCM+pFhsRILPQEcdi3Brop4gelq
 d4Msy2g3KmodJnhCtUHDoJlkw3SlMfICN4vjz+sXoXtHkOCi0P8whDMQv5M+qDJ/NT
 4C8ff3ITwinOw==
Date: Wed, 20 Oct 2021 20:40:29 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v4 4/8] PCI/DPC: Use pci_aer_clear_status() in
 dpc_process_error()
Message-ID: <20211021014029.GA2657684@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0d301cb1245a8e2fd9565426b87c22a97aa6de7.1633453452.git.naveennaidu479@gmail.com>
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

On Tue, Oct 05, 2021 at 10:48:11PM +0530, Naveen Naidu wrote:
> dpc_process_error() clears both AER fatal and non fatal status
> registers. Instead of clearing each status registers via a different
> function call use pci_aer_clear_status().
> 
> This helps clean up the code a bit.
> 
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/pcie/dpc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index df3f3a10f8bc..faf4a1e77fab 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -288,8 +288,7 @@ void dpc_process_error(struct pci_dev *pdev)
>  		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
>  		 aer_get_device_error_info(pdev, &info)) {
>  		aer_print_error(pdev, &info);
> -		pci_aer_clear_nonfatal_status(pdev);
> -		pci_aer_clear_fatal_status(pdev);
> +		pci_aer_clear_status(pdev);

The commit log suggests that this is a simple cleanup that doesn't
change any behavior, but that's not quite true:

  - The new code would clear PCI_ERR_ROOT_STATUS, but the old code
    does not.

  - The old code masks the status bits with the severity bits before
    clearing, but the new code does not.

The commit log needs to show why these changes are what we want.

>  	}
>  }
>  
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
