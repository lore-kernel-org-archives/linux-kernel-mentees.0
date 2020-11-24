Return-Path: <SRS0=nBaC=E6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82BCC56201
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 08:02:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3990B206B2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 08:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ZLeC2pXR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3990B206B2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 73BAB8627E;
	Tue, 24 Nov 2020 08:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id INCdHJ+JaV7f; Tue, 24 Nov 2020 08:02:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 051AB8660D;
	Tue, 24 Nov 2020 08:02:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E76EAC0891;
	Tue, 24 Nov 2020 08:02:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0561EC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 08:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F35FB8660D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 08:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZttrqlCjkpk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 08:02:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4188A8627E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 08:02:34 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 92so15466974otd.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 00:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a594DHYDSH28ozJvU6Q2cBNN/U0tDhb9dpOOY+Zf8ek=;
 b=ZLeC2pXRxS7ioJzWcYY9jJ/Np48Q6UGh5Gsvxkyd73LF4tfwf8TLhewXJTemf3Jwxx
 X7jKioju8zjZw6KC2hyAUQh8KdjAn4BYilk4LZ/TOyVQ+LIb/HsCOe7kNkmXNOQO/Uyb
 jyr5vgrWK7sjx0NieksUlsASyKp5d6OXcUEjq6XnPDaVpGoS8nfJdjr4IGJQzY2zI5GP
 z2ItB7Jz1rRzgJpb3exTUoZBnhzLOIGzzVGjfJyrPogi4RD9ZMM16HePxM3y3aKLFRWc
 /mvwIDbPN6GAHDYH+pChgCdXtyxsUGeS1RxxYqjZ6AEiNKpVKwoCrPcQPsFaSR6seUcq
 sJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a594DHYDSH28ozJvU6Q2cBNN/U0tDhb9dpOOY+Zf8ek=;
 b=CUDFNLnlaFwWuS8TOvYdMGvLUUV/f/FiwSlthE+xtceKuA1spUJdyRYJsk+tyISmVI
 outYSGZVxPs0w4RXvyrD2vGlF6XwRFFU+77EkWduSYtUMq3wuJaChse6ER+GvO5Q7C8J
 Euwf/pcQuaKCuM8tiH+ycsV8NczTeipCpJPXRaL9Xx0sAkgrZX2mTzYMANdkf71TXENC
 t4ol7pATj0iQVqYDyH6uefckVzr06Lb+MzaeH2my3v+3e7Iep9EjZGnnPK+9k55QBRzE
 5lRTqzZu2t9Ep2hlCwxECuXO2ynFlaWHD0FVpiYUAPNBUakbqeeSbkO55Qi2pS+9Rj5v
 o15A==
X-Gm-Message-State: AOAM531WyoxCwDkD2olACf/cLHA6bbNOW8T0vzgARxyCub9ngUoI9tHo
 YPX+9Bctl3PQic0IyQDSqFvoB311h5cg87xK0ggUsA==
X-Google-Smtp-Source: ABdhPJyhU4UCNA5E8Kwo//NGX/pFWA9xTcgIEzo/Ro/rMxJ7ogdtEI+hGnzxmYgfdxM9qtIEZmZxaNzNJ3xe/7hYKPw=
X-Received: by 2002:a05:6830:1c76:: with SMTP id
 s22mr2516951otg.233.1606204953329; 
 Tue, 24 Nov 2020 00:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20201116054035.211498-1-98.arpi@gmail.com>
 <CABVgOSkoQahYqMJ3dD1_X2+rF3OgwT658+8HRM2EZ5e0-94jmw@mail.gmail.com>
 <CANpmjNOhb13YthVHmXxMjpD2JZUO4H2Z1KZSKqHeFUv-RbM5+Q@mail.gmail.com>
 <CABVgOSnGnkCnAyAqVoLhMGb6XV_irtYB7pyOTon5Scab8GxKtg@mail.gmail.com>
In-Reply-To: <CABVgOSnGnkCnAyAqVoLhMGb6XV_irtYB7pyOTon5Scab8GxKtg@mail.gmail.com>
Date: Tue, 24 Nov 2020 09:02:21 +0100
Message-ID: <CANpmjNNfNJWJ7avZrRkwvtx2Vv7oR9V8=dmcWW_irotmKWQWGw@mail.gmail.com>
To: David Gow <davidgow@google.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, "Bird, Tim" <Tim.Bird@sony.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v9 1/2] kunit: Support for
	Parameterized Testing
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
From: Marco Elver via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, 24 Nov 2020 at 08:25, David Gow <davidgow@google.com> wrote:
>
> On Mon, Nov 23, 2020 at 9:08 PM Marco Elver <elver@google.com> wrote:
> >
> > On Tue, 17 Nov 2020 at 08:21, David Gow <davidgow@google.com> wrote:
> > > On Mon, Nov 16, 2020 at 1:41 PM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> > > >
> > > > Implementation of support for parameterized testing in KUnit. This
> > > > approach requires the creation of a test case using the
> > > > KUNIT_CASE_PARAM() macro that accepts a generator function as input.
> > > >
> > > > This generator function should return the next parameter given the
> > > > previous parameter in parameterized tests. It also provides a macro to
> > > > generate common-case generators based on arrays. Generators may also
> > > > optionally provide a human-readable description of parameters, which is
> > > > displayed where available.
> > > >
> > > > Note, currently the result of each parameter run is displayed in
> > > > diagnostic lines, and only the overall test case output summarizes
> > > > TAP-compliant success or failure of all parameter runs. In future, when
> > > > supported by kunit-tool, these can be turned into subsubtest outputs.
> > > >
> > > > Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> > > > Co-developed-by: Marco Elver <elver@google.com>
> > > > Signed-off-by: Marco Elver <elver@google.com>
> > > > ---
> > > [Resending this because my email client re-defaulted to HTML! Aarrgh!]
> > >
> > > This looks good to me! I tested it in UML and x86-64 w/ KASAN, and
> > > both worked fine.
> > >
> > > Reviewed-by: David Gow <davidgow@google.com>
> > > Tested-by: David Gow <davidgow@google.com>
> >
> > Thank you!
> >
> > > Thanks for sticking with this!
> >
> > Will these patches be landing in 5.11 or 5.12?
> >
>
> I can't think of any reason not to have these in 5.11. We haven't
> started staging things in the kselftest/kunit branch for 5.11 yet,
> though.
>
> Patch 2 will probably need to be acked by Ted for ext4 first.

Patch 2 had already had 1 Reviewed-by on v3 that got lost. The core
bits of that test haven't changed since then, but I can't tell if it
needs a re-review.

https://lkml.kernel.org/r/CAAXuY3o9Xe-atK0Mja6qXLncUhmmVf4pR7hsANsqaoUX71RXVg@mail.gmail.com

Thanks,
-- Marco

> Brendan, Shuah: can you make sure this doesn't get lost in patchwork?
>
> Cheers,
> -- David
>
> > > -- David
> >
> > Thanks,
> > -- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
