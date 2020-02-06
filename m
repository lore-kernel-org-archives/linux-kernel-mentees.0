Return-Path: <SRS0=nXBU=32=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D64C33CAC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 17:16:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D1D3214AF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 17:16:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="UxuR6NNz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D1D3214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1018A85FC7;
	Thu,  6 Feb 2020 17:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALKLJpHHa3bN; Thu,  6 Feb 2020 17:16:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6ADE285F9A;
	Thu,  6 Feb 2020 17:16:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FE00C1D81;
	Thu,  6 Feb 2020 17:16:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99119C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 17:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 82D1E85FA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 17:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qmTcU8psN4Jy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 17:16:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A1E6585F9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 17:16:23 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id b18so5356137oie.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Feb 2020 09:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D+Jg3oYjYPhlt3pP3rA+Wq6ivbf9LPTqafp8/8ynRmA=;
 b=UxuR6NNzVqlQaJrSLkDO3DJXOSlWTlu7R/p7g2zdtffN5tGATXtxPL8Kf3G5c6DY1t
 4+5W2lLyuneut30txEk0W17j4OJVktgb/quU7ZyJ+Owdb3bXI/o9qeib5PvzuHAhIFZb
 mXsE2hsLgIcLSRn7r/8AWjSwEEKN89vpkmBwjuo4UxUx8yuxIpyMtpVvrreogiKqfwAh
 thctvtTk8Tb6yH3JBWlunYVgbQr2FTU+7vtHpDw7Sfkt8TMC4ieo9QqRsW5W6CysUoJU
 14og9n1Ap1SDGuK+NoWUEcXGWyPH7QSqr3bWSrPoIpwO6eNVC8blkXoKfm2ah61INu85
 uV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D+Jg3oYjYPhlt3pP3rA+Wq6ivbf9LPTqafp8/8ynRmA=;
 b=S+zJpbmQGXRnm1TmYJ4sh/W+4eFHaZegg2IRJCTRZXyVQ16gzy3QE0CL6daNx08EvX
 jKtU2sWjw0meEijQDTAHTsSxgE9cfyKNJIui4xv5rP/dC6DkFHKD4UOoorAFq7e1BopB
 pv2+8qGs4L86B7qZf/8VcQcSRYY+mZgxmk9AxoIfI6U5C8mSlzAtU6M0PtpTdTaYBOeR
 HhbERjtHGm6QgRMv4+uh8TGAXTKnWQc0pmriVf5hF/j+0GFpOyDZiau/kWSPf0C3lUtN
 MXmADXlb410u116PahiV1YuyD1BfZ03z8BiaJoSXQ/HrU09XG0+0pu4O6pGR7WWkOHXZ
 tAEA==
X-Gm-Message-State: APjAAAXBm/0y5Rf3tj5WHTp5c6Y5abmi8tmDJvcJlxrxhEGWS3X/N8J2
 a9gMfUx8WK34vpskI23Ix4aSgaejpWLFV7QI7LqVAw==
X-Google-Smtp-Source: APXvYqx1VVsPuxDNq7h5DVZ64q2HR55kXOIntYw2CUb1UyIz/XuetWNKZnyJ+eF+wiPqYfbS2Vc9HN4we2qFRged1JM=
X-Received: by 2002:aca:b187:: with SMTP id a129mr7775530oif.175.1581009382423; 
 Thu, 06 Feb 2020 09:16:22 -0800 (PST)
MIME-Version: 1.0
References: <20200128072740.21272-1-frextrite@gmail.com>
 <CAG48ez3ZcO+kVPJVG6XpCPyGUKF2o4UJ6AVdgZXGQ6XJJpcdmg@mail.gmail.com>
 <20200128170426.GA10277@workstation-portable>
 <CAG48ez3bLC3dzXn7Ep0YmBENg7wp6TMrocGa6q2RLtYoOdUSxg@mail.gmail.com>
 <20200129065738.GA17486@workstation-portable>
 <CAG48ez2Yc-J1gV4=sTMizySmeFkiZGU+j1NTnZaqyPPo1mYQ=Q@mail.gmail.com>
 <20200206013251.GC55522@google.com>
 <CAG48ez2+7L8YwejaLcm5MN7Z2DZ4d4H5CV6cUyo+j5S9b=tAtQ@mail.gmail.com>
 <20200206164938.GD55522@google.com>
In-Reply-To: <20200206164938.GD55522@google.com>
Date: Thu, 6 Feb 2020 18:15:56 +0100
Message-ID: <CAG48ez26b54UpPhrTn=HGtyPd+fWeVHE5rq37Ots95i8gemTVQ@mail.gmail.com>
To: Joel Fernandes <joel@joelfernandes.org>
Cc: Kees Cook <keescook@chromium.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, James Morris <jamorris@linux.microsoft.com>,
 kernel list <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Shakeel Butt <shakeelb@google.com>,
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

On Thu, Feb 6, 2020 at 5:49 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> On Thu, Feb 06, 2020 at 12:28:42PM +0100, Jann Horn wrote:
> [snip]
> > > > > > > > task_struct.cred doesn't actually have RCU semantics though, see
> > > > > > > > commit d7852fbd0f0423937fa287a598bfde188bb68c22. For task_struct.cred,
> > > > > > > > it would probably be more correct to remove the __rcu annotation?
> > > > > > >
> > > > > > > Hi Jann,
> > > > > > >
> > > > > > > I went through the commit you mentioned. If I understand it correctly,
> > > > > > > ->cred was not being accessed concurrently (via RCU), hence, a non_rcu
> > > > > > > flag was introduced, which determined if the clean-up should wait for
> > > > > > > RCU grace-periods or not. And since, the changes were 'thread local'
> > > > > > > there was no need to wait for an entire RCU GP to elapse.
> > > > > >
> > > > > > Yeah.
> > > > > >
> > > > > > > The commit too, as you said, mentions the removal of __rcu annotation.
> > > > > > > However, simply removing the annotation won't work, as there are quite a
> > > > > > > few instances where RCU primitives are used. Even get_current_cred()
> > > > > > > uses RCU APIs to get a reference to ->cred.
> > > > > >
> > > > > > Luckily, there aren't too many places that directly access ->cred,
> > > > > > since luckily there are helper functions like get_current_cred() that
> > > > > > will do it for you. Grepping through the kernel, I see:
> > > > [...]
> > > > > > So actually, the number of places that already don't use RCU accessors
> > > > > > is much higher than the number of places that use them.
> > > > > >
> > > > > > > So, currently, maybe we
> > > > > > > should continue to use RCU APIs and leave the __rcu annotation in?
> > > > > > > (Until someone who takes it on himself to remove __rcu annotation and
> > > > > > > fix all the instances). Does that sound good? Or do you want me to
> > > > > > > remove __rcu annotation and get the process started?
> > > > > >
> > > > > > I don't think it's a good idea to add more uses of RCU APIs for
> > > > > > ->cred; you shouldn't "fix" warnings by making the code more wrong.
> > > > > >
> > > > > > If you want to fix this, I think it would be relatively easy to fix
> > > > > > this properly - as far as I can tell, there are only seven places that
> > > > > > you'll have to change, although you may have to split it up into three
> > > > > > patches.
> > > > >
> > > > > Thank you for the detailed analysis. I'll try my best and send you a
> > > > > patch.
> > >
> > > Amol, Jann, if I understand the discussion correctly, objects ->cred
> > > point (the subjective creds) are never (or never need to be) RCU-managed.
> > > This makes sense in light of the commit Jann pointed out
> > > (d7852fbd0f0423937fa287a598bfde188bb68c22).
[...]
> > > 3. Also I removed the whole non_rcu flag, and introduced a new put_cred_non_rcu() API
> > >    which places that task-synchronously use ->cred can overwrite. Callers
> > >    doing such accesses like access() can use this API instead.
> >
> > That's wrong, don't do that.
> >
> > ->cred is a reference without RCU semantics, ->real_cred is a
> > reference with RCU semantics. If there have never been any references
> > with RCU semantics to a specific instance of struct cred, then that
> > instance can indeed be freed without an RCU grace period. But it would
> > be possible for some filesystem code to take a reference to
> > current->cred, and assign it to some pointer with RCU semantics
> > somewhere, then drop that reference with put_cred() immediately before
> > you reach put_cred_non_rcu(); with the result that despite using
> > put_cred(), the other side doesn't get RCU semantics.
> >
> > Just leave the whole ->non_rcu thing exactly as it was.
>
> Can you point to an example in the kernel that actually uses ->cred this way?
> I'm just curious. That is, reads task's ->cred pointer, and assigns it to an
> RCU managed pointer?

I'm almost sure that there are no such cases at the moment. However,
from a maintainability standpoint, I'm still very twitchy about this
change; the current API encapsulates the RCU weirdness in the standard
helper functions, but with your proposal, suddenly taking f_cred from
somewhere and using it as a new task's subjective creds, or something
like that, would be unsafe.

> I think such an example would be the point that the commit you mentioned
> addresses. The commit basically says "as long as nobody does get_cred() on
> the task_struct ->cred, we are good, but if somebody does do it, then we have
> to deferred-free it".  But I could not find such an example.
>
> That said, I agree the removal of non_rcu can be considered out of scope for
> this patch.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
