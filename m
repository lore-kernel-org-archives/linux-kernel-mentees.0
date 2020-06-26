Return-Path: <SRS0=OiW2=AH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9793CC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Jun 2020 19:14:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 638E3207D8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Jun 2020 19:14:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvleF0Ud"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 638E3207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 420FF8884E;
	Fri, 26 Jun 2020 19:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8elmiYHMad7; Fri, 26 Jun 2020 19:14:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A896B8881F;
	Fri, 26 Jun 2020 19:14:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 916A8C088C;
	Fri, 26 Jun 2020 19:14:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7653DC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Jun 2020 19:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5F912860A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Jun 2020 19:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lL2So2F32fnN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Jun 2020 19:14:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BC95886457
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Jun 2020 19:14:23 +0000 (UTC)
Received: from localhost (mobile-166-170-222-206.mycingular.net
 [166.170.222.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 311D3206A1;
 Fri, 26 Jun 2020 19:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593198863;
 bh=z2oF+alcajhjxoNUuykiKixvNasruwuFGTQMBcBskD0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=cvleF0UdnEtliTWMUd/EQkLaX5l7SVtigqGUCDB5YsAXJBr/9xo9IBRtfT1DSQuvA
 Bu56ZM0JGSAEM9Qw9Pxql4eRma9YpwgfVZexqcN72JvG/RS3HBuqIgMDI2eLlXqiIh
 /W0oL64GDhIozpKiRgk2+Z8MEBHmyucoUdZcf//M=
Date: Fri, 26 Jun 2020 14:14:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Message-ID: <20200626191421.GA2924609@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200620090936.3khh3gj46pnojnrw@wunner.de>
Cc: refactormyself@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
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

On Sat, Jun 20, 2020 at 11:09:36AM +0200, Lukas Wunner wrote:
> On Fri, Jun 19, 2020 at 10:12:19PM +0200, refactormyself@gmail.com wrote:
> > On failure, pcie_capabiility_read_*() will set the status value,
> > its last parameter to 0 and not ~0.
> > This bug fix checks for the proper value.
> 
> If a config space read times out, the PCIe controller fabricates
> an "all ones" response.  The code is checking for such a timeout,
> not for an error.  Hence the code is fine.

In the typical case, the pci_read_config_word() done by
pcie_capability_read_word() will not return an error, so if the read
times out, we should see slot_status == ~0.

But if it's possible to set dev->error_state ==
pci_channel_io_perm_failure, pci_read_config_word() will return an
error because pci_dev_is_disconnected(), so slot_status would be 0.

There are a dozen or so places that set dev->error_state.  It doesn't
look *likely* that any of them would cause this, but it doesn't
instill confidence.

It would be a lot nicer if we didn't have to worry about both the 0
and ~0 cases.  I keep coming back to the idea of removing the "*val
= 0" code from pcie_capability_read_word() so we wouldn't have that
special case.

In any case, this particular patch doesn't seem like quite the right
fix, so I'll drop it.

> > Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
> > ---
> >  drivers/pci/hotplug/pciehp_hpc.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
> > index 53433b37e181..c1a67054948a 100644
> > --- a/drivers/pci/hotplug/pciehp_hpc.c
> > +++ b/drivers/pci/hotplug/pciehp_hpc.c
> > @@ -89,7 +89,7 @@ static int pcie_poll_cmd(struct controller *ctrl, int timeout)
> >  
> >  	do {
> >  		pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
> > -		if (slot_status == (u16) ~0) {
> > +		if (slot_status == (u16)0) {
> >  			ctrl_info(ctrl, "%s: no response from device\n",
> >  				  __func__);
> >  			return 0;
> > @@ -165,7 +165,7 @@ static void pcie_do_write_cmd(struct controller *ctrl, u16 cmd,
> >  	pcie_wait_cmd(ctrl);
> >  
> >  	pcie_capability_read_word(pdev, PCI_EXP_SLTCTL, &slot_ctrl);
> > -	if (slot_ctrl == (u16) ~0) {
> > +	if (slot_ctrl == (u16)0) {
> >  		ctrl_info(ctrl, "%s: no response from device\n", __func__);
> >  		goto out;
> >  	}
> > @@ -236,7 +236,7 @@ int pciehp_check_link_active(struct controller *ctrl)
> >  	int ret;
> >  
> >  	ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
> > -	if (ret == PCIBIOS_DEVICE_NOT_FOUND || lnk_status == (u16)~0)
> > +	if (ret == PCIBIOS_DEVICE_NOT_FOUND || lnk_status == (u16)0)
> >  		return -ENODEV;
> >  
> >  	ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
> > @@ -440,7 +440,7 @@ int pciehp_card_present(struct controller *ctrl)
> >  	int ret;
> >  
> >  	ret = pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &slot_status);
> > -	if (ret == PCIBIOS_DEVICE_NOT_FOUND || slot_status == (u16)~0)
> > +	if (ret == PCIBIOS_DEVICE_NOT_FOUND || slot_status == (u16)0)
> >  		return -ENODEV;
> >  
> >  	return !!(slot_status & PCI_EXP_SLTSTA_PDS);
> > @@ -592,7 +592,7 @@ static irqreturn_t pciehp_isr(int irq, void *dev_id)
> >  
> >  read_status:
> >  	pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &status);
> > -	if (status == (u16) ~0) {
> > +	if (status == (u16)0) {
> >  		ctrl_info(ctrl, "%s: no response from device\n", __func__);
> >  		if (parent)
> >  			pm_runtime_put(parent);
> > -- 
> > 2.18.2
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
