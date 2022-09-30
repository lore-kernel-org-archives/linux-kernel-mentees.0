Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BF6C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Sep 2022 12:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED071400FD;
	Fri, 30 Sep 2022 12:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED071400FD
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TEpa35aP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id caBM25TKiAIh; Fri, 30 Sep 2022 12:01:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DAD8D402F2;
	Fri, 30 Sep 2022 12:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAD8D402F2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA6AFC0033;
	Fri, 30 Sep 2022 12:01:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EB22C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Sep 2022 12:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AABD401BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Sep 2022 12:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AABD401BC
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=TEpa35aP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uGs2Umh1uwrz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Sep 2022 12:01:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1245B40100
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1245B40100
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Sep 2022 12:01:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F37026230D;
 Fri, 30 Sep 2022 12:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDA8C433C1;
 Fri, 30 Sep 2022 12:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1664539297;
 bh=WZzX794V9cagudvFHu1WJf2NrlOx/oVKtEOLe82Lt50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TEpa35aPjU1X8g041BdEMvwePCqUTcnpTx0QkQ7wkBLP9onCYsKJ3NRpzsr36mrnt
 EVWUip9v4DqWjRTz79FzpJKdp3iikzn1alAO5MtcsxKunJAYGP55jkEAGEFuzbf7Z2
 PmFtMZX5H8rB5O6ivd9eQ74YMjehU5OQEYoEOcEA=
Date: Fri, 30 Sep 2022 14:01:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Praghadeesh T K S <praghadeeshthevendria@gmail.com>
Subject: Re: [PATCH] net: ethernet/mellanox: fix dereference before null check
Message-ID: <Yzbanh3V4jtgcih0@kroah.com>
References: <20220930114335.608894-1-praghadeeshthevendria@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220930114335.608894-1-praghadeeshthevendria@gmail.com>
Cc: praghadeeshtks@zohomail.in, Leon Romanovsky <leon@kernel.org>,
 Boris Pismenny <borisp@nvidia.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Fri, Sep 30, 2022 at 05:13:35PM +0530, Praghadeesh T K S wrote:
> net: ethernet/mellanox: fix dereference before null check
> macsec dereferenced before null check
> bug identified by coverity's linux-next weekly scan
> Coverity CID No: 1525317
> 
> Signed-off-by: Praghadeesh T K S <praghadeeshthevendria@gmail.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c
> index 5da746d..e822c2a 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/macsec.c
> @@ -1846,11 +1846,11 @@ int mlx5e_macsec_init(struct mlx5e_priv *priv)
>  void mlx5e_macsec_cleanup(struct mlx5e_priv *priv)
>  {
>  	struct mlx5e_macsec *macsec = priv->macsec;
> -	struct mlx5_core_dev *mdev = macsec->mdev;
>  
>  	if (!macsec)
>  		return;
>  
> +	struct mlx5_core_dev *mdev = macsec->mdev;
>  	mlx5_notifier_unregister(mdev, &macsec->nb);
>  
>  	mlx5e_macsec_fs_cleanup(macsec->macsec_fs);

Always test-build your changes before you get a grumpy maintainer asking
why you didn't test-build your changes...

Also, the original code is just fine, Coverity is wrong here, don't you
think?  Look at the output of what the code is doing please...

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
