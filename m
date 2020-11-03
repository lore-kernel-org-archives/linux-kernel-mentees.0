Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C453EC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 11:33:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF25A22404
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 11:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF25A22404
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 56AE4860C8;
	Tue,  3 Nov 2020 11:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kl9v3NQc4bgt; Tue,  3 Nov 2020 11:32:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1735585FC3;
	Tue,  3 Nov 2020 11:32:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08F87C088B;
	Tue,  3 Nov 2020 11:32:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 603EEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 11:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 45B9487377
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 11:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ku7dRsbt5v9P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 11:32:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3545287308
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 11:32:56 +0000 (UTC)
IronPort-SDR: 1DleMzW2BrlSzJLdxeRaABc/36WLskFdHz7f3urD4OrvMZ1GD5GnuPdQjGJ6a7U+1+VaeFHB+I
 uwzGVZlCgSxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="156026392"
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; d="scan'208";a="156026392"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 03:32:55 -0800
IronPort-SDR: Xok5TTeP53mEEvRa6eqBOm9Q6BAhXsqLRP6HUdxNB4KVHRwvcrLxzrf4GYr/wDyMoiNoif1IOM
 66dvYfuocakQ==
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; d="scan'208";a="320398888"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 03:32:52 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kZuZV-003T4k-PG; Tue, 03 Nov 2020 13:33:53 +0200
Date: Tue, 3 Nov 2020 13:33:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <20201103113353.GC4077@smile.fi.intel.com>
References: <20201103111049.51916-1-98.arpi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103111049.51916-1-98.arpi@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pmladek@suse.com, alexandre.belloni@bootlin.com, linux@rasmusvillemoes.dk,
 rdunlap@infradead.org, brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
 linux-kselftest@vger.kernel.org, idryomov@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Nov 03, 2020 at 04:40:49PM +0530, Arpitha Raghunandan wrote:
> Convert test lib/test_printf.c to KUnit. More information about
> KUnit can be found at:
> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
> KUnit provides a common framework for unit tests in the kernel.
> KUnit and kselftest are standardizing around KTAP, converting this
> test to KUnit makes this test output in KTAP which we are trying to
> make the standard test result format for the kernel. More about
> the KTAP format can be found at:
> https://lore.kernel.org/linux-kselftest/CY4PR13MB1175B804E31E502221BC8163=
FD830@CY4PR13MB1175.namprd13.prod.outlook.com/.
> I ran both the original and converted tests as is to produce the
> output for success of the test in the two cases. I also ran these
> tests with a small modification to show the difference in the output
> for failure of the test in both cases. The modification I made is:
> - test("127.000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin_ad=
dr);
> + test("127-000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin_ad=
dr);
> =

> Original test success:
> [    0.540860] test_printf: loaded.
> [    0.540863] test_printf: random seed =3D 0x5c46c33837bc0619
> [    0.541022] test_printf: all 388 tests passed
> =

> Original test failure:
> [    0.537980] test_printf: loaded.
> [    0.537983] test_printf: random seed =3D 0x1bc1efd881954afb
> [    0.538029] test_printf: vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote '=
127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
> [    0.538030] test_printf: kvasprintf(..., "%pi4|%pI4", ...) returned '1=
27.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
> [    0.538124] test_printf: failed 2 out of 388 tests
> [    0.538125] test_printf: random seed used was 0x1bc1efd881954afb
> =

> Converted test success:
> =A0 =A0 # Subtest: printf
> =A0 =A0 1..25
> =A0 =A0 ok 1 - test_basic
> =A0 =A0 ok 2 - test_number
> =A0 =A0 ok 3 - test_string
> =A0 =A0 ok 4 - plain
> =A0 =A0 ok 5 - null_pointer
> =A0 =A0 ok 6 - error_pointer
> =A0 =A0 ok 7 - invalid_pointer
> =A0 =A0 ok 8 - symbol_ptr
> =A0 =A0 ok 9 - kernel_ptr
> =A0 =A0 ok 10 - struct_resource
> =A0 =A0 ok 11 - addr
> =A0 =A0 ok 12 - escaped_str
> =A0 =A0 ok 13 - hex_string
> =A0 =A0 ok 14 - mac
> =A0 =A0 ok 15 - ip
> =A0 =A0 ok 16 - uuid
> =A0 =A0 ok 17 - dentry
> =A0 =A0 ok 18 - struct_va_format
> =A0 =A0 ok 19 - time_and_date
> =A0 =A0 ok 20 - struct_clk
> =A0 =A0 ok 21 - bitmap
> =A0 =A0 ok 22 - netdev_features
> =A0 =A0 ok 23 - flags
> =A0 =A0 ok 24 - errptr
> =A0 =A0 ok 25 - fwnode_pointer
> ok 1 - printf
> =

> Converted test failure:
> =A0 =A0 # Subtest: printf
> =A0 =A0 1..25
> =A0 =A0 ok 1 - test_basic
> =A0 =A0 ok 2 - test_number
> =A0 =A0 ok 3 - test_string
> =A0 =A0 ok 4 - plain
> =A0 =A0 ok 5 - null_pointer
> =A0 =A0 ok 6 - error_pointer
> =A0 =A0 ok 7 - invalid_pointer
> =A0 =A0 ok 8 - symbol_ptr
> =A0 =A0 ok 9 - kernel_ptr
> =A0 =A0 ok 10 - struct_resource
> =A0 =A0 ok 11 - addr
> =A0 =A0 ok 12 - escaped_str
> =A0 =A0 ok 13 - hex_string
> =A0 =A0 ok 14 - mac
> =A0 =A0 # ip: EXPECTATION FAILED at lib/printf_kunit.c:82
> vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote '127.000.000.001|127.0.0.1', =
expected '127-000.000.001|127.0.0.1'
> =A0 =A0 # ip: EXPECTATION FAILED at lib/printf_kunit.c:124
> kvasprintf(..., "%pi4|%pI4", ...) returned '127.000.000.001|127.0.0.1', e=
xpected '127-000.000.001|127.0.0.1'
> =A0 =A0 not ok 15 - ip
> =A0 =A0 ok 16 - uuid
> =A0 =A0 ok 17 - dentry
> =A0 =A0 ok 18 - struct_va_format
> =A0 =A0 ok 19 - time_and_date
> =A0 =A0 ok 20 - struct_clk
> =A0 =A0 ok 21 - bitmap
> =A0 =A0 ok 22 - netdev_features
> =A0 =A0 ok 23 - flags
> =A0 =A0 ok 24 - errptr
> =A0 =A0 ok 25 - fwnode_pointer
> not ok 1 - printf

Better, indeed.

But can be this improved to have a cumulative statistics, like showing only
number of total, succeeded, failed with details of the latter ones?

> This patch is based on top of Andy's series that renames KUnit based
> tests in lib/ and Ramsus' series on deterministic random testing.

For the reference:
https://lore.kernel.org/linux-kselftest/20201016110836.52613-1-andriy.shevc=
henko@linux.intel.com/

...

> -static void __init
> -test_string(void)
> +static void
> +test_string(struct kunit *ktest)

I guess no need anymore to keep them on two lines, just combine to one line.

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
