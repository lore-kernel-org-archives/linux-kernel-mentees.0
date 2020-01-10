Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037D9C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 15:47:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C238D20721
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 15:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="LcxSVzG5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C238D20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9DC6B8846E;
	Fri, 10 Jan 2020 15:47:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0XDhxta2qofj; Fri, 10 Jan 2020 15:47:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 13FF388456;
	Fri, 10 Jan 2020 15:47:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBA31C1D7D;
	Fri, 10 Jan 2020 15:47:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A4BAC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2274987120
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mpKa4FTx-cXM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:47:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9E21C8568D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:47:24 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id p14so1326006pfn.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 07:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z4ABlzGfi6l9NY75xhWGkqHQ22z62lYF4lGV0Z/l5RI=;
 b=LcxSVzG5beLFAGBipNshQyqz86YJ4TvGiOt8WALynXqSjPkkq7quMQSkFPFePo5f1q
 kJd0E4o7b+dPaAwBlXzfg5j5FKpHhUCAp057Fb328BFbzN8FK/VNHdiDhDR1bzkAooFs
 EzOxEsiGw18GT7yVSM8MCsgBXWLwE304YYV4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z4ABlzGfi6l9NY75xhWGkqHQ22z62lYF4lGV0Z/l5RI=;
 b=qgTK3La5xcxe2xhE0t30JvN7HrUrjzR46Wpwg9BDNNNqNB8eAo9HJEYzzCE5zBI0tk
 1HyqIPXMSr3a17//irAYW0IEo+Vk4vro4whn5Mq/FYaRuU28pVlPGew71E1Helh9vcwn
 iUwbR+smQBx6YkaYu+s5VFGwOoaPxPYt/XVQS3OWMgbf89KWW5OBs+DhsLaLmMcm660b
 Oq7spbCRNIXFQgjcAZoJAWEgD2LJ4s23pA9CBc/rXa7uKrehQWuUxyOtL2a95ZApex22
 U9oL/OSU6PyHu52rbo9faQ9y0OI5v+S+s8p+D+btN7nqR6JPdNh+xKmuMep4qwJv6EkE
 2LvQ==
X-Gm-Message-State: APjAAAUE8KhtxTkSMzrApfGwQJybo9fXYWM6W4UBXGXpG5KZdRFkhSvV
 PmIRF7DJECpLQhRQTOGVI8UPSQ==
X-Google-Smtp-Source: APXvYqwJtzElrbQ8rKden7GP/HTNQxSyjLQOYjfY8yPFbp0XjIM+yXed9Z3lzn1NH9U0cYSbLjiIow==
X-Received: by 2002:a62:c583:: with SMTP id j125mr5021922pfg.27.1578671244168; 
 Fri, 10 Jan 2020 07:47:24 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id z26sm3137300pgu.80.2020.01.10.07.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 07:47:23 -0800 (PST)
Date: Fri, 10 Jan 2020 10:47:22 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200110154722.GA128013@google.com>
References: <20200110132356.27110-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110132356.27110-1-frextrite@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-kernel-mentees] [PATCH] drivers: nvme: target: core:
 Pass lockdep expression to RCU lists
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

On Fri, Jan 10, 2020 at 06:53:58PM +0530, Amol Grover wrote:
> ctrl->subsys->namespaces and subsys->namespaces are traversed with
> hlist_for_each_entry_rcu outside an RCU read-side critical section
> but under the protection of subsys->lock.
> 
> Hence, add the corresponding lockdep expression to the list traversal
> primitive to silence false-positive lockdep warnings, and
> harden RCU lists.
> 
> Add macro for the corresponding lockdep expression to make the code
> clean and concise.

Amol, thanks. Could you fix this checkpatch warnings? hint: Use --fix-inplace

CHECK: Alignment should match open parenthesis
#50: FILE: drivers/nvme/target/core.c:562:
+               list_for_each_entry_rcu(old, &subsys->namespaces, dev_link,
+                                                       subsys_lock_held()) {

CHECK: Alignment should match open parenthesis
#60: FILE: drivers/nvme/target/core.c:1180:
+       list_for_each_entry_rcu(ns, &ctrl->subsys->namespaces, dev_link,
+                                                       subsys_lock_held())

Otherwise,

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

 - Joel


> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  drivers/nvme/target/core.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
> index 28438b833c1b..7caab4ba6a04 100644
> --- a/drivers/nvme/target/core.c
> +++ b/drivers/nvme/target/core.c
> @@ -15,6 +15,9 @@
>  
>  #include "nvmet.h"
>  
> +#define subsys_lock_held() \
> +	lockdep_is_held(&subsys->lock)
> +
>  struct workqueue_struct *buffered_io_wq;
>  static const struct nvmet_fabrics_ops *nvmet_transports[NVMF_TRTYPE_MAX];
>  static DEFINE_IDA(cntlid_ida);
> @@ -555,7 +558,8 @@ int nvmet_ns_enable(struct nvmet_ns *ns)
>  	} else {
>  		struct nvmet_ns *old;
>  
> -		list_for_each_entry_rcu(old, &subsys->namespaces, dev_link) {
> +		list_for_each_entry_rcu(old, &subsys->namespaces, dev_link,
> +							subsys_lock_held()) {
>  			BUG_ON(ns->nsid == old->nsid);
>  			if (ns->nsid < old->nsid)
>  				break;
> @@ -1172,7 +1176,8 @@ static void nvmet_setup_p2p_ns_map(struct nvmet_ctrl *ctrl,
>  
>  	ctrl->p2p_client = get_device(req->p2p_client);
>  
> -	list_for_each_entry_rcu(ns, &ctrl->subsys->namespaces, dev_link)
> +	list_for_each_entry_rcu(ns, &ctrl->subsys->namespaces, dev_link,
> +							subsys_lock_held())
>  		nvmet_p2pmem_ns_add_p2p(ctrl, ns);
>  }
>  
> -- 
> 2.24.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
