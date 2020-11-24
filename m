Return-Path: <SRS0=nBaC=E6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7811FC63777
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 07:25:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B895220679
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 07:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="TI1qEy3T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B895220679
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 30CB98634E;
	Tue, 24 Nov 2020 07:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2bFXlT3IfZo; Tue, 24 Nov 2020 07:25:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B1079861A0;
	Tue, 24 Nov 2020 07:25:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91A8DC0891;
	Tue, 24 Nov 2020 07:25:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43107C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 07:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 306338716A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 07:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diIbkMIytaSw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 07:25:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 209FA87165
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 07:25:45 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id z1so2504943ljn.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 23:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7wcsVmiRBzdbzaU1jn2/D4v2W6wjtxUE3QJby9ONMo=;
 b=TI1qEy3TmyLIzdKNdJQqeiqUMl+2ELnq3995chqivPaCfj/AzhaKQ+2bIqEmn9sxy8
 z0YAtzsPF5XTcrRhQA+dIpONHcVgDybgufVR0123dzPsZB0K5a8zKSbMjCp3dBAMVdz8
 qIBxDVo6WQz/LlL+YPoMbaWnug+TJfBTk0es6P72sznSVQnOIILfWRNOU99HrCWhuBgR
 602f2fTKn4Cse62ikNeOCdK8TvLEWJh9EBmw3xh5GloadBKmmCpn5hR4SuBxjCfDbi8E
 q95ub1mUdRvnIs+qIg1wEkdX699lQEAyFKH67Gvm33GRj6e0tZcAjzmE+RrgTTaxgMpP
 pogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7wcsVmiRBzdbzaU1jn2/D4v2W6wjtxUE3QJby9ONMo=;
 b=jCBe6MuEo8U3w8tqMxl/n7YvVsSf1PTBRgnjNQT8/ZUWhaTVkHVeCPfLvv2woxQukQ
 neDbpO7WDmaAxHcNpRyjZP8bj86E0NRekmjZf+FlycOjQwMcTScNwNegkXownEB0NtLd
 FWCg9+AOXb8mXbxSII1dTiXYPY80YClt/jGxqy41eMWauSj6vE2lsGYrsY8KbpzMIS3r
 ehVUqtfVU+ZPihMqorcBvSmvK3MSqxzTEqpLU/L9XldjjGKHz7qTjmAUNPeW/0+yjrYo
 lYLgU+UwfH+l+lKx1iMV3WzEnAo6ZRw9L4JU1BhL02xTuqNcflG9HMevd0/1tQOygZ1n
 Myag==
X-Gm-Message-State: AOAM531hwzg9LYOE0iJC4GPDjDr6YoNdRvs+n+mvwQFaWPWvtf86NQyP
 flLojgZD5dOIxQ9LNzs2zDKCL+meE7ScFfUWOM+thA==
X-Google-Smtp-Source: ABdhPJyUBQdiFImnRxdqaR3qJ7rkDjgJVrH1lMWvXVptsR0064IC5JnBZyuU/OCbvVnd19TaTo3BuNVsIX88yf/i3EA=
X-Received: by 2002:a2e:b54b:: with SMTP id a11mr1355573ljn.40.1606202742772; 
 Mon, 23 Nov 2020 23:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20201116054035.211498-1-98.arpi@gmail.com>
 <CABVgOSkoQahYqMJ3dD1_X2+rF3OgwT658+8HRM2EZ5e0-94jmw@mail.gmail.com>
 <CANpmjNOhb13YthVHmXxMjpD2JZUO4H2Z1KZSKqHeFUv-RbM5+Q@mail.gmail.com>
In-Reply-To: <CANpmjNOhb13YthVHmXxMjpD2JZUO4H2Z1KZSKqHeFUv-RbM5+Q@mail.gmail.com>
Date: Tue, 24 Nov 2020 15:25:30 +0800
Message-ID: <CABVgOSnGnkCnAyAqVoLhMGb6XV_irtYB7pyOTon5Scab8GxKtg@mail.gmail.com>
To: Marco Elver <elver@google.com>, Brendan Higgins <brendanhiggins@google.com>,
 "Theodore Ts'o" <tytso@mit.edu>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-ext4@vger.kernel.org, "Bird,
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
From: David Gow via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: David Gow <davidgow@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Nov 23, 2020 at 9:08 PM Marco Elver <elver@google.com> wrote:
>
> On Tue, 17 Nov 2020 at 08:21, David Gow <davidgow@google.com> wrote:
> > On Mon, Nov 16, 2020 at 1:41 PM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> > >
> > > Implementation of support for parameterized testing in KUnit. This
> > > approach requires the creation of a test case using the
> > > KUNIT_CASE_PARAM() macro that accepts a generator function as input.
> > >
> > > This generator function should return the next parameter given the
> > > previous parameter in parameterized tests. It also provides a macro to
> > > generate common-case generators based on arrays. Generators may also
> > > optionally provide a human-readable description of parameters, which is
> > > displayed where available.
> > >
> > > Note, currently the result of each parameter run is displayed in
> > > diagnostic lines, and only the overall test case output summarizes
> > > TAP-compliant success or failure of all parameter runs. In future, when
> > > supported by kunit-tool, these can be turned into subsubtest outputs.
> > >
> > > Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> > > Co-developed-by: Marco Elver <elver@google.com>
> > > Signed-off-by: Marco Elver <elver@google.com>
> > > ---
> > [Resending this because my email client re-defaulted to HTML! Aarrgh!]
> >
> > This looks good to me! I tested it in UML and x86-64 w/ KASAN, and
> > both worked fine.
> >
> > Reviewed-by: David Gow <davidgow@google.com>
> > Tested-by: David Gow <davidgow@google.com>
>
> Thank you!
>
> > Thanks for sticking with this!
>
> Will these patches be landing in 5.11 or 5.12?
>

I can't think of any reason not to have these in 5.11. We haven't
started staging things in the kselftest/kunit branch for 5.11 yet,
though.

Patch 2 will probably need to be acked by Ted for ext4 first.

Brendan, Shuah: can you make sure this doesn't get lost in patchwork?

Cheers,
-- David

> > -- David
>
> Thanks,
> -- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
