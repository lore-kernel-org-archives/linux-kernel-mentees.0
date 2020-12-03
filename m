Return-Path: <SRS0=x+JC=FH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E658C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Dec 2020 19:24:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DAE022203
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Dec 2020 19:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DAE022203
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 617CE86E40;
	Thu,  3 Dec 2020 19:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2PDZTLHH4oK; Thu,  3 Dec 2020 19:24:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 977C686E07;
	Thu,  3 Dec 2020 19:24:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 831EBC163C;
	Thu,  3 Dec 2020 19:24:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3A3AC0FA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 19:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E60862E34F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 19:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ZFugvWYZZL4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 19:24:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 9B67720474
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 19:24:32 +0000 (UTC)
Date: Thu, 3 Dec 2020 20:25:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607023471;
 bh=JfxMKscEXFAr7qsU4HRCSRGkP0Gtl8g3FpK77gye064=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=T2zKbRO6v08ScuIgXkHtaNwqwEydsX9yQILAngxvYhkguocxNPd/J1K5NqmQbS0HX
 PHFS1PbSAgCa0Td8UV1YoD6UZrpjSGNIXpSwLq1BXV40KJTts8Fp0znp3RB/sv+Uzz
 lmyg+KpJCUbGzPyVbtDGfwAeIUmvc97v38Zsrz7w=
From: Greg KH <gregkh@linuxfoundation.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Message-ID: <X8k7srxYPa275pXQ@kroah.com>
References: <280235acc0e91365f3fd3b5be5a5244eced1ff61.camel@perches.com>
 <20201202183045.9309-1-yashsri421@gmail.com>
 <5afbcd1423ee8fc2dfad191d94aef6efc17198c8.camel@perches.com>
 <a2c74693-93ae-cd5a-7836-4ffff643fc09@gmail.com>
 <CAKXUXMxPMdGmnOWdYnS0VQXaAH9dTe7uNfUUPp-GLy2xTXuABw@mail.gmail.com>
 <X8k1CaSlaJpJdmcC@kroah.com>
 <CAKXUXMye+ppB1DhGu9xwqRa2BEuLKzsQVL3_RUNySy+zKXHoLg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKXUXMye+ppB1DhGu9xwqRa2BEuLKzsQVL3_RUNySy+zKXHoLg@mail.gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Aditya <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH -mmots] checkpatch: add fix for
 non-standard signature - co-authored-by
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

On Thu, Dec 03, 2020 at 08:00:58PM +0100, Lukas Bulwahn wrote:
> On Thu, Dec 3, 2020 at 7:56 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Dec 03, 2020 at 11:59:54AM +0100, Lukas Bulwahn wrote:
> > > On Thu, Dec 3, 2020 at 10:59 AM Aditya <yashsri421@gmail.com> wrote:
> > > >
> > > > On 3/12/20 12:26 am, Joe Perches wrote:
> > > > > On Thu, 2020-12-03 at 00:00 +0530, Aditya Srivastava wrote:
> > > > >> Currently, checkpatch.pl warns us for BAD_SIGN_OFF on the usage of
> > > > >> non-standard signatures.
> > > > >>
> > > > >> An evaluation on v4.13..v5.8 showed that out of 539 warnings due to
> > > > >> non-standard signatures, 43 are due to the use of 'Co-authored-by'
> > > > >> tag, which may seem correct, but is not standard.
> > > > >>
> > > > >> The standard signature equivalent for 'Co-authored-by' is
> > > > >> 'Co-developed-by'.
> > > > >
> > > > > I'm not going to ack this as I don't mind non-standard signatures.
> > > > >
> > > >
> > > > What do you suggest?
> > > > Should I drop this patch and move on?
> > > >
> > >
> > > Joe does not ack this, but he also does not nack it.
> > >
> > > You either move on (which is perfectly fine), or
> > >
> > > you either wait that Andrew Morton reviews it and accepts it because
> > > he thinks it useful, or
> > >
> > > you reach out to the git committers that have been using
> > > Co-authored-by in the past and ask them if this kind of feature would
> > > have been helpful for them and you get an ack from them that convinces
> > > Andrew Morton to pick this.
> >
> > co-developed-by is the correct tag for this.  It is documented exactly
> > for this reason, please do not try to use something that is not already
> > accepted by the kernel developers for this type of thing.
> >
> 
> Well, Greg, so do we get your Acked-by on a feature that checkpatch
> warns that Co-authored-by is non-standard and that then fixes up the
> patch automatically to Co-developed-by with checkpatch --fix?
> 
> If so, please add your Acked-by on this patch here and let Andrew know
> to pick it...

I have not reviewed the patch, sorry, just was commenting on the fact
that we do have a standard for this.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
