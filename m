Return-Path: <SRS0=164v=Z4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B44C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 16:00:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA6E22173E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 16:00:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="lnAxMEOE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA6E22173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE1B48775C;
	Fri,  6 Dec 2019 16:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n3h1tkxG7EOC; Fri,  6 Dec 2019 16:00:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ADE968773E;
	Fri,  6 Dec 2019 16:00:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A23C9C18DD;
	Fri,  6 Dec 2019 16:00:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE6E6C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 16:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B7B0520503
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 16:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3LGj0reT0Xh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 16:00:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 20F76253CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 16:00:04 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id h14so3533722pfe.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Dec 2019 08:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Yp4NDcto5u3LEI/hPsxbY59xGgx6y4i/6vjXYjtnjow=;
 b=lnAxMEOEHX+2ySVymkjh100nDEHcIL4fsUSOKlWMR5nDBzDCp4AATKxrpWzWyI8Dk4
 zg58wU4yvgBvfrNP1HGcAvWjaydR5zG2JJOEldi2nbebNK0efx4k8YZTKryX3VIvQOyb
 lo74CFW4MxylA/c6L7/iqA0GePoca2b3t8d3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Yp4NDcto5u3LEI/hPsxbY59xGgx6y4i/6vjXYjtnjow=;
 b=ZY5k85ufXeS618J+ijGl3jcpiY+O6aQZzB5OXi+q+KwADEEUETdMnRcCc+hWeYoVOY
 rX0310HiHfvoA9y4mk2xy5WqBk2qZ4iHpo4cGrLPfzGVTSRGf4ONLpJdU+xM5CPJ3zDL
 2nf7JmuuJGLPLHsrWjYnLSvwjBnTkFZYurgzuG8yqXBEwTDh1fLNyk63NnlpLUQ40H+Y
 rrs00bb2wVisDu0k9ZuIkKeLKz1FLuw5bql4EEhrRUABnDu8Lwhfa/WIGnS8R83GN3Pf
 IuCHewUPGRw3fF0wgNvffPFr6kqPOZ1u12daePdkrSmHu76mtdxSglRIVo4knF0FujYZ
 QW+w==
X-Gm-Message-State: APjAAAXQUWPsT7UyZHDkFZfIaqacMA4jGMLlOYxKX/ax35APaoeBJhyB
 IVSI6oV6WckxmdPAqUjXK3DpDg==
X-Google-Smtp-Source: APXvYqypv1DWB8/LOdDKSMQkxkwrrdr8pO+nq2V/VfOTVcMO5ym9WNe6AXU+sPVo6aMYwGOSopGp9Q==
X-Received: by 2002:aa7:9315:: with SMTP id 21mr15127246pfj.187.1575648003565; 
 Fri, 06 Dec 2019 08:00:03 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id d14sm3740684pjz.12.2019.12.06.08.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 08:00:03 -0800 (PST)
Date: Fri, 6 Dec 2019 11:00:02 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20191206160002.GB15547@google.com>
References: <20191206151640.10966-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191206151640.10966-1-madhuparnabhowmik04@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-nfs@vger.kernel.org, paulmck@kernel.org, linux-kernel@vger.kernel.org,
 anna.schumaker@netapp.com, rcu@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 trond.myklebust@hammerspace.com
Subject: Re: [Linux-kernel-mentees] [PATCH 2/2] fs: nfs: dir.c: Fix sparse
	error
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

+Paul, here is the dependent patch for the list_prev_rcu() patch Madhuparna
posted.

On Fri, Dec 06, 2019 at 08:46:40PM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> This patch fixes the following errors:
> fs/nfs/dir.c:2353:14: error: incompatible types in comparison expression (different address spaces):
> fs/nfs/dir.c:2353:14:    struct list_head [noderef] <asn:4> *
> fs/nfs/dir.c:2353:14:    struct list_head *
> 
> caused due to directly accessing the prev pointer of
> a RCU protected list.
> Accessing the pointer using the macro list_prev_rcu() fixes this error.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> ---
>  fs/nfs/dir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
> index e180033e35cf..2035254cc283 100644
> --- a/fs/nfs/dir.c
> +++ b/fs/nfs/dir.c
> @@ -2350,7 +2350,7 @@ static int nfs_access_get_cached_rcu(struct inode *inode, const struct cred *cre
>  	rcu_read_lock();
>  	if (nfsi->cache_validity & NFS_INO_INVALID_ACCESS)
>  		goto out;
> -	lh = rcu_dereference(nfsi->access_cache_entry_lru.prev);
> +	lh = rcu_dereference(list_prev_rcu(&nfsi->access_cache_entry_lru));
>  	cache = list_entry(lh, struct nfs_access_entry, lru);
>  	if (lh == &nfsi->access_cache_entry_lru ||
>  	    cred != cache->cred)
> -- 
> 2.17.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
