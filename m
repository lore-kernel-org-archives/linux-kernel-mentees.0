Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2842CC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 22:19:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E648C2067C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 22:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="WfuwtID2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E648C2067C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B2D8E86456;
	Wed, 19 Aug 2020 22:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hSow9pt44qwJ; Wed, 19 Aug 2020 22:19:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D654086256;
	Wed, 19 Aug 2020 22:19:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2768C07FF;
	Wed, 19 Aug 2020 22:19:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E63E9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 22:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AD953226FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 22:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5HByIvPYPd6b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 22:19:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 34088226E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 22:19:27 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s14so88772plp.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 15:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wEwuGuxy3L1peQcMWumktXpMLRWDaCI5Cf0WrWRd6zw=;
 b=WfuwtID2xw/sfgpss0NykPiguykx52NA0uDLG9CW4XVt8heA/aPzSz8PaxP5kT537m
 yQNgqCVv9apq2LBARtOlRd2bmtqQk02FPRfkGjZCugG45YK9m1tULgb9hvXV3+f2efpy
 uhzJGhVF1LIwksH+a26Rez8lLURl8t9iWnefXcS6ySMF7eoyI3qa2+ESF9B1L1BE+TgY
 wnMcw1UwNIso5bAakEkyQe2XQUxuq54pza+ag1BaYK25ygyqb9TB3jC898W57wK5/tZ3
 pBq3gIrl2d2bOyI0/RhiimejMOwZ57u0zE/zJVUk9dfNcnv3JAuKjIfjF/1MTAPzOIkS
 05zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wEwuGuxy3L1peQcMWumktXpMLRWDaCI5Cf0WrWRd6zw=;
 b=mssSoITxs/+3Qs7n9jRI6P/OfJx4mEFKnSAScJPn6Q6eQqr3l08m7xjo0NzOHaO/tj
 Hicy54tIBf2LWdTYAWFg6g4DqpbJP+38UkgTgpjhOGbduxa1vxfSoPrPbTCk7UAtUabe
 o7UtkALUI9Fi03Shqb99Z5ao8cYzr0OfOKlRwgD4aJcM8+cNrXvLy/llv+HH6G8jbjrr
 o8gN6nqvS/7mrQHGHBfa3Sgl5gWqPgKK6ciP2dCKnnTXl9/VacZSp/1Q7qviTg9V4fO5
 GzwfXtFu82vOf6Dc+5LCDT0zU0e4MzLyD2sh1gRAmhdCs3+S/ze9x8850AefjcdNE6DL
 x3Bg==
X-Gm-Message-State: AOAM530uD3borIOBN1kmBJYb8ICyMh4ewB8H3a9/wCmFKOHeFWyAKVVh
 EZiscEDRlfCC6JyWOGzL72ggebe6yILbyQYcmHxVpQ==
X-Google-Smtp-Source: ABdhPJzuhuLM8NaTwbrzmE6x6jcsmLPFH8/RUzfbUEP9eJiOY/4t0CS0i0UyKt1dqKc2UI61OHmSEt2MLtsUaopZcTs=
X-Received: by 2002:a17:902:7405:: with SMTP id
 g5mr197199pll.325.1597875566488; 
 Wed, 19 Aug 2020 15:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200819194634.68976-1-vitor@massaru.org>
 <CAFd5g45AuxZYY_92rOXwtVjmbaGuts+DV6WpqhHNxWYNotxq+g@mail.gmail.com>
 <CADQ6JjU_ppjnPU6=_eOiwjQe-FKn1Rpf-p+WDEA57rXGF80PEQ@mail.gmail.com>
 <CADQ6JjVx1q+BOnbb-PQ_hYcVmx63bF4zUZSxPkJoOEMNwSyY7w@mail.gmail.com>
In-Reply-To: <CADQ6JjVx1q+BOnbb-PQ_hYcVmx63bF4zUZSxPkJoOEMNwSyY7w@mail.gmail.com>
Date: Wed, 19 Aug 2020 15:19:15 -0700
Message-ID: <CAFd5g47Kurp-cbi7-Xnk6yt5FKWYaNg4dWcMJdYAnjMzmonvJg@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Aug 19, 2020 at 3:01 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> Hi Brendan,
>
> Actually https://patchwork.kernel.org/patch/11724995/
> solves my problem with unsigned int, since I can customize
> the Expected message with this patch.
>
> I think you can ignore this patch :)

Got it. Sounds good :-)

> On Wed, Aug 19, 2020 at 6:37 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
> >
> > On Wed, Aug 19, 2020 at 6:30 PM Brendan Higgins
> > <brendanhiggins@google.com> wrote:
> > >
> > > On Wed, Aug 19, 2020 at 12:46 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
> > > >
> > > > Some tests, such as overflow_kunit(), uses unsigned int,
> > > > But kunit_binary_assert_format() only prints signed int,
> > > > this commit also deals with the unsigned int print.
> >
> > Oops, Thanks!
> > I'll fix it.
> >
> > > >
> > > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > > > ---
> > > >  lib/kunit/assert.c | 15 +++++++++++++--
> > > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/lib/kunit/assert.c b/lib/kunit/assert.c
> > > > index 202f9fdeed0e..3ae90c09986a 100644
> > > > --- a/lib/kunit/assert.c
> > > > +++ b/lib/kunit/assert.c
> > > > @@ -104,12 +104,23 @@ void kunit_binary_assert_format(const struct kunit_assert *assert,
> > > >                                   binary_assert->left_text,
> > > >                                   binary_assert->operation,
> > > >                                   binary_assert->right_text);
> > > > -               string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld\n",
> > > > +
> > > > +               if (binary_assert->left_value - 1 < 0) {
> > > > +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld\n",
> > > > +                                 binary_assert->left_text,
> > > > +                                 binary_assert->left_value);
> > > > +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld",
> > > > +                                 binary_assert->right_text,
> > > > +                                 binary_assert->right_value);
> > > > +               }
> > > > +               else {
> > > > +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %llu\n",
> > > >                                   binary_assert->left_text,
> > > >                                   binary_assert->left_value);
> > > > -               string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld",
> > > > +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %llu",
> > > >                                   binary_assert->right_text,
> > > >                                   binary_assert->right_value);
> > > > +               }
> > >
> > > I agree that you found a bug here; however, I disagree that this is
> > > the correct fix. Given that the value is stored as a long long; isn't
> > > the value always stored as a signed value? So if the value overflows,
> > > won't it still not pass the check you have here?
> > >
> > > >         }
> > > >         kunit_assert_print_msg(assert, stream);
> > > >  }
> > > >
> > > > base-commit: d43c7fb05765152d4d4a39a8ef957c4ea14d8847
> > > > prerequisite-patch-id: bf4b0962b0b955e4e45f5d25fece889562118158
> > > > --
> > > > 2.26.2
> > > >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
