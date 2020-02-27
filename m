Return-Path: <SRS0=V8/f=4P=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E904C4BA24
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 08:30:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E69222C2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 08:30:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tyDk7PYl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E69222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2534B87C9F;
	Thu, 27 Feb 2020 08:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vIfTVMbAtRcK; Thu, 27 Feb 2020 08:30:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D74287C89;
	Thu, 27 Feb 2020 08:30:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 649EAC08A0;
	Thu, 27 Feb 2020 08:30:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69B01C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 08:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 59FD086AFD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 08:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plzFp4dvG4NJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 08:30:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 54F6E855B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 08:30:19 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id l7so822314pff.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 00:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Tvby+wcv0BQs9h7cjR7fY7Khx0epyt1ALylZ/rOptsk=;
 b=tyDk7PYlcOkw+gGiTcjC/6Qa3T7IV3N+PomawQkDEiJGrEoCCxSnWkYJ5O/Fpgwyy4
 ZtOLBWdGNND4hNkyWa3dHc/ut8slDRK9rgLL8XyEfLxxueDkU/GItIt+OIyNcySmM6zR
 /qBcX92xLsADWlEomsFtB9+iYXpvy0e7guWXKMwEwgYrjdMuXHCRwFT6Kftn/IgbFTHr
 PBh442mhEugo9AJJLOM3S9Rj2ruJuhDOGfsldCMqRsLAQ6Wlbz8iWawZSfVHHd0XrQQb
 vI5L1Z98bkcjdrwpQXy9a/ATMieVCkUD1K5O0r6nVJActWwc24pkfIkMPk65i3+CJevR
 2DMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tvby+wcv0BQs9h7cjR7fY7Khx0epyt1ALylZ/rOptsk=;
 b=O5Qa0QI7IlZRAoB0WP0S9prq3FAkkExZ5tmbn6BCaPtPSL0QS62b8fk5rg1FRTAGqO
 D++MJ+44n0wTiKRvX4gBAzIXFbl4qEl3XMGc/bkAgbOMRHVkiYU53s6PDs66Ktzjk1rw
 6QKBmoFvEsdPoqGkD4wOKHTfpobIPkanORQTksJeo+ReyY/gvR8z/zfs2rsNtqL4b4yp
 OEBBIwl+cHlAofjJlLTn34R6aOvG7tUhLmPa49iXwo9zxPpX65h5Z4bKqu+wBNzwMut2
 z0fPXYVPUtkSQPGHz9cksh0oQdDZjIk8evXYpyVYXjFUnFsDXL/Qe//pmF9KGaZTU0xe
 PeOA==
X-Gm-Message-State: APjAAAUFs/OAjDrUgHDsog7Yng+zdx+YfppoUVsnSC9NJqS+urikTDpM
 IgQpQ4OL6ZmtxLjBHlnbCNQ=
X-Google-Smtp-Source: APXvYqwbdwa5z/Mw8fsv5fDjzzdIQEE48+SMUMGxedgroSV5O6Mz8Opk8lbDY2FoQaMBU2tprUKiPg==
X-Received: by 2002:a63:a741:: with SMTP id w1mr3064761pgo.131.1582792218623; 
 Thu, 27 Feb 2020 00:30:18 -0800 (PST)
Received: from workstation-portable ([103.87.56.152])
 by smtp.gmail.com with ESMTPSA id r145sm6174967pfr.5.2020.02.27.00.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 00:30:18 -0800 (PST)
Date: Thu, 27 Feb 2020 14:00:10 +0530
From: Amol Grover <frextrite@gmail.com>
To: amanharitsh123 <amanharitsh123@gmail.com>
Message-ID: <20200227083010.GB5241@workstation-portable>
References: <20200225183916.4555-1-amanharitsh123@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225183916.4555-1-amanharitsh123@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] doc: Convert to checklist.txt to
 checklist.rst
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

On Wed, Feb 26, 2020 at 12:09:16AM +0530, amanharitsh123 wrote:
> This patch converts checklist.txt to checklist.rst and
> adds it to index.rst
> 

Hi Aman,

Thank you for the patch! But before this can be accepted there are a few
things that you need to take care of.

> Signed-off-by: amanharitsh123 <amanharitsh123@gmail.com>

1. Signed-off-by *must* *always* include your full real name. You can
modify .gitconfig, or run `git config user.name "Your Name"` to change
this.

> ---
>  Documentation/RCU/{checklist.txt => checklist.rst} | 8 +++++---
>  Documentation/RCU/index.rst                        | 1 +
>  2 files changed, 6 insertions(+), 3 deletions(-)
>  rename Documentation/RCU/{checklist.txt => checklist.rst} (99%)
> 
> diff --git a/Documentation/RCU/checklist.txt b/Documentation/RCU/checklist.rst
> similarity index 99%
> rename from Documentation/RCU/checklist.txt
> rename to Documentation/RCU/checklist.rst
> index e98ff261a438..49bf7862c950 100644
> --- a/Documentation/RCU/checklist.txt
> +++ b/Documentation/RCU/checklist.rst
> @@ -1,5 +1,7 @@
> -Review Checklist for RCU Patches
> +.. checklist doc:

2. The document identifier must always start with an underscore and
should not contain white spaces, something like:
.. _checklist_doc:
should work.

>  
> +Review Checklist for RCU Patches
> +================================
>  
>  This document contains a checklist for producing and reviewing patches
>  that make use of RCU.  Violating any of the rules listed below will
> @@ -442,8 +444,8 @@ over a rather long period of time, but improvements are always welcome!
>  
>  	You instead need to use one of the barrier functions:
>  
> -	o	call_rcu() -> rcu_barrier()
> -	o	call_srcu() -> srcu_barrier()
> +	-	call_rcu() -> rcu_barrier()
> +	-	call_srcu() -> srcu_barrier()
>  
>  	However, these barrier functions are absolutely -not- guaranteed
>  	to wait for a grace period.  In fact, if there are no call_rcu()
> diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
> index 81a0a1e5f767..d60eb4ba2cd0 100644
> --- a/Documentation/RCU/index.rst
> +++ b/Documentation/RCU/index.rst
> @@ -10,6 +10,7 @@ RCU concepts
>     arrayRCU
>     rcubarrier
>     rcu_dereference
> +   checklist
>     whatisRCU
>     rcu
>     listRCU

3. The subject line needs a bit of tweaking.

Apart from the above mentioned changes, everything looks good!

Thanks
Amol

> -- 
> 2.20.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
