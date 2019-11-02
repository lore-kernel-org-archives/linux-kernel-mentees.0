From: paulmck@kernel.org (Paul E. McKenney)
Date: Sat, 2 Nov 2019 09:18:25 -0700
Subject: [Linux-kernel-mentees] [PATCH] Doc: Improve format for
	whatisRCU.rst
In-Reply-To: <20191102115517.6378-1-tranmanphong@gmail.com>
References: <20191102115517.6378-1-tranmanphong@gmail.com>
Message-ID: <20191102161825.GR20975@paulmck-ThinkPad-P72>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191102161825.2W5PRF5aGpZkTK2L-0RopIuilOzqUJskRGet9uIfRTs@z>

On Sat, Nov 02, 2019 at 06:55:17PM +0700, Phong Tran wrote:
> Adding crossreference target for some headers, answer of quizzes
> 
> Signed-off-by: Phong Tran <tranmanphong at gmail.com>

I have queued this, thank you!

Once Madhuparna reviews/tests, I will merge it into your earlier version.

							Thanx, Paul

> ---
>  Documentation/RCU/whatisRCU.rst | 73 +++++++++++++++++++++++----------
>  1 file changed, 52 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
> index 70d0e4c21917..ae40c8bcc56c 100644
> --- a/Documentation/RCU/whatisRCU.rst
> +++ b/Documentation/RCU/whatisRCU.rst
> @@ -1,4 +1,4 @@
> -.. _rcu_doc:
> +.. _whatisrcu_doc:
>  
>  What is RCU?  --  "Read, Copy, Update"
>  ======================================
> @@ -27,14 +27,21 @@ the experience has been that different people must take different paths
>  to arrive at an understanding of RCU.  This document provides several
>  different paths, as follows:
>  
> -1.	RCU OVERVIEW
> -2.	WHAT IS RCU'S CORE API?
> -3.	WHAT ARE SOME EXAMPLE USES OF CORE RCU API?
> -4.	WHAT IF MY UPDATING THREAD CANNOT BLOCK?
> -5.	WHAT ARE SOME SIMPLE IMPLEMENTATIONS OF RCU?
> -6.	ANALOGY WITH READER-WRITER LOCKING
> -7.	FULL LIST OF RCU APIs
> -8.	ANSWERS TO QUICK QUIZZES
> +:ref:`1.	RCU OVERVIEW <1_whatisRCU>`
> +
> +:ref:`2.	WHAT IS RCU'S CORE API? <2_whatisRCU>`
> +
> +:ref:`3.	WHAT ARE SOME EXAMPLE USES OF CORE RCU API? <3_whatisRCU>`
> +
> +:ref:`4.	WHAT IF MY UPDATING THREAD CANNOT BLOCK? <4_whatisRCU>`
> +
> +:ref:`5.	WHAT ARE SOME SIMPLE IMPLEMENTATIONS OF RCU? <5_whatisRCU>`
> +
> +:ref:`6.	ANALOGY WITH READER-WRITER LOCKING <6_whatisRCU>`
> +
> +:ref:`7.	FULL LIST OF RCU APIs <7_whatisRCU>`
> +
> +:ref:`8.	ANSWERS TO QUICK QUIZZES <8_whatisRCU>`
>  
>  People who prefer starting with a conceptual overview should focus on
>  Section 1, though most readers will profit by reading this section at
> @@ -52,6 +59,7 @@ everything, feel free to read the whole thing -- but if you are really
>  that type of person, you have perused the source code and will therefore
>  never need this document anyway.  ;-)
>  
> +.. _1_whatisRCU:
>  
>  1.  RCU OVERVIEW
>  ----------------
> @@ -120,6 +128,7 @@ So how the heck can a reclaimer tell when a reader is done, given
>  that readers are not doing any sort of synchronization operations???
>  Read on to learn about how RCU's API makes this easy.
>  
> +.. _2_whatisRCU:
>  
>  2.  WHAT IS RCU'S CORE API?
>  ---------------------------
> @@ -381,13 +390,15 @@ c.	RCU applied to scheduler and interrupt/NMI-handler tasks.
>  Again, most uses will be of (a).  The (b) and (c) cases are important
>  for specialized uses, but are relatively uncommon.
>  
> +.. _3_whatisRCU:
>  
>  3.  WHAT ARE SOME EXAMPLE USES OF CORE RCU API?
>  -----------------------------------------------
>  
>  This section shows a simple use of the core RCU API to protect a
>  global pointer to a dynamically allocated structure.  More-typical
> -uses of RCU may be found in listRCU.txt, arrayRCU.txt, and NMI-RCU.txt.
> +uses of RCU may be found in :ref:`listRCU.rst <list_rcu_doc>`,
> +:ref:`arrayRCU.rst <array_rcu_doc>`, and :ref:`NMI-RCU.rst <NMI_rcu_doc>`.
>  ::
>  
>  	struct foo {
> @@ -470,9 +481,11 @@ o	Use synchronize_rcu() -after- removing a data element from an
>  	data item.
>  
>  See checklist.txt for additional rules to follow when using RCU.
> -And again, more-typical uses of RCU may be found in listRCU.txt,
> -arrayRCU.txt, and NMI-RCU.txt.
> +And again, more-typical uses of RCU may be found in :ref:`listRCU.rst
> +<list_rcu_doc>`, :ref:`arrayRCU.rst <array_rcu_doc>`, and :ref:`NMI-RCU.rst
> +<NMI_rcu_doc>`.
>  
> +.. _4_whatisRCU:
>  
>  4.  WHAT IF MY UPDATING THREAD CANNOT BLOCK?
>  --------------------------------------------
> @@ -567,6 +580,7 @@ to avoid having to write your own callback::
>  
>  Again, see checklist.txt for additional rules governing the use of RCU.
>  
> +.. _5_whatisRCU:
>  
>  5.  WHAT ARE SOME SIMPLE IMPLEMENTATIONS OF RCU?
>  ------------------------------------------------
> @@ -657,10 +671,12 @@ that the only thing that can block rcu_read_lock() is a synchronize_rcu().
>  But synchronize_rcu() does not acquire any locks while holding rcu_gp_mutex,
>  so there can be no deadlock cycle.
>  
> -Quick Quiz #1:	Why is this argument naive?  How could a deadlock
> +Quick Quiz #1:
> +		Why is this argument naive?  How could a deadlock
>  		occur when using this algorithm in a real-world Linux
>  		kernel?  How could this deadlock be avoided?
>  
> +:ref:`Answers to Quick Quiz <8_whatisRCU>`
>  
>  5B.  "TOY" EXAMPLE #2: CLASSIC RCU
>  
> @@ -709,13 +725,20 @@ synchronize_rcu().  Once synchronize_rcu() returns, we are guaranteed
>  that there are no RCU read-side critical sections holding a reference
>  to that data item, so we can safely reclaim it.
>  
> -Quick Quiz #2:	Give an example where Classic RCU's read-side
> +Quick Quiz #2:
> +		Give an example where Classic RCU's read-side
>  		overhead is -negative-.
>  
> -Quick Quiz #3:  If it is illegal to block in an RCU read-side
> +:ref:`Answers to Quick Quiz <8_whatisRCU>`
> +
> +Quick Quiz #3:
> +		If it is illegal to block in an RCU read-side
>  		critical section, what the heck do you do in
>  		PREEMPT_RT, where normal spinlocks can block???
>  
> +:ref:`Answers to Quick Quiz <8_whatisRCU>`
> +
> +.. _6_whatisRCU:
>  
>  6.  ANALOGY WITH READER-WRITER LOCKING
>  --------------------------------------
> @@ -842,6 +865,7 @@ delete() can now block.  If this is a problem, there is a callback-based
>  mechanism that never blocks, namely call_rcu() or kfree_rcu(), that can
>  be used in place of synchronize_rcu().
>  
> +.. _7_whatisRCU:
>  
>  7.  FULL LIST OF RCU APIs
>  -------------------------
> @@ -1001,16 +1025,19 @@ g.	Otherwise, use RCU.
>  Of course, this all assumes that you have determined that RCU is in fact
>  the right tool for your job.
>  
> +.. _8_whatisRCU:
>  
>  8.  ANSWERS TO QUICK QUIZZES
>  ----------------------------
>  
> -Quick Quiz #1:	Why is this argument naive?  How could a deadlock
> +Quick Quiz #1:
> +		Why is this argument naive?  How could a deadlock
>  		occur when using this algorithm in a real-world Linux
>  		kernel?  [Referring to the lock-based "toy" RCU
>  		algorithm.]
>  
> -Answer:		Consider the following sequence of events:
> +Answer:
> +		Consider the following sequence of events:
>  
>  		1.	CPU 0 acquires some unrelated lock, call it
>  			"problematic_lock", disabling irq via
> @@ -1049,10 +1076,12 @@ Answer:		Consider the following sequence of events:
>  		approach where tasks in RCU read-side critical sections
>  		cannot be blocked by tasks executing synchronize_rcu().
>  
> -Quick Quiz #2:	Give an example where Classic RCU's read-side
> +Quick Quiz #2:
> +		Give an example where Classic RCU's read-side
>  		overhead is -negative-.
>  
> -Answer:		Imagine a single-CPU system with a non-CONFIG_PREEMPT
> +Answer:
> +		Imagine a single-CPU system with a non-CONFIG_PREEMPT
>  		kernel where a routing table is used by process-context
>  		code, but can be updated by irq-context code (for example,
>  		by an "ICMP REDIRECT" packet).	The usual way of handling
> @@ -1074,11 +1103,13 @@ Answer:		Imagine a single-CPU system with a non-CONFIG_PREEMPT
>  		even the theoretical possibility of negative overhead for
>  		a synchronization primitive is a bit unexpected.  ;-)
>  
> -Quick Quiz #3:  If it is illegal to block in an RCU read-side
> +Quick Quiz #3:
> +		If it is illegal to block in an RCU read-side
>  		critical section, what the heck do you do in
>  		PREEMPT_RT, where normal spinlocks can block???
>  
> -Answer:		Just as PREEMPT_RT permits preemption of spinlock
> +Answer:
> +		Just as PREEMPT_RT permits preemption of spinlock
>  		critical sections, it permits preemption of RCU
>  		read-side critical sections.  It also permits
>  		spinlocks blocking while in RCU read-side critical
> -- 
> 2.20.1
> 
