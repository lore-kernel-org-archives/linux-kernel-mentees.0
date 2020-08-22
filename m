Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E751C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 01:18:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08CF72072D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 01:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08CF72072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 018BE86B59;
	Sat, 22 Aug 2020 01:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NwAC4xNLtTIF; Sat, 22 Aug 2020 01:18:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 04BE086B47;
	Sat, 22 Aug 2020 01:18:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA4CDC0889;
	Sat, 22 Aug 2020 01:18:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24C38C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 01:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0C29A880C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 01:18:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oDKUbq02YfUv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 01:17:59 +0000 (UTC)
X-Greylist: delayed 00:09:45 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0236.hostedemail.com
 [216.40.44.236])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0A91B88091
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 01:17:58 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 73A201813BCDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 01:08:14 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 88C7D100E7B45;
 Sat, 22 Aug 2020 01:08:11 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: wound83_2f0234b2703d
X-Filterd-Recvd-Size: 5026
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Sat, 22 Aug 2020 01:08:09 +0000 (UTC)
Message-ID: <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>, kernel-janitors
 <kernel-janitors@vger.kernel.org>, kernelnewbies
 <kernelnewbies@kernelnewbies.org>, 
 linux-kernel-mentees@lists.linuxfoundation.org
Date: Fri, 21 Aug 2020 18:08:08 -0700
In-Reply-To: <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
References: <20200818184107.f8af232fb58b17160c570874@linux-foundation.org>
 <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com>
 <b0fd63e4b379eda69ee85ab098353582b8c054bb.camel@perches.com>
 <alpine.DEB.2.22.394.2008201021400.2524@hadrien>
 <a5713d8597065ef986f780499428fcc4cd31c003.camel@perches.com>
 <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: Giuseppe Scrivano <gscrivan@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Andy Whitcroft <apw@shadowen.org>,
 cocci <cocci@systeme.lip6.fr>, LKML <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

(forwarding on to kernel-janitors/mentees and kernelnewbies)

Just fyi for anyone that cares:

A janitorial task for someone might be to use Julia's coccinelle
script below to convert the existing instances of commas that
separate statements into semicolons.

https://lore.kernel.org/lkml/alpine.DEB.2.22.394.2008201856110.2524@hadrien/

On Thu, 2020-08-20 at 19:03 +0200, Julia Lawall wrote:
> > > I have a bunch of variations of this that are more complicated than I
> > > would have expected.  One shorter variant that I have is:
> > > 
> > > @@
> > > expression e1,e2;
> > > statement S;
> > > @@
> > > 
> > >  S
> > >  e1
> > > -,
> > > +;
> > >   (<+... e2 ...+>);
> > > 
> > > This will miss cases where the first statement is the comma thing.  But I
> > > think it is possible to improve this now.  I will check.
> > 
> > Hi Julia.
> > 
> > Right, thanks, this adds a dependency on a statement
> > before the expression.  Any stragglers would be easily
> > found using slightly different form.
> > There are not very many of these in linux kernel.
> > 
> > Another nicety would be to allow the s/,/;/ conversion to
> > find both b and c in this sequence:
> > 	a = 1;
> > 	b = 2,
> > 	c = 3,
> > 	d = 4;
> > without running the script multiple times.
> > There are many dozen uses of this style in linux kernel.
> > 
> > I tried variants of adding a comma after the e2 expression,
> > but cocci seems to have parsing problems with:
> > 
> > @@
> > expression e1;
> > expression e2;
> > @@
> > 	e1
> > -	,
> > +	;
> > 	e2,
> 
> This doesn't work because it's not a valid expression.
> 
> The problem is solved by doing:
> 
>   e1
> - ,
> + ;
>   e2
>   ... when any
> 
> But that doesn't work in the current version of Coccinelle.  I have fixed
> the problem, though and it will work shortly.
> 
> > I do appreciate that coccinelle adds braces for multiple
> > expression comma use after an if.
> > 
> > i.e.:
> > 	if (foo)
> > 		a = 1, b = 2;
> > becomes
> > 	if (foo) {
> > 		a = 1; b = 2;
> > 	}
> 
> I wasn't sure what was wanted for such things.  Should b = 2 now be on a
> separate line?
> 
> I took the strategy of avoiding the problem and leaving those cases as is.
> That also solves the LIST_HEAD problem.  But if it is wanted to change
> these commas under ifs, then that is probably possible too.
> 
> My current complete solution is as follows.  The first rule avoids changing
> commas in macros, where thebody of the macro is just an expression.  The
> second rule uses position variables to ensure that the two expression are
> on different lines.
> 
> @r@
> expression e1,e2;
> statement S;
> position p;
> @@
> 
> e1 ,@S@p e2;
> 
> @@
> expression e1,e2;
> position p1;
> position p2 :
>     script:ocaml(p1) { not((List.hd p1).line_end = (List.hd p2).line) };
> statement S;
> position r.p;
> @@
> 
> e1@p1
> -,@S@p
> +;
> e2@p2
> ... when any
> 
> The generated patch is below.
> 
> julia
> 
> diff -u -p a/drivers/reset/hisilicon/reset-hi3660.c b/drivers/reset/hisilicon/reset-hi3660.c
> --- a/drivers/reset/hisilicon/reset-hi3660.c
> +++ b/drivers/reset/hisilicon/reset-hi3660.c
> @@ -89,7 +89,7 @@ static int hi3660_reset_probe(struct pla
>  		return PTR_ERR(rc->map);
>  	}
> 
> -	rc->rst.ops = &hi3660_reset_ops,
> +	rc->rst.ops = &hi3660_reset_ops;
>  	rc->rst.of_node = np;
>  	rc->rst.of_reset_n_cells = 2;
>  	rc->rst.of_xlate = hi3660_reset_xlate;

The rest of the changes are in the link above...


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
