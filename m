Return-Path: <SRS0=G2n4=KP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DF1C43462
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 13:41:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BC30610CB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 May 2021 13:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BC30610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1B44607BE;
	Thu, 20 May 2021 13:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oEVIevqscV0W; Thu, 20 May 2021 13:41:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 041BD60590;
	Thu, 20 May 2021 13:41:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D028BC000D;
	Thu, 20 May 2021 13:41:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C03C8C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 13:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE8DF4059F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 13:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3a5cFD9v_5Jt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 13:41:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C846A404DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 May 2021 13:41:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1621518051; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g366NAyIOHGUnmU1H63NB1lXwhcYXHlezQIRprstNF8Wtjt9iC/dczA9RagvoEs5ys621mpiRDd7x/v4cWWmtwC8YR5FIfYIzMZYqsxQzEx9Wr6ijIUPpYZn8MS/NWnsQsi9ud+tpVhTbjPtR//y9Nq4ZmXI8g53oKfIGDvK5fc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1621518051;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=7VNeDRXRLa85jo7cthDYXanGoVHoiLzcwRL2eJbBc4Q=; 
 b=NT/YbWWIGwaB810Ax5TA/0bAb/G3mAGqKXs617ByEW7UgVb0Ff5EAklvknryjULH2NGMpEWhvAKTXTRUVoIBgOKhAZkrCtu2CgqCUmCze3ct+H5S5HhGOzzkMDtx9/JZnBT4df4j+1dx//yaADH4EWzxa9DFs8qX13ehf5odse8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1621518051; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=7VNeDRXRLa85jo7cthDYXanGoVHoiLzcwRL2eJbBc4Q=;
 b=DhQR6BlcX/91j1pV697dRGRM60S+vbqLTUXQRJ257ZxRwhLgDvA6cXqImWdgFNPD
 VZuxjfxgplf/s9w/0voP/XSRUPvKd/oLZy36qHm3JLp+KQ9GlWeN4MryAWdaKMZEmSj
 xpOb2stWUt7eJQp8VED2Az3/0EMFGgWfZn2Ac05k=
Received: from anirudhrb.com (106.51.110.115 [106.51.110.115]) by
 mx.zohomail.com with SMTPS id 1621518046958980.6684477891203;
 Thu, 20 May 2021 06:40:46 -0700 (PDT)
Date: Thu, 20 May 2021 19:10:39 +0530
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] video: hgafb: correctly handle card detect failure
 during probe
Message-ID: <YKZm17dj4R1c2ns/@anirudhrb.com>
References: <20210516192714.25823-1-mail@anirudhrb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210516192714.25823-1-mail@anirudhrb.com>
X-ZohoMailClient: External
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, fero@drama.obuda.kando.hu,
 kernel test robot <oliver.sang@intel.com>, stable <stable@vger.kernel.org>,
 linux-nvidia@lists.surfsouth.com,
 linux-kernel-mentees@lists.linuxfoundation.org, igormtorrente@gmail.com
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

On Mon, May 17, 2021 at 12:57:14AM +0530, Anirudh Rayabharam wrote:
> The return value of hga_card_detect() is not properly handled causing
> the probe to succeed even though hga_card_detect() failed. Since probe
> succeeds, hgafb_open() can be called which will end up operating on an
> unmapped hga_vram. This results in an out-of-bounds access as reported
> by kernel test robot [1].
> 
> To fix this, correctly detect failure of hga_card_detect() by checking
> for a non-zero error code.
> 
> [1]: https://lore.kernel.org/lkml/20210516150019.GB25903@xsang-OptiPlex-9020/
> 
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Fixes: dc13cac4862c ("video: hgafb: fix potential NULL pointer dereference")

Greg, this is one of the UMN fixes we did. So, do you want to take this
patch into your tree?

thanks!

	- Anirudh.

> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>  drivers/video/fbdev/hgafb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
> index cc8e62ae93f6..bd3d07aa4f0e 100644
> --- a/drivers/video/fbdev/hgafb.c
> +++ b/drivers/video/fbdev/hgafb.c
> @@ -558,7 +558,7 @@ static int hgafb_probe(struct platform_device *pdev)
>  	int ret;
>  
>  	ret = hga_card_detect();
> -	if (!ret)
> +	if (ret)
>  		return ret;
>  
>  	printk(KERN_INFO "hgafb: %s with %ldK of memory detected.\n",
> -- 
> 2.26.2
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
