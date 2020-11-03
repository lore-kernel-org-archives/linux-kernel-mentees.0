Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FF9C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 11:51:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A9B21D40
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 11:51:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pd1bnQSk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7A9B21D40
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 223EC86E86;
	Tue,  3 Nov 2020 11:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w0PZJUMHP4rY; Tue,  3 Nov 2020 11:51:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 07A6286DE4;
	Tue,  3 Nov 2020 11:51:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E777AC088B;
	Tue,  3 Nov 2020 11:51:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D517C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 11:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6427686160
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 11:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ejSCQ7Pu30nX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 11:51:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 327E88610E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 11:51:31 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C90BC216C4;
 Tue,  3 Nov 2020 11:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604404290;
 bh=Yly+YBQXz1BJFPkxLQ3+VIkwL3j8nlMITPnLrkow/5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pd1bnQSks9juZc5GStHYlWWB9dC3yW8B/FXDUCh4ICB51qx6joekx5V+03CPVryB7
 GjLbfkLStPJGYTBedQPKpSdlSPhiJ6NZ0XRbq1/U8laYmfVou6Yskb01upui1nCfAX
 VVml7+da8Hejfv8BL3w3XV7QoB4Hns1qYo1AnV8o=
Date: Tue, 3 Nov 2020 12:52:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20201103115223.GA268796@kroah.com>
References: <20201103111049.51916-1-98.arpi@gmail.com>
 <20201103113353.GC4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103113353.GC4077@smile.fi.intel.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, alexandre.belloni@bootlin.com,
 pmladek@suse.com, linux@rasmusvillemoes.dk, rdunlap@infradead.org,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 sergey.senozhatsky@gmail.com, linux-kselftest@vger.kernel.org,
 idryomov@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 kunit-dev@googlegroups.com
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

On Tue, Nov 03, 2020 at 01:33:53PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 03, 2020 at 04:40:49PM +0530, Arpitha Raghunandan wrote:
> > Convert test lib/test_printf.c to KUnit. More information about
> > KUnit can be found at:
> > https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
> > KUnit provides a common framework for unit tests in the kernel.
> > KUnit and kselftest are standardizing around KTAP, converting this
> > test to KUnit makes this test output in KTAP which we are trying to
> > make the standard test result format for the kernel. More about
> > the KTAP format can be found at:
> > https://lore.kernel.org/linux-kselftest/CY4PR13MB1175B804E31E502221BC81=
63FD830@CY4PR13MB1175.namprd13.prod.outlook.com/.
> > I ran both the original and converted tests as is to produce the
> > output for success of the test in the two cases. I also ran these
> > tests with a small modification to show the difference in the output
> > for failure of the test in both cases. The modification I made is:
> > - test("127.000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin_=
addr);
> > + test("127-000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin_=
addr);
> > =

> > Original test success:
> > [    0.540860] test_printf: loaded.
> > [    0.540863] test_printf: random seed =3D 0x5c46c33837bc0619
> > [    0.541022] test_printf: all 388 tests passed
> > =

> > Original test failure:
> > [    0.537980] test_printf: loaded.
> > [    0.537983] test_printf: random seed =3D 0x1bc1efd881954afb
> > [    0.538029] test_printf: vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote=
 '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
> > [    0.538030] test_printf: kvasprintf(..., "%pi4|%pI4", ...) returned =
'127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
> > [    0.538124] test_printf: failed 2 out of 388 tests
> > [    0.538125] test_printf: random seed used was 0x1bc1efd881954afb
> > =

> > Converted test success:
> > =A0 =A0 # Subtest: printf
> > =A0 =A0 1..25
> > =A0 =A0 ok 1 - test_basic
> > =A0 =A0 ok 2 - test_number
> > =A0 =A0 ok 3 - test_string
> > =A0 =A0 ok 4 - plain
> > =A0 =A0 ok 5 - null_pointer
> > =A0 =A0 ok 6 - error_pointer
> > =A0 =A0 ok 7 - invalid_pointer
> > =A0 =A0 ok 8 - symbol_ptr
> > =A0 =A0 ok 9 - kernel_ptr
> > =A0 =A0 ok 10 - struct_resource
> > =A0 =A0 ok 11 - addr
> > =A0 =A0 ok 12 - escaped_str
> > =A0 =A0 ok 13 - hex_string
> > =A0 =A0 ok 14 - mac
> > =A0 =A0 ok 15 - ip
> > =A0 =A0 ok 16 - uuid
> > =A0 =A0 ok 17 - dentry
> > =A0 =A0 ok 18 - struct_va_format
> > =A0 =A0 ok 19 - time_and_date
> > =A0 =A0 ok 20 - struct_clk
> > =A0 =A0 ok 21 - bitmap
> > =A0 =A0 ok 22 - netdev_features
> > =A0 =A0 ok 23 - flags
> > =A0 =A0 ok 24 - errptr
> > =A0 =A0 ok 25 - fwnode_pointer
> > ok 1 - printf
> > =

> > Converted test failure:
> > =A0 =A0 # Subtest: printf
> > =A0 =A0 1..25
> > =A0 =A0 ok 1 - test_basic
> > =A0 =A0 ok 2 - test_number
> > =A0 =A0 ok 3 - test_string
> > =A0 =A0 ok 4 - plain
> > =A0 =A0 ok 5 - null_pointer
> > =A0 =A0 ok 6 - error_pointer
> > =A0 =A0 ok 7 - invalid_pointer
> > =A0 =A0 ok 8 - symbol_ptr
> > =A0 =A0 ok 9 - kernel_ptr
> > =A0 =A0 ok 10 - struct_resource
> > =A0 =A0 ok 11 - addr
> > =A0 =A0 ok 12 - escaped_str
> > =A0 =A0 ok 13 - hex_string
> > =A0 =A0 ok 14 - mac
> > =A0 =A0 # ip: EXPECTATION FAILED at lib/printf_kunit.c:82
> > vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote '127.000.000.001|127.0.0.1'=
, expected '127-000.000.001|127.0.0.1'
> > =A0 =A0 # ip: EXPECTATION FAILED at lib/printf_kunit.c:124
> > kvasprintf(..., "%pi4|%pI4", ...) returned '127.000.000.001|127.0.0.1',=
 expected '127-000.000.001|127.0.0.1'
> > =A0 =A0 not ok 15 - ip
> > =A0 =A0 ok 16 - uuid
> > =A0 =A0 ok 17 - dentry
> > =A0 =A0 ok 18 - struct_va_format
> > =A0 =A0 ok 19 - time_and_date
> > =A0 =A0 ok 20 - struct_clk
> > =A0 =A0 ok 21 - bitmap
> > =A0 =A0 ok 22 - netdev_features
> > =A0 =A0 ok 23 - flags
> > =A0 =A0 ok 24 - errptr
> > =A0 =A0 ok 25 - fwnode_pointer
> > not ok 1 - printf
> =

> Better, indeed.
> =

> But can be this improved to have a cumulative statistics, like showing on=
ly
> number of total, succeeded, failed with details of the latter ones?

Is that the proper test output format?  We have a standard...

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
