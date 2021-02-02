Return-Path: <SRS0=9TgK=HE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC1BC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  2 Feb 2021 11:57:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D57964EC5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  2 Feb 2021 11:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D57964EC5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F35DC2049D;
	Tue,  2 Feb 2021 11:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kYnYvqiF7LEC; Tue,  2 Feb 2021 11:57:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7A98720387;
	Tue,  2 Feb 2021 11:57:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62852C0174;
	Tue,  2 Feb 2021 11:57:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49EE9C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Feb 2021 11:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 45D7586D11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Feb 2021 11:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnv5n1Gig9vV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Feb 2021 11:57:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BFBEE86CB6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Feb 2021 11:57:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CF2B64F54;
 Tue,  2 Feb 2021 11:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612267026;
 bh=hJANvgAJx1Itgu/daXTB54JwtMxbyN5SjIal+o1Jncs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A9H7Dgb0nXZ48uK7JDCHkm4E+ol2lb7pf/o6rWPy8tAKqz33xJuRrkDPoB3YVkJPH
 UCKCzojMcHBtVqwNLwHxcvLZJgkADYbPNm/ia/WzLRuj+gOQh9A8zMfw3CRISXWSSJ
 KFmw4SUp42LPKyVE8PPnTUsoc655m+yHWWx7cbAs=
Date: Tue, 2 Feb 2021 12:57:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <YBk+Dqbyu0W9P3rI@kroah.com>
References: <CABJPP5AxB8-kafFEpsMydg8eMx8bH5ooT5g7r0fKWV2T2Hjtng@mail.gmail.com>
 <YBguQ/dENrfvtptJ@kroah.com>
 <CABJPP5Ba9pDJco16R0CfcpXZedT7vPx_Md9QTRX=y_guQcwLww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABJPP5Ba9pDJco16R0CfcpXZedT7vPx_Md9QTRX=y_guQcwLww@mail.gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] Patches from the future - can checkpatch
 help?
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

On Mon, Feb 01, 2021 at 10:31:33PM +0530, Dwaipayan Ray wrote:
> On Mon, Feb 1, 2021 at 10:07 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Feb 01, 2021 at 10:04:01PM +0530, Dwaipayan Ray wrote:
> > > Hi,
> > > on linux-next,
> > > $ git log --pretty=format:"%h%x09%ad" | awk '$6>2021 {print $1}'
> > > gives:
> > > 4a2d78822fdf
> > > 12ca45fea91c
> > > 09f2724a786f
> > >
> > > These are patches from the year 2085, 2037 and 2030 respectively.
> > >
> > > Would a checkpatch rule be helpful for these or are they too
> > > isolated to waste runtime on?
> >
> > Dates come from your email client, not the patch itself, how is
> > checkpatch going to catch this?
> >
> 
> I was hoping that the maintainer could catch it before merging it
> into his tree. Dates being a trivial thing might slip human eyes,
> but checkpatch might detect it there.

What is the problem here.  You can't treat dates that patches were
"created", you have to always go off of the release the patches showed
up in.  So while you might want to do a sliding scale of 4 months or so,
in reality we have patches committed to the tree today that were written
years ago.

I think I still hold the record for "time it took to get a patch merged"
with a very old devfs removal patch, which was many many years...

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
