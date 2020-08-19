Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457DDC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:14:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03896207DE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:14:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="KJecqVZ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03896207DE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8BDE022658;
	Wed, 19 Aug 2020 21:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CcNmrrxsz+8T; Wed, 19 Aug 2020 21:14:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 58C72221DC;
	Wed, 19 Aug 2020 21:14:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26CB0C0889;
	Wed, 19 Aug 2020 21:14:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE69DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A3B988815F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCBiLGLx2msH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:14:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E10758815E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:14:53 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y6so17460plt.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 14:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+umGhDcbGIZE1xFjxqU0bxabGlCttQLBQ+Y53ytOqC0=;
 b=KJecqVZ9hLXEAzJJNx3+s6VztJjf7IdAGVe1xvxkaR3MIOOrRYV+x5q4PkAmG97E47
 c9AfgbCo5kEgRCZ8hdbUxNjLSW4rUHKYJHgBYeI3No9tx1HVqRlWqvIUn26TUA+AX14V
 oI6hp4R03d/+IOM+djlJ6fbgWl+wRl5B/Ynr1CRdTtUZSJ7mP1IA3WAWXKZbcoVTHxky
 HJaON41XS9BzhwFiIwRDESb3MP5Zr4dLmn8S7gctlrq5qeF7GH/LTAl44vjXwKCSwhDZ
 tdBh+2voGT5VV/9cixVn2JjqYAj65P2LXuMvq6ETnzRPAreAd+K1RuNRDQZm6Ax6r9/r
 2LUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+umGhDcbGIZE1xFjxqU0bxabGlCttQLBQ+Y53ytOqC0=;
 b=sEqYgyU6Q4PRnlgOx/Q/7pvoQu2qzWk+w2NUKHH/XjF2x5UM8D6Zcor6lRbtmFZSAh
 RinRVrCYJbwaoWn10hCi+xbQuhbonycag0wxuTScJTU4iK86Y/xxHwKwa5Jm/jR9ia8L
 ImXNfyB0KUDT1UtWBNI5t1e4Sl/hvYqrgQ7ySGHGUCOeMc53aCNa8/577cwzFluMWSUf
 a0iU3sz8MQTGsYw+MPs0/HGc6VdJPT3qVO1PjmR/CImrFipOlrUk19r/zyu63Ov0KFuD
 t3ktqQo71Zx7PvU9VKTpYbXkA7gHBV4R9H537YbUvxB47+NflNx0JjilR5hMJaQAKRrG
 ve2w==
X-Gm-Message-State: AOAM531hGJ0518CpuxfgR5lJ/7nWe5tosnCSCK7+Mbut/bC6UslOryV+
 3LIoBj18nTJIvsZwQuwhKoudxtRYDdgNoXMS7fkFBA==
X-Google-Smtp-Source: ABdhPJxD98fjtFT8GxHwT05Ahp/1ulXZG6efUm0uXvNqB6cqEVXrUsqo9M64hDCvdg13zcl6KOod3fU3jP+YqsQ4JBs=
X-Received: by 2002:a17:90a:4603:: with SMTP id
 w3mr1306384pjg.20.1597871693322; 
 Wed, 19 Aug 2020 14:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200729192357.477350-1-vitor@massaru.org>
In-Reply-To: <20200729192357.477350-1-vitor@massaru.org>
Date: Wed, 19 Aug 2020 14:14:42 -0700
Message-ID: <CAFd5g45rRMDD8=wQOzh+cGHEM4WJ=4vSu44W+4yPCFNFM2SB9A@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: mhocko@suse.com, Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 elfring@users.sourceforge.net, Paul Gortmaker <paul.gortmaker@windriver.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Andrew Morton <akpm@linux-foundation.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: kunit: add list_sort test
	conversion to KUnit
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

On Wed, Jul 29, 2020 at 12:24 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> This adds the conversion of the runtime tests of test_list_sort,
> from `lib/test_list_sort.c` to KUnit tests.
>
> Please apply this commit first (linux-kselftest/kunit-fixes):
> 3f37d14b8a3152441f36b6bc74000996679f0998 kunit: kunit_config: Fix parsing of CONFIG options with space
>
> Code Style Documentation: [0]
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> Link: [0] https://lore.kernel.org/linux-kselftest/20200620054944.167330-1-davidgow@google.com/T/#u

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

It would still be good to get some of the original authors/reviewers
to review this.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
