Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAD0C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:12:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB4C8207DE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="bWhJfXIH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB4C8207DE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8759B8623E;
	Wed, 19 Aug 2020 21:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yrHkYBeKyAm8; Wed, 19 Aug 2020 21:12:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E4B8A85F7D;
	Wed, 19 Aug 2020 21:12:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB2F5C0889;
	Wed, 19 Aug 2020 21:12:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCB5CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A810388159
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPP0Eakzih93
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:12:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 409AA88158
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:12:37 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id r7so55201vsq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 14:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E9eRVOLaul6cq01mtbbr/ED3T1zhaooeYNDSyj6PbBQ=;
 b=bWhJfXIHoYrd3Cbwkg7cRhBSQajpxTQ6y9B4X7AwebO+WOLWJmZB5uFsklsfyrcPbk
 E38o8S/CJmckAgblLWsrO/ZpA4M5275XCCP4rgvZje1Ap+6V3YRqg0XT/r+XaZaptPEi
 oQq9Erv0sQWQAsjNxM++KsGSm7VtsLsFs+OeghXEhlLjiQL0VHhJYmKgZw1DfobEJaPz
 fczscWNyP7MB7AJ5hFVAN3UgiDRMagfqEcNw/RGUSE3IS4p9DRv9SdmlLG+WbkxgkXNO
 pdL3TBJyFeS+BF2vH8azBWUlj7TxadcYNtc+j+bb1Gqzxwpq1uOZ3O3hmQDDhBS2+nTi
 P8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E9eRVOLaul6cq01mtbbr/ED3T1zhaooeYNDSyj6PbBQ=;
 b=X2Kt8O1EJumzdbuf6YBvv13qEqsB4hOB7DDUdMg7c4VmykkUH/U7x5Q2xmRRBWl1jz
 70PCCZvbrz9BaT5dbalRBkzLrroqhJO31Yhr8XwKDAy+g4ERNSeMDM/ihlYd6qdQb0Wf
 Djrn8KwXADtZJalc+GCyCDZ7mQTKN23OsR7TOR/WCXXxlLKO7xe619dRFRahdKTZbeKd
 vvPYSw62Jc2mjKmu5E9y2b8qtmel5rHH5CEO0VmoJ9AJH2RqwsSMwl8U2vjTukeXsDCI
 3Ayn05mpLfxDuHV17XcDPfzBYdLaZhNwIJsDeXLjHFkGZ4xsXg5d48oATrGxktafLj0x
 +UFQ==
X-Gm-Message-State: AOAM532YOKhha1oHxtg1WGR+32aW47q8qqxMRiN/bnTfEXIHznLQgLt/
 uH6NOpMqSd56n4A0P4mwIT5EENKgInNyCo6bp+s31E2/R27Zjg==
X-Google-Smtp-Source: ABdhPJy4L45+jit4l+08gbBJ4kJKTqDvMaJ+/xeQR0tWB76SQei+95epNN9E9y29KndTWunNmWZYTAzrCswY+U3YmYk=
X-Received: by 2002:a17:902:c382:: with SMTP id
 g2mr1602728plg.297.1597871149723; 
 Wed, 19 Aug 2020 14:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200718005025.440320-1-vitor@massaru.org>
In-Reply-To: <20200718005025.440320-1-vitor@massaru.org>
Date: Wed, 19 Aug 2020 14:05:38 -0700
Message-ID: <CAFd5g44pr4z4X_E7sFYvYQnKQ22Lqz1a7Oy7Y_yXvJnqGQo9KQ@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Jul 17, 2020 at 5:50 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> KUnit test cases run on kthreads, and kthreads don't have an
> adddress space (current->mm is NULL), but processes have mm.
>
> The purpose of this patch is to allow to borrow mm to KUnit kthread
> after userspace is brought up, because we know that there are processes
> running, at least the process that loaded the module to borrow mm.
>
> This allows, for example, tests such as user_copy_kunit, which uses
> vm_mmap, which needs current->mm.
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>

Can you put these together in the same patch series as you had before?
When I asked you to split the patch up, I was just asking about that
specific patch within the series. I still think all the patches go
together.

As for this specific patch, I see one minor issue below; other than
that, this looks good to me, so:

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

> ---
> v2:
>     * splitted patch in 3:
>         - Allows to install and load modules in root filesystem;
>         - Provides an userspace memory context when tests are compiled
>           as module;
>         - Convert test_user_copy to KUnit test;
>     * added documentation;
>     * added more explanation;
>     * tested a pointer;
>     * released mput();
> ---
>  Documentation/dev-tools/kunit/usage.rst | 14 ++++++++++++++
>  include/kunit/test.h                    | 12 ++++++++++++
>  lib/kunit/try-catch.c                   | 15 ++++++++++++++-
>  3 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
> index 3c3fe8b5fecc..9f909157be34 100644
> --- a/Documentation/dev-tools/kunit/usage.rst
> +++ b/Documentation/dev-tools/kunit/usage.rst
> @@ -448,6 +448,20 @@ We can now use it to test ``struct eeprom_buffer``:
>
>  .. _kunit-on-non-uml:
>
> +User-space context
> +------------------
> +
> +I case you need a user-space context, for now this is only possible through
> +tests compiled as a module. And it will be necessary to use a root filesystem
> +and uml_utilities.
> +
> +Example:
> +
> +.. code-block:: bash
> +
> +   ./tools/testing/kunit/kunit.py run --timeout=60 --uml_rootfs_dir=.uml_rootfs
> +
> +
>  KUnit on non-UML architectures
>  ==============================

I think the above documentation change belongs in the other related
patch where you introduce the --uml_rootfs_dir flag.

> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 59f3144f009a..ae3337139c65 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -222,6 +222,18 @@ struct kunit {
>          * protect it with some type of lock.
>          */
>         struct list_head resources; /* Protected by lock. */
> +       /*
> +        * KUnit test cases run on kthreads, and kthreads don't have an
> +        * adddress space (current->mm is NULL), but processes have mm.
> +        *
> +        * The purpose of this mm_struct is to allow to borrow mm to KUnit kthread
> +        * after userspace is brought up, because we know that there are processes
> +        * running, at least the process that loaded the module to borrow mm.
> +        *
> +        * This allows, for example, tests such as user_copy_kunit, which uses
> +        * vm_mmap, which needs current->mm.
> +        */
> +       struct mm_struct *mm;
>  };
>
>  void kunit_init_test(struct kunit *test, const char *name, char *log);
> diff --git a/lib/kunit/try-catch.c b/lib/kunit/try-catch.c
> index 0dd434e40487..d03e2093985b 100644
> --- a/lib/kunit/try-catch.c
> +++ b/lib/kunit/try-catch.c
> @@ -11,7 +11,8 @@
>  #include <linux/completion.h>
>  #include <linux/kernel.h>
>  #include <linux/kthread.h>
> -
> +#include <linux/sched/mm.h>
> +#include <linux/sched/task.h>
>  #include "try-catch-impl.h"
>
>  void __noreturn kunit_try_catch_throw(struct kunit_try_catch *try_catch)
> @@ -24,8 +25,17 @@ EXPORT_SYMBOL_GPL(kunit_try_catch_throw);
>  static int kunit_generic_run_threadfn_adapter(void *data)
>  {
>         struct kunit_try_catch *try_catch = data;
> +       struct kunit *test = try_catch->test;
> +
> +       if (test != NULL && test->mm != NULL)
> +               kthread_use_mm(test->mm);
>
>         try_catch->try(try_catch->context);
> +       if (test != NULL && test->mm != NULL) {
> +               kthread_unuse_mm(test->mm);
> +               mmput(test->mm);
> +               test->mm = NULL;
> +       }
>
>         complete_and_exit(try_catch->try_completion, 0);
>  }
> @@ -65,6 +75,9 @@ void kunit_try_catch_run(struct kunit_try_catch *try_catch, void *context)
>         try_catch->context = context;
>         try_catch->try_completion = &try_completion;
>         try_catch->try_result = 0;
> +
> +       test->mm = get_task_mm(current);
> +
>         task_struct = kthread_run(kunit_generic_run_threadfn_adapter,
>                                   try_catch,
>                                   "kunit_try_catch_thread");
>
> base-commit: 725aca9585956676687c4cb803e88f770b0df2b2
> prerequisite-patch-id: 5e5f9a8a05c5680fda1b04c9ab1b95ce91dc88b2
> prerequisite-patch-id: 4d997940f4a9f303424af9bac412de1af861f9d9
> prerequisite-patch-id: 582b6d9d28ce4b71628890ec832df6522ca68de0
> --
> 2.26.2
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
