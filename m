Return-Path: <SRS0=mJtO=BC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6648C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 12:33:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7861120792
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 12:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="UEBq0g6z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7861120792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1A1882692A;
	Thu, 23 Jul 2020 12:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HnPZZ+N064yq; Thu, 23 Jul 2020 12:33:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E280A264CC;
	Thu, 23 Jul 2020 12:33:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8385C004D;
	Thu, 23 Jul 2020 12:33:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD33DC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 12:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9179F89A68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 12:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kbPJCHH-K2y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 12:33:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9C391887E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 12:33:18 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id f5so2769774ybq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 05:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oFgfTkrSPliJdcE2ZgsQWMPTGBVr0aakFg2hA0SWopU=;
 b=UEBq0g6zVMlm+ZOvqr+tCAlWDUA/6n2VoQROx1IZzoTys38IcwrQeOz+GShfaQzW+J
 To5Bmc/Zh7gMKe+cCUyDCqT0y3en2zd0IK7nUUAkONV9Mb0l0kObjCF9GUlkRAudUBhB
 HY/ksvKxacwrGibAXXusQ9lTg2v0qGKwWQ0/C+FS/FqdBwHdECBWUf37nyCrVtjtyq6i
 +vVvOqRZYus8UJRW+lDKpj8v7GVkGvAJoA9I1Lv/lXXf0CUAs1GOqfb6nvbye/plV4Bq
 PtASg15+JaR18XbvVx+Q00QoPJZi2CBDabxZF+Xj6xVM+fDz0gYI3vfatj5joQYchIDI
 2Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oFgfTkrSPliJdcE2ZgsQWMPTGBVr0aakFg2hA0SWopU=;
 b=gm5Y/qoB/VyuZjivST7wQgnw6wvjkVSWch2WzIx3+9Vr5qathIc97r1rrCjtMHsgTu
 ygmsE52dAFEIWAawt2HFeKHdv+UIArTpqdxRMJK4wVC3McjRHc+yEO5sNO7x6ZBhHXyg
 LzJTUVN1cJoJnsp+twyTMcweaUrF/XeRrS321mDw4AJlJq1xesSa0LdJENEeZ09hHfoK
 7eJ3+mPQq0odQ/S0vW6rk4KtKj7rympJKYHApkGAyzRQH+n8lLykjiQZ2ycLDLaBR/SD
 fgQtPBo+RVZXLn/ukriGcJypKBDtmAVb4aPPIqXvA9hBRvjJMUIfytlvjqrHaaNHEYJi
 uA7w==
X-Gm-Message-State: AOAM53370jHhISWl7XY3kJGztaslEPElASat98PifodGM8/pfc2KwivO
 G3pBLNa60wd3MCGcwfdJPzPplRKh9fSo8CpPzidwMg==
X-Google-Smtp-Source: ABdhPJyhPrvkl3wnqOJZR+KE4dXDzdfdmBF8NSWdbQMOAwRHnH9rqpSXNAdzCEMhnvUlDuTGwR1GdEdZ4pIM0+kNO2A=
X-Received: by 2002:a25:cfd2:: with SMTP id f201mr6479953ybg.286.1595507597470; 
 Thu, 23 Jul 2020 05:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200723000807.171940-1-vitor@massaru.org>
 <20200723080444.GE3703480@smile.fi.intel.com>
In-Reply-To: <20200723080444.GE3703480@smile.fi.intel.com>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Thu, 23 Jul 2020 09:32:41 -0300
Message-ID: <CADQ6JjVujdtaG7HxOLxg=vuGjFt--sZ9+6QzY0ZXQuOVBDn+7Q@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: fkostenzer@live.at, torvalds@linux-foundation.org,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 paul.gortmaker@windriver.com, geert@linux-m68k.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 tglx@linutronix.de, linux-kernel-mentees@lists.linuxfoundation.org,
 akpm@linux-foundation.org, KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: kunit: Convert test_sort to
	KUnit test
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

On Thu, Jul 23, 2020 at 5:04 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 22, 2020 at 09:08:07PM -0300, Vitor Massaru Iha wrote:
> > This adds the conversion of the test_sort.c to KUnit test.
> >
> > Please apply this commit first (linux-kselftest/kunit-fixes):
> > 3f37d14b8a3152441f36b6bc74000996679f0998 kunit: kunit_config: Fix parsing of CONFIG options with space
>
> ...
>
> >  lib/{test_sort.c => sort_kunit.c} | 31 +++++++++++++++----------------
>
> Is it established practice to put kunit as a suffix?

Not yet. https://lore.kernel.org/linux-kselftest/20200620054944.167330-1-davidgow@google.com/T/#u

Thanks
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
