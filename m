Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDF3C25B47
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Oct 2023 06:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62C6470552;
	Fri, 27 Oct 2023 06:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62C6470552
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EETcaowN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNA448F6zDrQ; Fri, 27 Oct 2023 06:50:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 55C3E704E9;
	Fri, 27 Oct 2023 06:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55C3E704E9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B53AC0071;
	Fri, 27 Oct 2023 06:50:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6B55C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 06:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB9EA704E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 06:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB9EA704E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cj9V_CVGT_3V
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 06:50:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1FD2704EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 06:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1FD2704EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698389420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JXHKqBoYoz/bbf5vHc18YlN8Sqw/t3HDn4UL/zx+cXA=;
 b=EETcaowNrdo04mjNMRl8GY+Pr8mFJd+mRCfpKz69q6KM1/puu08SVn3RWOjUWav4WRmTMC
 8IKIJJCpw1mnBDdoENl3s2Fa7bqGe9g/I2MMTKqRLPgG0WP8I4wd916hhBqt5fhUwpeFzL
 bAttSaAGbJ8oUbopEAkxmCQusvgOe2c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-XrTSAGLAPFa3ewOOWYrLqw-1; Fri, 27 Oct 2023 02:50:19 -0400
X-MC-Unique: XrTSAGLAPFa3ewOOWYrLqw-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-52f274df255so3247613a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 23:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698389418; x=1698994218;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXHKqBoYoz/bbf5vHc18YlN8Sqw/t3HDn4UL/zx+cXA=;
 b=XrChLm58dH13Gy6rSV0kkU+YgWcSZ500Vo0/SF0qgdiJYwn2DcZ1O8oouJg1vMpXG4
 xCvGwo/a2MV98DoDTmaR30gsWggbzRYyQbHg9us69eirA8dz1WZO2Dpi0CCNa06feYab
 2GKggkG+10ZIVn+ZYd+jYYgnj+atj1iuN3XR8z/WpdHLudH0tZHIU3MHNkA2xguaTRrT
 RO97AWkdGHrS5QZ8EGRAemGTCCTqr/6/2Lm+2S7/HY9cx0UFtQwKP1JjtjmDxgvJdLzz
 9Vmm+2joa9oyViR0uyjaLJIgCEQaCVqjvHJmdYidc/gtslxMZbsHJ8qBPdvduhNuD/mn
 MddA==
X-Gm-Message-State: AOJu0YxHsgOw0kOpFcNdPNYDjxUnH2VGOxHgbRpGXQnByyd3G84JG8vH
 mRqoLzquZmYxyGjSRg1cwJ7yDnG8RSiaFG/2SeZQ8x5m/qUrCIESsjnf+dlkKS+ucyW2KhJbnwO
 1HpCxPGscl/GQoPJF0BQq5YmFIuXtH/dmaVfQJ19zxnNK0N1d
X-Received: by 2002:a50:9ecb:0:b0:53e:e623:6a47 with SMTP id
 a69-20020a509ecb000000b0053ee6236a47mr2425191edf.4.1698389418347; 
 Thu, 26 Oct 2023 23:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkVPAkDzj+U3xbbVCAqVFQdnAbNKebHtXDjfvyRn2KyzHxudgu4lXhGeW2B7p4FGbfDasXRQ==
X-Received: by 2002:a50:9ecb:0:b0:53e:e623:6a47 with SMTP id
 a69-20020a509ecb000000b0053ee6236a47mr2425173edf.4.1698389418012; 
 Thu, 26 Oct 2023 23:50:18 -0700 (PDT)
Received: from redhat.com ([2a02:14f:173:52a8:fc3f:6e84:948f:e841])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a508d16000000b005401a4184ddsm746731eds.27.2023.10.26.23.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 23:50:17 -0700 (PDT)
Date: Fri, 27 Oct 2023 02:50:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: Re: [PATCH v3] Fixing directly deferencing a __rcu pointer warning
Message-ID: <20231027024528-mutt-send-email-mst@kernel.org>
References: <20231026114632-mutt-send-email-mst@kernel.org>
 <20231027063713.1018624-1-singhabhinav9051571833@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20231027063713.1018624-1-singhabhinav9051571833@gmail.com>
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

On Fri, Oct 27, 2023 at 12:07:13PM +0530, Abhinav Singh wrote:
> This patch fixes the warning about directly dereferencing a pointer
> tagged with __rcu annotation.
> 
> Dereferencing the pointers tagged with __rcu directly should
> always be avoided according to the docs. There is a rcu helper
> functions

function

> rcu_dereference(...) to use when dereferencing a __rcu
> pointer.


... inside rcu read side critical sections.

> This functions

function

> returns the non __rcu tagged pointer which
> can be dereferenced just like a normal pointers.

pointer

> 
>

Extra empty line here.
 

Did you test this with lockdep on or did you just build it?
Include info on how the patch was tested pls.

> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>

> ---

Changelog?


>  kernel/fork.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 10917c3e1f03..e78649974669 100644
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
> @@ -2690,9 +2690,9 @@ __latent_entropy struct task_struct *copy_process(
>  			 * tasklist_lock with adding child to the process tree
>  			 * for propagate_has_child_subreaper optimization.
>  			 */
> -			p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
> -							 p->real_parent->signal->is_child_subreaper;
> -			list_add_tail(&p->sibling, &p->real_parent->children);
> +			p->signal->has_child_subreaper = rcu_dereference(p->real_parent)->signal->has_child_subreaper ||
> +							rcu_dereference(p->real_parent)->signal->is_child_subreaper;
> +			list_add_tail(&p->sibling, &rcu_dereference(p->real_parent)->children);
>  			list_add_tail_rcu(&p->tasks, &init_task.tasks);
>  			attach_pid(p, PIDTYPE_TGID);
>  			attach_pid(p, PIDTYPE_PGID);

It looks like you are calling rcu_dereference outside of
read side critical section and that does not look right to me.
Test with lockdep on.

> -- 
> 2.39.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
