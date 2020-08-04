Return-Path: <SRS0=ILBb=BO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033ADC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 16:22:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D05EF2070A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 16:22:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="vY8v/QkB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D05EF2070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A29B687E80;
	Tue,  4 Aug 2020 16:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFrP38Ra3Gnh; Tue,  4 Aug 2020 16:22:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3D74187E59;
	Tue,  4 Aug 2020 16:22:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B5E3C0051;
	Tue,  4 Aug 2020 16:22:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 766F2C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 16:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 65CBE87E80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 16:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s7KaKzNezmLf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 16:22:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
 [209.85.219.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ABE9787E59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 16:22:40 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id p191so6022573ybg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 Aug 2020 09:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0pnsFML9kOr1mpGxswyZ75m8dhfY+/2C5+vBWHJn45U=;
 b=vY8v/QkBFvvM97vcv7qQBuKoB9WH0zYIDrB/Jg+3hS/ZIlJMvkTJ2QqnjQVLwNr5GS
 70mPlcS16tJ4QdDthmPcYfqyrGSCqfsewvOHtr+ULLBgLtz1eJcNeuRW+ayioA/2r4PG
 2Llon0xGXHDlvSR1EAzAExe9pkZ2u/+oUt7B10Bk8LxduhynTXitcaRLhMsb7vKMu3g+
 pHUXHfJprB9WtwemXG/s6roSqgHuanUmc790shYPUpZVULOrXJkloxZlDDHzntVqVSVt
 IpuqKoD4FzPDWGELc4e/BRPfvSuLrne8m57IHgAFuteKzrA+4g/0fcDXqYlsoQHd5x1w
 FBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0pnsFML9kOr1mpGxswyZ75m8dhfY+/2C5+vBWHJn45U=;
 b=fuNO5fTysu/tplzNwkx2yuwAMiHS85aWt7kLJzOxpP3xq921Hwajiyxj/TdR68D4+j
 tLM0h3GiE2NxSpvrEx6v4L9x5tFWVr4ogNDegkXIR2frR/8URnvYnC0BMtIEkTTg3HJD
 rZ++cUbpEvIvzYJ34HiNKtqOAzwKk9+dTZ05L1rCCxfP3wJeIL8mAB64DZySRHdlEsam
 LxKnpaWkAHhTaM/gD8gMhihuhjomHmL6WhTY2TLWqV916EV0D7XEvU979uh5GdVYOw1/
 gGMx3jq1x6/ySJSzHB9OsPmQzEUcf8sID8eXZr/MiWIhCocMtNW/rOpU17ymWOUeiTjj
 gMKQ==
X-Gm-Message-State: AOAM533HWBS1UTspTQrf2PST/piHtC8j+b4fw7yWSC7Xp5EDjYhy8Q5Y
 2RB4iNYxqrvXJy7h49m5LIJ8VPJBgzgF/N5tflF8yA==
X-Google-Smtp-Source: ABdhPJyEjvjw6hlErB+kg/BSJ7LyU/dZjQUAvBRLQQ4hkNFJbTQQe1Btf7L6kkpWTGStUhQ/HNdcwukrIX/Ik9iHIBk=
X-Received: by 2002:a25:b88b:: with SMTP id w11mr23329907ybj.129.1596558159458; 
 Tue, 04 Aug 2020 09:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200729201146.537433-1-vitor@massaru.org>
 <20200729203908.GD2655@hirez.programming.kicks-ass.net>
 <CADQ6JjW-=SNjV-abGpGA9NfHD4yGG_bD5FmvW99W-Vo06twkbw@mail.gmail.com>
 <20200804132517.GK2657@hirez.programming.kicks-ass.net>
 <CADQ6JjWzze-VAmg_b9EkS4iVySt5pw8V4FSxYpDFAj8jvBxuGA@mail.gmail.com>
 <20200804142344.GM2674@hirez.programming.kicks-ass.net>
In-Reply-To: <20200804142344.GM2674@hirez.programming.kicks-ass.net>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Tue, 4 Aug 2020 13:22:03 -0300
Message-ID: <CADQ6JjWbCsyWxZKQ5=kkxx8hkaW=mbCjDodPXDAv5vH-=tVvEQ@mail.gmail.com>
To: peterz@infradead.org
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

Hi Peter,

On Tue, Aug 4, 2020 at 11:23 AM <peterz@infradead.org> wrote:
>
> On Tue, Aug 04, 2020 at 10:46:21AM -0300, Vitor Massaru Iha wrote:
> > On Tue, Aug 4, 2020 at 10:25 AM <peterz@infradead.org> wrote:
> > > On Wed, Jul 29, 2020 at 06:57:17PM -0300, Vitor Massaru Iha wrote:
> > >
> > > > The results can be seen this way:
> > > >
> > > > This is an excerpt from the test.log with the result in TAP format:
> > > > [snip]
> > > > ok 5 - example
> > > >     # Subtest: min-heap
> > > >     1..6
> > > >     ok 1 - test_heapify_all_true
> > > >     ok 2 - test_heapify_all_false
> > > >     ok 3 - test_heap_push_true
> > > >     ok 4 - test_heap_push_false
> > > >     ok 5 - test_heap_pop_push_true
> > > >     ok 6 - test_heap_pop_push_false
> > > > [snip]
>
> So ^ is TAP format?

Yep, you can see the spec here: https://testanything.org/tap-specification.html

>
> > > I don't care or care to use either; what does dmesg do? It used to be
> > > that just building the self-tests was sufficient and any error would
> > > show in dmesg when you boot the machine.
> > >
> > > But if I now have to use some damn tool, this is a regression.
> >
> > If you don't want to, you don't need to use the kunit-tool. If you
> > compile the tests as builtin and run the Kernel on your machine
> > the test result will be shown in dmesg in TAP format.
>
> That's seems a lot more verbose than it is now. I've recently even done
> a bunch of tests that don't print anything on success, dmesg is clutter
> enough already.

What tests do you refer to?

Running the test_min_heap.c, I got this from dmesg:

min_heap_test: test passed

And running min_heap_kunit.c:

ok 1 - min-heap

BR,
Vitor
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
