Return-Path: <SRS0=C1jw=3R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60624C33CB3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 19:09:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2292E20708
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 19:09:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="OjMQ2XmT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2292E20708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EFF1820523;
	Tue, 28 Jan 2020 19:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgBNW1nBA+9x; Tue, 28 Jan 2020 19:09:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 34E352051D;
	Tue, 28 Jan 2020 19:09:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 214D2C0178;
	Tue, 28 Jan 2020 19:09:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53245C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 19:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 42D0586A4D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 19:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id to6zTa9IEYOw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 19:09:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 20456868B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 19:09:45 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b18so13136424otp.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 11:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0uDY2QBhfEUdWOh6cPotJ77cqPe1RSmXYbfImdKMurk=;
 b=OjMQ2XmTWVstZOf1eyavV2tz0/5ffAvoB3yOj3xIx5xzt3CKWH8L2jQLHKoUsXQCQv
 XoTJPvBAF2gGaG1UhrSnqQXYiLfmnOFe8E0RoMbZwdJoo4dgAJFQBenA+XtU0o6T0EgF
 HYITPw6U+8nEcY4PoWY+NNr1Eq+Jv3a6MCyzmdzjzvSh/QaUSsRR6FVq76JJ6VDHEJr8
 UIgg29EKhzl/lzCba8uvoxh7lizoJjJvy9DkECKCgiRpzre3XFtqIaCjjPi3eUTGpRQ7
 ZG/2KQ6YHj4mo752Lh+DR0TA4Y5bUn9DSW49bsstpefiCr+eMQzlIwcnrZjkSQ69NtEm
 fz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0uDY2QBhfEUdWOh6cPotJ77cqPe1RSmXYbfImdKMurk=;
 b=EuSbCjCse8SHrQY3RdGHPKwr9G42Dd/JOEJdFj9WFrKVY/6hGeGRqNwjQUE9CJw5kv
 C2kDLjZBfQikMm0co/BIUrhLL326JhsS7gAuyYO6z86+iKNBJp61CbRebbDNhquVmWiB
 l6NCr9DzeRdXH86BRcphW68KUc7ma1XYlISg2JyTg39xYWAqb7DuJ3i0lC3somTjkAdN
 VzNG8eaaT9z9Qd5A+w7wUKcjKGiu7xmwJIOr8IehCkDf+uQni/djmxoNhbt7NP+AObw9
 //zes35bNx4R6EQJGiIByUz5dn+/ZwzUIyA3p9QoVIbR0dGq9TlJ4adMxg+5V4u7kyEK
 e6hg==
X-Gm-Message-State: APjAAAU/EjxnIaeYf1LB5LT5nJlnUshW7v95u55YLXMg7z+o/1xl6Kt/
 oxTiXzP80skWNuJJw8BaMcqfdjPTHr2UpUJZ6/Fomw==
X-Google-Smtp-Source: APXvYqxjKWcfc3GV8OqegAQiDhrMSPEn/uhrhF1Cn4ZvDGrMCFrF0cIwz7KuLZSNRhR352hCbncAiGQMDxO2ihfFQN4=
X-Received: by 2002:a05:6830:1d6e:: with SMTP id
 l14mr17212146oti.32.1580238583961; 
 Tue, 28 Jan 2020 11:09:43 -0800 (PST)
MIME-Version: 1.0
References: <20200128072740.21272-1-frextrite@gmail.com>
 <CAG48ez3ZcO+kVPJVG6XpCPyGUKF2o4UJ6AVdgZXGQ6XJJpcdmg@mail.gmail.com>
 <20200128170426.GA10277@workstation-portable>
In-Reply-To: <20200128170426.GA10277@workstation-portable>
Date: Tue, 28 Jan 2020 20:09:17 +0100
Message-ID: <CAG48ez3bLC3dzXn7Ep0YmBENg7wp6TMrocGa6q2RLtYoOdUSxg@mail.gmail.com>
To: Amol Grover <frextrite@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, James Morris <jamorris@linux.microsoft.com>,
 kernel list <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Shakeel Butt <shakeelb@google.com>,
 Joel Fernandes <joel@joelfernandes.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] cred: Use RCU primitives to
	access RCU pointers
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
From: Jann Horn via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Jan 28, 2020 at 6:04 PM Amol Grover <frextrite@gmail.com> wrote:
> On Tue, Jan 28, 2020 at 10:30:19AM +0100, Jann Horn wrote:
> > On Tue, Jan 28, 2020 at 8:28 AM Amol Grover <frextrite@gmail.com> wrote:
> > > task_struct.cred and task_struct.real_cred are annotated by __rcu,
> >
> > task_struct.cred doesn't actually have RCU semantics though, see
> > commit d7852fbd0f0423937fa287a598bfde188bb68c22. For task_struct.cred,
> > it would probably be more correct to remove the __rcu annotation?
> >
>
> Hi Jann,
>
> I went through the commit you mentioned. If I understand it correctly,
> ->cred was not being accessed concurrently (via RCU), hence, a non_rcu
> flag was introduced, which determined if the clean-up should wait for
> RCU grace-periods or not. And since, the changes were 'thread local'
> there was no need to wait for an entire RCU GP to elapse.

Yeah.

> The commit too, as you said, mentions the removal of __rcu annotation.
> However, simply removing the annotation won't work, as there are quite a
> few instances where RCU primitives are used. Even get_current_cred()
> uses RCU APIs to get a reference to ->cred.

Luckily, there aren't too many places that directly access ->cred,
since luckily there are helper functions like get_current_cred() that
will do it for you. Grepping through the kernel, I see:

Places that need adjustment:

include/linux/cred.h:   rcu_dereference_protected(current->cred, 1)
kernel/auditsc.c: * the only situations where tsk->cred may be
accessed without an rcu read lock.
kernel/auditsc.c:       cred = rcu_dereference_check(tsk->cred, tsk ==
current || task_creation);
kernel/cred.c:  rcu_assign_pointer(task->cred, new);
kernel/cred.c:  rcu_assign_pointer(current->cred, new);
kernel/cred.c:  rcu_assign_pointer(current->cred, old);


Places that already don't use RCU accessors:

drivers/virt/vboxguest/vboxguest_linux.c:       if
(from_kuid(current_user_ns(), current->cred->uid) == 0)
kernel/cred.c:  BUG_ON(cred == current->cred);
kernel/cred.c:  kdebug("exit_creds(%u,%p,%p,{%d,%d})", tsk->pid,
tsk->real_cred, tsk->cred,
kernel/cred.c:         atomic_read(&tsk->cred->usage),
kernel/cred.c:         read_cred_subscribers(tsk->cred));
kernel/cred.c:  cred = (struct cred *) tsk->cred;
kernel/cred.c:  tsk->cred = NULL;
kernel/cred.c:  old = task->cred;
kernel/cred.c:          !p->cred->thread_keyring &&
kernel/cred.c:          p->real_cred = get_cred(p->cred);
kernel/cred.c:          get_cred(p->cred);
kernel/cred.c:          alter_cred_subscribers(p->cred, 2);
kernel/cred.c:                 p->cred, atomic_read(&p->cred->usage),
kernel/cred.c:                 read_cred_subscribers(p->cred));
kernel/cred.c:          atomic_inc(&p->cred->user->processes);
kernel/cred.c:  p->cred = p->real_cred = get_cred(new);
kernel/cred.c:  BUG_ON(task->cred != old);
kernel/cred.c:  const struct cred *old = current->cred;
kernel/cred.c:   * '->cred' pointer, not the '->real_cred' pointer that is
kernel/cred.c:  const struct cred *override = current->cred;
kernel/cred.c:         cred == tsk->cred ? "[eff]" : "");
kernel/cred.c:  if (tsk->cred == tsk->real_cred) {
kernel/cred.c:          if (unlikely(read_cred_subscribers(tsk->cred) < 2 ||
kernel/cred.c:                       creds_are_invalid(tsk->cred)))
kernel/cred.c:                       read_cred_subscribers(tsk->cred) < 1 ||
kernel/cred.c:                       creds_are_invalid(tsk->cred)))
kernel/cred.c:  if (tsk->cred != tsk->real_cred)
kernel/cred.c:          dump_invalid_creds(tsk->cred, "Effective", tsk);
kernel/cred.c:         tsk->real_cred, tsk->cred,
kernel/cred.c:         atomic_read(&tsk->cred->usage),
kernel/cred.c:         read_cred_subscribers(tsk->cred));
kernel/fork.c:  atomic_dec(&p->cred->user->processes);
security/security.c:    lsm_early_cred((struct cred *) current->cred);
security/smack/smack_lsm.c:     struct cred *cred = (struct cred *)
current->cred;
security/tomoyo/common.c:           (!uid_eq(task->cred->uid,
GLOBAL_ROOT_UID) ||
security/tomoyo/common.c:            !uid_eq(task->cred->euid,
GLOBAL_ROOT_UID)))


Places that don't use RCU and are broken:

security/smack/smack_lsm.c:     struct smack_known *tkp =
smk_of_task(smack_cred(tsk->cred));

So actually, the number of places that already don't use RCU accessors
is much higher than the number of places that use them.

> So, currently, maybe we
> should continue to use RCU APIs and leave the __rcu annotation in?
> (Until someone who takes it on himself to remove __rcu annotation and
> fix all the instances). Does that sound good? Or do you want me to
> remove __rcu annotation and get the process started?

I don't think it's a good idea to add more uses of RCU APIs for
->cred; you shouldn't "fix" warnings by making the code more wrong.

If you want to fix this, I think it would be relatively easy to fix
this properly - as far as I can tell, there are only seven places that
you'll have to change, although you may have to split it up into three
patches.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
