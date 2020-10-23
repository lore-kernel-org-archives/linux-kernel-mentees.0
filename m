Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324C6C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 18:01:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8001F22201
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 18:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="CMmDJhXL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8001F22201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CE12787106;
	Fri, 23 Oct 2020 18:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1O8mE4G192N; Fri, 23 Oct 2020 18:01:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BEE5D869BB;
	Fri, 23 Oct 2020 18:01:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5730C088B;
	Fri, 23 Oct 2020 18:01:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6502C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 18:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A75F7878E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 18:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NhfszEdm7nvh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 18:01:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 71EE886BB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 18:01:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1603476089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sYUk+0wycss9Jl0gKNB2yEmVhQdLfD7n3Pwk615mRNM=;
 b=CMmDJhXLdr4v34TFV74GJpYPkNLP/3sz72znUpUXn8YraRmTUzHPLy3Ews0zDjr2T5aT6F
 iurpC+lgJYf97fHUy5GbDZInAwgvI1IszR0td2RXcFYnO3Kgx4AR+u6rk+aIo1kjm1i4RI
 5BF7Soa/Fw5L/+ebqcn+fJQEWEuovMc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CBE6EAC54;
 Fri, 23 Oct 2020 18:01:28 +0000 (UTC)
Date: Fri, 23 Oct 2020 20:01:28 +0200
From: Petr Mladek <pmladek@suse.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <20201023180128.GB13609@alley>
References: <20201022151349.47436-1-98.arpi@gmail.com>
 <20201022191606.GQ4077@smile.fi.intel.com>
 <0ab618c7-8c5c-00ae-8e08-0c1b99f3bf5c@rasmusvillemoes.dk>
 <01f8ca45-60d1-ad67-f8eb-354dec411a78@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01f8ca45-60d1-ad67-f8eb-354dec411a78@gmail.com>
Cc: alexandre.belloni@bootlin.com, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 rdunlap@infradead.org, brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
 linux-kselftest@vger.kernel.org, idryomov@gmail.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2] lib: Convert test_printf.c to
	KUnit
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

On Fri 2020-10-23 19:13:00, Arpitha Raghunandan wrote:
> On 23/10/20 4:36 pm, Rasmus Villemoes wrote:
> > On 22/10/2020 21.16, Andy Shevchenko wrote:
> >> On Thu, Oct 22, 2020 at 08:43:49PM +0530, Arpitha Raghunandan wrote:
> >>> Converted test failure:
> >>>     # Subtest: printf-kunit-test
> >>>     1..1
> >>>     # selftest: EXPECTATION FAILED at lib/printf_kunit.c:82
> >>> vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote
> >>> '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
> >>>     # selftest: EXPECTATION FAILED at lib/printf_kunit.c:82
> >>> vsnprintf(buf, 5, "%pi4|%pI4", ...) wrote '127.', expected '127-'
> >>>     # selftest: EXPECTATION FAILED at lib/printf_kunit.c:118
> >>> kvasprintf(..., "%pi4|%pI4", ...) returned
> >>> '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
> >>>     not ok 1 - selftest
> >>> not ok 1 - printf-kunit-test
> >>
> >> Not bad. Rasmus, what do you think?
> > 
> > Much better, but that '1..1' and reporting the entire test suite as 1
> > single (failing or passing) test is (also) a regression. Look at the
> > original
> > 
> >>> [    0.591409] test_printf: all 388 tests passed
> > 
> > or
> > 
> >>> [    0.619495] test_printf: failed 3 out of 388 tests
> > 
> > That's far more informative, and I'd prefer if the summary information
> > (whether in the all-good case or some-failing) included something like
> > this. In particular, I have at some point spotted that I failed to
> > properly hook up a new test case (or perhaps failed to re-compile, or
> > somehow still ran the old kernel binary, don't remember which it was) by
> > noticing that the total number of tests hadn't increased. The new output
> > would not help catch such PEBKACs.
> > 
> > Rasmus
> > 
> 
> Splitting the test into multiple test cases in KUnit will display
> the number and name of tests that pass or fail. This will be similar
> to the lib/list-test.c test as can be seen here:
> https://elixir.bootlin.com/linux/latest/source/lib/list-test.c.
> I will work on this for the next version of this patch.

We should probably agree on the granularity first.

It looks like an overkill to split the tests into 388 functions
and define KUNIT_CASE() lines. It might be possible to hide
this into macros but macros are hell for debugging.

I suggest to split it by the current functions that do more test()
call inside. I mean to define something like:

static struct kunit_case printf_test_cases[] = {
	KUNIT_CASE(basic),
	KUNIT_CASE(number),
	KUNIT_CASE(string),
	KUNIT_CASE(plain_pointer),
	KUNIT_CASE(null_poiter),
	KUNIT_CASE(error_pointer),
	KUNIT_CASE(addr),
	KUNIT_CASE(struct_resource),
	KUNIT_CASE(dentry),
	KUNIT_CASE(pointer_addr),
	 ...,
	{}
};

Best Regards,
Petr
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
