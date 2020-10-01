Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161A5C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 22:17:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 970B820738
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 22:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pm4oPWJF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 970B820738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 20F5C87242;
	Thu,  1 Oct 2020 22:17:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rlvp+HypAPxA; Thu,  1 Oct 2020 22:17:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3546987225;
	Thu,  1 Oct 2020 22:17:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1252AC0889;
	Thu,  1 Oct 2020 22:17:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EE64C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 22:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F2A9786BCB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 22:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 23KVvhdXF4hw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 22:17:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3F9BE86BC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 22:17:43 +0000 (UTC)
Received: from localhost (170.sub-72-107-125.myvzw.com [72.107.125.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9025420738;
 Thu,  1 Oct 2020 22:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601590662;
 bh=QgsY8jGyViSfTb9WzhX4gU2yFRvsgIiYaDpuYDHqOkY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Pm4oPWJF6gCSJpkpCEQr2Fdkjz+KChBeZq/me6zL5rQfJOrVOKqnXfHM3iGq6a+MT
 7Sm3OxDhRc2AKOrJ7eKo4BsfAR62LDAVDXfsBlf3AtrL9gOaZgtlXx+qmrA/tAuR9a
 aHQCKwBkYpmtYa5C3ZbBGPeGWBEIpnyeY3bWhQnY=
Date: Thu, 1 Oct 2020 17:17:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Message-ID: <20201001221741.GA2737641@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001214436.2735412-3-helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v6 2/2] PCI/ASPM: Add support for
 LTR _DSM
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

On Thu, Oct 01, 2020 at 04:44:36PM -0500, Bjorn Helgaas wrote:
> From: Puranjay Mohan <puranjay12@gmail.com>
> 
> Latency Tolerance Reporting (LTR) is required for the ASPM L1.2 PM
> substate.  Devices with Upstream Ports (Endpoints and Switches) may support
> the optional LTR Capability.  When LTR is enabled, devices transmit LTR
> messages containing Snoop and No-Snoop Latencies upstream.  The L1.2
> substate may be entered if the most recent LTR values are greater than or
> equal to the LTR_L1.2_THRESHOLD from the L1 PM Substates Control 1
> register.
> 
> Add a new function pci_ltr_init() which will be called from
> pci_init_capabilities() to initialize every PCIe device's LTR values.
> Add code in probe.c to evaluate LTR _DSM and save the latencies in pci_dev.

> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2106,6 +2106,9 @@ static void pci_configure_ltr(struct pci_dev *dev)
>  	if (!pci_is_pcie(dev))
>  		return;
>  
> +	/* Read latency values (if any) from platform */
> +	pci_acpi_evaluate_ltr_latency(dev);
> +
>  	pcie_capability_read_dword(dev, PCI_EXP_DEVCAP2, &cap);
>  	if (!(cap & PCI_EXP_DEVCAP2_LTR))
>  		return;
> @@ -2400,6 +2403,7 @@ static void pci_init_capabilities(struct pci_dev *dev)
>  	pci_ptm_init(dev);		/* Precision Time Measurement */
>  	pci_aer_init(dev);		/* Advanced Error Reporting */
>  	pci_dpc_init(dev);		/* Downstream Port Containment */
> +	pci_ltr_init(dev);		/* Latency Tolerance Reporting */

I don't think we're doing this in quite the right order.  If I
understand correctly, we have this:

  pci_device_add
    pci_configure_device
      pci_configure_ltr
        pci_acpi_evaluate_ltr_latency
          acpi_evaluate_dsm(DSM_PCI_LTR_MAX_LATENCY)
        pcie_capability_set_word(PCI_EXP_DEVCTL2_LTR_EN)  <-- enable LTR
    pci_init_capabilities
      pci_ltr_init
        pci_write_config_word(PCI_LTR_MAX_SNOOP_LAT)  <-- set LTR msg content

So we enable LTR messages before we set the latency values in the LTR
capability.  I think we need to set the values *first*.

>  	pcie_report_downtraining(dev);
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
