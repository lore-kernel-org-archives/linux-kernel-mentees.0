Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8583C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 22:01:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80A782078D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 22:01:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="x7F+24zu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80A782078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2DCF3226CA;
	Wed, 19 Aug 2020 22:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aU20zRKqLhIy; Wed, 19 Aug 2020 22:01:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9F82C226CF;
	Wed, 19 Aug 2020 22:01:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B6C9C0889;
	Wed, 19 Aug 2020 22:01:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53BF4C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 22:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 49287881C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 22:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGuSPda7GQZa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 22:01:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8BA3B88072
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 22:01:04 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id g3so36567ybc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 15:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zxWg5ULSKL9S4BttK+iZ+9EMWLe/O2QTXo5l/Uqxehk=;
 b=x7F+24zu38tBbxtOe/jdUbHhp9TEGmI/7aREqPGIoV4oOfy6kmqOlnU49TCNpu2Fx4
 DeVfhLmhy6eAAeAPNJH6nQtEo0KsIahLC4b+07g2GTK7nQ7z3+yJxtcSTr8Ap0JceiIB
 E2i1DEd9orfQKhCsv5NGFweNhdns/c+tL6myj1E6HduF0yHiAM3bzsNMEmu8ros5/RBl
 2ZbpZeEc7nr2dfWOhYytsnrD8BKchKQuOr6ed2AEq3fDQ3AuifK2zS23NE6heJyBr2S2
 BIWrnNbFy1gjSmfw2D5A974kHVuzaim/SIuDuFHaysacffNAmX4KuA6YlVe0QGTzMQ6E
 o1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zxWg5ULSKL9S4BttK+iZ+9EMWLe/O2QTXo5l/Uqxehk=;
 b=nBvYj9iCYffwTimYynAWarG+4Zav8RCHd+cs1ko67/nfiXmavw+GJY2Gr+5I2LDXB8
 5lWuSeSo0zCFZz2HGthGUjdwMlwd7D6CPa+1aPjFDhC7BZ6EL6mYIHG0JufHFsZGn4Q/
 LAr9DmHYCDb965FWudJJR7aPWswmknBiHCu+XPs1DRkdVi6noyBudDnI1Y6eUPxTwYGG
 D1EKd7thOk77OVO6lekXX3D7Ztli1BJwZAWusbZswMrntAak3NHlDGaDivPh1yvw3SMi
 MQ/YbjjmF0nngx2335MsVTzOI98nz1OwXBwRHFLg1QnpGnCvJxk1I4MtOc3QAY50CaD2
 n5qw==
X-Gm-Message-State: AOAM533t2Zbb1Di4dc4JIl89+EdVeSKa1pIiXDUOD2vWvTYgv1kDA02D
 SmptfahvIZH/ot7W0zKhf7g1kx9HG6SQhLmnsW3i2a7FUrdqaEuGvys=
X-Google-Smtp-Source: ABdhPJzSDcxR/TlY7YF5knK+Fb6IYeSa6yn2DQN/6UBNBmMvGRAXVv5KtpYSdaBwLsbHXemgymi3EmTb5TK1JeUq2mA=
X-Received: by 2002:a5b:a87:: with SMTP id h7mr622296ybq.333.1597874462852;
 Wed, 19 Aug 2020 15:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200819194634.68976-1-vitor@massaru.org>
 <CAFd5g45AuxZYY_92rOXwtVjmbaGuts+DV6WpqhHNxWYNotxq+g@mail.gmail.com>
 <CADQ6JjU_ppjnPU6=_eOiwjQe-FKn1Rpf-p+WDEA57rXGF80PEQ@mail.gmail.com>
In-Reply-To: <CADQ6JjU_ppjnPU6=_eOiwjQe-FKn1Rpf-p+WDEA57rXGF80PEQ@mail.gmail.com>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Wed, 19 Aug 2020 19:00:26 -0300
Message-ID: <CADQ6JjVx1q+BOnbb-PQ_hYcVmx63bF4zUZSxPkJoOEMNwSyY7w@mail.gmail.com>
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

Hi Brendan,

Actually https://patchwork.kernel.org/patch/11724995/
solves my problem with unsigned int, since I can customize
the Expected message with this patch.

I think you can ignore this patch :)





On Wed, Aug 19, 2020 at 6:37 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> On Wed, Aug 19, 2020 at 6:30 PM Brendan Higgins
> <brendanhiggins@google.com> wrote:
> >
> > On Wed, Aug 19, 2020 at 12:46 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
> > >
> > > Some tests, such as overflow_kunit(), uses unsigned int,
> > > But kunit_binary_assert_format() only prints signed int,
> > > this commit also deals with the unsigned int print.
>
> Oops, Thanks!
> I'll fix it.
>
> > >
> > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > > ---
> > >  lib/kunit/assert.c | 15 +++++++++++++--
> > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/lib/kunit/assert.c b/lib/kunit/assert.c
> > > index 202f9fdeed0e..3ae90c09986a 100644
> > > --- a/lib/kunit/assert.c
> > > +++ b/lib/kunit/assert.c
> > > @@ -104,12 +104,23 @@ void kunit_binary_assert_format(const struct kunit_assert *assert,
> > >                                   binary_assert->left_text,
> > >                                   binary_assert->operation,
> > >                                   binary_assert->right_text);
> > > -               string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld\n",
> > > +
> > > +               if (binary_assert->left_value - 1 < 0) {
> > > +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld\n",
> > > +                                 binary_assert->left_text,
> > > +                                 binary_assert->left_value);
> > > +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld",
> > > +                                 binary_assert->right_text,
> > > +                                 binary_assert->right_value);
> > > +               }
> > > +               else {
> > > +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %llu\n",
> > >                                   binary_assert->left_text,
> > >                                   binary_assert->left_value);
> > > -               string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld",
> > > +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %llu",
> > >                                   binary_assert->right_text,
> > >                                   binary_assert->right_value);
> > > +               }
> >
> > I agree that you found a bug here; however, I disagree that this is
> > the correct fix. Given that the value is stored as a long long; isn't
> > the value always stored as a signed value? So if the value overflows,
> > won't it still not pass the check you have here?
> >
> > >         }
> > >         kunit_assert_print_msg(assert, stream);
> > >  }
> > >
> > > base-commit: d43c7fb05765152d4d4a39a8ef957c4ea14d8847
> > > prerequisite-patch-id: bf4b0962b0b955e4e45f5d25fece889562118158
> > > --
> > > 2.26.2
> > >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
