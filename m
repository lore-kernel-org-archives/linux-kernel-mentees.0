Return-Path: <SRS0=/i4J=Z2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83DDC43603
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 17:50:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78E0020661
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 17:50:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="kZJJDJE+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78E0020661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4FB0F86F49;
	Wed,  4 Dec 2019 17:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBxCSoDkBS2v; Wed,  4 Dec 2019 17:50:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB0D086E97;
	Wed,  4 Dec 2019 17:50:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D13C9C18DD;
	Wed,  4 Dec 2019 17:50:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E48F6C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 17:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D28F186EB3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 17:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3ODk0d2Rcjx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 17:50:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2569E86E97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 17:50:39 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x185so202597pfc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Dec 2019 09:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=F9Qa6Puv7ezBDFINsGITxUb0gdMtfeyJWNm86YFTPaA=;
 b=kZJJDJE+eSZPXPBjvuRAiamWZtJg0meXDZiJSBQ/OgKPdYcV/vRtTi+g2tm2BMxS4S
 yBq0QCAF+CWwh5KNJGF5NjXTm2avaYTBI4IJU0omAS7KBFBoripTGSJ1wTpU9lLGF425
 P7R5G6u4RTAHq59GpetEHVthgwzineIep1X3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=F9Qa6Puv7ezBDFINsGITxUb0gdMtfeyJWNm86YFTPaA=;
 b=HIBSSCtUEgF+WdYL4P6xVYr4RTCmVCgRJ2+prA4J6P4MpBgqEhB8dIr7vOveBs8Tp+
 nE1YEjmuFrjxOEJvo9Xd2ThWdZxSYDr1cdwZr03ekQFXxx/IwbIiUciGPqkgs3dNVqMh
 J0gJxplRwPLTqlSFD+X7W8kdCbakswRgreHunZ/zf7ya2+aFZGL7JCjWfnj213o9p2nB
 8KU5VpB8+x9aSvPhRxwBWVLo9n6zyClWvscTr94gL+gZVVCxcZYmHHi5T9O/2Y+SKeYK
 /coahg+e8/mVG7Kp68SKV3Vcg93fr/+SHnzPHCNjSvxEIthgj/iWJ7O5ZE03q8QoE8EY
 10bw==
X-Gm-Message-State: APjAAAUoViRsK6lJEfgKffjzGtlz0fB2sLWxXXi9fjEYjCIMPMHMq4FK
 ZEBQFclGFrCSLIMtybnSb/BZx/xBJYc=
X-Google-Smtp-Source: APXvYqwgcPT4G/249WAVQBUzpvpK20eSRwudnC4aE++PyedRE5c3ZYx0sSLwuLtcw8WjbZy5uVsoPA==
X-Received: by 2002:a62:e817:: with SMTP id c23mr4358423pfi.24.1575481489391; 
 Wed, 04 Dec 2019 09:44:49 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id k4sm8512292pfa.25.2019.12.04.09.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 09:44:48 -0800 (PST)
Date: Wed, 4 Dec 2019 12:44:47 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20191204174447.GE34402@google.com>
References: <20191204120357.11658-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204120357.11658-1-madhuparnabhowmik04@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: rcu@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, paulmck@kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Include: Linux: rculist_nulls:
 Add docbook comment headers
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

On Wed, Dec 04, 2019 at 05:33:57PM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> This patch adds docbook comment headers for hlist_nulls_first_rcu
> and hlist_nulls_next_rcu in rculist_nulls.h.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

Thanks. Could you send this to the list? I'd like Paul to review or apply
this one.

 - Joel

> ---
>  include/linux/rculist_nulls.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/rculist_nulls.h b/include/linux/rculist_nulls.h
> index 517a06f36c7a..d796ef18ec52 100644
> --- a/include/linux/rculist_nulls.h
> +++ b/include/linux/rculist_nulls.h
> @@ -38,9 +38,17 @@ static inline void hlist_nulls_del_init_rcu(struct hlist_nulls_node *n)
>  	}
>  }
>  
> +/**
> + * hlist_nulls_first_rcu - returns the first element of the hash list.
> + * @head: the head for your list.
> + */
>  #define hlist_nulls_first_rcu(head) \
>  	(*((struct hlist_nulls_node __rcu __force **)&(head)->first))
>  
> +/**
> + * hlist_nulls_next_rcu - returns the element of the list next to @node.
> + * @node: Element of the list.
> + */
>  #define hlist_nulls_next_rcu(node) \
>  	(*((struct hlist_nulls_node __rcu __force **)&(node)->next))
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
