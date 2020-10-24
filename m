Return-Path: <SRS0=3SZq=D7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C739C56201
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 05:08:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F235922254
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 05:08:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy58VvAh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F235922254
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D7DC87751;
	Sat, 24 Oct 2020 05:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqFvj+1DStuR; Sat, 24 Oct 2020 05:08:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7ED8B876E4;
	Sat, 24 Oct 2020 05:08:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68D5FC088B;
	Sat, 24 Oct 2020 05:08:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F4C3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 05:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5E65D87464
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 05:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tn_br1uQPEwr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 05:08:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8134987454
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 05:08:46 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id v22so2080360ply.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 22:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fjaSUVFJm1JVw244s2m2ztF0RKFCy/L3lODaApmqKEY=;
 b=Dy58VvAhl/znmltBfnj9Hzm/FtbhfUgpGMlvSE9xwJUaZ6cHFTvuh0f1w/FPla3/x2
 0vk06xgcUgtGOXwe75Z2e/qwmM8C471sRTWhsVM0CYnOtTiouDR3b6vLLhSXakvs8eFZ
 uymgg7KkFog5OiPgmJR1YbveRCYZQqR6S+SVXQxMLADixxhT0BM/kp8O0iBW5lMkT+6q
 pxbnPfrJ6Q37L9btErdzoo6az/LFq1Fe71F/wimmn5YzKR8t5DtV0L8N2xyleCqGEW+k
 abC89/M2KvFMKTgqA2N6E5Xx79TbTIB294hEeIGsfpLYaKbSorcSyl8s+ry1SI9/d0Nu
 FINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fjaSUVFJm1JVw244s2m2ztF0RKFCy/L3lODaApmqKEY=;
 b=qaBM6lRi+VwgdF5khUpHxSo3dZekAmzrY8OvuGkNvhMMmgdoHkLS7TFWRylZcA/0/L
 Yrkg+n+eSIhcrPLbqVldTmhLoPtvK4TCei911hUT5eBLQD8gCMUOlGRuMY0M3pHcCKZG
 2XE3lhfyaVTS6YE1jDrbdbthUOO14ioRXNjxYuiWXElZIIViMINN3yl8h2vuk4CcKWvU
 Rapb+K3vsmpqMQwSw6zFIjAboz/O2TL2J9afiju7xuwQzSqD6L3d+j66ZPMRzZaefYbO
 rnFnL3KRkQZIq8pznhS19BvRlNk+gauyRlymOFDU/4lkVhNiTJmcveK+iEGhsmEyyNSc
 T0AA==
X-Gm-Message-State: AOAM531pBbE9Jbr74+aIsllFXpJlibHOwP/Crv67sFcBsMZeqQvsKTXm
 vQTQIrs9HAkFZR99h3eYr8Zt+tlt3abb/69L
X-Google-Smtp-Source: ABdhPJzMw4FH+jjCGG7bREV97DUiLKrfg+/6FY5v3qm03LrH3LqYN1flii67GCds7GtvWcc8RLMtww==
X-Received: by 2002:a17:902:7006:b029:d5:f56f:931a with SMTP id
 y6-20020a1709027006b02900d5f56f931amr2154454plk.8.1603516125765; 
 Fri, 23 Oct 2020 22:08:45 -0700 (PDT)
Received: from [192.168.86.81] ([106.51.242.32])
 by smtp.gmail.com with ESMTPSA id c127sm3998591pfc.115.2020.10.23.22.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 22:08:44 -0700 (PDT)
To: Petr Mladek <pmladek@suse.com>
References: <20201022151349.47436-1-98.arpi@gmail.com>
 <20201022191606.GQ4077@smile.fi.intel.com>
 <0ab618c7-8c5c-00ae-8e08-0c1b99f3bf5c@rasmusvillemoes.dk>
 <01f8ca45-60d1-ad67-f8eb-354dec411a78@gmail.com>
 <20201023180128.GB13609@alley>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <0a9e5183-b4aa-0a72-ca84-01e09b4b04c1@gmail.com>
Date: Sat, 24 Oct 2020 10:38:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201023180128.GB13609@alley>
Content-Language: en-US
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

On 23/10/20 11:31 pm, Petr Mladek wrote:
> On Fri 2020-10-23 19:13:00, Arpitha Raghunandan wrote:
>> On 23/10/20 4:36 pm, Rasmus Villemoes wrote:
>>> On 22/10/2020 21.16, Andy Shevchenko wrote:
>>>> On Thu, Oct 22, 2020 at 08:43:49PM +0530, Arpitha Raghunandan wrote:
>>>>> Converted test failure:
>>>>>     # Subtest: printf-kunit-test
>>>>>     1..1
>>>>>     # selftest: EXPECTATION FAILED at lib/printf_kunit.c:82
>>>>> vsnprintf(buf, 256, "%pi4|%pI4", ...) wrote
>>>>> '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
>>>>>     # selftest: EXPECTATION FAILED at lib/printf_kunit.c:82
>>>>> vsnprintf(buf, 5, "%pi4|%pI4", ...) wrote '127.', expected '127-'
>>>>>     # selftest: EXPECTATION FAILED at lib/printf_kunit.c:118
>>>>> kvasprintf(..., "%pi4|%pI4", ...) returned
>>>>> '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
>>>>>     not ok 1 - selftest
>>>>> not ok 1 - printf-kunit-test
>>>>
>>>> Not bad. Rasmus, what do you think?
>>>
>>> Much better, but that '1..1' and reporting the entire test suite as 1
>>> single (failing or passing) test is (also) a regression. Look at the
>>> original
>>>
>>>>> [    0.591409] test_printf: all 388 tests passed
>>>
>>> or
>>>
>>>>> [    0.619495] test_printf: failed 3 out of 388 tests
>>>
>>> That's far more informative, and I'd prefer if the summary information
>>> (whether in the all-good case or some-failing) included something like
>>> this. In particular, I have at some point spotted that I failed to
>>> properly hook up a new test case (or perhaps failed to re-compile, or
>>> somehow still ran the old kernel binary, don't remember which it was) by
>>> noticing that the total number of tests hadn't increased. The new output
>>> would not help catch such PEBKACs.
>>>
>>> Rasmus
>>>
>>
>> Splitting the test into multiple test cases in KUnit will display
>> the number and name of tests that pass or fail. This will be similar
>> to the lib/list-test.c test as can be seen here:
>> https://elixir.bootlin.com/linux/latest/source/lib/list-test.c.
>> I will work on this for the next version of this patch.
> 
> We should probably agree on the granularity first.
> 
> It looks like an overkill to split the tests into 388 functions
> and define KUNIT_CASE() lines. It might be possible to hide
> this into macros but macros are hell for debugging.
> 
> I suggest to split it by the current functions that do more test()
> call inside. I mean to define something like:
> 
> static struct kunit_case printf_test_cases[] = {
> 	KUNIT_CASE(basic),
> 	KUNIT_CASE(number),
> 	KUNIT_CASE(string),
> 	KUNIT_CASE(plain_pointer),
> 	KUNIT_CASE(null_poiter),
> 	KUNIT_CASE(error_pointer),
> 	KUNIT_CASE(addr),
> 	KUNIT_CASE(struct_resource),
> 	KUNIT_CASE(dentry),
> 	KUNIT_CASE(pointer_addr),
> 	 ...,
> 	{}
> };
> 
> Best Regards,
> Petr
> 

Okay, I will split it by the current functions that have more test() calls inside as suggested.
I will also make changes as per your other suggestions for the next version.
Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
