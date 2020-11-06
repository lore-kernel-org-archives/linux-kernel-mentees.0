Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC34C5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 04:05:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC7F0206F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 04:05:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCZfpCIq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC7F0206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5458F87362;
	Fri,  6 Nov 2020 04:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R4nCLxtkv8Vz; Fri,  6 Nov 2020 04:05:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 866E087213;
	Fri,  6 Nov 2020 04:05:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72398C088B;
	Fri,  6 Nov 2020 04:05:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EE7EC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 04:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EEC468685A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 04:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lV2pDmUEQd1h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 04:05:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F409C85659
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 04:05:01 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id f38so2952903pgm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Nov 2020 20:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tSjZkeVvKfttIleOvmEj75W/c02ILM34aNIYLdMmR/Y=;
 b=HCZfpCIqxx6QwtvwBSQvKZH2eEdeYO+ZfoOE2qobk6TAOkK+3dk5g6BgT0XidAtzji
 R8nXQdl0cL1SbbVPfvTZ/JJXkXPGXDA++j7LMjb2PaFkaHL1WusV/oV+hXyzjGUutX7G
 Usx3CPQzQKnzATRrR++FQZEayvZEZDP0E0RnkSjCOEK4BnizkoQMGPNe1sx19zrAbTUJ
 YJySSbpDcRrUXS4hIYi126u4g8q+gh+jafAqZ1aSHbrSWWnopi4G62go6QbjL/LFhNro
 UFiYjPYQh1oHegvYJxMJ0myJ4Uq7Tw+MPtncsaC4ZZloJvTuI31XGinUPt1wFtAt+Z4c
 l5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tSjZkeVvKfttIleOvmEj75W/c02ILM34aNIYLdMmR/Y=;
 b=DOCzd52Q9lJjLE57z4zclnnsbGo6oU5BGhb4XGBgiSe9pA4KfaM943RtwbV+wvjU1U
 PiDtxwPmNfpEfHH4qkeiK3edTDSovbaqcMZn9/HYOVqmy4aQJgY8pcldZAcfo4cEerrq
 MDC0nJlUaghXor0dNHTP6/shcS13eh7tWMnSkWd7c+pT3XWTbMMWqueMUDfkGSJKl5j5
 +R3w89hKCL43+GUAn4J+LyAY/UR3z2Q+f5AsaoHQDvkzAkxAEtU62eJj0NBMAhqvTnA/
 /0HuqDDsoyZmU34Tf5lTWtC4f7HkbHojXVs/pD7bD7973eO78Q8mhbKPk26CkJzxA9au
 Lt1g==
X-Gm-Message-State: AOAM533BprN7164oyTDVJcKwOdDvXdmT1DpGYOWU2A3Q1P1BP7GBKgLK
 Pm1UU03UUNGuDXqO65tD27spoGKAlCBWTk/K
X-Google-Smtp-Source: ABdhPJycakI4ERbODPpOJps13UtP6fCu+Eeq9f2IcF+3D5RRhtl2PDGal3+wuzCvW4YPvkPVjEcHzQ==
X-Received: by 2002:a17:90a:11:: with SMTP id 17mr320751pja.66.1604635501146; 
 Thu, 05 Nov 2020 20:05:01 -0800 (PST)
Received: from [192.168.86.81] ([106.51.243.217])
 by smtp.gmail.com with ESMTPSA id 21sm117705pfw.105.2020.11.05.20.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 20:05:00 -0800 (PST)
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Petr Mladek <pmladek@suse.com>, Greg KH <gregkh@linuxfoundation.org>
References: <20201103111049.51916-1-98.arpi@gmail.com>
 <20201103113353.GC4077@smile.fi.intel.com>
 <20201103115223.GA268796@kroah.com> <20201103160728.GQ20201@alley>
 <57976ff4-7845-d721-ced1-1fe439000a9b@rasmusvillemoes.dk>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <b24a8200-b456-ecab-cc60-6f4ff10baa5d@gmail.com>
Date: Fri, 6 Nov 2020 09:34:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <57976ff4-7845-d721-ced1-1fe439000a9b@rasmusvillemoes.dk>
Content-Language: en-US
Cc: alexandre.belloni@bootlin.com, rdunlap@infradead.org,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 04/11/20 1:48 pm, Rasmus Villemoes wrote:
> On 03/11/2020 17.11, Petr Mladek wrote:
>> On Tue 2020-11-03 12:52:23, Greg KH wrote:
>>> On Tue, Nov 03, 2020 at 01:33:53PM +0200, Andy Shevchenko wrote:
>>>> On Tue, Nov 03, 2020 at 04:40:49PM +0530, Arpitha Raghunandan wrote:
>>>>> Convert test lib/test_printf.c to KUnit. More information about
>>>>> KUnit can be found at:
>>>>> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
>>>>> KUnit provides a common framework for unit tests in the kernel.
>>>>> KUnit and kselftest are standardizing around KTAP, converting this
>>>>> test to KUnit makes this test output in KTAP which we are trying to
>>>>> make the standard test result format for the kernel. More about
>>>>> the KTAP format can be found at:
>>>>> https://lore.kernel.org/linux-kselftest/CY4PR13MB1175B804E31E502221BC=
8163FD830@CY4PR13MB1175.namprd13.prod.outlook.com/.
>>>>> I ran both the original and converted tests as is to produce the
>>>>> output for success of the test in the two cases. I also ran these
>>>>> tests with a small modification to show the difference in the output
>>>>> for failure of the test in both cases. The modification I made is:
>>>>> - test("127.000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.si=
n_addr);
>>>>> + test("127-000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.si=
n_addr);
>>>>>
>>>>> Original test success:
>>>>> [    0.540860] test_printf: loaded.
>>>>> [    0.540863] test_printf: random seed =3D 0x5c46c33837bc0619
>>>>> [    0.541022] test_printf: all 388 tests passed
>>>>>
>>>>> Original test failure:
>>>>> [    0.537980] test_printf: loaded.
>>>>> [    0.537983] test_printf: random seed =3D 0x1bc1efd881954afb
>>>>> [    0.538029] test_printf: vsnprintf(buf, 256, "%pi4|%pI4", ...) wro=
te '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
>>>>> [    0.538030] test_printf: kvasprintf(..., "%pi4|%pI4", ...) returne=
d '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
>>>>> [    0.538124] test_printf: failed 2 out of 388 tests
>>>>> [    0.538125] test_printf: random seed used was 0x1bc1efd881954afb
>>>>>
>>>>> Converted test success:
>>>>> =A0 =A0 # Subtest: printf
>>>>> =A0 =A0 1..25
>>>>> =A0 =A0 ok 1 - test_basic
>>>>> =A0 =A0 ok 2 - test_number
>>>>> =A0 =A0 ok 3 - test_string
>>>>> =A0 =A0 ok 4 - plain
>>>>> =A0 =A0 ok 5 - null_pointer
>>>>> =A0 =A0 ok 6 - error_pointer
>>>>> =A0 =A0 ok 7 - invalid_pointer
>>>>> =A0 =A0 ok 8 - symbol_ptr
>>>>> =A0 =A0 ok 9 - kernel_ptr
>>>>> =A0 =A0 ok 10 - struct_resource
>>>>> =A0 =A0 ok 11 - addr
>>>>> =A0 =A0 ok 12 - escaped_str
>>>>> =A0 =A0 ok 13 - hex_string
>>>>> =A0 =A0 ok 14 - mac
>>>>> =A0 =A0 ok 15 - ip
>>>>> =A0 =A0 ok 16 - uuid
>>>>> =A0 =A0 ok 17 - dentry
>>>>> =A0 =A0 ok 18 - struct_va_format
>>>>> =A0 =A0 ok 19 - time_and_date
>>>>> =A0 =A0 ok 20 - struct_clk
>>>>> =A0 =A0 ok 21 - bitmap
>>>>> =A0 =A0 ok 22 - netdev_features
>>>>> =A0 =A0 ok 23 - flags
>>>>> =A0 =A0 ok 24 - errptr
>>>>> =A0 =A0 ok 25 - fwnode_pointer
>>>>> ok 1 - printf
>>>>>
>>>>> Converted test failure:
>>>>> =A0 =A0 # Subtest: printf
>>>>> =A0 =A0 1..25
>>>>> =A0 =A0 ok 1 - test_basic
>>>>> =A0 =A0 ok 2 - test_number
>>>>> =A0 =A0 ok 3 - test_string
>>>>> =A0 =A0 ok 4 - plain
>>>>> =A0 =A0 ok 5 - null_pointer
>>>>> =A0 =A0 ok 6 - error_pointer
>>>>> =A0 =A0 ok 7 - invalid_pointer
>>>>> =A0 =A0 ok 8 - symbol_ptr
>>>>> =A0 =A0 ok 9 - kernel_ptr
>>>>> =A0 =A0 ok 10 - struct_resource
>>>>> =A0 =A0 ok 11 - addr
>>>>> =A0 =A0 ok 12 - escaped_str
>>>>> =A0 =A0 ok 13 - hex_string
>>>>> =A0 =A0 ok 14 - mac
>>>>> =A0 =A0 # ip: EXPECTATION FAILED at lib/printf_kunit.c:82
>>>>> vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote '127.000.000.001|127.0.0.=
1', expected '127-000.000.001|127.0.0.1'
>>>>> =A0 =A0 # ip: EXPECTATION FAILED at lib/printf_kunit.c:124
>>>>> kvasprintf(..., "%pi4|%pI4", ...) returned '127.000.000.001|127.0.0.1=
', expected '127-000.000.001|127.0.0.1'
>>>>> =A0 =A0 not ok 15 - ip
>>>>> =A0 =A0 ok 16 - uuid
>>>>> =A0 =A0 ok 17 - dentry
>>>>> =A0 =A0 ok 18 - struct_va_format
>>>>> =A0 =A0 ok 19 - time_and_date
>>>>> =A0 =A0 ok 20 - struct_clk
>>>>> =A0 =A0 ok 21 - bitmap
>>>>> =A0 =A0 ok 22 - netdev_features
>>>>> =A0 =A0 ok 23 - flags
>>>>> =A0 =A0 ok 24 - errptr
>>>>> =A0 =A0 ok 25 - fwnode_pointer
>>>>> not ok 1 - printf
>>>>
>>>> Better, indeed.
>>>>
>>>> But can be this improved to have a cumulative statistics, like showing=
 only
>>>> number of total, succeeded, failed with details of the latter ones?
>>>
>>> Is that the proper test output format?  We have a standard...
> =

> Actually more like xkcd#927.
> =

>>
>> What is the standard, please?
>>
>> The original module produced:
>>
>> [   48.577739] test_printf: loaded.
>> [   48.578046] test_printf: all 388 tests passed
>>
>> It comes from KSTM_MODULE_LOADERS() macro that has been created
>> by the commit eebf4dd452377921e3a26 ("kselftest: Add test module
>> framework header"). =

> =

> That's a bit of a simplification. That code was clearly lifted directly
> from the original test_printf.c code
> (707cc7280f452a162c52bc240eae62568b9753c2). test_bitmap.c cloned
> test_printf.c (including a "Test cases for printf facility" comment...).
> Later both were converted to use the KSTM header.
> =

> As the one coming up with that originally, I certainly endorse its use
> as a standard way of producing a final, free-form, summary, and I prefer
> to keep that total tally (i.e. 388) being printed for the reasons I've
> previously stated. [*]
> =

> That said, I have absolutely nothing against _also_ producing
> machine-parsable TAP output. And the above looks to be a good compromise
> between spitting out one TAP line for each of the 388 test cases (or
> checks, or atoms, whatever the indiviual parts are to be called) and
> treating all of test_printf.c as one single PASS/FAIL test.
> =

> [*] If I add some test cases to the time_and_date and run the kernel
> under virtme, I want to see 388 becoming something else, so that I know
> that I actually ran the code I just added and not some stale vmlinux -
> maybe I only did "make lib/test_printf.o" and didn't recreate vmlinux,
> maybe I did "make vmlinux" but failed to notice the build was broken. BTD=
T.
> =

> And those summary lines are even more important to keep given my
> "deterministic random testing" series - the seed used _must_ be reported
> (preferably also in the "all good" case, but certainly in the "some
> failed" case).
> =

> Arpitha, thank you for taking that series into account. Is there some
> way to keep the print of the total number of "atoms" as well as the
> reporting of the random seed? Or should the "deterministic random
> testing" be done in the context of KUNIT rather than KSTM? I'm really
> not sure why we have both nor which one one is supposed to write
> against. But I would prefer that the framework, whichever one, provides
> a means to get a deterministic sequence of random numbers, so that I
> won't have to eventually copy-paste the boilerplate to test_sort.c and
> test_list_sort.c - it's also much nicer if all test modules have a
> somewhat consistent interface in terms of the module parameters they acce=
pt.
> =

> Rasmus
> =


The total number of "atoms" can be printed by maintaining a static variable
total_count that can be incremented as is in the original test_printf test.
But, the reporting of the random seed currently is done in kselftest and so
will not show up with KUnit. I am not really sure which is better in this c=
ase.

Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
