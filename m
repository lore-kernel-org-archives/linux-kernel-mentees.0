Return-Path: <SRS0=C1jw=3R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB6DC2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 12:20:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0E5124681
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 12:20:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="j8Uvap6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0E5124681
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6E14620117;
	Tue, 28 Jan 2020 12:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqlqrqOdQfJh; Tue, 28 Jan 2020 12:20:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B73F120005;
	Tue, 28 Jan 2020 12:20:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7D32C0175;
	Tue, 28 Jan 2020 12:20:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7853FC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 12:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6100F8695F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 12:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7qr6pxVEwwQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 12:20:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 91A17867C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 12:20:24 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id a22so947689oid.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 04:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hdMgsrTiGncdYOgcbUb9mlCe9olQ7xYagcxpFIcd6+E=;
 b=j8Uvap6kQWXoH1g7T0rcgZ04DrKktnfIlbnAjWMfP6Xff15gUkzPDQyaJudmsL1yDt
 Pb+vDR13QDZ1Ao2bxVflMcVglbNMcWn9vAZMCrxHoLBYDoD6bY2lDG7asXPOG50omDI8
 dk5DIW0lN8yO+3QsjLezBreSJU6k/SztMUCNHfHgKIc2Cg5MDJi/GcJ/7WIZcrVJi1kh
 0zHT2ERZ9mrZaEMn2TbChsjOz7VewVpcBB1/Yf2BzW2fvghPbhLKD4ANgvNUlOkS8sa8
 /8X4lSS3iRshCXuyTobDjzOHPqKpmwm1o88j0yDlyTev/lDOnbA4duQ/Ybwk7zHH2N3s
 UmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hdMgsrTiGncdYOgcbUb9mlCe9olQ7xYagcxpFIcd6+E=;
 b=eOQ6X42UwJ5VxdXACfknZH+jEOB0GB7T4AvtRnLGtO2Lgklkzg0ENn4OxmBGgPfyKq
 EA9tQA1JaGtOesxXybsZ7qGaSwn0QXoS+r9g80x7BqyWUHfc5wxp4Fl6bm1/teZaqn7R
 Mnxj/Pz7MxnzjXlkxm2rKd+cbawG0IouI1AVVFoI1yB2JWxWC26WmD+V25dj75feYLUs
 +Dn7qEo7gs1EITNF9j6BpEsEHQQc2g1WQX3AEX+QMq5aEaW0fY8GJqA45OZm8BlCybP2
 aVfAQxRIdPD7sAO4NK7AsvbZFlkenCzSP/DFarLurvv7+aNRAonz3wei8rigkVsC+JXZ
 3idQ==
X-Gm-Message-State: APjAAAV3Y2L2l3RY/X2uVFQuxiFxkIEBDQtHR82ZnYfd1ORDBJtK/d8N
 prm1vhrzWBHfKHOIRGM/MqJiyBIp61l8He4Xk0ASaA==
X-Google-Smtp-Source: APXvYqwwSdhkpILefSxxqrnVL+VKYNPBwrpZU6sJ2/ZVOmEzczQj7qFdKeGZ86K4BmlSR3uvTKTfV/rKVZTC9oqDg/Y=
X-Received: by 2002:a54:4716:: with SMTP id k22mr2625237oik.39.1580214023416; 
 Tue, 28 Jan 2020 04:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20200128072740.21272-1-frextrite@gmail.com>
 <CAG48ez3ZcO+kVPJVG6XpCPyGUKF2o4UJ6AVdgZXGQ6XJJpcdmg@mail.gmail.com>
 <20200128114818.GA17943@redhat.com>
In-Reply-To: <20200128114818.GA17943@redhat.com>
Date: Tue, 28 Jan 2020 13:19:56 +0100
Message-ID: <CAG48ez2rJZGQyhOcgWe7NwLOxk-CBJugUFMM0Oa9JyuPamRwCg@mail.gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <keescook@chromium.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 James Morris <jamorris@linux.microsoft.com>,
 David Howells <dhowells@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>,
 Shakeel Butt <shakeelb@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
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

On Tue, Jan 28, 2020 at 12:48 PM Oleg Nesterov <oleg@redhat.com> wrote:
> On 01/28, Jann Horn wrote:
> > On Tue, Jan 28, 2020 at 8:28 AM Amol Grover <frextrite@gmail.com> wrote:
> > > task_struct.cred and task_struct.real_cred are annotated by __rcu,
> >
> > task_struct.cred doesn't actually have RCU semantics though, see
> > commit d7852fbd0f0423937fa287a598bfde188bb68c22. For task_struct.cred,
> > it would probably be more correct to remove the __rcu annotation?
>
> Yes, but get_task_cred() assumes it has RCU semantics...

Oh, huh. AFAICS get_task_cred() makes no sense semantically, and I
think it ought to be deleted.


There are the following users at the moment:

rdtgroup_task_write_permission() - uses it for acting on a task as
object, should be using objective credentials instead.

__cgroup1_procs_write() - same thing.

task_state() - should also be using objective credentials instead, you
wouldn't want a task to show up as belonging to root in there just
because it's in the middle of some overlayfs filesystem method or
something like that.

apparmor_getprocattr() - same thing as for task_state()

rpcauth_bind_root_cred() - should also be using objective credentials
instead, if init is in overlayfs or whatever, you probably wouldn't
want that to have an effect here

prepare_kernel_cred() - most callers pass NULL and don't hit this
codepath, and those that don't pass NULL use `current`, so there can
be no concurrent modification. Maybe this could be rewritten to
something like this:

if (daemon) {
  BUG_ON(daemon != current);
  old = get_current_cred();
} else {
 ...
}

or maybe it could just use the objective creds, it shouldn't matter
here, I think.

> To be honest I didn't know we have this helper.

Same here.

> Can't it race with revert_creds() in
> do_faccessat() ?

Yeah, I think you can probably trigger use-after-free reads with that.
I also remember seeing something fishy in Smack at some point that had
similar issues... smack_file_send_sigiotask() does
smk_of_task(smack_cred(tsk->cred)), which looks very wrong.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
