Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A29EC25B6F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Oct 2023 06:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A26827042C;
	Fri, 27 Oct 2023 06:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A26827042C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fCTyvsB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuWKzLfBzxGB; Fri, 27 Oct 2023 06:42:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 484ED6FA69;
	Fri, 27 Oct 2023 06:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 484ED6FA69
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 316A4C0071;
	Fri, 27 Oct 2023 06:42:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE98AC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 06:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A46C784B3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 06:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A46C784B3A
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fCTyvsB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ci8J2qYkytfo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 06:42:00 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E498184B38
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 06:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E498184B38
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6bcdfcde944so423560b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 23:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698388919; x=1698993719;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GRyFJrR5fk8DHlbv1dDr6nCLPbHAmO3CAZkM/W8M2k8=;
 b=fCTyvsB6TsEDEsu0BC8g2bhfxxEErlcK+USU+nqxMCq4xaa3OycyY9q2hIzStFprCC
 S3Q0MSCwV3qoopM3R/6ebzSComc6m5hW2PaH95CSKytBVSoq4YKZtn7yVaYVjU36o2St
 pRtO8Cl5ojAjM6qqcgFynbC4x0q5GoG5vhXV04YNmqUL+UOWI+uc+4nAi7pNKp1EUcI5
 BT4530VKuDoXqdLY7CvN5wDIZkZPFyA9mjbITvOvIDgYAIyH+RWpVfaDVZwo13bhDCNb
 Tz31m7pzpJUzKMd/sFXshW6i6dIyQIw/P4kuz0iaQt46NlP2SPHSxJt+VXzGWqsB7hmB
 seuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698388919; x=1698993719;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GRyFJrR5fk8DHlbv1dDr6nCLPbHAmO3CAZkM/W8M2k8=;
 b=UyBuFS59EDazZpc8w7vBkBuRaRhettcvkn5ze1Y5qdBHAHQE+w6pYMqza41uakZJAK
 nay6XzXZDLJPxGSknd8kooQ16vh9PqLHpFz4QBMmVszUTrGYcrTLjZ8fidXHkp5z2jCF
 a1MNIAGPqlAvKSWD1tJFg52PMzZC8SQaRHBjH18DUdYHwXKXJFpeMwmv6xTuQAo13ur4
 QooMcpdk70EhSTTIjmRVWywn0p7wpEiaxJOacxlY2CuXGSqmoiZ1Y0DSeu/oGFf0cJwl
 ehF2MfoXl2rnwIw0iPx12BBnNcg9fmAuGt5gnUDB4syNtwFxZultdF7QhTgwj2kMo/h9
 W8Lg==
X-Gm-Message-State: AOJu0YwxRn6IBU8fAquNTj7/OMaE+Yc3rZqDpw+WXnCyaYCLYDnf6q8t
 QIwjBEnvZxqZc2KUggIF/sY=
X-Google-Smtp-Source: AGHT+IHTG0/c51ndfUiYZV4hFH3T5sfIrOIwAUktBI/XNiC+oUTVEfSvUdl+e2E+ZuVWkL3BayVh0g==
X-Received: by 2002:a05:6a20:440d:b0:163:ab09:195d with SMTP id
 ce13-20020a056a20440d00b00163ab09195dmr2371620pzb.0.1698388919131; 
 Thu, 26 Oct 2023 23:41:59 -0700 (PDT)
Received: from [192.168.0.152] ([103.75.161.208])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a62d146000000b006babcf86b84sm678650pfl.34.2023.10.26.23.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 23:41:58 -0700 (PDT)
Message-ID: <db40353c-bee5-491c-b301-f994258ed0f9@gmail.com>
Date: Fri, 27 Oct 2023 12:11:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Fixing directly deferencing a __rcu pointer warning
Content-Language: en-US
To: akpm@linux-foundation.org, brauner@kernel.org, surenb@google.com,
 mst@redhat.com, michael.christie@oracle.com, mathieu.desnoyers@efficios.com,
 mjguzik@gmail.com, npiggin@gmail.com, shakeelb@google.com,
 peterz@infradead.org
References: <20231026114632-mutt-send-email-mst@kernel.org>
 <20231027063713.1018624-1-singhabhinav9051571833@gmail.com>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231027063713.1018624-1-singhabhinav9051571833@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 10/27/23 12:07, Abhinav Singh wrote:
> This patch fixes the warning about directly dereferencing a pointer
> tagged with __rcu annotation.
> 
> Dereferencing the pointers tagged with __rcu directly should
> always be avoided according to the docs. There is a rcu helper
> functions rcu_dereference(...) to use when dereferencing a __rcu
> pointer. This functions returns the non __rcu tagged pointer which
> can be dereferenced just like a normal pointers.
> 
> 
> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> ---
>   kernel/fork.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 10917c3e1f03..e78649974669 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2369,7 +2369,7 @@ __latent_entropy struct task_struct *copy_process(
>   
>   	retval = -EAGAIN;
>   	if (is_rlimit_overlimit(task_ucounts(p), UCOUNT_RLIMIT_NPROC, rlimit(RLIMIT_NPROC))) {
> -		if (p->real_cred->user != INIT_USER &&
> +		if (rcu_dereference(p->real_cred)->user != INIT_USER &&
>   		    !capable(CAP_SYS_RESOURCE) && !capable(CAP_SYS_ADMIN))
>   			goto bad_fork_cleanup_count;
>   	}
> @@ -2690,9 +2690,9 @@ __latent_entropy struct task_struct *copy_process(
>   			 * tasklist_lock with adding child to the process tree
>   			 * for propagate_has_child_subreaper optimization.
>   			 */
> -			p->signal->has_child_subreaper = p->real_parent->signal->has_child_subreaper ||
> -							 p->real_parent->signal->is_child_subreaper;
> -			list_add_tail(&p->sibling, &p->real_parent->children);
> +			p->signal->has_child_subreaper = rcu_dereference(p->real_parent)->signal->has_child_subreaper ||
> +							rcu_dereference(p->real_parent)->signal->is_child_subreaper;
> +			list_add_tail(&p->sibling, &rcu_dereference(p->real_parent)->children);
>   			list_add_tail_rcu(&p->tasks, &init_task.tasks);
>   			attach_pid(p, PIDTYPE_TGID);
>   			attach_pid(p, PIDTYPE_PGID);

For this particular file I have resolved the rcu pointer dereferencing 
issue and I have tested the above by using qemu using this command
qemu-system-x86_64 \
	-m 2G \
	-smp 2 \
	-kernel /home/abhinav/linux_work/linux/arch/x86/boot/bzImage \
	-append "console=ttyS0 root=/dev/sda earlyprintk=serial net.ifnames=0" \
	-drive file=/home/abhinav/linux_work/boot_images/bullseye.img,format=raw \
	-net user,host=10.0.2.10,hostfwd=tcp:127.0.0.1:10021-:22 \
	-net nic,model=e1000 \
	-enable-kvm \
	-nographic \
	-pidfile vm.pid \
	2>&1 | tee vm.log
it booted without any issues.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
