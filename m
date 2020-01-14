Return-Path: <SRS0=Bxrf=3D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D601BC33CB2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 16:57:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC152084D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 16:57:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="XTiJWkcP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC152084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6D3CE20767;
	Tue, 14 Jan 2020 16:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hX6ob3EUiTnP; Tue, 14 Jan 2020 16:57:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 244712075B;
	Tue, 14 Jan 2020 16:57:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 185B1C1D83;
	Tue, 14 Jan 2020 16:57:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 078A2C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 16:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EA27A85F9D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 16:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RKk_8m2XIvj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 16:57:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D089685FA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 16:57:42 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id f16so5979720qvi.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 08:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R4InSAKuZ5aCK6QR9Y31K9i3lSVfiJudcKWrhEMNHDc=;
 b=XTiJWkcP0CtYyjzpFYIsdheUjlKBCgS/2w+rJ6OzGCRSJQhoTM3fQPNtiylHKjRsUx
 ayrC2dfUPa3VHxwXtXRAfyuvl5IzL+Clvwtq9p5vFydeY08ncMvtJVlB2PIhe1Cr/Vxv
 DjZgNqeXb4lAgJNIfthyvvgBbP5uaC7dd9oRB4BrVhPE3xX7sATluJtjrCp3PwSdUUoh
 v++u0APj+AaMOwdR3P4C+tYqR1iVvC+ZimG54pzqKaU8TmJ6OcvkixJgzhq+fEJjJ+5D
 JUg1ZiQTPSazNN7A6pMwjLwBMZkHicU2mpVIpCH4LnOO/G9OWeZHvoORlWe2FiaeMlFF
 rKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R4InSAKuZ5aCK6QR9Y31K9i3lSVfiJudcKWrhEMNHDc=;
 b=lmV8Nm/J7F7jd7QmTFdifaKcLkDLqEfGoLfaUAzuPYkPfUVLj7tIExI1q4VyvIGqcv
 l5Ii7Af9Y662Q7tBUsQ8iChjyRebKjKJUmbgPmUthS9Yn2Ru9Nkyi39hRpzJrDnuHAoR
 0+6Dw3HQo/xJ1lz6Rvfzc2RGWHkNE+w+D9P1xI5qrt7vVw1dIwxN3oyFSophEZ1pFctN
 +4RVs8q+jRTY2WWK3PmadQ3jxzLX+kh+JwINU6Um0q/4Q0faZ0qIyoJgMJeBr2/siiBC
 w+HEgPWxR4UJcA9eay7YepYrhEovmUrQv2VHIJ+v2diMpj14MzdpjALRI41npo9rUJWB
 qmxw==
X-Gm-Message-State: APjAAAULn8qWngmdScyDXiMp/bAYPcgSWt896QvVl+QHbTmTM5rmfWmO
 KrPMA2XmAxlxXVzz6Wp1en4h3g==
X-Google-Smtp-Source: APXvYqxAwJK6KP985x5SBiObouJjRK4aFNXWGUGpgf/HH+9wFqdlGTn1tzkvG8CrF/UY6GDih4BbRQ==
X-Received: by 2002:a0c:fe8d:: with SMTP id d13mr21133077qvs.150.1579021061827; 
 Tue, 14 Jan 2020 08:57:41 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id j1sm6868284qkl.86.2020.01.14.08.57.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Jan 2020 08:57:41 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1irPVc-0003VV-RT; Tue, 14 Jan 2020 12:57:40 -0400
Date: Tue, 14 Jan 2020 12:57:40 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20200114165740.GB22037@ziepe.ca>
References: <20200114162345.19995-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114162345.19995-1-madhuparnabhowmik04@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mike.marciniszyn@intel.com, paulmck@kernel.org, linux-rdma@vger.kernel.org,
 dennis.dalessandro@intel.com, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/3] infiniband: hw: hfi1:
 verbs.c: Use built-in RCU list checking
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

On Tue, Jan 14, 2020 at 09:53:45PM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> list_for_each_entry_rcu has built-in RCU and lock checking.
> Pass cond argument to list_for_each_entry_rcu.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
>  drivers/infiniband/hw/hfi1/verbs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/hfi1/verbs.c b/drivers/infiniband/hw/hfi1/verbs.c
> index 089e201d7550..22f2d4fd2577 100644
> +++ b/drivers/infiniband/hw/hfi1/verbs.c
> @@ -515,7 +515,7 @@ static inline void hfi1_handle_packet(struct hfi1_packet *packet,
>  				       opa_get_lid(packet->dlid, 9B));
>  		if (!mcast)
>  			goto drop;
> -		list_for_each_entry_rcu(p, &mcast->qp_list, list) {
> +		list_for_each_entry_rcu(p, &mcast->qp_list, list, lockdep_is_held(&(ibp->rvp.lock))) {

Okay, this looks reasonable

Mike, Dennis, is this the right lock to test?

Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
