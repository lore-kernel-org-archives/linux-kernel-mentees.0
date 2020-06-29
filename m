Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F44BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 20:09:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45C95207D0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 20:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45C95207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A08F8850A;
	Mon, 29 Jun 2020 20:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Czzo2Ji6b49V; Mon, 29 Jun 2020 20:09:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 56EAC86E21;
	Mon, 29 Jun 2020 20:09:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43E20C0865;
	Mon, 29 Jun 2020 20:09:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1755C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 20:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AD9AA84DD5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 20:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OVSv9PA272SZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 20:09:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1C57485570
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 20:09:26 +0000 (UTC)
IronPort-SDR: l/ChFOBAXCHRkDJKDkzIdLFWrWPhj9n8m3aXd1WrFSxGBjZsm08fpY3FlIYpLp3JhCMb/jw+En
 mlrwYG7lkDgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="147616886"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="147616886"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 13:09:25 -0700
IronPort-SDR: PoVjz7Y+YLh6hCKpBiPEoY6bNJLo/ocBfnj+22m72VjMoPDZijXwyTfNOwYkLzxZUb6K2ThjD5
 CNfUtTHR8anQ==
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="454315340"
Received: from ddalessa-mobl.amr.corp.intel.com (HELO [10.254.206.102])
 ([10.254.206.102])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 13:09:23 -0700
From: Dennis Dalessandro <dennis.dalessandro@intel.com>
To: refactormyself@gmail.com, helgaas@kernel.org
References: <20200615073225.24061-1-refactormyself@gmail.com>
 <20200615073225.24061-3-refactormyself@gmail.com>
Message-ID: <9e2b006e-9a0a-19fb-5dab-52df8c0e8674@intel.com>
Date: Mon, 29 Jun 2020 16:09:21 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200615073225.24061-3-refactormyself@gmail.com>
Content-Language: en-US
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>, linux-rdma@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/8] IB/hfi1: Convert
 PCIBIOS_* errors to generic -E* errors
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 6/15/2020 3:32 AM, refactormyself@gmail.com wrote:
> From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
> 
> pcie_speeds() returns PCIBIOS_ error codes from PCIe capability accessors.
> 
> PCIBIOS_ error codes have positive values. Passing on these values is
> inconsistent with functions which return only a negative value on failure.
> 
> Before passing on the return value of PCIe capability accessors, call
> pcibios_err_to_errno() to convert any positive PCIBIOS_ error codes to
> negative generic error values.
> 
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
> ---
>   drivers/infiniband/hw/hfi1/pcie.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/hfi1/pcie.c b/drivers/infiniband/hw/hfi1/pcie.c
> index 1a6268d61977..eb53781d0c6a 100644
> --- a/drivers/infiniband/hw/hfi1/pcie.c
> +++ b/drivers/infiniband/hw/hfi1/pcie.c
> @@ -306,7 +306,7 @@ int pcie_speeds(struct hfi1_devdata *dd)
>   	ret = pcie_capability_read_dword(dd->pcidev, PCI_EXP_LNKCAP, &linkcap);
>   	if (ret) {
>   		dd_dev_err(dd, "Unable to read from PCI config\n");
> -		return ret;
> +		return pcibios_err_to_errno(ret);
>   	}
>   
>   	if ((linkcap & PCI_EXP_LNKCAP_SLS) != PCI_EXP_LNKCAP_SLS_8_0GB) {
> 

Reviewed-by: Dennis Dalessandro <dennis.dalessandro@intel.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
