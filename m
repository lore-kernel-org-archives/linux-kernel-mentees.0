Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D94FC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 20:46:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C540E20790
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 20:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Zmyj6b1x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C540E20790
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 741F6864D1;
	Mon, 12 Oct 2020 20:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhe0b0YDU9if; Mon, 12 Oct 2020 20:46:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E48D686449;
	Mon, 12 Oct 2020 20:46:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C27B9C0052;
	Mon, 12 Oct 2020 20:46:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8816C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 20:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A793487175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 20:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FW6+kNwXeVSo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 20:46:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0E3908716A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 20:46:32 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id c6so9327292plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 13:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GP/tSxU+2ueJJAD5XvrlcBqjjbcVqs1GAlfX4xS/x5o=;
 b=Zmyj6b1xn7fgYQ4LeerdVC70u737/gGJRwdCYnv5k4lAJ4ZAWiq77J6HTWNtPLy5Fb
 +xId2w1AJdlP4b4Gk+cO+qmKRbcZL0o4WUamdOMbP0HnLbSjH7bnxsZclfoKc6+wueKq
 Y4WFwLXKO7dsLcGwu3W0ytOyLYRM/b67FrN7deWaZaARnBxEiuSQkhaYtEFWV3FNh1DJ
 mYsz/GpTkpDNVka9ngAw3/WAJVbib0KRuj33mR5fuEcT+qGLmQdkwuO6TrpxS1rNI4ix
 t8Vacy6eZIRybQE0PFe7c5weaxWzTGWykb5XWW2C6WIttIokJ30keX8fgYRcZYI7D11N
 1gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GP/tSxU+2ueJJAD5XvrlcBqjjbcVqs1GAlfX4xS/x5o=;
 b=P6xRx1CySnMLFJmgYLqXm2ALIEiJtBmm9bXLcY6ePLRmKT4hV1M9z+gjz0ctRAf2Xk
 cnI4Jben3slA87elxUoBhO5cPBfDenhda7zT/EZweK54qVgNqmQV68nqzzxgJIwj0JEP
 MSFOEzz0SLebx5cXzfmIFX/LO1/Fgh3GObiOA/6nm9zEdZNF6M8aszZb5T54fnW+rjvC
 a6q6Ulc8gPUu8Fg6MMjJ/9kEFgobGI26LmSO0dh72GXuSDHi3weX7hng0x9MW9qLFZSh
 5mxltBNjVrOovspU3OKouU3dJLf9J2w11g3wkhXg+l6Lj4QfRhaL+c9dyc+1VZxvPSIC
 dLag==
X-Gm-Message-State: AOAM531SCdp9DAVL5Zi+lTRQza2MW8Op+W1AzodiyIkyZtkP1X4NwjAw
 s+DzyFO8D6XncEbPSUekrrI+Dg==
X-Google-Smtp-Source: ABdhPJxvYuECJqceRU/Ms78R61xviB7QnwDg4XOxMDIU5Uul1Qb3W8B+eZKuWlzzWx/nqi1F2hbH0w==
X-Received: by 2002:a17:902:70c8:b029:d4:d4d5:f140 with SMTP id
 l8-20020a17090270c8b02900d4d4d5f140mr9444301plt.33.1602535591364; 
 Mon, 12 Oct 2020 13:46:31 -0700 (PDT)
Received: from google.com ([2620:15c:2cb:201:c634:6bff:fe71:d8d1])
 by smtp.gmail.com with ESMTPSA id q5sm9065695pjg.0.2020.10.12.13.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 13:46:30 -0700 (PDT)
Date: Mon, 12 Oct 2020 13:46:25 -0700
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20201012204625.GA56597@google.com>
References: <20200817043028.76502-1-98.arpi@gmail.com>
 <f408efbd-10f7-f1dd-9baa-0f1233cafffc@rasmusvillemoes.dk>
 <20200821113710.GA26290@alley>
 <20200821122849.GS1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200821122849.GS1891694@smile.fi.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, Arpitha Raghunandan <98.arpi@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
 linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: Convert test_printf.c to
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Aug 21, 2020 at 03:28:49PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 21, 2020 at 01:37:10PM +0200, Petr Mladek wrote:
> > On Mon 2020-08-17 09:06:32, Rasmus Villemoes wrote:
> > > On 17/08/2020 06.30, Arpitha Raghunandan wrote:
> > > > Converts test lib/test_printf.c to KUnit.
> > > > More information about KUnit can be found at
> > > > https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
> > > > KUnit provides a common framework for unit tests in the kernel.
> > > =

> > > So I can continue to build a kernel with some appropriate CONFIG set =
to
> > > y, boot it under virt-me, run dmesg and see if I broke printf? That's
> > > what I do now, and I don't want to have to start using some enterprisy
> > > framework.
> > =

> > I had the same concern. I have tried it.

Sorry you feel that way. Do you have any suggestions on how we can make
it seem less enterprisy? Seems like there are people here who are not a
fan of the output format, so of which we can fix here, some of which is
part of KTAP[1].

> Which raises an obvious question: did the people who convert this test th=
is
> themselves? Looks like a janitor work in the area without understanding t=
he
> area good enough.

Looks to me like Arpitha ran it, but you are right, we don't have a lot
of familiarity with this area; we were treating it as "janitor work" as
you say.

Our intention was just to take some existing tests and as non-invasively
as possible, get them to report using a common format, and maybe even
get some of the tests to follow a common pattern.

> Probably I will NAK all those patches from now on, until it will be good =
commit
> messages and cover of risen aspects, including reference to before and af=
ter
> outcome for passed and failed test cases.

Fair enough, hopefully we can address these issues in the next revision.

One issue though, with the "before and after outcome" you are
referencing; are you referring to the issue that Petr pointed out in how
they are inconsistent:

=A0 =A0+ original code: vsnprintf(buf, 6, "%pi4|%pI4", ...) wrote '127.0', =
expected '127-0'
=A0 =A0+ kunit code: vsnprintf(buf, 20, "%pi4|%pI4", ...) wrote '127.000.00=
0.001|127', expected '127-000.000.001|127' =A0

(I think Rasmus addressed this.) Or are your referring to something
else?

> Brendan, I guess the ball now on your side to prove this is good activity.

And I see that we are off to a great start! :-)

In all seriousness, I am really sorry about this. I kind of bungled this
up trying to go after too many of these conversions at once.

Arpitha, can you get this follow up patch out?

[1] https://lore.kernel.org/linux-kselftest/CY4PR13MB1175B804E31E502221BC81=
63FD830@CY4PR13MB1175.namprd13.prod.outlook.com/
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
