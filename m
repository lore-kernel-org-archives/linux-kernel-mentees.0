Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C546C04A94
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Aug 2023 13:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91A9A40377;
	Sun,  6 Aug 2023 13:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91A9A40377
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wSGNzWyo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wT3I-W8LO-jK; Sun,  6 Aug 2023 13:36:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6ACE24000B;
	Sun,  6 Aug 2023 13:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ACE24000B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D0AEC0071;
	Sun,  6 Aug 2023 13:36:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7038C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 13:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB5DA4011C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 13:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB5DA4011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EW_yPCkSvPXv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 13:36:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E73524027F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Aug 2023 13:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E73524027F
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BEC5461147;
 Sun,  6 Aug 2023 13:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E84C433C8;
 Sun,  6 Aug 2023 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1691328982;
 bh=x0PpT5p+QbnzQ42XPIImjfH70NVnMPNFz0tYlMnwl5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wSGNzWyotOrdMn3jwBKbL4Ta4b/Ql9eX3Rzj6uj/uSbof6tWvunzBYVpDl48ifFbQ
 qRdnnp4KOZO2eug5qQ0mkeBr/Te64zP7e2HwtH80rTqq9/OdCe5qmG2tjnjLocuyyw
 SSeSUcxKrzsGvWHCo/H6WD6oFt+nhc1HgNBPlJQw=
Date: Sun, 6 Aug 2023 15:36:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Atul Kumar Pant <atulpant.linux@gmail.com>
Subject: Re: [PATCH v1] drivers: block: Updates return value check
Message-ID: <2023080600-pretext-corporal-61e3@gregkh>
References: <20230806122351.157168-1-atulpant.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230806122351.157168-1-atulpant.linux@gmail.com>
Cc: axboe@kernel.dk, linux-kernel-mentees@lists.linuxfoundation.org,
 josef@toxicpanda.com, nbd@other.debian.org, linux-block@vger.kernel.org,
 shuah@kernel.org
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

On Sun, Aug 06, 2023 at 05:53:51PM +0530, Atul Kumar Pant wrote:
> Updating the check of return value from debugfs_create_dir
> to use IS_ERR.

Why?

> 
> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> ---
>  drivers/block/nbd.c     | 4 ++--
>  drivers/block/pktcdvd.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 9c35c958f2c8..65ecde3e2a5b 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1666,7 +1666,7 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
>  		return -EIO;
>  
>  	dir = debugfs_create_dir(nbd_name(nbd), nbd_dbg_dir);
> -	if (!dir) {
> +	if (IS_ERR(dir)) {
>  		dev_err(nbd_to_dev(nbd), "Failed to create debugfs dir for '%s'\n",
>  			nbd_name(nbd));
>  		return -EIO;

This isn't correct, sorry.  Please do not make this change.

> @@ -1692,7 +1692,7 @@ static int nbd_dbg_init(void)
>  	struct dentry *dbg_dir;
>  
>  	dbg_dir = debugfs_create_dir("nbd", NULL);
> -	if (!dbg_dir)
> +	if (IS_ERR(dbg_dir))
>  		return -EIO;

Again, not corrct.

>  	nbd_dbg_dir = dbg_dir;
> diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
> index d5d7884cedd4..69e5a100b3cf 100644
> --- a/drivers/block/pktcdvd.c
> +++ b/drivers/block/pktcdvd.c
> @@ -451,7 +451,7 @@ static void pkt_debugfs_dev_new(struct pktcdvd_device *pd)
>  	if (!pkt_debugfs_root)
>  		return;
>  	pd->dfs_d_root = debugfs_create_dir(pd->name, pkt_debugfs_root);
> -	if (!pd->dfs_d_root)
> +	if (IS_ERR(pd->dfs_d_root))
>  		return;

Also not correct.

Why check the return value at all?  As this check has always been wrong,
why are you wanting to keep it?

Also, you never responded to our previous review comments, why not?  To
ignore people is not generally considered a good idea :(

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
