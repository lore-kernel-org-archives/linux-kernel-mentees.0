Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAF8C27C47
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Oct 2023 10:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A3E260FF4;
	Sat, 28 Oct 2023 10:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A3E260FF4
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X9rB+zYF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YrhkIvfH92Mn; Sat, 28 Oct 2023 10:31:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3873F60FF6;
	Sat, 28 Oct 2023 10:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3873F60FF6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 136E4C0039;
	Sat, 28 Oct 2023 10:31:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBBF8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 10:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A093E8348C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 10:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A093E8348C
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X9rB+zYF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-iT-9JN39gz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 10:31:24 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF06083459
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 10:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF06083459
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6bcbfecf314so773457b3a.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Oct 2023 03:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698489084; x=1699093884;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y2GySqZOk9lw/mCBfX2becssT8j/7QRVN5jjdGNKoi8=;
 b=X9rB+zYFjfnlbdvwzrdxQZEdM6kPIL/TZEHclqBwARLGBggiofhtbci9P2DsY9FW4F
 woZTCrSAlU9pOTrRLDKDHYbN96GNN/fr9pHNsLm9ST14H67ses2oUwS3KTWkWS1CIgj2
 bF2QglG5Kg6ntNr0+uL/6pEn4BPV4/XG+eUT8MccA2nIk/P1Fh9BLpZZmo9vqIJOxDBq
 P46JrmtrmIijOM/mvJr1fkHnMKMFrDmXAwfpSMpcmOOwyZEooITRx3IoLysqpnEofH4L
 SsyhWgOxI5JB3t7HvLoLg5aJ0gUCXT0UdfsMdGk7Mchhq5JZpSCYBOyLopEQksuW7ZGK
 hbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698489084; x=1699093884;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y2GySqZOk9lw/mCBfX2becssT8j/7QRVN5jjdGNKoi8=;
 b=byY1TxNCtVI82+daSy4zSEL0/l2wCfwlw7HrmTFB8+TSK31olkJJHkWL25TIbobqcZ
 5SeeQbldRFDaq9xYWQxJnCncylQSY6X2iTjj5c6wQADWClsHstSmCmDzJS1qtBwvmSfO
 /USUPX8YC7OVH4VlBxhGNeBA0NhtsBTc3iV/Tr3+P/tbLvyhaziTS6Mo1RPEdz9hfeqZ
 Hg6cwFmWdKxsLbJFebpeC447ffIE/kQQ/N1PG5wU0S2TYSMzbpFKx6w2xC4k7ucJ8Gen
 NE/ccBRUBs7dyGNOz26cOfMK+UhEsGIwksoNJFsdqcAo3WuaDAA6mQl/KMx8mjSGgSlM
 c2eg==
X-Gm-Message-State: AOJu0YxvnsqHaSlh/4nLD+kMX787f/lVuOPTRpkAHWXksAAkvRhjOEwG
 g6DKKDhMKF4Ozv6O/fllNpI=
X-Google-Smtp-Source: AGHT+IENXe2JAUJizchzMKP3yhyuleg8xkzi7EggQ3PMszAhQY54bt/d08+l5jxF4PsiGpkKG9VrWg==
X-Received: by 2002:a05:6a00:468c:b0:6be:4b10:b27d with SMTP id
 de12-20020a056a00468c00b006be4b10b27dmr5453347pfb.0.1698489084072; 
 Sat, 28 Oct 2023 03:31:24 -0700 (PDT)
Received: from [192.168.0.152] ([103.75.161.211])
 by smtp.gmail.com with ESMTPSA id
 k3-20020aa79983000000b006979f70fdd5sm2678492pfh.219.2023.10.28.03.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Oct 2023 03:31:23 -0700 (PDT)
Message-ID: <1abcad65-5367-44e0-8000-11feec1015e8@gmail.com>
Date: Sat, 28 Oct 2023 16:01:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Fixing directly deferencing a __rcu pointer warning
To: akpm@linux-foundation.org, brauner@kernel.org, surenb@google.com,
 mst@redhat.com, michael.christie@oracle.com, mathieu.desnoyers@efficios.com,
 mjguzik@gmail.com, npiggin@gmail.com, shakeelb@google.com,
 peterz@infradead.org
References: <20231027122221.GA24128@redhat.com>
 <20231028102247.404488-1-singhabhinav9051571833@gmail.com>
Content-Language: en-US
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
In-Reply-To: <20231028102247.404488-1-singhabhinav9051571833@gmail.com>
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

On 10/28/23 15:52, Abhinav Singh wrote:
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

I tested the above with these two config enabled, CONFIG_PROVE_LOCKING 
and CONFIG_PROVE_RCU. In qemu it booted fine without any issues. I then 
checked dmesg log (inside booted qemu envirnoment) for any issues with 
rcu, but didnt get any error or warning.

I didnt receive any warning message "suspicious rcu_dereference_check() 
usage" atleast from sparse tool or in the dmesg log as suggested by Oleg 
Nesterov.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
