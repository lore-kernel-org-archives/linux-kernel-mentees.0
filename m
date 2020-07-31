Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95775C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 13:55:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A19622BF3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 13:55:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mmszk77K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A19622BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2F4AA86982;
	Fri, 31 Jul 2020 13:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8hrVq4y5j_2b; Fri, 31 Jul 2020 13:55:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AC68486949;
	Fri, 31 Jul 2020 13:55:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A06B0C0050;
	Fri, 31 Jul 2020 13:55:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D23DC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 13:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6632788538
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 13:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4yeHj3MvR8UU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 13:55:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B7B1D878BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 13:55:25 +0000 (UTC)
Received: from localhost (mobile-166-175-186-42.mycingular.net
 [166.175.186.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CF0C206DA;
 Fri, 31 Jul 2020 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596203725;
 bh=vYmjK8mMYkxQN9Q5kjSg6X+4qsltfw1XYti+2tjxa/4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Mmszk77KtX/XuyJPvUeBF+uSMjC3wMTXVesDiMr1rqTPEibn4GlNI1dHLpdRa7Sl+
 K+gM6afW6Fp5XeCSnC07IMsYqculLdCzaaTRS86Mi/gu9fmp8W75ncG97tp7g1TtvI
 VsUEIYwFaaR3pr2CWtVYygMUe62iVp1ky5BhBHvc=
Date: Fri, 31 Jul 2020 08:55:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
Message-ID: <20200731135523.GA3717@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731110240.98326-2-refactormyself@gmail.com>
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Puranjay Mohan <puranjay12@gmail.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, linux-rdma@vger.kernel.org,
 linux-pci@vger.kernel.org, Dennis Dalessandro <dennis.dalessandro@intel.com>,
 linux-kernel@vger.kernel.org, Ian Kumlien <ian.kumlien@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4 01/12] IB/hfi1: Check if
 pcie_capability_read_*() reads ~0
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

[+cc Michael, Ashutosh, Ian, Puranjay]

On Fri, Jul 31, 2020 at 01:02:29PM +0200, Saheed O. Bolarinwa wrote:
> On failure pcie_capability_read_dword() sets it's last parameter,
> val to 0. In this case dn and up will be 0, so aspm_hw_l1_supported()
> will return false.
> However, with Patch 12/12, it is possible that val is set to ~0 on
> failure. This would introduce a bug because (x & x) == (~0 & x). So
> with dn and up being 0x02, a true value is return when the read has
> actually failed.
> 
> Since, the value ~0 is invalid here,
> 
> Reset dn and up to 0 when a value of ~0 is read into them, this
> ensures false is returned on failure in this case.
> 
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
> ---
> 
>  drivers/infiniband/hw/hfi1/aspm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/hfi1/aspm.c b/drivers/infiniband/hw/hfi1/aspm.c
> index a3c53be4072c..9605b2145d19 100644
> --- a/drivers/infiniband/hw/hfi1/aspm.c
> +++ b/drivers/infiniband/hw/hfi1/aspm.c
> @@ -33,13 +33,13 @@ static bool aspm_hw_l1_supported(struct hfi1_devdata *dd)
>  		return false;
>  
>  	pcie_capability_read_dword(dd->pcidev, PCI_EXP_LNKCAP, &dn);
> -	dn = ASPM_L1_SUPPORTED(dn);
> +	dn = (dn == (u32)~0) ? 0 : ASPM_L1_SUPPORTED(dn);
>  
>  	pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &up);
> -	up = ASPM_L1_SUPPORTED(up);
> +	up = (up == (u32)~0) ? 0 : ASPM_L1_SUPPORTED(up);

I don't want to change this.  The driver shouldn't be mucking with
ASPM at all.  The PCI core should take care of this automatically.  If
it doesn't, we need to fix the core.

If the driver needs to disable ASPM to work around device errata or
something, the core has an interface for that.  But the driver should
not override the system-wide policy for managing ASPM.

Ah, some archaeology finds affa48de8417 ("staging/rdma/hfi1: Add
support for enabling/disabling PCIe ASPM"), which says:

  hfi1 HW has a high PCIe ASPM L1 exit latency and also advertises an
  acceptable latency less than actual ASPM latencies.

That suggests that either there is a device defect, e.g., advertising
incorrect ASPM latencies, or a PCI core defect, e.g., incorrectly
enabling ASPM when the path exit latency exceeds that hfi1 can
tolerate.

Coincidentally, Ian recently debugged a problem in how the PCI core
computes exit latencies over a path [1].

Can anybody supply details about the hfi1 ASPM parameters, e.g., the
output of "sudo lspci -vv"?  Any details about the configuration where
the problem occurs?  Is there a switch in the path?

[1] https://lore.kernel.org/r/20200727213045.2117855-1-ian.kumlien@gmail.com

>  	/* ASPM works on A-step but is reported as not supported */
> -	return (!!dn || is_ax(dd)) && !!up;
> +	return (dn || is_ax(dd)) && up;
>  }
>  
>  /* Set L1 entrance latency for slower entry to L1 */
> -- 
> 2.18.4
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
