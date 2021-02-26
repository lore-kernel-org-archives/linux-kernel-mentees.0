Return-Path: <SRS0=B4mk=H4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55E9C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 05:59:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B8B64EE2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 05:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45B8B64EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D352B6F8E3;
	Fri, 26 Feb 2021 05:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbALjdS8Vqjj; Fri, 26 Feb 2021 05:59:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id DABB26F735;
	Fri, 26 Feb 2021 05:59:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6227C000B;
	Fri, 26 Feb 2021 05:59:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F069EC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 05:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAF3C8425A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 05:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEGYzI55kOFD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 05:59:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 883808424C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 05:59:51 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id i8so8538440iog.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 21:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SUbJkX3+ChwFs5viSnYM7S9ECtxTPFKeIwcxjjxFkE8=;
 b=e3YOIj91iZfaskr8kUU3POmC1+y3wMjvg+H27v7mBd7E/msI941MLffxWLme+copNS
 jDHFWkKw1YeFJs5PVKrcMmcK4LJ9gRxLZdWaQ4f7aGjC/NgfYNOORFaowoz1Su9//5rg
 xn4JQ61vEP1+oLtotjYKy3DshBwjnGNGhyskbW+Lz1f7vKSJwhMB70+Uc1MlA4cL7SsR
 E/hjE4UYPGhviTCkwNXgV4R74Fgx2IAHJggbCqqC5/8MqqQTa4quNpjLR1+ctf3mdeaC
 jQbd0rD39oZroLEkgmFyNPJccNMHp8aRQBOX4ihMkaderKRB+nq6FzmQBHRbj3S0+FBW
 Nzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SUbJkX3+ChwFs5viSnYM7S9ECtxTPFKeIwcxjjxFkE8=;
 b=lbMbKywEI4HtY9nRT/HwB1hHymClRorWwbb+io+Ga1Ts1i5MmQRilVR1ko2FJMd0pf
 f2/DLdeY7g/Um5aJaACH9fnq/cIkQfYjVe75T1J9TKRebp7j/JfDgXhEbLBqGEk2RVcP
 KhJv6bMJ7OuVp9PYi/XuvFnoiOUW2p/Inwzorq9Z9rnL15pf9qgZzk12amApIqgpqHQd
 uAiRd4W98E9PlNdiQ4Sls+h0G8CcLPnR5BSj8R6PS4cf5bInoeiHiuGI6Bf9470rqsaV
 d6rYkiQzoCx0f368t4GH53wzzl+RkZBV2+BZTjgJlZWtavz8tuiDUJLpCf11Yd2/eOip
 qNHQ==
X-Gm-Message-State: AOAM530qBAkzVsixbEbqtyuBJHAPP6UbrQMsN30fu9zzMUcYuowoJYbM
 vm+W4ipSB0opaOCPn6SgP9egQM1ll526ih4r6w4=
X-Google-Smtp-Source: ABdhPJzuSg1UQWeKsgrDpYfnjKaISZo81CZ+CD+r3v2tNd4ZN9NqxgPQtyYHWp0llkR1l6tNb6+g5hOxTccejJtgdoQ=
X-Received: by 2002:a02:866d:: with SMTP id e100mr1347002jai.139.1614319190497; 
 Thu, 25 Feb 2021 21:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20210222075205.19834-1-dwaipayanray1@gmail.com>
 <bcee822d1934772f47702ee257bc735c8f467088.camel@perches.com>
 <CABJPP5AARO3h2mt-piPWuOD3kY_XzNfW-s2mi=btfOayVPURHg@mail.gmail.com>
In-Reply-To: <CABJPP5AARO3h2mt-piPWuOD3kY_XzNfW-s2mi=btfOayVPURHg@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 26 Feb 2021 06:59:39 +0100
Message-ID: <CAKXUXMyShHc8wu1HhVvr5tJYNL+sc_Yc-mfeoosK6hAL-HF_gQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] checkpatch: add verbose mode
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
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

On Thu, Feb 25, 2021 at 7:08 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Thu, Feb 25, 2021 at 11:03 PM Joe Perches <joe@perches.com> wrote:
> >
> > On Mon, 2021-02-22 at 13:22 +0530, Dwaipayan Ray wrote:
> > > Add a new verbose mode to checkpatch. The verbose test
> > > descriptions are read from the checkpatch documentation
> > > file at `Documentation/dev-tools/checkpatch.rst`.
> > >
> > > The verbose mode is optional and can be enabled by the
> > > flag -v or --verbose.
> > >
> > > The documentation file is only parsed by checkpatch.pl
> > > if the verbose mode is enabled. The verbose mode can
> > > not be used together with the --terse option.
> >
> > I don't have any real objection to this patch set, but as this
> > might be added to the Documentation tree and in .rst format,
> > perhaps Jonathan Corbet and/or Mauro Carvalho Chehab might have
> > some opinion.
> >
> > Also I do not want to be a maintainer of this .rst file and
> > likely neither Jon nor Mauro would either.  Perhaps you?
> >
>
> I could take it up if everybody is okay with it!
>

And as I set Dwaipayan on this task on documenting checkpatch, I will
assist in maintaining this file as well. I will also pull some strings
to increase chances that Dwaipayan becomes a longer-term member in
this community and on this maintainer task.

> > Ideally, the patch order would be reversed so the .rst file
> > is added first, then checkpatch updated to use it.
> >
>
> Sure, if Jonathan or Mauro has no objections to it, I will be happy
> to resend it so that it can be picked up properly.
>
> > And _a lot_ more types and descriptive content should be added.
>
> Yes that's for sure. If this makes it I will try to get all of the
> other types in.

I agree as well, probably a critical mass for inclusion is that we
have at least 25% (so roughly 50 rules) documented.

> And if Lukas agrees, a little help from my fellow kernel mentees will
> be nice as well!
>

Completely agree. I will recruit new mentees and go through the
exercises with them, until they are ready to send proper patches to
checkpatch.rst. As the designated maintainer of that file, you will be
busy reviewing, consolidating that content and pushing back if it is
not good enough for inclusion (so just as in the typical "good cop-bad
cop" game: I will motivate and help them to submit, you make sure you
get good content).

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
