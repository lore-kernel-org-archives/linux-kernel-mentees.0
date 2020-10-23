Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A61C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 13:43:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B97820FC3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 13:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrItvfJQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B97820FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E8D286E15;
	Fri, 23 Oct 2020 13:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id liGPtQsfNFAl; Fri, 23 Oct 2020 13:43:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2865A86DE7;
	Fri, 23 Oct 2020 13:43:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD97BC088B;
	Fri, 23 Oct 2020 13:43:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77F47C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 13:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6972F8738B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 13:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljKZRXjKUDd8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 13:43:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A805E8737F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 13:43:13 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id e15so1323140pfh.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 06:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pmBXrQ+H88lZLbmY7ae4U43AsAKG0QhpFdqTk84uGF0=;
 b=KrItvfJQHQ21qy5s8Tjz16tMM+oZgp1LkXY4KLVk4d1JGLZjK/P0DIQfKJDtGV483j
 YKvyiY/gmKVMZrQPYqhPHABHp80chuYsYOgA8X06mFz1KT2iWDji57Cwby3NdAO3qvd7
 x0wcd0hjILLFqVsi4swGWFrK/Bk4A6PX9EOBfMjDsHDgKbTQb4/kwByRbIbRSVbXfSzO
 lsoOL8R3RGKzaA5vMS7Ou3rkvXXVwYTUTsigwY6lOqd6ONNl9M42HPjdCppqGIH8obZ9
 b/w+d8OsTEClwG8DMyFUaL5jludC12FBBv8zXX/zBvAzRHPUOFkg1TGfAWMoCMHJ4j+J
 OlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pmBXrQ+H88lZLbmY7ae4U43AsAKG0QhpFdqTk84uGF0=;
 b=scnltCOjlt1G+5if2ydJ61H8KRIPPyNckozkzdcsw6Ufue/7CCvSaKZSDJ+wlWACEW
 eEt5zx7Nv8fBxctN7uQba4NCk7eB6GyZFuMQ6rnUlIXwWIg1ndQLV2R5IoryRmZ2s4JB
 QQuiDiVT6DsjM44IH7XVbQUzMwimaa2bOJ9NVhrz8YNFHOjczWTcoHohFFP9O2PzxT8b
 ylWgr/4ClZt9LRJBIJrhTUhGYccqdChTy4pq7inok/TlA/Q0K0F1crzqO2ExZ2dpnrbo
 e92vlMGCivBntbo1wVJ2BVB3nJH/dco1udDBbrcMTJs+Jev9b/DTfDRuyR7m09ufARAv
 hraQ==
X-Gm-Message-State: AOAM532QoH/lCU9RCYMkhtlTZAuhy3ddJXIjyY0fE+IeX0hA8viFh7YS
 Kap0aKIFOERPloZJ884Lupoj9bZh30pGd72w
X-Google-Smtp-Source: ABdhPJxhTREG7RovyQQGCW1i9tNADzaozg3O8mnWd+ll8yyFFaHALVg+4uOpmqxfDL1Gn6kKZMpq0Q==
X-Received: by 2002:a62:2905:0:b029:15b:57ef:3356 with SMTP id
 p5-20020a6229050000b029015b57ef3356mr2100428pfp.36.1603460592134; 
 Fri, 23 Oct 2020 06:43:12 -0700 (PDT)
Received: from [192.168.86.81] ([106.51.242.32])
 by smtp.gmail.com with ESMTPSA id d7sm2116014pgh.17.2020.10.23.06.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 06:43:11 -0700 (PDT)
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20201022151349.47436-1-98.arpi@gmail.com>
 <20201022191606.GQ4077@smile.fi.intel.com>
 <0ab618c7-8c5c-00ae-8e08-0c1b99f3bf5c@rasmusvillemoes.dk>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <01f8ca45-60d1-ad67-f8eb-354dec411a78@gmail.com>
Date: Fri, 23 Oct 2020 19:13:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0ab618c7-8c5c-00ae-8e08-0c1b99f3bf5c@rasmusvillemoes.dk>
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

On 23/10/20 4:36 pm, Rasmus Villemoes wrote:
> On 22/10/2020 21.16, Andy Shevchenko wrote:
>> On Thu, Oct 22, 2020 at 08:43:49PM +0530, Arpitha Raghunandan wrote:
>>> Convert test lib/test_printf.c to KUnit. More information about
>>> KUnit can be found at:
>>> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
>>> KUnit provides a common framework for unit tests in the kernel.
>>> KUnit and kselftest are standardizing around KTAP, converting this
>>> test to KUnit makes this test output in KTAP which we are trying to
>>> make the standard test result format for the kernel. More about
>>> the KTAP format can be found at:
>>> https://lore.kernel.org/linux-kselftest/CY4PR13MB1175B804E31E502221BC8163FD830@CY4PR13MB1175.namprd13.prod.outlook.com/.
>>> I ran both the original and converted tests as is to produce the
>>> output for success of the test in the two cases. I also ran these
>>> tests with a small modification to show the difference in the output
>>> for failure of the test in both cases. The modification I made is:
>>> - test("127.000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin_addr);
>>> + test("127-000.000.001|127.0.0.1", "%pi4|%pI4", &sa.sin_addr, &sa.sin_addr);
>>>
>>> Original test success:
>>> [    0.591262] test_printf: loaded.
>>> [    0.591409] test_printf: all 388 tests passed
>>>
>>> Original test failure:
>>> [    0.619345] test_printf: loaded.
>>> [    0.619394] test_printf: vsnprintf(buf, 256, "%piS|%pIS", ...)
>>> wrote '127.000.000.001|127.0.0.1', expected
>>> '127-000.000.001|127.0.0.1'
>>> [    0.619395] test_printf: vsnprintf(buf, 25, "%piS|%pIS", ...) wrote
>>> '127.000.000.001|127.0.0.', expected '127-000.000.001|127.0.0.'
>>> [    0.619396] test_printf: kvasprintf(..., "%piS|%pIS", ...) returned
>>> '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
>>> [    0.619495] test_printf: failed 3 out of 388 tests
>>>
>>> Converted test success:
>>>     # Subtest: printf-kunit-test
>>>     1..1
>>>     ok 1 - selftest
>>> ok 1 - printf-kunit-test
>>>
>>> Converted test failure:
>>>     # Subtest: printf-kunit-test
>>>     1..1
>>>     # selftest: EXPECTATION FAILED at lib/printf_kunit.c:82
>>> vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote
>>> '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
>>>     # selftest: EXPECTATION FAILED at lib/printf_kunit.c:82
>>> vsnprintf(buf, 5, "%pi4|%pI4", ...) wrote '127.', expected '127-'
>>>     # selftest: EXPECTATION FAILED at lib/printf_kunit.c:118
>>> kvasprintf(..., "%pi4|%pI4", ...) returned
>>> '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
>>>     not ok 1 - selftest
>>> not ok 1 - printf-kunit-test
>>
>> Not bad. Rasmus, what do you think?
> 
> Much better, but that '1..1' and reporting the entire test suite as 1
> single (failing or passing) test is (also) a regression. Look at the
> original
> 
>>> [    0.591409] test_printf: all 388 tests passed
> 
> or
> 
>>> [    0.619495] test_printf: failed 3 out of 388 tests
> 
> That's far more informative, and I'd prefer if the summary information
> (whether in the all-good case or some-failing) included something like
> this. In particular, I have at some point spotted that I failed to
> properly hook up a new test case (or perhaps failed to re-compile, or
> somehow still ran the old kernel binary, don't remember which it was) by
> noticing that the total number of tests hadn't increased. The new output
> would not help catch such PEBKACs.
> 
> Rasmus
> 

Splitting the test into multiple test cases in KUnit will display the number and name of tests that pass or fail. This will be similar to the lib/list-test.c test as can be seen here: https://elixir.bootlin.com/linux/latest/source/lib/list-test.c. I will work on this for the next version of this patch.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
