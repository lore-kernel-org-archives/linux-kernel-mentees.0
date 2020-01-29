Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B07C35240
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 14:15:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97F872070E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 14:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="gFolVnVB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97F872070E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 65A4586FEA;
	Wed, 29 Jan 2020 14:15:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5-Dhx93Ssdtg; Wed, 29 Jan 2020 14:15:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CE88585C4C;
	Wed, 29 Jan 2020 14:15:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B69C9C0178;
	Wed, 29 Jan 2020 14:15:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2486BC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 14:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1B81085F0E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 14:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3uiQ052E6_rZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 14:15:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 506B585EC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 14:15:24 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id z9so15633721oth.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 06:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gaK0UAbJtL0uxpjJEmYb9zSSzbq8Eo54UUTLP0zD1Ao=;
 b=gFolVnVBt04bVd0dl76dVied0P9GBbsNVT7S2sVu2lTG9L713zC+RV2GMjdWUbTqlz
 gqO7eoPLnCn0pIQFlY7S/XeXrbyuj4F96cWsgSxLf3yXTSJWn+abHFCkX5NC7prQv0p3
 RyxkPsssvpXaKdjBDFIZ4XqyOa5u3mM+tRN1Q/zdMBFDyZC7FX82+iZWQK8eOgF/6d6p
 sLo0bKPxljgKZdsKE2NBRKfCuB3smjELvJ/UheJ8SHGeBqkiLcHI0XBYDyE/SyhdE820
 x2xM5grYaS0bPsIMeE/z+qtQ8GikqhRFRoIi187G6DqTAhpkfh+K5mBs0ZOK+N84QwNo
 TOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gaK0UAbJtL0uxpjJEmYb9zSSzbq8Eo54UUTLP0zD1Ao=;
 b=T9AU2P0IIzeDfUfgQ/zcuu53rcCUCO45QfwS7dHr9TQZHF9sk0QkcNgHrITxmciOfk
 11O6lNipDRNapw7ifz59KzdyBEYQ6UIdUsDSs7X0SMby8bJ6UVv7cJozuuxHNs2nXsBp
 Oaw56GAzeb54fWBcb9qTzJr9UsTRLzGhkmkEc9BoNBpo19qfRuP0xSfhDlgv7U0J+xnU
 rz7nmXvNupGyQ+xCajboQ3RckgUwBqAXl69uNEMC7uXX9MlUhWBRICbjhN1i4F+bL+DP
 QFLkvKY+0nXR8pEenSiGD9tsh7iTLzMIRGiGltNpzEeiSQf81aQDKRuAfm39O7N51o5t
 gpuA==
X-Gm-Message-State: APjAAAWmuAUiHlaHYkxOBUz7vCvpY0U1USRPjOKQPJaptevaFJKeCytK
 LMkI0KiSv7vJLBCMMK/WbeB7PfhWbA/wfenNM6w+Og==
X-Google-Smtp-Source: APXvYqytFER0ez+KO+YLGNjnwB2XdBzkqyPzOp42lBOeEaY5qyOiE4r2GoLd8mXSXXbq7qL/jvrpfhLgYAXm4YfZYM4=
X-Received: by 2002:a9d:4f11:: with SMTP id d17mr19556346otl.228.1580307323086; 
 Wed, 29 Jan 2020 06:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20200128072740.21272-1-frextrite@gmail.com>
 <CAG48ez3ZcO+kVPJVG6XpCPyGUKF2o4UJ6AVdgZXGQ6XJJpcdmg@mail.gmail.com>
 <20200128170426.GA10277@workstation-portable>
 <CAG48ez3bLC3dzXn7Ep0YmBENg7wp6TMrocGa6q2RLtYoOdUSxg@mail.gmail.com>
 <20200129065738.GA17486@workstation-portable>
In-Reply-To: <20200129065738.GA17486@workstation-portable>
Date: Wed, 29 Jan 2020 15:14:56 +0100
Message-ID: <CAG48ez2Yc-J1gV4=sTMizySmeFkiZGU+j1NTnZaqyPPo1mYQ=Q@mail.gmail.com>
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

On Wed, Jan 29, 2020 at 7:57 AM Amol Grover <frextrite@gmail.com> wrote:
> On Tue, Jan 28, 2020 at 08:09:17PM +0100, Jann Horn wrote:
> > On Tue, Jan 28, 2020 at 6:04 PM Amol Grover <frextrite@gmail.com> wrote:
> > > On Tue, Jan 28, 2020 at 10:30:19AM +0100, Jann Horn wrote:
> > > > On Tue, Jan 28, 2020 at 8:28 AM Amol Grover <frextrite@gmail.com> wrote:
> > > > > task_struct.cred and task_struct.real_cred are annotated by __rcu,
> > > >
> > > > task_struct.cred doesn't actually have RCU semantics though, see
> > > > commit d7852fbd0f0423937fa287a598bfde188bb68c22. For task_struct.cred,
> > > > it would probably be more correct to remove the __rcu annotation?
> > >
> > > Hi Jann,
> > >
> > > I went through the commit you mentioned. If I understand it correctly,
> > > ->cred was not being accessed concurrently (via RCU), hence, a non_rcu
> > > flag was introduced, which determined if the clean-up should wait for
> > > RCU grace-periods or not. And since, the changes were 'thread local'
> > > there was no need to wait for an entire RCU GP to elapse.
> >
> > Yeah.
> >
> > > The commit too, as you said, mentions the removal of __rcu annotation.
> > > However, simply removing the annotation won't work, as there are quite a
> > > few instances where RCU primitives are used. Even get_current_cred()
> > > uses RCU APIs to get a reference to ->cred.
> >
> > Luckily, there aren't too many places that directly access ->cred,
> > since luckily there are helper functions like get_current_cred() that
> > will do it for you. Grepping through the kernel, I see:
[...]
> > So actually, the number of places that already don't use RCU accessors
> > is much higher than the number of places that use them.
> >
> > > So, currently, maybe we
> > > should continue to use RCU APIs and leave the __rcu annotation in?
> > > (Until someone who takes it on himself to remove __rcu annotation and
> > > fix all the instances). Does that sound good? Or do you want me to
> > > remove __rcu annotation and get the process started?
> >
> > I don't think it's a good idea to add more uses of RCU APIs for
> > ->cred; you shouldn't "fix" warnings by making the code more wrong.
> >
> > If you want to fix this, I think it would be relatively easy to fix
> > this properly - as far as I can tell, there are only seven places that
> > you'll have to change, although you may have to split it up into three
> > patches.
>
> Thank you for the detailed analysis. I'll try my best and send you a
> patch.

While you can CC me on that, I'm not a kernel maintainer; you should
send patches to the people who maintain the areas of kernel code that
you're modifying. (kernel/cred.c has no specific maintainer; for that
file, I'd probably try sending patches to Andrew Morton, Oleg
Nesterov, David Howells and Eric Biederman, as well as the
linux-kernel@ mailinglist.)

> But before I start I want to make sure one thing. The changes
> done by the commit you mentioned (which introduced non_rcu flag), should
> be now reverted, right?

No.

> Since, prior to the commit RCU semantics were
> there and RCU was being used (which was unnecessary) and the fix merely,
> removed these (unnecessary) RCU usages (with checks to either use them
> or not, but now we actually don't use RCU for subjective credentials).
>
> So, now what's left is the unused RCU code (which needs to be removed)
> and the changes done in the temporary fix (which would be reverted since
> we don't want to use RCU).

No. Instances of `struct cred` *can* still have an RCU-protected
lifetime; but only certain references to it have RCU semantics.
{task}->cred doesn't have RCU semantics, but {task}->real_cred does
have RCU semantics, and those two can point to the same object.

__rcu annotations mark that a *reference* has RCU semantics. Lack of
__rcu annotation means that the *reference* does not have RCU
semantics, but the object it points to can still have a RCU-protected
lifetime.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
