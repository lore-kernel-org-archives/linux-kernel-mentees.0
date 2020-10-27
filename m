Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7823C55179
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 05:14:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 517832080A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 05:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QV32QpdF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 517832080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DD0208667D;
	Tue, 27 Oct 2020 05:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7HfjZ8ZZulk; Tue, 27 Oct 2020 05:14:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A86368647A;
	Tue, 27 Oct 2020 05:14:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74EACC088B;
	Tue, 27 Oct 2020 05:14:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B975C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 05:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 78426870D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 05:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IUQUevm1SJio
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 05:14:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B2C18870CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 05:14:11 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 10so224755pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 22:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V6b7HwvvFZ2s1xYsjf24gbEkjeQ0R1jZb5gJGqmof84=;
 b=QV32QpdFiFdGKP8KIf3ztwU5B2L+kQ1TISGCOSyRr7wqANt+4iKpSWIDz9FXOVJiNY
 irLnmSzzDG34JYL9ztGPJT7Eu5o9dNRCr+tOE0KqM0LTMF2R1QqmDVmeEQnFLrO+ZweC
 ha3pZVAxePVmy3GHH67EPgBWSFxuJKrHP+97wFhhBV6yhEdvo3FE2bbeikaYjl3tmVF/
 mmwIaskRvfZYnHtO+qHXJ8WhB5NYnRpnt5wwgzEyqcPDWKsgDkrCg5fs4W8g/SDqlGi/
 aYXSL0GyEmyycjfKZOBm5SKJM9vpR9Sx0ZffKH+Pn539f+rUzDYRAOo2ZEPjRTSC9CXn
 DF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V6b7HwvvFZ2s1xYsjf24gbEkjeQ0R1jZb5gJGqmof84=;
 b=M20/siZmfdu5djOKii0pim2MLJABsiVVkZIZ4uyyGGt3gX8fal60NzugpGd1DW4qj3
 lp/KunMbC1mfz7doMZOKVoSbox0eDnJBq+gI2uTcdpg2IrJo6ENEiVTVjHlRWlPYaqUr
 ufkDCu+/uUU5i4oG2RL+hHCECscfHFCfnvXYCaJniFMvARszXwbz0kwgz6e9iRyowkBK
 5P8dyY3FrYAJUD9AJ9fh6OrXR/ltWMAkInlIKCWoD1PEd70b656kGZDU7+OqhyEists1
 WxxQfS7ODN4X0iDc7z5Q/h9UIaclhxdDKJcI0rxUT6WSo7z6kqYHpmT152fwS3FKddPS
 gPsA==
X-Gm-Message-State: AOAM530nSfImRIXkdZXgyjx2VT4Z3IKUd+pcnzlODJ9aEV1KIb+FawFP
 jqKFxOfn1UTQ/6utRWZYoGI=
X-Google-Smtp-Source: ABdhPJwI7iAg84+0QDG22suSqnWNw8moOpZOVmTy5bWa+NEsj3D7XxDRHLUnPHTYynMmO4JLGk72yg==
X-Received: by 2002:a63:af08:: with SMTP id w8mr411863pge.419.1603775651104;
 Mon, 26 Oct 2020 22:14:11 -0700 (PDT)
Received: from [192.168.86.81] ([106.51.240.100])
 by smtp.gmail.com with ESMTPSA id 78sm512426pfz.211.2020.10.26.22.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 22:14:10 -0700 (PDT)
To: Marco Elver <elver@google.com>
References: <20201026183523.82749-1-98.arpi@gmail.com>
 <CANpmjNNQtGC_jDp8TSHRHOMXi7aTQgwjtUiCWE+YqBgq-G2z5Q@mail.gmail.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <f25c881d-03f9-e246-d8d4-e985d9662d04@gmail.com>
Date: Tue, 27 Oct 2020 10:44:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANpmjNNQtGC_jDp8TSHRHOMXi7aTQgwjtUiCWE+YqBgq-G2z5Q@mail.gmail.com>
Content-Language: en-US
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3 1/2] kunit: Support for
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

On 27/10/20 4:44 am, Marco Elver wrote:
> On Mon, 26 Oct 2020 at 19:36, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
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
>> Changes v2->v3:
>> - Modifictaion of generator macro and method
> 
> Great to see it worked as expected!
> 
>> Changes v1->v2:
>> - Use of a generator method to access test case parameters
>>
>>  include/kunit/test.h | 32 ++++++++++++++++++++++++++++++++
>>  lib/kunit/test.c     | 20 +++++++++++++++++++-
>>  2 files changed, 51 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/kunit/test.h b/include/kunit/test.h
>> index a423fffefea0..16bf9f334e2c 100644
>> --- a/include/kunit/test.h
>> +++ b/include/kunit/test.h
>> @@ -142,6 +142,12 @@ struct kunit_case {
>>         void (*run_case)(struct kunit *test);
>>         const char *name;
>>
>> +       /*
>> +        * Pointer to test parameter generator function.
>> +        * Used only for parameterized tests.
> 
> What I meant was to give a description of the protocol, so that if
> somebody wanted, they could (without reading the implementation)
> implement their own custom generator without the helper macro.
> 
> E.g. something like: "The generator function is used to lazily
> generate a series of arbitrarily typed values that fit into a void*.
> The argument @prev is the previously returned value, which should be
> used to derive the next value; @prev is set to NULL on the initial
> generator call. When no more values are available, the generator must
> return NULL."
>

Oh okay. I am not sure if this is the best place to add documentation for this.
 
>> +        */
>> +       void* (*generate_params)(void *prev);
>> +
>>         /* private: internal use only. */
>>         bool success;
>>         char *log;
>> @@ -162,6 +168,9 @@ static inline char *kunit_status_to_string(bool status)
>>   * &struct kunit_case for an example on how to use it.
>>   */
>>  #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
>> +#define KUNIT_CASE_PARAM(test_name, gen_params)                        \
>> +               { .run_case = test_name, .name = #test_name,    \
>> +                 .generate_params = gen_params }
>>
>>  /**
>>   * struct kunit_suite - describes a related collection of &struct kunit_case
>> @@ -208,6 +217,15 @@ struct kunit {
>>         const char *name; /* Read only after initialization! */
>>         char *log; /* Points at case log after initialization */
>>         struct kunit_try_catch try_catch;
>> +       /* param_values points to test case parameters in parameterized tests */
>> +       void *param_values;
>> +       /*
>> +        * current_param stores the index of the parameter in
>> +        * the array of parameters in parameterized tests.
>> +        * current_param + 1 is printed to indicate the parameter
>> +        * that causes the test to fail in case of test failure.
>> +        */
>> +       int current_param;
>>         /*
>>          * success starts as true, and may only be set to false during a
>>          * test case; thus, it is safe to update this across multiple
>> @@ -1742,4 +1760,18 @@ do {                                                                            \
>>                                                 fmt,                           \
>>                                                 ##__VA_ARGS__)
>>
>> +/**
>> + * KUNIT_PARAM_GENERATOR() - Helper method for test parameter generators
>> + *                          required in parameterized tests.
> 
> This is only for arrays, which is why I suggested KUNIT_ARRAY_PARAM()
> as the name.
> 
> A generator can very well be implemented without an array, so this
> macro name is confusing. In future somebody might want to provide a
> macro that takes a start + end value (and maybe a step value) to
> generate a series of values. That generator could be named
> KUNIT_RANGE_PARAM(name, start, end, step) and gives us a generator
> that is also named name##_gen_params. (If you want to try implementing
> that macro, I'd suggest doing it as a separate patch.)
> 
> And I don't think we need to put "GENERATOR" into the name of these
> macros, because the generators are now the fundamental method with
> which to get parameterized tests. We don't need to state the obvious,
> in favor of some brevity.
>

Okay, makes sense. I will change it to KUNIT_ARRAY_PARAM() for the next version.
 
>> + * @name:  prefix of the name for the test parameter generator function.
>> + * @prev: a pointer to the previous test parameter, NULL for first parameter.
>> + * @array: a user-supplied pointer to an array of test parameters.
>> + */
>> +#define KUNIT_PARAM_GENERATOR(name, array)                                                     \
>> +       static void *name##_gen_params(void *prev)                                              \
>> +       {                                                                                       \
>> +               typeof((array)[0]) * __next = prev ? ((typeof(__next)) prev) + 1 : (array);     \
>> +               return __next - (array) < ARRAY_SIZE((array)) ? __next : NULL;                  \
>> +       }
>> +
>>  #endif /* _KUNIT_TEST_H */
> 
> Thanks,
> -- Marco
> 

Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
