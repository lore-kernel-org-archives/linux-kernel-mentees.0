Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A75EC25B67
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Oct 2023 12:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E07F04348F;
	Fri, 27 Oct 2023 12:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E07F04348F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i+1+emqb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j2Lnym-Q9GXp; Fri, 27 Oct 2023 12:23:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4FE964348A;
	Fri, 27 Oct 2023 12:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FE964348A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 125AAC0071;
	Fri, 27 Oct 2023 12:23:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F371C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 12:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15CB084FE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 12:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15CB084FE7
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=i+1+emqb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XJklN4aX9LSY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 12:23:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4242082112
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 12:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4242082112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698409411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tkI6B2xxBoNMxixcFLfMBk3z+VWHlMmRd9oe0BnBgsM=;
 b=i+1+emqbzbHTVrZb7A/Y9Rfsb1503nYcEXRFOqdnhGkliALOSt14sDVK3ysQ2qZ+O+DnQd
 mBNmYLA/KRMX76fhyOwLmGNd9Lt+4rofZDw+XYG18jxDKg419jsi8npA+OETOeA2slYYga
 JfFgZuN0mL+ODyyL/jZG9h9gUqHxNVE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-qQUfIefFO4Wj4C4LLyDvuw-1; Fri, 27 Oct 2023 08:23:27 -0400
X-MC-Unique: qQUfIefFO4Wj4C4LLyDvuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E336828AC9;
 Fri, 27 Oct 2023 12:23:27 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.76])
 by smtp.corp.redhat.com (Postfix) with SMTP id EA3221C060AE;
 Fri, 27 Oct 2023 12:23:23 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Fri, 27 Oct 2023 14:22:26 +0200 (CEST)
Date: Fri, 27 Oct 2023 14:22:22 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] Fixing directly deferencing a __rcu pointer warning
Message-ID: <20231027122221.GA24128@redhat.com>
References: <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
 <20231026122748.359162-1-singhabhinav9051571833@gmail.com>
 <20231026150326.GA33303@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026150326.GA33303@noisy.programming.kicks-ass.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Cc: brauner@kernel.org, mjguzik@gmail.com, mst@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, dhowells@redhat.com,
 Abhinav Singh <singhabhinav9051571833@gmail.com>,
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

On 10/26, Peter Zijlstra wrote:
>
> >  kernel/fork.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index 10917c3e1f03..802b7bbe3d92 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -2369,7 +2369,7 @@ __latent_entropy struct task_struct *copy_process(
> >
> >  	retval = -EAGAIN;
> >  	if (is_rlimit_overlimit(task_ucounts(p), UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC))) {
> > -		if (p->real_cred->user != INIT_USER &&
> > +		if (rcu_dereference(p->real_cred)->user != INIT_USER &&
> >  		    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
> >  			goto bad_fork_cleanup_count;
> >  	}
>
> This seems entirely misguided and only makes the code more confusing.
>
> AFAICT at this point @p is not life, we're constructing the new task,
> but it's not yet published, therefore no concurrency possible.
> Additionally we're not actually in an RCU critical section afaict.
>
> > @@ -2692,7 +2692,7 @@ __latent_entropy struct task_struct *copy_process(
> >  			 */
> >  			p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
> >  							 p->real_parent->signal->is_child_subreaper;
> > -			list_add_tail(&p->sibling, &p->real_parent->children);
> > +			list_add_tail(&p->sibling, &(rcu_dereference(p->real_parent)->children));
> >  			list_add_tail_rcu(&p->tasks, &init_task.tasks);
> >  			attach_pid(p, PIDTYPE_TGID);
> >  			attach_pid(p, PIDTYPE_PGID);
>
> As to the real_parent, we hold the tasklist lock, which is the write
> side lock for parent stuff, so rcu dereference is pointless here.

Agreed.

Plus I don't think this change is correct, iiuc rcu_dereference() will trigger
the run-time "suspicious rcu_dereference_check() usage" warning, it is called
without rcu_read_lock().

Oleg.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
