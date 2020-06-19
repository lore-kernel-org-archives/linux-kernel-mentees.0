Return-Path: <SRS0=oG7b=AA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D895C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Jun 2020 20:18:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B99CC20B80
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Jun 2020 20:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="JhzmdnUX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B99CC20B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7BC7286EA2;
	Fri, 19 Jun 2020 20:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_rNvk8GW6vH; Fri, 19 Jun 2020 20:18:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0724C86E8A;
	Fri, 19 Jun 2020 20:18:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6044C0865;
	Fri, 19 Jun 2020 20:18:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0653C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 20:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B4C0089800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 20:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U339XUYvznZb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 20:18:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 21EC58973F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 20:18:16 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id t25so9531427oij.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Jun 2020 13:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CtL6MXEKzIeEStdpWr+Z+AY2ozIEH/pJKXnlCHuuM48=;
 b=JhzmdnUXuMgHKNez3rF4CNCqDonN/tgdYvlkkcY/gmPsUHMicehnsmLblPolT0WwCP
 jBS2JJcHqQG1V0nwykQ0NmhmhWrSfYF01b7DLyrDEHJFDrPzR1QitEqoxZXQYFz3FqJR
 YrKNN9+B5Pb8rAcdwHREZXyWpmcRScK+4i+0ol8nC/KODfzFmCrOrpZ7LA7DzlOFCBLP
 qjT6ZfI4bFvx0peh229/xx3Bx3hEpB2yDOZURUzmy3toPz6A2Jfkelvpiw7pkmY7K0q8
 CAPWGRC9EplTK1ob060zhSYPcTqcJQ9rC4nHw4wzmtkOnA/QUBrGlbR3sMJxiI8zzqvp
 6/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CtL6MXEKzIeEStdpWr+Z+AY2ozIEH/pJKXnlCHuuM48=;
 b=VmvoSdr10PdKJBjNGz3Q0ZfPWbLS+pOD2NwQtyf+YgbZejHvMkN1RhiL922XLAEkvG
 lTpS8uXbqeTgxA1T2K+TKxd2xpl//XLj9HDyZWsN2hfjnc5ckJdsbSuKtRkHbmJ1d19P
 ogmeNUzJL2Nhfhg2c9CXJMb3Abl/tI7Y//ZgHVqCUB5QYU70Ak4jOEocDT0nSKeKn6LY
 wDjGHsLRnmvs2vk8ZAhUSJh2fqY89TTwsR+1CWrFEN/jYUiOeJeGooWDCa8PLFSgdDif
 YHErYEGuTNTyCN4X9m0TGt5XBr1kGISlpdr0I4DEza60VQoeszsNHLH36YQy94UmQqlI
 7PSQ==
X-Gm-Message-State: AOAM531dRQeMz1G46bixX0LQxFs8clAg3ZHMwnbbLYjvpBc/yJ+pkJya
 CSYSAYApxZFcIJmSxrzVphFLjP77Dh+eaQWGNSc3Ooq2
X-Google-Smtp-Source: ABdhPJypxSlZuKQ8KcK9qjRv+cbeQn6Qu6jLWRyO3vg5JSCH4ChHL8jP7spzL1WH9TUNcBt0eMgqMcv9S+u+44HLvxE=
X-Received: by 2002:a17:90a:df82:: with SMTP id
 p2mr5255928pjv.217.1592597546456; 
 Fri, 19 Jun 2020 13:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200611215501.213058-1-vitor@massaru.org>
 <202006121403.CF8D57C@keescook>
 <CABVgOSnofuJQ_fiCL-8KdKezg3Hnqk3A+X509c4YP_toKeBVBg@mail.gmail.com>
 <202006141005.BA19A9D3@keescook>
 <CABVgOSkPYBL8Qy9Fsr0owNhh2=tXZmdwCsWhnq+PshJLr06YKA@mail.gmail.com>
 <alpine.LRH.2.21.2006160956170.16027@localhost>
 <CABVgOS=-AHNABkAVV7p=pq67hwoVcXXJSEPvxNbp90Eh_RaxBg@mail.gmail.com>
 <CAFd5g44kZe7h+qKHmx029Qj15FdqxsFRFD3TEx_iEhPEt0jJmA@mail.gmail.com>
 <CABVgOSnjrzfFOMF0VE1-5Ks-e40fc0XZsNZ92jE60ZOhYmZWog@mail.gmail.com>
In-Reply-To: <CABVgOSnjrzfFOMF0VE1-5Ks-e40fc0XZsNZ92jE60ZOhYmZWog@mail.gmail.com>
Date: Fri, 19 Jun 2020 13:12:15 -0700
Message-ID: <CAFd5g45jHMZV3yHnxO-U3uCvhpPeOesHbuAgnzXOqtP-z7+Gmw@mail.gmail.com>
To: David Gow <davidgow@google.com>
Cc: Kees Cook <keescook@chromium.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Alan Maguire <alan.maguire@oracle.com>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] common KUnit Kconfig and file naming
 (was: Re: [PATCH] lib: kunit_test_overflow: add KUnit test of
 check_*_overflow functions)
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

On Thu, Jun 18, 2020 at 11:39 PM David Gow <davidgow@google.com> wrote:
[...]
> On Fri, Jun 19, 2020 at 4:28 AM Brendan Higgins
> <brendanhiggins@google.com> wrote:
> >
> > On Tue, Jun 16, 2020 at 9:21 PM David Gow <davidgow@google.com> wrote:
> > >
> > > On Tue, Jun 16, 2020 at 5:40 PM Alan Maguire <alan.maguire@oracle.com> wrote:
> > > >
> > > > On Tue, 16 Jun 2020, David Gow wrote:
[...]
> > > > > <keescook@chromium.org> wrote:
> > > > > >
> > > > > > On Sat, Jun 13, 2020 at 02:51:17PM +0800, David Gow wrote:

[...]

> > > - Test names: Personally, I'd kind-of like to not prefix these at all,
> > > as they're already part of the suite. If we do want to, though, prefix
> > > them with <subsystem> and <suite>.
> >
> > Eh, I did that to remain consistent with the kernel naming
> > conventions, but I think those have diverged too. If maintainers are
> > cool with it, I agree that the prefixes are redundant on tests and
> > generally way too long.
> >
>
> Do you have a link to the conventions you're talking about?

A link no. This is only of those undocumented rules that most people follow.

The rule is something like this:

Global identifiers should be named:
<subsystem_name_n>_<subsystem_name_n-1>_..._<subsystem_name_1>_<subsystem_name_0>_foo.

For example, let's say I am working on Synopsis' DesignWare I2C master
driver. The outermost namespace is i2c, and because DesignWare is
long, we might prefix each function with i2c_dw_*.

It is a practice that is not universally maintained around the kernel,
but it seems to be the most common method of namespacing aside from
just randomly throwing characters together in a prefix that hasn't
been used before.

Anyway, standardized or not, that is the convention I was trying to follow.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
