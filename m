Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB145C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 14:39:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 590F622258
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 14:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2rHbNkC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 590F622258
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B60E7872D5;
	Tue, 27 Oct 2020 14:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QzBh9LJwnokd; Tue, 27 Oct 2020 14:39:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 141C1872C7;
	Tue, 27 Oct 2020 14:39:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7AE2C088B;
	Tue, 27 Oct 2020 14:39:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9671DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 14:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 855A3872D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 14:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zo0eIqgK+Xs7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 14:39:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 07782872C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 14:39:22 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t6so333083plq.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jq4p9ZOCOpULvr9rjXRr1hfcbCktqSPvgN26N3fDMKI=;
 b=P2rHbNkCxVqv3VzLZrI9pRiekGKij2jCTuLBGnFuzNzKo232QsfG5w1r/Ncmxekom+
 FFG8bIkBe7md8JwLjdqcGVeZGkV7Pq3nVV3VLIKFTdh1WdUEpKSE0MwJM29wEhJUo0de
 Z2hg45xbwDwnBTwgLx9hQPLCm7zrVUlcqZ3TrnhSs8xQ18hW0zm+PZSXAyG3okq7iQgD
 pZzm37irrPmVMmjxbC9qrynZkt1FrCY60Hb18mZrpzAqWvD0lSZKFPVP6OnSI8dQKPUE
 +3T0Ne7Ji1MMYO4ddfIrx8kQHzrz5SopDaNxWAsZI369AADhnGxRRnt6jFNNcJxkWFKP
 K0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jq4p9ZOCOpULvr9rjXRr1hfcbCktqSPvgN26N3fDMKI=;
 b=X2SygMz3DgVVldvqcbQeCMyjMc9J07HEaql4orZ6foJFpzgTKGrk/Rb1zQdUw7vl70
 LPjL2NOKlRSyvmJCWKB4YkRHmDY75ZZz6lgcfVLx0uOBJXtQEHGTNUZ1OBHdvGaZqD05
 pH85hrJFG9ZtHzlUvfBkrso+gcEUbOlEf0e99pVibHy7TuC6BERJBFHOhnuT39GX0kfc
 fu7zFwxS8EhURgatzjxVsIDP0UZM4iGljD2f5yn0+L1jvoQj32PdC/iuAQAlEc2CD7q+
 dv4D0RaYbkCM5R3jHjCS1ircDu0PAC5CcnVae7JoPo6r7/0TZCVor9mehW4LFc2uYTzE
 w5Vg==
X-Gm-Message-State: AOAM531COXFdDCq5ynMItuoSr4aD6dREs0AHcc1Nv1WVXsScx9s264Rs
 2inItNujaXP8gf2SsT4JhVE=
X-Google-Smtp-Source: ABdhPJzXa1Xh/0Y5jrlOMXl+jhRdt0b7jdQnNTre8jc74QTXFQrzuJKmJJtiY0V93QdH6AsI1Bpjgg==
X-Received: by 2002:a17:902:b78c:b029:d4:da94:8766 with SMTP id
 e12-20020a170902b78cb02900d4da948766mr2632161pls.31.1603809561465; 
 Tue, 27 Oct 2020 07:39:21 -0700 (PDT)
Received: from [192.168.86.81] ([106.51.240.100])
 by smtp.gmail.com with ESMTPSA id x16sm2554341pff.14.2020.10.27.07.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 07:39:20 -0700 (PDT)
To: Marco Elver <elver@google.com>
References: <20201026183523.82749-1-98.arpi@gmail.com>
 <CANpmjNMnkXLFeQU6xZNwj3bWqE4Ap47wQKkL3-0ENX+R1YoLOg@mail.gmail.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <5c38ba07-f910-ed0a-1a75-85240effaea7@gmail.com>
Date: Tue, 27 Oct 2020 20:09:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANpmjNMnkXLFeQU6xZNwj3bWqE4Ap47wQKkL3-0ENX+R1YoLOg@mail.gmail.com>
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

On 27/10/20 2:33 pm, Marco Elver wrote:
> I just tried to give this a spin on some of my tests and noticed some
> more things (apologies for the multiple rounds of comments):
> 
> On Mon, 26 Oct 2020 at 19:36, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> [...]
>>  /**
>>   * struct kunit_suite - describes a related collection of &struct kunit_case
>> @@ -208,6 +217,15 @@ struct kunit {
>>         const char *name; /* Read only after initialization! */
>>         char *log; /* Points at case log after initialization */
>>         struct kunit_try_catch try_catch;
>> +       /* param_values points to test case parameters in parameterized tests */
>> +       void *param_values;
> 
> This should be singular, i.e. "param_value", since the generator only
> generates 1 value for each test. Whether or not that value is a
> pointer that points to more than 1 value or is an integer etc. is
> entirely test-dependent.
> 
>> +       /*
>> +        * current_param stores the index of the parameter in
>> +        * the array of parameters in parameterized tests.
>> +        * current_param + 1 is printed to indicate the parameter
>> +        * that causes the test to fail in case of test failure.
>> +        */
>> +       int current_param;
> 
> I think, per your comment above, this should be named "param_index".
> Also, I would suggest removing the mention of "array" in the comment,
> because the parameters aren't dependent on use of an array.
> 
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
>> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
>> index 750704abe89a..b70ab9b12f3b 100644
>> --- a/lib/kunit/test.c
>> +++ b/lib/kunit/test.c
>> @@ -127,6 +127,11 @@ unsigned int kunit_test_case_num(struct kunit_suite *suite,
>>  }
>>  EXPORT_SYMBOL_GPL(kunit_test_case_num);
>>
>> +static void kunit_print_failed_param(struct kunit *test)
>> +{
>> +       kunit_err(test, "\n\tTest failed at parameter: %d\n", test->current_param + 1);
>> +}
> 
> Is this the only place where the param index is used? It might be
> helpful to show the index together with the test-case name, otherwise
> we get a series of test cases in the output which are all named the
> same which can be confusing.
> 

Yes, this is the only place param index is used.

>>  static void kunit_print_string_stream(struct kunit *test,
>>                                       struct string_stream *stream)
>>  {
>> @@ -168,6 +173,8 @@ static void kunit_fail(struct kunit *test, struct kunit_assert *assert)
>>         assert->format(assert, stream);
>>
>>         kunit_print_string_stream(test, stream);
>> +       if (test->param_values)
>> +               kunit_print_failed_param(test);
>>
>>         WARN_ON(string_stream_destroy(stream));
>>  }
>> @@ -239,7 +246,18 @@ static void kunit_run_case_internal(struct kunit *test,
>>                 }
>>         }
>>
>> -       test_case->run_case(test);
>> +       if (!test_case->generate_params) {
>> +               test_case->run_case(test);
>> +       } else {
>> +               test->param_values = test_case->generate_params(NULL);
>> +               test->current_param = 0;
>> +
>> +               while (test->param_values) {
>> +                       test_case->run_case(test);
>> +                       test->param_values = test_case->generate_params(test->param_values);
>> +                       test->current_param++;
>> +               }
>> +       }
>>  }
> 
> Looking forward to v4. :-)
> 
> Thanks,
> -- Marco
> 

I will make all the suggested changes.
Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
