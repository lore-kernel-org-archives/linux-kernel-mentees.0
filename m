Return-Path: <SRS0=yWZE=DQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AAFC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 18:08:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66C9E22280
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 18:08:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="b/sfPrVf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66C9E22280
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9DD2C20334;
	Fri,  9 Oct 2020 18:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uo6Yv79RkyQ6; Fri,  9 Oct 2020 18:08:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4C7B320030;
	Fri,  9 Oct 2020 18:08:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42365C016F;
	Fri,  9 Oct 2020 18:08:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83EA7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7CF64870CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1cksapcRxt9l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:08:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8BBED870C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:08:15 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w21so2069782plq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 09 Oct 2020 11:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J75qAd/rMp4vLt9IbCGHHlF1RHaa3QiOEXkDG8sl+Eg=;
 b=b/sfPrVfKGjRjPCEb3BPUmJnsWaDnXxvbgbj7CDZ1zVEtPVg/Hm8OyAyqMEFtetR8d
 Qo/KrpOy6xuS7FrRoKsdJR83uMNM14gTRSlOMKvV2C9dIQOixx5GxaVw5kbiduQd0NPa
 0rCpjYMMp+MQ9pjCScHQFNm1Bzfe28H35BxhB60bikE2sxi1SkzWYov22LyTDxDoeoM+
 GqPbGaktDfW/zXqt4K+Ilr9NKsSnrr0Azww/FsxhyW/H0HbiEgIDtedpHQFAYkZCMbD1
 TI3JCZLXip6ODCKELeDSVbJBGjF5gHKaZwrd9uq5k1jhCLtEmwvlbbJXZKXEJKS6ywSs
 HOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J75qAd/rMp4vLt9IbCGHHlF1RHaa3QiOEXkDG8sl+Eg=;
 b=RfWxWaFA+ZQjo3kWS4nFAo3T/uZpSLY0cmfzQxdLC4LNbwdaIXxy9naFWHSFQVbG3+
 0yB2XKREedmx2Czrq5cL6tj3aoHchCb1FHznpq7DBh2hTVg0inR9PjI6uCCwpWDiptxC
 mfp6ZSlzQvMGU7a2FT5rDZdxeUA027avpACWKBkTkUJAAM0I/64qA1JLuw6Ctz7fOHZM
 qc8gT8VjJvi1UIi4BQZ8dgHNTCMkjGsPBzDtrYY22SmksAuy5PGVwaiodM0ZlAi7x+Gq
 ABvXnWxCmgnF+L0RQFpEE8NcPxbpX/3kyWLFRCeQLRbPdXf90Qnpp0dxrre72EP62ae1
 EhXA==
X-Gm-Message-State: AOAM531y6Y8pWG8Yswd7ZcUKeoRECG+gMRwI77kPibahaOSsiX95utfj
 6Vr4iEGKkHj+0PyxPa1oQ9xVVsY8XI4X5/CUPl2LLA==
X-Google-Smtp-Source: ABdhPJzyxO5zfCCFJ8L5bY5oCHY4p4MgM5q00/ywrmsecqciEp+YjGdxU07pWPAgaDkRHcMJlQoxfTU+KwQyeuR4YxY=
X-Received: by 2002:a17:902:aa04:b029:d3:8b4e:e5ef with SMTP id
 be4-20020a170902aa04b02900d38b4ee5efmr13577437plb.65.1602266894783; Fri, 09
 Oct 2020 11:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201003144807.13036-1-98.arpi@gmail.com>
In-Reply-To: <20201003144807.13036-1-98.arpi@gmail.com>
Date: Fri, 9 Oct 2020 11:08:03 -0700
Message-ID: <CAFd5g44uPYWt4d4VBn5+988jWH5gsohWsx2KJtDW1B_1BbYG7g@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>, Marco Elver <elver@google.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>,
 KUnit Development <kunit-dev@googlegroups.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC v3 1/2] kunit: Support for
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

+Marco Elver

Marco, just figured you might want to see and comment on the current
state of parameterized testing.

Arpitha, can you add Marco on to future revisions?

On Sat, Oct 3, 2020 at 7:50 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> Implementation of support for parameterized testing in KUnit.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> ---
> Changes v2->v3:
> - Support for test to run iterating through all parameters added
>   within the KUnit framework
> - The index of the parameter causing test failure is displayed
>
> Changes v1->v2:
> - Parameterized input stored in a void* array
> - An iterator method to access the different parameters
>
>  include/kunit/test.h | 29 +++++++++++++++++++++++++++++
>  lib/kunit/test.c     | 44 +++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 72 insertions(+), 1 deletion(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 59f3144f009a..8e9325b29058 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -140,10 +140,14 @@ struct kunit;
>  struct kunit_case {
>         void (*run_case)(struct kunit *test);
>         const char *name;
> +       void* (*get_params)(void);
> +       int max_parameters_count;
> +       int parameter_size;
>
>         /* private: internal use only. */
>         bool success;
>         char *log;
> +       bool parameterized;
>  };
>
>  static inline char *kunit_status_to_string(bool status)
> @@ -162,6 +166,11 @@ static inline char *kunit_status_to_string(bool status)
>   */
>  #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
>
> +#define KUNIT_CASE_PARAM(test_name, getparams, count, size) {  .run_case = test_name,                                          \
> +                                                               .name = #test_name, .parameterized = true,                      \
> +                                                               .get_params = (void* (*)(void))getparams,                       \
> +                                                               .max_parameters_count = count, .parameter_size = size }
> +
>  /**
>   * struct kunit_suite - describes a related collection of &struct kunit_case
>   *
> @@ -206,6 +215,23 @@ struct kunit {
>         /* private: internal use only. */
>         const char *name; /* Read only after initialization! */
>         char *log; /* Points at case log after initialization */
> +       bool parameterized; /* True for parameterized tests */
> +       /* param_values stores the test parameters
> +        * for parameterized tests.
> +        */
> +       void *param_values;
> +       /* max_parameters_count indicates maximum number of
> +        * parameters for parameterized tests.
> +        */
> +       int max_parameters_count;
> +       /* iterator_count is used by the iterator method
> +        * for parameterized tests.
> +        */
> +       int iterator_count;
> +       /* parameter_size indicates size of a single test case
> +        * for parameterized tests.
> +        */
> +       int parameter_size;
>         struct kunit_try_catch try_catch;
>         /*
>          * success starts as true, and may only be set to false during a
> @@ -225,6 +251,7 @@ struct kunit {
>  };
>
>  void kunit_init_test(struct kunit *test, const char *name, char *log);
> +void kunit_init_param_test(struct kunit *test, struct kunit_case *test_case);
>
>  int kunit_run_tests(struct kunit_suite *suite);
>
> @@ -237,6 +264,8 @@ int __kunit_test_suites_init(struct kunit_suite **suites);
>
>  void __kunit_test_suites_exit(struct kunit_suite **suites);
>
> +void *get_test_case_parameters(struct kunit *test);
> +
>  /**
>   * kunit_test_suites() - used to register one or more &struct kunit_suite
>   *                      with KUnit.
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index c36037200310..ae012e65368e 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -142,6 +142,11 @@ unsigned int kunit_test_case_num(struct kunit_suite *suite,
>  }
>  EXPORT_SYMBOL_GPL(kunit_test_case_num);
>
> +static void kunit_print_failed_param(struct kunit *test)
> +{
> +       kunit_err(test, "\n\tTest failed at parameter: %d\n", test->iterator_count);
> +}
> +
>  static void kunit_print_string_stream(struct kunit *test,
>                                       struct string_stream *stream)
>  {
> @@ -182,6 +187,9 @@ static void kunit_fail(struct kunit *test, struct kunit_assert *assert)
>
>         assert->format(assert, stream);
>
> +       if (test->parameterized)
> +               kunit_print_failed_param(test);
> +
>         kunit_print_string_stream(test, stream);
>
>         WARN_ON(string_stream_destroy(stream));
> @@ -236,6 +244,18 @@ void kunit_init_test(struct kunit *test, const char *name, char *log)
>  }
>  EXPORT_SYMBOL_GPL(kunit_init_test);
>
> +void kunit_init_param_test(struct kunit *test, struct kunit_case *test_case)
> +{
> +       spin_lock_init(&test->lock);
> +       INIT_LIST_HEAD(&test->resources);
> +       test->parameterized = true;
> +       test->param_values = (void *)(test_case->get_params());
> +       test->max_parameters_count = test_case->max_parameters_count;
> +       test->parameter_size = test_case->parameter_size;
> +       test->iterator_count = 0;
> +}
> +EXPORT_SYMBOL_GPL(kunit_init_param_test);
> +
>  /*
>   * Initializes and runs test case. Does not clean up or do post validations.
>   */
> @@ -254,7 +274,14 @@ static void kunit_run_case_internal(struct kunit *test,
>                 }
>         }
>
> -       test_case->run_case(test);
> +       if (!test->parameterized)
> +               test_case->run_case(test);
> +       else {
> +               int i;
> +
> +               for (i = 0; i < test->max_parameters_count; i++)
> +                       test_case->run_case(test);
> +       }
>  }
>
>  static void kunit_case_internal_cleanup(struct kunit *test)
> @@ -343,6 +370,8 @@ static void kunit_run_case_catch_errors(struct kunit_suite *suite,
>         struct kunit test;
>
>         kunit_init_test(&test, test_case->name, test_case->log);
> +       if (test_case->parameterized)
> +               kunit_init_param_test(&test, test_case);
>         try_catch = &test.try_catch;
>
>         kunit_try_catch_init(try_catch,
> @@ -407,6 +436,19 @@ void __kunit_test_suites_exit(struct kunit_suite **suites)
>  }
>  EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
>
> +/*
> + * Iterator method for the parameterized test cases
> + */
> +void *get_test_case_parameters(struct kunit *test)
> +{
> +       int index = test->iterator_count * test->parameter_size;
> +
> +       if (test->iterator_count != test->max_parameters_count)
> +               test->iterator_count++;
> +       return (test->param_values + index);
> +}
> +EXPORT_SYMBOL_GPL(get_test_case_parameters);
> +
>  /*
>   * Used for static resources and when a kunit_resource * has been created by
>   * kunit_alloc_resource().  When an init function is supplied, @data is passed
> --
> 2.25.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
