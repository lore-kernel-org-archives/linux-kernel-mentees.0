Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B471C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 11:01:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5004C2145D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 11:01:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="tIb4U4SQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5004C2145D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B2FD487369;
	Mon, 12 Oct 2020 11:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1r2wNVDF5Mws; Mon, 12 Oct 2020 11:01:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C2152872EA;
	Mon, 12 Oct 2020 11:01:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABF94C07FF;
	Mon, 12 Oct 2020 11:01:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F7BCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 11:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7675985FA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 11:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bD59tfix-c17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 11:01:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4770586141
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 11:01:07 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id s66so15483319otb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 04:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K2YFWJ4pOihJHXPodcnaJ3e2LKbXyuwWQOZ0b/XSrV8=;
 b=tIb4U4SQcIv4Nhyx/JYzQed9+OXaMfwLCji838eUt700PeULZsa+2OTq+TpRk0yKyY
 RjcKqMI9CKAfUKSKrlJl0YyjZJvRZLww1+rOM+s+F0rgJoUNLswuUBz/Iz8jpJH1NE4q
 Rm+gypk/4N8QlZfSHHy/ifmzL/QT9rcB4K6/78l5JpvLUf2C6Fz0rae3W6hpr7YrwJJW
 uz0fC9woH5/3GthhMgNgFv47m2o7YsrwJt87Zc1dogDBtSReB8fYIamXdiWeLn6bMB1y
 NOPe+WvoxD0DZT4vKKedDKk+zHxlBaAX6JjwFNbmuwomwwS3rsoTl7xij5IkQsbnrfFJ
 Nung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K2YFWJ4pOihJHXPodcnaJ3e2LKbXyuwWQOZ0b/XSrV8=;
 b=ZPVQk8sAV6SZt8wfpUUyqZtCPZ3QrPbDBWo0M5bngRMG5ceeQ8lOv3cztpI++tcZse
 NFUj2Ss+XJqpAIPK030HoVZHAZsiaiCzM+lzQTbdOmengD4F2Di2yNf0yFZEpjc3nJWM
 f/BGYO6QUyfAnbMG6yeHQ6PQZJ1Q9Am78D51fhb3PLUzZ+BFJHCH6zUVyNbqE7fTK6LY
 cHukxcRJbBmRjI9qQttMT7YYA9dANT5MJ7j6inF4GQ6HQyGaXPOhFDeeX1KzN6IHL6CG
 LKC7E/HiXo88BTm11LyC5iFswENWQoGj1XlhpYhLKmvVct05+/bIPcQxc2dPMP8cFOPh
 UJAg==
X-Gm-Message-State: AOAM532AYgenqsXWs/iV2EqshUApcKli5h1Ow4IZL7j8609VsM7KDFEg
 9ZKtgZF/fIcUsU+ddPLNnz2i2xWSQ9fl/ehzY43ZDA==
X-Google-Smtp-Source: ABdhPJw+swSWmxv1x2aPtX24h3ONkzSGRkKogbhvAzbeYS+3/LewQEMZnQ2O5aCjFapU1Zgd/wDJAOaL5I/bk+ksh9g=
X-Received: by 2002:a9d:66a:: with SMTP id 97mr18798931otn.233.1602500466129; 
 Mon, 12 Oct 2020 04:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201010145357.60886-1-98.arpi@gmail.com>
In-Reply-To: <20201010145357.60886-1-98.arpi@gmail.com>
Date: Mon, 12 Oct 2020 13:00:54 +0200
Message-ID: <CANpmjNOmbPsx-eEQ+TfC0X5CM-Jgy2NBqpYo=h2L9e33rnajSw@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
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
From: Marco Elver via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, 10 Oct 2020 at 16:54, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> Implementation of support for parameterized testing in KUnit.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> ---
>  include/kunit/test.h | 29 +++++++++++++++++++++++++++++
>  lib/kunit/test.c     | 44 +++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 72 insertions(+), 1 deletion(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 59f3144f009a..4740d66269b4 100644
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

Why do you need this bool? Doesn't get_params being non-NULL tell you
if the test case is parameterized?

>  };
>
>  static inline char *kunit_status_to_string(bool status)
> @@ -162,6 +166,11 @@ static inline char *kunit_status_to_string(bool status)
>   */
>  #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
>
> +#define KUNIT_CASE_PARAM(test_name, getparams, count, size)                            \
> +               { .run_case = test_name, .name = #test_name,                            \
> +                 .parameterized = true, .get_params = (void* (*)(void))getparams,      \
> +                 .max_parameters_count = count, .parameter_size = size }
> +

I think this interface is overly complex. For one, if the only purpose
of the getparams function is to return a pointer to some array, then
there are only few cases where I see getparams being a function could
be useful.

Instead, could we make the getparams function behave like a generator?
Because then you do not need count, nor size. Its function signature
would be:

void* (*generate_params)(void* prev_param);

The protocol would be:

- The first call to generate_params is passed prev_param of NULL, and
returns a pointer to the first parameter P[0].

- Every nth successive call to generate_params is passed the previous
parameter P[n-1].

- When no more parameters are available, generate_params returns NULL.

- (generate_params should otherwise be stateless, but this is only
relevant if concurrent calls are expected.)


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

All of this would become much simpler if you used the generator
approach. Likely only 1 field would be required, which is the current
param.

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
> index c36037200310..ab9e13c81d4a 100644
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
> +       if (!test->parameterized) {
> +               test_case->run_case(test);
> +       } else {
> +               int i;
> +
> +               for (i = 0; i < test->max_parameters_count; i++)
> +                       test_case->run_case(test);

With a generator approach, here you'd call generate_params. Most
likely, you'll need to stash its result somewhere, e.g. test->param,
so it can be retrieved by the test case.

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

This is quite confusing, because if get_test_case_parameters is called
multiple times within the same test case, we'll iterate through all
the test case params in the same test case? I think this function
should not have side-effects (like normal getters).

But if you use the generator approach, you'll likely not need this
function anyway.

> +       return (test->param_values + index);

Braces not needed.

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
