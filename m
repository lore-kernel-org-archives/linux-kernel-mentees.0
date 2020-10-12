Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F290C43457
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 21:03:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC3702076E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 21:03:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="P+n28kBu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC3702076E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 49C0185B3B;
	Mon, 12 Oct 2020 21:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0tQ2Wy4iF5Cv; Mon, 12 Oct 2020 21:03:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B5DE085AA1;
	Mon, 12 Oct 2020 21:03:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7DCBC0052;
	Mon, 12 Oct 2020 21:03:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94EBEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 21:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6BE3D878BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 21:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1hYX6-pbsSm6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 21:03:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6C035878AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 21:03:08 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id x16so15609330pgj.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 14:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b/TAN4DgDbRq78KqjsPZvJBxycvwlCcdCcdTr+Ek7Og=;
 b=P+n28kBusJXK2wX8qUVrbwldVwyq54gUynSy7mBzZ9CQt7v340G5/ZkQkl2QVkngvZ
 66PjP02ma9k+2+AJ0ci3ZnvC5c720Vhtn51PlaCcyXBQHG/ond0nQFbbeh2TqbhNFtTI
 +6XaOrqijFTUAuHph0GU7zKOA3JLrLRqd2UamYfYe+pvQPSroChvZCtL1dgIgdBx/weo
 TqvpCARRsPxKRIN2cCA7gheHrJkhvw0RoSEH+Fge/ZcDjX1R6ruPhAIoFSAvoGdPqPLr
 hxwrFlEBNAKVpJxfGZm5g8NfHalTD6RhlIVz597pyZEa6AmD2RtK7A0WFHuSQWYE3MsO
 D/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b/TAN4DgDbRq78KqjsPZvJBxycvwlCcdCcdTr+Ek7Og=;
 b=PcSwbvtosM0ULxaAYdgs5V9lbEr6zKwnlxaL+5XNqyESwE2Ljpqx8KCMGF/4MBCn3/
 TKcq07P35HjjDUWY36dykPow5JIhFHXSDhy6c95cCjKEDjlrhJjZJJal0ZzFUCctiFOb
 cJ28G3/+NOVHt+W+BBLwZJ/wAyOFj9bi8pgvhxM9iGGKwmzrFEZIorfbYCOXAW5qYhrj
 mw/yc7eIeeXKv4yw9YP3etdpe65oAVuGG4r6l8SzrE2tz8LGyDojfOWgP0UF08jJY3nx
 Do3u3s1GbANAXxb3JqJR+RdyHlN/xbkwbFa7HxETNVeyX4sp5l2Am4rKQm34FVh6q9JO
 3ymw==
X-Gm-Message-State: AOAM533jg3i35d67p/WdMFII1wHDJSIIIbpsvJ1wPweZhm3cWntKkbuK
 XBPDMbe05eM+Dxo+/ZSdyC+wyASMEa7NlxR8Min1NQ==
X-Google-Smtp-Source: ABdhPJwIqtkqX0s+O7rGfHATFdJHihF17V4UMLnv5pGyiTA1XTsNZtRMs/y29n25CQKI5VwrwyLp6EpyeDim8He9q+c=
X-Received: by 2002:a17:90a:7144:: with SMTP id
 g4mr20595295pjs.80.1602536587672; 
 Mon, 12 Oct 2020 14:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200729201146.537433-1-vitor@massaru.org>
 <20200729203908.GD2655@hirez.programming.kicks-ass.net>
 <CADQ6JjW-=SNjV-abGpGA9NfHD4yGG_bD5FmvW99W-Vo06twkbw@mail.gmail.com>
 <20200804132517.GK2657@hirez.programming.kicks-ass.net>
 <CADQ6JjWzze-VAmg_b9EkS4iVySt5pw8V4FSxYpDFAj8jvBxuGA@mail.gmail.com>
 <20200804142344.GM2674@hirez.programming.kicks-ass.net>
 <CADQ6JjWbCsyWxZKQ5=kkxx8hkaW=mbCjDodPXDAv5vH-=tVvEQ@mail.gmail.com>
In-Reply-To: <CADQ6JjWbCsyWxZKQ5=kkxx8hkaW=mbCjDodPXDAv5vH-=tVvEQ@mail.gmail.com>
Date: Mon, 12 Oct 2020 14:02:56 -0700
Message-ID: <CAFd5g46DzWRzp9yXkpHbtyJuv236E=z7OaWeqXnfuiy6CTBL4A@mail.gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
 Vitor Massaru Iha <vitor@massaru.org>
Cc: Ian Rogers <irogers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, Ingo Molnar <mingo@kernel.org>,
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Aug 4, 2020 at 9:22 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> Hi Peter,
>
> On Tue, Aug 4, 2020 at 11:23 AM <peterz@infradead.org> wrote:
> >
> > On Tue, Aug 04, 2020 at 10:46:21AM -0300, Vitor Massaru Iha wrote:
> > > On Tue, Aug 4, 2020 at 10:25 AM <peterz@infradead.org> wrote:
> > > > On Wed, Jul 29, 2020 at 06:57:17PM -0300, Vitor Massaru Iha wrote:
> > > >
> > > > > The results can be seen this way:
> > > > >
> > > > > This is an excerpt from the test.log with the result in TAP format:
> > > > > [snip]
> > > > > ok 5 - example
> > > > >     # Subtest: min-heap
> > > > >     1..6
> > > > >     ok 1 - test_heapify_all_true
> > > > >     ok 2 - test_heapify_all_false
> > > > >     ok 3 - test_heap_push_true
> > > > >     ok 4 - test_heap_push_false
> > > > >     ok 5 - test_heap_pop_push_true
> > > > >     ok 6 - test_heap_pop_push_false
> > > > > [snip]
> >
> > So ^ is TAP format?
>
> Yep, you can see the spec here: https://testanything.org/tap-specification.html
>
> >
> > > > I don't care or care to use either; what does dmesg do? It used to be
> > > > that just building the self-tests was sufficient and any error would
> > > > show in dmesg when you boot the machine.
> > > >
> > > > But if I now have to use some damn tool, this is a regression.
> > >
> > > If you don't want to, you don't need to use the kunit-tool. If you
> > > compile the tests as builtin and run the Kernel on your machine
> > > the test result will be shown in dmesg in TAP format.
> >
> > That's seems a lot more verbose than it is now. I've recently even done
> > a bunch of tests that don't print anything on success, dmesg is clutter
> > enough already.
>
> What tests do you refer to?
>
> Running the test_min_heap.c, I got this from dmesg:
>
> min_heap_test: test passed
>
> And running min_heap_kunit.c:
>
> ok 1 - min-heap

Gentle poke. I think Vitor was looking for a response. My guess is
that Ian was waiting for a follow up patch.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
