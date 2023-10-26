Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDA9C25B67
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Oct 2023 15:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 025216134F;
	Thu, 26 Oct 2023 15:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 025216134F
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gBpFbiWz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKIKQRl5-aHV; Thu, 26 Oct 2023 15:03:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 81895611C6;
	Thu, 26 Oct 2023 15:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81895611C6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60FB4C0039;
	Thu, 26 Oct 2023 15:03:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B42EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 467C542D36
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 467C542D36
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=desiato.20200630 header.b=gBpFbiWz
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l2yeZizfalhy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:03:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A59E742D34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 15:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A59E742D34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9JXxaYRYmSkXZPyr8is9yL820vMXmViHhclzJzT9u/0=; b=gBpFbiWzvbN93E3gafQXCGxQBO
 ZSRav/VBD5HLDT8ZoEjvC6BQx9M8rOSPOl3QEL2PxZUica4i+xwjVcn61jv2Jx2gZfK1q0foO3Lo3
 Oiypa5M9U9YPf+fSJx49QNhrGHCSW4bZi3PDLdVfh1eP6sabdCH0WNYIoW/iplHVq31ZtUdXFe7ir
 M3edVB7Rp+rv3K3V2yPu3pG8/v0iWRs7lui6RKLdd0ZNHVXDWnwfwcoWsFCYKh/FqvZzvC+1EZKja
 L1LFoF4WrZX2K+RdI3adZpZsKsMB/6MVURIeoSKdNGqSQp5dSTJxdSHyuYxycLNdlEagrQyB+NcXP
 hHT0qaPQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qw1tP-00HPi2-0s; Thu, 26 Oct 2023 15:03:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id E9257300473; Thu, 26 Oct 2023 17:03:26 +0200 (CEST)
Date: Thu, 26 Oct 2023 17:03:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: Re: [PATCH] Fixing directly deferencing a __rcu pointer warning
Message-ID: <20231026150326.GA33303@noisy.programming.kicks-ass.net>
References: <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
 <20231026122748.359162-1-singhabhinav9051571833@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026122748.359162-1-singhabhinav9051571833@gmail.com>
Cc: brauner@kernel.org, mjguzik@gmail.com, mst@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, Oleg Nesterov <oleg@redhat.com>, dhowells@redhat.com,
 mathieu.desnoyers@efficios.com, shakeelb@google.com, akpm@linux-foundation.org,
 surenb@google.com, michael.christie@oracle.com
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


$Subject should indicate a subsystem, also you seem to have a somewhat
random collection of Cc. It looks like dhowells is the cred guy and he's
not on.

On Thu, Oct 26, 2023 at 05:57:48PM +0530, Abhinav Singh wrote:
> This patch fixes the warning about directly dereferencing a pointer
> tagged with __rcu annotation.
> 
> Dereferencing the pointers tagged with __rcu directly should
> always be avoided according to the docs. There is a rcu helper
> functions rcu_dereference(...) to use when dereferencing a __rcu
> pointer. This functions returns the non __rcu tagged pointer which
> can be dereferenced just like a normal pointers.
> 
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> ---
>  kernel/fork.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 10917c3e1f03..802b7bbe3d92 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2369,7 +2369,7 @@ __latent_entropy struct task_struct *copy_process(
>  
>  	retval = -EAGAIN;
>  	if (is_rlimit_overlimit(task_ucounts(p), UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC))) {
> -		if (p->real_cred->user != INIT_USER &&
> +		if (rcu_dereference(p->real_cred)->user != INIT_USER &&
>  		    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
>  			goto bad_fork_cleanup_count;
>  	}

This seems entirely misguided and only makes the code more confusing.

AFAICT at this point @p is not life, we're constructing the new task,
but it's not yet published, therefore no concurrency possible.
Additionally we're not actually in an RCU critical section afaict.

> @@ -2692,7 +2692,7 @@ __latent_entropy struct task_struct *copy_process(
>  			 */
>  			p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
>  							 p->real_parent->signal->is_child_subreaper;
> -			list_add_tail(&p->sibling, &p->real_parent->children);
> +			list_add_tail(&p->sibling, &(rcu_dereference(p->real_parent)->children));
>  			list_add_tail_rcu(&p->tasks, &init_task.tasks);
>  			attach_pid(p, PIDTYPE_TGID);
>  			attach_pid(p, PIDTYPE_PGID);

As to the real_parent, we hold the tasklist lock, which is the write
side lock for parent stuff, so rcu dereference is pointless here.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
