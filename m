Return-Path: <SRS0=QLdQ=3E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3C9C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 13:56:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EB3D222C3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 13:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EB3D222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ED50585707;
	Wed, 15 Jan 2020 13:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NuE1TBjchlr9; Wed, 15 Jan 2020 13:56:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 15FF58552C;
	Wed, 15 Jan 2020 13:56:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1E4CC1D83;
	Wed, 15 Jan 2020 13:56:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B4A5C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 13:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0220985F56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 13:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eT2n9hK3WkwC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 13:56:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 242FE85F84
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 13:56:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y11so15829612wrt.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 05:56:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UVc+vS25sl77DRieZ7fqDsmqFprVJrI4fDKBKV1QbSs=;
 b=sixYg0lsMA/p5cLkUiXjrrDc98jY5D0eFHEYb9o1ZU/Aemjz3xMRTvjiSUJCB1iQGR
 lBjPtMAkAFq0GNYToENnP5HI74bLFKEAgcikTI0GYfrloCIkO6ws/ZnCB5QtlBZzgYXg
 77ha14H4BEfLuYndpHR1zDh/9KNJS7S5/0S3Kd/ehmv2Vx6M9X19uafB1KdPSKowpH1v
 LyCSlu27LGvCJ4Dazt8GWO/NCf+dWIthRtpI+hCb2XkbmaE4Fj7pk+MAFDhyRD+81nJ5
 FZHioIGmKwaRaTmceMpaeOoNp1CpY/7QJGcfp4G0NnzKI/gLemU47/ssqPwvrSXh0SLe
 lbXw==
X-Gm-Message-State: APjAAAXQKg3lpeBQSvM+WZXrlFHaThg5pMw0fJoUmHeyB9vofJYxDXl9
 eQfdLcXC2YRN9wsMhnHa61M=
X-Google-Smtp-Source: APXvYqyXYe4s0+Dcy7oHJR4GBgwa+hNOEdtdbuIIeeHe/ERVxkCyU9BEoy570XvbPj01KdjYPiKSMQ==
X-Received: by 2002:adf:df90:: with SMTP id z16mr33198153wrl.273.1579096594676; 
 Wed, 15 Jan 2020 05:56:34 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id r6sm25367610wrq.92.2020.01.15.05.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 05:56:33 -0800 (PST)
Date: Wed, 15 Jan 2020 13:56:31 +0000
From: Wei Liu <wei.liu@kernel.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20200115135631.edr2nrfkycppxcku@debian>
References: <20200115124129.5684-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115124129.5684-1-madhuparnabhowmik04@gmail.com>
User-Agent: NeoMutt/20180716
Cc: wei.liu@kernel.org, paulmck@kernel.org, paul@xen.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joel@joelfernandes.org,
 xen-devel@lists.xenproject.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: xen-netbank: hash.c: Use
	built-in RCU list checking
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

Thanks for the patch.

There is a typo in the subject line. It should say xen-netback, not
xen-netbank.

On Wed, Jan 15, 2020 at 06:11:28PM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> list_for_each_entry_rcu has built-in RCU and lock checking.
> Pass cond argument to list_for_each_entry_rcu.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> ---
>  drivers/net/xen-netback/hash.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/xen-netback/hash.c b/drivers/net/xen-netback/hash.c
> index 10d580c3dea3..30709bc9d170 100644
> --- a/drivers/net/xen-netback/hash.c
> +++ b/drivers/net/xen-netback/hash.c
> @@ -51,7 +51,8 @@ static void xenvif_add_hash(struct xenvif *vif, const u8 *tag,
>  
>  	found = false;
>  	oldest = NULL;
> -	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link) {
> +	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
> +							lockdep_is_held(&vif->hash.cache.lock)) {

There are probably too many tabs here. Indentation looks wrong.

The surrounding code makes it pretty clear that the lock is already held
by the time list_for_each_entry_rcu is called, yet the checking involved
in lockdep_is_held is not trivial, so I'm afraid I don't consider this a
strict improvement over the existing code.

If there is something I misunderstood, let me know.

Wei.

>  		/* Make sure we don't add duplicate entries */
>  		if (entry->len == len &&
>  		    memcmp(entry->tag, tag, len) == 0)
> @@ -102,7 +103,8 @@ static void xenvif_flush_hash(struct xenvif *vif)
>  
>  	spin_lock_irqsave(&vif->hash.cache.lock, flags);
>  
> -	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link) {
> +	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
> +							lockdep_is_held(&vif->hash.cache.lock)) {
>  		list_del_rcu(&entry->link);
>  		vif->hash.cache.count--;
>  		kfree_rcu(entry, rcu);
> -- 
> 2.17.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
