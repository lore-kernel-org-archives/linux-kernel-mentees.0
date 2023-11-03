Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A466DC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Nov 2023 12:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DED1853DC;
	Fri,  3 Nov 2023 12:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DED1853DC
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nToruN3x
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alsM2mq--Iqm; Fri,  3 Nov 2023 12:57:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 236BB853E0;
	Fri,  3 Nov 2023 12:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 236BB853E0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0B21C0071;
	Fri,  3 Nov 2023 12:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8FC1C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 12:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7790E853E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 12:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7790E853E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Qi_z4-oeCxc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 12:57:20 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 380D1853DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 12:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 380D1853DC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 475A5B81EE8;
 Fri,  3 Nov 2023 12:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA855C433C8;
 Fri,  3 Nov 2023 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1699016236;
 bh=Z4GRd0KC2ISywGcPf/cNtZiFl5y4kqZBVx/tBDTs7UE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nToruN3xBPwHT7q+LbTARIMHGepo2OT9MGLynrmTvE1MVVtD4JrzpvjyZI0k2tMXU
 L8/l12OKmkFdt4SEQtmhXbbM+GSmJYkZEO4XHGAOQPwRoiY/IX6kL6Tw2YnRZf41VS
 BRGgalmr0TqJwJI7LfUoaH/1WgufMVPsljEvDXjA=
Date: Fri, 3 Nov 2023 13:57:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuran Pereira <yuran.pereira@hotmail.com>
Subject: Re: [PATCH] Prevent out-of-bounds read/write in bcmasp_netfilt_rd
 and bcmasp_netfilt_wr
Message-ID: <2023110301-purist-reputable-fab7@gregkh>
References: <DB3PR10MB6835E073F668AD24F57AE64AE8A5A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DB3PR10MB6835E073F668AD24F57AE64AE8A5A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
Cc: florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, justin.chen@broadcom.com, edumazet@google.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

On Fri, Nov 03, 2023 at 05:57:48PM +0530, Yuran Pereira wrote:
> The functions `bcmasp_netfilt_rd` and `bcmasp_netfilt_wr` both call
> `bcmasp_netfilt_get_reg_offset` which, when it fails, returns `-EINVAL`.
> This could lead to an out-of-bounds read or write when `rx_filter_core_rl`
> or `rx_filter_core_wl` is called.
> 
> This patch adds a check in both functions to return immediately if
> `bcmasp_netfilt_get_reg_offset` fails. This prevents potential out-of-bounds read
> or writes, and ensures that no undefined or buggy behavior would originate from
> the failure of `bcmasp_netfilt_get_reg_offset`.
> 
> Addresses-Coverity-IDs: 1544536 ("Out-of-bounds access")
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> ---
>  drivers/net/ethernet/broadcom/asp2/bcmasp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
> index 29b04a274d07..8b90b761bdec 100644
> --- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
> +++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
> @@ -227,6 +227,8 @@ static void bcmasp_netfilt_wr(struct bcmasp_priv *priv,
>  
>  	reg_offset = bcmasp_netfilt_get_reg_offset(priv, nfilt, reg_type,
>  						   offset);
> +	if (reg_offset < 0)
> +		return;
>  
>  	rx_filter_core_wl(priv, val, reg_offset);
>  }
> @@ -244,6 +246,8 @@ static u32 bcmasp_netfilt_rd(struct bcmasp_priv *priv,
>  
>  	reg_offset = bcmasp_netfilt_get_reg_offset(priv, nfilt, reg_type,
>  						   offset);
> +	if (reg_offset < 0)
> +		return 0;

Shouldn't you return an error here?

thanks

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
