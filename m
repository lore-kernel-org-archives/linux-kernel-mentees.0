Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95097C25B6B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Oct 2023 23:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A54F81778;
	Wed, 25 Oct 2023 23:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A54F81778
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=SslKzLdR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAlPXFcS95WF; Wed, 25 Oct 2023 23:50:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 070E281769;
	Wed, 25 Oct 2023 23:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 070E281769
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1096C0039;
	Wed, 25 Oct 2023 23:50:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45102C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 23:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 132394086D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 23:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 132394086D
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg
 header.b=SslKzLdR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqCF90jB_oKt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 23:50:07 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E80F40624
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Oct 2023 23:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E80F40624
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CBD4CB82171;
 Wed, 25 Oct 2023 23:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC170C433C8;
 Wed, 25 Oct 2023 23:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1698277803;
 bh=6OD+Y8pC8d8yXq2muD5OMoXQ/nN+x9qvm8b1lOdybRw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SslKzLdRm4iZqyvE7RbWtt9Aksd3C7S8t9WOVMqHiU01qLnnWfuOI1acjomn6Ofqt
 VEyftpRTUL5xrZsrV9ynMdQ1Mw14ccax3sXuh9QwSgUxCb9n6TWhiCYepofTpd15yG
 scVTwOaavC2imdr1NJVbokiFhzuK+aQM2cujCQJs=
Date: Wed, 25 Oct 2023 16:50:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: Re: [PATCH] Fixing warning of directly dereferencing __rcu tagged
Message-Id: <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
In-Reply-To: <c4688c53-4206-4d54-aed9-f877697e8073@gmail.com>
References: <20231025222811.855336-1-singhabhinav9051571833@gmail.com>
 <20231025153807.8db950f1db82b2c9ecd03758@linux-foundation.org>
 <c4688c53-4206-4d54-aed9-f877697e8073@gmail.com>
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

On Thu, 26 Oct 2023 04:57:42 +0530 Abhinav Singh <singhabhinav9051571833@gmail.com> wrote:

> On 10/26/23 04:08, Andrew Morton wrote:
> >> +++ b/kernel/fork.c
> >> @@ -2369,7 +2369,9 @@ __latent_entropy struct task_struct *copy_process(
> >>   
> >>   	retval = -EAGAIN;
> >>   	if (is_rlimit_overlimit(task_ucounts(p), UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC))) {
> >> -		if (p->real_cred->user != INIT_USER &&
> >> +		const struct cred *real_cred = rcu_dereference(p->real_cred);
> >> +
> >> +		if (real_cred && real_cred->user != INIT_USER &&
> >>   		    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
> >>   			goto bad_fork_cleanup_count;
> > 
> > The old code assumes that p->read_cred cannot be NULL and the new code
> > does nothing to make it possible that `real_cred' can be NULL?
> > 
> > In other words, I see no reason to add this new check for NULL?
> 
> Thank you for the response!
> 
> I thought it will be better to have check before accessing it, just so 
> we dont have any segmentation fault in future.

That would be adding code which has no effect?

> Also I just noticed there are two more places where direct dereferencing 
> of __rcu pointer is done in this same file. Should I do those changes in 
> this patch ?

I don't see why.  rcu_dereference(p) cannot return NULL if `p' is non-NULL?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
