From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 5 Jul 2019 13:52:12 +0200
Subject: [Linux-kernel-mentees] [PATCH] Sched: Change type of 'overrun'
	from int to u64
In-Reply-To: <20190705085609.24453-1-puranjay12@gmail.com>
References: <20190705085609.24453-1-puranjay12@gmail.com>
Message-ID: <20190705115212.GT3402@hirez.programming.kicks-ass.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190705115212.hugeKCxqVcV9eQoM7b4qjrdF475ZFitt3H5vnW_tIs8@z>

On Fri, Jul 05, 2019 at 02:26:09PM +0530, Puranjay Mohan wrote:
> Callers of hrtimer_forward_now() should save the return value in u64.
> function sched_rt_period_timer() stores
> it in variable 'overrun' of type int
> change type of overrun from int to u64 to solve the issue.

Is there an actual issue? If we've missed _that_ many periods, something
is really buggered.

>From a code consistency PoV this patch makes sense, but I don't think
there anything really wrong with the current code.

> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> ---
>  kernel/sched/rt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index 1e6b909dca36..f5d3893914f5 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -19,7 +19,7 @@ static enum hrtimer_restart sched_rt_period_timer(struct hrtimer *timer)
>  	struct rt_bandwidth *rt_b =
>  		container_of(timer, struct rt_bandwidth, rt_period_timer);
>  	int idle = 0;
> -	int overrun;
> +	u64 overrun;
>  
>  	raw_spin_lock(&rt_b->rt_runtime_lock);
>  	for (;;) {
> -- 
> 2.21.0
> 
