Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC50C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 May 2022 23:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80AE961294;
	Tue, 24 May 2022 23:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yGUQGWj1qPuq; Tue, 24 May 2022 23:12:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9B7AD600CA;
	Tue, 24 May 2022 23:12:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A005C0039;
	Tue, 24 May 2022 23:12:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F1DCC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 23:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75FE44053E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 23:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.dev
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78IcUM6S7dA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 23:12:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DB4640320
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 23:12:52 +0000 (UTC)
Message-ID: <a9cd5385-5a26-c410-2609-4575cc0d6adf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1653433965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mk7xRNKNX0AOjCU5G7KogWbcujD8+WpYXrtI2ETV4XE=;
 b=jbyXtlbZqNLrbFY1S2vnVXbfwQVr7DceO1EXyKdR6qAsHKO5XsshFKzXtd3RxBrN866jNM
 yQBnKE2abWf1OfF+EvaXxqIq1sNo05pgot/iYufWGjiRK/GBOJy0xPePZYOgo8uUXrdYeN
 m1yUzychkjRXcWo7joeT7mC8/u+Op6c=
Date: Wed, 25 May 2022 02:12:44 +0300
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: vasily.averin@linux.dev
Subject: Re: [PATCH] ipc: Remove dead code in perform_atomic_semop()
Content-Language: en-US
To: Gautam Menghani <gautammenghani201@gmail.com>, akpm@linux-foundation.org, 
 shakeelb@google.com, mhocko@suse.com, manfred@colorfullife.com
References: <20220524182244.42987-1-gautammenghani201@gmail.com>
In-Reply-To: <20220524182244.42987-1-gautammenghani201@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 5/24/22 21:22, Gautam Menghani wrote:
> Remove the line which is dead code. Fixes the clang scan warning:
> warning: Value stored to 'result' is never read [deadcode.DeadStores]
>                 result = curr->semval;
> 
> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
>  ipc/sem.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/ipc/sem.c b/ipc/sem.c
> index 0dbdb98fdf2d..156824bcda47 100644
> --- a/ipc/sem.c
> +++ b/ipc/sem.c
> @@ -766,7 +766,6 @@ static int perform_atomic_semop(struct sem_array *sma, struct sem_queue *q)
>  	for (sop = sops; sop < sops + nsops; sop++) {
>  		curr = &sma->sems[sop->sem_num];
>  		sem_op = sop->sem_op;
> -		result = curr->semval;
>  
>  		if (sop->sem_flg & SEM_UNDO) {
>  			int undo = un->semadj[sop->sem_num] - sem_op;

Perhaps it would be better to keep the "result" but use it in the
marked line below, like it was done in previous part of this function?

                        un->semadj[sop->sem_num] = undo;
                }
                curr->semval += sem_op; <<<<<< VvS: here ?
                ipc_update_pid(&curr->sempid, q->pid);

Thank you,
	Vasily Averin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
