Return-Path: <SRS0=x3JG=A3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E69C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 16:35:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B3912065E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 16:35:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="farj/N/v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B3912065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D85E588FD0;
	Thu, 16 Jul 2020 16:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fsmcluVglme8; Thu, 16 Jul 2020 16:35:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C5E1B88ECA;
	Thu, 16 Jul 2020 16:35:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3D80C07FF;
	Thu, 16 Jul 2020 16:35:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B57EBC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A4F358AA83
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8LhyVJ-AWDhA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:35:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DCE6F8AB54
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 16:35:20 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id dm12so2982914qvb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 09:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=fNLVxbryOFz0P4iYYN4nq5tJAfgthGwNwlN4AMKfx5s=;
 b=farj/N/v+ww/83TMrMdBjmvadr5J8dJu08GDa5Tve6Cw2sMPHNaIVTcHH0ZFEV5Kwi
 NiY2D1Xt8uErC7YPv3kQC3PYDE+gwdKrJ3ApxcyQRSaOYXO/qJ+F/3mQXuS4533nh0cd
 CqcEznH6H2jGjttpN0nwhYp/vK6gjEhSQ/a9Oa41IlFPOaVxX09ev84NgIYKEqGfBQjN
 2sfhwOFwfdkryZ8q66d4MsB4adXy+0a+VLB51dDnO7M7+ZtBBOhD24vmB4rDE760G7SI
 xqALJZLkbyjkz4BesCT5g/br60aItZRF4KnT16fHXN2oNCeMyy8e2n5U2tWOPWuiytxP
 9dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=fNLVxbryOFz0P4iYYN4nq5tJAfgthGwNwlN4AMKfx5s=;
 b=MhO4pbikxPp4TKUGXXTgLaRFhtjyUMHXkoIVwlwrrbjArhkaEMyaYpIDqcfHxUNtDf
 wpd3jiUHxlI5//fomWHbG7i1OTs2UwSCqr4cIfvgcSHorcUlFuNKKFGlX7yuErk/duo0
 la1Bjlil5N5PW2I8I1jvTsKI5AfI2L0t9fkA79V+qVyizYebztHw6fKidrbDRgCrs+Yi
 KqSRVnWxDzdp9+CBB9+Y+CTY6q9MQLwI6eYqNg3HESPPFA7LBrZLCVTvtKT4cDjis6Z2
 sJ36VKhlDLdRWNKemyVKn5LFkaOdslTk4wpsopu03F2BNqp0x52ExYwbfy0X/Yg+de6v
 wheQ==
X-Gm-Message-State: AOAM531xtKPfiOX9fa/jQ1/AqEmJ6aMjwYyQ+eEJ42xlEMe2g5zKMMeS
 qBWVBHOoYdEAkw8/fNIUuiMKcA==
X-Google-Smtp-Source: ABdhPJwLiVWEhyy9wE5hXwCJKWEklBwb1sYkeUh8lfEwZJQowdISUQsLFJ8anNvNV9YuVvNhuv80nA==
X-Received: by 2002:a05:6214:851:: with SMTP id
 dg17mr5157555qvb.235.1594917319752; 
 Thu, 16 Jul 2020 09:35:19 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id l5sm8264754qtd.37.2020.07.16.09.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 09:35:18 -0700 (PDT)
Message-ID: <a1221f11e7ab6926dcca8b4cabfa4ef6dfecf654.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 16 Jul 2020 13:35:14 -0300
In-Reply-To: <CAFd5g47HPGjX4AYuBCjH8DqSUMNO+yqjudWH+ZNovStM+aXExA@mail.gmail.com>
References: <20200715031120.1002016-1-vitor@massaru.org>
 <20200715031120.1002016-3-vitor@massaru.org>
 <CAFd5g47HPGjX4AYuBCjH8DqSUMNO+yqjudWH+ZNovStM+aXExA@mail.gmail.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, 2020-07-15 at 17:37 -0700, Brendan Higgins wrote:
> On Tue, Jul 14, 2020 at 8:11 PM Vitor Massaru Iha <vitor@massaru.org>
> wrote:
> 
> Probably want to add more of a description here as what you are doing
> is not entirely trivial to someone not familiar with mm contexts.
> 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  include/kunit/test.h  |  1 +
> >  lib/kunit/try-catch.c | 15 ++++++++++++++-
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/kunit/test.h b/include/kunit/test.h
> > index 59f3144f009a..49c38bdcb93e 100644
> > --- a/include/kunit/test.h
> > +++ b/include/kunit/test.h
> > @@ -222,6 +222,7 @@ struct kunit {
> >          * protect it with some type of lock.
> >          */
> >         struct list_head resources; /* Protected by lock. */
> > +       struct mm_struct *mm;
> 
> Part of me thinks we should put a better name here, part of me thinks
> it is fine because it matches the convention.
> 
> Either way, this DEFINITELY deserves a comment explaining what it is,
> why it exists, and how it should/shouldn't be used.
> 
> >  };
> > 
> >  void kunit_init_test(struct kunit *test, const char *name, char
> > *log);
> > diff --git a/lib/kunit/try-catch.c b/lib/kunit/try-catch.c
> > index 0dd434e40487..f677c2f2a51a 100644
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
> >  void __noreturn kunit_try_catch_throw(struct kunit_try_catch
> > *try_catch)
> > @@ -24,8 +25,17 @@ EXPORT_SYMBOL_GPL(kunit_try_catch_throw);
> >  static int kunit_generic_run_threadfn_adapter(void *data)
> >  {
> >         struct kunit_try_catch *try_catch = data;
> > +       struct kunit *test = try_catch->test;
> > +
> > +       if (test->mm != NULL)
> > +               kthread_use_mm(try_catch->test->mm);
> > 
> >         try_catch->try(try_catch->context);
> > +       if (try_catch->test->mm) {
> 
> Here and below: You already have a pointer to test. You should use
> it.
> 
> > +               if (test->mm != NULL)
> > +                       kthread_unuse_mm(try_catch->test->mm);
> > +               try_catch->test->mm = NULL;
> > +       }
> > 
> >         complete_and_exit(try_catch->try_completion, 0);
> >  }
> > @@ -65,6 +75,9 @@ void kunit_try_catch_run(struct kunit_try_catch
> > *try_catch, void *context)
> >         try_catch->context = context;
> >         try_catch->try_completion = &try_completion;
> >         try_catch->try_result = 0;
> > +
> > +       test->mm = get_task_mm(current);
> > +
> >         task_struct =
> > kthread_run(kunit_generic_run_threadfn_adapter,
> >                                   try_catch,
> >                                   "kunit_try_catch_thread");
> > --
> > 2.26.2
> > 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
