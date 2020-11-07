Return-Path: <SRS0=FEGG=EN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40905C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 04:58:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C75620704
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 04:58:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="asNQ1Vij"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C75620704
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CB9A22045E;
	Sat,  7 Nov 2020 04:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3cUuO8rZkP0; Sat,  7 Nov 2020 04:58:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 181952042C;
	Sat,  7 Nov 2020 04:58:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EABD7C0893;
	Sat,  7 Nov 2020 04:58:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27886C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 04:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0B40386B6B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 04:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BInuJvXH2+6R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 04:58:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8DD0086AC8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 04:58:35 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id v19so3731988lji.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Nov 2020 20:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lrcPOo6i+nOKaGcssjeCtEpFiPKYd6jzH30EXtM+xO0=;
 b=asNQ1Vijk/0x433pPEUzyiHfiXBCMW/SaEE/XYh5Cr5VyIri1+of7lKMLILYqE2Jcy
 6HS+GVzQy55zdJ9S0RD6cRv8BTJJdLrvbvsCXqytxB0APRI2NIMYpz8JGQhHM/FE1LbR
 uHCYjBkugMl751yQ5IvuBpOWvsrBripyjwj9AQ2xfTGqfabtEqsMnpkG68ZlGiHVGqK3
 mlE8ydyD1+bIwUqWDB6QKST7bGAJiEQfrW2dCs4QOfiDGXSx3iloFqCOZYol0RXeDpAR
 dR+0f5+pg/Ia/sTBlHw4mrVaglPCqjrNBdbl1LaQCyzzZeGNnU80uDF4DuBTKo2FNZze
 F+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lrcPOo6i+nOKaGcssjeCtEpFiPKYd6jzH30EXtM+xO0=;
 b=OptUgTPzW334Vlh01qg50vCwoNkKfCJEDZrZmHZ+xvNeEyuXjQeIt0QWa6SAeqUXUm
 ist4jOSMfe422yxKAiuZJlEwj5YSktyunzJDmZhYb9qtVzvj3GX9ldAxp+JwkxETQ4c6
 ClXwy/ZGlmRGHchQyDhIktoGW/rZRjNeklDIFSu3mFIc7+4nGISg9K47JwC/8HYubmdk
 8rRRn+5tPC6M5l8Ilc0Wkwh5cHGg/Kcv3TKySKZFwOQ8tZR4jJ5saCj/xeU6cfQmhhrG
 3wjj0rkWuSQSNCLLQNyaRkSpwjotE9dLHd1ZX2Kon1kdyxpaHxXcZBxN5ZvGoyPNxAeJ
 PLGg==
X-Gm-Message-State: AOAM532kRoOey+QFul4PdCrXn7rAAe2I4jENgXqqzo4osGOYdGA5smr8
 Wab8vS+FExeBNy8HgUD7pTeW/OGtt4pqELPbyB2wkA==
X-Google-Smtp-Source: ABdhPJxjIeeHTsuTnNbico0DpKgO1y6BJLYflynAekFx9Ig3uYJ0B/hjIaTw6BRp9Z5i+si9det/23Pe+0kGpBA6yog=
X-Received: by 2002:a2e:9746:: with SMTP id f6mr2022414ljj.270.1604725113176; 
 Fri, 06 Nov 2020 20:58:33 -0800 (PST)
MIME-Version: 1.0
References: <20201106192154.51514-1-98.arpi@gmail.com>
In-Reply-To: <20201106192154.51514-1-98.arpi@gmail.com>
Date: Sat, 7 Nov 2020 12:58:21 +0800
Message-ID: <CABVgOSkQ6+y7OGw2494cJa2b60EkSjncLNAgc9cJDbS=X9J3WA@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Marco Elver <elver@google.com>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v6 1/2] kunit: Support for
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
From: David Gow via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: David Gow <davidgow@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, Nov 7, 2020 at 3:22 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> Implementation of support for parameterized testing in KUnit.
> This approach requires the creation of a test case using the
> KUNIT_CASE_PARAM macro that accepts a generator function as input.
> This generator function should return the next parameter given the
> previous parameter in parameterized tests. It also provides
> a macro to generate common-case generators.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> Co-developed-by: Marco Elver <elver@google.com>
> Signed-off-by: Marco Elver <elver@google.com>
> ---

This looks good to me! A couple of minor thoughts about the output
format below, but I'm quite happy to have this as-is regardless.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

> Changes v5->v6:
> - Fix alignment to maintain consistency
> Changes v4->v5:
> - Update kernel-doc comments.
> - Use const void* for generator return and prev value types.
> - Add kernel-doc comment for KUNIT_ARRAY_PARAM.
> - Rework parameterized test case execution strategy: each parameter is executed
>   as if it was its own test case, with its own test initialization and cleanup
>   (init and exit are called, etc.). However, we cannot add new test cases per TAP
>   protocol once we have already started execution. Instead, log the result of
>   each parameter run as a diagnostic comment.
> Changes v3->v4:
> - Rename kunit variables
> - Rename generator function helper macro
> - Add documentation for generator approach
> - Display test case name in case of failure along with param index
> Changes v2->v3:
> - Modifictaion of generator macro and method
> Changes v1->v2:
> - Use of a generator method to access test case parameters
>
>  include/kunit/test.h | 36 ++++++++++++++++++++++++++++++++++
>  lib/kunit/test.c     | 46 +++++++++++++++++++++++++++++++-------------
>  2 files changed, 69 insertions(+), 13 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index db1b0ae666c4..16616d3974f9 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -107,6 +107,7 @@ struct kunit;
>   *
>   * @run_case: the function representing the actual test case.
>   * @name:     the name of the test case.
> + * @generate_params: the generator function for parameterized tests.
>   *
>   * A test case is a function with the signature,
>   * ``void (*)(struct kunit *)``
> @@ -141,6 +142,7 @@ struct kunit;
>  struct kunit_case {
>         void (*run_case)(struct kunit *test);
>         const char *name;
> +       const void* (*generate_params)(const void *prev);
>
>         /* private: internal use only. */
>         bool success;
> @@ -163,6 +165,22 @@ static inline char *kunit_status_to_string(bool status)
>   */
>  #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
>
> +/**
> + * KUNIT_CASE_PARAM - A helper for creation a parameterized &struct kunit_case
> + *
> + * @test_name: a reference to a test case function.
> + * @gen_params: a reference to a parameter generator function.
> + *
> + * The generator function ``const void* gen_params(const void *prev)`` is used
> + * to lazily generate a series of arbitrarily typed values that fit into a
> + * void*. The argument @prev is the previously returned value, which should be
> + * used to derive the next value; @prev is set to NULL on the initial generator
> + * call.  When no more values are available, the generator must return NULL.
> + */
> +#define KUNIT_CASE_PARAM(test_name, gen_params)                        \
> +               { .run_case = test_name, .name = #test_name,    \
> +                 .generate_params = gen_params }
> +
>  /**
>   * struct kunit_suite - describes a related collection of &struct kunit_case
>   *
> @@ -208,6 +226,10 @@ struct kunit {
>         const char *name; /* Read only after initialization! */
>         char *log; /* Points at case log after initialization */
>         struct kunit_try_catch try_catch;
> +       /* param_value is the current parameter value for a test case. */
> +       const void *param_value;
> +       /* param_index stores the index of the parameter in parameterized tests. */
> +       int param_index;
>         /*
>          * success starts as true, and may only be set to false during a
>          * test case; thus, it is safe to update this across multiple
> @@ -1742,4 +1764,18 @@ do {                                                                            \
>                                                 fmt,                           \
>                                                 ##__VA_ARGS__)
>
> +/**
> + * KUNIT_ARRAY_PARAM() - Define test parameter generator from an array.
> + * @name:  prefix for the test parameter generator function.
> + * @array: array of test parameters.
> + *
> + * Define function @name_gen_params which uses @array to generate parameters.
> + */
> +#define KUNIT_ARRAY_PARAM(name, array)                                                         \
> +       static const void *name##_gen_params(const void *prev)                                  \
> +       {                                                                                       \
> +               typeof((array)[0]) * __next = prev ? ((typeof(__next)) prev) + 1 : (array);     \
> +               return __next - (array) < ARRAY_SIZE((array)) ? __next : NULL;                  \
> +       }
> +
>  #endif /* _KUNIT_TEST_H */
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 750704abe89a..329fee9e0634 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -325,29 +325,25 @@ static void kunit_catch_run_case(void *data)
>   * occur in a test case and reports them as failures.
>   */
>  static void kunit_run_case_catch_errors(struct kunit_suite *suite,
> -                                       struct kunit_case *test_case)
> +                                       struct kunit_case *test_case,
> +                                       struct kunit *test)
>  {
>         struct kunit_try_catch_context context;
>         struct kunit_try_catch *try_catch;
> -       struct kunit test;
>
> -       kunit_init_test(&test, test_case->name, test_case->log);
> -       try_catch = &test.try_catch;
> +       kunit_init_test(test, test_case->name, test_case->log);
> +       try_catch = &test->try_catch;
>
>         kunit_try_catch_init(try_catch,
> -                            &test,
> +                            test,
>                              kunit_try_run_case,
>                              kunit_catch_run_case);
> -       context.test = &test;
> +       context.test = test;
>         context.suite = suite;
>         context.test_case = test_case;
>         kunit_try_catch_run(try_catch, &context);
>
> -       test_case->success = test.success;
> -
> -       kunit_print_ok_not_ok(&test, true, test_case->success,
> -                             kunit_test_case_num(suite, test_case),
> -                             test_case->name);
> +       test_case->success = test->success;
>  }
>
>  int kunit_run_tests(struct kunit_suite *suite)
> @@ -356,8 +352,32 @@ int kunit_run_tests(struct kunit_suite *suite)
>
>         kunit_print_subtest_start(suite);
>
> -       kunit_suite_for_each_test_case(suite, test_case)
> -               kunit_run_case_catch_errors(suite, test_case);
> +       kunit_suite_for_each_test_case(suite, test_case) {
> +               struct kunit test = { .param_value = NULL, .param_index = 0 };
> +               bool test_success = true;
> +
> +               if (test_case->generate_params)
> +                       test.param_value = test_case->generate_params(NULL);
> +
> +               do {
> +                       kunit_run_case_catch_errors(suite, test_case, &test);
> +                       test_success &= test_case->success;
> +
> +                       if (test_case->generate_params) {
> +                               kunit_log(KERN_INFO, &test,
> +                                         KUNIT_SUBTEST_INDENT
> +                                         "# %s: param-%d %s",

Would it make sense to have this imitate the TAP format a bit more?
So, have "# [ok|not ok] - [name]" as the format? [name] could be
something like "[test_case->name]:param-[index]" or similar.
If we keep it commented out and don't indent it further, it won't
formally be a nested test (though if we wanted to support those later,
it'd be easy to add), but I think it would be nicer to be consistent
here.

My other suggestion -- albeit one outside the scope of this initial
version -- would be to allow the "param-%d" name to be overridden
somehow by a test. For example, the ext4 inode test has names for all
its test cases: it'd be nice to be able to display those instead (even
if they're not formatted as identifiers as-is).

> +                                         test_case->name, test.param_index,
> +                                         kunit_status_to_string(test.success));
> +                               test.param_value = test_case->generate_params(test.param_value);
> +                               test.param_index++;
> +                       }
> +               } while (test.param_value);
> +
> +               kunit_print_ok_not_ok(&test, true, test_success,
> +                                     kunit_test_case_num(suite, test_case),
> +                                     test_case->name);
> +       }
>
>         kunit_print_subtest_end(suite);
>
> --
> 2.25.1
>
> --
> You received this message because you are subscribed to the Google Groups "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kunit-dev/20201106192154.51514-1-98.arpi%40gmail.com.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
