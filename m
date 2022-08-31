Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD18BECAAD1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 31 Aug 2022 14:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C668610DC;
	Wed, 31 Aug 2022 14:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C668610DC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yshzeEpq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AA6587asdtMj; Wed, 31 Aug 2022 14:58:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4F642610DD;
	Wed, 31 Aug 2022 14:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F642610DD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32B18C0032;
	Wed, 31 Aug 2022 14:58:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 263C1C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 14:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDE7441717
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 14:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDE7441717
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=yshzeEpq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xK0n3CLvCfAd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 14:58:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3D7A416E7
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3D7A416E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 14:58:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C156C61B68;
 Wed, 31 Aug 2022 14:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F72FC433D6;
 Wed, 31 Aug 2022 14:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661957930;
 bh=dHdAtSNFczMa5SahuO8kpen8QKzLYM4RqqTL7DvJxtY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yshzeEpq9LzzS954o22uUQP3Ql6tTP99Kl3IubCbhjf/yYuI8BcfpMkK7eIiKfV/M
 tJOjv4GkUq7+L/7yDRuIzWrvLHqCu+Yz3qbAamEAN44r/VAa/79rxcYddYk5+POzPB
 47rMj9/4QxjBVrBgBhTY4mpIreSrMCqAL1P+YfOA=
Date: Wed, 31 Aug 2022 16:58:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [PATCH v2] xfrm: ipcomp: Update ipcomp_scratches with NULL if
 alloc fails
Message-ID: <Yw93JsVUG0u1cmfe@kroah.com>
References: <00000000000092839d0581fd74ad@google.com>
 <20220831142938.5882-1-khalid.masum.92@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220831142938.5882-1-khalid.masum.92@gmail.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
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

On Wed, Aug 31, 2022 at 08:29:38PM +0600, Khalid Masum wrote:
> Currently if ipcomp_alloc_scratches() fails to allocate memory
> ipcomp_scratches holds obsolete address. So when we try to free the
> percpu scratches using ipcomp_free_scratches() it tries to vfree non
> existent vm area. Described below:
> 
> static void * __percpu *ipcomp_alloc_scratches(void)
> {
> 	...
> 	scratches = alloc_percpu(void *);
>         if (!scratches)
>                 return NULL;
> ipcomp_scratches does not know about this allocation failure.
> Therefore holding the old obsolete address.
>         ...
> }
> 
> So when we free,
> 
> static void ipcomp_free_scratches(void)
> {
> 	...
> 
>         scratches = ipcomp_scratches;
> Receiving obsolete addresses from ipcomp_scratches
>         
> 	if (!scratches)
>                 return;
> 
>         for_each_possible_cpu(i)
>                vfree(*per_cpu_ptr(scratches, i));
> Trying to free non existent page, causing warning.
> 
>         ...
> }
> 
> Fix this breakage by updating ipcomp_scratches with NULL if
> the above mentioned allocation fails.
> 
> Reported-and-tested-by: syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> 
> ---
> diff --git a/net/xfrm/xfrm_ipcomp.c b/net/xfrm/xfrm_ipcomp.c
> index cb40ff0ff28d..17815cde8a7f 100644
> --- a/net/xfrm/xfrm_ipcomp.c
> +++ b/net/xfrm/xfrm_ipcomp.c
> @@ -215,7 +215,7 @@ static void * __percpu *ipcomp_alloc_scratches(void)
>  
>  	scratches = alloc_percpu(void *);
>  	if (!scratches)
> -		return NULL;
> +		return ipcomp_scratches = NULL;
>  
>  	ipcomp_scratches = scratches;
>  

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
