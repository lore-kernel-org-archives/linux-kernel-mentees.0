Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC926155308
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 04:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729745074; cv=none; b=GfNGO9cIJ4xBtrsNrr2q31w9YZaruzvHCLJK0JwLXbXvSngpqK/sJgTIzetw6FzMg5fsvIqFMKaX7ZmWPPRDrBhkINKLubAhHsOG2FqoNkVvBz4HvgaGVwVst/axJ4dJ5q8lYAyZcVaB6JEFITCl21bfeQLSKCwq0rqhTNf8B8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729745074; c=relaxed/simple;
	bh=eNxua7fVhlrHsDzXd5XLS5wzVaIJOtp3EmVortX/huk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zt22faoPQ5Bdcfvy7lw+E1yzLzOd45fdSQPAQUuxCLoCodR0tzUPWX2Y56WyNGmZlyueWixw6XA+Kg5esvQFJZpLH4IoeRP4WF1R1oL9cFt016wmvRmjNi3lHS21YySOeB8EEVP7NK3xduRKKTl8nffRsh2kSrSVkttc/gebeAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 293938122D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 04:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.651
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51tcuOzUew5v for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Oct 2024 04:44:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=etyt=ru=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 912F28122C
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=goodmis.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 912F28122C
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 912F28122C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 24 Oct 2024 04:44:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CADCDA44FE1;
	Thu, 24 Oct 2024 04:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D30BC4CEC7;
	Thu, 24 Oct 2024 04:44:25 +0000 (UTC)
Date: Thu, 24 Oct 2024 00:44:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ahmed Ehab <bottaawesome633@gmail.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH v2] Refactor switch_mm_cid() to avoid unnecessary checks
Message-ID: <20241024004422.57b3a5d1@rorschach.local.home>
In-Reply-To: <20240904221817.56664-1-bottaawesome633@gmail.com>
References: <20240904221817.56664-1-bottaawesome633@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Sep 2024 01:18:17 +0300
Ahmed Ehab <bottaawesome633@gmail.com> wrote:

> The issue is that we check if we are switching from {kernel,user} to
> {kernel, user} multiple times unnecessarily.
> 
> To fix this, refactor switch_mm_cid() and break it into multiple methods
> to handle the cases of switching from {kernel,user} to {kernel, user}.
> Hence, we avoid any redundant checks.

Does this make any difference in performance? Is there some benchmark
numbers that show that it does if it did?

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408270455.R85TrPfw-lkp@intel.com/

You don't add "Reported-by" and "Closes" tags that address the v1
version in the v2 patch. These tags are only for things that are
currently in the kernel.

> Signed-off-by: Ahmed Ehab <bottaawesome633@gmail.com>
> ---
>  kernel/sched/core.c  | 15 +++++---
>  kernel/sched/sched.h | 84 +++++++++++++++++++++++++++-----------------
>  2 files changed, 62 insertions(+), 37 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index f3951e4a55e5..900c5a763e0a 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5155,9 +5155,15 @@ context_switch(struct rq *rq, struct task_struct *prev,
>  		enter_lazy_tlb(prev->active_mm, next);
>  
>  		next->active_mm = prev->active_mm;
> -		if (prev->mm)                           // from user
> +		if (prev->mm) {                           // from user
>  			mmgrab_lazy_tlb(prev->active_mm);
> +			switch_mm_cid_from_user_to_kernel(rq, prev, next);
> +		}
>  		else
> +			/*
> +			 * kernel -> kernel transition does not change rq->curr->mm
> +			 * state. It stays NULL.
> +			 */
>  			prev->active_mm = NULL;

The above breaks the kernel coding style.

See https://www.kernel.org/doc/html/v6.11/process/coding-style.html

>  	} else {                                        // to user
>  		membarrier_switch_mm(rq, prev->active_mm, next->mm);
> @@ -5176,12 +5182,11 @@ context_switch(struct rq *rq, struct task_struct *prev,
>  			/* will mmdrop_lazy_tlb() in finish_task_switch(). */
>  			rq->prev_mm = prev->active_mm;
>  			prev->active_mm = NULL;
> -		}
> +			switch_mm_cid_from_kernel_to_user(rq, prev, next);
> +		} else
> +			switch_mm_cid_from_user_to_user(rq, prev, next);
>  	}
>  
> -	/* switch_mm_cid() requires the memory barriers above. */
> -	switch_mm_cid(rq, prev, next);
> -
>  	prepare_lock_switch(rq, next, rf);
>  
>  	/* Here we just switch the register state and the stack. */
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 4c36cc680361..c01ca8962518 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3524,38 +3524,6 @@ static inline void switch_mm_cid(struct rq *rq,
>  	 *
>  	 * Should be adapted if context_switch() is modified.
>  	 */
> -	if (!next->mm) {                                // to kernel
> -		/*
> -		 * user -> kernel transition does not guarantee a barrier, but
> -		 * we can use the fact that it performs an atomic operation in
> -		 * mmgrab().
> -		 */
> -		if (prev->mm)                           // from user
> -			smp_mb__after_mmgrab();
> -		/*
> -		 * kernel -> kernel transition does not change rq->curr->mm
> -		 * state. It stays NULL.
> -		 */
> -	} else {                                        // to user
> -		/*
> -		 * kernel -> user transition does not provide a barrier
> -		 * between rq->curr store and load of {prev,next}->mm->pcpu_cid[cpu].
> -		 * Provide it here.
> -		 */
> -		if (!prev->mm) {                        // from kernel
> -			smp_mb();
> -		} else {				// from user
> -			/*
> -			 * user->user transition relies on an implicit
> -			 * memory barrier in switch_mm() when
> -			 * current->mm changes. If the architecture
> -			 * switch_mm() does not have an implicit memory
> -			 * barrier, it is emitted here.  If current->mm
> -			 * is unchanged, no barrier is needed.
> -			 */
> -			smp_mb__after_switch_mm();
> -		}
> -	}
>  	if (prev->mm_cid_active) {
>  		mm_cid_snapshot_time(rq, prev->mm);
>  		mm_cid_put_lazy(prev);
> @@ -3565,8 +3533,60 @@ static inline void switch_mm_cid(struct rq *rq,
>  		next->last_mm_cid = next->mm_cid = mm_cid_get(rq, next->mm);
>  }
>  
> +static inline void switch_mm_cid_from_user_to_kernel(struct rq *rq,
> +						     struct task_struct *prev,
> +						     struct task_struct *next)
> +
> +{
> +	/**
> +	 * user -> kernel transition does not guarantee a barrier, but
> +	 * we can use the fact that it performs an atomic operation in
> +	 * mmgrab().
> +	 */
> +	smp_mb__after_mmgrab();
> +	switch_mm_cid(rq, prev, next);
> +
> +}
> +
> +static inline void switch_mm_cid_from_kernel_to_user(struct rq *rq,
> +						     struct task_struct *prev,
> +						     struct task_struct *next)
> +
> +{
> +	/*
> +	 * kernel -> user transition does not provide a barrier
> +	 * between rq->curr store and load of {prev,next}->mm->pcpu_cid[cpu].
> +	 * Provide it here.
> +	 */
> +	smp_mb();
> +	switch_mm_cid(rq, prev, next);
> +
> +}
> +
> +
> +static inline void switch_mm_cid_from_user_to_user(struct rq *rq,
> +						   struct task_struct *prev,
> +						   struct task_struct *next)
> +
> +{
> +	/*
> +	 * user->user transition relies on an implicit
> +	 * memory barrier in switch_mm() when
> +	 * current->mm changes. If the architecture
> +	 * switch_mm() does not have an implicit memory
> +	 * barrier, it is emitted here.  If current->mm
> +	 * is unchanged, no barrier is needed.
> +	 */
> +	smp_mb__after_switch_mm();
> +	switch_mm_cid(rq, prev, next);
> +
> +}
> +
>  #else /* !CONFIG_SCHED_MM_CID: */
>  static inline void switch_mm_cid(struct rq *rq, struct task_struct *prev, struct task_struct *next) { }
> +static inline void switch_mm_cid_from_user_to_user(struct rq *rq, struct task_struct *prev, struct task_struct *next) { }
> +static inline void switch_mm_cid_from_user_to_kernel(struct rq *rq, struct task_struct *prev, struct task_struct *next) { }
> +static inline void switch_mm_cid_from_kernel_to_user(struct rq *rq, struct task_struct *prev, struct task_struct *next) { }
>  static inline void sched_mm_cid_migrate_from(struct task_struct *t) { }
>  static inline void sched_mm_cid_migrate_to(struct rq *dst_rq, struct task_struct *t) { }
>  static inline void task_tick_mm_cid(struct rq *rq, struct task_struct *curr) { }

This moves the burden of how the mm is changing to multiple places in
the logic when it was originally in a single place. Is that really better?

My opinion is that it is not, unless you can show an improvement in
benchmarks (which I believe will be highly unlikely).

-- Steve
