Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3BFC55178
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 12:38:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4806C20853
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 12:38:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8dQBhRk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4806C20853
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 150DB8731E;
	Sun, 25 Oct 2020 12:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oOl85CEi4tS7; Sun, 25 Oct 2020 12:38:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0261B8731C;
	Sun, 25 Oct 2020 12:38:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D356AC0893;
	Sun, 25 Oct 2020 12:38:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6542BC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 12:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6130586610
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 12:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OzerAdMTOCZs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 12:38:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C0FC1865DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 12:38:29 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t22so3348417plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fvuSDo2wkE4QwOENh8boyLlP4PQz8fyvgGKS3pbuxLw=;
 b=p8dQBhRkN7fEu+O1NeZ4Xa+o73YiAbgZRasX+99jvsgirWRrEOVNpP7cNFzQBV1ej4
 2yKfOCiJbHBFbSfeJL9eLJdKGeYPtNn3YQLKvJrrjQ1ppj4OlCR7oHYutNr+JenXWiuv
 aKNpIA8usS4sSxh+VhqWnEvjE9VeMFW6334nns9Ooffb6A7GOwRrY0uknwFiL+K5mX5i
 PsvxFI9yR1TNyUVhfhEIb3fkD+j8yZiyIjRLADqgR7gcxsvxoe7uDRnc3lZtaDewPiS+
 h9Ve59Ul9ji3VvEDomkSf6l7Md438NCLLh+ZOm83oYeNxB5oUiipDtuTYneR4oTF+ATF
 n2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fvuSDo2wkE4QwOENh8boyLlP4PQz8fyvgGKS3pbuxLw=;
 b=cFYPPtB6Z7x+LLHr7yMZE77tV0TZvEc7hUcrk/PZaoBFskTHZN50V4Mx2QHl9o2KhY
 KzJg3ZsPIIrPeSdJHvCulvugczB0b36AjAhs1nMk56sjRQ0r8K8YL5rZD6lguNYDfQ3b
 GNuGKohOqLDv7BV3O7MstFLqHOgPmxn9DIXEyd3yWZ7BS23GrVXxiP81w/iaZ1E+EnPW
 fZy8kZY8PcSXEjVTH0ta1bOReyTYcxW8kbM9wyQ9v3P/EcxoigbDR73YuoPd9DGe5QzS
 4+pQ39MXkfGMSn9dYUM2CmtfZ3cgpRnAyxVxi+gTvwrkVfxzBA+v7512f6c6WFsw2WvA
 rMTg==
X-Gm-Message-State: AOAM530Ybpm1dPQEjMjXQAWO5hxfqrvbaW3aHH7uvpWo6ikHixY4Lhh7
 lD1zj0IsLVf3NCUX3GOx+TGWD1FR8ozzKZh9bN4=
X-Google-Smtp-Source: ABdhPJw6EPtQqi2auFy61TxpN2g6nCTZxCBfBMdZEJBnxR41xBu40iSeXHfknEXojy0kMHOCOFIkhvaaQYW4yrijlyo=
X-Received: by 2002:a17:902:6bc8:b029:d6:d9d:f28c with SMTP id
 m8-20020a1709026bc8b02900d60d9df28cmr4532185plt.17.1603629509336; Sun, 25 Oct
 2020 05:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201022151349.47436-1-98.arpi@gmail.com>
 <20201023173108.GG32486@alley>
In-Reply-To: <20201023173108.GG32486@alley>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 25 Oct 2020 14:38:13 +0200
Message-ID: <CAHp75VeEcb3CtQWeZXQz-UFMgqL6ERwDjudPmcCCNJgHesb3pg@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2] lib: Convert test_printf.c to
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

On Sat, Oct 24, 2020 at 2:07 AM Petr Mladek <pmladek@suse.com> wrote:
> On Thu 2020-10-22 20:43:49, Arpitha Raghunandan wrote:
> > Convert test lib/test_printf.c to KUnit. More information about

...

> > not ok 1 - printf-kunit-test
>
> > --- a/lib/test_printf.c
> > +++ b/lib/printf_kunit.c
>
> There is no standard at the moment.

JFYI: from v5.10-rc1 it is expected to have documentation clarifying
the naming scheme. Also there is a pending series [1] to move KUnit
based test cases to the defined schema.

> Please, either unify names of all the above modules or keep test_printf.c

[1]: https://lore.kernel.org/linux-kselftest/20201016110836.52613-1-andriy.shevchenko@linux.intel.com/


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
