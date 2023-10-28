Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC8DC0032E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Oct 2023 12:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85BDB41B88;
	Sat, 28 Oct 2023 12:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85BDB41B88
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OqWqjujd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3s5l8WqP8IqZ; Sat, 28 Oct 2023 12:20:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5E4E741B6F;
	Sat, 28 Oct 2023 12:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E4E741B6F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D2D9C0039;
	Sat, 28 Oct 2023 12:20:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D17D2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 12:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CE9F4119D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 12:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CE9F4119D
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=OqWqjujd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DYB_yYdb7QWl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 12:20:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 372EF411A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 12:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 372EF411A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698495636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aY/L9HTCAfBjIm3433sSzOmJ5GhpAINzTj4Ry4zadik=;
 b=OqWqjujdumtvjTy4kDGyMM57oyw9Wzi33IXYH4D/W3i6xyx5e53s68Gyl6LbrexbDWi5+6
 GDgmlxi/G3YUVwoyWuXWpR7mworKMvFgqvQZ/StuU3w0ZXlhgGbsJcC4vasTaMnjZ2iinS
 PTHJUdE8nhg/L0wH8mqKvZ/SMlb3R9s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-P4fptyVoO16sD8_xmNATEQ-1; Sat, 28 Oct 2023 08:20:35 -0400
X-MC-Unique: P4fptyVoO16sD8_xmNATEQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32f790a39d2so307164f8f.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 05:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698495634; x=1699100434;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aY/L9HTCAfBjIm3433sSzOmJ5GhpAINzTj4Ry4zadik=;
 b=qICeFYPsZ8LG04vxoayQcB/cHe6A+n46eKnGD4j5dV29ECBXVV56TBD/uSxkWP1K6y
 YPCS7/0KaK61yAOCb+6QN9bfel6rsnMpZIoF0zHP8Eg8dPNq3TwSUYI+hZtUxOviVY6P
 JmrTFU2YiycYPpC7KkAXCO81Y5/H4o1nJUToBM9K5gzXOX2ZXSV2RkxSxFL2EiKHZiCQ
 qTY0FH8zPgbIGSc1AJ+yXzRP4JWo6mVvBKhL5/MKgCh0jCEJ5q3gZ+20zqFQhCH7z8Hi
 +Lnlk7mM/k/7P9ieTCzqWYKUIQsw4tv6ZdQU/vQZivA8MNUWSE2dp+B8sEcGlHjFEprF
 ASEQ==
X-Gm-Message-State: AOJu0YyWavkr0fTwN3n1XjmAZ+O6O4iCXjxgeQ6RPyXHrPHVixdmJ+1F
 FjlkWqAOUY+hOUmdJZ/5ffuHRkPDWeQDxGDbnaKiEwFVb104vr1NRzaZpyihRMtc1kpjAtiKDrk
 bXv20MqX2oZ6E95vwxrgQ/7KyC9yL3XYapJEgk7lBsmT5W5o1
X-Received: by 2002:adf:fd82:0:b0:32d:9a87:b7a with SMTP id
 d2-20020adffd82000000b0032d9a870b7amr3282942wrr.50.1698495634009; 
 Sat, 28 Oct 2023 05:20:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF80KLaWzeWd6XMuxQiL/btLDTUqSjzy0ssxvalh3/0LkuhTt1W/o+9toYfvqCLPckxhP5Ncg==
X-Received: by 2002:adf:fd82:0:b0:32d:9a87:b7a with SMTP id
 d2-20020adffd82000000b0032d9a870b7amr3282929wrr.50.1698495633646; 
 Sat, 28 Oct 2023 05:20:33 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73d2:bf00:e379:826:5137:6b23])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a5d4844000000b0032d2f09d991sm3748918wrs.33.2023.10.28.05.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 05:20:32 -0700 (PDT)
Date: Sat, 28 Oct 2023 08:20:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
Subject: Re: [PATCH v3] Fixing directly deferencing a __rcu pointer warning
Message-ID: <20231028081915-mutt-send-email-mst@kernel.org>
References: <20231027122221.GA24128@redhat.com>
 <20231028102247.404488-1-singhabhinav9051571833@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20231028102247.404488-1-singhabhinav9051571833@gmail.com>
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

On Sat, Oct 28, 2023 at 03:52:47PM +0530, Abhinav Singh wrote:
> This patch fixes the warning about directly dereferencing a pointer
> tagged with __rcu annotation.
> 
> Dereferencing the pointers tagged with __rcu directly should
> always be avoided according to the docs. There is a rcu helper
> function rcu_dereference(...) to use when dereferencing a __rcu
> pointer. This function returns the non __rcu tagged pointer which
> can be dereferenced just like a normal pointer.
> 
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> ---
> v1 -> v2 : added rcu_dereference(...) at line 2694
> v2 -> v3 : added rcu_dereference(...) at line 2695
> 
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
> -- 
> 2.39.2


You seem to just ignore review comments. NAK. I'm not going to review this anymore.


-- 
MST

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
