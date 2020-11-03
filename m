Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D7CC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 17:38:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 915A720773
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 17:38:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ms7/+dtL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 915A720773
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4B71A87440;
	Tue,  3 Nov 2020 17:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MFlgsEKFbDgi; Tue,  3 Nov 2020 17:38:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B615B87409;
	Tue,  3 Nov 2020 17:38:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1003C088B;
	Tue,  3 Nov 2020 17:38:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFC2DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 17:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C20BA87414
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 17:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9V2qDLSBR54
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 17:38:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 08CE587409
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 17:38:32 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z3so8475702pfz.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 09:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7X3BbvjDrsn7ygRSJDCtlaYquNn6mTNp8oqpq3hyWlQ=;
 b=ms7/+dtLljlluO37xt96zw8YARFc9rD1+o7LTO6aRKO7yXhIA2N+N0wA09Y0+7Jxq+
 KhIOOBAAOfsGwse9QyUQTDu5zJrUjvmFSmTZZC//jjjtBLI3uXWUdOVCwRKk7UgQJ5En
 4Uqb/IZOGARLzQF58PXqpFwRtu9XgoPMljdD/Kb/NluaHI5+agi5rN+E+s5uKBBjj4zi
 +cwX47z9jpe6GdmeGP7RcP8Ss/AHNenrP4A5h32Zksfamm1xe366h1WphtgQ3FXn67kl
 WYLqSyplc64fEYIjqQdLTCsmoOUpAduHUSQGg4Ka1ILfGNcxpuZSdXcKzLo89A1GpUhu
 BOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7X3BbvjDrsn7ygRSJDCtlaYquNn6mTNp8oqpq3hyWlQ=;
 b=R377LxQ9scos31Pf2J2qzG5yifNiwVfuL6v6fbEuFuAZ1M/UrA+LDuZUsEl4ueVgfB
 nGos92KXaKI4zVwzH/AC1kKzRo7OtpjzGkTiOLdkZQJH96AyVIDK1XoZIiRYykou+XEd
 MkObY4qECliF/IeZna7PYpqlUdkPBp5qONTe8SsGMBR+m4ZkI1Gm5Ga6OUU89cWaVzlI
 b2PSZzgS+JuBQhGGjpNfe35AlGOppjUxrgJULHJIFsQoYzIOIOKl2UsbMKw8pv07klHW
 RsVISXn1QVagfVLuA8u2+c2/CcqbWN/6MHS/0jWh5pJH1c58DobU5z+l40T8wuR03b1b
 UBwg==
X-Gm-Message-State: AOAM53315UpJdH0nbmqeyZGxqsBVnOUGnDmZTdFFblBBUBJxII5eLFQR
 8K+vlcDVNTTv5U1ovdyx7WtRZbERBeoA9T7nobZzaQ==
X-Google-Smtp-Source: ABdhPJyOa5rBkqu7NYkTH7RmQqj5gNamoyrF6MSPrAia5E1eeeOszu4vTPxmN1gQwld1sjzo+ikvh/Gv2Iyou0QHBHg=
X-Received: by 2002:a17:90b:204d:: with SMTP id
 ji13mr319770pjb.20.1604425111290; 
 Tue, 03 Nov 2020 09:38:31 -0800 (PST)
MIME-Version: 1.0
References: <20201103111049.51916-1-98.arpi@gmail.com>
 <20201103113353.GC4077@smile.fi.intel.com>
 <20201103115223.GA268796@kroah.com> <20201103160728.GQ20201@alley>
 <20201103162340.GA281002@kroah.com>
In-Reply-To: <20201103162340.GA281002@kroah.com>
Date: Tue, 3 Nov 2020 09:38:20 -0800
Message-ID: <CAFd5g472GnXmjs3gzU9=qgcB+5uBdym+-pO19M1xnGvQu5BWQw@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Petr Mladek <pmladek@suse.com>, alexandre.belloni@bootlin.com,
 David Gow <davidgow@google.com>, Arpitha Raghunandan <98.arpi@gmail.com>,
 "Bird, Timothy" <Tim.Bird@sony.com>, Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 idryomov@gmail.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: Convert test_printf.c to
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Nov 3, 2020 at 8:22 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Nov 03, 2020 at 05:11:47PM +0100, Petr Mladek wrote:
> > On Tue 2020-11-03 12:52:23, Greg KH wrote:
> > > On Tue, Nov 03, 2020 at 01:33:53PM +0200, Andy Shevchenko wrote:
> > > > On Tue, Nov 03, 2020 at 04:40:49PM +0530, Arpitha Raghunandan wrote:
> > > > > Convert test lib/test_printf.c to KUnit. More information about
> > > > > KUnit can be found at:
> > > > > https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
> > > > > KUnit provides a common framework for unit tests in the kernel.
> > > > > KUnit and kselftest are standardizing around KTAP, converting this
> > > > > test to KUnit makes this test output in KTAP which we are trying to
> > > > > make the standard test result format for the kernel. More about
> > > > > the KTAP format can be found at:
> > > > > https://lore.kernel.org/linux-kselftest/CY4PR13MB1175B804E31E502221BC8163FD830@CY4PR13MB1175.namprd13.prod.outlook.com/.
> > > > > I ran both the original and converted tests as is to produce the
> > > > > output for success of the test in the two cases. I also ran these
> > > > > tests with a small modification to show the difference in the output
> > > > > for failure of the test in both cases. The modification I made is:
> > > > > - test("127.000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin_addr);
> > > > > + test("127-000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin_addr);
> > > > >
> > > > > Original test success:
> > > > > [    0.540860] test_printf: loaded.
> > > > > [    0.540863] test_printf: random seed = 0x5c46c33837bc0619
> > > > > [    0.541022] test_printf: all 388 tests passed
> > > > >
> > > > > Original test failure:
> > > > > [    0.537980] test_printf: loaded.
> > > > > [    0.537983] test_printf: random seed = 0x1bc1efd881954afb
> > > > > [    0.538029] test_printf: vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
> > > > > [    0.538030] test_printf: kvasprintf(..., "%pi4|%pI4", ...) returned '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
> > > > > [    0.538124] test_printf: failed 2 out of 388 tests
> > > > > [    0.538125] test_printf: random seed used was 0x1bc1efd881954afb
> > > > >
> > > > > Converted test success:
> > > > >     # Subtest: printf
> > > > >     1..25
> > > > >     ok 1 - test_basic
> > > > >     ok 2 - test_number
> > > > >     ok 3 - test_string
> > > > >     ok 4 - plain
> > > > >     ok 5 - null_pointer
> > > > >     ok 6 - error_pointer
> > > > >     ok 7 - invalid_pointer
> > > > >     ok 8 - symbol_ptr
> > > > >     ok 9 - kernel_ptr
> > > > >     ok 10 - struct_resource
> > > > >     ok 11 - addr
> > > > >     ok 12 - escaped_str
> > > > >     ok 13 - hex_string
> > > > >     ok 14 - mac
> > > > >     ok 15 - ip
> > > > >     ok 16 - uuid
> > > > >     ok 17 - dentry
> > > > >     ok 18 - struct_va_format
> > > > >     ok 19 - time_and_date
> > > > >     ok 20 - struct_clk
> > > > >     ok 21 - bitmap
> > > > >     ok 22 - netdev_features
> > > > >     ok 23 - flags
> > > > >     ok 24 - errptr
> > > > >     ok 25 - fwnode_pointer
> > > > > ok 1 - printf
> > > > >
> > > > > Converted test failure:
> > > > >     # Subtest: printf
> > > > >     1..25
> > > > >     ok 1 - test_basic
> > > > >     ok 2 - test_number
> > > > >     ok 3 - test_string
> > > > >     ok 4 - plain
> > > > >     ok 5 - null_pointer
> > > > >     ok 6 - error_pointer
> > > > >     ok 7 - invalid_pointer
> > > > >     ok 8 - symbol_ptr
> > > > >     ok 9 - kernel_ptr
> > > > >     ok 10 - struct_resource
> > > > >     ok 11 - addr
> > > > >     ok 12 - escaped_str
> > > > >     ok 13 - hex_string
> > > > >     ok 14 - mac
> > > > >     # ip: EXPECTATION FAILED at lib/printf_kunit.c:82
> > > > > vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
> > > > >     # ip: EXPECTATION FAILED at lib/printf_kunit.c:124
> > > > > kvasprintf(..., "%pi4|%pI4", ...) returned '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
> > > > >     not ok 15 - ip
> > > > >     ok 16 - uuid
> > > > >     ok 17 - dentry
> > > > >     ok 18 - struct_va_format
> > > > >     ok 19 - time_and_date
> > > > >     ok 20 - struct_clk
> > > > >     ok 21 - bitmap
> > > > >     ok 22 - netdev_features
> > > > >     ok 23 - flags
> > > > >     ok 24 - errptr
> > > > >     ok 25 - fwnode_pointer
> > > > > not ok 1 - printf
> > > >
> > > > Better, indeed.
> > > >
> > > > But can be this improved to have a cumulative statistics, like showing only
> > > > number of total, succeeded, failed with details of the latter ones?
> > >
> > > Is that the proper test output format?  We have a standard...
> >
> > What is the standard, please?
>
> The TAP format should be the standard, no reason the kernel can not spit
> out the same test message format that the userspace tests do, right?

KUnit and kselftest both use the TAP format. Well, we both use slight
variations on the TAP format. Nevertheless, we are both unifying
around a common variation of TAP called KTAP[1]. To my knowledge,
neither kselftest or KUnit fully obey the new KTAP spec, but I believe
we are both working toward full compliance (as of 5.10 KUnit output
should be fully compliant[2]), and both are pretty close.

When I say both kselftest and KUnit are pretty close to obeying KTAP,
I mean that for the purpose of Arpitha's change here which we are
discussing, the sample segment of output that she shared as the new
output of this test *is fully compliant with KTAP and is not expected
to change any time soon*. Additionally, most, but not all, of
kselftest's tests are compliant as well.

The main visual difference between KUnit and kselftest TAP output
comes from two things: kselftests tend to make heavy use of diagnostic
lines (basically log lines which serve to communicate arbitrary
unstructured information about the test) - KUnit has facilities for
devs to use these in tests, but so far they have not gotten much use
probably due to the smaller scope nature of KUnit tests. The other
difference is because KUnit groups related test cases together into
subtests (KUnit calls them test suites, but TAP calls them subtests)
whereas kselftest does not - again this largely has to do with the
style of tests. Both of these features exist in KTAP, but the output
tends to reflect the kinds of tests being written.

Tim, Shuah, David (or anyone else), please let me know if I missed anything.

I hope that answers everyone's questions.

P.S. You can get KUnit results from user space separated out from
dmesg if you prefer to run your tests that way[3].

[1] https://lore.kernel.org/linux-kselftest/CY4PR13MB1175B804E31E502221BC8163FD830@CY4PR13MB1175.namprd13.prod.outlook.com/
[2] We now support the top level test plan as specified, but do not
support SKIP tests yet; however, most KUnit tests don't need SKIP
tests anyway. See [1] for more information.
[3] https://www.kernel.org/doc/html/latest/dev-tools/kunit/usage.html#kunit-debugfs-representation
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
