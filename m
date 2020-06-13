Return-Path: <SRS0=EDdC=72=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DA8C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 Jun 2020 06:57:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7EA52071A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 Jun 2020 06:57:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="TtPuXKAe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7EA52071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7AA6787A09;
	Sat, 13 Jun 2020 06:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LzKbNgcMBsKr; Sat, 13 Jun 2020 06:57:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79E89876F1;
	Sat, 13 Jun 2020 06:57:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58A97C0881;
	Sat, 13 Jun 2020 06:57:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A1BCC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Jun 2020 06:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 18C1F895E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Jun 2020 06:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rs1XcP0b+2dR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Jun 2020 06:56:57 +0000 (UTC)
X-Greylist: delayed 00:05:26 by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EC1BC8947C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Jun 2020 06:56:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b82so1279324wmb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 23:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OFFZRUuwZyciolFutHUZy+k3hDO5IWFL+Mp7cEZTf1o=;
 b=TtPuXKAeBC4b7WRt8j5QlCvQ7mq3sQssnKqhuC8v1kjpfVTco+fsFkYswB9EdOATuX
 CAQ5eTEC7dTFj4dGzRkx4QX92FcQ0ZmMwQ220MlEnm5nXRwUf+c81iouibty9uX7iwSb
 AbCQ2Helzyo7TWlXliHGkSoX7ihF28qag1IFHomseE8hakNgDCZ9J5UC7O/UDdbN7WoL
 F/iLQGDVivhvyJx1U2pC9TkEvQbdby8dDNiuw6jiuPX7eaoDMfVR2PAE6hkkaVOBHVT9
 2NlNf2m5ByPos85L+6pKsBDYOdx/6fo+sDHHeeq5V9EGuw1pwoWtLAdt13n1wTRsWccC
 Fnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OFFZRUuwZyciolFutHUZy+k3hDO5IWFL+Mp7cEZTf1o=;
 b=ntaj0TspR3O74geh68Xb6jIS8zKbFmcoSLdn3hDEcoZnEbEmHKdeN/T3iME1YBFUPA
 C67+2u8IaTWSKHr4MfrDr8nZ7vwfI/mQVIHio3dd92ssolR4OCQ2aKA8OoX8jaudg7T9
 fuSlZeX0buV5mSvl++8KGlGmKOCOKNqlR1lqB+VYQv/FKcnns3/yhVXh9z19KraQ+k0s
 1Yu7V7wET7OI79Te+pPWyvsAmNFghTmSWv+BaOlk17rWccqJ0ARcudvwmyt/AKWajik9
 i9KS1SMg3hKGjvUyNOjQlDn7TOio5VmdGbTyWF0HGSbFKZWh9kOJdjfBksIk1o6vLe/8
 K48A==
X-Gm-Message-State: AOAM531qV7mPBabolfxTVdehd/YGO9/ByJzdn1pqpbnG4xmMj0rLaB9N
 0ELjlhDiv49lVxj01w75K9DcoICNs6AabhUVxwNuKA==
X-Google-Smtp-Source: ABdhPJyXtTYSMyQ6wXdEQDy9VIp/SQ0LjE3BFblFW22MQ9kE0ZSsESdPTCKrAA1RGJrKDw9Ctu3dijpN+V/HBa0mMrE=
X-Received: by 2002:a1c:a444:: with SMTP id n65mr2429963wme.99.1592031415287; 
 Fri, 12 Jun 2020 23:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200611215501.213058-1-vitor@massaru.org>
In-Reply-To: <20200611215501.213058-1-vitor@massaru.org>
Date: Sat, 13 Jun 2020 14:56:43 +0800
Message-ID: <CABVgOSkMv22GDGin8GCqq4Vd=Bff7-VzEycmzKhUeKj9tErD7Q@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: Kees Cook <keescook@chromium.org>, linux@rasmusvillemoes.dk,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: kunit_test_overflow: add
 KUnit test of check_*_overflow functions
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

On Fri, Jun 12, 2020 at 5:55 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> This adds the convertion of the runtime tests of check_*_overflow fuctions,
> from `lib/test_overflow.c`to KUnit tests.

Nit: couple of minor typos here: convertion -> conversion, and
functions -> functions

> The log similar to the one seen in dmesg running test_overflow can be
> seen in `test.log`.
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>

I've tested that this builds and runs on my system, and it all seems
to be working fine!

Tested-by: David Gow <davidgow@google.com>

> ---
>  lib/Kconfig.debug         |  17 ++
>  lib/Makefile              |   1 +
>  lib/kunit_overflow_test.c | 590 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 608 insertions(+)
>  create mode 100644 lib/kunit_overflow_test.c

Echoing what Brendan and Kees mentioned, it'd be nicer to have this
replace the existing test, both because there's no need for redundant
tests (one will get out-of-date), and so that we can have a nice diff
showing the changes made as part of the conversion.

Cheers,
-- David
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
