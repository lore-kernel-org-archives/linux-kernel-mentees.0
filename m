Return-Path: <SRS0=ws9g=C7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B812AC4727D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 07:38:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E94212396D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 07:38:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Rtb/n564"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E94212396D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67EC484DD4;
	Tue, 22 Sep 2020 07:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7crcDSM5rXZ; Tue, 22 Sep 2020 07:38:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F0D2849DF;
	Tue, 22 Sep 2020 07:38:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3842EC0889;
	Tue, 22 Sep 2020 07:38:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1B65C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 07:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AE22187259
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 07:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQcW9wQzscHL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 07:38:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0773C87258
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 07:38:30 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id o5so18083734qke.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 00:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ipa9AEraiZ4WxMI3j6zKkuZfOCWRU1sXPHy9ssmqhq0=;
 b=Rtb/n5643IKkbrrIlIELkX5PmLOSklXODzADHIRHXSUmSLhBJKELHm4bfivKAUr5HN
 y/xSxFeOFx/xYKXj0aMBEhWPyvJAQ1pZkYlvXRF77XQ31Qt9Fu5DAgydXzyInCNdTlCc
 ciQu0o4jkf2eAx0nlhVm/rYXZpOYVrXLYdYHgLu/FZ9uTn+pUaSg5WHZNEnb2dhL/tfZ
 wNqifnyhyGl1d5VNJiH7yB2y8VhSDaNH50YZ8SqTOAKoVYN8aREZ8gKPBuWQFsZO6zY8
 z7XgLkI7cdd1/wO6z5ahN456lnZnl6Nu8RQhtfYTJGz+KTgNRiyRszUq50LaW85DnTO1
 XKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ipa9AEraiZ4WxMI3j6zKkuZfOCWRU1sXPHy9ssmqhq0=;
 b=qZ1lSndVBU1BeonREzh0t/uMWmXiEhtoqRbuj3IVI1N/cPuhR3uWKyPlU+cbSrviUD
 Br+qs1M90b0oY2raNxecswjOatKzquYtiVHbPcXqOWw1rFa+nThtPlwzxL9U5n/HGQAn
 P81WpfI4iGfn6OPMnBq5Up69LxVukWUr/seI4Ow2hEtG95AKyyzwtW+S5TCRKn6i1NSj
 lxjfvOln8gdxCgbKMyovJPgJVDBJseqhIxCmAT+CQDqtF9O5nQ94iPOPZgjvQSduy5q+
 1/A9zdH+szxo8CsBGMyDd2KWyiX/AOS/sqG6qkB1mbWk3smhaAy3nUfyWXfiUX6OiTq5
 8v3A==
X-Gm-Message-State: AOAM533zOUHgt8EYSFp3iLKTzcE1pbEKEj+fIlPdIi305BtStSVzJiu5
 ZwlW2Y3qDjxmXvkJ1A03ArRbDz4HiHwoLq+hQlSyeQ==
X-Google-Smtp-Source: ABdhPJzfwyFIKFW+VaIZxRBOXXh98PwUCNRMZap9rTzYuhUqDyzm/1OFHDUO5KaoRzBoZ+9g9UvOz7eFd0O7ZqRkld0=
X-Received: by 2002:a37:5684:: with SMTP id k126mr3364853qkb.43.1600760308797; 
 Tue, 22 Sep 2020 00:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com>
 <000000000000cce55c05afe0f8f0@google.com>
 <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
 <20200922072639.GA1578565@kroah.com>
In-Reply-To: <20200922072639.GA1578565@kroah.com>
Date: Tue, 22 Sep 2020 09:38:17 +0200
Message-ID: <CACT4Y+YQf8NJTy9=UUrLiZidV8won0QCYmnVBy-5DFVXumRAPQ@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Brooke Basile <brookebasile@gmail.com>,
 syzbot <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com>,
 Andrey Konovalov <andreyknvl@google.com>, USB list <linux-usb@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Sep 22, 2020 at 9:26 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Sep 22, 2020 at 08:49:39AM +0200, Dmitry Vyukov wrote:
> > On Tue, Sep 22, 2020 at 8:21 AM syzbot
> > <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> > >
> > > Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
> > >
> > > Tested on:
> > >
> > > commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
> > > git tree:       upstream
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
> > > compiler:       gcc (GCC) 10.1.0-syz 20200507
> > >
> > > Note: testing is done by a robot and is best-effort only.
> >
> > Hi Brooke,
> >
> > As far as I understand, UBS is currently completely broken on upstream
> > HEAD, so testing any USB bugs on upstream HEAD will lead to false
> > positive results only.
>
> Broken in what way?  I don't see any bug reports here...

I mean this "USB driver ID matching broke":
https://groups.google.com/g/syzkaller/c/VKfxh__m05w/m/ArzTtar-AgAJ
syzkaller can't test usb, nor reproduce any existing bugs on the upstream tree.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
