Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEC9C4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 16:17:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AF3220708
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 16:17:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="i7/525RL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AF3220708
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E83B185DC7;
	Wed, 30 Sep 2020 16:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jEv6z4juzvPb; Wed, 30 Sep 2020 16:17:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6FFFB85DA5;
	Wed, 30 Sep 2020 16:17:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55F6CC0889;
	Wed, 30 Sep 2020 16:17:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2024DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 16:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 15B318708F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 16:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ccxz6GSPP5h3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 16:17:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5CCC086D37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 16:17:02 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id b2so1634787qtp.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 09:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JZY7IkOxUO2WtSrHCoZN7KXpMFh8Rwt0omYmTHUHNl4=;
 b=i7/525RLEklIyW3bA2LXx382jGzfNe95GLBndd9505PWMw9xr1wDofo7qjfs3kB9Pf
 9qnwJQxxOVHy+5RwvUHslqgBNJmATW5BV/DTA6Rpm9OEsnFAhh2SOq8evnWd9GvQq0I+
 B3MFKxgvsZvNbknoLD/ZqxQ6tEIolmOCJXXb0jGCph5SZHW2jmD9y27BF43y/5CNmzYu
 sQ+5kF35xp405EfTwPRUbILNBRSsabNIZIlIYox69xiXXdQMc/5t9NGkd5btnDuTWaRB
 LoaAetDrGqG2px22wE71GnTNX0lQ93ukkYWCA2wWUUp0u/vi4gOJenopnCdZiqTpTon3
 b9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZY7IkOxUO2WtSrHCoZN7KXpMFh8Rwt0omYmTHUHNl4=;
 b=nsRQiMZRfMRRC8tOAGrKlPMm6ujT+4iXAQs4E97hdbH8jZiiIJHZ/Jt54MUWQfF/KT
 kmwRP3tSWWvpCHKhUnq7cdZ4VjIGllyQL+cIZt/WTG5KFSBhoAWrLXpkv8AHP+00g3pH
 VfrGByvJlkWeK4Kxqyd2QLmK/NfauOciLotm0Cyoqtl+a+I9uvyWf9HSImkQ47pknHWR
 yEAJjR7eRkYDIlToqGaUnTprX877tcy8Lxm2/MHY/JJ32cbH7ZNxV92S1IMD/0dhz1BB
 m3U8zppjX1EFF/cZ/1tGNV4lD8gI5sU21WLXmU2ByLd5O6SA3iz6rQJpEaxT5FeDfNdI
 O+9g==
X-Gm-Message-State: AOAM530y2eQg3DNUMhKIznBv7kGlN+vJxoS9RlekmYolcF9YM5GBVg0J
 WF9qFwoKJPBukBx0o5DwYt4R/avCeSWCfBtYZmt/3A==
X-Google-Smtp-Source: ABdhPJxBEkBgZgKjnM7X/Mmh3bTRF1FeA7vARxKZypuzswiC74hpD6oVnVF4qSdlYjVuxr+tF4ZYhzExMKNZwMjmbsI=
X-Received: by 2002:ac8:5215:: with SMTP id r21mr2978567qtn.257.1601482621148; 
 Wed, 30 Sep 2020 09:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAKBsNO=G_t6KrAYXcnMy07HyR8yrFELFoknd=9CnHBM-CJij=A@mail.gmail.com>
 <000000000000b8d3ef05b02efa93@google.com>
 <CACT4Y+aBTN3HzDWADsvD053T=qszSu5wGTCijM-kj9xZXDHTyg@mail.gmail.com>
 <20200926065704.GA661191@kroah.com>
 <f7073a07-d00a-8f0e-c9b1-7878a3c065f8@gmail.com>
In-Reply-To: <f7073a07-d00a-8f0e-c9b1-7878a3c065f8@gmail.com>
Date: Wed, 30 Sep 2020 18:16:49 +0200
Message-ID: <CACT4Y+a3-_C3MJtyo1UC6NcwNPnU2bmhGeGKo7OPh54CVkq1CQ@mail.gmail.com>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Cc: Greg KH <greg@kroah.com>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 syzbot <syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] KMSAN: uninit-value in rt2500usb_probe_hw
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

On Wed, Sep 30, 2020 at 5:57 PM Anant Thazhemadam
<anant.thazhemadam@gmail.com> wrote:
> On 26/09/20 12:27 pm, Greg KH wrote:
> > On Sat, Sep 26, 2020 at 08:53:07AM +0200, Dmitry Vyukov via Linux-kernel-mentees wrote:
> >> On Sat, Sep 26, 2020 at 5:25 AM syzbot
> >> <syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com> wrote:
> >>> Hello,
> >>>
> >>> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> >>>
> >>> Reported-and-tested-by: syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com
> >>>
> >>> Tested on:
> >>>
> >>> commit:         c5a13b33 kmsan: clang-format core
> >>> git tree:       https://github.com/google/kmsan.git master
> >>> kernel config:  https://syzkaller.appspot.com/x/.config?x=41fca8ac7f9e770a
> >>> dashboard link: https://syzkaller.appspot.com/bug?extid=35c80b2190255a410f66
> >>> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> >>>
> >>> Note: testing is done by a robot and is best-effort only.
> >> Hi Anant,
> >>
> >> I see you are testing lots of USB bugs. USB subsystem is currently
> >> broken, testing of any USB bugs will give false "no crash" results,
> >> see:
> >> https://lore.kernel.org/linux-kernel-mentees/CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com/
> > Fixes for this USB problem are in my tree now and should show up in
> > linux-next on Monday.
> >
> > thanks,
> >
> > greg k-h
>
> Is there any chance you could identify the commit that fixes this bug?
> It would help us close the bug for good. :)

I think Greg meant the fix for the general USB brokenness, not a fix
for this syzbot bug. This bug is not fixed to the best of syzbot
knowledge.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
