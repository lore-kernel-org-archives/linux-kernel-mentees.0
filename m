Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C467C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 19:38:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E926206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 19:38:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="0QY3aCK1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E926206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E0A9E88659;
	Tue, 21 Jul 2020 19:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NzYLMgA1rqfI; Tue, 21 Jul 2020 19:38:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 04D1F88649;
	Tue, 21 Jul 2020 19:38:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCD4DC088E;
	Tue, 21 Jul 2020 19:38:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5501C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 19:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BE5EF86214
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 19:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjtRu8qpALe1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 19:38:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
 [209.85.219.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A4FF884E97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 19:38:36 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id f5so10565420ybq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yNJCh3phf+rCdlg8FFfmPMe2qMeoUk4tz3pbmAX7aY8=;
 b=0QY3aCK1qH9XoPtKYFzwnqZPIbop2okaD01HSyajDXz1Z4eGC7jdHRvFIj/rHR5UpL
 BbKsrzZAPprkV6w/dnhaCH249vIsvN0hhGzh+gwxsQMWKcLlQZNe4f2qvbMeWXYOngH4
 YP0+gp4eQ2d8/kjIX6/8vG4lZjFXbDxd6De8f9HUFG8dapg/Usag8rinPWfs8xlyUTrE
 NDXB0xQsDBI7gm/tl2lt6MnWkaikYG3IUU7muwZBAV0lmn+7vCuJvMTndDIVwKkyx0nq
 dUzHepCtYNACmJfel0GcPoN6iRsDqO3ul4jTs0ked/g5/2qd41eMRwudDsspPQSnHwlM
 pgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yNJCh3phf+rCdlg8FFfmPMe2qMeoUk4tz3pbmAX7aY8=;
 b=pieAPftFZOHNNnh3KykRuC+0oEcydOHXIwNykyBftaaM4/oBVyTAlrJo6nqHBvNi5T
 WVwB/4P9z01XUJcl87ZAJP0xfy4fX70w4PBgRspk3PtkNGo4zkjNmq4csm1X1ZLdsyDy
 rRcKA35iLFhmSqxbHwifS65LIz4PASPCgnS5uN5fKxELKsru3EP+5MNnoQurWWGM0tkt
 n+LbdyDlyBD7+6nMhAPUEb3gdtmrqIB8wAmUCues4iSFbDaRqhuwpvoAUJYGvcelKIri
 lIcj33BGePFwZBNUDsFpYoKma3JUZb2Rg7/fG26X10RhUNS65bKHiH1mEeG09OIoJ+Ca
 nEDA==
X-Gm-Message-State: AOAM5320mJn7sIOzDYCH5+MX/yHEuwuvAyVj8Nt7WSQUaImMLwpfrbbT
 8lZd9CYdHhe5q3Xf7+CsFoGVv8Jp8fTe1PF771jJeA==
X-Google-Smtp-Source: ABdhPJzQTM4KeBrIhYHxsPjf73rfrz5f1LTSh4nrR+7Uo2Za5LNtBCynusRil+iIHeTTycUVhLtxyljNyAzLyC1yGRY=
X-Received: by 2002:a25:3b4c:: with SMTP id i73mr46133482yba.129.1595360315488; 
 Tue, 21 Jul 2020 12:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200720224418.200495-1-vitor@massaru.org>
 <202007211150.73CF60A9@keescook>
In-Reply-To: <202007211150.73CF60A9@keescook>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Tue, 21 Jul 2020 16:37:59 -0300
Message-ID: <CADQ6JjUm10vPcSO5Wto=BjfM7dtdQZ924d0x-C6kxQKKZJr=qQ@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: overflow_kunit: add
	KUnit test conversion of check_*_overflow
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

On Tue, Jul 21, 2020 at 3:55 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Jul 20, 2020 at 07:44:18PM -0300, Vitor Massaru Iha wrote:
> > This adds the conversion of the runtime tests of check_*_overflow functions,
> > from `lib/test_overflow.c`to KUnit tests.
> >
> > The log similar to the one seen in dmesg running test_overflow.c can be
> > seen in `test.log`.
> >
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > Tested-by: David Gow <davidgow@google.com>
> > ---
> > v2:
> >   * moved lib/test_overflow.c to lib/overflow-test.c;
> >     * back to original license;
> >     * fixed style code;
> >     * keeps __initconst and added _refdata on overflow_test_cases variable;
> >     * keeps macros intact making asserts with the variable err;
> >     * removed duplicate test_s8_overflow();
> >   * fixed typos on commit message;
> >
> > v3:
> >   * changed filename to overflow_kunit.c;
> >   * replace _refdata by _inidata;
>
> It looks like this still needs to be _refdata (says the test bot)

I replaced it because you said `Erm, __refdata? This seems like it
should be __initdata.` in v2.

>
> > -static int __init test_ ## t ## _overflow(void) {                    \
> > +static int __init test_ ## t ## _overflow(struct kunit *test) {      \
>
> style nit: it seems like "test" isn't a great variable name. Why not
> make this "kunit" or "context" or something more specific?

I tried to follow the pattern I saw in other KUnit tests.

>
> >       int err = 0;                                                    \
> >       unsigned i;                                                     \
> >                                                                       \
> > @@ -256,6 +253,7 @@ static int __init test_ ## t ## _overflow(void) {                 \
> >               ARRAY_SIZE(t ## _tests));                               \
> >       for (i = 0; i < ARRAY_SIZE(t ## _tests); ++i)                   \
> >               err |= do_test_ ## t(&t ## _tests[i]);                  \
> > +     KUNIT_EXPECT_FALSE(test, err);                                  \
> >       return err;                                                     \
> >  }
>
> Also, if the caller is being made "void", probably this can be made void
> too?
>
> And if that's happening, maybe just plumb the EXPECT into the
> do_test_... call instead?

I did something similar in v1, but you said:
"Only callers of the do_test_*() would need to be changed. I think all of
these macros just need the pr_warn/KUNIT_FAIL changes, and the function
prototypes updated to include struct kunit *test."

>
> >
> > @@ -270,25 +268,25 @@ DEFINE_TEST_FUNC(u64, "%llu");
> >  DEFINE_TEST_FUNC(s64, "%lld");
> >  #endif
> >
> > -static int __init test_overflow_calculation(void)
> > +static void __init overflow_calculation_test(struct kunit *test)
> >  {
> >       int err = 0;
> >
> > -     err |= test_u8_overflow();
> > -     err |= test_s8_overflow();
> > -     err |= test_u16_overflow();
> > -     err |= test_s16_overflow();
> > -     err |= test_u32_overflow();
> > -     err |= test_s32_overflow();
> > +     err |= test_u8_overflow(test);
> > +     err |= test_s8_overflow(test);
> > +     err |= test_u16_overflow(test);
> > +     err |= test_s16_overflow(test);
> > +     err |= test_u32_overflow(test);
> > +     err |= test_s32_overflow(test);
> >  #if BITS_PER_LONG == 64
> > -     err |= test_u64_overflow();
> > -     err |= test_s64_overflow();
> > +     err |= test_u64_overflow(test);
> > +     err |= test_s64_overflow(test);
> >  #endif
> >
> > -     return err;
> > +     KUNIT_EXPECT_FALSE(test, err);
>
> This seems redundant (the tests were already tested)?

Yep, I just tried to do something you said in v1:

"I think it might be nice to keep the "err" vars around for a final report
line (maybe per test)? (It would keep the diff churn way lower, too...)"

> >  }
> >
> > -static int __init test_overflow_shift(void)
> > +static void __init overflow_shift_test(struct kunit *test)
> >  {
> >       int err = 0;
> >
> > @@ -313,9 +311,9 @@ static int __init test_overflow_shift(void)
> >                       pr_warn("got %llu\n", (u64)__d);                \
> >               __failed = 1;                                           \
> >       }                                                               \
> > -     if (!__failed)                                                  \
> > -             pr_info("ok: (%s)(%s << %s) == %s\n", #t, #a, #s,       \
> > -                     of ? "overflow" : #expect);                     \
> > +     KUNIT_EXPECT_FALSE_MSG(test, __failed,                          \
> > +                            "ok: (%s)(%s << %s) == %s\n", #t, #a, #s,\
> > +                            of ? "overflow" : #expect);              \
> >       __failed;                                                       \
> >  })
> >
> > @@ -479,7 +477,7 @@ static int __init test_overflow_shift(void)
> >       err |= TEST_ONE_SHIFT(0, 31, s32, 0, false);
> >       err |= TEST_ONE_SHIFT(0, 63, s64, 0, false);
> >
> > -     return err;
> > +     KUNIT_EXPECT_FALSE(test, err);
> >  }
> >
> >  /*
> > @@ -499,7 +497,7 @@ static int __init test_overflow_shift(void)
> >  #define TEST_SIZE            (5 * 4096)
> >
> >  #define DEFINE_TEST_ALLOC(func, free_func, want_arg, want_gfp, want_node)\
> > -static int __init test_ ## func (void *arg)                          \
> > +static int __init test_ ## func (struct kunit *test, void *arg)              \
> >  {                                                                    \
> >       volatile size_t a = TEST_SIZE;                                  \
> >       volatile size_t b = (SIZE_MAX / TEST_SIZE) + 1;                 \
> > @@ -507,19 +505,15 @@ static int __init test_ ## func (void *arg)                             \
> >                                                                       \
> >       /* Tiny allocation test. */                                     \
> >       ptr = alloc ## want_arg ## want_gfp ## want_node (func, arg, 1);\
> > -     if (!ptr) {                                                     \
> > -             pr_warn(#func " failed regular allocation?!\n");        \
> > -             return 1;                                               \
> > -     }                                                               \
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr,                     \
> > +                     #func " failed regular allocation?!\n");        \
> >       free ## want_arg (free_func, arg, ptr);                         \
> >                                                                       \
> >       /* Wrapped allocation test. */                                  \
> >       ptr = alloc ## want_arg ## want_gfp ## want_node (func, arg,    \
> >                                                         a * b);       \
> > -     if (!ptr) {                                                     \
> > -             pr_warn(#func " unexpectedly failed bad wrapping?!\n"); \
> > -             return 1;                                               \
> > -     }                                                               \
> > +     KUNIT_ASSERT_NOT_ERR_OR_NULL_MSG(test, ptr,                     \
> > +                     #func " unexpectedly failed bad wrapping?!\n"); \
> >       free ## want_arg (free_func, arg, ptr);                         \
> >                                                                       \
> >       /* Saturated allocation test. */                                \
> > @@ -555,7 +549,7 @@ DEFINE_TEST_ALLOC(kvzalloc_node, kvfree,     0, 1, 1);
> >  DEFINE_TEST_ALLOC(devm_kmalloc,  devm_kfree, 1, 1, 0);
> >  DEFINE_TEST_ALLOC(devm_kzalloc,  devm_kfree, 1, 1, 0);
> >
> > -static int __init test_overflow_allocation(void)
> > +static void __init overflow_allocation_test(struct kunit *test)
> >  {
> >       const char device_name[] = "overflow-test";
> >       struct device *dev;
> > @@ -563,52 +557,40 @@ static int __init test_overflow_allocation(void)
> >
> >       /* Create dummy device for devm_kmalloc()-family tests. */
> >       dev = root_device_register(device_name);
> > -     if (IS_ERR(dev)) {
> > -             pr_warn("Cannot register test device\n");
> > -             return 1;
> > -     }
> > -
> > -     err |= test_kmalloc(NULL);
> > -     err |= test_kmalloc_node(NULL);
> > -     err |= test_kzalloc(NULL);
> > -     err |= test_kzalloc_node(NULL);
> > -     err |= test_kvmalloc(NULL);
> > -     err |= test_kvmalloc_node(NULL);
> > -     err |= test_kvzalloc(NULL);
> > -     err |= test_kvzalloc_node(NULL);
> > -     err |= test_vmalloc(NULL);
> > -     err |= test_vmalloc_node(NULL);
> > -     err |= test_vzalloc(NULL);
> > -     err |= test_vzalloc_node(NULL);
> > -     err |= test_devm_kmalloc(dev);
> > -     err |= test_devm_kzalloc(dev);
> > +     KUNIT_ASSERT_FALSE_MSG(test, IS_ERR(dev), "Cannot register test device\n");
> > +
> > +     err |= test_kmalloc(test, NULL);
> > +     err |= test_kmalloc_node(test, NULL);
> > +     err |= test_kzalloc(test, NULL);
> > +     err |= test_kzalloc_node(test, NULL);
> > +     err |= test_kvmalloc(test, NULL);
> > +     err |= test_kvmalloc_node(test, NULL);
> > +     err |= test_kvzalloc(test, NULL);
> > +     err |= test_kvzalloc_node(test, NULL);
> > +     err |= test_vmalloc(test, NULL);
> > +     err |= test_vmalloc_node(test, NULL);
> > +     err |= test_vzalloc(test, NULL);
> > +     err |= test_vzalloc_node(test, NULL);
> > +     err |= test_devm_kmalloc(test, dev);
> > +     err |= test_devm_kzalloc(test, dev);
> >
> >       device_unregister(dev);
> >
> > -     return err;
> > +     KUNIT_EXPECT_FALSE(test, err);
> >  }
> >
> > -static int __init test_module_init(void)
> > -{
> > -     int err = 0;
> > -
> > -     err |= test_overflow_calculation();
> > -     err |= test_overflow_shift();
> > -     err |= test_overflow_allocation();
> > -
> > -     if (err) {
> > -             pr_warn("FAIL!\n");
> > -             err = -EINVAL;
> > -     } else {
> > -             pr_info("all tests passed\n");
> > -     }
>
> The reason for older feedback on leaving "err" as it was, was to make
> sure it was easy for a human to see if everything passed or not. If
> KUnit provides a summary of all the tests at the end, then I don't need
> to preserve that here (in which case "err" can go away). However, if
> that summary does not exist for KUnit yet, then I'd like to keep the
> summary that is being removed here.

Kunit shows the result this way:

[16:24:44] ======== [PASSED] overflow ========
[16:24:44] [PASSED] overflow_calculation_test
[16:24:44] [PASSED] overflow_shift_test
[16:24:44] [PASSED] overflow_allocation_test
[16:24:44] ============================================================

>
> > +static struct kunit_case __initdata overflow_test_cases[] = {
> > +     KUNIT_CASE(overflow_calculation_test),
> > +     KUNIT_CASE(overflow_shift_test),
> > +     KUNIT_CASE(overflow_allocation_test),
> > +     {}
> > +};
> >
> > -     return err;
> > -}
> > +static struct kunit_suite __initdata overflow_test_suite = {
> > +     .name = "overflow",
> > +     .test_cases = overflow_test_cases,
> > +};
> >
> > -static void __exit test_module_exit(void)
> > -{ }
> > +kunit_test_suites(&overflow_test_suite);
> >
> > -module_init(test_module_init);
> > -module_exit(test_module_exit);
> >  MODULE_LICENSE("Dual MIT/GPL");
> >
> > base-commit: c63d2dd7e134ebddce4745c51f9572b3f0d92b26
> > --
> > 2.26.2
> >
>
> --
> Kees Cook

In this version I tried to leave as few changes as possible.
It seemed to me that it would be better to leave a smaller diff.

Thanks for the review!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
