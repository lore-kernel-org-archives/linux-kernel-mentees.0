Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC05C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:08:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E68FF207DE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="m+b/CR0I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E68FF207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9DD1D88158;
	Wed, 19 Aug 2020 21:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fpt3BFZKtG-U; Wed, 19 Aug 2020 21:08:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 613C9880F5;
	Wed, 19 Aug 2020 21:08:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AA94C0889;
	Wed, 19 Aug 2020 21:08:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D60F3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C508A8621E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xfeLB4_3Z4U3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:08:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F096E8621D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:08:03 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id p191so14109859ybg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 14:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p1h0o70heWIyDfW4WJLhr1C00M5SdMyJMwYyJJrQ7Vs=;
 b=m+b/CR0IOh/JwBLKSCJLtVSX9ATMicrNmGJWSi4OuhpDjrEiAsBSZMjmXRwXWWAYlK
 qoyjMPSRCmNnuV4BUvNreNFwith189w30QLZguYDXdW/ibHsJyCfanoeJrDjDPFSlpPT
 9wVsSf2+Eyaqudw0VJW4P5AR6pE3SsSylUbNDj8cAHlfFwu2KkZchI+qj2oLz67YSw7Z
 3U8kRcAC4LVwivqs8jwJAE6PyYSZumibj/2CjC1LhOHFuJEd0P88R560YGT73gxCJjY0
 bRqczll/6S+vJtE0j8VDkzQzv18aYlwJ+10+OrVFUs0R5MOgYQ5ZXThQ1PWL0B3hP657
 SMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p1h0o70heWIyDfW4WJLhr1C00M5SdMyJMwYyJJrQ7Vs=;
 b=fdBsPWY7tAniomdWqwCbp+JZ4gSvo7lyQusNOUaXT9yL8nq/7N2hJ5p22WgXAFAg1O
 qOF3I+7N1cMixSWEqFOz5GgiMz+13gnKdcTD2r+4c/CbeavUJWBFQpb3ksbvVQlhK/xY
 ei4jUmOAUFGNfnMY1QimsHI9fmi2mkjc10zBV7s5dkHANvmbp8c+lsAp94biNlUT9rPA
 TlgN1J2fcwb+0CcA8Wx352c+ITr7wohdtLo7TWxwlOAo423IzuT2m1gjAHLnR/Of4VWl
 nugIMY1ULQr6Oa8GishoQCUmVpdM4qmz+LdzUGWkwceBsW84r2/ZYmGWVUp181bJd0v8
 JjqQ==
X-Gm-Message-State: AOAM530Zpc1glSg/YQEQvc384FDChf01by10rllw7tHNoJBQYk9Ylb3S
 FG2xZoXqlZd3adOT/NZ6A0hyrkme7hH8y0QGJx33Bw==
X-Google-Smtp-Source: ABdhPJyMKeg+OZ2QgXsG3vO1p6LdzsP20vRAYZijhzPUIQ3EwAshymohxxa8F6FjoDp+KcJfUT2bV8600kmlrz3xvmc=
X-Received: by 2002:a25:ca50:: with SMTP id a77mr447316ybg.286.1597871281654; 
 Wed, 19 Aug 2020 14:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200718005025.440320-1-vitor@massaru.org>
 <CAFd5g44pr4z4X_E7sFYvYQnKQ22Lqz1a7Oy7Y_yXvJnqGQo9KQ@mail.gmail.com>
In-Reply-To: <CAFd5g44pr4z4X_E7sFYvYQnKQ22Lqz1a7Oy7Y_yXvJnqGQo9KQ@mail.gmail.com>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Wed, 19 Aug 2020 18:07:25 -0300
Message-ID: <CADQ6JjUOaU0e4WXz8Wv06o-3Scev7qNnj73Vsyen5+vJL9F7XA@mail.gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] lib: kunit: Provides a
 userspace memory context when tests are compiled as module
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

On Wed, Aug 19, 2020 at 6:05 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> On Fri, Jul 17, 2020 at 5:50 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
> >
> > KUnit test cases run on kthreads, and kthreads don't have an
> > adddress space (current->mm is NULL), but processes have mm.
> >
> > The purpose of this patch is to allow to borrow mm to KUnit kthread
> > after userspace is brought up, because we know that there are processes
> > running, at least the process that loaded the module to borrow mm.
> >
> > This allows, for example, tests such as user_copy_kunit, which uses
> > vm_mmap, which needs current->mm.
> >
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
>
> Can you put these together in the same patch series as you had before?
> When I asked you to split the patch up, I was just asking about that
> specific patch within the series. I still think all the patches go
> together.

Sure, I'll do that.

> As for this specific patch, I see one minor issue below; other than
> that, this looks good to me, so:
>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
>
> > ---
> > v2:
> >     * splitted patch in 3:
> >         - Allows to install and load modules in root filesystem;
> >         - Provides an userspace memory context when tests are compiled
> >           as module;
> >         - Convert test_user_copy to KUnit test;
> >     * added documentation;
> >     * added more explanation;
> >     * tested a pointer;
> >     * released mput();
> > ---
> >  Documentation/dev-tools/kunit/usage.rst | 14 ++++++++++++++
> >  include/kunit/test.h                    | 12 ++++++++++++
> >  lib/kunit/try-catch.c                   | 15 ++++++++++++++-
> >  3 files changed, 40 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
> > index 3c3fe8b5fecc..9f909157be34 100644
> > --- a/Documentation/dev-tools/kunit/usage.rst
> > +++ b/Documentation/dev-tools/kunit/usage.rst
> > @@ -448,6 +448,20 @@ We can now use it to test ``struct eeprom_buffer``:
> >
> >  .. _kunit-on-non-uml:
> >
> > +User-space context
> > +------------------
> > +
> > +I case you need a user-space context, for now this is only possible through
> > +tests compiled as a module. And it will be necessary to use a root filesystem
> > +and uml_utilities.
> > +
> > +Example:
> > +
> > +.. code-block:: bash
> > +
> > +   ./tools/testing/kunit/kunit.py run --timeout=60 --uml_rootfs_dir=.uml_rootfs
> > +
> > +
> >  KUnit on non-UML architectures
> >  ==============================
>
> I think the above documentation change belongs in the other related
> patch where you introduce the --uml_rootfs_dir flag.
>
> > diff --git a/include/kunit/test.h b/include/kunit/test.h
> > index 59f3144f009a..ae3337139c65 100644
> > --- a/include/kunit/test.h
> > +++ b/include/kunit/test.h
> > @@ -222,6 +222,18 @@ struct kunit {
> >          * protect it with some type of lock.
> >          */
> >         struct list_head resources; /* Protected by lock. */
> > +       /*
> > +        * KUnit test cases run on kthreads, and kthreads don't have an
> > +        * adddress space (current->mm is NULL), but processes have mm.
> > +        *
> > +        * The purpose of this mm_struct is to allow to borrow mm to KUnit kthread
> > +        * after userspace is brought up, because we know that there are processes
> > +        * running, at least the process that loaded the module to borrow mm.
> > +        *
> > +        * This allows, for example, tests such as user_copy_kunit, which uses
> > +        * vm_mmap, which needs current->mm.
> > +        */
> > +       struct mm_struct *mm;
> >  };
> >
> >  void kunit_init_test(struct kunit *test, const char *name, char *log);
> > diff --git a/lib/kunit/try-catch.c b/lib/kunit/try-catch.c
> > index 0dd434e40487..d03e2093985b 100644
> > --- a/lib/kunit/try-catch.c
> > +++ b/lib/kunit/try-catch.c
> > @@ -11,7 +11,8 @@
> >  #include <linux/completion.h>
> >  #include <linux/kernel.h>
> >  #include <linux/kthread.h>
> > -
> > +#include <linux/sched/mm.h>
> > +#include <linux/sched/task.h>
> >  #include "try-catch-impl.h"
> >
> >  void __noreturn kunit_try_catch_throw(struct kunit_try_catch *try_catch)
> > @@ -24,8 +25,17 @@ EXPORT_SYMBOL_GPL(kunit_try_catch_throw);
> >  static int kunit_generic_run_threadfn_adapter(void *data)
> >  {
> >         struct kunit_try_catch *try_catch = data;
> > +       struct kunit *test = try_catch->test;
> > +
> > +       if (test != NULL && test->mm != NULL)
> > +               kthread_use_mm(test->mm);
> >
> >         try_catch->try(try_catch->context);
> > +       if (test != NULL && test->mm != NULL) {
> > +               kthread_unuse_mm(test->mm);
> > +               mmput(test->mm);
> > +               test->mm = NULL;
> > +       }
> >
> >         complete_and_exit(try_catch->try_completion, 0);
> >  }
> > @@ -65,6 +75,9 @@ void kunit_try_catch_run(struct kunit_try_catch *try_catch, void *context)
> >         try_catch->context = context;
> >         try_catch->try_completion = &try_completion;
> >         try_catch->try_result = 0;
> > +
> > +       test->mm = get_task_mm(current);
> > +
> >         task_struct = kthread_run(kunit_generic_run_threadfn_adapter,
> >                                   try_catch,
> >                                   "kunit_try_catch_thread");
> >
> > base-commit: 725aca9585956676687c4cb803e88f770b0df2b2
> > prerequisite-patch-id: 5e5f9a8a05c5680fda1b04c9ab1b95ce91dc88b2
> > prerequisite-patch-id: 4d997940f4a9f303424af9bac412de1af861f9d9
> > prerequisite-patch-id: 582b6d9d28ce4b71628890ec832df6522ca68de0
> > --
> > 2.26.2
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
