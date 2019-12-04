Return-Path: <SRS0=/i4J=Z2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BF9C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 08:24:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4131920637
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 08:24:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amGepPz7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4131920637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 12737881BB;
	Wed,  4 Dec 2019 08:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07PlmVHH-8IQ; Wed,  4 Dec 2019 08:24:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 79B8488295;
	Wed,  4 Dec 2019 08:24:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D97FC1DD6;
	Wed,  4 Dec 2019 08:24:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7413C18DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 08:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B5AC586937
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 08:24:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLUJRUDhUpPk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 08:24:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 39A6586227
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 08:24:21 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id x7so2984808pgl.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Dec 2019 00:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8xvQ4KrBz1M6n1c0YpMC9j+X8HvnhtQ5BjOcRHIdsx4=;
 b=amGepPz7ql+vTupsCnD6IPDipjGdbEdlKhY9cDj1Ekdy9V/2p6pYvzaA+jruVaXcuZ
 rO1xKldA6IhBJmcwJ/vnXGFEIYBKAHziPGeGrBZvW9m1px5SyLsyUbx3D3ydcil6qGB/
 K1NZiwbGggzcQ5EoFuozvvigL+u60IS+K2+0sJw7PUREwd0Vq9rbx8I+x1RrSOT9ychp
 CeBXvLiBfT64rb0Ixq0cMg6+y7mOOd+UDClM+uVwM7FESrFiH1aysjLxbYJqiwg+TKX4
 dl7VDEbU7KJNXdlpyx4/lY4iLWHNBLsFgMZ8ZdIyej9mA+hM03g7ymt93X70bI7zNJjo
 3+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8xvQ4KrBz1M6n1c0YpMC9j+X8HvnhtQ5BjOcRHIdsx4=;
 b=WW0UOA46Chx6r/b227LReWuhtL+Ghkcocl7waU4xYaY8iheFwM5hxYjz+WNvopoV4U
 hn23o4MR6kn9c+WeksdCblsgmTTPcQLzcDskuSyUtPPkkSFte1m694/vnyKtR2E8JsMI
 Tqy8tCYYdy+dt6ycqPfrgBQEhtYM/KuSJ85UiaennRY+F8rKEf+s4UIfNOTq/UovfYqV
 vTN1bf7BIS3GEDMvzB4mBHtVie9R66pPZIe5M6QciPH4TPMQ0B0ja6OZ7WvDXgaI9Pgp
 zA3Kt4SK85dkam8w3e6juftcqC6ox1+Yf/RZzFB5ZBXutaQK78X+iVkzWt3UChUXFldv
 xI7A==
X-Gm-Message-State: APjAAAWCotFItJAjy3zljUUV4gvhPCf1ILWS3Fk9qqwN3Et99ceNxmXp
 2mNXVFExSCb1EUVaj7V1JKU=
X-Google-Smtp-Source: APXvYqylPnT6dgCmD55Q7hCAukiHfv8BLJTgQms5dq+Bh33cuTtxDo9AxShUdojQylsoPDn2w9Zvbw==
X-Received: by 2002:aa7:80d2:: with SMTP id a18mr2318629pfn.29.1575447860727; 
 Wed, 04 Dec 2019 00:24:20 -0800 (PST)
Received: from workstation-kernel-dev ([139.5.253.155])
 by smtp.gmail.com with ESMTPSA id o19sm5926518pjr.2.2019.12.04.00.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 00:24:20 -0800 (PST)
Date: Wed, 4 Dec 2019 13:54:12 +0530
From: Amol Grover <frextrite@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20191204082412.GA6959@workstation-kernel-dev>
References: <20191203063941.6981-1-frextrite@gmail.com>
 <20191203064132.38d75348@lwn.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203064132.38d75348@lwn.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] doc: listRCU: Add some more
 listRCU patterns in the kernel
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Dec 03, 2019 at 06:41:32AM -0700, Jonathan Corbet wrote:
> On Tue,  3 Dec 2019 12:09:43 +0530
> Amol Grover <frextrite@gmail.com> wrote:
> 
> > - Add more information about listRCU patterns taking examples
> > from audit subsystem in the linux kernel.
> > 
> > - The initially written audit examples are kept, even though they are
> > slightly different in the kernel.
> > 
> > - Modify inline text for better passage quality.
> > 
> > - Fix typo in code-blocks and improve code comments.
> > 
> > - Add text formatting (italics, bold and code) for better emphasis.
> 
> Thanks for improving the documentation!  I'll leave the RCU stuff to the
> experts, but I do have one request...
> 
> [...]
> 
> > +When a process exits, ``release_task()`` calls ``list_del_rcu(&p->tasks)`` under
> > +``tasklist_lock`` writer lock protection, to remove the task from the list of
> > +all tasks. The ``tasklist_lock`` prevents concurrent list additions/removals
> > +from corrupting the list. Readers using ``for_each_process()`` are not protected
> > +with the ``tasklist_lock``. To prevent readers from noticing changes in the list
> > +pointers, the ``task_struct`` object is freed only after one or more grace
> > +periods elapse (with the help of ``call_rcu()``). This deferring of destruction
> > +ensures that any readers traversing the list will see valid ``p->tasks.next``
> > +pointers and deletion/freeing can happen in parallel with traversal of the list.
> > +This pattern is also called an **existence lock**, since RCU pins the object in
> > +memory until all existing readers finish.
> 
> Please don't put function names as literal text.  If you just say
> call_rcu(), it will be formatted correctly and cross-linked to the
> appropriate kerneldoc entry.  Saying ``call_rcu()`` defeats that and
> clutters the plain-text reading experience.
> 

Hi Jon,

The cross-reference of the functions should be done automatically by sphinx
while generating HTML, right? But when compiled none of the functions were
cross-referenced hence "``" was added around the methods (and other symbols)
to distinguish them from normal text.

Thanks
Amol

> Thanks,
> 
> jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
