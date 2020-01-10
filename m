Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB54CC33CA3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 15:54:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 827F92080D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 15:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="aBV1vy75"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 827F92080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5A8C584CF3;
	Fri, 10 Jan 2020 15:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PJQDm6-BdURh; Fri, 10 Jan 2020 15:54:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E405284B82;
	Fri, 10 Jan 2020 15:54:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9E25C1D7D;
	Fri, 10 Jan 2020 15:54:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF279C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9A8AC86B16
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ffj2_B_3Bcqb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:54:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1546F86B04
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:54:10 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 195so1316509pfw.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 07:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SK9SfM0s44elgGzLaJeFK5jMx7NIcHCDZF3x9nv0Lxs=;
 b=aBV1vy75sNaosplHJ4H3qazVSebNElcAVlUb+HrjOZPq1vvWoFf9dEImAwbKzRGAey
 WXFZW3qa2v84cafmXiduuTXYX7tiAt38D7DQCWgB/pNRtn4obYWkC9IU5eWvee8iLkNT
 whWf5etBpitExpwXzzboEVpBB0lB6AIMlr6bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SK9SfM0s44elgGzLaJeFK5jMx7NIcHCDZF3x9nv0Lxs=;
 b=OFEw5jACWM5oykHvYXKBtbm23TG+ee04T50KEaUbP1l00FJAtQMAl9LiMxBMKUzzXf
 Wqz2idMrBDkdiaBlJwxqyIGda48nCxcNTMx67/OvnHPmqM52nuYENs+qXOFPLA46Dvme
 7xYRzz8Fds3bxsjfNUvlD+XUgQgvEtSV3lSOa8Vf3KPtwNUx61J0lrLq/XkGBIrT8YS3
 P0IA99p+e1pE4KO6KFvNcgO+UOG7pYmdG0exGDnc6uF7K+X126fbrCcjR3WqGh4WQzaP
 J857+wQlTpkT/RNeuY8AiTuQCgBo+2AIzJgHC9dN/C0EMf8pFYq+ENH0GgWivx4zVxBW
 Dllg==
X-Gm-Message-State: APjAAAXc9p1up9qCewlhR5tGZZDxq2P1IQg4KoMlD7151QNPB1fUvZiC
 CUkGy79QX/4aicZNYXo7Aj8KpA==
X-Google-Smtp-Source: APXvYqycGLOZaBaQu3Hqaeuta4YY/jPKmGOsSO3iqRpNJkIQ54WkKeTGxoc6scloX9pTQNenda0JAg==
X-Received: by 2002:a63:541e:: with SMTP id i30mr5002051pgb.183.1578671649500; 
 Fri, 10 Jan 2020 07:54:09 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id w6sm3769223pfq.99.2020.01.10.07.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 07:54:08 -0800 (PST)
Date: Fri, 10 Jan 2020 10:54:07 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20200110155407.GB128013@google.com>
References: <20200107192912.22691-1-madhuparnabhowmik04@gmail.com>
 <20200107203354.GD26174@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107203354.GD26174@ziepe.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mike.marciniszyn@intel.com, paulmck@kernel.org, linux-rdma@vger.kernel.org,
 dennis.dalessandro@intel.com, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, jgg@ziepe.ca, dledford@redhat.com,
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

On Wed, Jan 08, 2020 at 01:35:07PM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Jason Gunthorpe <jgg@ziepe.ca>
> 
> On Wed, Jan 08, 2020 at 12:59:12AM +0530, madhuparnabhowmik04@gmail.com wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > 
> > list_for_each_entry_rcu has built-in RCU and lock checking.
> > Pass cond argument to list_for_each_entry_rcu.
> > 
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >  drivers/infiniband/hw/hfi1/verbs.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/infiniband/hw/hfi1/verbs.c b/drivers/infiniband/hw/hfi1/verbs.c
> > index 089e201d7550..e6abdbcb4ffb 100644
> > +++ b/drivers/infiniband/hw/hfi1/verbs.c
> > @@ -515,7 +515,8 @@ static inline void hfi1_handle_packet(struct hfi1_packet *packet,
> >  				       opa_get_lid(packet->dlid, 9B));
> >  		if (!mcast)
> >  			goto drop;
> > -		list_for_each_entry_rcu(p, &mcast->qp_list, list) {
> > +		list_for_each_entry_rcu(p, &mcast->qp_list, list,
> > +					lock_is_held(&(ibp->rvp.lock).dep_map)) {
> 
> Why .dep_map? Does this compile?

Yeah, have you really compiled this? Don't send patches without at least
compile testing !!

> Alternatively, it can be lockdep_is_held(ibp->rvp.lock).
> Please refer to the macro(link below) and let me know if the usage of lock_is_held()
> in the patch is correct.
> 
> https://elixir.bootlin.com/linux/v5.5-rc2/source/include/linux/lockdep.h#L364

Please use lockdep_is_held(). Thanks.

thanks,

 - Joel

> 
> Thanks,
> Madhuparna
> Jason
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
