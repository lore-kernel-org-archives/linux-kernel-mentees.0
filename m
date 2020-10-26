Return-Path: <SRS0=aL4C=EB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FF9C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 09:48:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9E5A20704
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Oct 2020 09:48:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="JhFDzd3J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9E5A20704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4474386135;
	Mon, 26 Oct 2020 09:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BK5Rjnn7C7mV; Mon, 26 Oct 2020 09:48:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C77F6860DE;
	Mon, 26 Oct 2020 09:48:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5DB4C088B;
	Mon, 26 Oct 2020 09:48:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D0F1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 09:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4A09E8712B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 09:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGJdUm4hRfXz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 09:48:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 275D687126
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Oct 2020 09:48:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1603705691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SlRTfCqLtyIBSnFe1uknaKbGad8itHiONy0aNY9FDgo=;
 b=JhFDzd3J++hEnEzoRBaqwNWv2fiLphklER9BPvVbuQwTMEi8uzeaOfKsoLXM2yLuyKcr5X
 I8nZTO8D3hFAHiJvimHHlxm7iJcufndpC0AhaJuxydfSsuznKUmN+cTRDJ0e1AHY6tM+zX
 yYbzVwgKoyxVx+rXolhn++ggmuAvh8A=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01CBEB2CB;
 Mon, 26 Oct 2020 09:48:11 +0000 (UTC)
Date: Mon, 26 Oct 2020 10:48:10 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20201026094810.GJ32486@alley>
References: <20201022151349.47436-1-98.arpi@gmail.com>
 <20201023173108.GG32486@alley>
 <CAHp75VeEcb3CtQWeZXQz-UFMgqL6ERwDjudPmcCCNJgHesb3pg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VeEcb3CtQWeZXQz-UFMgqL6ERwDjudPmcCCNJgHesb3pg@mail.gmail.com>
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

On Sun 2020-10-25 14:38:13, Andy Shevchenko wrote:
> On Sat, Oct 24, 2020 at 2:07 AM Petr Mladek <pmladek@suse.com> wrote:
> > On Thu 2020-10-22 20:43:49, Arpitha Raghunandan wrote:
> > > Convert test lib/test_printf.c to KUnit. More information about
> 
> ...
> 
> > > not ok 1 - printf-kunit-test
> >
> > > --- a/lib/test_printf.c
> > > +++ b/lib/printf_kunit.c
> >
> > There is no standard at the moment.
> 
> JFYI: from v5.10-rc1 it is expected to have documentation clarifying
> the naming scheme. Also there is a pending series [1] to move KUnit
> based test cases to the defined schema.
>
> > Please, either unify names of all the above modules or keep test_printf.c
> 
> [1]: https://lore.kernel.org/linux-kselftest/20201016110836.52613-1-andriy.shevchenko@linux.intel.com/

Great, thanks for the pointer. I seems that this patch actually
follows the proposed naming schema. I am fine with it then.

Best Regards,
Petr
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
