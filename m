Return-Path: <SRS0=l7vb=ED=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B01C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 08:45:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4C882465D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 08:45:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXpwEKz4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4C882465D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 617BC873C0;
	Wed, 28 Oct 2020 08:45:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALfdatm1pOTp; Wed, 28 Oct 2020 08:45:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6B249873B9;
	Wed, 28 Oct 2020 08:45:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CF0CC088B;
	Wed, 28 Oct 2020 08:45:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB2F6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9C14D86885
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sx-9piO_H5WI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:45:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9D4CC86879
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:45:28 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id f21so2144224plr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oaa8geg/T7Mkg1IhrPZ9ojItG/nEdjLtTyyx3XiRm1g=;
 b=iXpwEKz4ahjXONPencKe1/fGUjTiRHXYhjFkWnYTO/LyraTFF82uNHLqAEZBITozVX
 wSE2C0eWJjmfzlCrdqJU4gToJwL9zYQt3CoL5jYkVnAbTUcCEMOrbjnGSTyB0OajDSzY
 0MdPKWc0+3GKM2aM7xvoVCFTshTkbxcyOiP8jnajHiAYsqB1Dgs5o40jLXH2mqh23tog
 Td5089h6p1IAfsadUCDJagHAuNMaYoanED4Z3Osg9fSPJWv2OQ3brSAFsiB2NIEksgYg
 xFFTLmyiBSaj1Y7W2n9ATS6iBvIKhf2CEmunsNqt0Z3M2BypMEiV4xsquHzRCI8La8RT
 Wytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oaa8geg/T7Mkg1IhrPZ9ojItG/nEdjLtTyyx3XiRm1g=;
 b=mC7sHOiIXNbfsP7xN5NbBQlcDJHP6pJ/14d59lNyYR99YtWVG2COpYGw+uKjP3bIFz
 b1P3NjQ3TpQ7pLfLd6oMPDhsstIllPPjSd8dTTx8Jl72LgmoP8UBJwHNmWwZoiCYOhqp
 IxRHqIOKXXMW6Wbd7MyYhB2Ja9y/ydMUTECj10VcAMg+eL262FwmDLioKxWfcHVdwz5q
 /Qzbpbq4Z2xheb2WhO06AjxUZCfvU6gJhU8nWU4UMTgpYMNYRtBDqqLgahgTl1LvyKSO
 D9249jZ6l5HoHRFyc/Fx4CzfB33p6uzrlV2iK5QYgKv/OlzsEul10WfhdRTYMv4mudSo
 0YBg==
X-Gm-Message-State: AOAM531Jh/3KNke//WWLZvArzOLn7smq0XX5ivlj3Lmx2bTphTvjvdaB
 JslSBe/5/eVIO424D7wFyZM=
X-Google-Smtp-Source: ABdhPJybZt79yEe27byzOwh0sHeZgjRxRq2Pvo32WalOk1EF/2tFMOJayyDjsZx6fTAePmIzTIeISQ==
X-Received: by 2002:a17:902:6505:b029:d5:f870:4d20 with SMTP id
 b5-20020a1709026505b02900d5f8704d20mr6721566plk.34.1603874728042; 
 Wed, 28 Oct 2020 01:45:28 -0700 (PDT)
Received: from [192.168.86.81] ([106.51.242.167])
 by smtp.gmail.com with ESMTPSA id ck21sm4196820pjb.56.2020.10.28.01.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 01:45:27 -0700 (PDT)
To: Marco Elver <elver@google.com>
References: <20201027174630.85213-1-98.arpi@gmail.com>
 <CANpmjNOpbXHs4gs9Ro-u7hyN_zZ7s3AqDcdDy1Nqxq4ckThugA@mail.gmail.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <5aa41bb7-79fa-bcd6-ef51-e27dabceb5cf@gmail.com>
Date: Wed, 28 Oct 2020 14:15:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANpmjNOpbXHs4gs9Ro-u7hyN_zZ7s3AqDcdDy1Nqxq4ckThugA@mail.gmail.com>
Content-Language: en-US
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v4 1/2] kunit: Support for
	Parameterized Testing
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

On 28/10/20 12:51 am, Marco Elver wrote:
> On Tue, 27 Oct 2020 at 18:47, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>>
>> Implementation of support for parameterized testing in KUnit.
>> This approach requires the creation of a test case using the
>> KUNIT_CASE_PARAM macro that accepts a generator function as input.
>> This generator function should return the next parameter given the
>> previous parameter in parameterized tests. It also provides
>> a macro to generate common-case generators.
>>
>> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
>> Co-developed-by: Marco Elver <elver@google.com>
>> Signed-off-by: Marco Elver <elver@google.com>
>> ---
>> Changes v3->v4:
>> - Rename kunit variables
>> - Rename generator function helper macro
>> - Add documentation for generator approach
>> - Display test case name in case of failure along with param index
>> Changes v2->v3:
>> - Modifictaion of generator macro and method
>> Changes v1->v2:
>> - Use of a generator method to access test case parameters
>>
>>  include/kunit/test.h | 34 ++++++++++++++++++++++++++++++++++
>>  lib/kunit/test.c     | 21 ++++++++++++++++++++-
>>  2 files changed, 54 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/kunit/test.h b/include/kunit/test.h
>> index 9197da792336..ec2307ee9bb0 100644
>> --- a/include/kunit/test.h
>> +++ b/include/kunit/test.h
>> @@ -107,6 +107,13 @@ struct kunit;
>>   *
>>   * @run_case: the function representing the actual test case.
>>   * @name:     the name of the test case.
>> + * @generate_params: the generator function for parameterized tests.
>> + *
>> + * The generator function is used to lazily generate a series of
>> + * arbitrarily typed values that fit into a void*. The argument @prev
>> + * is the previously returned value, which should be used to derive the
>> + * next value; @prev is set to NULL on the initial generator call.
>> + * When no more values are available, the generator must return NULL.
>>   *
> 
> Hmm, should this really be the first paragraph? I think it should be
> the paragraph before "Example:" maybe. But then that paragraph should
> refer to generate_params e.g. "The generator function @generate_params
> is used to ........".
> 
> The other option you have is to move this paragraph to the kernel-doc
> comment for KUNIT_CASE_PARAM, which seems to be missing a kernel-doc
> comment.
> 
>>   * A test case is a function with the signature,
>>   * ``void (*)(struct kunit *)``
>> @@ -141,6 +148,7 @@ struct kunit;
>>  struct kunit_case {
>>         void (*run_case)(struct kunit *test);
>>         const char *name;
>> +       void* (*generate_params)(void *prev);
>>
>>         /* private: internal use only. */
>>         bool success;
>> @@ -162,6 +170,9 @@ static inline char *kunit_status_to_string(bool status)
>>   * &struct kunit_case for an example on how to use it.
>>   */
>>  #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
> 
> I.e. create a new kernel-doc comment for KUNIT_CASE_PARAM here, and
> simply move the paragraph describing the generator protocol into that
> comment.
> 

I will make this change.

>> +#define KUNIT_CASE_PARAM(test_name, gen_params)                        \
>> +               { .run_case = test_name, .name = #test_name,    \
>> +                 .generate_params = gen_params }
>>
>>  /**
>>   * struct kunit_suite - describes a related collection of &struct kunit_case
>> @@ -208,6 +219,15 @@ struct kunit {
>>         const char *name; /* Read only after initialization! */
>>         char *log; /* Points at case log after initialization */
>>         struct kunit_try_catch try_catch;
>> +       /* param_value points to test case parameters in parameterized tests */
> 
> Hmm, not quite: param_value is the current parameter value for a test
> case. Most likely it's a pointer, but it doesn't need to be.
> 
>> +       void *param_value;
>> +       /*
>> +        * param_index stores the index of the parameter in
>> +        * parameterized tests. param_index + 1 is printed
>> +        * to indicate the parameter that causes the test
>> +        * to fail in case of test failure.
>> +        */
> 
> I think this comment needs to be reformatted, because you can use at
> the very least use 80 cols per line. (If you use vim, visual select
> and do 'gq'.)
> 
>> +       int param_index;
>>         /*
>>          * success starts as true, and may only be set to false during a
>>          * test case; thus, it is safe to update this across multiple
>> @@ -1742,4 +1762,18 @@ do {                                                                            \
>>                                                 fmt,                           \
>>                                                 ##__VA_ARGS__)
>>
>> +/**
>> + * KUNIT_ARRAY_PARAM() - Helper method for test parameter generators
>> + *                      required in parameterized tests.
>> + * @name:  prefix of the name for the test parameter generator function.
>> + *        It will be suffixed by "_gen_params".
>> + * @array: a user-supplied pointer to an array of test parameters.
>> + */
>> +#define KUNIT_ARRAY_PARAM(name, array)                                                         \
>> +       static void *name##_gen_params(void *prev)                                              \
>> +       {                                                                                       \
>> +               typeof((array)[0]) * __next = prev ? ((typeof(__next)) prev) + 1 : (array);     \
>> +               return __next - (array) < ARRAY_SIZE((array)) ? __next : NULL;                  \
>> +       }
>> +
>>  #endif /* _KUNIT_TEST_H */
>> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
>> index 750704abe89a..8ad908b61494 100644
>> --- a/lib/kunit/test.c
>> +++ b/lib/kunit/test.c
>> @@ -127,6 +127,12 @@ unsigned int kunit_test_case_num(struct kunit_suite *suite,
>>  }
>>  EXPORT_SYMBOL_GPL(kunit_test_case_num);
>>
>> +static void kunit_print_failed_param(struct kunit *test)
>> +{
>> +       kunit_err(test, "\n\tTest failed at:\n\ttest case: %s\n\tparameter: %d\n",
>> +                                               test->name, test->param_index + 1);
>> +}
> 
> Hmm, perhaps I wasn't clear, but I think I also misunderstood how the
> test case successes are presented: they are not, and it's all bunched
> into a single test case.
> 
> Firstly, kunit_err() already prints the test name, so if we want
> something like "  # : the_test_case_name: failed at parameter #X",
> simply having
> 
>     kunit_err(test, "failed at parameter #%d\n", test->param_index + 1)
> 
> would be what you want.
> 
> But I think I missed that parameters do not actually produce a set of
> test cases (sorry for noticing late). I think in their current form,
> the parameterized tests would not be useful for my tests, because each
> of my tests have test cases that have specific init and exit
> functions. For each parameter, these would also need to run.
> 
> Ideally, each parameter produces its own independent test case
> "test_case#param_index". That way, CI systems will also be able to
> logically separate different test case params, simply because each
> param produced its own distinct test case.
> 
> So, for example, we would get a series of test cases from something
> like KUNIT_CASE_PARAM(test_case, foo_gen_params), and in the output
> we'd see:
> 
>     ok X - test_case#1
>     ok X - test_case#2
>     ok X - test_case#3
>     ok X - test_case#4
>     ....
> 
> Would that make more sense?
> 
> That way we'd ensure that test-case specific initialization and
> cleanup done in init and exit functions is properly taken care of, and
> you wouldn't need kunit_print_failed_param().
> 
> AFAIK, for what I propose you'd have to modify kunit_print_ok_not_ok()
> (show param_index if parameterized test) and probably
> kunit_run_case_catch_errors() (generate params and set
> test->param_value and param_index).
> 
> Was there a reason why each param cannot be a distinct test case? If
> not, I think this would be more useful.
> 

Oh, I hadn't considered this earlier. I will try it out for the next version.

>>  static void kunit_print_string_stream(struct kunit *test,
>>                                       struct string_stream *stream)
>>  {
>> @@ -168,6 +174,8 @@ static void kunit_fail(struct kunit *test, struct kunit_assert *assert)
>>         assert->format(assert, stream);
>>
>>         kunit_print_string_stream(test, stream);
>> +       if (test->param_value)
>> +               kunit_print_failed_param(test);
>>
>>         WARN_ON(string_stream_destroy(stream));
>>  }
>> @@ -239,7 +247,18 @@ static void kunit_run_case_internal(struct kunit *test,
>>                 }
>>         }
>>
>> -       test_case->run_case(test);
>> +       if (!test_case->generate_params) {
>> +               test_case->run_case(test);
>> +       } else {
>> +               test->param_value = test_case->generate_params(NULL);
>> +               test->param_index = 0;
>> +
>> +               while (test->param_value) {
>> +                       test_case->run_case(test);
>> +                       test->param_value = test_case->generate_params(test->param_value);
>> +                       test->param_index++;
>> +               }
>> +       }
> 
> Thanks,
> -- Marco
> 

I'll make all the suggested changes.
Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
