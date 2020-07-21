Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162D4C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 22:19:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D032320729
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 22:19:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="c2Fv/6x0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D032320729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D17988124;
	Tue, 21 Jul 2020 22:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhmROrE0H+vT; Tue, 21 Jul 2020 22:19:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 842DB8810D;
	Tue, 21 Jul 2020 22:19:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69C7DC089F;
	Tue, 21 Jul 2020 22:19:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35EEDC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 22:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1E3A386A5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 22:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D4vC22RTwL56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 22:19:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BEB7E86A5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 22:19:49 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id a30so10747783ybj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 15:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RYkwe2TFI9A7P2Vloq6bOJB7RnEAhpr5DBg4pZtGzOU=;
 b=c2Fv/6x0KwO0Lmpx99tTDYTYhXj44zwjmUTZoFvPc90CfCvoVY4fWXP+6VWHUrzAax
 DTqTfLKPmFxbTx3GVjju3tdIqKDMx82UpwRQjf3biiJNkwP2wuID8Tap86BexkgJi+vh
 iEM8FaWqkNwRWI9x44FRpTEKjLLHW0NVGSWp6sk3cifwE/PvSXBBQboMRNWsctI5EGqW
 60Cwz6M6imsXEXUMxGXNYQ19W7qawBG/HEuFXL27YAOUL6Ka2HUocCbkTxdIjpbPUu2C
 q5Z0sVgVBwED+HpNUDl7RRbD1HXOYPLHz97GddG0dmzIE/9eXv/ZA5phx8T4XHuH3Bxg
 IswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RYkwe2TFI9A7P2Vloq6bOJB7RnEAhpr5DBg4pZtGzOU=;
 b=BGuyuluYEiZZjsksUQo8jSSFRdEwNzuKVb7DPPkpvPltepOeSqfUfgZsbJXpvMN6XP
 ey1RfZYpK3Mkobx2R5oiO/6YKtGuTi2dfCFS+6JVlfClK5T5JeGg6yVIH3ehirYxvthT
 brYa3uPOt9DfHhJ2NjHUVQjWVImWRWlYshE+KDgy7D4YZohuLBTZG2KBDvaN5pZYJiuk
 br5Z1R9+7rCcLIUI+sGqNREFcEKhc+57WbI1bE3vsqT6FkRXj6Mx4LKfZjKvDC/r5Fre
 U5ywn/+/xFucTI5RvlnWxtLJH+XbAuY6/2ORQSFTovT1H47oz4wt/WkqBtGlwraU3AWX
 jYVw==
X-Gm-Message-State: AOAM531arh88Z2BAUtzPpo55vSeobQYmayVMS5nwaD3OneWMhfM4L+9y
 bM4960GsP0Rdj+6ZxcufiJFDVHi09PmC7A1S5TvDDQ==
X-Google-Smtp-Source: ABdhPJyYyroZixpeD9DQPgC9IM1qbgbTJNTkyvpqzYFdwrdpAlr/ZOGjsJyj01K2Z2bqkFYWqS+aFg9f9QZ7BrR+bII=
X-Received: by 2002:a25:ae01:: with SMTP id a1mr43897486ybj.119.1595369988584; 
 Tue, 21 Jul 2020 15:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200721174654.72132-1-vitor@massaru.org>
 <202007211207.5BAA9D8D@keescook>
In-Reply-To: <202007211207.5BAA9D8D@keescook>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Tue, 21 Jul 2020 19:19:12 -0300
Message-ID: <CADQ6JjU8rX2F_iBqth3u0EiA+CBgz4H+YL_-nbQ_cojYeLFXKQ@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: Convert test_user_copy
	to KUnit test
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

On Tue, Jul 21, 2020 at 4:09 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Jul 21, 2020 at 02:46:54PM -0300, Vitor Massaru Iha wrote:
> > This adds the conversion of the runtime tests of test_user_copy fuctions,
> > from `lib/test_user_copy.c`to KUnit tests.
> >
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> > v2:
> >     * splitted patch in 3:
> >         - Allows to install and load modules in root filesystem;
> >         - Provides an userspace memory context when tests are compiled
> >           as module;
> >         - Convert test_user_copy to KUnit test;
> >     * removed entry for CONFIG_TEST_USER_COPY;
> >     * replaced pr_warn to KUNIT_EXPECT_FALSE_MSG in test macro to
> >       decrease the diff;
> > v3:
> >     * rebased with last kunit branch
> >     * Please apply this commit from kunit-fixes:
> >         3f37d14b8a3152441f36b6bc74000996679f0998
> >       And these from patchwork:
> >         https://patchwork.kernel.org/patch/11676331/
> >         https://patchwork.kernel.org/patch/11676335/
> > ---
> >  lib/Kconfig.debug                           | 28 ++++++++------
> >  lib/Makefile                                |  2 +-
> >  lib/{test_user_copy.c => user_copy_kunit.c} | 42 +++++++++------------
> >  3 files changed, 35 insertions(+), 37 deletions(-)
> >  rename lib/{test_user_copy.c => user_copy_kunit.c} (91%)
> >
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 9ad9210d70a1..f699a3624ae7 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2078,18 +2078,6 @@ config TEST_VMALLOC
> >
> >         If unsure, say N.
> >
> > -config TEST_USER_COPY
> > -     tristate "Test user/kernel boundary protections"
> > -     depends on m
> > -     help
> > -       This builds the "test_user_copy" module that runs sanity checks
> > -       on the copy_to/from_user infrastructure, making sure basic
> > -       user/kernel boundary testing is working. If it fails to load,
> > -       a regression has been detected in the user/kernel memory boundary
> > -       protections.
> > -
> > -       If unsure, say N.
> > -
> >  config TEST_BPF
> >       tristate "Test BPF filter functionality"
> >       depends on m && NET
> > @@ -2154,6 +2142,22 @@ config SYSCTL_KUNIT_TEST
> >
> >         If unsure, say N.
> >
> > +config USER_COPY_KUNIT
> > +     tristate "KUnit Test for user/kernel boundary protections"
> > +     depends on KUNIT
> > +     depends on m
> > +     help
> > +       This builds the "user_copy_kunit" module that runs sanity checks
> > +       on the copy_to/from_user infrastructure, making sure basic
> > +       user/kernel boundary testing is working. If it fails to load,
> > +       a regression has been detected in the user/kernel memory boundary
> > +       protections.
> > +
> > +       For more information on KUnit and unit tests in general please refer
> > +       to the KUnit documentation in Documentation/dev-tools/kunit/.
> > +
> > +       If unsure, say N.
> > +
> >  config LIST_KUNIT_TEST
> >       tristate "KUnit Test for Kernel Linked-list structures" if !KUNIT_ALL_TESTS
> >       depends on KUNIT
> > diff --git a/lib/Makefile b/lib/Makefile
> > index b1c42c10073b..8c145f85accc 100644
> > --- a/lib/Makefile
> > +++ b/lib/Makefile
> > @@ -78,7 +78,6 @@ obj-$(CONFIG_TEST_VMALLOC) += test_vmalloc.o
> >  obj-$(CONFIG_TEST_OVERFLOW) += test_overflow.o
> >  obj-$(CONFIG_TEST_RHASHTABLE) += test_rhashtable.o
> >  obj-$(CONFIG_TEST_SORT) += test_sort.o
> > -obj-$(CONFIG_TEST_USER_COPY) += test_user_copy.o
> >  obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
> >  obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
> >  obj-$(CONFIG_TEST_PRINTF) += test_printf.o
> > @@ -318,3 +317,4 @@ obj-$(CONFIG_OBJAGG) += objagg.o
> >  # KUnit tests
> >  obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
> >  obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
> > +obj-$(CONFIG_USER_COPY_KUNIT) += user_copy_kunit.o
> > diff --git a/lib/test_user_copy.c b/lib/user_copy_kunit.c
> > similarity index 91%
> > rename from lib/test_user_copy.c
> > rename to lib/user_copy_kunit.c
> > index 5ff04d8fe971..a10ddd15b4cd 100644
> > --- a/lib/test_user_copy.c
> > +++ b/lib/user_copy_kunit.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/vmalloc.h>
> > +#include <kunit/test.h>
> >
> >  /*
> >   * Several 32-bit architectures support 64-bit {get,put}_user() calls.
> > @@ -35,7 +36,7 @@
> >  ({                                                                   \
> >       int cond = (condition);                                         \
> >       if (cond)                                                       \
> > -             pr_warn("[%d] " msg "\n", __LINE__, ##__VA_ARGS__);     \
> > +             KUNIT_EXPECT_FALSE_MSG(test, cond, msg, ##__VA_ARGS__); \
>
> I'm surprised any of this compiles with both a macro and arg named
> "test". :) Can you change the arg to something with more clarity?
> "context" or "kunit" seems better.

It will be out of the standard of the other tests in KUnit, but I agree that
I should not use the same name "test" in the argument and in the name
of the macro.
I'll replace it with "context" instead of "test" in arg.

>
> >       cond;                                                           \
> >  })
> >
> > @@ -44,7 +45,7 @@ static bool is_zeroed(void *from, size_t size)
> >       return memchr_inv(from, 0x0, size) == NULL;
> >  }
> >
> > -static int test_check_nonzero_user(char *kmem, char __user *umem, size_t size)
> > +static int test_check_nonzero_user(struct kunit *test, char *kmem, char __user *umem, size_t size)
> >  {
> >       int ret = 0;
> >       size_t start, end, i, zero_start, zero_end;
> > @@ -102,7 +103,7 @@ static int test_check_nonzero_user(char *kmem, char __user *umem, size_t size)
> >       return ret;
> >  }
> >
> > -static int test_copy_struct_from_user(char *kmem, char __user *umem,
> > +static int test_copy_struct_from_user(struct kunit *test, char *kmem, char __user *umem,
> >                                     size_t size)
> >  {
> >       int ret = 0;
> > @@ -177,7 +178,7 @@ static int test_copy_struct_from_user(char *kmem, char __user *umem,
> >       return ret;
> >  }
> >
> > -static int __init test_user_copy_init(void)
> > +static void user_copy_test(struct kunit *test)
> >  {
> >       int ret = 0;
> >       char *kmem;
> > @@ -192,16 +193,14 @@ static int __init test_user_copy_init(void)
> >  #endif
> >
> >       kmem = kmalloc(PAGE_SIZE * 2, GFP_KERNEL);
> > -     if (!kmem)
> > -             return -ENOMEM;
> > +     KUNIT_EXPECT_FALSE_MSG(test, kmem == NULL, "kmalloc failed");
>
> This would need to be an ASSERT, yes?

Yep, I'll fix it.

>
> >
> >       user_addr = vm_mmap(NULL, 0, PAGE_SIZE * 2,
> >                           PROT_READ | PROT_WRITE | PROT_EXEC,
> >                           MAP_ANONYMOUS | MAP_PRIVATE, 0);
> >       if (user_addr >= (unsigned long)(TASK_SIZE)) {
> > -             pr_warn("Failed to allocate user memory\n");
> >               kfree(kmem);
> > -             return -ENOMEM;
> > +             KUNIT_FAIL(test, "Failed to allocate user memory");
> >       }
>
> Why FAIL instead of ASSERT?

I did it this way so I wouldn't have to test twice if I had a memory
allocation problem,
once in the "if" and once in the ASSERT, so the memory of the other
kmalloc is freed
in case of memory allocation error in this memory allocation.

>
> >
> >       usermem = (char __user *)user_addr;
> > @@ -245,9 +244,9 @@ static int __init test_user_copy_init(void)
> >  #undef test_legit
> >
> >       /* Test usage of check_nonzero_user(). */
> > -     ret |= test_check_nonzero_user(kmem, usermem, 2 * PAGE_SIZE);
> > +     ret |= test_check_nonzero_user(test, kmem, usermem, 2 * PAGE_SIZE);
> >       /* Test usage of copy_struct_from_user(). */
> > -     ret |= test_copy_struct_from_user(kmem, usermem, 2 * PAGE_SIZE);
> > +     ret |= test_copy_struct_from_user(test, kmem, usermem, 2 * PAGE_SIZE);
> >
> >       /*
> >        * Invalid usage: none of these copies should succeed.
> > @@ -309,23 +308,18 @@ static int __init test_user_copy_init(void)
> >
> >       vm_munmap(user_addr, PAGE_SIZE * 2);
> >       kfree(kmem);
> > -
> > -     if (ret == 0) {
> > -             pr_info("tests passed.\n");
> > -             return 0;
> > -     }
> > -
> > -     return -EINVAL;
>
> Does KUnit provide a end-of-test summary now?

When you talk about end-of-test summary, is it what is written in
dmesg and not the kunit-tool?

>
> >  }
> >
> > -module_init(test_user_copy_init);
> > -
> > -static void __exit test_user_copy_exit(void)
> > -{
> > -     pr_info("unloaded.\n");
> > -}
> > +static struct kunit_case user_copy_test_cases[] = {
> > +     KUNIT_CASE(user_copy_test),
> > +     {}
> > +};
> >
> > -module_exit(test_user_copy_exit);
> > +static struct kunit_suite user_copy_test_suite = {
> > +     .name = "user_copy",
> > +     .test_cases = user_copy_test_cases,
> > +};
> >
> > +kunit_test_suites(&user_copy_test_suite);
> >  MODULE_AUTHOR("Kees Cook <keescook@chromium.org>");
> >  MODULE_LICENSE("GPL");
> >
> > base-commit: d43c7fb05765152d4d4a39a8ef957c4ea14d8847
> > --
> > 2.26.2
> >
>
> Otherwise, yes, looking good.
>
> --
> Kees Cook

Thanks for the review!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
