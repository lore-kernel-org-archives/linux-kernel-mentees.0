Return-Path: <SRS0=sW3u=BQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8669FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Aug 2020 11:11:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AA3B22D00
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Aug 2020 11:11:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiWGQvg9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AA3B22D00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3152A88270;
	Thu,  6 Aug 2020 09:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBIq1JROs+n7; Thu,  6 Aug 2020 09:53:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B2F4088267;
	Thu,  6 Aug 2020 09:53:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93879C0050;
	Thu,  6 Aug 2020 09:53:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EAA3C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 09:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 54B0C8888A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 09:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x+UHOttaZhx7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 09:53:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CD63D8887E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Aug 2020 09:53:13 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id ep8so6208108pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Aug 2020 02:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SXSnxxCYD2md6x19BIcV4dv3O6O3P24XFKvfPThGQJo=;
 b=XiWGQvg9Bit4nzKJF4qTwKdmAD1Q2E8m0XLXObi9vRO8M1t4VdTiK64oHbv/HyOTvg
 Iph0ndBegJGa710ZTHuhZ+ZoFOjKdukKozcCicBgLXX3y6uliKL/WS9BOsbd6KMTNBYV
 +nEGz4/MJztzxsjdU/7KBRNvEeW9+FJvkqwX5EIGlY58knyzPMbs/i/pkxxlRStNhW01
 u7mJDA/obpT1Enlojzjpv/fmkrEJ9Ni+5i1QasAQ8DjJ7xYVjUF1+dZQi3PfCMhkOGLq
 y6MLVqLBGMJKSb8/DYc6unpKl++YUtTzIvAXUpCK53ktVcgNw5a/VRRZUvPZh4Xo/Qsh
 vKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SXSnxxCYD2md6x19BIcV4dv3O6O3P24XFKvfPThGQJo=;
 b=FK5EX0dLNi7NSuZcaQJAu6u2yq3GEsudDegjkS5TthPoqRq/jddn9TKdqeOenOMuoA
 uvyxB7YG+jsZ2bAo2cJJyH+o+eEUL8Z3awmkqF3cNjfQxqHH9xn/OkOkvPLhrpshElpL
 86VNzbEW5MqMEQ9jy5EnvKesBNr19CyJdWJMR/erMQ4qyv7KunldoNqdWIxanPXVqa8S
 PugLRJ0v8xlckA6eXr4OMWdTslDo9VdMqcNWxq/AwO03vb3Uoy7kAoQhHntJ7zehmtDS
 J2fQ7feOc7zb3lrMjyekn73/x5kCpZ2PJkEAyvQ7/O/3EQ5KZyXbAIOH0mGG8dbuR/OQ
 wXag==
X-Gm-Message-State: AOAM532DpjoOo2RprOyrLHEkuLk4o8vdPSL9dGFdGQzGtIrdl6W/ms1S
 e2bfE9Bc/8CiOctZiIqnJ2nWqgEeOpzVBVIH1DQ=
X-Google-Smtp-Source: ABdhPJzZw1D9NdNDiy6amHPeR9pus0fXPnyBQGsA7oVjd8LW6an5Aly4sIaPIHNzyMhPT2bcLdXfSKW/9XHV18gYBRo=
X-Received: by 2002:a17:90a:fa06:: with SMTP id
 cm6mr7815995pjb.129.1596707593391; 
 Thu, 06 Aug 2020 02:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200806094440.14962-1-98.arpi@gmail.com>
In-Reply-To: <20200806094440.14962-1-98.arpi@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 6 Aug 2020 12:52:57 +0300
Message-ID: <CAHp75Vdpyr=LiOsjgoJ1YscrvFwivtfg58dePtF9aQDYp6V9-A@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: Convert test_hexdump.c to
	KUnit
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

On Thu, Aug 6, 2020 at 12:48 PM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> Converts test lib/test_hexdump.c to KUnit.
> More information about KUnit can be found at
> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
> KUnit provides a common framework for unit tests in the kernel.

> -config TEST_HEXDUMP
> -       tristate "Test functions located in the hexdump module at runtime"

We have a nice collection of tests starting with TEST_ in the
configuration, now it's gone.
I'm strongly against this change.
Code itself okay, but without addressing above - NAK.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
