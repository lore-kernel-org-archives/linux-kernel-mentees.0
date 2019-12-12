Return-Path: <SRS0=PP36=2C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E338EC43603
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Dec 2019 22:03:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B19C9214D8
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Dec 2019 22:03:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="akQTQ8DG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B19C9214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 83A73871FA;
	Thu, 12 Dec 2019 22:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WNq0GSyzGdXS; Thu, 12 Dec 2019 22:03:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 193A585531;
	Thu, 12 Dec 2019 22:03:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE456C1D81;
	Thu, 12 Dec 2019 22:03:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D967CC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 22:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C2465871FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 22:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FnLloztRNNG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 22:03:51 +0000 (UTC)
X-Greylist: delayed 00:08:14 by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3CF5285531
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 22:03:51 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l24so301582pgk.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 14:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=h/VdtXdRQlPmJqNAwJpL0SAreQKh5WfidHfGkffdfTY=;
 b=akQTQ8DGz4+sLf+zxm0p7E7OSR4ZVNkCljcLLOLKtWKJJXAmgxCFUjPlwOG5fbSC9N
 mERo4ScyELdDEEkmatrR1iPy+pdwUVhfxjnUUIR+kUGOsjfUBzr5wxbpFNbTqRNtQ09z
 b+wx6vcHLgpVhQN4aXYz0T07BsuRDMg6DU2cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=h/VdtXdRQlPmJqNAwJpL0SAreQKh5WfidHfGkffdfTY=;
 b=cPs12jlF9BsIl+tNiUNEVsycTeH2q1YTxAy/eDXO/R6ePerZOx1Q2l/mtR233zOGpX
 d1FxVw5NsEpBfcPKgHMjr1AMrSDUMB4sL/UAzVLHvihPUWPagnM+JbylhcZ3qIKo07nx
 GzLowAz7t+NXVJuU3UY6MTfyRTRXqmb5l97OUlyxewg/kdhQNITE3+FbJ+v5+2it6NG4
 2mzsr3F1gR7OCcgkuR0VJdDEgrYFWPYQNocWLXGeoCENsPf89APRofmGgrqfxRPVj6+A
 A1cYA0XyTPUnEqj7W5CbyAePc7OIRkWzSmeTLBT2DEwiYgSJSwBLduBO0EHWg1FIYMe2
 3gUQ==
X-Gm-Message-State: APjAAAWpsyDt861BWL+fFKP/ZZC+oYlsb4DwvOsb0foEP5qBY+yq2bgE
 8eLAujb0+xfSMJQyhv+hMUE/0haSxhc=
X-Google-Smtp-Source: APXvYqwsMX2eicc0dbN7r6W5gmKv0tIxPb2fvRfeVxEEAY6q0Rx/j41gSkqdSqxQQojNi+feY0HBOQ==
X-Received: by 2002:a63:7843:: with SMTP id t64mr13106609pgc.144.1576187736533; 
 Thu, 12 Dec 2019 13:55:36 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id k88sm7172380pjb.15.2019.12.12.13.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 13:55:35 -0800 (PST)
Date: Thu, 12 Dec 2019 16:55:34 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Message-ID: <20191212215534.GE129023@google.com>
References: <20191206151640.10966-1-madhuparnabhowmik04@gmail.com>
 <20191206160238.GE2889@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191206160238.GE2889@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Fri, Dec 06, 2019 at 08:02:38AM -0800, Paul E. McKenney wrote:

Thanks for fixing these issues and I caught up with all the patches.

> 
> o	Create a list that is safe for bidirectional RCU traversal.
> 	This can use list_head, and would need these functions,
> 	give or take the exact names:

On a related topic, I was trying to reason about how one could come up with
bidirectional traversal without ever getting rid of poisoning.

As you noted in another post, if during traversal, the node is deleted and
poisoned, then the traverser can access a poisoned pointer. If the list is
being traversed in reverse (by following prev), then poisioning could hurt
it.

Even with the below modifications, poisoning would still hurt it. No? Were
you suggesting to remove poisoning for such bidirectional RCU list?

Sorry if I missed something.
thanks,

 - Joel


> 	list_add_tail_rcuprev():  This is like list_add_tail_rcu(),
> 	but also has smp_store_release() for ->prev.  (As in there is
> 	also a __list_add_rcuprev() helper that actually contains the
> 	additional smp_store_release().)
> 
> 	list_del_rcuprev():  This can be exactly __list_del_entry(),
> 	but with the assignment to ->prev in __list_del() becoming
> 	WRITE_ONCE().  And it looks like callers to __list_del_entry()
> 	and __list_del() might need some attention!  And these might
> 	result in additional users of *_rcuprev().
> 
> 	list_prev_rcu() as in your first patch, but with READ_ONCE().
> 	Otherwise DEC Alpha can fail.  And more subtle compiler issues
> 	can appear on other architectures.
> 
> 	Note that list_move_tail() will be OK give or take *_ONCE().
> 	It might be better to define a list_move_tail_rcuprev(), given
> 	the large number of users of list_move_tail() -- some of these
> 	users might not like even the possibility of added overhead due
> 	to volatile accesses.  ;-)
> 
> Or am I missing something subtle here?
> 
> 							Thanx, Paul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
