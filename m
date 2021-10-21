Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A18C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:23:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C88D660C49
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C88D660C49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A212B839F9;
	Thu, 21 Oct 2021 15:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvVjHXKdhVG6; Thu, 21 Oct 2021 15:23:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AD72C838F0;
	Thu, 21 Oct 2021 15:23:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88FB0C001C;
	Thu, 21 Oct 2021 15:23:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21865C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15CD883981
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p27Qaxpye9fL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:23:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 488A0838F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:23:06 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 s61-20020a17090a69c300b0019f663cfcd1so3417458pjj.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u8MgP9EyHiwfzS+PfrhohOi5W9AFD7yrctxjYPpGCNs=;
 b=WVm5YA3svbpKDgEwEWf79YIA2d+HMr3vgMUHlvL/Q51sZB1k2BjB9D7OsHHe/c6ZKR
 3jo0jGxj8JujkkKMJhKYdcEd/cKgCG0WMlt9XvJeSW+eGf4jQaIAEAeYa55sICeLOZaV
 htM63ArD0dzfszA64bl2Zs+CReRT/73uwp0oWQt18dn/jQqZQcB8udEnM7Cj6mWPDiuE
 +4kAM3z3gaanSnhrYgy4hAfp6xgol2yZl7O0uBcvhdh1I+5SN3IPuyoCebu8a/jyf57v
 prYMYOkeURk7aJQt/MlEV0Wq7OhpA/mwL0HPnkGLFh6zkUpJ9CRl1VMFMi7W9FYDW+jz
 SLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u8MgP9EyHiwfzS+PfrhohOi5W9AFD7yrctxjYPpGCNs=;
 b=YwEprY7+dmbASQT3aEt+aJrMVgwYYAHSn3wLYswB5Bndvx3sexX4c2hM7sFt6da+4L
 9G8Pj6j5SQ12ikg8frIr+KFC0wtbYhcLAFbDnwLdrnQT6uvkCsPZrikTvoKRXFzCJ3gg
 cMxiobZdYUlrVc7L2pS1kpZrLOf84JaYoudPT6Hf2VjLe/CQ0M2gqv73e6qu/5+699iZ
 mkQdnnSGBECoLoupUArER4k24UlEsB2aAUeWtgU01e+GTGz2/IuxXzGGwSZOOCmB27NE
 soBxvTuIA+yVVLPZP3ADA4b82P7rY2zNLZOmZgMTjjrM6vQDvY9iSZWlLKXvP91b1FnN
 LNJw==
X-Gm-Message-State: AOAM5306OzTuHJsOxxAc27MX0KqkdzCxUgOvEI/Im/3HurcHYEZWzaZ+
 6oszvQaaYzgWSu5WhpcCKls=
X-Google-Smtp-Source: ABdhPJyM7v0zXEyGqjciHtSAM+WG0z/jW2TYz2BvKHQIg0x3oAjMjTZKgmIFXVMU8//fhdvqmoiD5g==
X-Received: by 2002:a17:90a:4b47:: with SMTP id
 o7mr7491151pjl.198.1634829785570; 
 Thu, 21 Oct 2021 08:23:05 -0700 (PDT)
Received: from theprophet ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id f84sm6347400pfa.25.2021.10.21.08.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:23:05 -0700 (PDT)
Date: Thu, 21 Oct 2021 20:52:53 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: Re: [PATCH v3 18/25] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to
 check read from hardware
Message-ID: <20211021152253.pqc6xp3vnv5fpczj@theprophet>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
 <c21290fe02a7a342a8b93c692586b6a2b6cde9e0.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c21290fe02a7a342a8b93c692586b6a2b6cde9e0.1634825082.git.naveennaidu479@gmail.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, linux-kernel-mentees@lists.linuxfoundation.org
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

On 21/10, Naveen Naidu wrote:
> An MMIO read from a PCI device that doesn't exist or doesn't respond
> causes a PCI error.  There's no real data to return to satisfy the
> CPU read, so most hardware fabricates ~0 data.
> 
> Use RESPONSE_IS_PCI_ERROR() to check the response we get when we read
> data from hardware.
> 
> This helps unify PCI error response checking and make error checks
> consistent and easier to find.
> 
> Compile tested only.
> 
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/hotplug/pciehp_hpc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
> index 3024d7e85e6a..f472f83f6cce 100644
> --- a/drivers/pci/hotplug/pciehp_hpc.c
> +++ b/drivers/pci/hotplug/pciehp_hpc.c
> @@ -89,7 +89,7 @@ static int pcie_poll_cmd(struct controller *ctrl, int timeout)
>  
>  	do {
>  		pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
> -		if (slot_status == (u16) ~0) {
> +		if (RESPONSE_IS_PCI_ERROR(slot_status)) {
>  			ctrl_info(ctrl, "%s: no response from device\n",
>  				  __func__);
>  			return 0;
> @@ -165,7 +165,7 @@ static void pcie_do_write_cmd(struct controller *ctrl, u16 cmd,
>  	pcie_wait_cmd(ctrl);
>  
>  	pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
> -	if (slot_ctrl == (u16) ~0) {
> +	if (RESPONSE_IS_PCI_ERROR(slot_ctrl)) {
>  		ctrl_info(ctrl, "%s: no response from device\n", __func__);
>  		goto out;
>  	}
> @@ -236,7 +236,7 @@ int pciehp_check_link_active(struct controller *ctrl)
>  	int ret;
>  
>  	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
> -	if (ret == PCIBIOS_DEVICE_NOT_FOUND || lnk_status == (u16)~0)
> +	if (ret == PCIBIOS_DEVICE_NOT_FOUND || RESPONSE_IS_PCI_ERROR(lnk_status))
>  		return -ENODEV;
>  
>  	ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
> @@ -443,7 +443,7 @@ int pciehp_card_present(struct controller *ctrl)
>  	int ret;
>  
>  	ret = pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
> -	if (ret == PCIBIOS_DEVICE_NOT_FOUND || slot_status == (u16)~0)
> +	if (ret == PCIBIOS_DEVICE_NOT_FOUND || RESPONSE_IS_PCI_ERROR(slot_status))
>  		return -ENODEV;
>  
>  	return !!(slot_status & PCI_EXP_SLTSTA_PDS);
> @@ -621,7 +621,7 @@ static irqreturn_t pciehp_isr(int irq, void *dev_id)
>  
>  read_status:
>  	pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &status);
> -	if (status == (u16) ~0) {
> +	if (RESPONSE_IS_PCI_ERROR(status)) {
>  		ctrl_info(ctrl, "%s: no response from device\n", __func__);
>  		if (parent)
>  			pm_runtime_put(parent);
> -- 
> 2.25.1
> 

Lukas, I have not added your Acked-by tag from the v1 [1] of the patch 
series, since the RESPONSE_IS_PCI_ERROR macro definition slightly 
changed. I hope this was the right thing to do.

[1]: https://lore.kernel.org/linux-pci/20211011194740.GA14357@wunner.de/

Also, regarding your comments from v1 patch series [1] about re-naming
the RESPONSE_IS_PCI_ERROR to RESPONSE_IS_PCI_TIMEOUT. We could indeed 
change the change to RESPONSE_IS_PCI_TIMEOUT for pciehp, but then 
I'm afraid that picehp would be the odd one out. I mean, since in all 
the other places we are using RESPONE_IS_PCI_TIMEOUT to see if any 
error occured while reading from a device.

RESPONSE_IS_PCI_ERROR stills gives an idea to the readers that some PCI
error occured. It was my understanding that timeout is also a kind of
PCI error (I might be horribly wrong here, given my very less experience
with PCI subsystem) so it would be okay to use RESPONSE_IS_PCI_ERROR
here.

If that is not the case please let me know. But I am not sure what to
do here? If RESPONSE_IS_PCI_ERROR does not fit here, should the right
option would be to revert/remove this patch from the series?

Thanks,
Naveen

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
