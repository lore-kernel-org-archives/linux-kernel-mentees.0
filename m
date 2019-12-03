Return-Path: <SRS0=o3A5=ZZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F52C432C3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 13:41:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22C92073C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 13:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A22C92073C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7ABBE87668;
	Tue,  3 Dec 2019 13:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9sgfswcNUSPt; Tue,  3 Dec 2019 13:41:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BA18787601;
	Tue,  3 Dec 2019 13:41:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FC37C1799;
	Tue,  3 Dec 2019 13:41:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 042B5C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 13:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E480E84A0F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 13:41:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zVSNo0LL7FHg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 13:41:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F04EC81A21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 13:41:34 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 91DBC60B;
 Tue,  3 Dec 2019 13:41:33 +0000 (UTC)
Date: Tue, 3 Dec 2019 06:41:32 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20191203064132.38d75348@lwn.net>
In-Reply-To: <20191203063941.6981-1-frextrite@gmail.com>
References: <20191203063941.6981-1-frextrite@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
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

On Tue,  3 Dec 2019 12:09:43 +0530
Amol Grover <frextrite@gmail.com> wrote:

> - Add more information about listRCU patterns taking examples
> from audit subsystem in the linux kernel.
> 
> - The initially written audit examples are kept, even though they are
> slightly different in the kernel.
> 
> - Modify inline text for better passage quality.
> 
> - Fix typo in code-blocks and improve code comments.
> 
> - Add text formatting (italics, bold and code) for better emphasis.

Thanks for improving the documentation!  I'll leave the RCU stuff to the
experts, but I do have one request...

[...]

> +When a process exits, ``release_task()`` calls ``list_del_rcu(&p->tasks)`` under
> +``tasklist_lock`` writer lock protection, to remove the task from the list of
> +all tasks. The ``tasklist_lock`` prevents concurrent list additions/removals
> +from corrupting the list. Readers using ``for_each_process()`` are not protected
> +with the ``tasklist_lock``. To prevent readers from noticing changes in the list
> +pointers, the ``task_struct`` object is freed only after one or more grace
> +periods elapse (with the help of ``call_rcu()``). This deferring of destruction
> +ensures that any readers traversing the list will see valid ``p->tasks.next``
> +pointers and deletion/freeing can happen in parallel with traversal of the list.
> +This pattern is also called an **existence lock**, since RCU pins the object in
> +memory until all existing readers finish.

Please don't put function names as literal text.  If you just say
call_rcu(), it will be formatted correctly and cross-linked to the
appropriate kerneldoc entry.  Saying ``call_rcu()`` defeats that and
clutters the plain-text reading experience.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
