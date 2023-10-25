Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CA2C25B6B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Oct 2023 22:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB58F41B13;
	Wed, 25 Oct 2023 22:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB58F41B13
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ApOY5nA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JYQmgbghNUaA; Wed, 25 Oct 2023 22:38:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A578E41A43;
	Wed, 25 Oct 2023 22:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A578E41A43
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 919EFC0071;
	Wed, 25 Oct 2023 22:38:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 382F6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 22:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0692041A46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 22:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0692041A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rsVt4_GWJY_M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 22:38:14 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E9B641A43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 22:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E9B641A43
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6125DCE3BCF;
 Wed, 25 Oct 2023 22:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1650DC433C8;
 Wed, 25 Oct 2023 22:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1698273489;
 bh=8ZaHognKBbv1lYU2FsHlrUv1uDTrt8DMUrzopQve/O4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ApOY5nA4miFuLqeB+YF2sa6yf/8IKMkCxFPnNxhh6+lkUMoy4dXMMeLTjuWHgzRsv
 nFNlJhztM+XPFSHjUj+M6bBeWCs9uaD9GfqtjfF6EW1GYCxRYsMm1QsCWHDEkCuFr9
 WGRadwkV+tpV0oQURFB8OA4XT6I3A0rdrGItdT0g=
Date: Wed, 25 Oct 2023 15:38:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: Re: [PATCH] Fixing warning of directly dereferencing  __rcu tagged
Message-Id: <20231025153807.8db950f1db82b2c9ecd03758@linux-foundation.org>
In-Reply-To: <20231025222811.855336-1-singhabhinav9051571833@gmail.com>
References: <20231025222811.855336-1-singhabhinav9051571833@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: brauner@kernel.org, mjguzik@gmail.com, mst@redhat.com, peterz@infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, mathieu.desnoyers@efficios.com, shakeelb@google.com,
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

On Thu, 26 Oct 2023 03:58:11 +0530 Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:

> This patch fixes the warning about directly dereferencing a pointer
> tagged with __rcu annotation.
> 
> Dereferencing the pointers tagged with __rcu directly should 
> always be avoided according to the docs. There is a rcu helper 
> functions rcu_dereference(...) to use when dereferencing a __rcu 
> pointer. This functions returns the non __rcu tagged pointer. 

Seems sensible.

> Like normal pointer there should be a check for null case when 
> further dereferencing the returned dereferenced __rcu pointer.

Why is this?

> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2369,7 +2369,9 @@ __latent_entropy struct task_struct *copy_process(
>  
>  	retval = -EAGAIN;
>  	if (is_rlimit_overlimit(task_ucounts(p), UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC))) {
> -		if (p->real_cred->user != INIT_USER &&
> +		const struct cred *real_cred = rcu_dereference(p->real_cred);
> +
> +		if (real_cred && real_cred->user != INIT_USER &&
>  		    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
>  			goto bad_fork_cleanup_count;

The old code assumes that p->read_cred cannot be NULL and the new code
does nothing to make it possible that `real_cred' can be NULL?

In other words, I see no reason to add this new check for NULL?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
