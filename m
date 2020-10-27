Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5154C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 09:04:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460E522265
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 09:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Xg2AvIHd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 460E522265
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C85F12042A;
	Tue, 27 Oct 2020 09:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOqi2HajI1Sl; Tue, 27 Oct 2020 09:03:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 45A6B2002C;
	Tue, 27 Oct 2020 09:03:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BFE9C088B;
	Tue, 27 Oct 2020 09:03:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3366AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 09:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 158F3871C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 09:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWNJPxxohqxu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 09:03:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 37E938718E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 09:03:56 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id f37so477735otf.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mMR/HImx8HeIWOB1IW4d4ooUwHbJnSc4ChopXkol+tY=;
 b=Xg2AvIHdQY3taxJqct+JFiPWoBWewED7SFBkf4BNfR8mWwmjMyETCb7JSxfSEs0hPf
 rbB3JqF2ytHB7sdY7A0nMedrzTQKTen4NmuBvIyzFus5llPQA6pXSCAMQ6+FEMJnwbUL
 PzDkMEmWnJC0dpKvP6NgS3wIU8J9wM0m/dPRroMHL7iVwBQl+PQAGqm0EpGAahxKp7IT
 3lZ7zIO+ZPxfVkt6qx7UGfvOKrzzXSobfGAmI3qvkLKVUx5TeFmMPl7c6SP19c22VBea
 TxQrpdjd1oQGrZUd8t3wEaghVw5V369fiJkpMO3fMWc+z2zqZvioeorot5DL4qZrwbz7
 6Q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mMR/HImx8HeIWOB1IW4d4ooUwHbJnSc4ChopXkol+tY=;
 b=rTkWXpRrNWhQLYAbkTmdDQE5DfZJL+czTNPJlVMnO4AMlbaxEMbJAS5kFm6CtnIN0p
 gZpPBqoW2pTmHDmVeCNNrdbD/lt8+fJKGnzqfeqBqqM78HO0vGl7+ycWdcOG+YCCUtBj
 mKZTjZMWFU+x9ADwOC/yBw2zeMhMH7M8bKdOKo084MCpLk4rvl3np5II5Wp8cxZLl9bo
 cOygo02fXLzB83GzCIiVZnvX6vsqIJYbUj9cioKncCSr/h6tpQYbu9z7J/85nmFn9DWy
 HfzTqeTvEzrSdfspn7Px1M4VqOMT4sqT6RXohGcGhIuIGBcUalGkxa5zGtz1jz21uMo9
 mZyQ==
X-Gm-Message-State: AOAM532sx71/eRA4AoFOlCnald2q7wbkTydxQeGkLE6sIkqA92GA/gyz
 deByPDVB6SmjHeQ+MM2iyNP+eKfhsR39YQTPJ1ROnQ==
X-Google-Smtp-Source: ABdhPJydV7HAJnVLV858KglXx9BeIvDM+HKegy4BHuUfvYe2R4pzwEQ10NdLr42Xw7Ixiclt+mW3kOlv1r6uNqDoQog=
X-Received: by 2002:a9d:3a65:: with SMTP id j92mr811798otc.17.1603789435179;
 Tue, 27 Oct 2020 02:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201026183523.82749-1-98.arpi@gmail.com>
In-Reply-To: <20201026183523.82749-1-98.arpi@gmail.com>
Date: Tue, 27 Oct 2020 10:03:43 +0100
Message-ID: <CANpmjNMnkXLFeQU6xZNwj3bWqE4Ap47wQKkL3-0ENX+R1YoLOg@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
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
From: Marco Elver via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

I just tried to give this a spin on some of my tests and noticed some
more things (apologies for the multiple rounds of comments):

On Mon, 26 Oct 2020 at 19:36, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
[...]
>  /**
>   * struct kunit_suite - describes a related collection of &struct kunit_case
> @@ -208,6 +217,15 @@ struct kunit {
>         const char *name; /* Read only after initialization! */
>         char *log; /* Points at case log after initialization */
>         struct kunit_try_catch try_catch;
> +       /* param_values points to test case parameters in parameterized tests */
> +       void *param_values;

This should be singular, i.e. "param_value", since the generator only
generates 1 value for each test. Whether or not that value is a
pointer that points to more than 1 value or is an integer etc. is
entirely test-dependent.

> +       /*
> +        * current_param stores the index of the parameter in
> +        * the array of parameters in parameterized tests.
> +        * current_param + 1 is printed to indicate the parameter
> +        * that causes the test to fail in case of test failure.
> +        */
> +       int current_param;

I think, per your comment above, this should be named "param_index".
Also, I would suggest removing the mention of "array" in the comment,
because the parameters aren't dependent on use of an array.

>         /*
>          * success starts as true, and may only be set to false during a
>          * test case; thus, it is safe to update this across multiple
> @@ -1742,4 +1760,18 @@ do {                                                                            \
>                                                 fmt,                           \
>                                                 ##__VA_ARGS__)
>
> +/**
> + * KUNIT_PARAM_GENERATOR() - Helper method for test parameter generators
> + *                          required in parameterized tests.
> + * @name:  prefix of the name for the test parameter generator function.
> + * @prev: a pointer to the previous test parameter, NULL for first parameter.
> + * @array: a user-supplied pointer to an array of test parameters.
> + */
> +#define KUNIT_PARAM_GENERATOR(name, array)                                                     \
> +       static void *name##_gen_params(void *prev)                                              \
> +       {                                                                                       \
> +               typeof((array)[0]) * __next = prev ? ((typeof(__next)) prev) + 1 : (array);     \
> +               return __next - (array) < ARRAY_SIZE((array)) ? __next : NULL;                  \
> +       }
> +
>  #endif /* _KUNIT_TEST_H */
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index 750704abe89a..b70ab9b12f3b 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -127,6 +127,11 @@ unsigned int kunit_test_case_num(struct kunit_suite *suite,
>  }
>  EXPORT_SYMBOL_GPL(kunit_test_case_num);
>
> +static void kunit_print_failed_param(struct kunit *test)
> +{
> +       kunit_err(test, "\n\tTest failed at parameter: %d\n", test->current_param + 1);
> +}

Is this the only place where the param index is used? It might be
helpful to show the index together with the test-case name, otherwise
we get a series of test cases in the output which are all named the
same which can be confusing.

>  static void kunit_print_string_stream(struct kunit *test,
>                                       struct string_stream *stream)
>  {
> @@ -168,6 +173,8 @@ static void kunit_fail(struct kunit *test, struct kunit_assert *assert)
>         assert->format(assert, stream);
>
>         kunit_print_string_stream(test, stream);
> +       if (test->param_values)
> +               kunit_print_failed_param(test);
>
>         WARN_ON(string_stream_destroy(stream));
>  }
> @@ -239,7 +246,18 @@ static void kunit_run_case_internal(struct kunit *test,
>                 }
>         }
>
> -       test_case->run_case(test);
> +       if (!test_case->generate_params) {
> +               test_case->run_case(test);
> +       } else {
> +               test->param_values = test_case->generate_params(NULL);
> +               test->current_param = 0;
> +
> +               while (test->param_values) {
> +                       test_case->run_case(test);
> +                       test->param_values = test_case->generate_params(test->param_values);
> +                       test->current_param++;
> +               }
> +       }
>  }

Looking forward to v4. :-)

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
