Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305A8C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 18:32:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9636B208B6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 18:32:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="lN7k072L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9636B208B6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F396586980;
	Wed, 23 Sep 2020 18:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHBh7-vLm90f; Wed, 23 Sep 2020 18:32:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ADAF28696B;
	Wed, 23 Sep 2020 18:32:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 980F3C0859;
	Wed, 23 Sep 2020 18:32:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52A89C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 18:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3A67F87045
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 18:32:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGyiptayhh0v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 18:32:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7F81186F13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 18:32:27 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 34so206585pgo.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 11:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3dW5iJGyenAT8LbifkLRxPjPziRf60aygTMYbhkN1qo=;
 b=lN7k072L7PwhaHtz3pivg61aa0aNlzxh89ezq6Jn7hwXbMLDydbfYGjXLBCehMo+ni
 JRd1gJUQgKvCrBQEHTLl7UGCRL8J+9AVzqaazZciuQLUxtZNdJWN8wNcRtkikjaqQOAk
 bqz4CTEq1mcF0uDS7LL63uYyaMkl8HGSWZGqwezVLy7CS0teeLbgW58GvqtpA0StkUFV
 7fzO7VARQFI9grM5aY3hBsNBZkxxyvCaqDUTTUSxXTgeZc8nVCsy8G5yO27zx7pKKnB+
 239oPW2yHeq1cFs4+H6YwHSAaYTuXx9uYBm4QP8Mpzghd/XOdSSScPRRZQXeBnoONWbe
 EeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3dW5iJGyenAT8LbifkLRxPjPziRf60aygTMYbhkN1qo=;
 b=b3YsxcQyrZCBH+h1+DkJUIVOyp8fcgSiJ8PZ4UcGdAURJen29GwYop8UOSZyK1CBHY
 Hb9luVoi4Rvn2NqQ1+ZVoAjYUYtTqG+hZ+Bx9mZwXvStZ8rXV7AIv/Op6E6/Io4Ur4/c
 fYkzwTZyDr1+tWk4NgJ4SfdycxY/ac2VStyi7ORpEvkZvIQToo8Sanz6x2mwvuHvvYSR
 VNKE52OpClLUTgJFsO7ATR9U9dpIOFhidKP6oA54dGPK933xXlqkBMNjSEYfPcyrVicq
 vmj4JJih8o9wnctply3dCHmQ6E9s8CalnSJqA0h9uy89Gxj9XQVwNMc0T4YwLjVN8OEO
 VlAA==
X-Gm-Message-State: AOAM533od7krOABS+GP5jCBidboSLsUgNCeX9dhpyehuCmfQykWC2NhJ
 dJNBN8z6MtIhsOI+7uF8EHt/jGDKqBPjQy034eEcwg==
X-Google-Smtp-Source: ABdhPJzmFUliet4TASFFX0KaY/ohZQwTR/4/oMyKhnW5tzJlUCEbPAj9aXkJxCmTrqlS5FD1U/6ZHBMKNsqhE09rGbc=
X-Received: by 2002:a63:2209:: with SMTP id i9mr909164pgi.130.1600885946905;
 Wed, 23 Sep 2020 11:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com>
 <000000000000cce55c05afe0f8f0@google.com>
 <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
 <20200922072639.GA1578565@kroah.com>
 <CACT4Y+YQf8NJTy9=UUrLiZidV8won0QCYmnVBy-5DFVXumRAPQ@mail.gmail.com>
 <f66a9255-80d9-fbed-f99c-3c64ee060146@gmail.com>
 <CAAeHK+zwehY9a4ku56wzBUv2sArV5bfZGtKh6FPNz8a-AtQvyg@mail.gmail.com>
 <8f8706c4-090d-20fe-a4c9-40d99d3a0e1c@gmail.com>
In-Reply-To: <8f8706c4-090d-20fe-a4c9-40d99d3a0e1c@gmail.com>
Date: Wed, 23 Sep 2020 20:32:15 +0200
Message-ID: <CAAeHK+zboT311GNtX0N=Yp_Qph1Gn0XRTJb35HK540GKnOe8LA@mail.gmail.com>
To: Brooke Basile <brookebasile@gmail.com>
Cc: syzbot <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com>,
 USB list <linux-usb@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [Linux-kernel-mentees] INFO: trying to register non-static key
	in ath9k_htc_rxep
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
From: Andrey Konovalov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Sep 23, 2020 at 8:28 PM Brooke Basile <brookebasile@gmail.com> wrote:
>
> On 9/23/20 2:06 PM, Andrey Konovalov wrote:
> > On Wed, Sep 23, 2020 at 7:42 PM Brooke Basile <brookebasile@gmail.com> wrote:
> >>
> >> On 9/22/20 3:38 AM, Dmitry Vyukov wrote:
> >>> On Tue, Sep 22, 2020 at 9:26 AM Greg Kroah-Hartman
> >>> <gregkh@linuxfoundation.org> wrote:
> >>>>
> >>>> On Tue, Sep 22, 2020 at 08:49:39AM +0200, Dmitry Vyukov wrote:
> >>>>> On Tue, Sep 22, 2020 at 8:21 AM syzbot
> >>>>> <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
> >>>>>>
> >>>>>> Hello,
> >>>>>>
> >>>>>> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> >>>>>>
> >>>>>> Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
> >>>>>>
> >>>>>> Tested on:
> >>>>>>
> >>>>>> commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
> >>>>>> git tree:       upstream
> >>>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
> >>>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
> >>>>>> compiler:       gcc (GCC) 10.1.0-syz 20200507
> >>>>>>
> >>>>>> Note: testing is done by a robot and is best-effort only.
> >>>>>
> >>>>> Hi Brooke,
> >>>>>
> >>>>> As far as I understand, UBS is currently completely broken on upstream
> >>>>> HEAD, so testing any USB bugs on upstream HEAD will lead to false
> >>>>> positive results only.
> >>>>
> >>>> Broken in what way?  I don't see any bug reports here...
> >>>
> >>> I mean this "USB driver ID matching broke":
> >>> https://groups.google.com/g/syzkaller/c/VKfxh__m05w/m/ArzTtar-AgAJ
> >>> syzkaller can't test usb, nor reproduce any existing bugs on the upstream tree.
> >>>
> >>
> >> Hi Dmitry,
> >>
> >> Thanks for the heads up and for the link to the thread with the information.
> >>
> >> I recently fixed the following bug:
> >> https://syzkaller.appspot.com/bug?id=cabffad18eb74197f84871802fd2c5117b61febf
> >>
> >> I tested this on my local syzkaller instance before sending it in to
> >> syzbot and the kernel panic was resolved, however I did get "-busid- is
> >> not in match_busid table... skip!" in dmesg-- should this be taken as a
> >> false positive as well?
> >
> > Hi Brooke,
> >
> > Yes, this line means that the kernel is broken and testing USB
> > programs with syzkaller is impossible.
> >
> > Thanks!
> >
> Gotcha, I'll hold off on working on USB bugs for now then.
>
> The above patch has already been applied to the ath-next tree:
>         https://patchwork.kernel.org/patch/11769845/
>
> Should I have the patch reverted or is it safe to assume that any
> regressions will be caught in the -next tree?

If you believe the patch fixes the issue, then it makes sense to keep
it. If it actually doesn't, syzbot will report the bug again once the
patch is in the mainline.

Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
