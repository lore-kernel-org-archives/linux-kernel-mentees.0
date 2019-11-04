Return-Path: <SRS0=aStP=Y4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE44BCA9ED3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Nov 2019 15:15:44 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCE3220663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Nov 2019 15:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCE3220663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A7D98DCE;
	Mon,  4 Nov 2019 15:15:44 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 83CB1DC1
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon,  4 Nov 2019 15:15:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EC31387D
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon,  4 Nov 2019 15:15:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2019 07:15:42 -0800
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; d="scan'208";a="195481925"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2019 07:15:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Amol Grover <frextrite@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Joel Fernandes <joel@joelfernandes.org>, Jonathan Corbet <corbet@lwn.net>
In-Reply-To: <20191104133315.GA14499@workstation-kernel-dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191104133315.GA14499@workstation-kernel-dev>
Date: Mon, 04 Nov 2019 17:15:34 +0200
Message-ID: <87pni77jvt.fsf@intel.com>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: RCU: whatisRCU:
	Fix formatting for section 2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

On Mon, 04 Nov 2019, Amol Grover <frextrite@gmail.com> wrote:
> Convert RCU API method text to sub-headings and
> add hyperlink and superscript to 2 literary notes
> under rcu_dereference() section
>
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  Documentation/RCU/whatisRCU.rst | 34 +++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
> index ae40c8bcc56c..3cf6e17d0065 100644
> --- a/Documentation/RCU/whatisRCU.rst
> +++ b/Documentation/RCU/whatisRCU.rst
> @@ -150,6 +150,7 @@ later.  See the kernel docbook documentation for more info, or look directly
>  at the function header comments.
>  
>  rcu_read_lock()
> +^^^^^^^^^^^^^^^
>  
>  	void rcu_read_lock(void);
>  
> @@ -164,6 +165,7 @@ rcu_read_lock()
>  	longer-term references to data structures.
>  
>  rcu_read_unlock()
> +^^^^^^^^^^^^^^^^^
>  
>  	void rcu_read_unlock(void);
>  
> @@ -172,6 +174,7 @@ rcu_read_unlock()
>  	read-side critical sections may be nested and/or overlapping.
>  
>  synchronize_rcu()
> +^^^^^^^^^^^^^^^^^
>  
>  	void synchronize_rcu(void);
>  
> @@ -225,6 +228,7 @@ synchronize_rcu()
>  	checklist.txt for some approaches to limiting the update rate.
>  
>  rcu_assign_pointer()
> +^^^^^^^^^^^^^^^^^^^^
>  
>  	void rcu_assign_pointer(p, typeof(p) v);
>  
> @@ -245,6 +249,7 @@ rcu_assign_pointer()
>  	the _rcu list-manipulation primitives such as list_add_rcu().
>  
>  rcu_dereference()
> +^^^^^^^^^^^^^^^^^
>  
>  	typeof(p) rcu_dereference(p);
>  
> @@ -279,8 +284,10 @@ rcu_dereference()
>  	if an update happened while in the critical section, and incur
>  	unnecessary overhead on Alpha CPUs.
>  
> +.. _back_to_1:
> +
>  	Note that the value returned by rcu_dereference() is valid
> -	only within the enclosing RCU read-side critical section [1].
> +	only within the enclosing RCU read-side critical section |cs_1|.
>  	For example, the following is -not- legal::
>  
>  		rcu_read_lock();
> @@ -298,15 +305,27 @@ rcu_dereference()
>  	it was acquired is just as illegal as doing so with normal
>  	locking.
>  
> +.. _back_to_2:
> +
>  	As with rcu_assign_pointer(), an important function of
>  	rcu_dereference() is to document which pointers are protected by
>  	RCU, in particular, flagging a pointer that is subject to changing
>  	at any time, including immediately after the rcu_dereference().
>  	And, again like rcu_assign_pointer(), rcu_dereference() is
>  	typically used indirectly, via the _rcu list-manipulation
> -	primitives, such as list_for_each_entry_rcu() [2].
> +	primitives, such as list_for_each_entry_rcu() |entry_2|.
> +
> +.. |cs_1| raw:: html

Please don't use raw. It's ugly and error prone. We have some raw output
for latex, but this would be the first for html.

What are you trying to achieve?

BR,
Jani.

> +
> +	<a href="#cs"><sup>[1]</sup></a>
> +
> +.. |entry_2| raw:: html
>  
> -	[1] The variant rcu_dereference_protected() can be used outside
> +	<a href="#entry"><sup>[2]</sup></a>
> +
> +.. _cs:
> +
> +	\ :sup:`[1]`\  The variant rcu_dereference_protected() can be used outside
>  	of an RCU read-side critical section as long as the usage is
>  	protected by locks acquired by the update-side code.  This variant
>  	avoids the lockdep warning that would happen when using (for
> @@ -317,15 +336,18 @@ rcu_dereference()
>  	a lockdep expression to indicate which locks must be acquired
>  	by the caller. If the indicated protection is not provided,
>  	a lockdep splat is emitted.  See Documentation/RCU/Design/Requirements/Requirements.rst
> -	and the API's code comments for more details and example usage.
> +	and the API's code comments for more details and example usage. :ref:`back <back_to_1>`
> +
> +
> +.. _entry:
>  
> -	[2] If the list_for_each_entry_rcu() instance might be used by
> +	\ :sup:`[2]`\  If the list_for_each_entry_rcu() instance might be used by
>  	update-side code as well as by RCU readers, then an additional
>  	lockdep expression can be added to its list of arguments.
>  	For example, given an additional "lock_is_held(&mylock)" argument,
>  	the RCU lockdep code would complain only if this instance was
>  	invoked outside of an RCU read-side critical section and without
> -	the protection of mylock.
> +	the protection of mylock. :ref:`back <back_to_2>`
>  
>  The following diagram shows how each API communicates among the
>  reader, updater, and reclaimer.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
