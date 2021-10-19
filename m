Return-Path: <SRS0=dPG9=PH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEA4C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Oct 2021 22:44:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7350610A1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Oct 2021 22:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7350610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9609780E21;
	Tue, 19 Oct 2021 22:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9UCNv0d0aPAq; Tue, 19 Oct 2021 22:44:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C613880DF9;
	Tue, 19 Oct 2021 22:44:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E7B5C000F;
	Tue, 19 Oct 2021 22:44:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC64CC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Oct 2021 22:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBF2080D5F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Oct 2021 22:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3QcIAagia-n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Oct 2021 22:44:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D3E080CD4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Oct 2021 22:44:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3854361154;
 Tue, 19 Oct 2021 22:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634683448;
 bh=/g+wgF+JF3O4Y6H7+V152kAnH9oMhD3tFztz/AZaDXg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=taEdq55I88noCQArDJFBVRb0y+GQm4nLIF+JwfjphkxyTiBMTKaqaVO1LMP9l6ipk
 4xcojsdBrhqBwSlCLOoC0rFkNH5do224KYikvGw/YgXbOOUG/LlgwrLUAOxjU2648E
 FByVYoLxGsqr66Oyr72t+89CrEGLH7+J62Xy8LLgTjjBeQS8te+R29y0rTaJBjOqp5
 CUMVsVLQb8lX/+nf714wjxSPC226yspKH3RO87A9Oj9n/TSyaJKuNbeUez6meaXdTM
 /io3xit3dWXLz/TUpP3Ut6yydOTJ9rHukCFP10z1FZeJqbn5tgrojmQW2aynd9qglr
 lUXhh4/tVJqyw==
Date: Tue, 19 Oct 2021 17:44:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH 1/6] PCI/AER: Enable COR/UNCOR error reporting in
 set_device_error_reporting()
Message-ID: <20211019224406.GA2414443@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b583172ece1fb1dab3d75c6007ec8c443323158d.1633369560.git.naveennaidu479@gmail.com>
Cc: tsbogend@alpha.franken.de, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com,
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

On Mon, Oct 04, 2021 at 11:29:27PM +0530, Naveen Naidu wrote:
> The (PCIe r5.0, sec 7.6.4.3, Table 7-101) and  (PCIe r5.0, sec 7.8.4.6,
> Table 7-104) 

s/7.6.4.3/7.8.4.3/

Cite it like this:

  Per PCIe r5.0, sec 7.8.4.3 and sec 7.8.4.6, the default values ...

> states that the default values for the Uncorrectable Error
> Mask and Correctable Error Mask should be 0b. But the current code does
> not set the default value of these registers when the PCIe bus loads the
> AER service driver.

The defaults specified here are for hardware designers -- this is what
the registers must contain after power-up or reset.  This section of
the spec isn't telling us what the OS is required to write.

If we want to clear these masks, I think we have to:

  1) Analyze every other place that writes the masks to make sure we
  don't break any of them.  There aren't very many, and most of them
  are in drivers, which would be after the aer_probe() path.  There
  might be a conflict with program_hpx_type2(), though.

  2) Make it dependent on pcie_aer_is_native().  Ownership of the AER
  capability can be retained by the platform, in which case the OS
  shouldn't touch it.

> Enable reporting of all correctable and uncorrectable errors during
> aer_probe()
> 
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/pcie/aer.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 9784fdcf3006..88c4ca6098fb 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1212,6 +1212,7 @@ static int set_device_error_reporting(struct pci_dev *dev, void *data)
>  {
>  	bool enable = *((bool *)data);
>  	int type = pci_pcie_type(dev);
> +	int aer = dev->aer_cap;
>  
>  	if ((type == PCI_EXP_TYPE_ROOT_PORT) ||
>  	    (type == PCI_EXP_TYPE_RC_EC) ||
> @@ -1223,8 +1224,18 @@ static int set_device_error_reporting(struct pci_dev *dev, void *data)
>  			pci_disable_pcie_error_reporting(dev);
>  	}
>  
> -	if (enable)
> +	if (enable) {
> +
> +		/* Enable reporting of all uncorrectable errors */
> +		/* Uncorrectable Error Mask - turned on bits disable errors */
> +		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, 0);
> +
> +		/* Enable reporting of all correctable errors */
> +		/* Correctable Error Mask - turned on bits disable errors */
> +		pci_write_config_dword(dev, aer + PCI_ERR_COR_MASK, 0);
> +
>  		pcie_set_ecrc_checking(dev);
> +	}
>  
>  	return 0;
>  }
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
