Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894C0C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 06:01:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD42D2078D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 06:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="JwFDzXzD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD42D2078D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4002E234BB;
	Wed, 16 Sep 2020 06:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g3MJBe87XOI3; Wed, 16 Sep 2020 06:01:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 97D4C2342E;
	Wed, 16 Sep 2020 06:01:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 754C5C0864;
	Wed, 16 Sep 2020 06:01:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A49DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 52052872CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzkdGL1AWI9P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:01:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 85040872CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:01:23 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id p65so5322784qtd.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 23:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OoeG2Cuh9gthal8rs64Ej/KdXPHzzZUXoOB9MlAxsjU=;
 b=JwFDzXzDrTXDRMZhRWAYZenuirvIt49Iuuh5VLQigOrnpdBBiNcR1JIV6sut59a1nE
 W50r7iGSWrfT9ZRH3dWpcMe2AJEeMObGxTlCBcKwxLGOERgKOu6sQKV6ouQCDODXP95s
 UWms3e9G/ND2i0BnLHzp6dWGrKDpJY75Hpbm61gyvN6aoXSO5R1M6v5vqVRsIIWMtyzN
 szr3nxeAPjY4J7xLO1+58LMivwMMkqgsJzCnTT4xS9lWXyDb19Fbj5TrBJ8PnP+rRUuF
 +EXcpj2lrSTgt52jcvIh3rRK15ecVXchKoQCLIQc+M6Pb7wYTpFKMqJhjL03xd4a7nD6
 3WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OoeG2Cuh9gthal8rs64Ej/KdXPHzzZUXoOB9MlAxsjU=;
 b=R0msWVz5OUFW/bq+3/lkZ8LYP7uYNc5tIx5vMhMS7sEWtJP8z5CtVM0FKUGiveA6Br
 Y5p47E2K3nzKJNF3Is+tnIvwyI35WfnvX5dqtkug4/HYBsFnYywCJRBVdqJgZejR135p
 zzXiGIX28cH879djODnXRGPQPn261vtN+YbMSZ4FfIO9qiCpesct0FD0WkAKzyvs1lmx
 AfsLVQHnBcgyMNVDf2b1rIIeTZV9OetcnC4l6iyAHfohI2UNfq8Eaxe2QtrV+MvRih2r
 nOnfmwAB31/12QnVJFEF/Qc+BbWNATye1JTxvKtEs/jEk92clPEdVLHAYpU8aZPMXRmG
 5Zeg==
X-Gm-Message-State: AOAM530gBN1vaM+NG7g6/gQWoncFM5V5/JzYC2X6jLaF9OkB3Lg8A8iy
 L1oDZapuZyiKE/pmKYKkZINbORivV/dHk7Ikg4Hy6w==
X-Google-Smtp-Source: ABdhPJyl98GRLrn9ReyZLdx9kfRUdABo8ZVVu499OsPCtdmw31K7QAW8HDoVT2dRTYGsWvKqngX0iiA4+ivMWiR0pGM=
X-Received: by 2002:ac8:4806:: with SMTP id g6mr9158036qtq.380.1600236082264; 
 Tue, 15 Sep 2020 23:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAOY-YVmJEQZhhOnC16bYyiow8z+B0o5FOsvQKmmXFqaaM-SAug@mail.gmail.com>
 <CAKXUXMzL6B+b0a6yDUSDdhV24jOaQZDiodbBW8OwgU=RCfDE_w@mail.gmail.com>
 <CACT4Y+b+aYP05PG32ofpXG1oXEFBgQ8CYnoDD5ccggOPwc39nw@mail.gmail.com>
 <CAOY-YVmYR70itmk6oNC_7L+o1kxfd2_W0EgCYn4KEQyGK-KPRw@mail.gmail.com>
 <CACT4Y+Yo_m9C1t7AHpVq+5E-RDejMQYpK2eZUk1JTTwo+Lf3-Q@mail.gmail.com>
 <CAOY-YV=Mfu2at2KzoGNszKSEyUpTHzBdbr-SjyVyE_BJBbw_uw@mail.gmail.com>
In-Reply-To: <CAOY-YV=Mfu2at2KzoGNszKSEyUpTHzBdbr-SjyVyE_BJBbw_uw@mail.gmail.com>
Date: Wed, 16 Sep 2020 08:01:11 +0200
Message-ID: <CACT4Y+a0avH73Fc-391Ft=XB240wxYA4HokgXZPWoejMk0C=ig@mail.gmail.com>
To: Himadri Pandya <himadrispandya@gmail.com>
Cc: syzkaller <syzkaller@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] Question regarding marking bugs as
	"invalid"
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Sep 15, 2020 at 4:15 PM Himadri Pandya <himadrispandya@gmail.com> wrote:
> > On Tue, Sep 15, 2020 at 3:23 PM Himadri Pandya <himadrispandya@gmail.com> wrote:
> > > > > > Hi,
> > > > > >
> > > > > > Is it correct to mark bugs as "invalid" if they have reproducers but
> > > > > > the reproducer doesn't trigger any issue on testing current status? If
> > > > > > not, then what should be done about such bugs?
> > > > > >
> > > > > > Thanks & Regards,
> > > > > > Himadri
> > > > > >
> > > > >
> > > > > Himadri,
> > > > >
> > > > > if possible try to determine which commit fixed the issue the
> > > > > reproducer triggered.
> > > > >
> > > > > You can potentially bisect with the reproducer on the git history or
> > > > > you can simply look in the git log of the affected files if someone
> > > > > mentioned fixing something related to the trigger.
> > > > >
> > > > > That helps to make sure we do not just close reproducers that just
> > > > > need a lot of time, configuration or luck to hit a certain crash.
> > > >
> > > >
> > > > Hi Himadri,
> > > >
> > > > Basically what Lukas said.
> > > > Bulk closing all of them as "invalid" would be bad for several
> > > > reasons. Either do some reasonable amount of degging, or wait for
> > > > syzbot fix bisection, maybe it will shed some light. It should happen
> > > > after 30 days since last crash IIRC. Also all testing requests/results
> > > > are shown on the dashboard, so this bit of information is not lost.
> > >
> > > Understood.
> > >
> > > I incorrectly assumed(before posting this question) that I should mark
> > > such bugs as invalid and sent the command to syzbot for one such bug.
> > > Now I understand that it was not the right thing. It doesn't show on
> > > the dashboard and I don't know how to undo it :(.
> > >
> > > Bug's dashboard link -
> > > https://syzkaller.appspot.com/bug?id=4c7fd5b46451d957a3d8188f393f1982f9753fe7
> >
> > Hi Himadri,
> >
> > Transitions to terminal states are not undo-able. Consider the same
> > bug is rediscovered concurrently with one undoing "#syz invalid". Now
> > we have 2 versions of the same bug and it will be an incomprehensible
> > mess.
> >
>
> Understood. My sincerest apologies for being naive.
>
> My assumption was that commands like "invalid" are similar to the
> action of submitting a patch, it would generate some discussion about
> the bug and if it is really invalid, someone with authority(like
> maintainers) would actually go and mark it as "invalid". I was clearly
> mistaken. But if we don't have any gatekeeping on such commands and
> anyone can directly change the status of the bug by merely sending an
> email to syzbot, isn't it a security issue?

+workflows

What you are saying is all true. There is no authorization and anybody
can close any bug.

That's the process we could combine from parts we had. Implementing
proper support with users/permissions/assignees would require:
1. Implementing support in syzbot
2. Implementing and deploying some form of user identity and
authorization for kernel developers (emails is not a trusted media on
its own)
3. Finding responsible maintainers for all parts of the kernel and
making them do this additional work

All of these are problematic on different fronts. (2) can be replaced
with use of Bugzilla, but it does not seem to make the problem easier
overall. So so far we have the process we have.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
