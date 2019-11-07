Return-Path: <SRS0=nM8m=Y7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E264AFC6194
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 00:19:35 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B216D21882
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 00:19:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lk+BnRBq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B216D21882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 82D94BE7;
	Thu,  7 Nov 2019 00:19:35 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4AD7C40B
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 00:19:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3054A710
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 00:19:33 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c184so652772pfb.0
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 06 Nov 2019 16:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=cc:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YghwMrvSFtW3tPnmkDG1lMQzsLizbEfLWWFN2/f0L40=;
	b=Lk+BnRBqLUG6DyNW0ioJ1wVqxScb6Hl7GDO9b0A1n28cG+XEuuT+BSj/HhjFL2ihhP
	LDB5CSTAg69oOUSVdqeQyLumvtcLkyEmW9P9WoxYjVhiZ2OVjQAWvUrlbe1Uq/PVmgFX
	RsZsQ7wrQrQKigTKfd23mmqTDbgrJ0kn1opX1RLlh9Sek0aKrIMG0CPn2cj6UmIw39/g
	tZptNtbmcS7tSzxJrdmoZVJz8miBjOWu6SsV3bxYw8fyb8rUcXkqPJM0WngAki8oNUzN
	UamI3wZ3PURURm0E3ZQkfHRKnIx+TiL8uTO/uLK+nZ+C5A2m6hCRsWQujZHRsX1jgXXa
	LLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:cc:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YghwMrvSFtW3tPnmkDG1lMQzsLizbEfLWWFN2/f0L40=;
	b=S1nkK5qqbduyj0P1i+RqVlcH0nJNLCnEmeZotkGK+e2SE1Op3hodmXFZZRl+G1/9p/
	6vLnB+dpQY5txeS7DHJKglG+566DEx1LrcRSt5iDSuRunkGoP7YYYKEVudn9VAbfRg2L
	TpuJ1NCy15Lou9JXYpaKfNVoopphj1QiG3rLS54gk/map2IRsdD19QqGHHUr3yhp93SN
	lqeYcbnud66kqPma26Xybn1iud9yKwFnqYA6fV9h+hk6hjfuQsptQsm/HYkbx+4qvabM
	tOmjI4Vu0/NDBGJBgiwOW2weCCb99atnv/xW0rBVaqOv5RE4kg923LIb3ylxBco664cO
	79Zg==
X-Gm-Message-State: APjAAAVmDReBl74bFQi9RW5O9TvJBRC4zWIMXr6foP7lQE3wssTZWIt4
	px5ywhzOGm9dUZSdC3Ct0RYizsxI6FZIDQ==
X-Google-Smtp-Source: APXvYqzK56tfWC7DBNih1acqbdS6sfLv0HKYni7nk8FVzB3+uxvrhPxP6oOCpkDND0FgtG8Io0OQOQ==
X-Received: by 2002:aa7:8e8d:: with SMTP id a13mr108506pfr.241.1573085971990; 
	Wed, 06 Nov 2019 16:19:31 -0800 (PST)
Received: from ?IPv6:2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb?
	([2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb])
	by smtp.gmail.com with ESMTPSA id j6sm136452pfa.124.2019.11.06.16.19.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 06 Nov 2019 16:19:31 -0800 (PST)
To: Amol Grover <frextrite@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
References: <20191106165617.GA12205@workstation-kernel-dev>
From: Phong Tran <tranmanphong@gmail.com>
Message-ID: <15512469-fc7e-24c8-d407-72ba7015a099@gmail.com>
Date: Thu, 7 Nov 2019 07:19:27 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191106165617.GA12205@workstation-kernel-dev>
Content-Language: en-US
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: RCU: rcubarrier:
 Convert to reST
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

On 11/6/19 11:56 PM, Amol Grover wrote:
> Convert rcubarrier.txt to rcubarrier.rst and
> add it to index.rst
> 
> Format file according to reST
> - Add headings and sub-headings
> - Add code segments
> - Add cross-references to quizes and answers
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>   Documentation/RCU/index.rst                   |   1 +
>   .../RCU/{rcubarrier.txt => rcubarrier.rst}    | 220 ++++++++++--------
>   2 files changed, 125 insertions(+), 96 deletions(-)
>   rename Documentation/RCU/{rcubarrier.txt => rcubarrier.rst} (73%)
> 
> diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
> index c81d0e4fd999..81a0a1e5f767 100644
> --- a/Documentation/RCU/index.rst
> +++ b/Documentation/RCU/index.rst
> @@ -8,6 +8,7 @@ RCU concepts
>      :maxdepth: 3
>   
>      arrayRCU
> +   rcubarrier
>      rcu_dereference
>      whatisRCU
>      rcu
> diff --git a/Documentation/RCU/rcubarrier.txt b/Documentation/RCU/rcubarrier.rst
> similarity index 73%
> rename from Documentation/RCU/rcubarrier.txt
> rename to Documentation/RCU/rcubarrier.rst
> index a2782df69732..1aa9ed1d1b5b 100644
> --- a/Documentation/RCU/rcubarrier.txt
> +++ b/Documentation/RCU/rcubarrier.rst
> @@ -1,4 +1,7 @@
> +.. _rcu_barrier:
> +
>   RCU and Unloadable Modules
> +==========================
>   
>   [Originally published in LWN Jan. 14, 2007: http://lwn.net/Articles/217484/]
>   
> @@ -21,7 +24,7 @@ given that readers might well leave absolutely no trace of their
>   presence? There is a synchronize_rcu() primitive that blocks until all
>   pre-existing readers have completed. An updater wishing to delete an
>   element p from a linked list might do the following, while holding an
> -appropriate lock, of course:
> +appropriate lock, of course::
>   
>   	list_del_rcu(p);
>   	synchronize_rcu();
> @@ -32,13 +35,13 @@ primitive must be used instead. This primitive takes a pointer to an
>   rcu_head struct placed within the RCU-protected data structure and
>   another pointer to a function that may be invoked later to free that
>   structure. Code to delete an element p from the linked list from IRQ
> -context might then be as follows:
> +context might then be as follows::
>   
>   	list_del_rcu(p);
>   	call_rcu(&p->rcu, p_callback);
>   
>   Since call_rcu() never blocks, this code can safely be used from within
> -IRQ context. The function p_callback() might be defined as follows:
> +IRQ context. The function p_callback() might be defined as follows::
>   
>   	static void p_callback(struct rcu_head *rp)
>   	{
> @@ -49,6 +52,7 @@ IRQ context. The function p_callback() might be defined as follows:
>   
>   
>   Unloading Modules That Use call_rcu()
> +-------------------------------------
>   
>   But what if p_callback is defined in an unloadable module?
>   
> @@ -69,10 +73,11 @@ in realtime kernels in order to avoid excessive scheduling latencies.
>   
>   
>   rcu_barrier()
> +-------------
>   
>   We instead need the rcu_barrier() primitive.  Rather than waiting for
>   a grace period to elapse, rcu_barrier() waits for all outstanding RCU
> -callbacks to complete.  Please note that rcu_barrier() does -not- imply
> +callbacks to complete.  Please note that rcu_barrier() does **not** imply
>   synchronize_rcu(), in particular, if there are no RCU callbacks queued
>   anywhere, rcu_barrier() is within its rights to return immediately,
>   without waiting for a grace period to elapse.
> @@ -89,78 +94,78 @@ module uses multiple flavors of call_rcu(), then it must also use multiple
>   flavors of rcu_barrier() when unloading that module.  For example, if
>   it uses call_rcu(), call_srcu() on srcu_struct_1, and call_srcu() on
>   srcu_struct_2(), then the following three lines of code will be required

Hello Amol,

srcu_struct_2() should be srcu_struct_2

> -when unloading:
> +when unloading::
>   
>    1 rcu_barrier();
>    2 srcu_barrier(&srcu_struct_1);
>    3 srcu_barrier(&srcu_struct_2);
>   
>   The rcutorture module makes use of rcu_barrier() in its exit function
> -as follows:
> +as follows::
>   
> - 1 static void
> - 2 rcu_torture_cleanup(void)
> - 3 {
> - 4   int i;
> + 1  static void
> + 2  rcu_torture_cleanup(void)
> + 3  {
> + 4    int i;
>    5
> - 6   fullstop = 1;
> - 7   if (shuffler_task != NULL) {
> + 6    fullstop = 1;
> + 7    if (shuffler_task != NULL) {
>    8     VERBOSE_PRINTK_STRING("Stopping rcu_torture_shuffle task");
>    9     kthread_stop(shuffler_task);
> -10   }
> -11   shuffler_task = NULL;
> -12
> -13   if (writer_task != NULL) {
> -14     VERBOSE_PRINTK_STRING("Stopping rcu_torture_writer task");
> -15     kthread_stop(writer_task);
> -16   }
> -17   writer_task = NULL;
> -18
> -19   if (reader_tasks != NULL) {
> -20     for (i = 0; i < nrealreaders; i++) {
> -21       if (reader_tasks[i] != NULL) {
> -22         VERBOSE_PRINTK_STRING(
> -23           "Stopping rcu_torture_reader task");
> -24         kthread_stop(reader_tasks[i]);
> -25       }
> -26       reader_tasks[i] = NULL;
> -27     }
> -28     kfree(reader_tasks);
> -29     reader_tasks = NULL;
> -30   }
> -31   rcu_torture_current = NULL;
> -32
> -33   if (fakewriter_tasks != NULL) {
> -34     for (i = 0; i < nfakewriters; i++) {
> -35       if (fakewriter_tasks[i] != NULL) {
> -36         VERBOSE_PRINTK_STRING(
> -37           "Stopping rcu_torture_fakewriter task");
> -38         kthread_stop(fakewriter_tasks[i]);
> -39       }
> -40       fakewriter_tasks[i] = NULL;
> -41     }
> -42     kfree(fakewriter_tasks);
> -43     fakewriter_tasks = NULL;
> -44   }
> -45
> -46   if (stats_task != NULL) {
> -47     VERBOSE_PRINTK_STRING("Stopping rcu_torture_stats task");
> -48     kthread_stop(stats_task);
> -49   }
> -50   stats_task = NULL;
> -51
> -52   /* Wait for all RCU callbacks to fire. */
> -53   rcu_barrier();
> -54
> -55   rcu_torture_stats_print(); /* -After- the stats thread is stopped! */
> -56
> -57   if (cur_ops->cleanup != NULL)
> -58     cur_ops->cleanup();
> -59   if (atomic_read(&n_rcu_torture_error))
> -60     rcu_torture_print_module_parms("End of test: FAILURE");
> -61   else
> -62     rcu_torture_print_module_parms("End of test: SUCCESS");
> -63 }
> + 10   }
> + 11   shuffler_task = NULL;
> + 12
> + 13   if (writer_task != NULL) {
> + 14     VERBOSE_PRINTK_STRING("Stopping rcu_torture_writer task");
> + 15     kthread_stop(writer_task);
> + 16   }
> + 17   writer_task = NULL;
> + 18
> + 19   if (reader_tasks != NULL) {
> + 20     for (i = 0; i < nrealreaders; i++) {
> + 21       if (reader_tasks[i] != NULL) {
> + 22         VERBOSE_PRINTK_STRING(
> + 23           "Stopping rcu_torture_reader task");
> + 24         kthread_stop(reader_tasks[i]);
> + 25       }
> + 26       reader_tasks[i] = NULL;
> + 27     }
> + 28     kfree(reader_tasks);
> + 29     reader_tasks = NULL;
> + 30   }
> + 31   rcu_torture_current = NULL;
> + 32
> + 33   if (fakewriter_tasks != NULL) {
> + 34     for (i = 0; i < nfakewriters; i++) {
> + 35       if (fakewriter_tasks[i] != NULL) {
> + 36         VERBOSE_PRINTK_STRING(
> + 37           "Stopping rcu_torture_fakewriter task");
> + 38         kthread_stop(fakewriter_tasks[i]);
> + 39       }
> + 40       fakewriter_tasks[i] = NULL;
> + 41     }
> + 42     kfree(fakewriter_tasks);
> + 43     fakewriter_tasks = NULL;
> + 44   }
> + 45
> + 46   if (stats_task != NULL) {
> + 47     VERBOSE_PRINTK_STRING("Stopping rcu_torture_stats task");
> + 48     kthread_stop(stats_task);
> + 49   }
> + 50   stats_task = NULL;
> + 51
> + 52   /* Wait for all RCU callbacks to fire. */
> + 53   rcu_barrier();
> + 54
> + 55   rcu_torture_stats_print(); /* -After- the stats thread is stopped! */
> + 56
> + 57   if (cur_ops->cleanup != NULL)
> + 58     cur_ops->cleanup();
> + 59   if (atomic_read(&n_rcu_torture_error))
> + 60     rcu_torture_print_module_parms("End of test: FAILURE");
> + 61   else
> + 62     rcu_torture_print_module_parms("End of test: SUCCESS");
> + 63 }
>   
>   Line 6 sets a global variable that prevents any RCU callbacks from
>   re-posting themselves. This will not be necessary in most cases, since
> @@ -176,9 +181,14 @@ for any pre-existing callbacks to complete.
>   Then lines 55-62 print status and do operation-specific cleanup, and
>   then return, permitting the module-unload operation to be completed.
>   
> -Quick Quiz #1: Is there any other situation where rcu_barrier() might
> +.. _rcubarrier_quiz_1:
> +
> +Quick Quiz #1:
> +	Is there any other situation where rcu_barrier() might
>   	be required?
>   
> +:ref:`Answer to Quick Quiz #1 <answer_rcubarrier_quiz_1>`
> +
>   Your module might have additional complications. For example, if your
>   module invokes call_rcu() from timers, you will need to first cancel all
>   the timers, and only then invoke rcu_barrier() to wait for any remaining
> @@ -188,11 +198,12 @@ Of course, if you module uses call_rcu(), you will need to invoke
>   rcu_barrier() before unloading.  Similarly, if your module uses
>   call_srcu(), you will need to invoke srcu_barrier() before unloading,
>   and on the same srcu_struct structure.  If your module uses call_rcu()
> --and- call_srcu(), then you will need to invoke rcu_barrier() -and-
> +-and- call_srcu(), then you will need to invoke rcu_barrier() **and**

-and- here should be bold.

The rest looks good.

Regards,
Phong.

>   srcu_barrier().
>   
>   
>   Implementing rcu_barrier()
> +--------------------------
>   
>   Dipankar Sarma's implementation of rcu_barrier() makes use of the fact
>   that RCU callbacks are never reordered once queued on one of the per-CPU
> @@ -200,19 +211,19 @@ queues. His implementation queues an RCU callback on each of the per-CPU
>   callback queues, and then waits until they have all started executing, at
>   which point, all earlier RCU callbacks are guaranteed to have completed.
>   
> -The original code for rcu_barrier() was as follows:
> +The original code for rcu_barrier() was as follows::
>   
> - 1 void rcu_barrier(void)
> - 2 {
> - 3   BUG_ON(in_interrupt());
> - 4   /* Take cpucontrol mutex to protect against CPU hotplug */
> - 5   mutex_lock(&rcu_barrier_mutex);
> - 6   init_completion(&rcu_barrier_completion);
> - 7   atomic_set(&rcu_barrier_cpu_count, 0);
> - 8   on_each_cpu(rcu_barrier_func, NULL, 0, 1);
> - 9   wait_for_completion(&rcu_barrier_completion);
> -10   mutex_unlock(&rcu_barrier_mutex);
> -11 }
> + 1  void rcu_barrier(void)
> + 2  {
> + 3    BUG_ON(in_interrupt());
> + 4    /* Take cpucontrol mutex to protect against CPU hotplug */
> + 5    mutex_lock(&rcu_barrier_mutex);
> + 6    init_completion(&rcu_barrier_completion);
> + 7    atomic_set(&rcu_barrier_cpu_count, 0);
> + 8    on_each_cpu(rcu_barrier_func, NULL, 0, 1);
> + 9    wait_for_completion(&rcu_barrier_completion);
> + 10   mutex_unlock(&rcu_barrier_mutex);
> + 11 }
>   
>   Line 3 verifies that the caller is in process context, and lines 5 and 10
>   use rcu_barrier_mutex to ensure that only one rcu_barrier() is using the
> @@ -226,18 +237,18 @@ This code was rewritten in 2008 and several times thereafter, but this
>   still gives the general idea.
>   
>   The rcu_barrier_func() runs on each CPU, where it invokes call_rcu()
> -to post an RCU callback, as follows:
> +to post an RCU callback, as follows::
>   
> - 1 static void rcu_barrier_func(void *notused)
> - 2 {
> - 3 int cpu = smp_processor_id();
> - 4 struct rcu_data *rdp = &per_cpu(rcu_data, cpu);
> - 5 struct rcu_head *head;
> + 1  static void rcu_barrier_func(void *notused)
> + 2  {
> + 3    int cpu = smp_processor_id();
> + 4    struct rcu_data *rdp = &per_cpu(rcu_data, cpu);
> + 5    struct rcu_head *head;
>    6
> - 7 head = &rdp->barrier;
> - 8 atomic_inc(&rcu_barrier_cpu_count);
> - 9 call_rcu(head, rcu_barrier_callback);
> -10 }
> + 7    head = &rdp->barrier;
> + 8    atomic_inc(&rcu_barrier_cpu_count);
> + 9    call_rcu(head, rcu_barrier_callback);
> + 10 }
>   
>   Lines 3 and 4 locate RCU's internal per-CPU rcu_data structure,
>   which contains the struct rcu_head that needed for the later call to
> @@ -248,20 +259,25 @@ the current CPU's queue.
>   
>   The rcu_barrier_callback() function simply atomically decrements the
>   rcu_barrier_cpu_count variable and finalizes the completion when it
> -reaches zero, as follows:
> +reaches zero, as follows::
>   
>    1 static void rcu_barrier_callback(struct rcu_head *notused)
>    2 {
> - 3 if (atomic_dec_and_test(&rcu_barrier_cpu_count))
> - 4 complete(&rcu_barrier_completion);
> + 3   if (atomic_dec_and_test(&rcu_barrier_cpu_count))
> + 4     complete(&rcu_barrier_completion);
>    5 }
>   
> -Quick Quiz #2: What happens if CPU 0's rcu_barrier_func() executes
> +.. _rcubarrier_quiz_2:
> +
> +Quick Quiz #2:
> +	What happens if CPU 0's rcu_barrier_func() executes
>   	immediately (thus incrementing rcu_barrier_cpu_count to the
>   	value one), but the other CPU's rcu_barrier_func() invocations
>   	are delayed for a full grace period? Couldn't this result in
>   	rcu_barrier() returning prematurely?
>   
> +:ref:`Answer to Quick Quiz #2 <answer_rcubarrier_quiz_2>`
> +
>   The current rcu_barrier() implementation is more complex, due to the need
>   to avoid disturbing idle CPUs (especially on battery-powered systems)
>   and the need to minimally disturb non-idle CPUs in real-time systems.
> @@ -269,6 +285,7 @@ However, the code above illustrates the concepts.
>   
>   
>   rcu_barrier() Summary
> +---------------------
>   
>   The rcu_barrier() primitive has seen relatively little use, since most
>   code using RCU is in the core kernel rather than in modules. However, if
> @@ -277,8 +294,12 @@ so that your module may be safely unloaded.
>   
>   
>   Answers to Quick Quizzes
> +------------------------
> +
> +.. _answer_rcubarrier_quiz_1:
>   
> -Quick Quiz #1: Is there any other situation where rcu_barrier() might
> +Quick Quiz #1:
> +	Is there any other situation where rcu_barrier() might
>   	be required?
>   
>   Answer: Interestingly enough, rcu_barrier() was not originally
> @@ -292,7 +313,12 @@ Answer: Interestingly enough, rcu_barrier() was not originally
>   	implementing rcutorture, and found that rcu_barrier() solves
>   	this problem as well.
>   
> -Quick Quiz #2: What happens if CPU 0's rcu_barrier_func() executes
> +:ref:`Back to Quick Quiz #1 <rcubarrier_quiz_1>`
> +
> +.. _answer_rcubarrier_quiz_2:
> +
> +Quick Quiz #2:
> +	What happens if CPU 0's rcu_barrier_func() executes
>   	immediately (thus incrementing rcu_barrier_cpu_count to the
>   	value one), but the other CPU's rcu_barrier_func() invocations
>   	are delayed for a full grace period? Couldn't this result in
> @@ -323,3 +349,5 @@ Answer: This cannot happen. The reason is that on_each_cpu() has its last
>   	is to add an rcu_read_lock() before line 8 of rcu_barrier()
>   	and an rcu_read_unlock() after line 8 of this same function. If
>   	you can think of a better change, please let me know!
> +
> +:ref:`Back to Quick Quiz #2 <rcubarrier_quiz_2>`
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
