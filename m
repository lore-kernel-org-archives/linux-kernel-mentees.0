Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F232C5DF62
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 18:51:38 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7842F21928
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 18:51:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2j3Iqt4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7842F21928
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 332F0E2E;
	Tue,  5 Nov 2019 18:51:38 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EAD3AC97
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 18:51:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 812A389E
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 18:51:36 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q26so16272678pfn.11
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 10:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lcBaUECIV9z6RejdYiQ5mOojMFMvm3rPEw7OA6L0b/0=;
	b=n2j3Iqt40E/JIYbIDE2YTTfCVK0fNvKdOzk/8SN1XThHY0rtuUi+Qjk8n4reLJ9p2h
	9XQHeKAHCMAb7Fn28mfwp6/JzhzHlohoASYtxrVjpylvNCvTYe2cUAiOcAa2+hZTqKau
	mzoiKvtAOmtmQOsfbiVV1lJ/dh64qQ0WhnvoSmZOFgsT1Bbg/DXRV0+MOR41OsvajyqA
	yJLaI/QtaaW2is2zFzQE1N7umX72zI3jp4MC0tWRDeoCjXg2WQQpYvAzLva1aYB8X0Sq
	sDMq9+c8bk7C/9mVbwxDl8SaiWK/v7E52drJhL5E7kBVl0QwbrKseze7VPYmofW5qW62
	+L5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lcBaUECIV9z6RejdYiQ5mOojMFMvm3rPEw7OA6L0b/0=;
	b=OVBmtW2S1iMnjZHUypBL8vGiLC9sEvBD8+jUCo0czkEyKvKw4KqoaYjccXeIT5HP1w
	wV1wlrKv9mrG1HaYPxZ+Ohfr977wFHzHtdRqBePhKTQd9a/KpToGGzfMIiBrRu89rR6I
	gjMmZSQMPsBfscFEaQY3+RC4JIjUSAjDubS8znetudo/m6bYc1+JZCgJvhI9erqmdQZl
	CjNehOFG6WIAZnoIFL4oww8UT+SrHEnyZg9U0woA4E+vnhyEX2Mp2RNAMLrTvRTdli8A
	sl2EnJ911Maxw/haxavTkGsfZzfTRowD5ef/Al8VelIjC9GdONt8kxSdCWMwTgNnuE5p
	BZRw==
X-Gm-Message-State: APjAAAVkhNHEuFjF4S1jt+g+ChObF46TipIDbrZ5XmIu75eZiD5TeIho
	07yp/AYhreuTHerZ/RxV7Cg=
X-Google-Smtp-Source: APXvYqzCh2dPz7Hs4WtoduoRjDjqQKuomFW5z0gvVduSb2rzqoTVYvHq0h7JcgOLBSVP7a4JHv6a+w==
X-Received: by 2002:aa7:9156:: with SMTP id 22mr39719992pfi.246.1572979896117; 
	Tue, 05 Nov 2019 10:51:36 -0800 (PST)
Received: from workstation ([2405:204:1388:f954:e471:b4bc:a8c7:e586])
	by smtp.gmail.com with ESMTPSA id
	w8sm12546619pfi.60.2019.11.05.10.51.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 10:51:35 -0800 (PST)
Date: Wed, 6 Nov 2019 00:21:25 +0530
From: Amol Grover <frextrite@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Joel Fernandes <joel@joelfernandes.org>, Jonathan Corbet <corbet@lwn.net>
Message-ID: <20191105185125.GA13672@workstation>
References: <20191105073340.GA3682@workstation-kernel-dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105073340.GA3682@workstation-kernel-dev>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>, rcu@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] Documentation: RCU:
 whatisRCU: Fix formatting for section 2
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

On Tue, Nov 05, 2019 at 01:03:40PM +0530, Amol Grover wrote:
> Convert RCU API methods text to sub-headings and
> add footnote linking to 2 literary notes
> under rcu_dereference() section for improved UX
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>
> ---
>  Documentation/RCU/whatisRCU.rst | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
> index ae40c8bcc56c..4c6f1f595757 100644
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
> @@ -280,7 +285,7 @@ rcu_dereference()
>  	unnecessary overhead on Alpha CPUs.
>  
>  	Note that the value returned by rcu_dereference() is valid
> -	only within the enclosing RCU read-side critical section [1].
> +	only within the enclosing RCU read-side critical section [1]_.
>  	For example, the following is -not- legal::
>  
>  		rcu_read_lock();
> @@ -304,9 +309,9 @@ rcu_dereference()
>  	at any time, including immediately after the rcu_dereference().
>  	And, again like rcu_assign_pointer(), rcu_dereference() is
>  	typically used indirectly, via the _rcu list-manipulation
> -	primitives, such as list_for_each_entry_rcu() [2].
> +	primitives, such as list_for_each_entry_rcu() [2]_.
>  
> -	[1] The variant rcu_dereference_protected() can be used outside
> +..	[1] The variant rcu_dereference_protected() can be used outside
>  	of an RCU read-side critical section as long as the usage is
>  	protected by locks acquired by the update-side code.  This variant
>  	avoids the lockdep warning that would happen when using (for
> @@ -319,7 +324,8 @@ rcu_dereference()
>  	a lockdep splat is emitted.  See Documentation/RCU/Design/Requirements/Requirements.rst
>  	and the API's code comments for more details and example usage.
>  
> -	[2] If the list_for_each_entry_rcu() instance might be used by
> +
> +..	[2] If the list_for_each_entry_rcu() instance might be used by
>  	update-side code as well as by RCU readers, then an additional
>  	lockdep expression can be added to its list of arguments.
>  	For example, given an additional "lock_is_held(&mylock)" argument,
> -- 
> 2.20.1
>

Please ignore this patch.

Thanks
Amol 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
