Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACAFC25B67
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Oct 2023 07:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE034432A6;
	Fri, 27 Oct 2023 07:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE034432A6
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KNTkAosU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G5fk4M-q_H-X; Fri, 27 Oct 2023 07:00:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6C8A7431E8;
	Fri, 27 Oct 2023 07:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C8A7431E8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44358C0071;
	Fri, 27 Oct 2023 07:00:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E15E6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 07:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7DEB70560
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 07:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7DEB70560
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=KNTkAosU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3XQ3c9gO1Zz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 07:00:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFDA07055E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 07:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFDA07055E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698390028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kneXyjLJZE3jGCsWvtlzo7wk7NDYW1E0EHUPjV/fnfg=;
 b=KNTkAosUznBMYUHCeEdKN81NjPW7wym7htMqKeI5TpiceCOk8Mu79XaRCzjG33WRvkY8pd
 vn2odBhkzqvdQZ1nRA8TkkntQ95An2nvx+YaTvl8ivp5Ca/TVYq0nl926hMJD2yzOAS568
 8cHG9qHdb+oYIiY8fpyHpOYrVgAYqos=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-_f8YvahkMsCbkVm8LeZ4Ig-1; Fri, 27 Oct 2023 03:00:26 -0400
X-MC-Unique: _f8YvahkMsCbkVm8LeZ4Ig-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-53e08e439c8so2036973a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 00:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698390023; x=1698994823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kneXyjLJZE3jGCsWvtlzo7wk7NDYW1E0EHUPjV/fnfg=;
 b=VwWLb2ILaqKCg9IS1nhbqlcxbaXhqDMnEbcXYU45vYXbTOx7IwskgqwJVAdJx3imVM
 t2ngQzPL7P8gpsUnXdyG31QVN/HOpRMFNBzR7gXZ4oLMiIrhUXdaZD+eGKGNoYk5B2tN
 SxJ0kF7hrMqz33cmwQCyQlzF3ah9QudpdB3TlNVYmoHdb5FxTNVRpfBD66IYbUUzqxaI
 KnsOk76oGUzhlIoDYUzBGcGmbKXJ/JQ6Uc/pJuQUP7E79BkUINAcZg53USU6byI106ig
 X+eyhGrR7TdiLeNLLhB4bipMfoxu96XZay16GIvpOwX8qfKWaexNcxmUTtHLZM72iTQ5
 YnBg==
X-Gm-Message-State: AOJu0YwUkR1RJnUXXUGMLVZVYt+duvPj6KGyffSEw/RApiVsIO327gIE
 +SxWO/yeuGsXxM2ENU82LlkGcqYo13dykNBetelwV49LPxztcCEf3eommlK3DumVaNs5hj1TcAu
 nuLZNVEG/jX6q8w91dAVwL63Ry1twSOnRZxc8TOgZQZe+pcYO
X-Received: by 2002:a50:d4d7:0:b0:53d:e91b:7158 with SMTP id
 e23-20020a50d4d7000000b0053de91b7158mr2339291edj.0.1698390023675; 
 Fri, 27 Oct 2023 00:00:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuPBIUVLzDiahv/oYNrf+QZILAUuEQMuZYQKJL5znspjpOYG05EoUK7ekAjj+2nvq2CSM7VQ==
X-Received: by 2002:a50:d4d7:0:b0:53d:e91b:7158 with SMTP id
 e23-20020a50d4d7000000b0053de91b7158mr2339264edj.0.1698390023340; 
 Fri, 27 Oct 2023 00:00:23 -0700 (PDT)
Received: from redhat.com ([2a02:14f:173:52a8:fc3f:6e84:948f:e841])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a50cd59000000b0053e469f6505sm753876edj.26.2023.10.27.00.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 00:00:22 -0700 (PDT)
Date: Fri, 27 Oct 2023 03:00:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: Re: [PATCH v3] Fixing directly deferencing a __rcu pointer warning
Message-ID: <20231027025029-mutt-send-email-mst@kernel.org>
References: <20231026114632-mutt-send-email-mst@kernel.org>
 <20231027063713.1018624-1-singhabhinav9051571833@gmail.com>
 <db40353c-bee5-491c-b301-f994258ed0f9@gmail.com>
MIME-Version: 1.0
In-Reply-To: <db40353c-bee5-491c-b301-f994258ed0f9@gmail.com>
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

On Fri, Oct 27, 2023 at 12:11:47PM +0530, Abhinav Singh wrote:
> On 10/27/23 12:07, Abhinav Singh wrote:
> > This patch fixes the warning about directly dereferencing a pointer
> > tagged with __rcu annotation.
> > 
> > Dereferencing the pointers tagged with __rcu directly should
> > always be avoided according to the docs.



> There is a rcu helper
> > functions rcu_dereference(...) to use when dereferencing a __rcu
> > pointer. This functions returns the non __rcu tagged pointer which
> > can be dereferenced just like a normal pointers.
> > 
> > 
> > Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> > ---
> >   kernel/fork.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index 10917c3e1f03..e78649974669 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -2369,7 +2369,7 @@ __latent_entropy struct task_struct *copy_process(
> >   	retval = -EAGAIN;
> >   	if (is_rlimit_overlimit(task_ucounts(p), UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC))) {
> > -		if (p->real_cred->user != INIT_USER &&
> > +		if (rcu_dereference(p->real_cred)->user != INIT_USER &&
> >   		    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
> >   			goto bad_fork_cleanup_count;
> >   	}
> > @@ -2690,9 +2690,9 @@ __latent_entropy struct task_struct *copy_process(
> >   			 * tasklist_lock with adding child to the process tree
> >   			 * for propagate_has_child_subreaper optimization.
> >   			 */
> > -			p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
> > -							 p->real_parent->signal->is_child_subreaper;
> > -			list_add_tail(&p->sibling, &p->real_parent->children);
> > +			p->signal->has_child_subreaper = rcu_dereference(p->real_parent)->signal->has_child_subreaper ||
> > +							rcu_dereference(p->real_parent)->signal->is_child_subreaper;
> > +			list_add_tail(&p->sibling, &rcu_dereference(p->real_parent)->children);
> >   			list_add_tail_rcu(&p->tasks, &init_task.tasks);
> >   			attach_pid(p, PIDTYPE_TGID);
> >   			attach_pid(p, PIDTYPE_PGID);
> 
> For this particular file I have resolved the rcu pointer dereferencing issue
> and I have tested the above by using qemu using this command
> qemu-system-x86_64 \
> 	-m 2G \
> 	-smp 2 \
> 	-kernel /home/abhinav/linux_work/linux/arch/x86/boot/bzImage \
> 	-append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
> 	-drive file=/home/abhinav/linux_work/boot_images/bullseye.img,format=raw \
> 	-net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
> 	-net nic,model=e1000 \
> 	-enable-kvm \
> 	-nographic \
> 	-pidfile vm.pid \
> 	2>&1 | tee vm.log
> it booted without any issues.

Did you enable lockdep in your kernel?
CONFIG_PROVE_LOCKING and CONFIG_PROVE_RCU in particular.

-- 
MST

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
