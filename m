Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA04C25B48
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Oct 2023 13:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DA7183D9E;
	Thu, 26 Oct 2023 13:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DA7183D9E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VLREzQ8w
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGWax6dOStRK; Thu, 26 Oct 2023 13:14:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2468A83D71;
	Thu, 26 Oct 2023 13:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2468A83D71
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0089C0039;
	Thu, 26 Oct 2023 13:14:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11B04C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 13:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4A9D83D75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 13:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4A9D83D75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l6vnpOHQPKmP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 13:14:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CD8A83D71
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 13:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CD8A83D71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698326080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ITxJfATsg1xPCVF9l8R+7SuGMBL1Ri8aZSO801+6WD8=;
 b=VLREzQ8wgRNKsnfpuR2Y9qaOfaQqe4Zl+UqJJkHZIQGlGguRBCRUIyjbtgdw0Th4Q8F3f0
 wKbyAkkpIMAjy6fi/eSQQIo0fy8DWg70l78LZyWhe9P44HM55wuNDx7uecI6fXES0Dclog
 lXVhqje1NZRzJBdnG/dlT2gLIbAWOwM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-9uDU3GN5M9y7KEagBdhBRw-1; Thu, 26 Oct 2023 09:14:29 -0400
X-MC-Unique: 9uDU3GN5M9y7KEagBdhBRw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9c75886c044so60949266b.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 06:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698326068; x=1698930868;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ITxJfATsg1xPCVF9l8R+7SuGMBL1Ri8aZSO801+6WD8=;
 b=jVxYiMIa27QCmpCvsA7l7KTsHp1A2Z4W7lW3qkU0DY9KiSIWoqnvT+OFq/qzTGi3kO
 RCYc1PTKL5y5bdzRdpnTYDBlHx5c/5YJOo+RE5Gpt02Z4g5x3U14YFatWEtFcGuScCME
 oZz4r4a9m5x1yqeSTzZUdORobxCjSLNnP+Az8ucs1g/yEhDU5n78US23iVctI8JLILOz
 UshFSDqtgs8kybhbqo777GUX1V7Bx2L7vGIQZ52JCSPXudN62JPrccw8RAvhxoZwVBVm
 MHbQ0IEDN3aFe2Gb6dh1y4eeRLuxa5DynTuZmZPzGbphk2TmDKnQqT4I3/j2hhpcnIM1
 YUCg==
X-Gm-Message-State: AOJu0YyReWxyVfgg1A+Q/6FMGHZ3GowohdptlP984Lk2D7xlA7Pwb33a
 aUdtYj6lVcOQzbvV57q433FWuY3+uOYKibiSKJ/AUIeLr8sj18bxyPmfqqGsKJScOZyhkduZdvd
 z0gfNrPCqu9A9hs/enrvZMv3ZUBl4yGDX1WBBLuYcHmq48Eve
X-Received: by 2002:a17:906:9c83:b0:9a1:bd33:4389 with SMTP id
 fj3-20020a1709069c8300b009a1bd334389mr13653849ejc.74.1698326068172; 
 Thu, 26 Oct 2023 06:14:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGetGp6xoa7QcxxN+Jjc+NqG3O3baXarhaB833PkwjNbYRUCF6sCIKtsgu4V0Uon7NGSJ9/og==
X-Received: by 2002:a17:906:9c83:b0:9a1:bd33:4389 with SMTP id
 fj3-20020a1709069c8300b009a1bd334389mr13653833ejc.74.1698326067742; 
 Thu, 26 Oct 2023 06:14:27 -0700 (PDT)
Received: from redhat.com ([2a02:14f:17b:37eb:8e1f:4b3b:22c7:7722])
 by smtp.gmail.com with ESMTPSA id
 26-20020a170906011a00b009ae587ce128sm11636345eje.216.2023.10.26.06.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 06:14:27 -0700 (PDT)
Date: Thu, 26 Oct 2023 09:14:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: Re: [PATCH v2] Fixing directly deferencing a __rcu pointer warning
Message-ID: <20231026091222-mutt-send-email-mst@kernel.org>
References: <20231025165002.64ab92e6d55d204b66e055f4@linux-foundation.org>
 <20231026121621.358388-1-singhabhinav9051571833@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20231026121621.358388-1-singhabhinav9051571833@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: brauner@kernel.org, mjguzik@gmail.com, peterz@infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, mathieu.desnoyers@efficios.com, shakeelb@google.com,
 akpm@linux-foundation.org, surenb@google.com, michael.christie@oracle.com
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

On Thu, Oct 26, 2023 at 05:46:21PM +0530, Abhinav Singh wrote:
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

Well yes but these need to be called under rcu_read_lock.
Who does it here?
If no one then maybe you found an actual bug and we need to
fix it not paper over it.


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
> @@ -2692,7 +2692,7 @@ __latent_entropy struct task_struct *copy_process(
>  			 */
>  			p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
>  							 p->real_parent->signal->is_child_subreaper;
> -			list_add_tail(&p->sibling, &p->real_parent->children);
> +			list_add_tail(&p->sibling, &(rcu_dereference(p->real_parent)->children));
>  			list_add_tail_rcu(&p->tasks, &init_task.tasks);
>  			attach_pid(p, PIDTYPE_TGID);
>  			attach_pid(p, PIDTYPE_PGID);
> -- 
> 2.39.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
