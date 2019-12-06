Return-Path: <SRS0=164v=Z4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D438DC2BBE2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 15:33:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9F822466E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 15:33:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1rFLJC3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9F822466E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5A54287D7F;
	Fri,  6 Dec 2019 15:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8IxTW46ueIx; Fri,  6 Dec 2019 15:33:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B5EA587D25;
	Fri,  6 Dec 2019 15:33:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2715C18DD;
	Fri,  6 Dec 2019 15:33:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C789C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 15:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5ED7386C56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 15:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCGkunynnETM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 15:32:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B570886C4B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 15:32:58 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74ACC24659;
 Fri,  6 Dec 2019 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575646378;
 bh=vTiMrBfut/S6BEjd18jjqG0EurY6xZg1X9AuYzIDWg0=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=s1rFLJC3rvjv9uzsleLrBv1lo0EvJRcyq15xbefAjAt5ZR31RHjZc1L+XoSVeUqCD
 NpVOh5ZuInhakwL0crFV/Fmu4a1KmR/eIq8Jo8bVBdmPcNOnp1TfuH+ERQavpB6cjZ
 Fk39bZoZ9T/Gk0YVGhISf6wNU5xICQf+dBcCrAHg=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 4940535206AB; Fri,  6 Dec 2019 07:32:58 -0800 (PST)
Date: Fri, 6 Dec 2019 07:32:58 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20191206153258.GD2889@paulmck-ThinkPad-P72>
References: <20191206150554.10479-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191206150554.10479-1-madhuparnabhowmik04@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: joel@joelfernandes.org, rcu@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org
Subject: Re: [Linux-kernel-mentees] [PATCH] rculist: Add macro list_prev_rcu
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Dec 06, 2019 at 08:35:54PM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> There are instances in the linux kernel where the prev pointer
> of a list is accessed.
> Unlike list_next_rcu, a similar macro for accessing the prev
> pointer was not present.

Interesting patch, but...

You lost me on this one.  The list_head ->prev pointer is not marked
__rcu, so why is sparse complaining?  Or is someone trying to use
rcu_dereference() or similar on ->prev?  If so, it is important to note
that both list_del() and list_del_rcu() poision ->prev, so it is not
usually safe to access ->prev within an RCU read-side critical section.
At the very least, this restriction needs to be called out in the
list_prev_rcu() comment header.  And that use of rcu_dereference() and
friends on the ->prev pointer is almost always the result of confusion,
if not a bug.  (Or is this some new-to-me use case?)

Either way, the big question is how we are sure that the uses of ->prev
that sparse is complaining about are in fact safe.  More specifically,
what have those use cases done to ensure that there will be no invocation
of either list_del() or list_del_rcu() on the current element just before
the use of ->prev?  Here are a couple of possibilities:

1.	The list only grows, so list_del() and list_del_rcu() are never
	ever invoked on it.

	But even this is not safe because __list_add_rcu() does
	smp_store_release() only on ->next.  The initialization of
	->prev is completely unordered with any other initialization,
	which can result in bugs on lookup/insertion concurrency.

	So this instead becomes the list being constant.

2.	The ->prev pointer is never actually dereferenced, but only
	compared.  One example use case is determining whether the
	current element is first in the list by comparing its
	->prev pointer to the address of the list header.

	But this use case needs a READ_ONCE().

3.	These accesses are single-threaded, for example while the list
	is being initialized but before it is exposed to readers or
	after the list has been rendered inaccessible to readers
	(and following at least one grace period after that).  But in
	this case, there is no need for rcu_dereference(), so sparse
	should not be complaining.

4.	#3 above, but code is shared with the non-single-threaded case.
	But then the non-single-threaded code needs to be safe with
	respect to concurrent insertions and deletions, as called
	out above.

So what am I missing here?

							Thanx, Paul

> Therefore, directly accessing the prev pointer was causing
> sparse errors.
> One such example is the sparse error in fs/nfs/dir.c
> 
> error:
> fs/nfs/dir.c:2353:14: error: incompatible types in comparison expression (different address spaces):
> fs/nfs/dir.c:2353:14:    struct list_head [noderef] <asn:4> *
> fs/nfs/dir.c:2353:14:    struct list_head *
> 
> The error is caused due to the following line:
> 
> lh = rcu_dereference(nfsi->access_cache_entry_lru.prev);
> 
> After adding the macro, this error can be fixed as follows:
> 
> lh = rcu_dereference(list_prev_rcu(&nfsi->access_cache_entry_lru));
> 
> Therefore, we think there is a need to add this macro to rculist.h.
> 
> Suggested-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> ---
>  include/linux/rculist.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/linux/rculist.h b/include/linux/rculist.h
> index 4b7ae1bf50b3..49eef8437753 100644
> --- a/include/linux/rculist.h
> +++ b/include/linux/rculist.h
> @@ -40,6 +40,12 @@ static inline void INIT_LIST_HEAD_RCU(struct list_head *list)
>   */
>  #define list_next_rcu(list)	(*((struct list_head __rcu **)(&(list)->next)))
>  
> +/*
> + * return the prev pointer of a list_head in an rcu safe
> + * way, we must not access it directly
> + */
> +#define list_prev_rcu(list)	(*((struct list_head __rcu **)(&(list)->prev)))
> +
>  /*
>   * Check during list traversal that we are within an RCU reader
>   */
> -- 
> 2.17.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
