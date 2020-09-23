Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B49FC2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 18:06:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AB8020791
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 18:06:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="hqmmIkNV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AB8020791
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CCBED2725F;
	Wed, 23 Sep 2020 18:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eh30R8TJng40; Wed, 23 Sep 2020 18:06:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C3AE2228E7;
	Wed, 23 Sep 2020 18:06:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5B90C0889;
	Wed, 23 Sep 2020 18:06:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5381FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 18:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4F10886FE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 18:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kvJiTU7a1Yb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 18:06:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3063986FDF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 18:06:53 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y17so123993plb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 11:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0U50uAgCfIsIyGgZiRRqBYXoW2GhAllBZruo/aY5WFM=;
 b=hqmmIkNVwzeJ/d9WhoMypb12fNMPgW0HnOuOfQe/5KRwGxIk4qlhrEn4atriUL9nbP
 UPyPSm2kQWY0WaoTCqCnkBaOLPuYDpTldqMRtdGdYfAfIe7iM/w14Cv5AebxYgHNEjPw
 WsRT5GU0Cbm5EFqsh1w6XC0rmQg1nvrvzQyVJW8e1rcVEC5E9zHf9dxb+1G1uZW+Chki
 W38N6xG2yZsboLJdOjHPrk8h0Vhnow+mzyYgTE0DL39M9wRs7DWZ/Pm9ozAD5Qr9PLJY
 dWKacUGPBFxq8lgsbV3ORcKBS5/YNpUM7PcQRmOtyqeaa0kurTEhpOGealB78KXZsPvi
 S0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0U50uAgCfIsIyGgZiRRqBYXoW2GhAllBZruo/aY5WFM=;
 b=Gic6X6j2wrUaKzML2TDGPPR8jLKKukEMTKCFvflz5eGJqnV/7u+H5NZBKVqyWmNhc0
 eUhuBaj96MzbK68bK2xyb3JcWyoPt7vQKcejuOkhiWd55//ZXEt1sOu9WtWjNGQCocdc
 F1yzOCl91vCv92cDEV7zvRhakKf1UFUdEbhjI1QG+8TDGxJhtY3Jr05kabneNzLJlgC6
 tVR0XoEdAGSKzwL+lCkr9M03SRcUMhqSArV1oClQHJUPYTvxvNxkFZvd+F6gamvVNsLU
 QSOnyV0nXeCZ+fQQBA35isoO2z+TpjnOeNZbPZl5otkptyEvNhJbPkJF5d4Ur7ft9RDB
 DTpw==
X-Gm-Message-State: AOAM531fThJWsOHKOYZ9NV7Kqc3t8Ug0Q+eqCSmTkjUjPfCFj6wNwav8
 c1Kev49vPxD1a+DZGoqX+EIG/L1cLZDM8ApscA1cFA==
X-Google-Smtp-Source: ABdhPJxoFMfB/2usXfwbgow+XwDTUe4WpAloYRoeP+XKqeQifqZivKdGFdcuS/Tb2DS+Jyy/FdZGNcLMrtka+6yBEko=
X-Received: by 2002:a17:90a:81:: with SMTP id a1mr533519pja.136.1600884412563; 
 Wed, 23 Sep 2020 11:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com>
 <000000000000cce55c05afe0f8f0@google.com>
 <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
 <20200922072639.GA1578565@kroah.com>
 <CACT4Y+YQf8NJTy9=UUrLiZidV8won0QCYmnVBy-5DFVXumRAPQ@mail.gmail.com>
 <f66a9255-80d9-fbed-f99c-3c64ee060146@gmail.com>
In-Reply-To: <f66a9255-80d9-fbed-f99c-3c64ee060146@gmail.com>
Date: Wed, 23 Sep 2020 20:06:41 +0200
Message-ID: <CAAeHK+zwehY9a4ku56wzBUv2sArV5bfZGtKh6FPNz8a-AtQvyg@mail.gmail.com>
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

On Wed, Sep 23, 2020 at 7:42 PM Brooke Basile <brookebasile@gmail.com> wrote:
>
> On 9/22/20 3:38 AM, Dmitry Vyukov wrote:
> > On Tue, Sep 22, 2020 at 9:26 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> >>
> >> On Tue, Sep 22, 2020 at 08:49:39AM +0200, Dmitry Vyukov wrote:
> >>> On Tue, Sep 22, 2020 at 8:21 AM syzbot
> >>> <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
> >>>>
> >>>> Hello,
> >>>>
> >>>> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> >>>>
> >>>> Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
> >>>>
> >>>> Tested on:
> >>>>
> >>>> commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
> >>>> git tree:       upstream
> >>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
> >>>> dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
> >>>> compiler:       gcc (GCC) 10.1.0-syz 20200507
> >>>>
> >>>> Note: testing is done by a robot and is best-effort only.
> >>>
> >>> Hi Brooke,
> >>>
> >>> As far as I understand, UBS is currently completely broken on upstream
> >>> HEAD, so testing any USB bugs on upstream HEAD will lead to false
> >>> positive results only.
> >>
> >> Broken in what way?  I don't see any bug reports here...
> >
> > I mean this "USB driver ID matching broke":
> > https://groups.google.com/g/syzkaller/c/VKfxh__m05w/m/ArzTtar-AgAJ
> > syzkaller can't test usb, nor reproduce any existing bugs on the upstream tree.
> >
>
> Hi Dmitry,
>
> Thanks for the heads up and for the link to the thread with the information.
>
> I recently fixed the following bug:
> https://syzkaller.appspot.com/bug?id=cabffad18eb74197f84871802fd2c5117b61febf
>
> I tested this on my local syzkaller instance before sending it in to
> syzbot and the kernel panic was resolved, however I did get "-busid- is
> not in match_busid table... skip!" in dmesg-- should this be taken as a
> false positive as well?

Hi Brooke,

Yes, this line means that the kernel is broken and testing USB
programs with syzkaller is impossible.

Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
