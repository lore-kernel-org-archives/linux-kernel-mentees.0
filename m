Return-Path: <SRS0=4Ypl=AV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5ECC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 00:14:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B292065F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 00:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2a1Son6W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70B292065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B98988072;
	Fri, 10 Jul 2020 00:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NgkdziAytW45; Fri, 10 Jul 2020 00:14:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C93E98806B;
	Fri, 10 Jul 2020 00:14:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C43A8C0865;
	Fri, 10 Jul 2020 00:14:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B69BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 00:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 173E72CA28
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 00:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ubtX7ZZyrauG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 00:14:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 47CAA26FDA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 00:14:08 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2EE52065F;
 Fri, 10 Jul 2020 00:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594340048;
 bh=1Q5ejM91y+rZdlPiC9UJgo7wuGqE1YmvLc2GRbXroko=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=2a1Son6W+Y/jnNfWf/6l+CVIii/kSqwRfl7ye9cOmeJxHyIkrxFAKYiE+Kbt3PD6d
 E+d1KyZ02ruY1rVQjHcKdPW8+RrhIKlIUcKaH85ObpDYyAI+tK7DIf9zThvjJM8pPn
 X9oQEEgT+CVubZkBJGaw6L7zIIzaVuByKHmwCqbM=
Date: Thu, 9 Jul 2020 19:14:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Saheed Olayemi Bolarinwa <refactormyself@gmail.com>
Message-ID: <20200710001406.GA30420@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200706093121.9731-6-refactormyself@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 5/11 RFC] PCI: pciehp: Make
	"Power On" the default
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

On Mon, Jul 06, 2020 at 11:31:15AM +0200, Saheed Olayemi Bolarinwa wrote:
> From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
> 
> The default case of the switch statement is redundant since 
> PCI_EXP_SLTCTL_PCC is only a single bit. pcie_capability_read_word()
> currently causes "On" value to be set if it fails. Patch 11/11
> changes the behaviour of pcie_capability_read_word() so on falure the
> "Off" value will be set.

s/falure/failure/

Split this into two patches.  The removal of the default case should
be in its own patch to make it trivial to review.

> Make the function set status to "Power On" by default and only set to
> Set "Power Off" only if pcie_capability_read_word() is successful and
> (slot_ctrl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF. 
> 
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
> ---
>  drivers/pci/hotplug/pciehp_hpc.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
> index 0b691e37fd04..78f806a9c6f1 100644
> --- a/drivers/pci/hotplug/pciehp_hpc.c
> +++ b/drivers/pci/hotplug/pciehp_hpc.c
> @@ -399,22 +399,16 @@ void pciehp_get_power_status(struct controller *ctrl, u8 *status)
>  {
>  	struct pci_dev *pdev = ctrl_dev(ctrl);
>  	u16 slot_ctrl;
> +	int ret;
>  
> -	pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
> +	*status = 1;	/* On */
> +	ret = pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
>  	ctrl_dbg(ctrl, "%s: SLOTCTRL %x value read %x\n", __func__,
>  		 pci_pcie_cap(ctrl->pcie->port) + PCI_EXP_SLTCTL, slot_ctrl);
>  
> -	switch (slot_ctrl & PCI_EXP_SLTCTL_PCC) {
> -	case PCI_EXP_SLTCTL_PWR_ON:
> -		*status = 1;	/* On */
> -		break;
> -	case PCI_EXP_SLTCTL_PWR_OFF:
> +	if (!ret &&
> +	    ((slot_ctrl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF))
>  		*status = 0;	/* Off */
> -		break;
> -	default:
> -		*status = 0xFF;
> -		break;
> -	}
>  }
>  
>  void pciehp_get_latch_status(struct controller *ctrl, u8 *status)
> -- 
> 2.18.2
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
