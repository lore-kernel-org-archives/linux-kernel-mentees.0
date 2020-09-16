Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0CAC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 07:23:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27F602076B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 07:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4n7y5xK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27F602076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D9C3F84BBE;
	Wed, 16 Sep 2020 07:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MYhDpIZLqjbP; Wed, 16 Sep 2020 07:23:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F75584A7E;
	Wed, 16 Sep 2020 07:23:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33F08C0859;
	Wed, 16 Sep 2020 07:23:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 975A4C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 85D8784AD2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESYALQ5MPr5s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:23:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A65C584A7E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 07:23:45 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id w1so5250981edr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=3qpS6WUSLKicnIX+rTZeMXvSPqkRlD+0MIrmHqHOoDI=;
 b=X4n7y5xKOMOU/dwRJujZO7VNGw8G8DGYjWCsEhnYGagFnYakPszjyFgUYD+fBRR10m
 EKLB/C/mh2HNPaJX5Xx4gG8q5TYtynwKwa3DsHcxNnMaNWlNUNX5URgncbrrwztD1pxF
 JPZ1zhlZD4eg2b+h5GNurod8AR5xYM7RPv0Lj0ry5E1ihdd0FW+jvg0Vd36k9ZLGlC7j
 RBuMRhl0odjmx0vQ8BjHH/zXW9nSk40Hxxbv9M0niOoZacOQOH9H7n953GWL2raHUcqi
 RkNJsHp/5i6x1Y9J674WcPFG7AtDbi8N8dgAzSRx+gTLbySjubkw0zblb2QCtGa5noh5
 L53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=3qpS6WUSLKicnIX+rTZeMXvSPqkRlD+0MIrmHqHOoDI=;
 b=CXTX8e3oRmKdTAdT8CqsKdkRPfcyUM7X0PkKRgY62aCkXktZnw4rJwhm82TFjuMG8S
 GNWS3I/uYXDA5mCUSunKkah3uUNJ5K5XGKf8Cwwik7b4QzxvwiScAcH+3pkqE4qAzqCD
 u+wwYJW6KB1MY+VQlflISv3CfToMu+nuRgrXMGv8n3t6miqHsg9jpH3yuXUT8fjplX6G
 pMLEZPakFnrrfVsQ3FG7O+3gL/5+7qpHSkORBgCbR1pvsfWDl0k7xt0Cd0cOG9kh0Df+
 ZRVYlh3XVGJuKQoykhj8S7M3CU9DDwZbEvv/DDprsidhb43r3VRJrVliN8T+lM2mr6ZD
 osug==
X-Gm-Message-State: AOAM533KRU0LzNTI+sao9dGNg1gi0/Q6534m8vU9fAco+HoriGyZ0N83
 4IjynRCS5LUWacC2v3XSlz8=
X-Google-Smtp-Source: ABdhPJyHINVfAkzlOIaGZRzsNM2IlHYfVOsD53DSe89BrU61Lt3WQLVdBhdRQlLBgSCcJXbdBhGJ6A==
X-Received: by 2002:a50:cf46:: with SMTP id d6mr26475345edk.339.1600241023983; 
 Wed, 16 Sep 2020 00:23:43 -0700 (PDT)
Received: from felia ([2001:16b8:2dec:c500:15b1:3554:3841:68b])
 by smtp.gmail.com with ESMTPSA id dm22sm13612485edb.49.2020.09.16.00.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 00:23:43 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 16 Sep 2020 09:23:42 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dmitry Vyukov <dvyukov@google.com>
In-Reply-To: <CACT4Y+a0avH73Fc-391Ft=XB240wxYA4HokgXZPWoejMk0C=ig@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009160909240.10877@felia>
References: <CAOY-YVmJEQZhhOnC16bYyiow8z+B0o5FOsvQKmmXFqaaM-SAug@mail.gmail.com>
 <CAKXUXMzL6B+b0a6yDUSDdhV24jOaQZDiodbBW8OwgU=RCfDE_w@mail.gmail.com>
 <CACT4Y+b+aYP05PG32ofpXG1oXEFBgQ8CYnoDD5ccggOPwc39nw@mail.gmail.com>
 <CAOY-YVmYR70itmk6oNC_7L+o1kxfd2_W0EgCYn4KEQyGK-KPRw@mail.gmail.com>
 <CACT4Y+Yo_m9C1t7AHpVq+5E-RDejMQYpK2eZUk1JTTwo+Lf3-Q@mail.gmail.com>
 <CAOY-YV=Mfu2at2KzoGNszKSEyUpTHzBdbr-SjyVyE_BJBbw_uw@mail.gmail.com>
 <CACT4Y+a0avH73Fc-391Ft=XB240wxYA4HokgXZPWoejMk0C=ig@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: syzkaller <syzkaller@googlegroups.com>, workflows@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On Wed, 16 Sep 2020, Dmitry Vyukov wrote:

> On Tue, Sep 15, 2020 at 4:15 PM Himadri Pandya <himadrispandya@gmail.com> wrote:
> > > On Tue, Sep 15, 2020 at 3:23 PM Himadri Pandya <himadrispandya@gmail.com> wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > Is it correct to mark bugs as "invalid" if they have reproducers but
> > > > > > > the reproducer doesn't trigger any issue on testing current status? If
> > > > > > > not, then what should be done about such bugs?
> > > > > > >
> > > > > > > Thanks & Regards,
> > > > > > > Himadri
> > > > > > >
> > > > > >
> > > > > > Himadri,
> > > > > >
> > > > > > if possible try to determine which commit fixed the issue the
> > > > > > reproducer triggered.
> > > > > >
> > > > > > You can potentially bisect with the reproducer on the git history or
> > > > > > you can simply look in the git log of the affected files if someone
> > > > > > mentioned fixing something related to the trigger.
> > > > > >
> > > > > > That helps to make sure we do not just close reproducers that just
> > > > > > need a lot of time, configuration or luck to hit a certain crash.
> > > > >
> > > > >
> > > > > Hi Himadri,
> > > > >
> > > > > Basically what Lukas said.
> > > > > Bulk closing all of them as "invalid" would be bad for several
> > > > > reasons. Either do some reasonable amount of degging, or wait for
> > > > > syzbot fix bisection, maybe it will shed some light. It should happen
> > > > > after 30 days since last crash IIRC. Also all testing requests/results
> > > > > are shown on the dashboard, so this bit of information is not lost.
> > > >
> > > > Understood.
> > > >
> > > > I incorrectly assumed(before posting this question) that I should mark
> > > > such bugs as invalid and sent the command to syzbot for one such bug.
> > > > Now I understand that it was not the right thing. It doesn't show on
> > > > the dashboard and I don't know how to undo it :(.
> > > >
> > > > Bug's dashboard link -
> > > > https://syzkaller.appspot.com/bug?id=4c7fd5b46451d957a3d8188f393f1982f9753fe7
> > >
> > > Hi Himadri,
> > >
> > > Transitions to terminal states are not undo-able. Consider the same
> > > bug is rediscovered concurrently with one undoing "#syz invalid". Now
> > > we have 2 versions of the same bug and it will be an incomprehensible
> > > mess.
> > >
> >
> > Understood. My sincerest apologies for being naive.
> >
> > My assumption was that commands like "invalid" are similar to the
> > action of submitting a patch, it would generate some discussion about
> > the bug and if it is really invalid, someone with authority(like
> > maintainers) would actually go and mark it as "invalid". I was clearly
> > mistaken. But if we don't have any gatekeeping on such commands and
> > anyone can directly change the status of the bug by merely sending an
> > email to syzbot, isn't it a security issue?
>

Himandri, it works through collective ignorance.

Basically, we assume that the evil people try to do something else :)

Now in case, somebody evil would try to do what you suggest, close some 
syzbot report although it is not fixed, it would simply be found again by 
syzkaller and hence there is a new report.

If you now close many issues and repeatedly do that, Dmitry would notice 
as he maintaining the system.

Usually, people are not evil, though, but just err.

Also, the public syzbot is only one of many instances of syzkaller/syzbot 
running. So, we would notice the mismatch between instances as well.
 
> +workflows
> 
> What you are saying is all true. There is no authorization and anybody
> can close any bug.
> 
> That's the process we could combine from parts we had. Implementing
> proper support with users/permissions/assignees would require:
> 1. Implementing support in syzbot
> 2. Implementing and deploying some form of user identity and
> authorization for kernel developers (emails is not a trusted media on
> its own)
> 3. Finding responsible maintainers for all parts of the kernel and
> making them do this additional work
> 
> All of these are problematic on different fronts. (2) can be replaced
> with use of Bugzilla, but it does not seem to make the problem easier
> overall. So so far we have the process we have.
> 

Dmitry, I agree. For tracking static analysis findings that are subject 
to even more false positive findings (and hence need more triage) and 
that are not automatically re-opened if someone closes them wrongly, this 
situation is as far as I see a real issue when collaborating.

Currently, I am thinking about just using emails or so as identities and 
then have workflows for every user to state who they trust and to which 
degree (just take the finding of X as true, show the rationale of Y but 
let me recheck, totally ignore Z's findings).

Certainly, such efforts and many others would benefit from some basic user 
identity management for kernel developers, though.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
