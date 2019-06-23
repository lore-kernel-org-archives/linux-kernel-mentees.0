From: joel at joelfernandes.org (Joel Fernandes)
Date: Sun, 23 Jun 2019 19:34:22 -0400
Subject: [Linux-kernel-mentees] [PATCH v2 1/7] Documentation: RCU:
 Convert RCU basic concepts to ReST
In-Reply-To: <20190623081413.7095-2-c0d1n61at3@gmail.com>
References: <20190622090046.178d9d16@lwn.net>
	<20190623081413.7095-2-c0d1n61at3@gmail.com>
Message-ID: <20190623233422.GC141282@google.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Sun, Jun 23, 2019 at 03:14:07AM -0500, Jiunn Chang wrote:
> ReST markup and TOC tree hook.
> 
> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>

This one LGTM.

Reviewed-by: Joel Fernandes (Google) <joel at joelfernandes.org>

thanks,

 - Joel

> ---
>  Documentation/RCU/index.rst |  17 ++++++
>  Documentation/RCU/rcu.txt   | 114 ++++++++++++++++++------------------
>  2 files changed, 75 insertions(+), 56 deletions(-)
>  create mode 100644 Documentation/RCU/index.rst
> 
> diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
> new file mode 100644
> index 000000000000..bc8cd42a91cc
> --- /dev/null
> +++ b/Documentation/RCU/index.rst
> @@ -0,0 +1,17 @@
> +.. _rcu_concepts:
> +
> +============
> +RCU concepts
> +============
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   rcu
> +
> +.. only:: subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`
> diff --git a/Documentation/RCU/rcu.txt b/Documentation/RCU/rcu.txt
> index c818cf65c5a9..2b93b128a6fd 100644
> --- a/Documentation/RCU/rcu.txt
> +++ b/Documentation/RCU/rcu.txt
> @@ -1,5 +1,8 @@
> -RCU Concepts
> +.. _rcu_doc:
>  
> +============
> +RCU Concepts
> +============
>  
>  The basic idea behind RCU (read-copy update) is to split destructive
>  operations into two parts, one that prevents anyone from seeing the data
> @@ -11,79 +14,78 @@ from a linked list would first remove the item from the list, wait for
>  a grace period to elapse, then free the element.  See the listRCU.txt
>  file for more information on using RCU with linked lists.
>  
> -
>  Frequently Asked Questions
>  
> -o	Why would anyone want to use RCU?
> +- Why would anyone want to use RCU?
>  
> -	The advantage of RCU's two-part approach is that RCU readers need
> -	not acquire any locks, perform any atomic instructions, write to
> -	shared memory, or (on CPUs other than Alpha) execute any memory
> -	barriers.  The fact that these operations are quite expensive
> -	on modern CPUs is what gives RCU its performance advantages
> -	in read-mostly situations.  The fact that RCU readers need not
> -	acquire locks can also greatly simplify deadlock-avoidance code.
> +  The advantage of RCU's two-part approach is that RCU readers need
> +  not acquire any locks, perform any atomic instructions, write to
> +  shared memory, or (on CPUs other than Alpha) execute any memory
> +  barriers.  The fact that these operations are quite expensive
> +  on modern CPUs is what gives RCU its performance advantages
> +  in read-mostly situations.  The fact that RCU readers need not
> +  acquire locks can also greatly simplify deadlock-avoidance code.
>  
> -o	How can the updater tell when a grace period has completed
> -	if the RCU readers give no indication when they are done?
> +- How can the updater tell when a grace period has completed
> +  if the RCU readers give no indication when they are done?
>  
> -	Just as with spinlocks, RCU readers are not permitted to
> -	block, switch to user-mode execution, or enter the idle loop.
> -	Therefore, as soon as a CPU is seen passing through any of these
> -	three states, we know that that CPU has exited any previous RCU
> -	read-side critical sections.  So, if we remove an item from a
> -	linked list, and then wait until all CPUs have switched context,
> -	executed in user mode, or executed in the idle loop, we can
> -	safely free up that item.
> +  Just as with spinlocks, RCU readers are not permitted to
> +  block, switch to user-mode execution, or enter the idle loop.
> +  Therefore, as soon as a CPU is seen passing through any of these
> +  three states, we know that that CPU has exited any previous RCU
> +  read-side critical sections.  So, if we remove an item from a
> +  linked list, and then wait until all CPUs have switched context,
> +  executed in user mode, or executed in the idle loop, we can
> +  safely free up that item.
>  
> -	Preemptible variants of RCU (CONFIG_PREEMPT_RCU) get the
> -	same effect, but require that the readers manipulate CPU-local
> -	counters.  These counters allow limited types of blocking within
> -	RCU read-side critical sections.  SRCU also uses CPU-local
> -	counters, and permits general blocking within RCU read-side
> -	critical sections.  These variants of RCU detect grace periods
> -	by sampling these counters.
> +  Preemptible variants of RCU (CONFIG_PREEMPT_RCU) get the
> +  same effect, but require that the readers manipulate CPU-local
> +  counters.  These counters allow limited types of blocking within
> +  RCU read-side critical sections.  SRCU also uses CPU-local
> +  counters, and permits general blocking within RCU read-side
> +  critical sections.  These variants of RCU detect grace periods
> +  by sampling these counters.
>  
> -o	If I am running on a uniprocessor kernel, which can only do one
> -	thing at a time, why should I wait for a grace period?
> +- If I am running on a uniprocessor kernel, which can only do one
> +  thing at a time, why should I wait for a grace period?
>  
> -	See the UP.txt file in this directory.
> +  See the UP.txt file in this directory.
>  
> -o	How can I see where RCU is currently used in the Linux kernel?
> +- How can I see where RCU is currently used in the Linux kernel?
>  
> -	Search for "rcu_read_lock", "rcu_read_unlock", "call_rcu",
> -	"rcu_read_lock_bh", "rcu_read_unlock_bh", "srcu_read_lock",
> -	"srcu_read_unlock", "synchronize_rcu", "synchronize_net",
> -	"synchronize_srcu", and the other RCU primitives.  Or grab one
> -	of the cscope databases from:
> +  Search for "rcu_read_lock", "rcu_read_unlock", "call_rcu",
> +  "rcu_read_lock_bh", "rcu_read_unlock_bh", "srcu_read_lock",
> +  "srcu_read_unlock", "synchronize_rcu", "synchronize_net",
> +  "synchronize_srcu", and the other RCU primitives.  Or grab one
> +  of the cscope databases from:
>  
> -	http://www.rdrop.com/users/paulmck/RCU/linuxusage/rculocktab.html
> +  (http://www.rdrop.com/users/paulmck/RCU/linuxusage/rculocktab.html).
>  
> -o	What guidelines should I follow when writing code that uses RCU?
> +- What guidelines should I follow when writing code that uses RCU?
>  
> -	See the checklist.txt file in this directory.
> +  See the checklist.txt file in this directory.
>  
> -o	Why the name "RCU"?
> +- Why the name "RCU"?
>  
> -	"RCU" stands for "read-copy update".  The file listRCU.txt has
> -	more information on where this name came from, search for
> -	"read-copy update" to find it.
> +  "RCU" stands for "read-copy update".  The file listRCU.txt has
> +  more information on where this name came from, search for
> +  "read-copy update" to find it.
>  
> -o	I hear that RCU is patented?  What is with that?
> +- I hear that RCU is patented?  What is with that?
>  
> -	Yes, it is.  There are several known patents related to RCU,
> -	search for the string "Patent" in RTFP.txt to find them.
> -	Of these, one was allowed to lapse by the assignee, and the
> -	others have been contributed to the Linux kernel under GPL.
> -	There are now also LGPL implementations of user-level RCU
> -	available (http://liburcu.org/).
> +  Yes, it is.  There are several known patents related to RCU,
> +  search for the string "Patent" in RTFP.txt to find them.
> +  Of these, one was allowed to lapse by the assignee, and the
> +  others have been contributed to the Linux kernel under GPL.
> +  There are now also LGPL implementations of user-level RCU
> +  available (http://liburcu.org/).
>  
> -o	I hear that RCU needs work in order to support realtime kernels?
> +- I hear that RCU needs work in order to support realtime kernels?
>  
> -	Realtime-friendly RCU can be enabled via the CONFIG_PREEMPT_RCU
> -	kernel configuration parameter.
> +  Realtime-friendly RCU can be enabled via the CONFIG_PREEMPT_RCU
> +  kernel configuration parameter.
>  
> -o	Where can I find more information on RCU?
> +- Where can I find more information on RCU?
>  
> -	See the RTFP.txt file in this directory.
> -	Or point your browser at http://www.rdrop.com/users/paulmck/RCU/.
> +  See the RTFP.txt file in this directory.
> +  Or point your browser at (http://www.rdrop.com/users/paulmck/RCU/).
> -- 
> 2.22.0
> 
