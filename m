Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56E2C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 14:16:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32ECC2220E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 14:16:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KubDUZKs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32ECC2220E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B8BD785F8D;
	Tue, 15 Sep 2020 14:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LrgTmsIT01M9; Tue, 15 Sep 2020 14:16:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B903384EE2;
	Tue, 15 Sep 2020 14:16:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A26A6C0859;
	Tue, 15 Sep 2020 14:16:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 338F3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 14:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2289584F9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 14:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NGafF4B-MIJ8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 14:15:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2845284EE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 14:15:59 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id e17so3560442wme.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 07:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/l+IerAwo/5CtpKuETy0cKKlUme4nRwW1WskpxlZD/4=;
 b=KubDUZKsE0Enqx01zzwOKu7bos5aBQ2J3CU4HdNiF19/020ULdHNqLmzH/AczEYzMD
 q2FfoYyRs2Td0M5eHmOHEVa59X07JMZXmKXCOPKiRmZCZchG4aa+R/Jp5BGzE9a83VDy
 AHbevmidIKIEe69yN2lI4FfDBjoW/a8zrrDUcdrPBZPLHuEw4BH4OMu1z+9/iNPbk/w2
 RipXHW1a7WBNTkGRbmkC4gsidCQdVwg5r+z5r1NhFl5blK8xrpEUIUjdtOXOO9kcYbev
 O7SgXPPhvppRICr6rmOLKsvV6q2/xaT0YDdgHFnzeMB8CDulR9/OkkaZUT3P1Pbv+uLW
 hI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/l+IerAwo/5CtpKuETy0cKKlUme4nRwW1WskpxlZD/4=;
 b=gd/OLKlE0czHw3FelY+w8tAXCaldqiQvm6vp6xpWKowZ9tPpXTf058hjSb3lfI1UIK
 XsIYU2/J4PQwrtJSuw+iGPh32FWLhEUn/5zNPYgwHTFWiHOqVIqUs63uMHJLjBjBsc25
 tYwTJb1HbfeUn5nB3G/PXf3Rted5gWvCCgF/RNB+qVA7CpSaBCf+ZZqyDwj26A/fT8Fo
 HVdLqZ3jxW8tCRI5FSBPVIt1I42XVDmMNpSJSKBsTyeth7f9rSzO8KLrZNmreKKMohke
 KL+qIscs+J8uLVr/dD/4CgbqNWfgJakXAPBO6RAsY0B54Yon6vPHdTwq/yGhHAJ1jg8u
 pv6w==
X-Gm-Message-State: AOAM530CGrbp9XiJiY9A+vLdXIAPkA2OliIJGmUNAHw409oA7QOI8ota
 hGuwEWo/EexLe2MD+gXOIETeF5LZ3sqcOStJ5pE=
X-Google-Smtp-Source: ABdhPJz28Un8tmbffsye+Bxt2p78/nl6JECk9Ub8WYB46Ctt1MafPjpu4l5CcKKhsMQW+LShV0PhbzPo1ZUkdYnxuN8=
X-Received: by 2002:a7b:c749:: with SMTP id w9mr4722412wmk.29.1600179357574;
 Tue, 15 Sep 2020 07:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAOY-YVmJEQZhhOnC16bYyiow8z+B0o5FOsvQKmmXFqaaM-SAug@mail.gmail.com>
 <CAKXUXMzL6B+b0a6yDUSDdhV24jOaQZDiodbBW8OwgU=RCfDE_w@mail.gmail.com>
 <CACT4Y+b+aYP05PG32ofpXG1oXEFBgQ8CYnoDD5ccggOPwc39nw@mail.gmail.com>
 <CAOY-YVmYR70itmk6oNC_7L+o1kxfd2_W0EgCYn4KEQyGK-KPRw@mail.gmail.com>
 <CACT4Y+Yo_m9C1t7AHpVq+5E-RDejMQYpK2eZUk1JTTwo+Lf3-Q@mail.gmail.com>
In-Reply-To: <CACT4Y+Yo_m9C1t7AHpVq+5E-RDejMQYpK2eZUk1JTTwo+Lf3-Q@mail.gmail.com>
From: Himadri Pandya <himadrispandya@gmail.com>
Date: Tue, 15 Sep 2020 19:45:46 +0530
Message-ID: <CAOY-YV=Mfu2at2KzoGNszKSEyUpTHzBdbr-SjyVyE_BJBbw_uw@mail.gmail.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: syzkaller <syzkaller@googlegroups.com>,
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

On Tue, Sep 15, 2020 at 6:57 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Tue, Sep 15, 2020 at 3:23 PM Himadri Pandya <himadrispandya@gmail.com> wrote:
> > > > > Hi,
> > > > >
> > > > > Is it correct to mark bugs as "invalid" if they have reproducers but
> > > > > the reproducer doesn't trigger any issue on testing current status? If
> > > > > not, then what should be done about such bugs?
> > > > >
> > > > > Thanks & Regards,
> > > > > Himadri
> > > > >
> > > >
> > > > Himadri,
> > > >
> > > > if possible try to determine which commit fixed the issue the
> > > > reproducer triggered.
> > > >
> > > > You can potentially bisect with the reproducer on the git history or
> > > > you can simply look in the git log of the affected files if someone
> > > > mentioned fixing something related to the trigger.
> > > >
> > > > That helps to make sure we do not just close reproducers that just
> > > > need a lot of time, configuration or luck to hit a certain crash.
> > >
> > >
> > > Hi Himadri,
> > >
> > > Basically what Lukas said.
> > > Bulk closing all of them as "invalid" would be bad for several
> > > reasons. Either do some reasonable amount of degging, or wait for
> > > syzbot fix bisection, maybe it will shed some light. It should happen
> > > after 30 days since last crash IIRC. Also all testing requests/results
> > > are shown on the dashboard, so this bit of information is not lost.
> >
> > Understood.
> >
> > I incorrectly assumed(before posting this question) that I should mark
> > such bugs as invalid and sent the command to syzbot for one such bug.
> > Now I understand that it was not the right thing. It doesn't show on
> > the dashboard and I don't know how to undo it :(.
> >
> > Bug's dashboard link -
> > https://syzkaller.appspot.com/bug?id=4c7fd5b46451d957a3d8188f393f1982f9753fe7
>
> Hi Himadri,
>
> Transitions to terminal states are not undo-able. Consider the same
> bug is rediscovered concurrently with one undoing "#syz invalid". Now
> we have 2 versions of the same bug and it will be an incomprehensible
> mess.
>

Understood. My sincerest apologies for being naive.

My assumption was that commands like "invalid" are similar to the
action of submitting a patch, it would generate some discussion about
the bug and if it is really invalid, someone with authority(like
maintainers) would actually go and mark it as "invalid". I was clearly
mistaken. But if we don't have any gatekeeping on such commands and
anyone can directly change the status of the bug by merely sending an
email to syzbot, isn't it a security issue?

Himadri

> But marking one bug in such a way is not the end of the world. We have
> other real bugs marked as invalid. So no worries.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
