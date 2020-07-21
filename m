Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31544C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 21:50:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE86F206E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 21:50:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="yJ+Z1CIy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE86F206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9A795882AC;
	Tue, 21 Jul 2020 21:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3-f1ekOaAS5; Tue, 21 Jul 2020 21:50:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A221488166;
	Tue, 21 Jul 2020 21:50:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EADDC088E;
	Tue, 21 Jul 2020 21:50:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C678C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 21:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1563686A3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 21:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8l_CNMI8W_Wp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 21:50:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0C4DA854DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 21:50:41 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id f5so10736786ybq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 14:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kLMDiGczciFjSsOj3dZDq7sO5iSQNRSWpLVbsp1EiI0=;
 b=yJ+Z1CIy1mq/LzN/hH8uLcG40OzKefS7+5Bg/NswbBmn8MKxf/kKxj6mZmlP+q7mgF
 61hll9Qjw6QqpPXgOyQDtLOrFxxlSrrfANYbpCqxgwUD2MPYOPryqui0sffIk6SxmTGu
 yk+VWw8NsjDNDO9Ev5bJxPO6XM4s4ugokO6dTC52BdtaxaTqThLi0HD4NG4GXIVeqnGa
 Reojvl6PKuUxlyjqNWnkw5U6dTBCORhBFPoOuRA1NBUvGVjh1SQvV+NVxqNjGivu1tmb
 XB8kCjXh9ymKFwhfBLmAAS/Hs3ph1vncbo7yD/z+k+DHW6xTKdo3UiHIfl0IJ6H7S3wH
 /T4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kLMDiGczciFjSsOj3dZDq7sO5iSQNRSWpLVbsp1EiI0=;
 b=tsPfTDe9MBSQKW6yq8Jxf1Sjx6VAmEI+tOhPzQzV+ffDsPBJiK6g/NwzkmQFgu3Xmj
 gacG8Y5lP4atmmB+cJp2dAMSZWY5CXqn1esMQA9m3U8BVwXcRDOSoJTGrQAYy43jtVT+
 G468wZBS0fK0hWoQ7vBQJTDnKigmcENjHtNuneLZqe22Mb9C5vmkV1C/7Ih5koCZpVZ/
 ahtfjhyDga70QLIy6k6SHM1H8cm2WnSPJ+iBrWrKtjF9/M8fE5FtBjURqdM+6t+OZcw1
 nx2BAeWNOLc2jYoPe0daBuPTXi4Bmq0nG8tPNKCoNliKvNM6n9JR3ZNHajyqRh0GFX5U
 KP3Q==
X-Gm-Message-State: AOAM530kLrpyFaNbUuDscD1I8Z4N6tqYgM+4gJw2MV72pJeIrtjVSgaa
 yQY0QN+LQDx7Bc4xeR60tBwI9v+opymhAQn/TH8vkQ==
X-Google-Smtp-Source: ABdhPJy68bX+ByEEwPuuMTF4k+NRbvWooV+CsEwnm8IuYSK8Pqsbeq/9PyEnxgdLO8OZ26n5SdppRrvdKekIiQY4vEM=
X-Received: by 2002:a25:cfd2:: with SMTP id
 f201mr45418368ybg.286.1595368240752; 
 Tue, 21 Jul 2020 14:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200721174036.71072-1-vitor@massaru.org>
 <202007211203.6CFE2F19BE@keescook>
In-Reply-To: <202007211203.6CFE2F19BE@keescook>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Tue, 21 Jul 2020 18:50:04 -0300
Message-ID: <CADQ6JjWGqOG568TmBvM-ZxK9j4n=WWsLTBJvzCCswC-SgW59rQ@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: kunit: Provides a
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

On Tue, Jul 21, 2020 at 4:06 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Jul 21, 2020 at 02:40:36PM -0300, Vitor Massaru Iha wrote:
> > KUnit test cases run on kthreads, and kthreads don't have an
> > adddress space (current->mm is NULL), but processes have mm.
> >
> > The purpose of this patch is to allow to borrow mm to KUnit kthread
> > after userspace is brought up, because we know that there are processes
> > running, at least the process that loaded the module to borrow mm.
> >
> > This allows, for example, tests such as user_copy_kunit, which uses
> > vm_mmap, which needs current->mm.
>
> Ah! In the case of kunit starting before there IS a userspace...
> interesting.

I didn't think that way, but I can rewrite if it looked like that.

> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> > v2:
> >     * splitted patch in 3:
> >         - Allows to install and load modules in root filesystem;
> >         - Provides an userspace memory context when tests are compiled
> >           as module;
> >         - Convert test_user_copy to KUnit test;
> >     * added documentation;
> >     * added more explanation;
> >     * added a missed test pointer;
> >     * released mm with mmput();
> > v3:
> >     * rebased with last kunit branch
> >     * Please apply this commit from kunit-fixes:
> >         3f37d14b8a3152441f36b6bc74000996679f0998
> >
> >  Documentation/dev-tools/kunit/usage.rst | 14 ++++++++++++++
> >  include/kunit/test.h                    | 12 ++++++++++++
> >  lib/kunit/try-catch.c                   | 15 ++++++++++++++-
> >  3 files changed, 40 insertions(+), 1 deletion(-)
> > ---
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
>
> typo: In case ...

Oops, thanks!

>
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
> >
> > diff --git a/include/kunit/test.h b/include/kunit/test.h
> > index 59f3144f009a..ae3337139c65 100644
> > --- a/include/kunit/test.h
> > +++ b/include/kunit/test.h
> > @@ -222,6 +222,18 @@ struct kunit {
> >        * protect it with some type of lock.
> >        */
> >       struct list_head resources; /* Protected by lock. */
> > +     /*
> > +      * KUnit test cases run on kthreads, and kthreads don't have an
> > +      * adddress space (current->mm is NULL), but processes have mm.
> > +      *
> > +      * The purpose of this mm_struct is to allow to borrow mm to KUnit kthread
> > +      * after userspace is brought up, because we know that there are processes
> > +      * running, at least the process that loaded the module to borrow mm.
> > +      *
> > +      * This allows, for example, tests such as user_copy_kunit, which uses
> > +      * vm_mmap, which needs current->mm.
> > +      */
> > +     struct mm_struct *mm;
>
> I have a general concern that this will need more careful solving in the
> future as there are likely to be many tests that need a userspace
> context to operate sanely. But that's just a note; this solves the
> specific case now.
>
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
> >       struct kunit_try_catch *try_catch = data;
> > +     struct kunit *test = try_catch->test;
> > +
> > +     if (test != NULL && test->mm != NULL)
> > +             kthread_use_mm(test->mm);
> >
> >       try_catch->try(try_catch->context);
> > +     if (test != NULL && test->mm != NULL) {
> > +             kthread_unuse_mm(test->mm);
> > +             mmput(test->mm);
> > +             test->mm = NULL;
>
> This mmput() seems unbalanced... see below.
>
> > +     }
> >
> >       complete_and_exit(try_catch->try_completion, 0);
> >  }
> > @@ -65,6 +75,9 @@ void kunit_try_catch_run(struct kunit_try_catch *try_catch, void *context)
> >       try_catch->context = context;
> >       try_catch->try_completion = &try_completion;
> >       try_catch->try_result = 0;
> > +
> > +     test->mm = get_task_mm(current);
> > +
> >       task_struct = kthread_run(kunit_generic_run_threadfn_adapter,
> >                                 try_catch,
> >                                 "kunit_try_catch_thread");
>
> Isn't there something that destroys a "struct kunit"? I would expect
> that to perform the mmput(). Why is it up in the threadfn?

My bad. From what I saw, there's nothing that would destroy "struct
kunit", but I will fix this umbalance.

Thanks for the review!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
