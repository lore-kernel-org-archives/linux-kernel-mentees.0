Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2DAC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 16:11:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 934BE22280
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 16:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="a1Td+VeG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 934BE22280
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 25EF486265;
	Tue,  3 Nov 2020 16:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BlJNtJtqMKxW; Tue,  3 Nov 2020 16:11:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D17178625B;
	Tue,  3 Nov 2020 16:11:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8E99C0889;
	Tue,  3 Nov 2020 16:11:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF922C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 16:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BCDB7868CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 16:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZmYj-Esd8K9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 16:11:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTP id 38BDE868B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 16:11:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1604419907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=912wLAtwiZtWYV37HC58nqgMqZ/w1BjjSjMt3yAAK5w=;
 b=a1Td+VeGkIiIcno9Dj7Jd2v0kg+qdD3Pt42xSyd6f59CbcdUQHXTc/MrEQLv/OCIZcqnRi
 s091kK1dYeQsDk8ADWSOrSRExIAzzst6x/DZ1sjV3z8PMhj5829zcvgpCmyx52lxbUE5KZ
 a6Uo9j4S4OjGPTX5gPwldtU2W0HANfg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AEADDAD35;
 Tue,  3 Nov 2020 16:11:47 +0000 (UTC)
Date: Tue, 3 Nov 2020 17:11:47 +0100
From: Petr Mladek <pmladek@suse.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20201103160728.GQ20201@alley>
References: <20201103111049.51916-1-98.arpi@gmail.com>
 <20201103113353.GC4077@smile.fi.intel.com>
 <20201103115223.GA268796@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103115223.GA268796@kroah.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, alexandre.belloni@bootlin.com,
 linux@rasmusvillemoes.dk, rdunlap@infradead.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 sergey.senozhatsky@gmail.com, linux-kselftest@vger.kernel.org,
 idryomov@gmail.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

On Tue 2020-11-03 12:52:23, Greg KH wrote:
> On Tue, Nov 03, 2020 at 01:33:53PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 03, 2020 at 04:40:49PM +0530, Arpitha Raghunandan wrote:
> > > Convert test lib/test_printf.c to KUnit. More information about
> > > KUnit can be found at:
> > > https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
> > > KUnit provides a common framework for unit tests in the kernel.
> > > KUnit and kselftest are standardizing around KTAP, converting this
> > > test to KUnit makes this test output in KTAP which we are trying to
> > > make the standard test result format for the kernel. More about
> > > the KTAP format can be found at:
> > > https://lore.kernel.org/linux-kselftest/CY4PR13MB1175B804E31E502221BC=
8163FD830@CY4PR13MB1175.namprd13.prod.outlook.com/.
> > > I ran both the original and converted tests as is to produce the
> > > output for success of the test in the two cases. I also ran these
> > > tests with a small modification to show the difference in the output
> > > for failure of the test in both cases. The modification I made is:
> > > - test("127.000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.si=
n_addr);
> > > + test("127-000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.si=
n_addr);
> > > =

> > > Original test success:
> > > [    0.540860] test_printf: loaded.
> > > [    0.540863] test_printf: random seed =3D 0x5c46c33837bc0619
> > > [    0.541022] test_printf: all 388 tests passed
> > > =

> > > Original test failure:
> > > [    0.537980] test_printf: loaded.
> > > [    0.537983] test_printf: random seed =3D 0x1bc1efd881954afb
> > > [    0.538029] test_printf: vsnprintf(buf, 256, "%pi4|%pI4", ...) wro=
te '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
> > > [    0.538030] test_printf: kvasprintf(..., "%pi4|%pI4", ...) returne=
d '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
> > > [    0.538124] test_printf: failed 2 out of 388 tests
> > > [    0.538125] test_printf: random seed used was 0x1bc1efd881954afb
> > > =

> > > Converted test success:
> > > =A0 =A0 # Subtest: printf
> > > =A0 =A0 1..25
> > > =A0 =A0 ok 1 - test_basic
> > > =A0 =A0 ok 2 - test_number
> > > =A0 =A0 ok 3 - test_string
> > > =A0 =A0 ok 4 - plain
> > > =A0 =A0 ok 5 - null_pointer
> > > =A0 =A0 ok 6 - error_pointer
> > > =A0 =A0 ok 7 - invalid_pointer
> > > =A0 =A0 ok 8 - symbol_ptr
> > > =A0 =A0 ok 9 - kernel_ptr
> > > =A0 =A0 ok 10 - struct_resource
> > > =A0 =A0 ok 11 - addr
> > > =A0 =A0 ok 12 - escaped_str
> > > =A0 =A0 ok 13 - hex_string
> > > =A0 =A0 ok 14 - mac
> > > =A0 =A0 ok 15 - ip
> > > =A0 =A0 ok 16 - uuid
> > > =A0 =A0 ok 17 - dentry
> > > =A0 =A0 ok 18 - struct_va_format
> > > =A0 =A0 ok 19 - time_and_date
> > > =A0 =A0 ok 20 - struct_clk
> > > =A0 =A0 ok 21 - bitmap
> > > =A0 =A0 ok 22 - netdev_features
> > > =A0 =A0 ok 23 - flags
> > > =A0 =A0 ok 24 - errptr
> > > =A0 =A0 ok 25 - fwnode_pointer
> > > ok 1 - printf
> > > =

> > > Converted test failure:
> > > =A0 =A0 # Subtest: printf
> > > =A0 =A0 1..25
> > > =A0 =A0 ok 1 - test_basic
> > > =A0 =A0 ok 2 - test_number
> > > =A0 =A0 ok 3 - test_string
> > > =A0 =A0 ok 4 - plain
> > > =A0 =A0 ok 5 - null_pointer
> > > =A0 =A0 ok 6 - error_pointer
> > > =A0 =A0 ok 7 - invalid_pointer
> > > =A0 =A0 ok 8 - symbol_ptr
> > > =A0 =A0 ok 9 - kernel_ptr
> > > =A0 =A0 ok 10 - struct_resource
> > > =A0 =A0 ok 11 - addr
> > > =A0 =A0 ok 12 - escaped_str
> > > =A0 =A0 ok 13 - hex_string
> > > =A0 =A0 ok 14 - mac
> > > =A0 =A0 # ip: EXPECTATION FAILED at lib/printf_kunit.c:82
> > > vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote '127.000.000.001|127.0.0.=
1', expected '127-000.000.001|127.0.0.1'
> > > =A0 =A0 # ip: EXPECTATION FAILED at lib/printf_kunit.c:124
> > > kvasprintf(..., "%pi4|%pI4", ...) returned '127.000.000.001|127.0.0.1=
', expected '127-000.000.001|127.0.0.1'
> > > =A0 =A0 not ok 15 - ip
> > > =A0 =A0 ok 16 - uuid
> > > =A0 =A0 ok 17 - dentry
> > > =A0 =A0 ok 18 - struct_va_format
> > > =A0 =A0 ok 19 - time_and_date
> > > =A0 =A0 ok 20 - struct_clk
> > > =A0 =A0 ok 21 - bitmap
> > > =A0 =A0 ok 22 - netdev_features
> > > =A0 =A0 ok 23 - flags
> > > =A0 =A0 ok 24 - errptr
> > > =A0 =A0 ok 25 - fwnode_pointer
> > > not ok 1 - printf
> > =

> > Better, indeed.
> > =

> > But can be this improved to have a cumulative statistics, like showing =
only
> > number of total, succeeded, failed with details of the latter ones?
> =

> Is that the proper test output format?  We have a standard...

What is the standard, please?

The original module produced:

[   48.577739] test_printf: loaded.
[   48.578046] test_printf: all 388 tests passed

It comes from KSTM_MODULE_LOADERS() macro that has been created
by the commit eebf4dd452377921e3a26 ("kselftest: Add test module
framework header"). There are 3 users:

$> git grep KSTM_MODULE_LOADERS
Documentation/dev-tools/kselftest.rst:   KSTM_MODULE_LOADERS(test_foo);
lib/test_bitmap.c:KSTM_MODULE_LOADERS(test_bitmap);
lib/test_printf.c:KSTM_MODULE_LOADERS(test_printf);
lib/test_strscpy.c:KSTM_MODULE_LOADERS(test_strscpy);
tools/testing/selftests/kselftest_module.h:#define KSTM_MODULE_LOADERS(__mo=
dule)                        \


When I looked for similar strings then I see huge creativity:

drivers/firmware/psci/psci_checker.c:           pr_info("Hotplug tests pass=
ed OK\n");
drivers/firmware/psci/psci_checker.c:           pr_info("Suspend tests pass=
ed OK\n");
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:            seq_printf(m, "ib r=
ing tests passed.\n");
drivers/mtd/chips/jedec_probe.c:        /* all tests passed - mark  as succ=
ess */
drivers/usb/host/xhci-mem.c:    xhci_dbg(xhci, "TRB math tests passed.\n");
fs/unicode/utf8-selftest.c:             pr_info("All %u tests passed\n", to=
tal_tests);
kernel/kcsan/selftest.c:        pr_info("selftest: %d/%d tests passed\n", p=
assed, total);
lib/crc32test.c:                pr_info("crc32c: self tests passed, process=
ed %d bytes in %lld nsec\n",
lib/crc32test.c:                pr_info("crc32c_combine: %d self tests pass=
ed\n", runs);
lib/crc32test.c:                pr_info("crc32: self tests passed, processe=
d %d bytes in %lld nsec\n",
lib/crc32test.c:                pr_info("crc32_combine: %d self tests passe=
d\n", runs);
lib/globtest.c:         KERN_INFO "glob: %u self-tests passed, %u failed\n";
lib/random32.c:         pr_info("prandom: %d self tests passed\n", runs);
lib/test_hash.c:        pr_notice("%u tests passed.", tests);
lib/test_hexdump.c:             pr_info("all %u tests passed\n", total_test=
s);
lib/test_ida.c: printk("IDA: %u of %u tests passed\n", tests_passed, tests_=
run);
lib/test_meminit.c:             pr_info("all %d tests passed!\n", num_tests=
);
lib/test_overflow.c:            pr_info("all tests passed\n");
lib/test_stackinit.c:           pr_info("all tests passed!\n");
lib/test_user_copy.c:           pr_info("tests passed.\n");
lib/test_uuid.c:                pr_info("all %u tests passed\n", total_test=
s);
lib/test_xarray.c:      printk("XArray: %u of %u tests passed\n", tests_pas=
sed, tests_run);
tools/bootconfig/test-bootconfig.sh:    echo "All tests passed"
Binary file tools/testing/kunit/test_data/test_is_test_passed-all_passed.lo=
g matches
Binary file tools/testing/kunit/test_data/test_is_test_passed-crash.log mat=
ches
Binary file tools/testing/kunit/test_data/test_is_test_passed-failure.log m=
atches
Binary file tools/testing/kunit/test_data/test_output_isolated_correctly.lo=
g matches
tools/testing/selftests/bpf/test_tc_tunnel.sh:  echo "OK. All tests passed"
tools/testing/selftests/bpf/test_xdping.sh:echo "OK. All tests passed"
tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c:     printf("Ioctl compa=
tibility tests passed\n");
tools/testing/selftests/kselftest_harness.h:    ksft_print_msg("%s: %u / %u=
 tests passed.\n", ret ? "FAILED" : "PASSED",
tools/testing/selftests/kselftest_module.h:             pr_info("all %u tes=
ts passed\n", total_tests);
tools/testing/selftests/net/ipv6_flowlabel.sh:echo OK. All tests passed
tools/testing/selftests/net/msg_zerocopy.sh:    echo "OK. All tests passed"
tools/testing/selftests/net/psock_fanout.c:     printf("OK. All tests passe=
d\n");
tools/testing/selftests/net/psock_snd.sh:echo "OK. All tests passed"
tools/testing/selftests/net/psock_tpacket.c:    printf("OK. All tests passe=
d\n");
tools/testing/selftests/net/so_txtime.sh:echo OK. All tests passed
tools/testing/selftests/net/txtimestamp.sh:     echo "OK. All tests passed"



From my POV, KUnit is a framework that is supposed to actually
unify many tests.

There is alternative framework maintained by Shuah Khan. In compare
with KUnit, it prints the results in the userspace. The format
is quite similar, for example:

tools/testing/selftests/livepatch/# make run_tests
TAP version 13
1..5
# selftests: livepatch: test-livepatch.sh
# TEST: basic function patching ... ok
# TEST: multiple livepatches ... ok
# TEST: atomic replace livepatch ... ok
ok 1 selftests: livepatch: test-livepatch.sh
# selftests: livepatch: test-callbacks.sh
# TEST: target module before livepatch ... ok
# TEST: module_coming notifier ... ok
# TEST: module_going notifier ... ok
# TEST: module_coming and module_going notifiers ... ok
# TEST: target module not present ... ok
# TEST: pre-patch callback -ENODEV ... ok
# TEST: module_coming + pre-patch callback -ENODEV ... ok
# TEST: multiple target modules ... ok
# TEST: busy target module ... ok
# TEST: multiple livepatches ... ok
# TEST: atomic replace ... ok
ok 2 selftests: livepatch: test-callbacks.sh
# selftests: livepatch: test-shadow-vars.sh
# TEST: basic shadow variable API ... ok
ok 3 selftests: livepatch: test-shadow-vars.sh
# selftests: livepatch: test-state.sh
# TEST: system state modification ... ok
# TEST: taking over system state modification ... ok
# TEST: compatible cumulative livepatches ... ok
# TEST: incompatible cumulative livepatches ... ok
ok 4 selftests: livepatch: test-state.sh
# selftests: livepatch: test-ftrace.sh
# TEST: livepatch interaction with ftrace_enabled sysctl ... ok
ok 5 selftests: livepatch: test-ftrace.sh


I do not have strong meaning what format is better. But the format:

    "doing something ... ok"

is problematic in kernel log because it contains messages
from all kernel activity. As a result, many unrelated messages might
be added between "doing something ..." and "ok". It is much
more reliable with stdout/stderr in userspace.

For kernel, it is more reliable to print results when the test
finishes. And it seems to be "easy" to spot an error in KUnit
report.


That said, it would be nice to see some summary on the very last line.
It would be especially useful when the log is longer than one screen.

The result of every subtest might help to locate the problem when
the system freezes. It might be optional.

I am personally fine with the proposed output of printf_kunit.c.

Best Regards,
Petr
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
