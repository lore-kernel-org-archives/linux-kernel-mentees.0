Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2F8C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 18:22:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E67F2076D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 18:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E67F2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E164087606;
	Thu, 15 Oct 2020 18:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZwlCbdHHAfY; Thu, 15 Oct 2020 18:22:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 69A2F87605;
	Thu, 15 Oct 2020 18:22:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54568C07FF;
	Thu, 15 Oct 2020 18:22:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 037DEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 18:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E060C87606
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 18:22:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kyZpzWbvIGvc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 18:22:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 52D4987605
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 18:22:30 +0000 (UTC)
IronPort-SDR: 0ZHNnwQJdxxnYGkgz4BKwm1sDXt2suevK9/Y4EErDF2uYLRllUa9qudpNgvWkvo0jIm4UiWJxu
 I+6CKVSHe5Jg==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="251114215"
X-IronPort-AV: E=Sophos;i="5.77,379,1596524400"; d="scan'208";a="251114215"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 11:22:29 -0700
IronPort-SDR: r1XJlOIB6GjyjRP48YPoOq+HgmYrTrhpKoPNzRrPd0zwFUbHWNsgKJ7S2tMqjeVk5thVRFqjzL
 0Qi5UeA0AOfg==
X-IronPort-AV: E=Sophos;i="5.77,379,1596524400"; d="scan'208";a="521941691"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 11:22:25 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kT7uR-007d0I-CY; Thu, 15 Oct 2020 21:23:27 +0300
Date: Thu, 15 Oct 2020 21:23:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <20201015182327.GA4077@smile.fi.intel.com>
References: <20201015014616.309000-1-vitor@massaru.org>
 <20201015174823.GY4077@smile.fi.intel.com>
 <CADQ6JjVYiDQOJt1apsygEUK=530hfF9V+8QSZ_ntgvwYYoYqfQ@mail.gmail.com>
 <20201015182121.GZ4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015182121.GZ4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Marco Elver <elver@google.com>, mhocko@suse.com, arnd@arndb.de,
 torvalds@linux-foundation.org, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 elfring@users.sourceforge.net, paul.gortmaker@windriver.com,
 geert@linux-m68k.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 tglx@linutronix.de, linux-kernel-mentees@lists.linuxfoundation.org,
 akpm@linux-foundation.org, KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] lib: kunit: add list_sort
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

On Thu, Oct 15, 2020 at 09:21:21PM +0300, Andy Shevchenko wrote:
> On Thu, Oct 15, 2020 at 02:59:05PM -0300, Vitor Massaru Iha wrote:
> > On Thu, Oct 15, 2020 at 2:47 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Wed, Oct 14, 2020 at 10:46:16PM -0300, Vitor Massaru Iha wrote:
> > > > This adds the conversion of the runtime tests of test_list_sort,
> > > > from `lib/test_list_sort.c` to KUnit tests.
> > >
> > > >  rename lib/{test_list_sort.c => list_sort_kunit.c} (62%)
> > >
> > > One more thing. The documentation [1] doesn't specify any name conventions.
> > > So, please leave file name untouched.
> > >
> > > [1]: https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html
> > 
> > This convention hasn't yet entered the Torvaldos tree, but it is in
> > the Shuah tree: [1]
> > 
> > +Test File and Module Names
> > +==========================
> > +
> > +KUnit tests can often be compiled as a module. These modules should be named
> > +after the test suite, followed by ``_test``. If this is likely to conflict with
> > +non-KUnit tests, the suffix ``_kunit`` can also be used.
> > +
> > +The easiest way of achieving this is to name the file containing the test suite
> > +``<suite>_test.c`` (or, as above, ``<suite>_kunit.c``). This file should be
> > +placed next to the code under test.
> > +
> > +If the suite name contains some or all of the name of the test's parent
> > +directory, it may make sense to modify the source filename to reduce
> > redundancy.
> > +For example, a ``foo_firmware`` suite could be in the ``foo/firmware_test.c``
> > +file.
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=kunit&id=2a41fc52c21b6ece49921716bd289bfebaadcc04
> 
> I see.
> 
> Can the rest of documentation be consistent with this? It seems half-baked,
> since examples show something different.
> 
> (Entire documentation if full of example-test.c)

Also it doesn't really clear about the test cases against header files, like
for list.h or bits.h. (There is no c-file and I'm not sure one desires to have
include/linux/*_kunit.c)

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
