Return-Path: <SRS0=aStP=Y4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AED4CA9EB5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Nov 2019 15:11:10 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D315920663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Nov 2019 15:11:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9uMUOzi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D315920663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 05DB6DCE;
	Mon,  4 Nov 2019 15:11:06 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6B475DBE
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon,  4 Nov 2019 15:11:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ACD978A7
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon,  4 Nov 2019 15:11:04 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (unknown [109.144.216.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2C2F420869;
	Mon,  4 Nov 2019 15:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572880264;
	bh=p3A1CsQUx+W3GtZjQkQsHYH4jp+Q0+YDCaga7R+hiYU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=R9uMUOziwJiaoxNC1aYlUE9OGk+xZHCHbO88XZg8OKLIoSJ4Gcdn8F8I+q3t20oFX
	7e2cqAVHhgSQL71lgzSwN7TxzJcJKI3ggteaNdBWquy86TMXOGy0NtONDwew6rQMk9
	4199LXWSXINmHXe71hAUiEdPhT4Z6i71eYuMqCrk=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
	id 37B0D3520B56; Mon,  4 Nov 2019 07:11:02 -0800 (PST)
Date: Mon, 4 Nov 2019 07:11:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20191104151102.GA20975@paulmck-ThinkPad-P72>
References: <20191102115517.6378-1-tranmanphong@gmail.com>
	<20191102115517.6378-1-tranmanphong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191102115517.6378-1-tranmanphong@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, jiangshanlai@gmail.com,
	josh@joshtriplett.org, rostedt@goodmis.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	mathieu.desnoyers@efficios.com, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Doc: Improve format for
	whatisRCU.rst
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

On Sun, Nov 03, 2019 at 02:24:06AM +0530, madhuparnabhowmik04@gmail.com wrote:
> From: Phong Tran <tranmanphong@gmail.com>
> 
> Adding crossreference target for some headers, answer of quizzes
> 
> Tested-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

Applied, thank you both!

I am assuming that you tested the combination of Phong's original pair
of patches.  If not, please let me know.

And this was great, but in the future it is easier for everyone to simply
reply to the patch inserting the Tested-by.  ;-)

							Thanx, Paul

> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
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
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
