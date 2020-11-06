Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C61C4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 00:26:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 223C2206CB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 00:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 223C2206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4EF1B8203A;
	Fri,  6 Nov 2020 00:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pTDDuTPUmdxZ; Fri,  6 Nov 2020 00:26:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C4688871B5;
	Fri,  6 Nov 2020 00:26:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF937C0893;
	Fri,  6 Nov 2020 00:26:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55CB9C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 00:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3C867871B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 00:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PR7JNhzKBmSk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 00:26:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0158.hostedemail.com
 [216.40.44.158])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3979C86FC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 00:26:28 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 14936100E7B42;
 Fri,  6 Nov 2020 00:26:26 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: blow35_160a2c4272ce
X-Filterd-Recvd-Size: 3200
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf20.hostedemail.com (Postfix) with ESMTPA;
 Fri,  6 Nov 2020 00:26:24 +0000 (UTC)
Message-ID: <772993cade7e2def4ee9727255734bf9cd6d3f59.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 05 Nov 2020 16:26:23 -0800
In-Reply-To: <CABJPP5BTRtAjdNQdRCx-3HjmyJ0AnoXBzB95YiPRMoF0njOOaA@mail.gmail.com>
References: <20201105115949.39474-1-dwaipayanray1@gmail.com>
 <f83c2eeafdebc6307ee6e515e4d6652b2606a068.camel@perches.com>
 <CABJPP5BTRtAjdNQdRCx-3HjmyJ0AnoXBzB95YiPRMoF0njOOaA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Aditya Srivastava <yashsri421@gmail.com>
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

On Fri, 2020-11-06 at 02:46 +0530, Dwaipayan Ray wrote:
> > Can you send me a file with the BAD_SIGN_OFF messages generated
> > and if possible the git SHA-1s of the commits?
> Yes sure, am attaching the file for data tested on about 27k commits
> from v5.4.

Thanks.

> Excluded the duplicate signatures, tags and spacing ones for
> simplicity.
> =

> > =A0=A0=A0=A0=A024 linux-stable <stable@vger.kernel.org>
> > =A0=A0=A0=A0=A021 5.4+ <stable@vger.kernel.org>
> > =A0=A0=A0=A0=A014 All applicable <stable@vger.kernel.org>
> > =A0=A0=A0=A0=A0=A06 3.10+ <stable@vger.kernel.org>
> > =A0=A0=A0=A0=A0=A05 5.9+ <stable@vger.kernel.org>
> > =A0=A0=A0=A0=A0=A05 5.3+ <stable@vger.kernel.org>
> =

> Do I also convert these then for the fix?

Yes.

Ideally removing any case insensitive name like linux-stable or stable
and also removing any leading < or trailing > from the email address.

And the stable email address should be forced to lower case only.

Any other name should be moved as a comment after the email address
then #.

> > > Improvements to parsing:
> > > =

> > > - Detect and report unexpected content after email.
> > > - Quoted names are excluded from comment parsing.
> > > - Trailing dots or commas in email are removed during
> > > =A0=A0formatting. Correspondingly a BAD_SIGN_OFF warning
> > > =A0=A0is emitted.
> > > - Improperly quoted email like '"name <address>"' are now
> > > =A0=A0warned about.
[]
> > > +                                                     my $new_comment=
 =3D $comment;
> > > +                                                     $new_comment =
=3D~ s/^[ \(\[]+|[ \)\]]+$//g;
> > =

> > Does the comment include any leading whitespace here?
> > I presumed not given the $comment !~ /^#/ test above.
> > =

> I added it to discard empty spaces before or after the first
> brackets are unwrapped. Something like (  v5.7 ) would
> be better if translated to # v5.7. (The extra spaces would be purged).
> It just looks good :). Should I change it to keep it as it is?

No.  Converting the comment style is very sensible and a good change.
I did not understand why the regex included a space.  I do now.
I suggest changing the space to use \s in case there are tabs.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
