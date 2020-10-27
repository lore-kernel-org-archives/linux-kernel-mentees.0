Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA20C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 07:45:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DA5E2224E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 07:45:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="jNrM7jvf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DA5E2224E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35608870D4;
	Tue, 27 Oct 2020 07:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zr9rh7ihHkxd; Tue, 27 Oct 2020 07:45:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C0CB187027;
	Tue, 27 Oct 2020 07:45:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3683C0859;
	Tue, 27 Oct 2020 07:45:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E112CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 07:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AFE80203CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 07:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luR0BPa-9HJW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 07:45:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 0F8772014A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 07:45:04 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id y186so384689oia.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 00:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WG1A3q+GZxxNqqxlUx799dEM+Gf5oi4Zi/UVtCCwffw=;
 b=jNrM7jvfPRxxd07tIAC6hcoCPl0lPXyXIhfjz3M82wA8u8RqW35dST2XvWdw+soPGr
 XzhPLgJWuBGMSpqEth9gV6D190uUIPFCKyRBrO95tjHaBREJkc7B90qblOCdXzm/rGSl
 0qS1Eh4lcQKZsukeAv/AuvW/pAvKTNqD2EnBX2Ns8aL2E3v3/LO+LjboR6rVq9eUDPkh
 oYXT1CkZ+nNEPfo2p2cjjrnErgnEJX8SJoEB9J50UhtdY9X0r0StwRpKXYee1CL4VeQM
 4ZTuIXk+hOkzE1vbAkVzIyroYLG/Ht0m2Qv0zuxt/7UCAMKb6T7GrFjWIJK/fp7MShdG
 8d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WG1A3q+GZxxNqqxlUx799dEM+Gf5oi4Zi/UVtCCwffw=;
 b=ABJC1KipFiL/dYz/RBGLFraeK9l8o2g+rofzM+xtkZKfyFpgJHbwhxycHsQJkLEwTv
 IG/+Qb8zeFHawq3SKk+n1MbBn03hBDUOgI8yaPoYR6cue2E74HLDZe3hYJ7Rw8JrZxzw
 +HDnAMgkF+qkRqG1LLwpQqRXNr+y74C11lgLlyVLHGbi3K96qT5kPNQ1rAvT5z/WmJm0
 ELwgVsCSovYSVfCH6oMGl03m6VgRuIBkptkKyFemmiXvBLq93LfWrWKN5l7xKRSEjRQg
 hGgkOwsSzfuNPQOarPZtyqRq/Hc5EGZ1HMO86uuBY8YZ6wypJmV0UfqEbRioFwUEn8PV
 m6Jw==
X-Gm-Message-State: AOAM530cchfX8Kq3C80H2yw1gZivZDEtRbdc86usVYDIYshKts076DiX
 gqRkAZ3kxY07LeuyVzvpxeVhfRE8mvLKV+9S6/g5mw==
X-Google-Smtp-Source: ABdhPJzmEtc+5WEGyyYhU9RhAV79MqBOU0WEbvVHxMvW1J6n/n8BZyHqIE34BFg6sXrAc9mXMK78SOghyJxcS/d6XZE=
X-Received: by 2002:a54:4812:: with SMTP id j18mr609276oij.70.1603784703052;
 Tue, 27 Oct 2020 00:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201026183523.82749-1-98.arpi@gmail.com>
 <CANpmjNNQtGC_jDp8TSHRHOMXi7aTQgwjtUiCWE+YqBgq-G2z5Q@mail.gmail.com>
 <f25c881d-03f9-e246-d8d4-e985d9662d04@gmail.com>
In-Reply-To: <f25c881d-03f9-e246-d8d4-e985d9662d04@gmail.com>
Date: Tue, 27 Oct 2020 08:44:51 +0100
Message-ID: <CANpmjNMVjuNOh-P6dENhyk_+=AHqkZYugQ3KQS9T3qXTrUSXGA@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3 1/2] kunit: Support for
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

On Tue, 27 Oct 2020 at 06:14, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
[...]
> >> diff --git a/include/kunit/test.h b/include/kunit/test.h
> >> index a423fffefea0..16bf9f334e2c 100644
> >> --- a/include/kunit/test.h
> >> +++ b/include/kunit/test.h
> >> @@ -142,6 +142,12 @@ struct kunit_case {
> >>         void (*run_case)(struct kunit *test);
> >>         const char *name;
> >>
> >> +       /*
> >> +        * Pointer to test parameter generator function.
> >> +        * Used only for parameterized tests.
> >
> > What I meant was to give a description of the protocol, so that if
> > somebody wanted, they could (without reading the implementation)
> > implement their own custom generator without the helper macro.
> >
> > E.g. something like: "The generator function is used to lazily
> > generate a series of arbitrarily typed values that fit into a void*.
> > The argument @prev is the previously returned value, which should be
> > used to derive the next value; @prev is set to NULL on the initial
> > generator call. When no more values are available, the generator must
> > return NULL."
> >
>
> Oh okay. I am not sure if this is the best place to add documentation for this.

I think it doesn't hurt to add, but have a look at the comment above
this struct, which is already a kernel-doc comment. It probably makes
sense to move the comment there to describe the new variable.

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
