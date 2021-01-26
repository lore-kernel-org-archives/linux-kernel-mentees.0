Return-Path: <SRS0=tq4P=G5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3797BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 22:44:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CEE0205CA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 22:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CEE0205CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 42B85204D6;
	Tue, 26 Jan 2021 22:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1s7vXjOb+Us5; Tue, 26 Jan 2021 22:44:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9053D204AB;
	Tue, 26 Jan 2021 22:44:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 838F3C0FA7;
	Tue, 26 Jan 2021 22:44:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2205DC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 22:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 08D0186397
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 22:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i28DN88vyeJj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 22:44:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0084.hostedemail.com
 [216.40.44.84])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C1C2C861F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 22:44:24 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 50796100E7B43;
 Tue, 26 Jan 2021 22:44:22 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: dolls97_4f0dac027592
X-Filterd-Recvd-Size: 2959
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf14.hostedemail.com (Postfix) with ESMTPA;
 Tue, 26 Jan 2021 22:44:21 +0000 (UTC)
Message-ID: <e5fcdc9ff8b165ed142340135e2124d013b79ac9.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 26 Jan 2021 14:44:20 -0800
In-Reply-To: <CABJPP5Ap2=-suEZv+6OVONBPZjLEJEszG=O5ikDxHPiCcBRbFA@mail.gmail.com>
References: <20210126183521.26535-1-dwaipayanray1@gmail.com>
 <20210126183521.26535-2-dwaipayanray1@gmail.com>
 <9bfc9c21d93bb55419954114ed3a7e5cbdc84ddb.camel@perches.com>
 <CABJPP5Ap2=-suEZv+6OVONBPZjLEJEszG=O5ikDxHPiCcBRbFA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 1/3] checkpatch: add verbose
	mode
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

On Wed, 2021-01-27 at 01:57 +0530, Dwaipayan Ray wrote:
> On Wed, Jan 27, 2021 at 1:41 AM Joe Perches <joe@perches.com> wrote:
> > On Wed, 2021-01-27 at 00:05 +0530, Dwaipayan Ray wrote:
> > > Add a new verbose mode to checkpatch.pl to emit additional verbose
> > > test descriptions.
> > > =

> > > The verbose mode is optional and can be enabled by the flag
> > > --verbose.
[]
> > > Documentation/dev-tools/checkpatch.rst:
> > > =

> > > .. CHECKPATCH_START
> > =

> > Nak on the keyword uses.
> > =

> > This should really just parse the input file whenever TYPE is found
> > via some fixed format and save the verbose description after that.
> > =

> > Use .rst Field Lists instead, and ideally, keep the list in alphabetic
> > order or group by similar use.
> > =

> > https://docutils.sourceforge.io/docs/user/rst/quickref.html#field-lists
> > =

> > e.g.:
> > =

> > :LINE_SPACING:
> > =A0=A0=A0=A0=A0=A0=A0=A0Vertical space is wasted given the limited numb=
er of lines an
> > =A0=A0=A0=A0=A0=A0=A0=A0editor window can display when multiple blank l=
ines are used.
> > =

> > :SPACING:
> > =A0=A0=A0=A0=A0=A0=A0=A0Whitespace style used in the kernel sources is =
described in
> > =A0=A0=A0=A0=A0=A0=A0=A0ref:`Documentation/process/Coding-Style.rst sec=
tion 3.1.
> > =

> > :TRAILING_WHITESPACE:
> > =A0=A0=A0=A0=A0=A0=A0=A0Trailing whitespace should always be removed.
> > =A0=A0=A0=A0=A0=A0=A0=A0Some editors highlight the trailing whitespace =
and cause visual
> > =A0=A0=A0=A0=A0=A0=A0=A0distractions when editing files.
> > =

> > etc...
[]
> for the output part can we do something to make the text
> look a bit more nice? I think some of the verbose descriptions
> can go a bit long.

Which is why verbose should be optional.

> Also will the verbose descriptions be limited to say single
> paragraphs?

Ideally, no.

> If there are multiple paragraphs then the output
> does appear a bit messy.

I fail to see how that's a problem but play with it and see what
you can do.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
