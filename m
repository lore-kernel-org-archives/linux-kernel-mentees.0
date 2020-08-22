Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FEEC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 07:07:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C00820724
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 07:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C00820724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0460121539;
	Sat, 22 Aug 2020 07:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TAzGaP6G4Q1Y; Sat, 22 Aug 2020 07:07:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CF7C820353;
	Sat, 22 Aug 2020 07:07:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B291BC07FF;
	Sat, 22 Aug 2020 07:07:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3844FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 07:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2DAFA88422
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 07:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VAAgTm1fmMRo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 07:07:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 785A688401
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 07:07:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.76,339,1592863200"; d="scan'208";a="464294685"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2020 09:07:34 +0200
Date: Sat, 22 Aug 2020 09:07:34 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Joe Perches <joe@perches.com>
In-Reply-To: <3836b482434bd0b9a609959d3696cc6113a93f2f.camel@perches.com>
Message-ID: <alpine.DEB.2.22.394.2008220905460.3150@hadrien>
References: <20200818184107.f8af232fb58b17160c570874@linux-foundation.org>
 <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com>
 <b0fd63e4b379eda69ee85ab098353582b8c054bb.camel@perches.com>
 <alpine.DEB.2.22.394.2008201021400.2524@hadrien> 
 <a5713d8597065ef986f780499428fcc4cd31c003.camel@perches.com>
 <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
 <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
 <162653.1598067338@turing-police>
 <3836b482434bd0b9a609959d3696cc6113a93f2f.camel@perches.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-12852889-1598080054=:3150"
Cc: Giuseppe Scrivano <gscrivan@redhat.com>,
 =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 kernelnewbies <kernelnewbies@kernelnewbies.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@shadowen.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, cocci <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] coccinelle: Convert comma to
 semicolons (was Re: [PATCH] checkpatch: Add test for comma use that should
 be semicolon)
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-12852889-1598080054=:3150
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 21 Aug 2020, Joe Perches wrote:

> On Fri, 2020-08-21 at 23:35 -0400, Valdis Klētnieks wrote:
> > On Fri, 21 Aug 2020 18:08:08 -0700, Joe Perches said:
> > > (forwarding on to kernel-janitors/mentees and kernelnewbies)
> > >
> > > Just fyi for anyone that cares:
> > >
> > > A janitorial task for someone might be to use Julia's coccinelle
> > > script below to convert the existing instances of commas that
> > > separate statements into semicolons.
> >
> > Note that you need to *really* check for possible changes in semantics.
> > It's *usually* OK to do that, but sometimes it's not...
> >
> > for (i=0; i++, last++; !last) {
> >
> > changing that comma to a ; will break the compile.  In other cases, it can
> > introduce subtle bugs.
>
> True enough for a general statement, though the coccinelle
> script Julia provided does not change a single instance of
> for loop expressions with commas.
>
> As far as I can tell, no logic defect is introduced by the
> script at all.

The script has a rule to ensure that what is changed is part of a top
level statement that has the form e1, e2;.  I put that in to avoid
transforming cases where the comma is the body of a macro, but it protects
against for loop headers as well.

julia
--8323329-12852889-1598080054=:3150
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-12852889-1598080054=:3150--
