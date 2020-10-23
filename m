Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436D3C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 11:06:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5913A2192A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 11:06:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="YLru0Rw5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5913A2192A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C709987233;
	Fri, 23 Oct 2020 11:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccZG9_Ni9YF8; Fri, 23 Oct 2020 11:06:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7DC2B871D7;
	Fri, 23 Oct 2020 11:06:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A753C0893;
	Fri, 23 Oct 2020 11:06:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6506BC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 11:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 604C7871A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 11:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FrdsXdeh-W-K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 11:06:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B8B9E87189
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 11:06:12 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id ce10so1801479ejc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 04:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sa/Nn3ofOc6VafcCvPSadCW8GlnmiSqdzkE6Af70Ogk=;
 b=YLru0Rw5qj+XYTVYL91y0RrrKzL0fGi2PV3nF3dBaQpU/q90mxcZBX2Kpt2aXElkW+
 +GJGhNJ7VoiAyEk0fVCrpJc8R0FGGQ5mMgYW+8NZZ2SzNJq0CYTMDHY/izVpTGHtqV1P
 DHsC2X5jlvWp4wsSA/i4okDx5R2MPsrfRHeR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sa/Nn3ofOc6VafcCvPSadCW8GlnmiSqdzkE6Af70Ogk=;
 b=Yu941G5tUyKichJlPSN6zI9dMvoO8BzC+fMo2d3noMTVGvjFQa7FnyBQTe+5yIy3x/
 Z/0W8a4AXZn7nRPPHXbr2yL94iTv7JUBP7qHFK9TDpP2PoMKxLC4u7YX8yTZ9EFm8rww
 ChYk7yeC6tXojOBSy8h39yGCy69ETC1+bh6UTGbFoaVdNOeJg3q+31dy1R8z6wPYjBa4
 xxbk/8iRe+/XMVZjGVaRDQqJ5xL6Lux7asW+qJSyfrXUEBypyOQ3ECRlLjhLIiZpHApX
 qoMcV1XLwusr716ZAr3rO4aspAVYQ2HkM5wVqMHRGQrUrtgkwsb5cRhxzEymOYl1HuBh
 914Q==
X-Gm-Message-State: AOAM533JW+IjuvgWw5EV6JLJZEB2mvhnbtrn/3b4ZeUfRlMAtGSYGcb2
 KgcF9fRXb+qb21qFsUmDC/PtevtgPmq8TAunjAY=
X-Google-Smtp-Source: ABdhPJw2fLLCK3gQbucoPr+cIfCcmX4tucFnbhPVvHDL5QD4i4LYyaC1LBo71kMyZyY1A8CSrMTmVA==
X-Received: by 2002:a17:906:6d04:: with SMTP id
 m4mr1520328ejr.68.1603451170550; 
 Fri, 23 Oct 2020 04:06:10 -0700 (PDT)
Received: from [172.16.11.132] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id f7sm645773ejz.23.2020.10.23.04.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 04:06:09 -0700 (PDT)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arpitha Raghunandan <98.arpi@gmail.com>
References: <20201022151349.47436-1-98.arpi@gmail.com>
 <20201022191606.GQ4077@smile.fi.intel.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <0ab618c7-8c5c-00ae-8e08-0c1b99f3bf5c@rasmusvillemoes.dk>
Date: Fri, 23 Oct 2020 13:06:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201022191606.GQ4077@smile.fi.intel.com>
Content-Language: en-US
Cc: pmladek@suse.com, alexandre.belloni@bootlin.com, rdunlap@infradead.org,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 sergey.senozhatsky@gmail.com, linux-kselftest@vger.kernel.org,
 idryomov@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 kunit-dev@googlegroups.com
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

On 22/10/2020 21.16, Andy Shevchenko wrote:
> On Thu, Oct 22, 2020 at 08:43:49PM +0530, Arpitha Raghunandan wrote:
>> Convert test lib/test_printf.c to KUnit. More information about
>> KUnit can be found at:
>> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
>> KUnit provides a common framework for unit tests in the kernel.
>> KUnit and kselftest are standardizing around KTAP, converting this
>> test to KUnit makes this test output in KTAP which we are trying to
>> make the standard test result format for the kernel. More about
>> the KTAP format can be found at:
>> https://lore.kernel.org/linux-kselftest/CY4PR13MB1175B804E31E502221BC8163FD830@CY4PR13MB1175.namprd13.prod.outlook.com/.
>> I ran both the original and converted tests as is to produce the
>> output for success of the test in the two cases. I also ran these
>> tests with a small modification to show the difference in the output
>> for failure of the test in both cases. The modification I made is:
>> - test("127.000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin_addr);
>> + test("127-000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin_addr);
>>
>> Original test success:
>> [    0.591262] test_printf: loaded.
>> [    0.591409] test_printf: all 388 tests passed
>>
>> Original test failure:
>> [    0.619345] test_printf: loaded.
>> [    0.619394] test_printf: vsnprintf(buf, 256, "%piS|%pIS", ...)
>> wrote '127.000.000.001|127.0.0.1', expected
>> '127-000.000.001|127.0.0.1'
>> [    0.619395] test_printf: vsnprintf(buf, 25, "%piS|%pIS", ...) wrote
>> '127.000.000.001|127.0.0.', expected '127-000.000.001|127.0.0.'
>> [    0.619396] test_printf: kvasprintf(..., "%piS|%pIS", ...) returned
>> '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
>> [    0.619495] test_printf: failed 3 out of 388 tests
>>
>> Converted test success:
>>     # Subtest: printf-kunit-test
>>     1..1
>>     ok 1 - selftest
>> ok 1 - printf-kunit-test
>>
>> Converted test failure:
>>     # Subtest: printf-kunit-test
>>     1..1
>>     # selftest: EXPECTATION FAILED at lib/printf_kunit.c:82
>> vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote
>> '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
>>     # selftest: EXPECTATION FAILED at lib/printf_kunit.c:82
>> vsnprintf(buf, 5, "%pi4|%pI4", ...) wrote '127.', expected '127-'
>>     # selftest: EXPECTATION FAILED at lib/printf_kunit.c:118
>> kvasprintf(..., "%pi4|%pI4", ...) returned
>> '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
>>     not ok 1 - selftest
>> not ok 1 - printf-kunit-test
> 
> Not bad. Rasmus, what do you think?

Much better, but that '1..1' and reporting the entire test suite as 1
single (failing or passing) test is (also) a regression. Look at the
original

>> [    0.591409] test_printf: all 388 tests passed

or

>> [    0.619495] test_printf: failed 3 out of 388 tests

That's far more informative, and I'd prefer if the summary information
(whether in the all-good case or some-failing) included something like
this. In particular, I have at some point spotted that I failed to
properly hook up a new test case (or perhaps failed to re-compile, or
somehow still ran the old kernel binary, don't remember which it was) by
noticing that the total number of tests hadn't increased. The new output
would not help catch such PEBKACs.

Rasmus
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
