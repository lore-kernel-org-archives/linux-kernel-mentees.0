Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0B7C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 05:28:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D43F22248
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 05:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RV/5yHlD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D43F22248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AB36487FDD;
	Thu, 15 Oct 2020 05:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQ-kP2YSupzz; Thu, 15 Oct 2020 05:28:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DF7D87FD5;
	Thu, 15 Oct 2020 05:28:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43E54C07FF;
	Thu, 15 Oct 2020 05:28:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08E78C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 05:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E3DA98838C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 05:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VoQGSoOvMUko
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 05:28:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B9CF28837F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 05:28:18 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id n9so1151516pgt.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 22:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZnGvMLzVP6dq5IKxq/jp1HRHeOdaVbEVOzrBdo7gjh0=;
 b=RV/5yHlDKCTOkYuGWZum0CcbTUqmbHr8MqIaLdb01vqng5byB5UbUqF2u+JDGp2GCo
 ZlGGGV896mkLJTjMEFfzfBBazdO+vG9Dpy+4G6ALt/cP3bi1vrBbdAgDpzAXhtx1f0EB
 hRVjwHBgrXXeXf/8JxG41Q0oTuz9QqFDFdYbTGpKurp48JVgZHKMggiDnMWqhGx4Bo/r
 IGAErJGOA7kYyZcHsrJUd1BRgosw7FjMnCXK5hJAII1harcd6zP0hsMiWXMlMJThVCgo
 ls5hRJHmTBeDaZ4QDprcQJjOEMyd/nAiJPR3O7BKh6JLo+GIsIy7QLrpeYDVrRgmSIIC
 OXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZnGvMLzVP6dq5IKxq/jp1HRHeOdaVbEVOzrBdo7gjh0=;
 b=aMGmhXI4li44Z1fiRTynO0rnIne80mND/niFT+HzPsj9omMlZml4ELUYmjmWimr779
 bmW6bV5jJnuz3cNBLd7HnaVklvCxxwdT82OXQPsr17uWMvYDj+61hXhLs1Q/cIoT18Qt
 b5BjHVP2HFdeJLEwLIsMR5nTlrZRlAj6T8dAf4Y1NOlOckXVOGHWAaC/XhP0Gey5MdcL
 wBRQJBpzAZnWsQBlSrA+b7tveZwl+boLGzyu+EnRsw343q37mvk6zfh1oSBk7uQ5hq2t
 YPXG/jk1cVgVRjYoG0J5HwsZJDdvmBtp24cnCR0DZdgIcc2I72IGmSuj6W4yvVGzbTdQ
 S6sw==
X-Gm-Message-State: AOAM532K05KIwfF5tEp/N4K1Szr0mcHt9wonRfNT1gQAc93+yDhP5+Pc
 fHYmA6qc2nP8Cv5ongEOEw0=
X-Google-Smtp-Source: ABdhPJwUreTsc+q7k45CdcRaudEVWnyqfN7HLOiVIi8kthztc/VpUSfQpyCP9JxVnV2g8OukfXNswg==
X-Received: by 2002:a05:6a00:134c:b029:156:78e8:144d with SMTP id
 k12-20020a056a00134cb029015678e8144dmr2633552pfu.77.1602739698208; 
 Wed, 14 Oct 2020 22:28:18 -0700 (PDT)
Received: from [192.168.86.81] ([106.51.240.187])
 by smtp.gmail.com with ESMTPSA id x5sm1599083pfr.83.2020.10.14.22.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 22:28:17 -0700 (PDT)
To: Marco Elver <elver@google.com>
References: <20201010145357.60886-1-98.arpi@gmail.com>
 <CANpmjNOmbPsx-eEQ+TfC0X5CM-Jgy2NBqpYo=h2L9e33rnajSw@mail.gmail.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <943d57b5-03b6-f042-1e5a-27dbde4aa25b@gmail.com>
Date: Thu, 15 Oct 2020 10:58:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANpmjNOmbPsx-eEQ+TfC0X5CM-Jgy2NBqpYo=h2L9e33rnajSw@mail.gmail.com>
Content-Language: en-US
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 yzaikin@google.com, linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] kunit: Support for
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

On 12/10/20 4:30 pm, Marco Elver wrote:
> On Sat, 10 Oct 2020 at 16:54, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>> Implementation of support for parameterized testing in KUnit.
>>
>> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
>> ---
>>  include/kunit/test.h | 29 +++++++++++++++++++++++++++++
>>  lib/kunit/test.c     | 44 +++++++++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 72 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/kunit/test.h b/include/kunit/test.h
>> index 59f3144f009a..4740d66269b4 100644
>> --- a/include/kunit/test.h
>> +++ b/include/kunit/test.h
>> @@ -140,10 +140,14 @@ struct kunit;
>>  struct kunit_case {
>>         void (*run_case)(struct kunit *test);
>>         const char *name;
>> +       void* (*get_params)(void);
>> +       int max_parameters_count;
>> +       int parameter_size;
>>
>>         /* private: internal use only. */
>>         bool success;
>>         char *log;
>> +       bool parameterized;
> 
> Why do you need this bool? Doesn't get_params being non-NULL tell you
> if the test case is parameterized?
>Yeah, this will. 
>>  };
>>
>>  static inline char *kunit_status_to_string(bool status)
>> @@ -162,6 +166,11 @@ static inline char *kunit_status_to_string(bool status)
>>   */
>>  #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
>>
>> +#define KUNIT_CASE_PARAM(test_name, getparams, count, size)                            \
>> +               { .run_case = test_name, .name = #test_name,                            \
>> +                 .parameterized = true, .get_params = (void* (*)(void))getparams,      \
>> +                 .max_parameters_count = count, .parameter_size = size }
>> +
> 
> I think this interface is overly complex. For one, if the only purpose
> of the getparams function is to return a pointer to some array, then
> there are only few cases where I see getparams being a function could
> be useful.
> 
> Instead, could we make the getparams function behave like a generator?
> Because then you do not need count, nor size. Its function signature
> would be:
> 
> void* (*generate_params)(void* prev_param);
> 
> The protocol would be:
> 
> - The first call to generate_params is passed prev_param of NULL, and
> returns a pointer to the first parameter P[0].
> 
> - Every nth successive call to generate_params is passed the previous
> parameter P[n-1].
> 
> - When no more parameters are available, generate_params returns NULL.
> 
> - (generate_params should otherwise be stateless, but this is only
> relevant if concurrent calls are expected.)
> 
> 
>>  /**
>>   * struct kunit_suite - describes a related collection of &struct kunit_case
>>   *
>> @@ -206,6 +215,23 @@ struct kunit {
>>         /* private: internal use only. */
>>         const char *name; /* Read only after initialization! */
>>         char *log; /* Points at case log after initialization */
>> +       bool parameterized; /* True for parameterized tests */
>> +       /* param_values stores the test parameters
>> +        * for parameterized tests.
>> +        */
>> +       void *param_values;
>> +       /* max_parameters_count indicates maximum number of
>> +        * parameters for parameterized tests.
>> +        */
>> +       int max_parameters_count;
>> +       /* iterator_count is used by the iterator method
>> +        * for parameterized tests.
>> +        */
>> +       int iterator_count;
>> +       /* parameter_size indicates size of a single test case
>> +        * for parameterized tests.
>> +        */
>> +       int parameter_size;
> 
> All of this would become much simpler if you used the generator
> approach. Likely only 1 field would be required, which is the current
> param.
> 
>>         struct kunit_try_catch try_catch;
>>         /*
>>          * success starts as true, and may only be set to false during a
>> @@ -225,6 +251,7 @@ struct kunit {
>>  };
>>
>>  void kunit_init_test(struct kunit *test, const char *name, char *log);
>> +void kunit_init_param_test(struct kunit *test, struct kunit_case *test_case);
>>
>>  int kunit_run_tests(struct kunit_suite *suite);
>>
>> @@ -237,6 +264,8 @@ int __kunit_test_suites_init(struct kunit_suite **suites);
>>
>>  void __kunit_test_suites_exit(struct kunit_suite **suites);
>>
>> +void *get_test_case_parameters(struct kunit *test);
>> +
>>  /**
>>   * kunit_test_suites() - used to register one or more &struct kunit_suite
>>   *                      with KUnit.
>> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
>> index c36037200310..ab9e13c81d4a 100644
>> --- a/lib/kunit/test.c
>> +++ b/lib/kunit/test.c
>> @@ -142,6 +142,11 @@ unsigned int kunit_test_case_num(struct kunit_suite *suite,
>>  }
>>  EXPORT_SYMBOL_GPL(kunit_test_case_num);
>>
>> +static void kunit_print_failed_param(struct kunit *test)
>> +{
>> +       kunit_err(test, "\n\tTest failed at parameter: %d\n", test->iterator_count);
>> +}
>> +
>>  static void kunit_print_string_stream(struct kunit *test,
>>                                       struct string_stream *stream)
>>  {
>> @@ -182,6 +187,9 @@ static void kunit_fail(struct kunit *test, struct kunit_assert *assert)
>>
>>         assert->format(assert, stream);
>>
>> +       if (test->parameterized)
>> +               kunit_print_failed_param(test);
>> +
>>         kunit_print_string_stream(test, stream);
>>
>>         WARN_ON(string_stream_destroy(stream));
>> @@ -236,6 +244,18 @@ void kunit_init_test(struct kunit *test, const char *name, char *log)
>>  }
>>  EXPORT_SYMBOL_GPL(kunit_init_test);
>>
>> +void kunit_init_param_test(struct kunit *test, struct kunit_case *test_case)
>> +{
>> +       spin_lock_init(&test->lock);
>> +       INIT_LIST_HEAD(&test->resources);
>> +       test->parameterized = true;
>> +       test->param_values = (void *)(test_case->get_params());
>> +       test->max_parameters_count = test_case->max_parameters_count;
>> +       test->parameter_size = test_case->parameter_size;
>> +       test->iterator_count = 0;
>> +}
>> +EXPORT_SYMBOL_GPL(kunit_init_param_test);
>> +
>>  /*
>>   * Initializes and runs test case. Does not clean up or do post validations.
>>   */
>> @@ -254,7 +274,14 @@ static void kunit_run_case_internal(struct kunit *test,
>>                 }
>>         }
>>
>> -       test_case->run_case(test);
>> +       if (!test->parameterized) {
>> +               test_case->run_case(test);
>> +       } else {
>> +               int i;
>> +
>> +               for (i = 0; i < test->max_parameters_count; i++)
>> +                       test_case->run_case(test);
> 
> With a generator approach, here you'd call generate_params. Most
> likely, you'll need to stash its result somewhere, e.g. test->param,
> so it can be retrieved by the test case.
> 
>> +       }
>>  }
>>
>>  static void kunit_case_internal_cleanup(struct kunit *test)
>> @@ -343,6 +370,8 @@ static void kunit_run_case_catch_errors(struct kunit_suite *suite,
>>         struct kunit test;
>>
>>         kunit_init_test(&test, test_case->name, test_case->log);
>> +       if (test_case->parameterized)
>> +               kunit_init_param_test(&test, test_case);
>>         try_catch = &test.try_catch;
>>
>>         kunit_try_catch_init(try_catch,
>> @@ -407,6 +436,19 @@ void __kunit_test_suites_exit(struct kunit_suite **suites)
>>  }
>>  EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
>>
>> +/*
>> + * Iterator method for the parameterized test cases
>> + */
>> +void *get_test_case_parameters(struct kunit *test)
>> +{
>> +       int index = test->iterator_count * test->parameter_size;
>> +
>> +       if (test->iterator_count != test->max_parameters_count)
>> +               test->iterator_count++;
> 
> This is quite confusing, because if get_test_case_parameters is called
> multiple times within the same test case, we'll iterate through all
> the test case params in the same test case? I think this function
> should not have side-effects (like normal getters).
> 
> But if you use the generator approach, you'll likely not need this
> function anyway.
>
The generator approach sounds good. I will work on it for the next version.
 
>> +       return (test->param_values + index);
> 
> Braces not needed.
> 
I will fix this.
>> +}
>> +EXPORT_SYMBOL_GPL(get_test_case_parameters);
>> +
>>  /*
>>   * Used for static resources and when a kunit_resource * has been created by
>>   * kunit_alloc_resource().  When an init function is supplied, @data is passed
>> --
>> 2.25.1
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
