Return-Path: <SRS0=auPP=PI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309AEC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Oct 2021 13:52:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6FFF60EE3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Oct 2021 13:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6FFF60EE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A69EC83B98;
	Wed, 20 Oct 2021 13:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cq59lW2qXEZE; Wed, 20 Oct 2021 13:52:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C37C783BB1;
	Wed, 20 Oct 2021 13:52:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DD0DC000F;
	Wed, 20 Oct 2021 13:52:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9CEBC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8583A40749
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9CxGObUNTBVw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:52:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 006084074A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 13:52:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B7BA60EE3;
 Wed, 20 Oct 2021 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634737931;
 bh=SBDigKEN5g+FIb/oTr8InqTwNX3E4a1MT8ec1sBFvlQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ebOZ/YM1U8AKCU7bkBMRow9hfGEg/T5qtZOnzqYL2X4cYzQc3YBPMtGv7baBuoDor
 IxdawKe6lJCZFRLJV495dwO5XDDiZjfhHWiRG5x2rR3e5gOrIkJ8CIhOCSoU22mQl7
 Fr07REsSQa4GqxQ09hAeA9DWeapw6ZfUUWv4jlRloaBaEgkcDf+cJSe2Txk6G+ZbUI
 IZfHGOVEzVKM0eAME2f2N9Ti6yAYtg5TbrDs1Q2C7bD+PYHsTqgDfrisgQtBg2Efx5
 isY6pjXd7AVvCUYGh1lDcuVsz4IE5lwT4ZMo5SsCXB8DZpq0E0RjVDbZV2d83aKRcW
 qj3vJk/Y+E23Q==
Received: by pali.im (Postfix)
 id E204C883; Wed, 20 Oct 2021 15:52:08 +0200 (CEST)
Date: Wed, 20 Oct 2021 15:52:08 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v2 02/24] PCI: Set error response in config access
 defines when ops->read() fails
Message-ID: <20211020135208.zgm2gvhqd7ukb57m@pali>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
 <b913b4966938b7cad8c049dc34093e6c4b2fae68.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b913b4966938b7cad8c049dc34093e6c4b2fae68.1634306198.git.naveennaidu479@gmail.com>
User-Agent: NeoMutt/20180716
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>
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

On Friday 15 October 2021 19:58:17 Naveen Naidu wrote:
> Make PCI_OP_READ and PCI_USER_READ_CONFIG set the data value with error
> response (~0), when the PCI device read by a host controller fails.
> 
> This ensures that the controller drivers no longer need to fabricate
> (~0) value when they detect error. It also  gurantees that the error
> response (~0) is always set when the controller drivers fails to read a
> config register from a device.
> 
> This makes error response fabrication consistent and helps in removal of
> a lot of repeated code.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/access.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> index 46935695cfb9..b3b2006ed1d2 100644
> --- a/drivers/pci/access.c
> +++ b/drivers/pci/access.c
> @@ -42,7 +42,10 @@ int noinline pci_bus_read_config_##size \
>  	if (PCI_##size##_BAD) return PCIBIOS_BAD_REGISTER_NUMBER;	\
>  	pci_lock_config(flags);						\
>  	res = bus->ops->read(bus, devfn, pos, len, &data);		\
> -	*value = (type)data;						\
> +	if (res)									\
> +		SET_PCI_ERROR_RESPONSE(value);			\
> +	else										\
> +		*value = (type)data;						\

Hello! Just one small comment. It looks like that in this patch is
broken alignment of backslashes on the end of lines. Prior this patch
backslashes on all lines were at the same column. With this patch they
are not.

>  	pci_unlock_config(flags);					\
>  	return res;							\
>  }
> @@ -228,7 +231,10 @@ int pci_user_read_config_##size						\
>  	ret = dev->bus->ops->read(dev->bus, dev->devfn,			\
>  					pos, sizeof(type), &data);	\
>  	raw_spin_unlock_irq(&pci_lock);				\
> -	*val = (type)data;						\
> +	if (ret)								\
> +		SET_PCI_ERROR_RESPONSE(val);			\
> +	else									\
> +		*val = (type)data;						\
>  	return pcibios_err_to_errno(ret);				\
>  }									\
>  EXPORT_SYMBOL_GPL(pci_user_read_config_##size);
> -- 
> 2.25.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
