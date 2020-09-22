Return-Path: <SRS0=ws9g=C7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0888C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 07:26:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 158B921548
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 07:26:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmVAUH0/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 158B921548
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 75A5786388;
	Tue, 22 Sep 2020 07:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9S9WfiDX4X8T; Tue, 22 Sep 2020 07:26:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5E4BB86382;
	Tue, 22 Sep 2020 07:26:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 514E0C0889;
	Tue, 22 Sep 2020 07:26:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE67AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 07:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 95ACA8577F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 07:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PAjly9ic37CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 07:26:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E423E8577C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 07:26:18 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E454F21548;
 Tue, 22 Sep 2020 07:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600759578;
 bh=6W0XkHx2K/Vd9wq6GmgFfBTc3at6ccIg1XLMoqvY3qc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QmVAUH0/9egqBVNOJ85nxBMSUC7nRGN08l2BQ/26gRHcqOoXUd9TMu1Klp9I2U5v5
 SZ9EfDFUdR21GmYVgwjkspxCgXsPtuF7vNjZCFl+RiNgyUYyRN4YvX+rDiijMGU0cf
 aMYt5RonC5JJkAORGjImLh6hKua323T5+dOqTGfE=
Date: Tue, 22 Sep 2020 09:26:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Vyukov <dvyukov@google.com>
Message-ID: <20200922072639.GA1578565@kroah.com>
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com>
 <000000000000cce55c05afe0f8f0@google.com>
 <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Sep 22, 2020 at 08:49:39AM +0200, Dmitry Vyukov wrote:
> On Tue, Sep 22, 2020 at 8:21 AM syzbot
> <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> >
> > Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
> > git tree:       upstream
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
> > dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
> > compiler:       gcc (GCC) 10.1.0-syz 20200507
> >
> > Note: testing is done by a robot and is best-effort only.
> 
> Hi Brooke,
> 
> As far as I understand, UBS is currently completely broken on upstream
> HEAD, so testing any USB bugs on upstream HEAD will lead to false
> positive results only.

Broken in what way?  I don't see any bug reports here...

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
