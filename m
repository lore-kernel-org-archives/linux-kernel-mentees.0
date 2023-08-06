Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E18BC001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Aug 2023 13:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F29C401C9;
	Sun,  6 Aug 2023 13:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F29C401C9
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=t0UCVL7S
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2JvZmus_0Ls; Sun,  6 Aug 2023 13:37:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 91E65403E5;
	Sun,  6 Aug 2023 13:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91E65403E5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D2C9C0071;
	Sun,  6 Aug 2023 13:37:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B206C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 13:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DFEA409A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 13:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DFEA409A8
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=t0UCVL7S
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YM-7uNV-g57o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 13:37:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85AD140997
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 13:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85AD140997
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1B356114C;
 Sun,  6 Aug 2023 13:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB13C433C8;
 Sun,  6 Aug 2023 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691329025;
 bh=KuCvxLI7rGSZBiSQ5Ug9coV+E/jeG1SLo1evNAgT+mQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t0UCVL7SDQ3iwSehoYajeSilELQX0H4gDvQi1KDUO04eTMyrW1PMoi2qzBU0iGsBt
 SmoKbGr1HYBQS9SymS5iafegHdl6yvdIYGEdSLYiyIZ3unb7HGPEyaixS+NIR4oXaf
 WxWYmCi+3oqgXuPNKfALxRDJq2zRkA5XVEUNif6g=
Date: Sun, 6 Aug 2023 15:37:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Atul Kumar Pant <atulpant.linux@gmail.com>
Subject: Re: [PATCH v1] drivers: edac: zynqmp_edac: Updates return value check
Message-ID: <2023080631-salon-banter-31b7@gregkh>
References: <20230806130514.159102-1-atulpant.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230806130514.159102-1-atulpant.linux@gmail.com>
Cc: tony.luck@intel.com, rric@kernel.org, linux-edac@vger.kernel.org,
 shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 shubhrajyoti.datta@amd.com, bp@alien8.de, james.morse@arm.com,
 mchehab@kernel.org, michal.simek@amd.com, sai.krishna.potthuri@amd.com
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

On Sun, Aug 06, 2023 at 06:35:14PM +0530, Atul Kumar Pant wrote:
> Updating the check of return value from edac_debugfs_create_dir
> to use IS_ERR.
> 
> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> ---
>  drivers/edac/zynqmp_edac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/zynqmp_edac.c b/drivers/edac/zynqmp_edac.c
> index ac7d1e0b324c..cefbbafb945e 100644
> --- a/drivers/edac/zynqmp_edac.c
> +++ b/drivers/edac/zynqmp_edac.c
> @@ -351,7 +351,7 @@ static void setup_debugfs(struct edac_device_ctl_info *edac_dev)
>  	struct edac_priv *priv = edac_dev->pvt_info;
>  
>  	priv->debugfs_dir = edac_debugfs_create_dir("ocm");
> -	if (!priv->debugfs_dir)
> +	if (IS_ERR(priv->debugfs_dir))
>  		return;

Again, not correct, sorry.  Please do not make these types of changes.

Why do you feel this is needed at all?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
