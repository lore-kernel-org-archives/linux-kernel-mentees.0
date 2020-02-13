Return-Path: <SRS0=i9XN=4B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF825C3B188
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Feb 2020 08:11:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8AF120848
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Feb 2020 08:11:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Es48Y6nx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8AF120848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 69AF287C8C;
	Thu, 13 Feb 2020 08:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FUsV-Ne4U+iD; Thu, 13 Feb 2020 08:11:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D7C3887C7D;
	Thu, 13 Feb 2020 08:11:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C284EC08A4;
	Thu, 13 Feb 2020 08:11:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FD72C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 08:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 86F7F87C8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 08:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xihlC7T1f-E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 08:11:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C687387C7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 08:11:53 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id gv17so2077391pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 00:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XnRL/6GCJnnLqnsq4zYt0l8kyVXrVP3xw1YFsqQnEx4=;
 b=Es48Y6nx1HIXVE1wzsyfQo33Kx1crK2xDdWk+ZULrQ0st3KadIGmT4/fB0b1CPvL2N
 5cRSgayMUW2fCiLQUmT/VYkYpllxPjd75L9CxY8uMSZ6biMIa/KqxIK8OY/osn1KKoGl
 TMsk5V1eL/zvu8n/0t6KvbPfxaJU9yFupnFyDotUGUyruJes9Wyis3RoZn4g1CTIjhtq
 t5ayCIlA3No6HgQxprrWldDVdLubes9dWrFuQ932SILEjR2l7+OBBfN3B0ZiW/h4/eLH
 sNWr71yNhL6ACs1m9+nTo/a3f51M9yDbdnx4UTXw/n1O7vIBDUfg9RVe/v77lfkR5Zll
 EeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XnRL/6GCJnnLqnsq4zYt0l8kyVXrVP3xw1YFsqQnEx4=;
 b=OCIzgddAznJ5tVMbpW2gLyURXzAMpKnxzV5FMzO5i65K2EHcM36K6eIcjT1PLzMlWB
 YMI85/XOXzKhyVy2nZeIqGqNfZWqWDnfanWohMctfrN3tPJlc05WQ+jINiqXaNNDTcEt
 w36PXl9Yyld7zXt6QJbbP8FJYxUBHEc5bMToDmUuEYIAJYBEuTdPVEy+GVZ9wm37UHKW
 ieKnbCPjZCVAZSj5pwMDZAE4g700zFYVcVHGkn4U/m87A2NkPAQnpbeFYzCIygMFSvM3
 VvCnZoy8cGSpUyyyJ4K96JxaH6/98STtZCy5TEQ7W7XmnZQA+4nd8AYVCJdWRCh1q+J9
 wNtw==
X-Gm-Message-State: APjAAAVeWEbuds/Lh/JsbS9Rs6s7bXqs2m2XaazjbGE+hRm/rmC3fabg
 CMc2dzKhKHP8J00kvGBCz6Y=
X-Google-Smtp-Source: APXvYqzfz/PE2mNdtJw+e11/Z3yxDbjoO6rLO+S8IVtkypnf1/CSYFZ6seYri1fPVJTKNtoS2bbH3g==
X-Received: by 2002:a17:902:6bcb:: with SMTP id
 m11mr28523894plt.10.1581581513257; 
 Thu, 13 Feb 2020 00:11:53 -0800 (PST)
Received: from workstation-portable ([103.211.17.23])
 by smtp.gmail.com with ESMTPSA id o16sm1681844pgl.58.2020.02.13.00.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 00:11:52 -0800 (PST)
Date: Thu, 13 Feb 2020 13:41:39 +0530
From: Amol Grover <frextrite@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Message-ID: <20200213081139.GB26550@workstation-portable>
References: <20200207180504.4200-1-frextrite@gmail.com>
 <20200207180504.4200-3-frextrite@gmail.com>
 <CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 David Howells <dhowells@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
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
Subject: Re: [Linux-kernel-mentees] [PATCH 3/3] auditsc: Do not use RCU
 primitive to read from cred pointer
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

On Tue, Feb 11, 2020 at 10:19:04AM -0500, Paul Moore wrote:
> On Fri, Feb 7, 2020 at 1:08 PM Amol Grover <frextrite@gmail.com> wrote:
> >
> > task_struct::cred is only used task-synchronously and does
> > not require any RCU locks, hence, rcu_dereference_check is
> > not required to read from it.
> >
> > Suggested-by: Jann Horn <jannh@google.com>
> > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > ---
> >  kernel/auditsc.c | 15 +++++----------
> >  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> Considering the other changes in this patchset this change seems
> reasonable to me.  I'm assuming you were intending this patchset to go
> in via some tree other than audit?
> 

Yes, that's correct. Thank you for the ack!

> Acked-by: Paul Moore <paul@paul-moore.com>
> 
> > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > index 4effe01ebbe2..d3510513cdd1 100644
> > --- a/kernel/auditsc.c
> > +++ b/kernel/auditsc.c
> > @@ -430,24 +430,19 @@ static int audit_field_compare(struct task_struct *tsk,
> >  /* Determine if any context name data matches a rule's watch data */
> >  /* Compare a task_struct with an audit_rule.  Return 1 on match, 0
> >   * otherwise.
> > - *
> > - * If task_creation is true, this is an explicit indication that we are
> > - * filtering a task rule at task creation time.  This and tsk == current are
> > - * the only situations where tsk->cred may be accessed without an rcu read lock.
> >   */
> >  static int audit_filter_rules(struct task_struct *tsk,
> >                               struct audit_krule *rule,
> >                               struct audit_context *ctx,
> >                               struct audit_names *name,
> > -                             enum audit_state *state,
> > -                             bool task_creation)
> > +                             enum audit_state *state)
> >  {
> >         const struct cred *cred;
> >         int i, need_sid = 1;
> >         u32 sid;
> >         unsigned int sessionid;
> >
> > -       cred = rcu_dereference_check(tsk->cred, tsk == current || task_creation);
> > +       cred = tsk->cred;
> >
> >         for (i = 0; i < rule->field_count; i++) {
> >                 struct audit_field *f = &rule->fields[i];
> > @@ -745,7 +740,7 @@ static enum audit_state audit_filter_task(struct task_struct *tsk, char **key)
> >         rcu_read_lock();
> >         list_for_each_entry_rcu(e, &audit_filter_list[AUDIT_FILTER_TASK], list) {
> >                 if (audit_filter_rules(tsk, &e->rule, NULL, NULL,
> > -                                      &state, true)) {
> > +                                      &state)) {
> >                         if (state == AUDIT_RECORD_CONTEXT)
> >                                 *key = kstrdup(e->rule.filterkey, GFP_ATOMIC);
> >                         rcu_read_unlock();
> > @@ -791,7 +786,7 @@ static enum audit_state audit_filter_syscall(struct task_struct *tsk,
> >         list_for_each_entry_rcu(e, list, list) {
> >                 if (audit_in_mask(&e->rule, ctx->major) &&
> >                     audit_filter_rules(tsk, &e->rule, ctx, NULL,
> > -                                      &state, false)) {
> > +                                      &state)) {
> >                         rcu_read_unlock();
> >                         ctx->current_state = state;
> >                         return state;
> > @@ -815,7 +810,7 @@ static int audit_filter_inode_name(struct task_struct *tsk,
> >
> >         list_for_each_entry_rcu(e, list, list) {
> >                 if (audit_in_mask(&e->rule, ctx->major) &&
> > -                   audit_filter_rules(tsk, &e->rule, ctx, n, &state, false)) {
> > +                   audit_filter_rules(tsk, &e->rule, ctx, n, &state)) {
> >                         ctx->current_state = state;
> >                         return 1;
> >                 }
> > --
> > 2.24.1
> >
> 
> 
> -- 
> paul moore
> www.paul-moore.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
