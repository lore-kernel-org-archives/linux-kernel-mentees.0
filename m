Return-Path: <SRS0=nXBU=32=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FCFC352A4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 20:25:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A332192A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 20:25:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="Ikd/ForQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15A332192A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B8427869C4;
	Thu,  6 Feb 2020 20:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J0ssR02YAJ96; Thu,  6 Feb 2020 20:25:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9DE1C86501;
	Thu,  6 Feb 2020 20:25:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84566C0881;
	Thu,  6 Feb 2020 20:25:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A62BCC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 20:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A184587B69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 20:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbDsYH9whznW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 20:25:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D29FF87ADF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 20:25:13 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id w15so6913304qkf.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Feb 2020 12:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EppCVQVdb0sbGPOMbE3NBdA8qFhHOMdA/yHWcWz4Q7c=;
 b=Ikd/ForQYktwkjmcJi8TWzL0ti2z92MIt7bkLM6I3JIj3oeo950ZvGIC0w+5Q3hYDU
 rIoUF5xzcij+4MVb/Uo2HVazWU3O4d0JmxcdJsRvaj81rBxASMyVuhFeUXsmLjDXTSLI
 QH0bQYJ577Lwps4s/V2KT3IJTIEeAniJnFwK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EppCVQVdb0sbGPOMbE3NBdA8qFhHOMdA/yHWcWz4Q7c=;
 b=F+kHRKxbA4sYvCB/YHP7valV5cVs9AduNMtnql+uev9OEQsn6SZt/ObdS3O/QJbrQ5
 UjvabtMkR8nNLI5QZJzD1fKlYrsi+pCQybgBZFNYmNp57cRGdbxpmcnLy0o3Gq+GrzpW
 EHvFu261nMuTJofAl3MeXLx7+y3ABX9QaJv2bJgHXgTsz+m4cTS/qd/0Cr2DSbxEpgA+
 m+H9EHTvrLZP9dcwEy9gIUCDRvrfNV0sgZRpTYruaS9vVST7xnfbcqB+/Qt2iNWSo9rh
 aHGLTLXgcDnaV5cXLWx8fnqKOb8WyuvOgBmgSaTtZBp4/tgs1+JaOojN/XM5hy5f3ew7
 Uarw==
X-Gm-Message-State: APjAAAUjsLZSrsnczT2f/9+MesWBuSqt5R4enc+4D3YrgzeCnnTYknPG
 l/a4Xypk8NznXwjSAyTaGG1ABA==
X-Google-Smtp-Source: APXvYqy30Qk93sRD5os14ZOvi4/IQRNm9Fh5M8VNB3r1zdEp4q4pDfV2E8CioqsfjEVVRGt1WZDGmA==
X-Received: by 2002:a05:620a:88b:: with SMTP id
 b11mr4251474qka.429.1581020712036; 
 Thu, 06 Feb 2020 12:25:12 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id g53sm212698qtk.76.2020.02.06.12.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 12:25:11 -0800 (PST)
Date: Thu, 6 Feb 2020 15:25:11 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Message-ID: <20200206202511.GC36876@google.com>
References: <20200205172437.10113-1-madhuparnabhowmik10@gmail.com>
 <87wo90myhj.fsf@x220.int.ebiederm.org>
 <20200206110051.GA4531@madhuparna-HP-Notebook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206110051.GA4531@madhuparna-HP-Notebook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: paulmck@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 oleg@redhat.com, linux-kernel@vger.kernel.org, ebiederm@xmission.com,
 tj@kernel.org, christian.brauner@ubuntu.com,
 "Eric W. Biederman" <ebiederm@gmail.com>, guro@fb.com
Subject: Re: [Linux-kernel-mentees] [PATCH] signal.c: Fix sparse warnings
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

On Thu, Feb 06, 2020 at 04:30:51PM +0530, Madhuparna Bhowmik wrote:
> On Wed, Feb 05, 2020 at 04:59:52PM -0600, Eric W. Biederman wrote:
> > madhuparnabhowmik10@gmail.com writes:
> > 
> > > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > >
> > > This patch fixes the following two sparse warnings caused due to
> > > accessing RCU protected pointer tsk->parent without rcu primitives.
> > >
> > > kernel/signal.c:1948:65: warning: incorrect type in argument 1 (different address spaces)
> > > kernel/signal.c:1948:65:    expected struct task_struct *tsk
> > > kernel/signal.c:1948:65:    got struct task_struct [noderef] <asn:4> *parent
> > > kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
> > > kernel/signal.c:1949:40:    expected void const volatile *p
> > > kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
> > > kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
> > > kernel/signal.c:1949:40:    expected void const volatile *p
> > > kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
> > >
> > > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > > ---
> > >  kernel/signal.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/kernel/signal.c b/kernel/signal.c
> > > index 9ad8dea93dbb..8227058ea8c4 100644
> > > --- a/kernel/signal.c
> > > +++ b/kernel/signal.c
> > > @@ -1945,8 +1945,8 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
> > >  	 * correct to rely on this
> > >  	 */
> > >  	rcu_read_lock();
> > > -	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(tsk->parent));
> > > -	info.si_uid = from_kuid_munged(task_cred_xxx(tsk->parent, user_ns),
> > > +	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(rcu_dereference(tsk->parent)));
> > > +	info.si_uid = from_kuid_munged(task_cred_xxx(rcu_dereference(tsk->parent), user_ns),
> > >  				       task_uid(tsk));
> > >  	rcu_read_unlock();
> > 
> > 
> > Still wrong because that access fundamentally depends upon the
> > task_list_lock no the rcu_read_lock.  Things need to be consistent for
> > longer than the rcu_read_lock is held.
> >
> Okay, then how about something like rcu_dereference_protected(tsk->parent, lockdep_is_held(&tasklist_lock))?
> Let me know if this looks fine to you.

But then there are several other ->parent accesses in the function. What
about something like the following? It removes the confusion Eric is
referring to and fixes the sparse errors you mentioned. Thoughts?

---8<-----------------------

diff --git a/kernel/signal.c b/kernel/signal.c
index bcd46f547db39..92f0b7bf70bf3 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1909,6 +1909,7 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
 	struct sighand_struct *psig;
 	bool autoreap = false;
 	u64 utime, stime;
+	struct task_struct *tsk_parent;
 
 	BUG_ON(sig == -1);
 
@@ -1918,6 +1919,9 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
 	BUG_ON(!tsk->ptrace &&
 	       (tsk->group_leader != tsk || !thread_group_empty(tsk)));
 
+	tsk_parent = rcu_dereference_protected(tsk->parent,
+					   lockdep_is_held(&tasklist_lock));
+
 	/* Wake up all pidfd waiters */
 	do_notify_pidfd(tsk);
 
@@ -1926,7 +1930,7 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
 		 * This is only possible if parent == real_parent.
 		 * Check if it has changed security domain.
 		 */
-		if (tsk->parent_exec_id != tsk->parent->self_exec_id)
+		if (tsk->parent_exec_id != tsk_parent->self_exec_id)
 			sig = SIGCHLD;
 	}
 
@@ -1945,8 +1949,8 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
 	 * correct to rely on this
 	 */
 	rcu_read_lock();
-	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(tsk->parent));
-	info.si_uid = from_kuid_munged(task_cred_xxx(tsk->parent, user_ns),
+	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(tsk_parent));
+	info.si_uid = from_kuid_munged(task_cred_xxx(tsk_parent, user_ns),
 				       task_uid(tsk));
 	rcu_read_unlock();
 
@@ -1964,7 +1968,7 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
 		info.si_status = tsk->exit_code >> 8;
 	}
 
-	psig = tsk->parent->sighand;
+	psig = tsk_parent->sighand;
 	spin_lock_irqsave(&psig->siglock, flags);
 	if (!tsk->ptrace && sig == SIGCHLD &&
 	    (psig->action[SIGCHLD-1].sa.sa_handler == SIG_IGN ||
@@ -1989,8 +1993,8 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
 			sig = 0;
 	}
 	if (valid_signal(sig) && sig)
-		__group_send_sig_info(sig, &info, tsk->parent);
-	__wake_up_parent(tsk, tsk->parent);
+		__group_send_sig_info(sig, &info, tsk_parent);
+	__wake_up_parent(tsk, tsk_parent);
 	spin_unlock_irqrestore(&psig->siglock, flags);
 
 	return autoreap;
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
