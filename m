Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04DBECAAD4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 31 Aug 2022 09:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 206CF82A56;
	Wed, 31 Aug 2022 09:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 206CF82A56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6urTTuIzq21h; Wed, 31 Aug 2022 09:56:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3294F828DE;
	Wed, 31 Aug 2022 09:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3294F828DE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11322C0033;
	Wed, 31 Aug 2022 09:56:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8FCAC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 09:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FEE941865
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 09:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FEE941865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9R0oe7H3vLpu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 09:55:56 +0000 (UTC)
X-Greylist: delayed 00:41:36 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39FD941849
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39FD941849
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Aug 2022 09:55:56 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1oTJnF-00H6FV-EG; Wed, 31 Aug 2022 19:13:54 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Wed, 31 Aug 2022 17:13:53 +0800
Date: Wed, 31 Aug 2022 17:13:53 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [PATCH] xfrm: Don't increase scratch users if allocation fails
Message-ID: <Yw8mUVCdov6l3Cun@gondor.apana.org.au>
References: <00000000000092839d0581fd74ad@google.com>
 <20220831014126.6708-1-khalid.masum.92@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220831014126.6708-1-khalid.masum.92@gmail.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org,
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

On Wed, Aug 31, 2022 at 07:41:26AM +0600, Khalid Masum wrote:
> ipcomp_alloc_scratches() routine increases ipcomp_scratch_users count
> even if it fails to allocate memory. Therefore, ipcomp_free_scratches()
> routine, when triggered, tries to vfree() non existent percpu 
> ipcomp_scratches.
> 
> To fix this breakage, do not increase scratch users count if
> ipcomp_alloc_scratches() fails to allocate scratches.
> 
> Reported-and-tested-by: syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
> ---
>  net/xfrm/xfrm_ipcomp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/net/xfrm/xfrm_ipcomp.c b/net/xfrm/xfrm_ipcomp.c
> index cb40ff0ff28d..af9097983139 100644
> --- a/net/xfrm/xfrm_ipcomp.c
> +++ b/net/xfrm/xfrm_ipcomp.c
> @@ -210,13 +210,15 @@ static void * __percpu *ipcomp_alloc_scratches(void)
>  	void * __percpu *scratches;
>  	int i;
>  
> -	if (ipcomp_scratch_users++)
> +	if (ipcomp_scratch_users) {
> +		ipcomp_scratch_users++;
>  		return ipcomp_scratches;
> -
> +	}
>  	scratches = alloc_percpu(void *);
>  	if (!scratches)
>  		return NULL;
>  
> +	ipcomp_scratch_users++;
>  	ipcomp_scratches = scratches;

This patch is broken because on error we will always call
ipcomp_free_scratches which frees any partially allocated memory
and restores ipcomp_scratch_users to zero.

With this patch ipcomp_scratch_users will turn negative on error.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
