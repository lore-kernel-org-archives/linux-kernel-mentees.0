Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4E0C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 05:43:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAB40206CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 05:43:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Igmi6UxL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAB40206CA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7A3EA87637;
	Sat, 10 Oct 2020 05:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fLKC6fzkED3; Sat, 10 Oct 2020 05:43:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E60EA87734;
	Sat, 10 Oct 2020 05:43:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA91DC016F;
	Sat, 10 Oct 2020 05:43:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EE11C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 05:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1136787619
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 05:43:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrZB1+-miGSq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 05:43:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ED65A87601
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 05:43:38 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id p11so5529560pld.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 09 Oct 2020 22:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kFwAQEfRAq8FtPUZLvTkvSzxZYBk8EF9wpuaJH7X7GY=;
 b=Igmi6UxLzccnc2TE+34dHjbp7LfrvPqUECDYUDNjjBAoj8bFcnZ3pUuS4pD13CdsnD
 JTufCaRuZFI8EFfJd0gdMJpn9Ymuq8gsJ4kXo/OjGkmniazSyqGkzY/shaG/K6cCv3+V
 /8k3/Y/OYtNOGCnAvebc9+0xVEXF+Cx9VXwm6LrtTxmPD068srK1ZYPmeT53A/+g5zyw
 q5YUatkkQx02jtC1/dVLADaxbFPPpgVNk2HnFKYkk/x1lwooJUsK84UOeU5l2DMYsS2N
 eXZMnpTWTG3t5oF8FcwupyOdGPoaRDLhOQq7RjubF48NNKCi4OTSZOhTqkONO1++xdLW
 IYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kFwAQEfRAq8FtPUZLvTkvSzxZYBk8EF9wpuaJH7X7GY=;
 b=JQCP77z1CWwgCpsHXeM29ilxNP7uo9YesU2t1MFMXJ0vVrJxZOFbgeOvRQ/keTQ5m9
 gOTws6FAt5hcNvliDXQmwrw95x2Gsy2hcQB8RYHNv0tzTjhLzquzhAlCbxGJL9wlqAI6
 qVR7vPdLjQtwVTn/mwmO8iIwcvayKNnF05C0vVcxTyWctCQTIy3eIeWoOGRl3jCdyZs2
 9H/kzb1UWVwKFQ0MygCSgxMB6KXcK556c0avJYeF5g9MWRNfJUQehBwTvhRbHi7rCBTx
 dsvrgQYjfykgOBOQ6UJWjLNwjJ8PPFWZwSx52Avs44riA+dgtDoEBGcTvR7hWk8an8/9
 8U0g==
X-Gm-Message-State: AOAM532QXei8FywvIxN1nIvhKQ/6SVKzVx2/TOIBI1zeUPJbVhWw2HxW
 C9PFZsQlxujiE5HkxQeUYZtCIJYM00uLXCdXpYlNFQ==
X-Google-Smtp-Source: ABdhPJwXfmNuJgEHIdyho6pdwZBoaygjLew4trl1rGVoAGD6VfneLi3tBm/wiT7MqbfIZaH5DN3JlWSsYhRH9SqwjAw=
X-Received: by 2002:a17:902:7087:b029:d3:f1e5:b629 with SMTP id
 z7-20020a1709027087b02900d3f1e5b629mr14635001plk.51.1602308618238; Fri, 09
 Oct 2020 22:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200729175849.148332-1-vitor@massaru.org>
 <CAFd5g47s09BfsqNx2RY1Zdp-TC4KbKgsMgr9-SHv1Nf6P9vAMQ@mail.gmail.com>
 <cfcb01c087fdd9f22a875721444a7659bceec05f.camel@sipsolutions.net>
In-Reply-To: <cfcb01c087fdd9f22a875721444a7659bceec05f.camel@sipsolutions.net>
Date: Fri, 9 Oct 2020 22:43:27 -0700
Message-ID: <CAFd5g45o-tiDCmbeoo2KEF0bSqsFUpULgmgEGf=ra+eYHm30xA@mail.gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, kvalo@codeaurora.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: kunit: add bitfield test
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

On Thu, Sep 17, 2020 at 3:00 AM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> On Wed, 2020-08-19 at 14:10 -0700, Brendan Higgins wrote:
> > On Wed, Jul 29, 2020 at 10:58 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
> > > This adds the conversion of the runtime tests of test_bitfield,
> > > from `lib/test_bitfield.c` to KUnit tests.
> > >
> > > Please apply this commit first (linux-kselftest/kunit-fixes):
> > > 3f37d14b8a3152441f36b6bc74000996679f0998 kunit: kunit_config: Fix parsing of CONFIG options with space
> > >
> > > Code Style Documentation: [0]
> > >
> > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > > Link: [0] https://lore.kernel.org/linux-kselftest/20200620054944.167330-1-davidgow@google.com/T/#u
> >
> > Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> >
> > Probably still want a review from Johannes though.
>
> Huh, sorry, this slipped through the cracks.
>
> Yeah, don't really care, looks fine to me? I'm not familiar with the
> kunit infrastructure much yet.

Cool, well in that case I will apply it.

> Not sure I see much value in converting TEST_BITFIELD_COMPILE to a
> KUNIT_CASE though, because anyway it will not compile if you enable
> that? IOW, just leaving the function there without any KUNIT_CASE()
> reference to it should be fine and saves you an ifdef ...

Well I think it is also the case that we only want to count the test
case if it actually has everything to run; that is a point that is
somewhat up in the air. David is exploring adding the concept of
"skipped" tests to KUnit, but we don't have that yet.

Cheers!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
