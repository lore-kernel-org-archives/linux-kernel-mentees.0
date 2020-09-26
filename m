Return-Path: <SRS0=QfBv=DD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F375C4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 06:57:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE11E208B6
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 06:57:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="CObr7huB";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BfdSY99C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE11E208B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68E8C874F5;
	Sat, 26 Sep 2020 06:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CdE+riaW-IER; Sat, 26 Sep 2020 06:57:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F027D87476;
	Sat, 26 Sep 2020 06:57:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCAA5C0859;
	Sat, 26 Sep 2020 06:57:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37C76C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 26FD7874F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4rspZ8ureTtB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:57:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5209A87476
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:57:08 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 825235C00A4;
 Sat, 26 Sep 2020 02:57:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sat, 26 Sep 2020 02:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=wE5f4yH95z3eUh4lASNB1J5KK1B
 PdHqAKe8t0/Q8lGs=; b=CObr7huBUHY7keLtXJHyEkoW18gT0kMjApANg938lgK
 w8R+r0qIZUdEZfaL4HzPBHRZrQWJjEmcDKhSoHsIurbBTmirAxIBgwW6r8RxkoYJ
 +foUj5PLN3Lpp36mgvOHRkkRsH9JHO84r/KLt5g/+QBvHCDGzDwabIqGJGhVeZV5
 ccR2nsufMGOmQygbwiaFQuxOx3goDVtlPi/n8UuavM2/rZs+AnAuar3YrgmXYpmY
 1AuWK8nW3YIXnjF+OnbB0Wvci2IcMkz2hZFfUCWlz97kqSl5tKH7+uychn7GttaV
 rb1mdDNR+i+aLEiAauvgLq8oSIBJ4d4/p32/NT4r5Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wE5f4y
 H95z3eUh4lASNB1J5KK1BPdHqAKe8t0/Q8lGs=; b=BfdSY99CS7khUtkSx+C0sR
 qGF3JYhtv14eGEI3gchaGBANiABknixPW/stW5wVzoBt5UrMu+rKpB+GiSJdioEE
 0PFjvhYsdvOru0WFcu95iavZlrY0O1vIc8umIKGqvemb3CwXpl5Tl5reGJr1HW9o
 WvKncRRiL/R3I2lfSh3zKzVnzbvrc8MZ/JsRpJpGyGZhGXWa8poiKqJBzXsnuOPt
 xgBMkVkv4ITnOShiXEtmT2hqj7VV0tB+7B2oJdtKWT9Hh403HgRbVLsHkK3RDqTH
 TpqrZ/6yZdyOtxYjhPYqmCneAl5UxYOIxc1rq7sP9w+F/Bly8d5qSKZlPmMCdVMA
 ==
X-ME-Sender: <xms:QuZuX3zpo84vPpAwzTHVjHPAzmBnuboSrj41jrcDyb80_wyy9SCQGQ>
 <xme:QuZuX_Tt1U3Vj52tqWRw12RQNW2c3W7g-br9mFWnBPccIHYWZiQnHl1Bp84vXHOF5
 wCpcyEjvO32XQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddugddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeegjefffe
 eijeeludejleffteeuffejkedtueekhfelkeejheevlefgffeiheevudenucffohhmrghi
 nhepghhithhhuhgsrdgtohhmpdhshiiikhgrlhhlvghrrdgrphhpshhpohhtrdgtohhmpd
 hkvghrnhgvlhdrohhrghenucfkphepkeefrdekiedrjeegrdeigeenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
 homh
X-ME-Proxy: <xmx:QuZuXxXhL0SjmAq81tc9VVQ5GI9Z3xZ-xlzag4tuvYwNzZRuBMiMmQ>
 <xmx:QuZuXxgg2wY9vkN1KAKJ9cQcyLO_w4FmI71RTLUAChXEK88EanzBUw>
 <xmx:QuZuX5D-hWyKaukwEDeUD3WIOi140PctCOQq8FvfnOQ3fhzTvJ9yvw>
 <xmx:QuZuX84V3JjwTQL6EBsQLBd83NjQQ4OMoo9eSbjPlR-NOIf5wSQqWA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id DAB073064674;
 Sat, 26 Sep 2020 02:57:05 -0400 (EDT)
Date: Sat, 26 Sep 2020 08:57:04 +0200
From: Greg KH <greg@kroah.com>
To: Dmitry Vyukov <dvyukov@google.com>
Message-ID: <20200926065704.GA661191@kroah.com>
References: <CAKBsNO=G_t6KrAYXcnMy07HyR8yrFELFoknd=9CnHBM-CJij=A@mail.gmail.com>
 <000000000000b8d3ef05b02efa93@google.com>
 <CACT4Y+aBTN3HzDWADsvD053T=qszSu5wGTCijM-kj9xZXDHTyg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+aBTN3HzDWADsvD053T=qszSu5wGTCijM-kj9xZXDHTyg@mail.gmail.com>
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Andrey Konovalov <andreyknvl@google.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, Sep 26, 2020 at 08:53:07AM +0200, Dmitry Vyukov via Linux-kernel-mentees wrote:
> On Sat, Sep 26, 2020 at 5:25 AM syzbot
> <syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> >
> > Reported-and-tested-by: syzbot+35c80b2190255a410f66@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         c5a13b33 kmsan: clang-format core
> > git tree:       https://github.com/google/kmsan.git master
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=41fca8ac7f9e770a
> > dashboard link: https://syzkaller.appspot.com/bug?extid=35c80b2190255a410f66
> > compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> >
> > Note: testing is done by a robot and is best-effort only.
> 
> Hi Anant,
> 
> I see you are testing lots of USB bugs. USB subsystem is currently
> broken, testing of any USB bugs will give false "no crash" results,
> see:
> https://lore.kernel.org/linux-kernel-mentees/CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com/

Fixes for this USB problem are in my tree now and should show up in
linux-next on Monday.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
