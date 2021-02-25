Return-Path: <SRS0=c32l=H3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21377C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 20:55:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B05E64E24
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 20:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B05E64E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B8D26F868;
	Thu, 25 Feb 2021 20:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WrDpUa0ZHH30; Thu, 25 Feb 2021 20:55:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D2206F85B;
	Thu, 25 Feb 2021 20:55:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CE7FC000A;
	Thu, 25 Feb 2021 20:55:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FC4FC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 20:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C0AD4EF5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 20:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id naUwQUMs7e2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 20:55:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 290924EF5F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 20:55:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FA1B64DA3;
 Thu, 25 Feb 2021 20:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614286505;
 bh=G9IMobkduNXNp77gtGj9v6ooEe9z5eqMcQHbgs8ufx4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NQlmNhAKNAW/NF+b1b5yu69849sDzpqUW5wqAF8dEiPfDPvP6z32I9igms5SvkQ5E
 j2z/Slx6PSH0gG1X9LNjOOPoXws7qRAoKWkffl4YQx7xt0G+g3J8Tw3Hqr/C+UCd4X
 JR2fCTD7GiexA8Sku9gJNmfQGwTdfzfUzE/D+y/WavhReqtQHl3EV44kgvav89VnrR
 lmZbs7bGoQlzuXpc27ukSAjbBm//2Cr+dD4eMQu2rKz6vhPGrb2S7BmM0wwx5nvpci
 6sot38l5YL8JV7qQ3mo2tiAbe6jhgiyiP2TWI49079h2fLD3ARVDNL2IYtfsWnQ1uS
 laPAwgeZ6+OTQ==
Date: Thu, 25 Feb 2021 21:55:01 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: Re: [PATCH v7 0/2] checkpatch: add verbose mode
Message-ID: <20210225215501.2408c97b@coco.lan>
In-Reply-To: <CABJPP5AARO3h2mt-piPWuOD3kY_XzNfW-s2mi=btfOayVPURHg@mail.gmail.com>
References: <20210222075205.19834-1-dwaipayanray1@gmail.com>
 <bcee822d1934772f47702ee257bc735c8f467088.camel@perches.com>
 <CABJPP5AARO3h2mt-piPWuOD3kY_XzNfW-s2mi=btfOayVPURHg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
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

Em Thu, 25 Feb 2021 23:38:03 +0530
Dwaipayan Ray <dwaipayanray1@gmail.com> escreveu:

> On Thu, Feb 25, 2021 at 11:03 PM Joe Perches <joe@perches.com> wrote:
> >
> > On Mon, 2021-02-22 at 13:22 +0530, Dwaipayan Ray wrote:  
> > > Add a new verbose mode to checkpatch. The verbose test
> > > descriptions are read from the checkpatch documentation
> > > file at `Documentation/dev-tools/checkpatch.rst`.
> > >
> > > The verbose mode is optional and can be enabled by the
> > > flag -v or --verbose.
> > >
> > > The documentation file is only parsed by checkpatch.pl
> > > if the verbose mode is enabled. The verbose mode can
> > > not be used together with the --terse option.  
> >
> > I don't have any real objection to this patch set, but as this
> > might be added to the Documentation tree and in .rst format,
> > perhaps Jonathan Corbet and/or Mauro Carvalho Chehab might have
> > some opinion.
> >
> > Also I do not want to be a maintainer of this .rst file and
> > likely neither Jon nor Mauro would either.  Perhaps you?
> >  
> 
> I could take it up if everybody is okay with it!
> 
> > Ideally, the patch order would be reversed so the .rst file
> > is added first, then checkpatch updated to use it.
> >  
> 
> Sure, if Jonathan or Mauro has no objections to it, I will be happy
> to resend it so that it can be picked up properly.

I don't have any objections, provided that I won't be maintaining
it :-)

-

Just my two cents:

IMO, maintaining this on a separate file can be a maintenance nightmare, 
as this is the kind of thing that can become obsolete real soon.

One alternative would be to use Pod::Usage module, just like
this script does:

	scripts/get_abi.pl

with something similar to that, calling

	$ checkpatch --man 

Could generate a man-page style with all options, while:

	$ checkpatch --help

would print the current help page.

Yet, this would generate more work for Joe, as, for every new
type, the corresponding help text would be needed.

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
