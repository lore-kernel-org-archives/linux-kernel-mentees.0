Return-Path: <SRS0=dPG9=PH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62070C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Oct 2021 22:53:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1431561074
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Oct 2021 22:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1431561074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D622860871;
	Tue, 19 Oct 2021 22:53:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Kh_AYU885Vv; Tue, 19 Oct 2021 22:53:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E785B607E0;
	Tue, 19 Oct 2021 22:53:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD902C000F;
	Tue, 19 Oct 2021 22:53:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34052C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Oct 2021 22:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F49B4025F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Oct 2021 22:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jsTL3emeAgeE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Oct 2021 22:53:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D71E40202
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Oct 2021 22:53:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8712B61074;
 Tue, 19 Oct 2021 22:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634684032;
 bh=a6eeZS/LZBl+OZKeBZ0Xvg/kT5IZrCEt3S2OPTd7s20=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=n9y7wy/hVq0fzn44+J2dKMaBrYIZp+5HEzTYhKxH+uV+GPsyrLHNxvfRzaSHNItEs
 hRYUZVLQ962h0t0kTtoBUkiZ3qPH/70/vebaBKcs0c4FxoUF912mYoYqDlbyW4BpWU
 EqMTK/4NJ3wZJ9bJukVHO1Vnu9WviQVsqRVuN5laK+EbSZfQfhLXQgMZomCNwaFems
 P1JxE+pDJ3W7ifngq/lKOuLLcKyU2kKc79OLnsgdlMc/5xR5AcTlqBbYWqIyhSnhIr
 +503+vqcBtUDCTlj6ts+F9i1ceme2o9tOlZzDb/EwVxRkKkjC1MYvm8VJ82WhwCXB9
 Zc1OU4gON+Jmw==
Date: Tue, 19 Oct 2021 17:53:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH 2/6] MIPS: OCTEON: Remove redundant clearing of AER
 status registers
Message-ID: <20211019225351.GA2416612@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81597ce8ee30ad01da86fe1edf0fab76aa9b9710.1633369560.git.naveennaidu479@gmail.com>
Cc: tsbogend@alpha.franken.de, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com,
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

On Mon, Oct 04, 2021 at 11:29:28PM +0530, Naveen Naidu wrote:
> e8635b484f64 ("MIPS: Add Cavium OCTEON PCI support.") added MIPS
> specific code to enable PCIe and AER error reporting (*irrespective
> of CONFIG_PCIEAER value*) because PCI core didn't do that at the time.
> 
> Currently when CONFIG_PCIEAER=y, the Uncorrectable Error status,
> Correctable Error status and Root status registers are cleared
> during the PCI Bus enumeration path by pci_aer_init() via
> pci_init_capabilities()

So the current tree (before this patch) always clears these AER status
registers regardless of CONFIG_PCIEAER.

After this patch, we would clear them only if CONFIG_PCIEAER=y.  I
don't see anything in arch/mips that sets CONFIG_PCIEAER, so I'm
concerned we will no longer clear the AER status bits.

I only want to propose a change here if we're very confident that it
won't change any OCTEON behavior.

> It is now no longer necessary for Octeon code to clear AER status
> registers since it's done by PCI core.
> 
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  arch/mips/pci/pci-octeon.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/arch/mips/pci/pci-octeon.c b/arch/mips/pci/pci-octeon.c
> index fc29b85cfa92..8e8b282226cc 100644
> --- a/arch/mips/pci/pci-octeon.c
> +++ b/arch/mips/pci/pci-octeon.c
> @@ -124,11 +124,6 @@ int pcibios_plat_dev_init(struct pci_dev *dev)
>  	/* Find the Advanced Error Reporting capability */
>  	pos = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
>  	if (pos) {
> -		/* Clear Uncorrectable Error Status */
> -		pci_read_config_dword(dev, pos + PCI_ERR_UNCOR_STATUS,
> -				      &dconfig);
> -		pci_write_config_dword(dev, pos + PCI_ERR_UNCOR_STATUS,
> -				       dconfig);
>  		/* Enable reporting of all uncorrectable errors */
>  		/* Uncorrectable Error Mask - turned on bits disable errors */
>  		pci_write_config_dword(dev, pos + PCI_ERR_UNCOR_MASK, 0);
> @@ -138,9 +133,6 @@ int pcibios_plat_dev_init(struct pci_dev *dev)
>  		 * correctable, not if the error is reported.
>  		 */
>  		/* PCI_ERR_UNCOR_SEVER - Uncorrectable Error Severity */
> -		/* Clear Correctable Error Status */
> -		pci_read_config_dword(dev, pos + PCI_ERR_COR_STATUS, &dconfig);
> -		pci_write_config_dword(dev, pos + PCI_ERR_COR_STATUS, dconfig);
>  		/* Enable reporting of all correctable errors */
>  		/* Correctable Error Mask - turned on bits disable errors */
>  		pci_write_config_dword(dev, pos + PCI_ERR_COR_MASK, 0);
> @@ -159,9 +151,6 @@ int pcibios_plat_dev_init(struct pci_dev *dev)
>  				       PCI_ERR_ROOT_CMD_COR_EN |
>  				       PCI_ERR_ROOT_CMD_NONFATAL_EN |
>  				       PCI_ERR_ROOT_CMD_FATAL_EN);
> -		/* Clear the Root status register */
> -		pci_read_config_dword(dev, pos + PCI_ERR_ROOT_STATUS, &dconfig);
> -		pci_write_config_dword(dev, pos + PCI_ERR_ROOT_STATUS, dconfig);
>  	}
>  
>  	return 0;
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
