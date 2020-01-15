Return-Path: <SRS0=QLdQ=3E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E4BC33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 15:06:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A7642084D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 15:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A7642084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 13DA184426;
	Wed, 15 Jan 2020 15:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSSHMsjFJj-e; Wed, 15 Jan 2020 15:05:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5F41885082;
	Wed, 15 Jan 2020 15:05:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E23DC1D83;
	Wed, 15 Jan 2020 15:05:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACF6EC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A99CE203EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZdZmf4IfVHBa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:05:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by silver.osuosl.org (Postfix) with ESMTPS id DF5392042B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:05:49 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f129so214152wmf.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 07:05:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l+nye/BYJZe7Bw5ayLtgP5rQcdwwOtxIDTaqQZhLPlA=;
 b=CxAepv3ehOKVnU52rXCVDISzwXB17pD3d7z4hW6WvNpj5q6gepiMC1eY+MeduO9BIX
 xUDY2VkSYkm/xxij3leS6KGkt7lx1wtPxjSCbr5Fm9COmNbjIuT1Yrj4l9f8u8sAeaKd
 ujGbdbw7UCsjAKQzcc/GU8jLHOFeDFTfuLWJQ5Df6n6YcWl2GZRaWMeDD2Kk4f1aPVdq
 gZitAqARrmTctj06hEm35+sOJ4l65wy1V3J1fckdQ2vEGd4HOdAS3IiZu/MtCHuCOBKX
 FKEgT7SLMt5clmMfrBvMmVvbY4/OCFrRq25+IN6ZhohlQvWp5oLI5IvFEg19PYJermQs
 ti6w==
X-Gm-Message-State: APjAAAUYxxtSm46DnhqJ65z16ZPuJEBzVE8IAo36tUnDFKaCjRQH2HAW
 ZjI95h+Vjo6nPGjpGjzGaSU=
X-Google-Smtp-Source: APXvYqztGYFP1LUF57lEbPErN/f7VP1qI9rU2yAcdmhylE8alEK9YH4yvGaqdMcNcSqYuH4XY8iHQg==
X-Received: by 2002:a1c:dc08:: with SMTP id t8mr173641wmg.139.1579100748472;
 Wed, 15 Jan 2020 07:05:48 -0800 (PST)
Received: from debian (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id r62sm148422wma.32.2020.01.15.07.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 07:05:47 -0800 (PST)
Date: Wed, 15 Jan 2020 15:05:45 +0000
From: Wei Liu <wei.liu@kernel.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20200115150545.j5gu7lm3l3ouv7l4@debian>
References: <20200115141840.10553-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115141840.10553-1-madhuparnabhowmik04@gmail.com>
User-Agent: NeoMutt/20180716
Cc: wei.liu@kernel.org, paulmck@kernel.org, paul@xen.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joel@joelfernandes.org,
 xen-devel@lists.xenproject.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] net: xen-netback: hash.c: Use
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

On Wed, Jan 15, 2020 at 07:48:40PM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> list_for_each_entry_rcu has built-in RCU and lock checking.
> Pass cond argument to list_for_each_entry_rcu.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

You seem to have dropped the second hunk which modified
xenvif_flush_hash, is that a mistake?

Wei.

> ---
>  drivers/net/xen-netback/hash.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/xen-netback/hash.c b/drivers/net/xen-netback/hash.c
> index 10d580c3dea3..3f9783f70a75 100644
> --- a/drivers/net/xen-netback/hash.c
> +++ b/drivers/net/xen-netback/hash.c
> @@ -51,7 +51,8 @@ static void xenvif_add_hash(struct xenvif *vif, const u8 *tag,
>  
>  	found = false;
>  	oldest = NULL;
> -	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link) {
> +	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
> +				lockdep_is_held(&vif->hash.cache.lock)) {
>  		/* Make sure we don't add duplicate entries */
>  		if (entry->len == len &&
>  		    memcmp(entry->tag, tag, len) == 0)
> -- 
> 2.17.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
