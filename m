Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283FEC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 18:23:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EB6121D81
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 18:23:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Bl7s3LEf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EB6121D81
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AB5132E2DA;
	Wed, 14 Oct 2020 18:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XAeRWkSEsJH7; Wed, 14 Oct 2020 18:23:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5EC5920405;
	Wed, 14 Oct 2020 18:23:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4768DC0052;
	Wed, 14 Oct 2020 18:23:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90595C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 18:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7F201874C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 18:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdiKKTG_DToY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 18:23:42 +0000 (UTC)
X-Greylist: delayed 00:07:18 by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8AC3587470
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 18:23:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q5so564018wmq.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 11:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4hg2v/GYJHdaSA1mdU/demCJi+L5+geP2CWSqLJ/Oes=;
 b=Bl7s3LEfpCQle3+U7qJbpebW/VwHltBgH7AbG4T9b2Gl0iK4kvwRI2ouEsK5/GhbwI
 +pgV6LkFWeG12P2jAuyYeJHTTNlytEiJyAtj1BlXrurDq6bxjWTmepySsREbGgvgonHO
 dw/yTE2kIfeSTWA2bf2D+T7KOpG3xfSziGIlKea6C3X0nKkafXQXbzdcbmBU68NbBQpP
 3CrZqtbYOb9A72W92agOP3hLy3dRasxw+U2DMoDTC8jI/hkWF7O+O4diS+relc2MCgH3
 hlOGhXpCowsgWL7Qz/UGknr+LpVZNO7gVquNlkIgO+6k0ZTm5Zx65V9WicHmzdr7hOip
 ZyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4hg2v/GYJHdaSA1mdU/demCJi+L5+geP2CWSqLJ/Oes=;
 b=SRz+T0Rytqzcs78scQf8YU99q+K+pF3IrBhhT/lheVsgZV0MKMcWE5RbINA3woHsl8
 l7/Onzys+PlMNf73lwYtyIdfK4sgleEIEAtSbAJu5uG6PDsGhMzGmv+Rl10M7a6fEFDV
 JtG/NQDUUDA6VYeP5ZF6FWpHGpTKIg4crVkHicvhVX7JqwLSQxTsrQtWmhhT8WxNexOL
 BSfzZAA82q533ZW2b5mQDFAnco9REhxpJrAeQ2YvJGFkYIkOam6GFA7HitgYSC88ZZB6
 wLxkdSAeGlTeUGJHounM9myyHfjxOHPB9C6Qqh31gn07FEP0Cr2ncICvIpItFRm14eXf
 kuew==
X-Gm-Message-State: AOAM532VELap6woPNsjQkl9MaOyH3NewI2YLJocbpPnPO3elKo983J0S
 DjD24Flpu59BkO1Y/aR3qQa9/ZN3gr7E8gT0gg/EMfDOLbQ=
X-Google-Smtp-Source: ABdhPJxo167Rwvisc1S5kBbvo1EVU+JRvgzYnOKtYLjOzhMmx/1GQrPr3717fqlNPbum0uumMSuBHmVZ9hbZhjS2K6Y=
X-Received: by 2002:a7b:c181:: with SMTP id y1mr160947wmi.58.1602699382955;
 Wed, 14 Oct 2020 11:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200729201146.537433-1-vitor@massaru.org>
 <20200729203908.GD2655@hirez.programming.kicks-ass.net>
 <CADQ6JjW-=SNjV-abGpGA9NfHD4yGG_bD5FmvW99W-Vo06twkbw@mail.gmail.com>
 <20200804132517.GK2657@hirez.programming.kicks-ass.net>
 <CADQ6JjWzze-VAmg_b9EkS4iVySt5pw8V4FSxYpDFAj8jvBxuGA@mail.gmail.com>
 <20200804142344.GM2674@hirez.programming.kicks-ass.net>
 <CADQ6JjWbCsyWxZKQ5=kkxx8hkaW=mbCjDodPXDAv5vH-=tVvEQ@mail.gmail.com>
 <CAFd5g46DzWRzp9yXkpHbtyJuv236E=z7OaWeqXnfuiy6CTBL4A@mail.gmail.com>
In-Reply-To: <CAFd5g46DzWRzp9yXkpHbtyJuv236E=z7OaWeqXnfuiy6CTBL4A@mail.gmail.com>
Date: Wed, 14 Oct 2020 11:16:10 -0700
Message-ID: <CAP-5=fXhFG9sTMcfd1qJmMDNJWqOGky=jFtWNWg8U8-dkRp=dQ@mail.gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
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
From: Ian Rogers via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Oct 12, 2020 at 2:03 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> On Tue, Aug 4, 2020 at 9:22 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
> >
> > Hi Peter,
> >
> > On Tue, Aug 4, 2020 at 11:23 AM <peterz@infradead.org> wrote:
> > >
> > > On Tue, Aug 04, 2020 at 10:46:21AM -0300, Vitor Massaru Iha wrote:
> > > > On Tue, Aug 4, 2020 at 10:25 AM <peterz@infradead.org> wrote:
> > > > > On Wed, Jul 29, 2020 at 06:57:17PM -0300, Vitor Massaru Iha wrote:
> > > > >
> > > > > > The results can be seen this way:
> > > > > >
> > > > > > This is an excerpt from the test.log with the result in TAP format:
> > > > > > [snip]
> > > > > > ok 5 - example
> > > > > >     # Subtest: min-heap
> > > > > >     1..6
> > > > > >     ok 1 - test_heapify_all_true
> > > > > >     ok 2 - test_heapify_all_false
> > > > > >     ok 3 - test_heap_push_true
> > > > > >     ok 4 - test_heap_push_false
> > > > > >     ok 5 - test_heap_pop_push_true
> > > > > >     ok 6 - test_heap_pop_push_false
> > > > > > [snip]
> > >
> > > So ^ is TAP format?
> >
> > Yep, you can see the spec here: https://testanything.org/tap-specification.html
> >
> > >
> > > > > I don't care or care to use either; what does dmesg do? It used to be
> > > > > that just building the self-tests was sufficient and any error would
> > > > > show in dmesg when you boot the machine.
> > > > >
> > > > > But if I now have to use some damn tool, this is a regression.
> > > >
> > > > If you don't want to, you don't need to use the kunit-tool. If you
> > > > compile the tests as builtin and run the Kernel on your machine
> > > > the test result will be shown in dmesg in TAP format.
> > >
> > > That's seems a lot more verbose than it is now. I've recently even done
> > > a bunch of tests that don't print anything on success, dmesg is clutter
> > > enough already.
> >
> > What tests do you refer to?
> >
> > Running the test_min_heap.c, I got this from dmesg:
> >
> > min_heap_test: test passed
> >
> > And running min_heap_kunit.c:
> >
> > ok 1 - min-heap
>
> Gentle poke. I think Vitor was looking for a response. My guess is
> that Ian was waiting for a follow up patch.

There were some issues in the original patch, they should be easy to
fix. I'm more concerned that Peter's issues are addressed about the
general direction of the patch, verbosity and testing frameworks. I
see Vitor followed up with Peter but I'm not sure that means the
approach has been accepted.

Thanks,
Ian
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
