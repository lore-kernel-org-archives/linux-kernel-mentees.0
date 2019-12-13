Return-Path: <SRS0=HmkY=2D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AFAC43603
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Dec 2019 01:16:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64A552173E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Dec 2019 01:16:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIHvI4iA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64A552173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A248872A4;
	Fri, 13 Dec 2019 01:16:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZxPZL80pWpVW; Fri, 13 Dec 2019 01:16:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 91CD18721C;
	Fri, 13 Dec 2019 01:16:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86233C1D81;
	Fri, 13 Dec 2019 01:16:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF724C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 01:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CC74B882B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 01:16:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPN10dDlyAjx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 01:16:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 30597882AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Dec 2019 01:16:11 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (unknown [199.201.64.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E864B2173E;
 Fri, 13 Dec 2019 01:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576199770;
 bh=41UXekEdF9kavlN11G4wL1lFhr5jX6Gv12aUkd97nZU=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=CIHvI4iA5Eab4AxzB1ehbOKRX3V0VZqXs9o2dsLS3Ww31ZEIHy3ZaaTARQTO58q1/
 O17lww/L0A4aA8YGeNLuEvIjGBbZGK2GbN6zm0mUTxj6a+r7w6OpHmobyrMj0/SQjg
 zMEChoKxDLuJKMh3n9Gdo1Sb3arovX5qCJ22OKEE=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 7180835227E8; Thu, 12 Dec 2019 17:16:10 -0800 (PST)
Date: Thu, 12 Dec 2019 17:16:10 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Joel Fernandes <joel@joelfernandes.org>
Message-ID: <20191213011610.GC2889@paulmck-ThinkPad-P72>
References: <20191206151640.10966-1-madhuparnabhowmik04@gmail.com>
 <20191206160238.GE2889@paulmck-ThinkPad-P72>
 <20191212215534.GE129023@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212215534.GE129023@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Dec 12, 2019 at 04:55:34PM -0500, Joel Fernandes wrote:
> On Fri, Dec 06, 2019 at 08:02:38AM -0800, Paul E. McKenney wrote:
> 
> Thanks for fixing these issues and I caught up with all the patches.
> 
> > 
> > o	Create a list that is safe for bidirectional RCU traversal.
> > 	This can use list_head, and would need these functions,
> > 	give or take the exact names:
> 
> On a related topic, I was trying to reason about how one could come up with
> bidirectional traversal without ever getting rid of poisoning.
> 
> As you noted in another post, if during traversal, the node is deleted and
> poisoned, then the traverser can access a poisoned pointer. If the list is
> being traversed in reverse (by following prev), then poisioning could hurt
> it.
> 
> Even with the below modifications, poisoning would still hurt it. No? Were
> you suggesting to remove poisoning for such bidirectional RCU list?

Yes.  We removed forward poisoning from list_del_rcu(), and a
list_del_rcuprev() or whatever name would need to avoid poisoning both
pointers.

							Thanx, Paul

> Sorry if I missed something.
> thanks,
> 
>  - Joel
> 
> 
> > 	list_add_tail_rcuprev():  This is like list_add_tail_rcu(),
> > 	but also has smp_store_release() for ->prev.  (As in there is
> > 	also a __list_add_rcuprev() helper that actually contains the
> > 	additional smp_store_release().)
> > 
> > 	list_del_rcuprev():  This can be exactly __list_del_entry(),
> > 	but with the assignment to ->prev in __list_del() becoming
> > 	WRITE_ONCE().  And it looks like callers to __list_del_entry()
> > 	and __list_del() might need some attention!  And these might
> > 	result in additional users of *_rcuprev().
> > 
> > 	list_prev_rcu() as in your first patch, but with READ_ONCE().
> > 	Otherwise DEC Alpha can fail.  And more subtle compiler issues
> > 	can appear on other architectures.
> > 
> > 	Note that list_move_tail() will be OK give or take *_ONCE().
> > 	It might be better to define a list_move_tail_rcuprev(), given
> > 	the large number of users of list_move_tail() -- some of these
> > 	users might not like even the possibility of added overhead due
> > 	to volatile accesses.  ;-)
> > 
> > Or am I missing something subtle here?
> > 
> > 							Thanx, Paul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
