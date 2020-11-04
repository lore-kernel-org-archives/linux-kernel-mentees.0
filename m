Return-Path: <SRS0=I1jd=EK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545F0C4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 08:18:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D75EF22203
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 08:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="B4prvxYn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D75EF22203
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1DCAF861AF;
	Wed,  4 Nov 2020 08:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KI6zm-YHa4BC; Wed,  4 Nov 2020 08:18:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D53685A37;
	Wed,  4 Nov 2020 08:18:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FDD1C088B;
	Wed,  4 Nov 2020 08:18:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1240EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 08:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F23F0860F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 08:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qzg8pVAymyHA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 08:18:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 41FC685A37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 08:18:12 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id w13so15020780eju.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Nov 2020 00:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jYqIyFwSLs/OqBhyAWSk+CtF1X1B/qrYVtgT1gy73dM=;
 b=B4prvxYny/32AA88zpBcKKVgbvsVev60ocMH7KQlGR+u75q1xnTsiGtdZSZSQNslsZ
 +Y79fuAh0MAShhOY3e3XQDp0aLJHX2pbVLYcfBOpEaHkR0kH5FP8JjEJQxpqxi+ZIgt4
 8+kicUWLyA4EtLw6XFPlYCp8wE1jJ/+aF+SrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jYqIyFwSLs/OqBhyAWSk+CtF1X1B/qrYVtgT1gy73dM=;
 b=FDZVChvow7W5MdEW2NpkPNe2v0U55t6Chm3SGO3DFzWd2j4Nj64a/Hzr9ADokE4VS/
 c3VkMIhtkJkwoikezMYe3BS3286Vrmw0QHlQxLrSyWY5RLjXWNGr9jUf24H5XLStEqtl
 s2ljDc5wS2aZxBXkwUziHrjNfsDFciiKHoEQNIiN1oexI8mjJ+yAqfEi4CROzXfxllwJ
 pG9A+LPz1K/VgYhdadSXLA0l6m9DfmJtq4A5MNZTv3LYSThQnJny+JYV61s1iEJaaKJm
 ncUUneI+Fm/5q5TdD+5RyFEyZCWf0T+G9k/GYyXX0Ce1xzX9POY0Ax8D1Ftjwegz/u5C
 ZK3Q==
X-Gm-Message-State: AOAM531LM5Xsm9Dar7FP0gzd4z2bMlLz0XqKOIbCdnV1Bh9kAQhdTRz4
 8hrRcTZy3Js9wMtU6qklVYKVxpwQBxqWzAjS7ng=
X-Google-Smtp-Source: ABdhPJwBR9OOAn1FxDCS2K2s9cFAOwgnDbbXH7VDaj636qDavd8UoAFyEv7BJlJHcitF1KmjQyMdKQ==
X-Received: by 2002:a17:906:d8b3:: with SMTP id
 qc19mr17103695ejb.222.1604477890884; 
 Wed, 04 Nov 2020 00:18:10 -0800 (PST)
Received: from [172.16.11.132] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id rp28sm566074ejb.77.2020.11.04.00.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 00:18:10 -0800 (PST)
To: Petr Mladek <pmladek@suse.com>, Greg KH <gregkh@linuxfoundation.org>
References: <20201103111049.51916-1-98.arpi@gmail.com>
 <20201103113353.GC4077@smile.fi.intel.com>
 <20201103115223.GA268796@kroah.com> <20201103160728.GQ20201@alley>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <57976ff4-7845-d721-ced1-1fe439000a9b@rasmusvillemoes.dk>
Date: Wed, 4 Nov 2020 09:18:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201103160728.GQ20201@alley>
Content-Language: en-US
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, alexandre.belloni@bootlin.com,
 rdunlap@infradead.org, brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
 linux-kselftest@vger.kernel.org, idryomov@gmail.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 03/11/2020 17.11, Petr Mladek wrote:
> On Tue 2020-11-03 12:52:23, Greg KH wrote:
>> On Tue, Nov 03, 2020 at 01:33:53PM +0200, Andy Shevchenko wrote:
>>> On Tue, Nov 03, 2020 at 04:40:49PM +0530, Arpitha Raghunandan wrote:
>>>> Convert test lib/test_printf.c to KUnit. More information about
>>>> KUnit can be found at:
>>>> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
>>>> KUnit provides a common framework for unit tests in the kernel.
>>>> KUnit and kselftest are standardizing around KTAP, converting this
>>>> test to KUnit makes this test output in KTAP which we are trying to
>>>> make the standard test result format for the kernel. More about
>>>> the KTAP format can be found at:
>>>> https://lore.kernel.org/linux-kselftest/CY4PR13MB1175B804E31E502221BC8=
163FD830@CY4PR13MB1175.namprd13.prod.outlook.com/.
>>>> I ran both the original and converted tests as is to produce the
>>>> output for success of the test in the two cases. I also ran these
>>>> tests with a small modification to show the difference in the output
>>>> for failure of the test in both cases. The modification I made is:
>>>> - test("127.000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin=
_addr);
>>>> + test("127-000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin=
_addr);
>>>>
>>>> Original test success:
>>>> [    0.540860] test_printf: loaded.
>>>> [    0.540863] test_printf: random seed =3D 0x5c46c33837bc0619
>>>> [    0.541022] test_printf: all 388 tests passed
>>>>
>>>> Original test failure:
>>>> [    0.537980] test_printf: loaded.
>>>> [    0.537983] test_printf: random seed =3D 0x1bc1efd881954afb
>>>> [    0.538029] test_printf: vsnprintf(buf, 256, "%pi4|%pI4", ...) wrot=
e '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
>>>> [    0.538030] test_printf: kvasprintf(..., "%pi4|%pI4", ...) returned=
 '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
>>>> [    0.538124] test_printf: failed 2 out of 388 tests
>>>> [    0.538125] test_printf: random seed used was 0x1bc1efd881954afb
>>>>
>>>> Converted test success:
>>>> =A0 =A0 # Subtest: printf
>>>> =A0 =A0 1..25
>>>> =A0 =A0 ok 1 - test_basic
>>>> =A0 =A0 ok 2 - test_number
>>>> =A0 =A0 ok 3 - test_string
>>>> =A0 =A0 ok 4 - plain
>>>> =A0 =A0 ok 5 - null_pointer
>>>> =A0 =A0 ok 6 - error_pointer
>>>> =A0 =A0 ok 7 - invalid_pointer
>>>> =A0 =A0 ok 8 - symbol_ptr
>>>> =A0 =A0 ok 9 - kernel_ptr
>>>> =A0 =A0 ok 10 - struct_resource
>>>> =A0 =A0 ok 11 - addr
>>>> =A0 =A0 ok 12 - escaped_str
>>>> =A0 =A0 ok 13 - hex_string
>>>> =A0 =A0 ok 14 - mac
>>>> =A0 =A0 ok 15 - ip
>>>> =A0 =A0 ok 16 - uuid
>>>> =A0 =A0 ok 17 - dentry
>>>> =A0 =A0 ok 18 - struct_va_format
>>>> =A0 =A0 ok 19 - time_and_date
>>>> =A0 =A0 ok 20 - struct_clk
>>>> =A0 =A0 ok 21 - bitmap
>>>> =A0 =A0 ok 22 - netdev_features
>>>> =A0 =A0 ok 23 - flags
>>>> =A0 =A0 ok 24 - errptr
>>>> =A0 =A0 ok 25 - fwnode_pointer
>>>> ok 1 - printf
>>>>
>>>> Converted test failure:
>>>> =A0 =A0 # Subtest: printf
>>>> =A0 =A0 1..25
>>>> =A0 =A0 ok 1 - test_basic
>>>> =A0 =A0 ok 2 - test_number
>>>> =A0 =A0 ok 3 - test_string
>>>> =A0 =A0 ok 4 - plain
>>>> =A0 =A0 ok 5 - null_pointer
>>>> =A0 =A0 ok 6 - error_pointer
>>>> =A0 =A0 ok 7 - invalid_pointer
>>>> =A0 =A0 ok 8 - symbol_ptr
>>>> =A0 =A0 ok 9 - kernel_ptr
>>>> =A0 =A0 ok 10 - struct_resource
>>>> =A0 =A0 ok 11 - addr
>>>> =A0 =A0 ok 12 - escaped_str
>>>> =A0 =A0 ok 13 - hex_string
>>>> =A0 =A0 ok 14 - mac
>>>> =A0 =A0 # ip: EXPECTATION FAILED at lib/printf_kunit.c:82
>>>> vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote '127.000.000.001|127.0.0.1=
', expected '127-000.000.001|127.0.0.1'
>>>> =A0 =A0 # ip: EXPECTATION FAILED at lib/printf_kunit.c:124
>>>> kvasprintf(..., "%pi4|%pI4", ...) returned '127.000.000.001|127.0.0.1'=
, expected '127-000.000.001|127.0.0.1'
>>>> =A0 =A0 not ok 15 - ip
>>>> =A0 =A0 ok 16 - uuid
>>>> =A0 =A0 ok 17 - dentry
>>>> =A0 =A0 ok 18 - struct_va_format
>>>> =A0 =A0 ok 19 - time_and_date
>>>> =A0 =A0 ok 20 - struct_clk
>>>> =A0 =A0 ok 21 - bitmap
>>>> =A0 =A0 ok 22 - netdev_features
>>>> =A0 =A0 ok 23 - flags
>>>> =A0 =A0 ok 24 - errptr
>>>> =A0 =A0 ok 25 - fwnode_pointer
>>>> not ok 1 - printf
>>>
>>> Better, indeed.
>>>
>>> But can be this improved to have a cumulative statistics, like showing =
only
>>> number of total, succeeded, failed with details of the latter ones?
>>
>> Is that the proper test output format?  We have a standard...

Actually more like xkcd#927.

> =

> What is the standard, please?
> =

> The original module produced:
> =

> [   48.577739] test_printf: loaded.
> [   48.578046] test_printf: all 388 tests passed
> =

> It comes from KSTM_MODULE_LOADERS() macro that has been created
> by the commit eebf4dd452377921e3a26 ("kselftest: Add test module
> framework header"). =


That's a bit of a simplification. That code was clearly lifted directly
from the original test_printf.c code
(707cc7280f452a162c52bc240eae62568b9753c2). test_bitmap.c cloned
test_printf.c (including a "Test cases for printf facility" comment...).
Later both were converted to use the KSTM header.

As the one coming up with that originally, I certainly endorse its use
as a standard way of producing a final, free-form, summary, and I prefer
to keep that total tally (i.e. 388) being printed for the reasons I've
previously stated. [*]

That said, I have absolutely nothing against _also_ producing
machine-parsable TAP output. And the above looks to be a good compromise
between spitting out one TAP line for each of the 388 test cases (or
checks, or atoms, whatever the indiviual parts are to be called) and
treating all of test_printf.c as one single PASS/FAIL test.

[*] If I add some test cases to the time_and_date and run the kernel
under virtme, I want to see 388 becoming something else, so that I know
that I actually ran the code I just added and not some stale vmlinux -
maybe I only did "make lib/test_printf.o" and didn't recreate vmlinux,
maybe I did "make vmlinux" but failed to notice the build was broken. BTDT.

And those summary lines are even more important to keep given my
"deterministic random testing" series - the seed used _must_ be reported
(preferably also in the "all good" case, but certainly in the "some
failed" case).

Arpitha, thank you for taking that series into account. Is there some
way to keep the print of the total number of "atoms" as well as the
reporting of the random seed? Or should the "deterministic random
testing" be done in the context of KUNIT rather than KSTM? I'm really
not sure why we have both nor which one one is supposed to write
against. But I would prefer that the framework, whichever one, provides
a means to get a deterministic sequence of random numbers, so that I
won't have to eventually copy-paste the boilerplate to test_sort.c and
test_list_sort.c - it's also much nicer if all test modules have a
somewhat consistent interface in terms of the module parameters they accept.

Rasmus
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
