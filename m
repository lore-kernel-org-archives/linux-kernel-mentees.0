Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41B5C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 18:10:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A807B2083B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 18:10:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ajUAXfrD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A807B2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 80D7986CB4;
	Thu, 30 Jul 2020 18:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ORodOGhvOYLX; Thu, 30 Jul 2020 18:10:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BD0D386BF9;
	Thu, 30 Jul 2020 18:10:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5537C0050;
	Thu, 30 Jul 2020 18:10:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DDE5C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 18:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6909B8789C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 18:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9KUsnf1IcTV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 18:10:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 46A3D884C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 18:10:39 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p1so14883210pls.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 11:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eCWZ0AKDmj5eYAH74+r2M/mKN/7ZXpbrEknxIsef3Yc=;
 b=ajUAXfrDq0Mb2pI9UhL+Deo64bgfocmrSQ7S3+wN7kirbVua2E3Fo7cLCk9f3YO1UW
 ySTM5mAzc7dfFuSgMadQN4k6RAqOOA77JKEXrw0mlGAWt0AsYKbmNK/x2KOhQAdYugUz
 KrLA08z7cNDfrOZbVmzsCMWDpbJywwGPnUhKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eCWZ0AKDmj5eYAH74+r2M/mKN/7ZXpbrEknxIsef3Yc=;
 b=jtIc6WiFtXBpvCok11YvQz+WI6bZE3/HY1ZIlZS3FzUlMRh3QVDGiM9QI1DTmi380m
 QLh1marHx7wa2pDbLOnEG0euqMHP92s9Gyngs3cmRl0gpf+zGoQz01O60cHmrL28N5gR
 kOuk6VZQN0vtcDzZzMaQHe1ykObAhaxXYUZS9MSYTn9M8jtZHbArd8QrBIpQJK7kFH70
 91LH1l42S/MdIBXd5QalflgcuC4xpVfDnGj4ZO7gCUsQrRufPL9fP5uE0miIxs/PA2KS
 gQv3/mOWs4rtYpHVetS5MnZIpdghlDbvwFmdTf9JI1x8KJkB1J/ZcfSr/UhoUDnNhg+c
 a+qw==
X-Gm-Message-State: AOAM5316lgYCm49cNf+S++9+8QDPnZQVGvh80BzbRiqEjaP5v81+kQcq
 q1aaQ4jmfpJaTclJZ56cRFLM3g==
X-Google-Smtp-Source: ABdhPJzJ1U3yCIj3cyycYFAeqg2w0SXGmg6Cxo8SvVZQ1srTSSZywo4dwa9+2kFhFvmNxkh040WAvA==
X-Received: by 2002:a17:902:8a90:: with SMTP id
 p16mr373142plo.167.1596132638877; 
 Thu, 30 Jul 2020 11:10:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d24sm6177185pjx.36.2020.07.30.11.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 11:10:37 -0700 (PDT)
Date: Thu, 30 Jul 2020 11:10:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <202007301056.D3BD1805B0@keescook>
References: <20200728141946.426245-1-yepeilin.cs@gmail.com>
 <20200729115157.8519-1-yepeilin.cs@gmail.com>
 <20200729125820.GB1840@kadam>
 <f2cf6137-987a-ab41-d88a-6828d46c255f@linux.com>
 <CAK8P3a20SEoYCrp3jOK32oZc9OkiPv+1KTjNZ2GxLbHpY4WexQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a20SEoYCrp3jOK32oZc9OkiPv+1KTjNZ2GxLbHpY4WexQ@mail.gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Denis Efremov <efremov@linux.com>, linux-block <linux-block@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] block/floppy: Prevent
 kernel-infoleak in raw_cmd_copyout()
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

On Thu, Jul 30, 2020 at 10:11:07AM +0200, Arnd Bergmann wrote:
> > On Wed, Jul 29, 2020 at 3:22 PM Denis Efremov <efremov@linux.com> wrote:
> 
> > And checked for leaks on x86_64 with the script test.sh
> > $ cat test.sh
> > #!/bin/bash
> >
> > for i in 4.8 5 6 7 8 9 10
> > do
> > ./run_container.sh gcc-$i $(pwd)/src $(pwd)/out bash -c 'gcc test.c; ./a.out'
> > ./run_container.sh gcc-$i $(pwd)/src $(pwd)/out bash -c 'gcc -O2 test.c; ./a.out'
> > ./run_container.sh gcc-$i $(pwd)/src $(pwd)/out bash -c 'gcc -O3 test.c; ./a.out'
> > done
> >
> > No leaks reported. Is it really possible this this kind of init, i.e. cmd = *ptr?
> 
> The problem is that the behavior is dependent not just on the compiler
> version but
> also optimization flags, target architecture and specific structure
> layouts. Most
> of the time, both gcc and clang will initialize the whole structure
> rather than just
> the individual members, but you still can't be sure that this is true
> for all configurations
> that this code runs on, except by using CONFIG_GCC_PLUGIN_STRUCTLEAK.
> 
> Kees pointed me to the lib/test_stackinit.c file in the kernel in which he has
> collected a number of combinations that are known to trigger the problem.
> 
> What I see there though are only cases of struct initializers like
> 
>   struct test_big_hole var = { .one = arg->one, .two=arg->two, .three
> = arg->three, .four = arg->four };

test_stackinit.c intended to use six cases (where "full" is in the sense
of "all members are named", this is intentionally testing the behavior
of padding hole initialization):

full static initialization:

          = { .one = 0,
              .two = 0,
              .three = 0,
              .four = 0,
          };

partial static init:

          = { .two = 0, };

full dynamic init:

          = { .one = arg->one,
              .two = arg->two,
              .three = arg->three,
              .four = arg->four,
          };

partial dynamic init:

          = { .two = arg->two, };

full runtime init:

          var.one = 0;
          var.two = 0;
          var.three = 0;
          memset(&var.four, 0, sizeof(var.four));

partial runtime init:

          var.two = 0;

(It seems in refactoring I botched the "full static initialization"
case, which I'll go fix separately.)

> but not the syntax used in the floppy driver:
> 
>    struct test_big_hole var = *arg;

So this one is a "whole structure copy" which I didn't have any tests
for, since I'd (perhaps inappropriately) assumed would be accomplished
with memcpy() internally, which means the incoming "*arg"'s padding holes
would be copied as-is. If the compiler is actually doing per-member copies
and leaving holes in "var" untouched, that's unexpected, so clearly that
needs to be added to test_stackinit.c! :)

> or the a constructor like
> 
>   struct test_big_hole var;
>   var = (struct test_big_hole){ .one = arg->one, .two=arg->two, .three
> = arg->three, .four = arg->four };
> 
> Kees, do you know whether those two would behave differently?
> Would it make sense to also check for those, or am I perhaps
> misreading your code and it already gets checked?

I *think* the above constructor would be covered under "full runtime
init", but it does also seem likely it would be handled similarly to
the "whole structure copy" in the previous example. I will go add more
tests...

-- 
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
