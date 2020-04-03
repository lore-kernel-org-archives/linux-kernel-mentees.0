Return-Path: <SRS0=cuc6=5T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A8D2C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Apr 2020 21:22:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D61F206F5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Apr 2020 21:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y4L2Td99"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D61F206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0338287242;
	Fri,  3 Apr 2020 21:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OvKP2KU89Q3d; Fri,  3 Apr 2020 21:22:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 12B208729F;
	Fri,  3 Apr 2020 21:22:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDBBCC1831;
	Fri,  3 Apr 2020 21:22:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14F90C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Apr 2020 21:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F300787B5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Apr 2020 21:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AO7GzPK8LeWV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Apr 2020 21:22:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9B06087E9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Apr 2020 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585948924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lPxdH1JXe7h2gPkmS5oPinAisRrZCpEB3AZHI2P5ejM=;
 b=Y4L2Td99k0RyXZG9tjmubvSe01vK8us3tCb2ttM8JDU8Z3KpPk1UZ5GffEhIllO2MGcVGk
 qttGlOj2+Z+MFq2MYxiRU3t0PmsiKX77sx2GUbV/DoM7ivhfMPHHw5fX+Lo4Ua2pB2xQia
 T4Fpyx+NkZIDEq2E9jRaKQapbjQn8qc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-eunYrKpcOoiRPxIDITrryw-1; Fri, 03 Apr 2020 17:21:59 -0400
X-MC-Unique: eunYrKpcOoiRPxIDITrryw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A54211005509;
 Fri,  3 Apr 2020 21:21:54 +0000 (UTC)
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 363DD26DF1;
 Fri,  3 Apr 2020 21:21:41 +0000 (UTC)
Date: Fri, 3 Apr 2020 17:21:38 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200403212138.kr72jr57ppzsv6rm@madcap2.tricolour.ca>
References: <20200402055640.6677-1-frextrite@gmail.com>
 <20200402055640.6677-3-frextrite@gmail.com>
 <CAHC9VhTUKepKiGZgAaWDADyTPnnM5unbM65T7jXZ3p8MFTNUuQ@mail.gmail.com>
 <20200403075613.GA2788@workstation-portable>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403075613.GA2788@workstation-portable>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Ben Segall <bsegall@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jamorris@linux.microsoft.com>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Paul E . McKenney" <paulmck@kernel.org>, Jann Horn <jannh@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Shakeel Butt <shakeelb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org,
 linux-audit@redhat.com, "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 3/3 RESEND] auditsc: Do not use
 RCU primitive to read from cred pointer
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

On 2020-04-03 13:26, Amol Grover wrote:
> On Thu, Apr 02, 2020 at 08:56:36AM -0400, Paul Moore wrote:
> > On Thu, Apr 2, 2020 at 1:57 AM Amol Grover <frextrite@gmail.com> wrote:
> > > task_struct::cred is only used task-synchronously and does
> > > not require any RCU locks, hence, rcu_dereference_check is
> > > not required to read from it.
> > >
> > > Suggested-by: Jann Horn <jannh@google.com>
> > > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > ---
> > >  kernel/auditsc.c | 15 +++++----------
> > >  1 file changed, 5 insertions(+), 10 deletions(-)
> > 
> > This is the exact same patch I ACK'd back in February, yes?
> > 
> > https://lore.kernel.org/linux-audit/CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com
> > 
> 
> Hi Paul,
> 
> That's correct. I've resend the series out of the fear that the first 2
> patches might've gotten lost as it's been almost a month since I last
> sent them. Could you please ack this again, and if you don't mind could
> you please go through the other 2 patches and ack them aswell?

Via who's tree are you expecting this will make it upstream?

> Thanks
> Amol
> 
> > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > index 4effe01ebbe2..d3510513cdd1 100644
> > > --- a/kernel/auditsc.c
> > > +++ b/kernel/auditsc.c
> > > @@ -430,24 +430,19 @@ static int audit_field_compare(struct task_struct *tsk,
> > >  /* Determine if any context name data matches a rule's watch data */
> > >  /* Compare a task_struct with an audit_rule.  Return 1 on match, 0
> > >   * otherwise.
> > > - *
> > > - * If task_creation is true, this is an explicit indication that we are
> > > - * filtering a task rule at task creation time.  This and tsk == current are
> > > - * the only situations where tsk->cred may be accessed without an rcu read lock.
> > >   */
> > >  static int audit_filter_rules(struct task_struct *tsk,
> > >                               struct audit_krule *rule,
> > >                               struct audit_context *ctx,
> > >                               struct audit_names *name,
> > > -                             enum audit_state *state,
> > > -                             bool task_creation)
> > > +                             enum audit_state *state)
> > >  {
> > >         const struct cred *cred;
> > >         int i, need_sid = 1;
> > >         u32 sid;
> > >         unsigned int sessionid;
> > >
> > > -       cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
> > > +       cred = tsk->cred;
> > >
> > >         for (i = 0; i < rule->field_count; i++) {
> > >                 struct audit_field *f = &rule->fields[i];
> > > @@ -745,7 +740,7 @@ static enum audit_state audit_filter_task(struct task_struct *tsk, char **key)
> > >         rcu_read_lock();
> > >         list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_TASK], list) {
> > >                 if (audit_filter_rules(tsk, &e->rule, NULL, NULL,
> > > -                                      &state, true)) {
> > > +                                      &state)) {
> > >                         if (state == AUDIT_RECORD_CONTEXT)
> > >                                 *key = kstrdup(e->rule.filterkey, GFP_ATOMIC);
> > >                         rcu_read_unlock();
> > > @@ -791,7 +786,7 @@ static enum audit_state audit_filter_syscall(struct task_struct *tsk,
> > >         list_for_each_entry_rcu(e, list, list) {
> > >                 if (audit_in_mask(&e->rule, ctx->major) &&
> > >                     audit_filter_rules(tsk, &e->rule, ctx, NULL,
> > > -                                      &state, false)) {
> > > +                                      &state)) {
> > >                         rcu_read_unlock();
> > >                         ctx->current_state = state;
> > >                         return state;
> > > @@ -815,7 +810,7 @@ static int audit_filter_inode_name(struct task_struct *tsk,
> > >
> > >         list_for_each_entry_rcu(e, list, list) {
> > >                 if (audit_in_mask(&e->rule, ctx->major) &&
> > > -                   audit_filter_rules(tsk, &e->rule, ctx, n, &state, false)) {
> > > +                   audit_filter_rules(tsk, &e->rule, ctx, n, &state)) {
> > >                         ctx->current_state = state;
> > >                         return 1;
> > >                 }
> > > --
> > > 2.24.1
> > 
> > paul moore

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
