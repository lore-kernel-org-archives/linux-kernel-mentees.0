Return-Path: <SRS0=164v=Z4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10B1C2BBE2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 16:02:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 964452173E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 16:02:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhBUf+ww"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 964452173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5B33988A83;
	Fri,  6 Dec 2019 16:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVelqksfkfcZ; Fri,  6 Dec 2019 16:02:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 47ABD88A74;
	Fri,  6 Dec 2019 16:02:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25C4DC18DD;
	Fri,  6 Dec 2019 16:02:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EECE7C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 16:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EA786253CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 16:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBsem-Juf5hr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 16:02:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 582EC20503
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 16:02:39 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22B232173E;
 Fri,  6 Dec 2019 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575648159;
 bh=uN49J2KjPjCG2q1vrkZZhYout9vUnOgmq5AHuzL7OmY=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=dhBUf+ww+91PA7OIoUovoazx+Zee9VhrqKOW7tvxd09vcuMDCb5ZqA/Xh//Y8mUTG
 f8gBztw7LPmmF9Ptmm0dmheqcx1kCMIhpl7Rnx+bubZ6acaSfZrRnn8cc8pKCVsolB
 Q0ieCCicDMxk1sWnpr3m9eetaba0Ru77BQMujAis=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id DB9F435206AB; Fri,  6 Dec 2019 08:02:38 -0800 (PST)
Date: Fri, 6 Dec 2019 08:02:38 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20191206160238.GE2889@paulmck-ThinkPad-P72>
References: <20191206151640.10966-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191206151640.10966-1-madhuparnabhowmik04@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 anna.schumaker@netapp.com, rcu@vger.kernel.org, joel@joelfernandes.org,
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

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

And as noted in the earlier email, what is preventing concurrent
insertions into  and deletions from this list?

o	This use of list_move_tail() is OK because it does not poison.
	Though it isn't being all that friendly to lockless access to
	->prev -- no WRITE_ONCE() in list_move_tail().

o	The use of list_add_tail() is not safe with RCU readers, though
	they do at least partially compensate via use of smp_wmb()
	in nfs_access_add_cache() before calling nfs_access_add_rbtree().

o	The list_del() near the end of nfs_access_add_rbtree() will
	poison the ->prev pointer.  I don't see how this is safe given the
	possibility of a concurrent call to nfs_access_get_cached_rcu().

>  	cache = list_entry(lh, struct nfs_access_entry, lru);
>  	if (lh == &nfsi->access_cache_entry_lru ||
>  	    cred != cache->cred)

And a few lines below here, it really does dereference the pointer
obtained from ->prev!

So how to really fix this?  Here is one possibility, but we of course
need to get the NFS developers' and maintainers' thoughts:

o	Create a list that is safe for bidirectional RCU traversal.
	This can use list_head, and would need these functions,
	give or take the exact names:

	list_add_tail_rcuprev():  This is like list_add_tail_rcu(),
	but also has smp_store_release() for ->prev.  (As in there is
	also a __list_add_rcuprev() helper that actually contains the
	additional smp_store_release().)

	list_del_rcuprev():  This can be exactly __list_del_entry(),
	but with the assignment to ->prev in __list_del() becoming
	WRITE_ONCE().  And it looks like callers to __list_del_entry()
	and __list_del() might need some attention!  And these might
	result in additional users of *_rcuprev().

	list_prev_rcu() as in your first patch, but with READ_ONCE().
	Otherwise DEC Alpha can fail.  And more subtle compiler issues
	can appear on other architectures.

	Note that list_move_tail() will be OK give or take *_ONCE().
	It might be better to define a list_move_tail_rcuprev(), given
	the large number of users of list_move_tail() -- some of these
	users might not like even the possibility of added overhead due
	to volatile accesses.  ;-)

Or am I missing something subtle here?

							Thanx, Paul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
