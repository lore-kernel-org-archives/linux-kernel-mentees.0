Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9557EC63777
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 22:29:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF8822073C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 22:29:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="k/30DKax"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF8822073C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C1A4987351;
	Mon, 30 Nov 2020 22:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKS9iOThdCX7; Mon, 30 Nov 2020 22:29:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 46B808733B;
	Mon, 30 Nov 2020 22:29:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4282CC163C;
	Mon, 30 Nov 2020 22:29:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F463C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 22:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5825427366
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 22:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mtctNyKN9V-C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 22:29:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by silver.osuosl.org (Postfix) with ESMTPS id B9A60272F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 22:29:14 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id o25so16022058oie.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 14:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5BCfceYCUFklibw9iNkTt59HaVog15eTd5t3bjImEAQ=;
 b=k/30DKaxucqttsaNv21BmbQpUbdkRX7IMney19Y1tduMHegrd/CAjDqpTb9VTFLiSc
 JqiSt1G74qTGBZcEKSlxJ3gJK12B3E3iHH2TkQ386cz2gWsDVBigYwZFoef+nSblQlY7
 vIjHZZOj2b+qYVwg/ALqtsiYPXxaMndHgWKkyqKNkkUHOY8rTSZnXReUBjG0DsTxevL5
 GAx6LHBjgvSZcDtU9E+J/BDB76C5mmp4rEuUJfLwxLF0W9SH4BjGOb/2GUKNsqowvZfX
 9qfR75HzCN2naDEWguSo9CMRLL1bN2myTp7V7364O6gnZ9SkzLRpu782zs587e5todSD
 IosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5BCfceYCUFklibw9iNkTt59HaVog15eTd5t3bjImEAQ=;
 b=cLwYhRn0H5SM5+JZXi1Ydo4vRShTKRqXzA0oy38wcf0bfpOh4XZPhaa3fyKUE4fe06
 BB/oNnPVXwPIEiTgZA/qVPTaMBIiAkTut9GF3dBHslmp2G5sgCLberVXT0PTWRrBiCee
 ct4s3GaVhvCNk5eTnTclPS+1qEQ5nAOS7fRiw3sfjaYu53uadtXJKKHQyqZU+CKK+yzE
 ZqasSLjNvKwUjfxLMP+T0SSPi5MefNp55/4OtLPZmynLaodIRb6iAfMijJ4BNvz7kjnz
 7BCWPprIsCX4XaxPeb6bIBkG8Z7H0EHp5ztiB7MO9oClFAxki3uCUByhMLDg9E91oEyU
 29qg==
X-Gm-Message-State: AOAM533fDHmM4cYW0aJqC/lzm7Sq5pfN80sEzBZ4HydoJ0OODPaxigYb
 j6Tyv8Dh2FTcChbtBER4RrE84VVH4YrJ+CbZWNMhWRdUseE=
X-Google-Smtp-Source: ABdhPJymnzMjQYaV36tfcsaWeQNndkZiyZt8GSPuPs9LDVcg2/Mtb4fw9vRNDoGfuR+OgWdHmwqJAxuCgSpXcv55qPY=
X-Received: by 2002:a17:90b:3658:: with SMTP id
 nh24mr1090414pjb.80.1606774953049; 
 Mon, 30 Nov 2020 14:22:33 -0800 (PST)
MIME-Version: 1.0
References: <20201116054035.211498-1-98.arpi@gmail.com>
 <CABVgOSkoQahYqMJ3dD1_X2+rF3OgwT658+8HRM2EZ5e0-94jmw@mail.gmail.com>
 <CANpmjNOhb13YthVHmXxMjpD2JZUO4H2Z1KZSKqHeFUv-RbM5+Q@mail.gmail.com>
 <CABVgOSnGnkCnAyAqVoLhMGb6XV_irtYB7pyOTon5Scab8GxKtg@mail.gmail.com>
In-Reply-To: <CABVgOSnGnkCnAyAqVoLhMGb6XV_irtYB7pyOTon5Scab8GxKtg@mail.gmail.com>
Date: Mon, 30 Nov 2020 14:22:22 -0800
Message-ID: <CAFd5g4768o7UtOmM3X0X5upD0uF3j-=g3txi0_Ue3z8oM_Ghow@mail.gmail.com>
To: David Gow <davidgow@google.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, Marco Elver <elver@google.com>,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, "Bird,
 Tim" <Tim.Bird@sony.com>,
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Nov 23, 2020 at 11:25 PM David Gow <davidgow@google.com> wrote:
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
>
> Brendan, Shuah: can you make sure this doesn't get lost in patchwork?

Looks good to me. I would definitely like to pick this up. But yeah,
in order to pick up 2/2 we will need an ack from either Ted or Iurii.

Ted seems to be busy right now, so I think I will just ask Shuah to go
ahead and pick this patch up by itself and we or Ted can pick up patch
2/2 later.

Cheers
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
