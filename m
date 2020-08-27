Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35447C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 10:54:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB18F22CAE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 10:54:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="K6Cc/U/v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB18F22CAE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D60486925;
	Thu, 27 Aug 2020 10:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TjfAY5UgBIiJ; Thu, 27 Aug 2020 10:54:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1A23585F43;
	Thu, 27 Aug 2020 10:54:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08C7EC07FF;
	Thu, 27 Aug 2020 10:54:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3386C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 10:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 91D1486888
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 10:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id leNuK1Om1qoL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 10:54:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
 [209.85.219.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9059885F43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 10:54:30 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id x10so2693211ybj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 03:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kL50AETAxFQ/Z0PEcxjtY/mje72xQ1KRsR0dYMPRn0c=;
 b=K6Cc/U/vzKW4aV2SdSpKnLr1XjzAN1/VEe0yjjqGP3KsKhratD7w7onOLADM18p/Qs
 AcGr9a1+s5Q7xa5Opw8DuDF/ohYNjtntk4ddMwwhWH0EWIckOG8814MLnXDsf6VVw3oJ
 uQ08O9VvQWDytcc2Msrf4hcSDGA1xGcEohd9UfQ8oHMeCFl7SMwRpi/Gbv5/TXcjCyL7
 Q3Sd/ItaMD3/1kENtjVpfSpfaBIwFE80iGsGwJkZRidMiEeqGY4KFrN3VJNdS3hwvHcT
 rwqmRSMs2cp0fcQBUyAprlc0Ry+xBeTo/mS1kmWmDqkB/nZpb9HFDXyWjd3lBUAriq7+
 QD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kL50AETAxFQ/Z0PEcxjtY/mje72xQ1KRsR0dYMPRn0c=;
 b=MyCrR1F33QTBgDej6vPle6iEjDjAsZEOXYtt0UTx0t/0qgHE/ICt9M7sLdqdzy5LIf
 7Fg68ztI/S4u/i55uPX1Hk+rKgJ/zfnQ+ckhwgEH9cbL9VTOhqQdn8me21WE5mRAfem9
 A1jLHcluQ4IZQP2dKJuDx5VuH76rVgBlbc8fjmSKzUJDt/t6SK7wucxRCdtiNczXp4IX
 0SJXzao/OshaMX9PLmLWrmxhdDB9pDNEkddyiNBliCehbYqzdNmHHKRDfPJz+AUit+8m
 pdCRcBo4bR/9jQx0Ws1nN0haa35uChvUTgJrF5rh+Umt+pO9qaawqaJA8zgLXyBAE3ZK
 vedQ==
X-Gm-Message-State: AOAM53348ftbIFjxjPLOA1WK8LHtq7fClgLazJtQr+9wcSIg3X9DpjHi
 3+6lBhxSHjiS3TPAHl6mHk8KOoPx8a7Ys1SxIy5VVA==
X-Google-Smtp-Source: ABdhPJxVB9AdgiqMEazYyTVnGYST+nW3/Chayz5MJ7mUKthRW3swWaa3QBpMH158AtV1ihmZErHV2SAtA9bYT3wjE3E=
X-Received: by 2002:a25:f42:: with SMTP id 63mr28803335ybp.348.1598525669597; 
 Thu, 27 Aug 2020 03:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200729192357.477350-1-vitor@massaru.org>
 <20200827102333.GA3564678@elver.google.com>
In-Reply-To: <20200827102333.GA3564678@elver.google.com>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Thu, 27 Aug 2020 07:53:53 -0300
Message-ID: <CADQ6JjVzx=kPsF4Lcek1HtGU7bGW3H62UoN0XDUHDrTxKt3FVg@mail.gmail.com>
To: Marco Elver <elver@google.com>
Cc: mhocko@suse.com, arnd@arndb.de, torvalds@linux-foundation.org,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 elfring@users.sourceforge.net, paul.gortmaker@windriver.com,
 geert@linux-m68k.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 tglx@linutronix.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, akpm@linux-foundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: kunit: add list_sort test
	conversion to KUnit
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

On Thu, Aug 27, 2020 at 7:23 AM Marco Elver <elver@google.com> wrote:
>
> On Wed, Jul 29, 2020 at 04:23PM -0300, Vitor Massaru Iha wrote:
> > This adds the conversion of the runtime tests of test_list_sort,
> > from `lib/test_list_sort.c` to KUnit tests.
> >
> > Please apply this commit first (linux-kselftest/kunit-fixes):
> > 3f37d14b8a3152441f36b6bc74000996679f0998 kunit: kunit_config: Fix parsing of CONFIG options with space
> >
> > Code Style Documentation: [0]
> >
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > Link: [0] https://lore.kernel.org/linux-kselftest/20200620054944.167330-1-davidgow@google.com/T/#u
> > ---
> >  lib/Kconfig.debug                           | 29 +++++---
> >  lib/Makefile                                |  2 +-
> >  lib/{test_list_sort.c => list_sort_kunit.c} | 73 +++++++++++----------
> >  3 files changed, 58 insertions(+), 46 deletions(-)
> >  rename lib/{test_list_sort.c => list_sort_kunit.c} (62%)
> >
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 9ad9210d70a1..de4fd020a4af 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -1854,16 +1854,6 @@ config LKDTM
> >       Documentation on how to use the module can be found in
> >       Documentation/fault-injection/provoke-crashes.rst
> >
> > -config TEST_LIST_SORT
> > -     tristate "Linked list sorting test"
> > -     depends on DEBUG_KERNEL || m
> > -     help
> > -       Enable this to turn on 'list_sort()' function test. This test is
> > -       executed only once during system boot (so affects only boot time),
> > -       or at module load time.
> > -
> > -       If unsure, say N.
> > -
> >  config TEST_MIN_HEAP
> >       tristate "Min heap test"
> >       depends on DEBUG_KERNEL || m
> > @@ -2173,6 +2163,25 @@ config LIST_KUNIT_TEST
> >
> >         If unsure, say N.
> >
> > +config LIST_SORT_KUNIT
> > +     tristate "KUnit Linked list sorting test"
> > +     depends on KUNIT
> > +     depends on DEBUG_KERNEL || m
>
> I think the style [0] you linked suggests '*_KUNIT_TEST' for config
> variables.
>
> Only noticed this because I was doing a
>
>         git grep 'config.*TEST'
>
> to find tests in the kernel + new tests floating on the LKML.

Thanks, I'll fix it.

>
> Apologies for picking this patch to comment on, but if it's still
> changeable it might be worth adjusting.

No problem.


> > +     help
> > +       Enable this to turn on 'list_sort()' function test. This test is
> > +       executed only once during system boot (so affects only boot time),
> > +       or at module load time.
> > +
> > +          KUnit tests run during boot and output the results to the debug log
> > +       in TAP format (http://testanything.org/). Only useful for kernel devs
> > +       running the KUnit test harness, and not intended for inclusion into a
> > +       production build.
>
> Not a big deal, but I'm not sure if summarizing KUnit here is useful.
> You already link to the documentation below.

Sure, I'll remove this.

> > +       For more information on KUnit and unit tests in general please refer
> > +       to the KUnit documentation in Documentation/dev-tools/kunit/.
> ...
>
> Thanks,
> -- Marco

Thanks for the review.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
