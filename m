Return-Path: <SRS0=ZpoD=BI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73428C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 19:59:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 396DC20658
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 19:59:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="m0yOqGSS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 396DC20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3306887E3D;
	Wed, 29 Jul 2020 19:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uAhcCsVs9Wpn; Wed, 29 Jul 2020 19:59:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AA93C84E27;
	Wed, 29 Jul 2020 19:59:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90CC1C0050;
	Wed, 29 Jul 2020 19:59:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DE00C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 19:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3B0E087447
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 19:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ne14035xtFaD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 19:59:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7F9FA84E27
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 19:59:40 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id p3so14962576pgh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 12:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uXah3Xc+kLkZM/PLhPslS3L9/VAQlpaeM7DPNTz+mRo=;
 b=m0yOqGSSOobbbR1nXbyONcYMoY9QcZn/h7RfTI6uhYaO/tH+AqMNCgY4tLf21I8vXk
 Yh4Ks3FqHTvlZaNLAK1//sEF+F4zflndG/1gOtS0jQVceWjtcIlAGrVYWF18eEEftqub
 ChyKawfxRra4GHOAfLwuDeqdkMpSTXvbb5AjPF/Cr6ypx42CMLxmJa0i1AeERJm2jfhU
 UekCtB4i6g+uwk7Wnp1Ba+mt9c2OV22+9zXc2UAog6H1P87JdmRhoZPaSDwcTULzPjNh
 Bo5jaFASd2oYnfR3SQqwi4ctv3IU2uD24B7oxSMByDICnt6HRM6SfF2MXCNJ4WPzptly
 KFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uXah3Xc+kLkZM/PLhPslS3L9/VAQlpaeM7DPNTz+mRo=;
 b=kuGaUeGlcIM8FW2HwcEUwKtXa81b7Cyu13Xef9Ji8vrMJOUeM9klnNho6GGmbeF6yP
 h4a0Ux/0w/4AZRQW49/IGHRyVHmwpOyx4V2iZ9JEXx2U4tmv15qpV6dl7vcduKJ2++FV
 7dQhFS5ooKvIRHii9cR8MHWbZmPGTzjsf5nlRTsB24Kzzq/dNQOJq+I+ycF+kOHjCJch
 dp7QmtbbjfplU+kzH17nOLKGKZlw2aQbDZPj7tgj81skhmJ0uPHCsqV6KGrMxn/tA7o5
 Z5W3uzySWRT6WRgnbBJtrT9QSvX4iOhWugqXhDljZke946OAmKSBMLI9a80b+B+LmAs3
 noiw==
X-Gm-Message-State: AOAM533gPuh4VTlxv8GnDrDKWxgBxOL7lBKGKolo6R0owcx0YyHMxGTR
 TRZMeb7ftRZzUvz2/dKoPoxvqzh0GP+Ph2BaQAVadQ==
X-Google-Smtp-Source: ABdhPJz4+pNEnpxR6psAD32318hc3ZwUR5qnxVTyp2ARSiG9KBGqwIhTNfVJC84ocOmqyUoFZ5D9UM2pjZdwWleigPM=
X-Received: by 2002:a63:d501:: with SMTP id c1mr30791224pgg.159.1596052779669; 
 Wed, 29 Jul 2020 12:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200729191151.476368-1-vitor@massaru.org>
 <20200729191948.GZ3703480@smile.fi.intel.com>
In-Reply-To: <20200729191948.GZ3703480@smile.fi.intel.com>
Date: Wed, 29 Jul 2020 12:59:28 -0700
Message-ID: <CAFd5g47MGZTo0k4s1ohRNT09D=NrsBQHOHQwLVq=uh8ezCuAQA@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: fkostenzer@live.at, Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] lib: kunit: Convert test_sort
	to KUnit test
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

On Wed, Jul 29, 2020 at 12:19 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 29, 2020 at 04:11:51PM -0300, Vitor Massaru Iha wrote:
> > This adds the conversion of the test_sort.c to KUnit test.
> >
> > Please apply this commit first (linux-kselftest/kunit-fixes):
> > 3f37d14b8a3152441f36b6bc74000996679f0998 kunit: kunit_config: Fix parsing of CONFIG options with space
>
> Looks like you mixed up commit message and changelog / comments.
>
> > Code Style Documentation: [0]
> >
> > Fix these warnings Reported-by lkp@intel.com
> >
> > WARNING: modpost: vmlinux.o(.data+0x4fc70): Section mismatch in reference from the variable sort_test_cases to the variable .init.text:sort_test
> >    The variable sort_test_cases references
> >    the variable __init sort_test
> >    If the reference is valid then annotate the
> >    variable with or __refdata (see linux/init.h) or name the variable
> >
> > WARNING: modpost: lib/sort_kunit.o(.data+0x11c): Section mismatch in reference from the variable sort_test_cases to the function .init.text:sort_test()
> >    The variable sort_test_cases references
> >    the function __init sort_test()
>
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: [0] https://lore.kernel.org/linux-kselftest/20200620054944.167330-1-davidgow@google.com/T/#u
>
> This should be in different order: Link, Reported-by, SoB.
> Also [0] is unnecessary
>
> >  lib/{test_sort.c => sort_kunit.c} | 31 +++++++++++++++----------------
>
> Still opened question why kunit is a suffix? Can't we leave same name? Can't we
> do it rather prefix?

Sorry to jump in now; I thought Vitor's reply with a link to the new
proposed documentation[1] addressed this. The naming convention issue
came up about a month ago[2]. The people in the discussion (including
myself) came to an agreement on _kunit.c. That being said, the
documentation hasn't been accepted yet, so if you really feel strongly
about it, now is the time to change it.

All that being said, I would rather not discuss that issue here for
the benefit of the participants in the preceding discussions.

I posted lore links for the relevant threads, which should be easy
enough to In-Reply-To your way into. Nevertheless, if it makes it
easier, let me know and I can CC you into the discussions.

[1] https://lore.kernel.org/linux-kselftest/20200620054944.167330-1-davidgow@google.com/T/#u
[2] https://lore.kernel.org/linux-kselftest/202006141005.BA19A9D3@keescook/t/#u

Cheers
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
