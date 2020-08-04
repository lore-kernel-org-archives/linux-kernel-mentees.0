Return-Path: <SRS0=ILBb=BO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE665C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 14:23:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82CB8208A9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 14:23:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YaID0GqX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82CB8208A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 35D392153F;
	Tue,  4 Aug 2020 14:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOdyqPBvDN19; Tue,  4 Aug 2020 14:23:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 82B112052C;
	Tue,  4 Aug 2020 14:23:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57B41C0733;
	Tue,  4 Aug 2020 14:23:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 971C3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 14:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7FB4787E8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 14:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9jv6t5xUi65G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 14:23:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B20E587E59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 14:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=k3hHT8hBP3vIg+5n2HC1ywURgKIRKUgYzqnMS2vhhdM=; b=YaID0GqXpy1LpLRHHrlA5ZgUdz
 YRGNR6WocYcAEBMUYF6t2biBQQZsEFcHxoQjE9fZYjLOXGJvpnh17wTBwaWVviPibgVhjtzD1VpNl
 CXYJfWd6M0ExGPid892N2ilOazv9V15LYR0KDCJcB58l52fAtPISo6oZohbygZn1JD6R8o3EvvKJ0
 Mht2Ln7RQbdCwW6RIIT8QRChYwE6jcSTh01gvuhnDUVvaKgrbVrfETGDK9EsEGiZovSfSYX3GVzmO
 shjByq9fco8EqvTIr1/L1omF4lOkIZVQX82BF7paNS2+MsJFJuBPh/3IvmeI8gWNmTqqKPz4bK0qP
 LEmOq8jQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2xr0-0004yR-9p; Tue, 04 Aug 2020 14:23:46 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3F2F730477A;
 Tue,  4 Aug 2020 16:23:44 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 281592B7C12A3; Tue,  4 Aug 2020 16:23:44 +0200 (CEST)
Date: Tue, 4 Aug 2020 16:23:44 +0200
From: peterz@infradead.org
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <20200804142344.GM2674@hirez.programming.kicks-ass.net>
References: <20200729201146.537433-1-vitor@massaru.org>
 <20200729203908.GD2655@hirez.programming.kicks-ass.net>
 <CADQ6JjW-=SNjV-abGpGA9NfHD4yGG_bD5FmvW99W-Vo06twkbw@mail.gmail.com>
 <20200804132517.GK2657@hirez.programming.kicks-ass.net>
 <CADQ6JjWzze-VAmg_b9EkS4iVySt5pw8V4FSxYpDFAj8jvBxuGA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADQ6JjWzze-VAmg_b9EkS4iVySt5pw8V4FSxYpDFAj8jvBxuGA@mail.gmail.com>
Cc: Ian Rogers <irogers@google.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, mingo@kernel.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: kunit: add test_min_heap
	test conversion to KUnit
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

On Tue, Aug 04, 2020 at 10:46:21AM -0300, Vitor Massaru Iha wrote:
> On Tue, Aug 4, 2020 at 10:25 AM <peterz@infradead.org> wrote:
> > On Wed, Jul 29, 2020 at 06:57:17PM -0300, Vitor Massaru Iha wrote:
> >
> > > The results can be seen this way:
> > >
> > > This is an excerpt from the test.log with the result in TAP format:
> > > [snip]
> > > ok 5 - example
> > >     # Subtest: min-heap
> > >     1..6
> > >     ok 1 - test_heapify_all_true
> > >     ok 2 - test_heapify_all_false
> > >     ok 3 - test_heap_push_true
> > >     ok 4 - test_heap_push_false
> > >     ok 5 - test_heap_pop_push_true
> > >     ok 6 - test_heap_pop_push_false
> > > [snip]

So ^ is TAP format?

> > I don't care or care to use either; what does dmesg do? It used to be
> > that just building the self-tests was sufficient and any error would
> > show in dmesg when you boot the machine.
> >
> > But if I now have to use some damn tool, this is a regression.
> 
> If you don't want to, you don't need to use the kunit-tool. If you
> compile the tests as builtin and run the Kernel on your machine
> the test result will be shown in dmesg in TAP format.

That's seems a lot more verbose than it is now. I've recently even done
a bunch of tests that don't print anything on success, dmesg is clutter
enough already.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
