Return-Path: <SRS0=Bb3l=7H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA9DC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 May 2020 13:18:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B85452078B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 May 2020 13:18:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V16jQlB9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B85452078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 91D7A87804;
	Mon, 25 May 2020 13:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rMCqWMMJMoz7; Mon, 25 May 2020 13:18:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 13C5F87E23;
	Mon, 25 May 2020 13:18:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F38BFC088D;
	Mon, 25 May 2020 13:18:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3FDAC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 13:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A0A2C86709
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 13:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eMFXCFLn4sQX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 13:18:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 82B6285F97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590412682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MJttDWRjUB0iYxqsplzNq2BTjGePNN+JTxhPLsQCxlQ=;
 b=V16jQlB9uoaNmWiEYKytPrupeoBEyMIgy6MLjZLpXAEbtlaQYDugCXLAMbniyt62g5Z4ZB
 l7//nLM/V5S3MY8Y8lQ6UfWKNBL9Lw0hc1iQnLjJaDj8mbPzwhQnSllNu7EZlc0CNq8BXi
 W9w/2bhMgIVowa1nmf089JcsTgJ1vtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-jG5GRwolOYeYfIkBpcRzNw-1; Mon, 25 May 2020 09:18:00 -0400
X-MC-Unique: jG5GRwolOYeYfIkBpcRzNw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 823521005512;
 Mon, 25 May 2020 13:17:57 +0000 (UTC)
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85F6310013D6;
 Mon, 25 May 2020 13:17:44 +0000 (UTC)
Date: Mon, 25 May 2020 09:17:41 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200525131741.s6lgb263fpo5uszk@madcap2.tricolour.ca>
References: <20200402055640.6677-1-frextrite@gmail.com>
 <20200524081117.GA29@workstation-LAP.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200524081117.GA29@workstation-LAP.localdomain>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 David Howells <dhowells@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jamorris@linux.microsoft.com>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Paul E . McKenney" <paulmck@kernel.org>, Jann Horn <jannh@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Shakeel Butt <shakeelb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>,
 linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 linux-audit@redhat.com, "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 1/3 RESEND] sched: Remove __rcu
 annotation from cred pointer
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

On 2020-05-24 13:41, Amol Grover wrote:
> On Thu, Apr 02, 2020 at 11:26:38AM +0530, Amol Grover wrote:
> > task_struct::cred (subjective credentials) is *always* used
> > task-synchronously, hence, does not require RCU semantics.
> > 
> > task_struct::real_cred (objective credentials) can be used in
> > RCU context and its __rcu annotation is retained.
> > 
> > However, task_struct::cred and task_struct::real_cred *may*
> > point to the same object, hence, the object pointed to by
> > task_struct::cred *may* have RCU delayed freeing.
> > 
> > Suggested-by: Jann Horn <jannh@google.com>
> > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> 
> Hello everyone,
> 
> Could you please go through patches 1/3 and 2/3 and if deemed OK, give
> your acks. I sent the original patch in beginning of February (~4 months
> back) and resent the patches again in beginning of April due to lack of
> traffic. Paul Moore was kind enough to ack twice - the 3/3 and its
> resend patch. However these 2 patches still remain. I'd really
> appreciate if someone reviewed them.

I asked on April 3 which upstream tree you expect this patchset to go
through and I did not see a reply.  Do you have a specific target or is
the large addressee list assuming someone else is taking this set?  All
we have seen is that it is not intended to go through the audit tree.

> Thanks
> Amol

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
