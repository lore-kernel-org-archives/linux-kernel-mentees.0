Return-Path: <SRS0=33ce=AB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769A9C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Jun 2020 09:18:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FFAF23A6B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Jun 2020 09:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FFAF23A6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 29E69241A8;
	Sat, 20 Jun 2020 09:18:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kuId3fK-c127; Sat, 20 Jun 2020 09:17:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EEFD023337;
	Sat, 20 Jun 2020 09:17:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D27C8C0178;
	Sat, 20 Jun 2020 09:17:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90FB7C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Jun 2020 09:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 805F288677
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Jun 2020 09:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vciNc0kONJj3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Jun 2020 09:17:55 +0000 (UTC)
X-Greylist: delayed 00:08:16 by SQLgrey-1.7.6
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B0925884CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Jun 2020 09:17:55 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 5FCE728032723;
 Sat, 20 Jun 2020 11:09:36 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 38F0B10CB8; Sat, 20 Jun 2020 11:09:36 +0200 (CEST)
Date: Sat, 20 Jun 2020 11:09:36 +0200
From: Lukas Wunner <lukas@wunner.de>
To: refactormyself@gmail.com
Message-ID: <20200620090936.3khh3gj46pnojnrw@wunner.de>
References: <20200619201219.32126-1-refactormyself@gmail.com>
 <20200619201219.32126-3-refactormyself@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200619201219.32126-3-refactormyself@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: linux-pci@vger.kernel.org, helgaas@kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 2/2] PCI: pciehp: Fix wrong
 failure check on pcie_capability_read_*()
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

On Fri, Jun 19, 2020 at 10:12:19PM +0200, refactormyself@gmail.com wrote:
> On failure, pcie_capabiility_read_*() will set the status value,
> its last parameter to 0 and not ~0.
> This bug fix checks for the proper value.

If a config space read times out, the PCIe controller fabricates
an "all ones" response.  The code is checking for such a timeout,
not for an error.  Hence the code is fine.

Thanks,

Lukas

> 
> Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
> ---
>  drivers/pci/hotplug/pciehp_hpc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
> index 53433b37e181..c1a67054948a 100644
> --- a/drivers/pci/hotplug/pciehp_hpc.c
> +++ b/drivers/pci/hotplug/pciehp_hpc.c
> @@ -89,7 +89,7 @@ static int pcie_poll_cmd(struct controller *ctrl, int timeout)
>  
>  	do {
>  		pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
> -		if (slot_status == (u16) ~0) {
> +		if (slot_status == (u16)0) {
>  			ctrl_info(ctrl, "%s: no response from device\n",
>  				  __func__);
>  			return 0;
> @@ -165,7 +165,7 @@ static void pcie_do_write_cmd(struct controller *ctrl, u16 cmd,
>  	pcie_wait_cmd(ctrl);
>  
>  	pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
> -	if (slot_ctrl == (u16) ~0) {
> +	if (slot_ctrl == (u16)0) {
>  		ctrl_info(ctrl, "%s: no response from device\n", __func__);
>  		goto out;
>  	}
> @@ -236,7 +236,7 @@ int pciehp_check_link_active(struct controller *ctrl)
>  	int ret;
>  
>  	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
> -	if (ret == PCIBIOS_DEVICE_NOT_FOUND || lnk_status == (u16)~0)
> +	if (ret == PCIBIOS_DEVICE_NOT_FOUND || lnk_status == (u16)0)
>  		return -ENODEV;
>  
>  	ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
> @@ -440,7 +440,7 @@ int pciehp_card_present(struct controller *ctrl)
>  	int ret;
>  
>  	ret = pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
> -	if (ret == PCIBIOS_DEVICE_NOT_FOUND || slot_status == (u16)~0)
> +	if (ret == PCIBIOS_DEVICE_NOT_FOUND || slot_status == (u16)0)
>  		return -ENODEV;
>  
>  	return !!(slot_status & PCI_EXP_SLTSTA_PDS);
> @@ -592,7 +592,7 @@ static irqreturn_t pciehp_isr(int irq, void *dev_id)
>  
>  read_status:
>  	pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &status);
> -	if (status == (u16) ~0) {
> +	if (status == (u16)0) {
>  		ctrl_info(ctrl, "%s: no response from device\n", __func__);
>  		if (parent)
>  			pm_runtime_put(parent);
> -- 
> 2.18.2
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
