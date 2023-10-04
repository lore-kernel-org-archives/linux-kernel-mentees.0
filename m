Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D544AE7B61D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Oct 2023 13:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CC5682733;
	Wed,  4 Oct 2023 13:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CC5682733
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tIpoJFKM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BE5G3U2jv6U7; Wed,  4 Oct 2023 13:49:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 00B958270B;
	Wed,  4 Oct 2023 13:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00B958270B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D702DC0071;
	Wed,  4 Oct 2023 13:49:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A25EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 13:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 087FB60B44
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 13:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 087FB60B44
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=tIpoJFKM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hwql_vzIWPOI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 13:49:08 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5A0D608A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Oct 2023 13:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5A0D608A5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6561CCE1D13;
 Wed,  4 Oct 2023 13:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D601C433C8;
 Wed,  4 Oct 2023 13:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696427342;
 bh=MBEtnPFBJlhd3FWBV+ARjaXUoaZ9Dl2ozbByMBfu4s4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tIpoJFKMJA0DHSQVOYpxra+hNidIMbiyraE4lEjzw+cwTkFxUsn16H14ra13KIEBF
 Pog5SjZCOnPNpPWaBdX93VhQne6ExToo7sfS9IKM+FeA0O/u6d8Zh9v7vLssh1SEgf
 3HHqvCygS2ws+nrlGwGAsS84eyYXkScdnJf00k9X9gCD8/HN7XzZOF43BYMoFzXUy6
 xMB+26tduI4+vKcg52EvWPk8SRUetcly/+5SDakRDhpwF0ruOvlxc+p/ESDXEKowuE
 bv2vINVbPlEI9IrohLUDKAzwdUNjfeLtfHI/Gac4t0WPlW7mH9kn3MC2fP2zp8nuID
 IjYgdNpfm6uqA==
Date: Wed, 4 Oct 2023 19:18:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: coolrrsh@gmail.com
Subject: Re: [PATCH v2] dmaengine: idxd: Remove redundant memset() for
 eventlog allocation
Message-ID: <ZR1tSu0IQHFNuqMo@matsya>
References: <20230829180027.6357-1-coolrrsh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230829180027.6357-1-coolrrsh@gmail.com>
Cc: dmaengine@vger.kernel.org, fenghua.yu@intel.com, dave.jiang@intel.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On 29-08-23, 23:30, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> dma_alloc_coherent function already zeroes the array 'addr'.
> So, memset function call is not needed.
> 
> This fixes warning such as:
> drivers/dma/idxd/device.c:783:8-26:
> WARNING: dma_alloc_coherent used in addr already zeroes out memory,
> so memset is not needed.

Already fixes by 4ca95a5b220c901f9c2402532ef78bf5aaf7d35d

> 
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> ---
> v1->v2
> Renamed the subject line
> ---
>  drivers/dma/idxd/device.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
> index 5abbcc61c528..7c74bc60f582 100644
> --- a/drivers/dma/idxd/device.c
> +++ b/drivers/dma/idxd/device.c
> @@ -786,8 +786,6 @@ static int idxd_device_evl_setup(struct idxd_device *idxd)
>  		goto err_alloc;
>  	}
>  
> -	memset(addr, 0, size);
> -
>  	spin_lock(&evl->lock);
>  	evl->log = addr;
>  	evl->dma = dma_addr;
> -- 
> 2.25.1

-- 
~Vinod
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
