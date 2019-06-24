From: corbet at lwn.net (Jonathan Corbet)
Date: Sun, 23 Jun 2019 18:45:51 -0600
Subject: [Linux-kernel-mentees] [PATCH v2 5/7] Documentation: RCU:
 Convert RCU UP systems to ReST
In-Reply-To: <20190623081413.7095-6-c0d1n61at3@gmail.com>
References: <20190622090046.178d9d16@lwn.net>
	<20190623081413.7095-6-c0d1n61at3@gmail.com>
Message-ID: <20190623184551.03a2300d@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Sun, 23 Jun 2019 03:14:11 -0500
Jiunn Chang <c0d1n61at3 at gmail.com> wrote:

> ReST markup and TOC tree hook.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
> ---
>  Documentation/RCU/UP.txt    | 27 ++++++++++++++-------------
>  Documentation/RCU/index.rst |  1 +
>  2 files changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/RCU/UP.txt b/Documentation/RCU/UP.txt
> index 53bde717017b..10fede2acfc0 100644
> --- a/Documentation/RCU/UP.txt
> +++ b/Documentation/RCU/UP.txt
> @@ -1,17 +1,19 @@
> -RCU on Uniprocessor Systems
> +.. _up_doc:
>  
> +RCU on Uniprocessor Systems
> +===========================
>  
>  A common misconception is that, on UP systems, the call_rcu() primitive
>  may immediately invoke its function.  The basis of this misconception
>  is that since there is only one CPU, it should not be necessary to
>  wait for anything else to get done, since there are no other CPUs for
> -anything else to be happening on.  Although this approach will -sort- -of-
> +anything else to be happening on.  Although this approach will *sort of*

Just in case you're wondering, this markup is fine; it's an actual emphasis
that you're preserving from the original.

>  work a surprising amount of the time, it is a very bad idea in general.
>  This document presents three examples that demonstrate exactly how bad
>  an idea this is.
>  
> -
>  Example 1: softirq Suicide
> +--------------------------
>  
>  Suppose that an RCU-based algorithm scans a linked list containing
>  elements A, B, and C in process context, and can delete elements from
> @@ -28,8 +30,8 @@ your kernel.
>  This same problem can occur if call_rcu() is invoked from a hardware
>  interrupt handler.
>  
> -
>  Example 2: Function-Call Fatality
> +---------------------------------
>  
>  Of course, one could avert the suicide described in the preceding example
>  by having call_rcu() directly invoke its arguments only if it was called
> @@ -46,11 +48,11 @@ its arguments would cause it to fail to make the fundamental guarantee
>  underlying RCU, namely that call_rcu() defers invoking its arguments until
>  all RCU read-side critical sections currently executing have completed.
>  
> -Quick Quiz #1: why is it -not- legal to invoke synchronize_rcu() in
> +Quick Quiz #1: why is it *not* legal to invoke synchronize_rcu() in
>  	this case?

Have you actually built the docs with these changes and looked at the
results?  This will not render the way you might like.

Thanks,

jon
