Return-Path: <SRS0=u7S/=EL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D615C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Nov 2020 20:08:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DF5620729
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Nov 2020 20:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LI06uVl2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DF5620729
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 12E2485E07;
	Thu,  5 Nov 2020 20:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1rxb6aehmeq; Thu,  5 Nov 2020 20:08:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3B4A385DF7;
	Thu,  5 Nov 2020 20:08:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E7E6C088B;
	Thu,  5 Nov 2020 20:08:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F9EEC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 20:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1CC7D272F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 20:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WrWXB+iZZHET
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 20:08:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 479D6272E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 20:08:10 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F8DA20729;
 Thu,  5 Nov 2020 20:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604606889;
 bh=UbXVjeOJkuP8+CC9HnOjLWKGZfWfCv/qYw/apchOvu0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LI06uVl2qSHOowOvTc/LExLLKr74j/LoNMga+IIQHSYugCgTZ/qz6FfhsHAdRUUT/
 nbteaX4CUK9eK1EerhGvZBzlQx1Q+olQZYcX2TWiAc0diPGo6v919ZmZNcM6Rf6Dtq
 7vA3wAgIVyvl9rDcsPHgGi8pxnMA1/wAjfG530Ds=
Date: Thu, 5 Nov 2020 21:08:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Joe Perches <joe@perches.com>
Message-ID: <20201105200857.GC1333458@kroah.com>
References: <20201105115949.39474-1-dwaipayanray1@gmail.com>
 <f83c2eeafdebc6307ee6e515e4d6652b2606a068.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f83c2eeafdebc6307ee6e515e4d6652b2606a068.camel@perches.com>
Cc: yashsri421@gmail.com, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: improve email
	parsing
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Nov 05, 2020 at 09:41:15AM -0800, Joe Perches wrote:
> (adding stable and Greg KH for additional review)
> On Thu, 2020-11-05 at 17:29 +0530, Dwaipayan Ray wrote:
> > checkpatch doesn't report warnings for many common mistakes
> > in emails. Some of which are trailing commas and incorrect
> > use of email comments.
> =

> I presume you've tested this against the git tree.
> =

> Can you send me a file with the BAD_SIGN_OFF messages generated
> and if possible the git SHA-1s of the commits?
> =

> > At the same time several false positives are reported due to
> > incorrect handling of mail comments. The most common of which
> > is due to the pattern:
> > =

> > <stable@vger.kernel.org> # X.X
> > =

> > Improve email parsing in checkpatch.
> > =

> > Some general comment rules are defined:
> > =

> > - Multiple name comments should not be allowed.
> > - Comments inside address should not be allowed.
> > - In general comments should be enclosed within parentheses.
> > =A0=A0Exception for stable@vger.kernel.org # X.X
> =

> not just vger.kernel.org, but this should also allow stable@kernel.org
> and only allow cc: and not any other -by: type for that email address.
> =

> A process preference question for Greg and the stable team:
> =

> The most common stable forms are
> =

> 	stable@vger.kernel.org # version info

That is what is documented it should be, yes.

> then
> 	stable@vger.kernel.org [ version info ]

Really?  Ick, no wonder my email parsing scripts choke on that :)

> with some other relatively infrequently used outlier styles, some
> that use parentheses, but this is not frequent.

The one with '#' should be preferred.  If not, we need to change our
documentation.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
