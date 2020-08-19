Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566C2C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:38:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 294CC2078D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:38:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="WKjKspyc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 294CC2078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C92EF22650;
	Wed, 19 Aug 2020 21:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EAfjXlcMAOKL; Wed, 19 Aug 2020 21:38:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DF61C21556;
	Wed, 19 Aug 2020 21:38:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D11C3C0889;
	Wed, 19 Aug 2020 21:38:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5245EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 40C8786248
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UYcYTJwB7NCS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:38:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0560886211
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:38:08 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id x2so14113431ybf.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 14:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=13XolofnMqkZ3K9umi/DCyCMfPlDNJF7Y24BCXktKJ8=;
 b=WKjKspycM95F+F/+s0p/Unh0lcBokeMnwMmc9RErG+o9e8Jx0hs7UTYn8Rc2pePZS2
 p/XReRBXb2dv18poh+WHfBY58jOk/+0ot2ozdWDwSHRlLFdQxd0k3GxevhJCbC3mhZPA
 CZTIzdoHs9+EJPVjywLJYny1Hs36Ia7bQIU4bUnjv0Mr5TweqLCqVdLNYaeozkFHNeXc
 Ql4qhAAaN0alQjJD0DkmhvVi0P2E5w6Wj/uegDWd1qg5aKLPHhvXMB3rAi/9TzCBg503
 rPVE3F0v6bs1qBPL6EG9ImyQ9besK61pjiJk5D4hTHon/+B/DeowJY0M2nnVNaofbVSM
 dWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=13XolofnMqkZ3K9umi/DCyCMfPlDNJF7Y24BCXktKJ8=;
 b=ZFbu+n3KWrvDeqH5PuUugnIF1+PusopYi3rob+aJwAvOkwqqAfAAcwrbnOODAvSAq5
 C8eGk2cUoLDbvcsCxR3/BTeoig8uGQOoWrrrzKM2iM7KalzhDKqUDsg1pzQJgfPqRNny
 Q1P0+dyQobSEvvOun0LQCQh0nukFNE/0HF34RHMgCyZlBuD/ySPKoIHQX5TMkQILkkWC
 DdS4/mQY7q5wDK6eGXXgpfYnqNmZOkL1OMJh4RyIZvHIM0pLgwvnt/3sD7sij2WbvGCl
 KVYwxXSMiasMj3q9NXu0liKHwlYFC7k2cGF/gz5LS9eVpOQJo9OsEJheaZe1jURveICy
 PC/g==
X-Gm-Message-State: AOAM531p+ohqRJxk2T+Wg8+LPo6PxZmlHKG/KOYGnHxzHPS2Ny1nQ12M
 2l3yeRyYOEjoE0CgUgZOgyAJJMOQnekwDXjVAINQdw==
X-Google-Smtp-Source: ABdhPJzGHDDZHjLK2LJTsnoVbyhxAgGYhcmzSmSQlpqSOKuWguwYH45MdXfW6BiVNriYDmSpTMChM80CRZYl6j4SSc0=
X-Received: by 2002:a25:2fcc:: with SMTP id v195mr542457ybv.119.1597873087805; 
 Wed, 19 Aug 2020 14:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200819194634.68976-1-vitor@massaru.org>
 <CAFd5g45AuxZYY_92rOXwtVjmbaGuts+DV6WpqhHNxWYNotxq+g@mail.gmail.com>
In-Reply-To: <CAFd5g45AuxZYY_92rOXwtVjmbaGuts+DV6WpqhHNxWYNotxq+g@mail.gmail.com>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Wed, 19 Aug 2020 18:37:31 -0300
Message-ID: <CADQ6JjU_ppjnPU6=_eOiwjQe-FKn1Rpf-p+WDEA57rXGF80PEQ@mail.gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] kunit: fix:
 kunit_binary_assert_format() only prints signed int
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

On Wed, Aug 19, 2020 at 6:30 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> On Wed, Aug 19, 2020 at 12:46 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
> >
> > Some tests, such as overflow_kunit(), uses unsigned int,
> > But kunit_binary_assert_format() only prints signed int,
> > this commit also deals with the unsigned int print.

Oops, Thanks!
I'll fix it.

> >
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  lib/kunit/assert.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/kunit/assert.c b/lib/kunit/assert.c
> > index 202f9fdeed0e..3ae90c09986a 100644
> > --- a/lib/kunit/assert.c
> > +++ b/lib/kunit/assert.c
> > @@ -104,12 +104,23 @@ void kunit_binary_assert_format(const struct kunit_assert *assert,
> >                                   binary_assert->left_text,
> >                                   binary_assert->operation,
> >                                   binary_assert->right_text);
> > -               string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld\n",
> > +
> > +               if (binary_assert->left_value - 1 < 0) {
> > +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld\n",
> > +                                 binary_assert->left_text,
> > +                                 binary_assert->left_value);
> > +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld",
> > +                                 binary_assert->right_text,
> > +                                 binary_assert->right_value);
> > +               }
> > +               else {
> > +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %llu\n",
> >                                   binary_assert->left_text,
> >                                   binary_assert->left_value);
> > -               string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld",
> > +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %llu",
> >                                   binary_assert->right_text,
> >                                   binary_assert->right_value);
> > +               }
>
> I agree that you found a bug here; however, I disagree that this is
> the correct fix. Given that the value is stored as a long long; isn't
> the value always stored as a signed value? So if the value overflows,
> won't it still not pass the check you have here?
>
> >         }
> >         kunit_assert_print_msg(assert, stream);
> >  }
> >
> > base-commit: d43c7fb05765152d4d4a39a8ef957c4ea14d8847
> > prerequisite-patch-id: bf4b0962b0b955e4e45f5d25fece889562118158
> > --
> > 2.26.2
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
