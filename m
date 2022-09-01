Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA1CECAAD3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Sep 2022 07:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50EC9404D5;
	Thu,  1 Sep 2022 07:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50EC9404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7e1hJ9yBo9p; Thu,  1 Sep 2022 07:49:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 50065400BB;
	Thu,  1 Sep 2022 07:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50065400BB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 369ACC0032;
	Thu,  1 Sep 2022 07:49:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 501ABC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 07:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DFAF60BBF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 07:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DFAF60BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7j48FcJUgFFK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 07:49:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 768FC60A87
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 768FC60A87
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 07:49:01 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1oTewD-00HUk4-KZ; Thu, 01 Sep 2022 17:48:34 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 01 Sep 2022 15:48:33 +0800
Date: Thu, 1 Sep 2022 15:48:33 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [PATCH v4] xfrm: Update ipcomp_scratches with NULL when freed
Message-ID: <YxBj0QAdRaVZCr9i@gondor.apana.org.au>
References: <00000000000092839d0581fd74ad@google.com>
 <20220901071210.8402-1-khalid.masum.92@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901071210.8402-1-khalid.masum.92@gmail.com>
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

On Thu, Sep 01, 2022 at 01:12:10PM +0600, Khalid Masum wrote:
> Currently if ipcomp_alloc_scratches() fails to allocate memory
> ipcomp_scratches holds obsolete address. So when we try to free the
> percpu scratches using ipcomp_free_scratches() it tries to vfree non
> existent vm area. Described below:
> 
> static void * __percpu *ipcomp_alloc_scratches(void)
> {
>         ...
>         scratches = alloc_percpu(void *);
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
>         ...
>         scratches = ipcomp_scratches;
> Assigning obsolete address from ipcomp_scratches
> 
>         if (!scratches)
>                 return;
> 
>         for_each_possible_cpu(i)
>                vfree(*per_cpu_ptr(scratches, i));
> Trying to free non existent page, causing warning: trying to vfree
> existent vm area.
>         ...
> }
> 
> Fix this breakage by updating ipcomp_scrtches with NULL when scratches
> is freed
> 
> Suggested-by: Herbert Xu <herbert@gondor.apana.org.au>
> Reported-by: syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
> Tested-by: syzbot+5ec9bb042ddfe9644773@syzkaller.appspotmail.com
> Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
