Return-Path: <SRS0=MteQ=24=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7569C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 20:41:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 685CF2072A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 20:41:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="LzfATNAF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 685CF2072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 426598513B;
	Tue,  7 Jan 2020 20:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0qKV3YXkfAtj; Tue,  7 Jan 2020 20:41:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2C5088502B;
	Tue,  7 Jan 2020 20:41:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 109ABC1D82;
	Tue,  7 Jan 2020 20:41:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 794DDC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 20:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 644D320399
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 20:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9JzMIWU55nXJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 20:41:14 +0000 (UTC)
X-Greylist: delayed 00:07:18 by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 1284D20366
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 20:41:14 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id x1so461736qvr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jan 2020 12:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3zhpjGKRs5oCN7gE0zJUv09fBYY5DJxxWR8yhyAhckI=;
 b=LzfATNAFVRCE8SAl1d6Ctk4/lJ3RQSwN2ruwf6LC27wA411ljbwylPEOr6fqE9gRJK
 /aW3Q/ojQqDrhd3inOEO0hHNcy6SAQJ1vTsbc9lFG5jVP3pvqSdDSaU8Pa5owAqvBU8B
 luGS4iid5TYnlqBU3ecv9aw61bsN9ZpBz3F+DDSVAdrPb4wNO92hWHqqoQxhrBdpv5Ph
 oPrKDojhIIATLeooNxbXC9kMnsP5qZA1e90aV/Tz4jgc5sIqaT9AIJXuDHRgZ+XbpjTv
 +nk4SnEi+FeRmci7r55ERdAASdZgPpAY02r9b46vZe0iLEDR3Xge2WCmwVarMRF8iPmL
 g1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3zhpjGKRs5oCN7gE0zJUv09fBYY5DJxxWR8yhyAhckI=;
 b=brnFEXie6bxF3/WV3zVcvKGfd0SNDZScAbeAN3dluNuvF3EWUY9DlZVJIkvTBlQq0g
 +LUwHWUQVavkBHYm4jB4EbQSlwZIg8lvLst+8csV3VTv5227vJotA9IxHvNjxINGA3GR
 aAJifoYd6v7l5eb2AyCSK98U5Lk46RM/je4oKbwq5lvClrP0GmvXlzOr01PAklpXUpS2
 TF4uzb2LOqMzCcnt3eMXsFaeV1jaWIkLCr79js5uCCMmQ3wFKHAF+aIiD8hR9/CIrq3O
 kEfJHhDVPumZkn2MBt3ip+AYv914HYcWTXtaO8B6AghC+ZnzEi/GCJm5hwglEFiADgfM
 U/eA==
X-Gm-Message-State: APjAAAXk0BpjrUkgdJErmn7AuHM3CCY8boI3XGtknjAgyFIXL1AB49lK
 hczgPj53xlHFVb8/Y9SVrxu1OmI2DSM=
X-Google-Smtp-Source: APXvYqzWbftKZEr84YWD8iGrR1oDz0h1VmVb/RITKJH7Bi68eIZnbK/lkG9EUM5l75oi0+8mHGJU/Q==
X-Received: by 2002:a05:6214:1150:: with SMTP id
 b16mr1181882qvt.71.1578429235967; 
 Tue, 07 Jan 2020 12:33:55 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id i28sm446729qtc.57.2020.01.07.12.33.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jan 2020 12:33:55 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iovY2-0001Xd-Ue; Tue, 07 Jan 2020 16:33:54 -0400
Date: Tue, 7 Jan 2020 16:33:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20200107203354.GD26174@ziepe.ca>
References: <20200107192912.22691-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107192912.22691-1-madhuparnabhowmik04@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mike.marciniszyn@intel.com, paulmck@kernel.org, linux-rdma@vger.kernel.org,
 dennis.dalessandro@intel.com, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, dledford@redhat.com, joel@joelfernandes.org,
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

On Wed, Jan 08, 2020 at 12:59:12AM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> list_for_each_entry_rcu has built-in RCU and lock checking.
> Pass cond argument to list_for_each_entry_rcu.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
>  drivers/infiniband/hw/hfi1/verbs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/hfi1/verbs.c b/drivers/infiniband/hw/hfi1/verbs.c
> index 089e201d7550..e6abdbcb4ffb 100644
> +++ b/drivers/infiniband/hw/hfi1/verbs.c
> @@ -515,7 +515,8 @@ static inline void hfi1_handle_packet(struct hfi1_packet *packet,
>  				       opa_get_lid(packet->dlid, 9B));
>  		if (!mcast)
>  			goto drop;
> -		list_for_each_entry_rcu(p, &mcast->qp_list, list) {
> +		list_for_each_entry_rcu(p, &mcast->qp_list, list,
> +					lock_is_held(&(ibp->rvp.lock).dep_map)) {

Why .dep_map? Does this compile?

Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
