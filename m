Return-Path: <SRS0=o+/b=25=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8857AC00523
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jan 2020 08:09:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57E18206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jan 2020 08:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="LzfATNAF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57E18206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C86885465;
	Wed,  8 Jan 2020 08:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xMua8UJjrOdo; Wed,  8 Jan 2020 08:09:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 027A585074;
	Wed,  8 Jan 2020 08:09:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2DDDC1D81;
	Wed,  8 Jan 2020 08:09:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B42EC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 08:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 107A685456
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 08:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3Ee3rLUdHbF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 08:09:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 519FC85404
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 08:09:04 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id c23so808731plz.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 08 Jan 2020 00:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:delivered-to
 :dkim-signature:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=pWMRRJPRezwPs4iq5fWrQ6pZB0HSYTQHjNjUmxwN4ms=;
 b=MmUPaDItrEKUw+nvim0FqoKUMZTGWfcJOr/TXBl+sit+X6JyKxZwONWFmAQCy6eBFi
 GYagQqxjPCM3cWXBjW2Oe7Lh+QKrWp2nI2iE3NMTf9Y6vGM8UR5PBgPDEJZbF6VBayin
 meOSTHsGReOjIppJROqr4hctTkARF73jDJbXoQ/khuLfbdYNInl/MPxP493FLMdjA8td
 3Hv2ESAHMC1fa6LsA8ZF253PzJA3N3XgBYdTj0cKTGEmztCXme6Qe/I2UvvK5SmQauKL
 JsVdLJCCydv61BS0539vclPC7tFd55Cua/gMTEpZKS7oT1udMIMWJixtShtnpNVebCWH
 95oQ==
X-Gm-Message-State: APjAAAULz0NYV+Kj5SGGYvXEFXVUSeNiY4tWRewIu6WFSByUpf03xyU0
 SzYkI66pTl9l3yLH+dsW9MM=
X-Google-Smtp-Source: APXvYqzcc1fWh8xLcHcWTqK1dlRyrjvE/YvZ+CbCeZbZxlWnNJEmkUAbHCFRPCU6emWJMD8XcZKXAw==
X-Received: by 2002:a17:90a:fc82:: with SMTP id
 ci2mr2961169pjb.13.1578470943747; 
 Wed, 08 Jan 2020 00:09:03 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee6:eec1:7443:e8d6:e559:22e2])
 by smtp.gmail.com with ESMTPSA id c14sm2276460pfn.8.2020.01.08.00.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 00:09:03 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: jgg@ziepe.ca,
	madhuparnabhowmik04@gmail.com
Date: Wed,  8 Jan 2020 13:38:50 +0530
Message-Id: <20200107203354.GD26174@ziepe.ca>
X-Mailer: git-send-email 2.17.1
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee6:eec1:7443:e8d6:e559:22e2])
 by smtp.gmail.com with ESMTPSA id x21sm2212809pfn.164.2020.01.08.00.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 00:06:08 -0800 (PST)
X-Mailer: git-send-email 2.17.1
Received: by 2002:ac9:32e7:0:0:0:0:0 with SMTP id o36csp527349occ;
 Tue, 7 Jan 2020 12:33:56 -0800 (PST)
X-Received: by 2002:a05:620a:228:: with SMTP id
 u8mr1198248qkm.88.1578429236735; 
 Tue, 07 Jan 2020 12:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578429236; cv=none;
 d=google.com; s=arc-20160816;
 b=DjaH4m81MAwsDRUetxLNPAV2YuxcjgIZJnWh5Y4C4SvISeE22EJipZgsE3LfpxJzio
 H3pCoZy3qxNY9b4AT5QZdYWG/cDb73KE4+8qP50QMLe4OK13X+c8/xWoOhOizewedcuD
 YDA4lWq58Ze+dcLjsoGorDaMIesCQeQI02uB28KRkey8rWFld5lbzYIDHGdsGeSfbV9U
 aLvqCWxOMnnVim2z8Fi0AXBDZWeJW6/R0LFMqUZObuMw8v6Bitk2ZqWdMs2l3GkTwIk4
 l7ZGwOrLQWPS3vQjp+fOsWyebMeBmPJmyxs3htFeQC9JA+5PhXEvJ27uJLFLT3nlaj+X
 MCpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; 
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:dkim-signature;
 bh=3zhpjGKRs5oCN7gE0zJUv09fBYY5DJxxWR8yhyAhckI=;
 b=DYe8MmpXKd1fVNQ/DHibxTPUurcFgw60qxWY8ffDaK57LsQ8xyWd/4BNQahq4gvUoH
 dksIkPgD7oHO2Vk4xT5Lot9VniDLncz8zeCwCwnpGoYcrB8xg+5+S89YAc0+ws01mWyO
 cnPO6jo7mzjV6I9gfmiLD3X/SOQVDeuwuTsxrcr0CQULiQXrKtIhHi9VV7Y+u2P6lgce
 1LzL4tiPrpOJYr1286urnbsQhSz/1GRrXVe8AAHJ5e3m/tl96WltqEkrrte1Dwf/rEnh
 KmsJgsC5zwnQFf+VXmE3epcqN6F035d8rievBNkGELYsHcH1c+m/P4M2GERIw+lfauI7
 xaZg==
ARC-Authentication-Results: i=1; mx.google.com;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=LzfATNAF;
 spf=pass (google.com: domain of jgg@ziepe.ca designates 209.85.220.65 as
 permitted sender) smtp.mailfrom=jgg@ziepe.ca
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com.
 [209.85.220.65])
 by mx.google.com with SMTPS id h20sor759663qvv.38.2020.01.07.12.33.56
 for <madhuparnabhowmik04@gmail.com> (Google Transport Security);
 Tue, 07 Jan 2020 12:33:56 -0800 (PST)
Received-SPF: pass (google.com: domain of jgg@ziepe.ca designates
 209.85.220.65 as permitted sender) client-ip=209.85.220.65; 
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
Message-ID: <20200108080850.y8_V2Q9knvWcbA61rlXhN6e8osCqqVsdnXR3FVAZBsw@z>

From: madhuparnabhowmik04@gmail.com

From: Jason Gunthorpe <jgg@ziepe.ca>

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

Yes, it compiles.

Alternatively, it can be lockdep_is_held(ibp->rvp.lock).
Please refer to the macro(link below) and let me know if the usage of lock_is_held()
in the patch is correct.

https://elixir.bootlin.com/linux/v5.5-rc2/source/include/linux/lockdep.h#L364

Thanks,
Madhuparna

Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
