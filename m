Return-Path: <SRS0=x3JG=A3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F046C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 00:37:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 061592071B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 00:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="DFRDIY5f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 061592071B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF4C787D64;
	Thu, 16 Jul 2020 00:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kREe7fAOS5-R; Thu, 16 Jul 2020 00:37:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7370487D0C;
	Thu, 16 Jul 2020 00:37:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61D4FC0891;
	Thu, 16 Jul 2020 00:37:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78EEDC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 00:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 75AA287D59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 00:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8KYzWkbpkVFf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 00:37:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9346787D0C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 00:37:18 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id s26so2858957pfm.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 17:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mVodWiEHQkq0E0nBn3v+yTDqfSzN287V6yNqrTXAono=;
 b=DFRDIY5fVPO+tRVNaoPThKmwQLGgQrirP047p4B4mIhpL3deqJvaKcI6gRIHq2khNf
 F2HBJTLyaJ0AOeUJMrdPmoZXu1MX6JIUNyHpWyKuJmvM4f/vwPug1KfLEUZ9EumRKA8+
 BDV3AXymAZFVYqoNfq8/LWIfCLKe5k65NnSlI0GlLgzpaZG5zzpqmG/4uDVihsjMcOeU
 RRYscvBpSrSYR2qq/IoM2yj8IHgx7LEJk22IysJ1llJHOVowsOCwtN28MeycXUYHEswY
 ai80mqr23WL40hFdEbfuHRotDCTONfWYWb3obD3Hmh1+8qpd3YxhafkepdkyH2YmY3R0
 59FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mVodWiEHQkq0E0nBn3v+yTDqfSzN287V6yNqrTXAono=;
 b=L3DsArLczeGCwPeAk4JZp5lDvgqfzrs1Tn9tgF/3NhCw4305vGFWnXSJ0foBnLUNx2
 3eCtsbs7PSNIuAxMXQrWWMurt2o8C/kQ8m/JcWAKl81Frn0X7vmEXcvzoVxHIHrp6A5L
 QvutgOwUvM9lhOdl4LfRLxiS2sSI2xUwmEjqj60lOzr69oPQQ7mhBACDQI+Os+VQ9H1c
 M0icqzmrafRgqoalrGdnQv34jfy3dZWPpRhonLLVHUg6jlfjEN5qRCSdtt4nl8cYZsIP
 WwxfZfMXMYSLKHicC3HRai/H1pwuK1sw1Xvk2yf4Nwb/FN28oMmRzVVcNJCtM4MA3uX/
 PkrQ==
X-Gm-Message-State: AOAM532q/vkI6EDLaYSdxm+FXG1Ir4wDHLnNCIxoYkZanaJ1W2FcUDQf
 /drHn8I6INoa0t0847lsRbaTb3iZZ0cs6qFyaZzuGg==
X-Google-Smtp-Source: ABdhPJxGnJt4lUyRPW/VpEnwG2xIOd8fevL53BtMpqCJAdDEXJ8OmXXg7qkQPjBLGYmVPWNYLNSVgaXlhqhI5V1KDoQ=
X-Received: by 2002:a63:6e0e:: with SMTP id j14mr1944707pgc.384.1594859837823; 
 Wed, 15 Jul 2020 17:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200715031120.1002016-1-vitor@massaru.org>
 <20200715031120.1002016-3-vitor@massaru.org>
In-Reply-To: <20200715031120.1002016-3-vitor@massaru.org>
Date: Wed, 15 Jul 2020 17:37:06 -0700
Message-ID: <CAFd5g47HPGjX4AYuBCjH8DqSUMNO+yqjudWH+ZNovStM+aXExA@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [RFC 2/3] lib: Allows to borrow mm in
	userspace on KUnit
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

On Tue, Jul 14, 2020 at 8:11 PM Vitor Massaru Iha <vitor@massaru.org> wrote:

Probably want to add more of a description here as what you are doing
is not entirely trivial to someone not familiar with mm contexts.

>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> ---
>  include/kunit/test.h  |  1 +
>  lib/kunit/try-catch.c | 15 ++++++++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 59f3144f009a..49c38bdcb93e 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -222,6 +222,7 @@ struct kunit {
>          * protect it with some type of lock.
>          */
>         struct list_head resources; /* Protected by lock. */
> +       struct mm_struct *mm;

Part of me thinks we should put a better name here, part of me thinks
it is fine because it matches the convention.

Either way, this DEFINITELY deserves a comment explaining what it is,
why it exists, and how it should/shouldn't be used.

>  };
>
>  void kunit_init_test(struct kunit *test, const char *name, char *log);
> diff --git a/lib/kunit/try-catch.c b/lib/kunit/try-catch.c
> index 0dd434e40487..f677c2f2a51a 100644
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
> +       if (test->mm != NULL)
> +               kthread_use_mm(try_catch->test->mm);
>
>         try_catch->try(try_catch->context);
> +       if (try_catch->test->mm) {

Here and below: You already have a pointer to test. You should use it.

> +               if (test->mm != NULL)
> +                       kthread_unuse_mm(try_catch->test->mm);
> +               try_catch->test->mm = NULL;
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
> --
> 2.26.2
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
