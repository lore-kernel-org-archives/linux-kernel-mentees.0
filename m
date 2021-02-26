Return-Path: <SRS0=B4mk=H4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A04DC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 12:06:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C76B64ED2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 12:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C76B64ED2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE43D49DFC;
	Fri, 26 Feb 2021 12:06:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GORAy5OMw3yA; Fri, 26 Feb 2021 12:06:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEFD649AA0;
	Fri, 26 Feb 2021 12:06:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFDA1C000B;
	Fri, 26 Feb 2021 12:06:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CF3CC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 12:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 649ED49DFC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 12:06:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RxfAeuxaPu2y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 12:06:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay.hostedemail.com (smtprelay0208.hostedemail.com
 [216.40.44.208])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5275D49AA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 12:06:39 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 2E1B7182D542A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 10:50:20 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 05A37AF8C;
 Fri, 26 Feb 2021 10:50:17 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: dime75_4c077ac27699
X-Filterd-Recvd-Size: 3638
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Fri, 26 Feb 2021 10:50:15 +0000 (UTC)
Message-ID: <a0f05bbd5880a7d498af21c5013fa5895d6e3ca7.camel@perches.com>
Subject: Re: [PATCH v7 0/2] checkpatch: add verbose mode
From: Joe Perches <joe@perches.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>
Date: Fri, 26 Feb 2021 02:50:14 -0800
In-Reply-To: <20210225215501.2408c97b@coco.lan>
References: <20210222075205.19834-1-dwaipayanray1@gmail.com>
 <bcee822d1934772f47702ee257bc735c8f467088.camel@perches.com>
 <CABJPP5AARO3h2mt-piPWuOD3kY_XzNfW-s2mi=btfOayVPURHg@mail.gmail.com>
 <20210225215501.2408c97b@coco.lan>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, 2021-02-25 at 21:55 +0100, Mauro Carvalho Chehab wrote:
> Em Thu, 25 Feb 2021 23:38:03 +0530
> Dwaipayan Ray <dwaipayanray1@gmail.com> escreveu:
> =

> > On Thu, Feb 25, 2021 at 11:03 PM Joe Perches <joe@perches.com> wrote:
> > > =

> > > On Mon, 2021-02-22 at 13:22 +0530, Dwaipayan Ray wrote:  =

> > > > Add a new verbose mode to checkpatch. The verbose test
> > > > descriptions are read from the checkpatch documentation
> > > > file at `Documentation/dev-tools/checkpatch.rst`.
> > > > =

> > > > The verbose mode is optional and can be enabled by the
> > > > flag -v or --verbose.
> > > > =

> > > > The documentation file is only parsed by checkpatch.pl
> > > > if the verbose mode is enabled. The verbose mode can
> > > > not be used together with the --terse option.  =

> > > =

> > > I don't have any real objection to this patch set, but as this
> > > might be added to the Documentation tree and in .rst format,
> > > perhaps Jonathan Corbet and/or Mauro Carvalho Chehab might have
> > > some opinion.
> > > =

> > > Also I do not want to be a maintainer of this .rst file and
> > > likely neither Jon nor Mauro would either.  Perhaps you?
> > > =A0
> > > =

> > =

> > I could take it up if everybody is okay with it!
> > =

> > > Ideally, the patch order would be reversed so the .rst file
> > > is added first, then checkpatch updated to use it.
> > > =A0
> > > =

> > =

> > Sure, if Jonathan or Mauro has no objections to it, I will be happy
> > to resend it so that it can be picked up properly.
> =

> I don't have any objections, provided that I won't be maintaining
> it :-)
> =

> -
> =

> Just my two cents:
> =

> IMO, maintaining this on a separate file can be a maintenance nightmare, =

> as this is the kind of thing that can become obsolete real soon.
> =

> One alternative would be to use Pod::Usage module, just like
> this script does:
> =

> 	scripts/get_abi.pl
> =

> with something similar to that, calling
> =

> 	$ checkpatch --man =

> =

> Could generate a man-page style with all options, while:
> =

> 	$ checkpatch --help
> =

> would print the current help page.
> =

> Yet, this would generate more work for Joe, as, for every new
> type, the corresponding help text would be needed.

Does this get integrated into the .rst output?

I see:
Documentation/Makefile:$(shell $(srctree)/scripts/get_abi.pl validate --dir=
 $(srctree)/Documentation/ABI)

But no obvious mechanism that emits .rst files for Pod::Usage

And no, I'm not much interested in maintaining those docs either.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
