Return-Path: <SRS0=QfBv=DD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA15C4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 06:53:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57544208B6
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 06:53:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="dift4Z8t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57544208B6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 08133203B8;
	Sat, 26 Sep 2020 06:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TukRghqtjVGi; Sat, 26 Sep 2020 06:53:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 80025203B2;
	Sat, 26 Sep 2020 06:53:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AA68C0859;
	Sat, 26 Sep 2020 06:53:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2EA3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 91FD28750D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CrwCnOqMmnUw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:53:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E7E3887509
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:53:19 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id r8so4193246qtp.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 23:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aLvvuBRQdycEtX1hNlsAY1qAkWuLjqss4U5s0SXoGUY=;
 b=dift4Z8tjU0Ce445UABIK7WDYnjIgcajhY5rOF+2tGytUkEPkkEa7A4rek8uc784U5
 2K7tORos0wmqlyCuCNxxVtBDY81ztf4HcJwAfW/nXHDJXA128hBd6wrUQ6HBhlgcpmi6
 TVsqJ5aKCxifQschGqzTs1sP3eYfJenRITHy8vh27oUrsiGDVdPgBVo5/T7Obyul+95e
 SwUJvLx5qbXrkz1m1hHEUJoY6603wI4Izhy8J5s6UPxK7b84+FfGxWOi6X+fOYvl5uAY
 FAky6Diid1JSQHfxMrAAeoitNpKfFOLFevWya6wLIOVEWzlMAErhl55vcqsEAb4j5gal
 TJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aLvvuBRQdycEtX1hNlsAY1qAkWuLjqss4U5s0SXoGUY=;
 b=dc3gm+Viq6eTGJVuwN6iOfCZs+MRLI2yYWk3C60SaSJeK93VHZhX/I8Z1bY6Ur+Dp8
 P8Dlmhp3hL/rF11IKsk2edTD87aAGxpyPETddkOfJG56Uy8F3SWIi8ZUfd5aW/0QU4Uu
 hy0YkLlTOeOiz3NLv8rGr5wTs6J+E+NJS34b2kbhvIifSpNL0E3Nf2s0wRjOXFDSVOeC
 aVkCI3ORQZqFQufHkJRADxgWJwjzppC3OyYYtEO/ob7I+LWPsC94azLGifBv/89L9hdm
 KkGm8SnWa0MqzlWE6790G6QgJo4Jw4HKNqyGj4t8ygVPMEI545u/LxQIpZ89CIUWpaPB
 4HZg==
X-Gm-Message-State: AOAM532zE1mSiLayLpCJe7bYhAkm3/lqC7D4KxZCCGUarK+H/TswuMbl
 aNIfvBYGWlQ5okHgbEgBPgTh0zuo0wKHA8PTDAa8pA==
X-Google-Smtp-Source: ABdhPJzpV39Mkz7QDs8SD8oXqAzRHZ0eYUVMZqHjk8Ot7Lqe/Sgo098zK8WMZ9hvvjDCqMhL1J3xo5gPkXXyrgiEl0o=
X-Received: by 2002:ac8:4658:: with SMTP id f24mr3297636qto.158.1601103198676; 
 Fri, 25 Sep 2020 23:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAKBsNO=G_t6KrAYXcnMy07HyR8yrFELFoknd=9CnHBM-CJij=A@mail.gmail.com>
 <000000000000b8d3ef05b02efa93@google.com>
In-Reply-To: <000000000000b8d3ef05b02efa93@google.com>
Date: Sat, 26 Sep 2020 08:53:07 +0200
Message-ID: <CACT4Y+aBTN3HzDWADsvD053T=qszSu5wGTCijM-kj9xZXDHTyg@mail.gmail.com>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Cc: Andrey Konovalov <andreyknvl@google.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Alexander Potapenko <glider@google.com>,
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

On Sat, Sep 26, 2020 at 5:25 AM syzbot
<syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>
> Reported-and-tested-by: syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         c5a13b33 kmsan: clang-format core
> git tree:       https://github.com/google/kmsan.git master
> kernel config:  https://syzkaller.appspot.com/x/.config?x=41fca8ac7f9e770a
> dashboard link: https://syzkaller.appspot.com/bug?extid=35c80b2190255a410f66
> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
>
> Note: testing is done by a robot and is best-effort only.

Hi Anant,

I see you are testing lots of USB bugs. USB subsystem is currently
broken, testing of any USB bugs will give false "no crash" results,
see:
https://lore.kernel.org/linux-kernel-mentees/CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com/
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
