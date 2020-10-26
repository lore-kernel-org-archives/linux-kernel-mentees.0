Return-Path: <SRS0=aL4C=EB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3251CC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 23:14:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65C0720719
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 23:14:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ruFYXNTj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65C0720719
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CBD9E20381;
	Mon, 26 Oct 2020 23:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GsYAmyUK7UZo; Mon, 26 Oct 2020 23:14:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EEE852010D;
	Mon, 26 Oct 2020 23:14:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E11A2C088B;
	Mon, 26 Oct 2020 23:14:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4105C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 23:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CB5DC85EBE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 23:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WshqV8CzUGCT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 23:14:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E7C4B85B2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 23:14:15 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id h62so9546913oth.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 16:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rtnCo2BEv8dnTOOlZbPQs4uRATJRDmvi8k9IkHEHV5Q=;
 b=ruFYXNTj8pNpWPLqOuBoMGZdA1RA5EAmAmEILKFH8Jk1iMOYp6nHwx0GSH/4xR39CI
 RVTtjQlCCTRUovbcRKK2VOnrn3NnoAVYcIj13VfKtN4wmHtAfvO+jPhyZKl9GHtxkJHN
 rI+GONJ+IwxadIlUFjeBKrbrjcdjSqsR4Kj0fLI3RTJFM1n/w8JVC+gc5NS5Bcc972rY
 aWXnHXzgbMgLjSYfYE7XdpA5SntRanq98SBIdHOz73VQjYh9r+U6FvFZgSESb24+XmAz
 tjyd5V9ybLs2K7KBA/iGfAhmvd7KGimB/3Qih9/lJ2ra0BcP/AKWMWcq7WyK899g+DEt
 XI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtnCo2BEv8dnTOOlZbPQs4uRATJRDmvi8k9IkHEHV5Q=;
 b=WWdlb9GQg6Q7KQZXVWhpkVbycQh2BywsgNZyQIOZFs5PzaVluaN46pci5Xy7LpoUia
 CM4w0LxocR6M1h/7t27bXMVn+E49htW7u9pWvfFV6Rj8PWAySPdmuoA83p4zCq2YGYBJ
 nLbUGj0VsTyMvSTVX5pVWaTgMqsLO3BeJaEMKhi5N2Q+dQStGiK0vPrdEML7UdqPulk+
 NPTapPIGrfM1aq2AMyoPU0PLOHhPn8lAoJqj+jOwbr2ajvqt76WDUUUZCu46vV36nGUI
 2nKauplENb5/kSYGWr+lk/Hq3N83/pf+qxJz7fSgSIoENA/k69uRjLOAsN7lbL3TM+0X
 JlBQ==
X-Gm-Message-State: AOAM533BPlxosfCEtfsSOHSNbSy4f57F32WXJy1O9uUyHIZwheFOrRe8
 IzvjwMMu/u0Z0e1keT8wP42qG4yUqLlZwfDzBZTNsQ==
X-Google-Smtp-Source: ABdhPJw0F4J4BcLEjSwsurEvo/n9/PqQmt7GchLvDFbNDOZ2IfLtrGTPdNrNvzacbvn5uqCj+klJlJlGCH/v1WBWOY0=
X-Received: by 2002:a9d:649:: with SMTP id 67mr17364102otn.233.1603754054772; 
 Mon, 26 Oct 2020 16:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201026183523.82749-1-98.arpi@gmail.com>
In-Reply-To: <20201026183523.82749-1-98.arpi@gmail.com>
Date: Tue, 27 Oct 2020 00:14:03 +0100
Message-ID: <CANpmjNNQtGC_jDp8TSHRHOMXi7aTQgwjtUiCWE+YqBgq-G2z5Q@mail.gmail.com>
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

On Mon, 26 Oct 2020 at 19:36, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
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
> Changes v2->v3:
> - Modifictaion of generator macro and method

Great to see it worked as expected!

> Changes v1->v2:
> - Use of a generator method to access test case parameters
>
>  include/kunit/test.h | 32 ++++++++++++++++++++++++++++++++
>  lib/kunit/test.c     | 20 +++++++++++++++++++-
>  2 files changed, 51 insertions(+), 1 deletion(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index a423fffefea0..16bf9f334e2c 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -142,6 +142,12 @@ struct kunit_case {
>         void (*run_case)(struct kunit *test);
>         const char *name;
>
> +       /*
> +        * Pointer to test parameter generator function.
> +        * Used only for parameterized tests.

What I meant was to give a description of the protocol, so that if
somebody wanted, they could (without reading the implementation)
implement their own custom generator without the helper macro.

E.g. something like: "The generator function is used to lazily
generate a series of arbitrarily typed values that fit into a void*.
The argument @prev is the previously returned value, which should be
used to derive the next value; @prev is set to NULL on the initial
generator call. When no more values are available, the generator must
return NULL."

> +        */
> +       void* (*generate_params)(void *prev);
> +
>         /* private: internal use only. */
>         bool success;
>         char *log;
> @@ -162,6 +168,9 @@ static inline char *kunit_status_to_string(bool status)
>   * &struct kunit_case for an example on how to use it.
>   */
>  #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
> +#define KUNIT_CASE_PARAM(test_name, gen_params)                        \
> +               { .run_case = test_name, .name = #test_name,    \
> +                 .generate_params = gen_params }
>
>  /**
>   * struct kunit_suite - describes a related collection of &struct kunit_case
> @@ -208,6 +217,15 @@ struct kunit {
>         const char *name; /* Read only after initialization! */
>         char *log; /* Points at case log after initialization */
>         struct kunit_try_catch try_catch;
> +       /* param_values points to test case parameters in parameterized tests */
> +       void *param_values;
> +       /*
> +        * current_param stores the index of the parameter in
> +        * the array of parameters in parameterized tests.
> +        * current_param + 1 is printed to indicate the parameter
> +        * that causes the test to fail in case of test failure.
> +        */
> +       int current_param;
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

This is only for arrays, which is why I suggested KUNIT_ARRAY_PARAM()
as the name.

A generator can very well be implemented without an array, so this
macro name is confusing. In future somebody might want to provide a
macro that takes a start + end value (and maybe a step value) to
generate a series of values. That generator could be named
KUNIT_RANGE_PARAM(name, start, end, step) and gives us a generator
that is also named name##_gen_params. (If you want to try implementing
that macro, I'd suggest doing it as a separate patch.)

And I don't think we need to put "GENERATOR" into the name of these
macros, because the generators are now the fundamental method with
which to get parameterized tests. We don't need to state the obvious,
in favor of some brevity.

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

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
