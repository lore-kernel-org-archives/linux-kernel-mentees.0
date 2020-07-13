Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3347C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 16:42:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5BE42067D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 16:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5BE42067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7E1C18746E;
	Mon, 13 Jul 2020 16:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtonsgAJPIUk; Mon, 13 Jul 2020 16:42:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B607187473;
	Mon, 13 Jul 2020 16:42:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4A8AC088E;
	Mon, 13 Jul 2020 16:42:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81D7DC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6EBE789460
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SMDk-yr4CDqp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:42:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D051789429
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 16:42:53 +0000 (UTC)
IronPort-SDR: 1NqsH/RwCjWzc9me2t00hWh1Fcs8UV7t6dzxwaJW8sfCD9x2ytd14X9PA39tZhnYjoLu74fbQj
 Q40DQPp7YVzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="146141284"
X-IronPort-AV: E=Sophos;i="5.75,348,1589266800"; d="scan'208";a="146141284"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 09:42:53 -0700
IronPort-SDR: dQgS6KRxXnZehQ6xSY5bScIB1NbPYyLT4+zopdkg5S3fiuf5XsC0QhqYiX7EJ72qjhdGaDOB1f
 Vf9essvY4UOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,348,1589266800"; d="scan'208";a="485064335"
Received: from rrajashe-mobl1.amr.corp.intel.com (HELO [10.212.135.176])
 ([10.212.135.176])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2020 09:42:52 -0700
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>, helgaas@kernel.org,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
References: <20200713122247.10985-1-refactormyself@gmail.com>
 <20200713122247.10985-10-refactormyself@gmail.com>
From: "Rajashekar, Revanth" <revanth.rajashekar@intel.com>
Message-ID: <0762f646-90a1-217c-4e4b-6168d85bb08a@intel.com>
Date: Mon, 13 Jul 2020 10:42:51 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200713122247.10985-10-refactormyself@gmail.com>
Content-Language: en-US
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 09/35] nvme-pci: Change
	PCIBIOS_SUCCESSFUL to 0
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

Hi,

On 7/13/2020 6:22 AM, Saheed O. Bolarinwa wrote:
> In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
> Their scope should be limited within arch/x86.
>
> Change all PCIBIOS_SUCCESSFUL to 0
>
> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
> ---
>  drivers/nvme/host/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index b1d18f0633c7..d426efb53f44 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -1185,7 +1185,7 @@ static void nvme_warn_reset(struct nvme_dev *dev, u32 csts)
>  
>  	result = pci_read_config_word(to_pci_dev(dev->dev), PCI_STATUS,
>  				      &pci_status);
> -	if (result == PCIBIOS_SUCCESSFUL)
> +	if (result == 0)
How about simplifying the check to if (!result)?
>  		dev_warn(dev->ctrl.device,
>  			 "controller is down; will reset: CSTS=0x%x, PCI_STATUS=0x%hx\n",
>  			 csts, pci_status);
Thanks!
Revanth
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
