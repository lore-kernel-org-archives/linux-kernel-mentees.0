Return-Path: <SRS0=1dzN=BN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D27CC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 08:57:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09E1320738
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  3 Aug 2020 08:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09E1320738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7650185ABB;
	Mon,  3 Aug 2020 08:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PL3xyXrqVMW3; Mon,  3 Aug 2020 08:57:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED8E3855C6;
	Mon,  3 Aug 2020 08:57:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD995C0050;
	Mon,  3 Aug 2020 08:57:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3F9EC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 08:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DB787204AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 08:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gq+SubSRLiUj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 08:57:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by silver.osuosl.org (Postfix) with ESMTPS id E0DDF2035D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  3 Aug 2020 08:57:26 +0000 (UTC)
IronPort-SDR: Np1vB/p9YJumOPwgClmXGxWLz1+UlIlyQb+v8oq+chYyLB9fyNDQUUcUOEPUsOao9HQfZtojKs
 Ing8lXHOcGmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="216490574"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="216490574"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 01:57:26 -0700
IronPort-SDR: JK5u0nRI6ANficLgflI38qkeaJUkSIEq5iob74fmR3fksiXcD3CCwuq0KTyBu2bO7ciksosoe+
 J9ZAbCPwSYbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="323978428"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2020 01:57:22 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k2WHZ-005tfH-PH; Mon, 03 Aug 2020 11:57:21 +0300
Date: Mon, 3 Aug 2020 11:57:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>
Message-ID: <20200803085721.GX3703480@smile.fi.intel.com>
References: <20200729191151.476368-1-vitor@massaru.org>
 <20200729191948.GZ3703480@smile.fi.intel.com>
 <CAFd5g47MGZTo0k4s1ohRNT09D=NrsBQHOHQwLVq=uh8ezCuAQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFd5g47MGZTo0k4s1ohRNT09D=NrsBQHOHQwLVq=uh8ezCuAQA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Jul 29, 2020 at 12:59:28PM -0700, Brendan Higgins wrote:
> On Wed, Jul 29, 2020 at 12:19 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Jul 29, 2020 at 04:11:51PM -0300, Vitor Massaru Iha wrote:

...

> > >  lib/{test_sort.c => sort_kunit.c} | 31 +++++++++++++++----------------
> >
> > Still opened question why kunit is a suffix? Can't we leave same name? Can't we
> > do it rather prefix?
> 
> Sorry to jump in now; I thought Vitor's reply with a link to the new
> proposed documentation[1] addressed this. The naming convention issue
> came up about a month ago[2]. The people in the discussion (including
> myself) came to an agreement on _kunit.c. That being said, the
> documentation hasn't been accepted yet, so if you really feel strongly
> about it, now is the time to change it.

My argument is to do something like

  - ls .../test* vs. ls .../*_kunit.c

  - use shell completion vs. no completion when looking if there is a test
    module for something

But I agree that this is matter of style.

> All that being said, I would rather not discuss that issue here for
> the benefit of the participants in the preceding discussions.
> 
> I posted lore links for the relevant threads, which should be easy
> enough to In-Reply-To your way into. Nevertheless, if it makes it
> easier, let me know and I can CC you into the discussions.

No need. I think you have enough clever folks and good ideas behind this. Just
put a reference to all these conversion patches to the summary of pros and cons
of renaming.

> [1] https://lore.kernel.org/linux-kselftest/20200620054944.167330-1-davidgow@google.com/T/#u
> [2] https://lore.kernel.org/linux-kselftest/202006141005.BA19A9D3@keescook/t/#u

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
