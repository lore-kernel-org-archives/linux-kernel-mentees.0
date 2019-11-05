Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA0DFA3739
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 07:41:32 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A09217F4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 07:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZzkZyE1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61A09217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3BCECE25;
	Tue,  5 Nov 2019 07:41:32 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B319AC75
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 07:41:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 179AF189
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 07:41:30 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l24so13425260pgh.10
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 04 Nov 2019 23:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=W2zddU/B1a5MKj7SSLvG7RFNvyGYHZRuMDoUQXdbRqQ=;
	b=qZzkZyE1HiXlbCSt0PiO9hGsmkhfs5unRma3wteShKeM26WuW6cbrRGmvuaZeCXgDg
	18PfVkT9AgJw7JlGaX9H6kNPSYHnBEThaoizoRR9Bh6VT44EMU98147x8tLvNSamupRE
	HsXzr2ByfYc2mT8MwW/jyAkjKwoWx5GuKLc4keMQrsIasXxu2t7LWtz4hdGaBJnLU1dT
	kfoDFfVe/N6tivPBLvFko3mIzV9LnS/HUDaWW+eIuKIQ/bQ5Q1OOu2O1HoVqLJD2+eSl
	fqkVp0UQs6nhQc2BTpqHXz1HK+Ju+une5HX5FOQgEZJDvsyohGGmfyAtJ4odvWLFBbV5
	6pGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=W2zddU/B1a5MKj7SSLvG7RFNvyGYHZRuMDoUQXdbRqQ=;
	b=CzYhQHaqHi1PLWXLZlTG5w+eusa1l/atNU8i5fKebcKoflF73zdwAr4Mw//a0MYFMt
	s9x6Uzx/LcAxcCnx/11cNstZhEP+2LETNAt1QCSojKGF0vfMGho+DnrV+teHCdYCDf0G
	RRk3iW77p91S+dTilPzyilDIsKmZVSk0k2W1BTHRcIZSKqU8dSTIYMB7VgIR7+xNtFeQ
	zuELcl13nlnMfj7lxaxxjg5/MYgbm5DHUKYtbUpJTruxsoJiBPZcYwTK1bntVuOZ6lvo
	5ve2TeuuJ3uEsfBFfFidTLuMB6gTACWOu3cSY9KMuHcg9ofQ/p5OKn+jCR1Q9IbreCmZ
	tEkw==
X-Gm-Message-State: APjAAAVBZEIkFIvAb/o7a3xrabbFrK94ANFUw6594T42TqaIP+YLLzBU
	RMFh4bDIEx6OzRZteARge6I=
X-Google-Smtp-Source: APXvYqwG4YhxvYggrOVRxWspyP7ZCmf6Y80j1PQDitKOjLmeMMYthSpBmDn/wEdHyO/4X8IdUVerzA==
X-Received: by 2002:a17:90a:5898:: with SMTP id
	j24mr4622473pji.7.1572939689571; 
	Mon, 04 Nov 2019 23:41:29 -0800 (PST)
Received: from workstation ([139.5.253.184])
	by smtp.gmail.com with ESMTPSA id j7sm6496104pjz.12.2019.11.04.23.41.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 23:41:29 -0800 (PST)
Date: Tue, 5 Nov 2019 13:11:22 +0530
From: Amol Grover <frextrite@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20191105074122.GA5136@workstation>
References: <20191104133315.GA14499@workstation-kernel-dev>
	<87pni77jvt.fsf@intel.com>
	<20191104173156.GA15267@workstation-kernel-dev>
	<87a79ayhvx.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a79ayhvx.fsf@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Joel Fernandes <joel@joelfernandes.org>,
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

On Tue, Nov 05, 2019 at 08:08:50AM +0200, Jani Nikula wrote:
> On Mon, 04 Nov 2019, Amol Grover <frextrite@gmail.com> wrote:
> > On Mon, Nov 04, 2019 at 05:15:34PM +0200, Jani Nikula wrote:
> >> On Mon, 04 Nov 2019, Amol Grover <frextrite@gmail.com> wrote:
> >> > Convert RCU API method text to sub-headings and
> >> > add hyperlink and superscript to 2 literary notes
> >> > under rcu_dereference() section
> >> >
> >> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> >> > ---
> >> >  Documentation/RCU/whatisRCU.rst | 34 +++++++++++++++++++++++++++------
> >> >  1 file changed, 28 insertions(+), 6 deletions(-)
> >> >
> >> > diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
> >> > index ae40c8bcc56c..3cf6e17d0065 100644
> >> > --- a/Documentation/RCU/whatisRCU.rst
> >> > +++ b/Documentation/RCU/whatisRCU.rst
> >> > @@ -150,6 +150,7 @@ later.  See the kernel docbook documentation for more info, or look directly
> >> >  at the function header comments.
> >> >  
> >> >  rcu_read_lock()
> >> > +^^^^^^^^^^^^^^^
> >> >  
> >> >  	void rcu_read_lock(void);
> >> >  
> >> > @@ -164,6 +165,7 @@ rcu_read_lock()
> >> >  	longer-term references to data structures.
> >> >  
> >> >  rcu_read_unlock()
> >> > +^^^^^^^^^^^^^^^^^
> >> >  
> >> >  	void rcu_read_unlock(void);
> >> >  
> >> > @@ -172,6 +174,7 @@ rcu_read_unlock()
> >> >  	read-side critical sections may be nested and/or overlapping.
> >> >  
> >> >  synchronize_rcu()
> >> > +^^^^^^^^^^^^^^^^^
> >> >  
> >> >  	void synchronize_rcu(void);
> >> >  
> >> > @@ -225,6 +228,7 @@ synchronize_rcu()
> >> >  	checklist.txt for some approaches to limiting the update rate.
> >> >  
> >> >  rcu_assign_pointer()
> >> > +^^^^^^^^^^^^^^^^^^^^
> >> >  
> >> >  	void rcu_assign_pointer(p, typeof(p) v);
> >> >  
> >> > @@ -245,6 +249,7 @@ rcu_assign_pointer()
> >> >  	the _rcu list-manipulation primitives such as list_add_rcu().
> >> >  
> >> >  rcu_dereference()
> >> > +^^^^^^^^^^^^^^^^^
> >> >  
> >> >  	typeof(p) rcu_dereference(p);
> >> >  
> >> > @@ -279,8 +284,10 @@ rcu_dereference()
> >> >  	if an update happened while in the critical section, and incur
> >> >  	unnecessary overhead on Alpha CPUs.
> >> >  
> >> > +.. _back_to_1:
> >> > +
> >> >  	Note that the value returned by rcu_dereference() is valid
> >> > -	only within the enclosing RCU read-side critical section [1].
> >> > +	only within the enclosing RCU read-side critical section |cs_1|.
> >> >  	For example, the following is -not- legal::
> >> >  
> >> >  		rcu_read_lock();
> >> > @@ -298,15 +305,27 @@ rcu_dereference()
> >> >  	it was acquired is just as illegal as doing so with normal
> >> >  	locking.
> >> >  
> >> > +.. _back_to_2:
> >> > +
> >> >  	As with rcu_assign_pointer(), an important function of
> >> >  	rcu_dereference() is to document which pointers are protected by
> >> >  	RCU, in particular, flagging a pointer that is subject to changing
> >> >  	at any time, including immediately after the rcu_dereference().
> >> >  	And, again like rcu_assign_pointer(), rcu_dereference() is
> >> >  	typically used indirectly, via the _rcu list-manipulation
> >> > -	primitives, such as list_for_each_entry_rcu() [2].
> >> > +	primitives, such as list_for_each_entry_rcu() |entry_2|.
> >> > +
> >> > +.. |cs_1| raw:: html
> >> 
> >> Please don't use raw. It's ugly and error prone. We have some raw output
> >> for latex, but this would be the first for html.
> >> 
> >> What are you trying to achieve?
> >
> > Hi Jani,
> > While going through the documentation I encountered a few footnotes (numbers
> > [1] and [2]) which referenced the actual footnote somewhere below the text.
> > They were particularly not straight-forward to find hence I decided to
> > link them to the footnote text which could be done using inline markup.
> > Then I tried to make them more appealing by converting to super-scripts
> > (the way they look like in books and websites). However, nested inline 
> > markup is not yet possible in reST hence I went with the html way to 
> > achieve the same. Too much?
> 
> I suggest you use rst footnote markup. It's less of an eye sore in the
> rst source, but provides you with the links in the generated output. And
> typically would be superscript. In particular "autonumber labels" might
> fit the bill. [1][2]
> 
> BR,
> Jani.
> 
> 
> [1] http://docutils.sourceforge.net/docs/user/rst/quickref.html#footnotes
> [2] http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html#footnotes
> 
> 
> >
> > Thank you
> > Amol
> >
> >> 
> >> BR,
> >> Jani.
> >> 
> >> > +
> >> > +	<a href="#cs"><sup>[1]</sup></a>
> >> > +
> >> > +.. |entry_2| raw:: html
> >> >  
> >> > -	[1] The variant rcu_dereference_protected() can be used outside
> >> > +	<a href="#entry"><sup>[2]</sup></a>
> >> > +
> >> > +.. _cs:
> >> > +
> >> > +	\ :sup:`[1]`\  The variant rcu_dereference_protected() can be used outside
> >> >  	of an RCU read-side critical section as long as the usage is
> >> >  	protected by locks acquired by the update-side code.  This variant
> >> >  	avoids the lockdep warning that would happen when using (for
> >> > @@ -317,15 +336,18 @@ rcu_dereference()
> >> >  	a lockdep expression to indicate which locks must be acquired
> >> >  	by the caller. If the indicated protection is not provided,
> >> >  	a lockdep splat is emitted.  See Documentation/RCU/Design/Requirements/Requirements.rst
> >> > -	and the API's code comments for more details and example usage.
> >> > +	and the API's code comments for more details and example usage. :ref:`back <back_to_1>`
> >> > +
> >> > +
> >> > +.. _entry:
> >> >  
> >> > -	[2] If the list_for_each_entry_rcu() instance might be used by
> >> > +	\ :sup:`[2]`\  If the list_for_each_entry_rcu() instance might be used by
> >> >  	update-side code as well as by RCU readers, then an additional
> >> >  	lockdep expression can be added to its list of arguments.
> >> >  	For example, given an additional "lock_is_held(&mylock)" argument,
> >> >  	the RCU lockdep code would complain only if this instance was
> >> >  	invoked outside of an RCU read-side critical section and without
> >> > -	the protection of mylock.
> >> > +	the protection of mylock. :ref:`back <back_to_2>`
> >> >  
> >> >  The following diagram shows how each API communicates among the
> >> >  reader, updater, and reclaimer.
> >> 
> >> -- 
> >> Jani Nikula, Intel Open Source Graphics Center
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

Thank you for the feedback Paul and Jani! Sent the updated
patch at
https://lore.kernel.org/lkml/20191105073340.GA3682@workstation-kernel-dev/
with the requested changes.

Thank you
Amol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
