Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA980C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 19:06:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F32A2068F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 19:06:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gG1XFwUz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F32A2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 50CF08843F;
	Tue, 21 Jul 2020 19:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwuR6MpisA40; Tue, 21 Jul 2020 19:06:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7B52C8845D;
	Tue, 21 Jul 2020 19:06:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62527C089F;
	Tue, 21 Jul 2020 19:06:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35446C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 19:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1AA0E8815D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 19:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnBVAi7wgDCY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 19:06:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CCEB78821F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 19:06:45 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id n5so12362391pgf.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 12:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xl+gcvbDXd+PfVKLLD+1C1XM5QV+nhoL7JR5M/5kIIw=;
 b=gG1XFwUzVGKnd9WToMSC6L9L3IGTQ2wskP5zZ6bBwaanIpcpjC1GTOeAoRfRCUKHLd
 M1QJFNd1TTAChK9jBiH3oetqIg4srx0NUdbyizMl7shh1YAxIs2rnPaWm8z8uErvaBog
 sYaP7rQOCsMzb6+VXzC2BZ7sqHcQEyxQxPC3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xl+gcvbDXd+PfVKLLD+1C1XM5QV+nhoL7JR5M/5kIIw=;
 b=oAaVjTGJ327zbTfuhIcECSZSfOcnv/+Ktwss6B8YL4Sxo6/4HS4YiGBZlAWEfvIV93
 j3TSKrGbNVMRU3H1RxPSmZvf5VBa2/OUPP7nvD5vzfT8ICZvtxTj1vkVeaxf8I3hozwi
 t9zhKr0T4ZcC8yxLz1piZcxuOb4DvXFYl4NDlWvHwbInwQ0Cb2DfVzW0182QOZ2j48Ce
 GrdKeKwtMPRAk+MPuoYmP90xsJi4KvAPkc1new2ww1RF7hQGz/DSZKl0wXtsi3DuUQYT
 QtdXwoqZHW/cUaccdO9R4oxmhtmelnTob2FcUaKZlNMWiAlIEKLqpdg6kR8DhlqBED3b
 AHOA==
X-Gm-Message-State: AOAM5334gkDDEYlg6hSCSRWVo2Lh7qPMRex6ANQ1CNx5PPOBb8TJ6J0m
 aZjIATdR0nZE5P7ubbuXfSJA3w==
X-Google-Smtp-Source: ABdhPJzdfjK4EdVt5krNNTVtPzDsIEu++0oOObpGAk6TLAH/OkgIn/qunDavfBeMmNmdR9OMWfKCUA==
X-Received: by 2002:a63:7c42:: with SMTP id l2mr24525349pgn.35.1595358405368; 
 Tue, 21 Jul 2020 12:06:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y198sm21516181pfg.116.2020.07.21.12.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 12:06:44 -0700 (PDT)
Date: Tue, 21 Jul 2020 12:06:43 -0700
From: Kees Cook <keescook@chromium.org>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <202007211203.6CFE2F19BE@keescook>
References: <20200721174036.71072-1-vitor@massaru.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721174036.71072-1-vitor@massaru.org>
Cc: linux-kselftest@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, davidgow@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
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

On Tue, Jul 21, 2020 at 02:40:36PM -0300, Vitor Massaru Iha wrote:
> KUnit test cases run on kthreads, and kthreads don't have an
> adddress space (current->mm is NULL), but processes have mm.
> 
> The purpose of this patch is to allow to borrow mm to KUnit kthread
> after userspace is brought up, because we know that there are processes
> running, at least the process that loaded the module to borrow mm.
> 
> This allows, for example, tests such as user_copy_kunit, which uses
> vm_mmap, which needs current->mm.

Ah! In the case of kunit starting before there IS a userspace...
interesting.

> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> ---
> v2:
>     * splitted patch in 3:
>         - Allows to install and load modules in root filesystem;
>         - Provides an userspace memory context when tests are compiled
>           as module;
>         - Convert test_user_copy to KUnit test;
>     * added documentation;
>     * added more explanation;
>     * added a missed test pointer;
>     * released mm with mmput();
> v3:
>     * rebased with last kunit branch
>     * Please apply this commit from kunit-fixes:
>         3f37d14b8a3152441f36b6bc74000996679f0998
> 
>  Documentation/dev-tools/kunit/usage.rst | 14 ++++++++++++++
>  include/kunit/test.h                    | 12 ++++++++++++
>  lib/kunit/try-catch.c                   | 15 ++++++++++++++-
>  3 files changed, 40 insertions(+), 1 deletion(-)
> ---
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

typo: In case ...

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
> 
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 59f3144f009a..ae3337139c65 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -222,6 +222,18 @@ struct kunit {
>  	 * protect it with some type of lock.
>  	 */
>  	struct list_head resources; /* Protected by lock. */
> +	/*
> +	 * KUnit test cases run on kthreads, and kthreads don't have an
> +	 * adddress space (current->mm is NULL), but processes have mm.
> +	 *
> +	 * The purpose of this mm_struct is to allow to borrow mm to KUnit kthread
> +	 * after userspace is brought up, because we know that there are processes
> +	 * running, at least the process that loaded the module to borrow mm.
> +	 *
> +	 * This allows, for example, tests such as user_copy_kunit, which uses
> +	 * vm_mmap, which needs current->mm.
> +	 */
> +	struct mm_struct *mm;

I have a general concern that this will need more careful solving in the
future as there are likely to be many tests that need a userspace
context to operate sanely. But that's just a note; this solves the
specific case now.

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
>  	struct kunit_try_catch *try_catch = data;
> +	struct kunit *test = try_catch->test;
> +
> +	if (test != NULL && test->mm != NULL)
> +		kthread_use_mm(test->mm);
> 
>  	try_catch->try(try_catch->context);
> +	if (test != NULL && test->mm != NULL) {
> +		kthread_unuse_mm(test->mm);
> +		mmput(test->mm);
> +		test->mm = NULL;

This mmput() seems unbalanced... see below.

> +	}
> 
>  	complete_and_exit(try_catch->try_completion, 0);
>  }
> @@ -65,6 +75,9 @@ void kunit_try_catch_run(struct kunit_try_catch *try_catch, void *context)
>  	try_catch->context = context;
>  	try_catch->try_completion = &try_completion;
>  	try_catch->try_result = 0;
> +
> +	test->mm = get_task_mm(current);
> +
>  	task_struct = kthread_run(kunit_generic_run_threadfn_adapter,
>  				  try_catch,
>  				  "kunit_try_catch_thread");

Isn't there something that destroys a "struct kunit"? I would expect
that to perform the mmput(). Why is it up in the threadfn?

> 
> base-commit: d43c7fb05765152d4d4a39a8ef957c4ea14d8847
> --
> 2.26.2
> 

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
