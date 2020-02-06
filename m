Return-Path: <SRS0=nXBU=32=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C74C33CAC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 18:13:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DBA721775
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 18:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="IZJsW0zY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DBA721775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7270020398;
	Thu,  6 Feb 2020 18:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 92a6BW-L3aWT; Thu,  6 Feb 2020 18:13:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CBB4E20387;
	Thu,  6 Feb 2020 18:13:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF009C0881;
	Thu,  6 Feb 2020 18:13:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FDEDC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 18:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EC84A2038D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 18:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFNoloIJyVqO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 18:13:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by silver.osuosl.org (Postfix) with ESMTPS id B72E520387
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 18:13:46 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 21so6469155qki.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Feb 2020 10:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TTs8wgYfod9EDeeOT5qAoSn8Dpf7YckZeXY0U9/3ciE=;
 b=IZJsW0zY0kjjUU/73e88/EBmqEKyvdTQals5hhotYge5FjZOAyJZJ9n4CA0gBPKUpX
 DXDYrQOXmlvqpnFRWU25EZQmAKd6tzW/qkFQST6f235pb0DvJ6oZuFbhlX3d/bvRmSxi
 Hw1Tqn1/KfYmGoSquXwBdTuZ4mBNSzPW1fwJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TTs8wgYfod9EDeeOT5qAoSn8Dpf7YckZeXY0U9/3ciE=;
 b=ZAM7XqQbYJRCyBkSvSx8hgatjG8imX6vUx1/qqHqTLdCCw5SaQmQAPhIscqjKFU5Wy
 gDGWuP/rqzZWv3P8VT74vZ3sf6DXGsQu0BMKlNYIQuzaiuv5d1obTB7KduoFAshL5JyU
 ikVRarWWJP7CdS9gB+S+0CGTnmkPGWjQp+KS/YkGqJVQK7f25iiCZGLRNh7RFiK9brsu
 wRuyId7iViXy6oJ9CteeglE+EJZSmfWAkDpxUAYRNgSuX7sn6cOYXkozLIACYB+AJ/6B
 X9ZOv4N10UYxF0NnaWKQaLpVrP82UxeksAVg+8/8L+vY7Xevb/RERU7G1Ie6Xxcrmfx9
 pKuQ==
X-Gm-Message-State: APjAAAVM5LIrUlLdHyuPzyi6/FafSlOOwXDaEPk6WuO8Try9iEQXLtzG
 nn1IyR7s1v0UFos+IchIG7GqaoqL2J4=
X-Google-Smtp-Source: APXvYqzNFcs9A8AKnIMRsZeO0mKRnEprozd4KO/d66OgD/OZ3IJ/9gxLSuwf4YgwxYxjQwa6Bi5oxg==
X-Received: by 2002:ac8:4542:: with SMTP id z2mr3740785qtn.324.1581012509150; 
 Thu, 06 Feb 2020 10:08:29 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id j206sm24818qke.54.2020.02.06.10.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 10:08:28 -0800 (PST)
Date: Thu, 6 Feb 2020 13:08:28 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Jann Horn <jannh@google.com>
Message-ID: <20200206180828.GA36876@google.com>
References: <20200128072740.21272-1-frextrite@gmail.com>
 <CAG48ez3ZcO+kVPJVG6XpCPyGUKF2o4UJ6AVdgZXGQ6XJJpcdmg@mail.gmail.com>
 <20200128170426.GA10277@workstation-portable>
 <CAG48ez3bLC3dzXn7Ep0YmBENg7wp6TMrocGa6q2RLtYoOdUSxg@mail.gmail.com>
 <20200129065738.GA17486@workstation-portable>
 <CAG48ez2Yc-J1gV4=sTMizySmeFkiZGU+j1NTnZaqyPPo1mYQ=Q@mail.gmail.com>
 <20200206013251.GC55522@google.com>
 <CAG48ez2+7L8YwejaLcm5MN7Z2DZ4d4H5CV6cUyo+j5S9b=tAtQ@mail.gmail.com>
 <20200206164938.GD55522@google.com>
 <CAG48ez26b54UpPhrTn=HGtyPd+fWeVHE5rq37Ots95i8gemTVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG48ez26b54UpPhrTn=HGtyPd+fWeVHE5rq37Ots95i8gemTVQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Feb 06, 2020 at 06:15:56PM +0100, Jann Horn wrote:
> On Thu, Feb 6, 2020 at 5:49 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> > On Thu, Feb 06, 2020 at 12:28:42PM +0100, Jann Horn wrote:
> > [snip]
> > > > > > > > > task_struct.cred doesn't actually have RCU semantics though, see
> > > > > > > > > commit d7852fbd0f0423937fa287a598bfde188bb68c22. For task_struct.cred,
> > > > > > > > > it would probably be more correct to remove the __rcu annotation?
> > > > > > > >
> > > > > > > > Hi Jann,
> > > > > > > >
> > > > > > > > I went through the commit you mentioned. If I understand it correctly,
> > > > > > > > ->cred was not being accessed concurrently (via RCU), hence, a non_rcu
> > > > > > > > flag was introduced, which determined if the clean-up should wait for
> > > > > > > > RCU grace-periods or not. And since, the changes were 'thread local'
> > > > > > > > there was no need to wait for an entire RCU GP to elapse.
> > > > > > >
> > > > > > > Yeah.
> > > > > > >
> > > > > > > > The commit too, as you said, mentions the removal of __rcu annotation.
> > > > > > > > However, simply removing the annotation won't work, as there are quite a
> > > > > > > > few instances where RCU primitives are used. Even get_current_cred()
> > > > > > > > uses RCU APIs to get a reference to ->cred.
> > > > > > >
> > > > > > > Luckily, there aren't too many places that directly access ->cred,
> > > > > > > since luckily there are helper functions like get_current_cred() that
> > > > > > > will do it for you. Grepping through the kernel, I see:
> > > > > [...]
> > > > > > > So actually, the number of places that already don't use RCU accessors
> > > > > > > is much higher than the number of places that use them.
> > > > > > >
> > > > > > > > So, currently, maybe we
> > > > > > > > should continue to use RCU APIs and leave the __rcu annotation in?
> > > > > > > > (Until someone who takes it on himself to remove __rcu annotation and
> > > > > > > > fix all the instances). Does that sound good? Or do you want me to
> > > > > > > > remove __rcu annotation and get the process started?
> > > > > > >
> > > > > > > I don't think it's a good idea to add more uses of RCU APIs for
> > > > > > > ->cred; you shouldn't "fix" warnings by making the code more wrong.
> > > > > > >
> > > > > > > If you want to fix this, I think it would be relatively easy to fix
> > > > > > > this properly - as far as I can tell, there are only seven places that
> > > > > > > you'll have to change, although you may have to split it up into three
> > > > > > > patches.
> > > > > >
> > > > > > Thank you for the detailed analysis. I'll try my best and send you a
> > > > > > patch.
> > > >
> > > > Amol, Jann, if I understand the discussion correctly, objects ->cred
> > > > point (the subjective creds) are never (or never need to be) RCU-managed.
> > > > This makes sense in light of the commit Jann pointed out
> > > > (d7852fbd0f0423937fa287a598bfde188bb68c22).
> [...]
> > > > 3. Also I removed the whole non_rcu flag, and introduced a new put_cred_non_rcu() API
> > > >    which places that task-synchronously use ->cred can overwrite. Callers
> > > >    doing such accesses like access() can use this API instead.
> > >
> > > That's wrong, don't do that.
> > >
> > > ->cred is a reference without RCU semantics, ->real_cred is a
> > > reference with RCU semantics. If there have never been any references
> > > with RCU semantics to a specific instance of struct cred, then that
> > > instance can indeed be freed without an RCU grace period. But it would
> > > be possible for some filesystem code to take a reference to
> > > current->cred, and assign it to some pointer with RCU semantics
> > > somewhere, then drop that reference with put_cred() immediately before
> > > you reach put_cred_non_rcu(); with the result that despite using
> > > put_cred(), the other side doesn't get RCU semantics.
> > >
> > > Just leave the whole ->non_rcu thing exactly as it was.
> >
> > Can you point to an example in the kernel that actually uses ->cred this way?
> > I'm just curious. That is, reads task's ->cred pointer, and assigns it to an
> > RCU managed pointer?
> 
> I'm almost sure that there are no such cases at the moment. However,
> from a maintainability standpoint, I'm still very twitchy about this
> change; the current API encapsulates the RCU weirdness in the standard
> helper functions, but with your proposal, suddenly taking f_cred from
> somewhere and using it as a new task's subjective creds, or something
> like that, would be unsafe.

I agree with you. I talked to Amol and he will remove that part of the diff
when he sends patches. I believe he needs to also split into separate patches
as needed.

thanks,

 - Joel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
