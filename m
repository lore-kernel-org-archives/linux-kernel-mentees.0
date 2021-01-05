Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C44C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 12:06:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3D2422A84
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 12:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3D2422A84
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0022D21537;
	Tue,  5 Jan 2021 12:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKQKKAA-CZBY; Tue,  5 Jan 2021 12:05:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 67B6A21515;
	Tue,  5 Jan 2021 12:05:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42698C0891;
	Tue,  5 Jan 2021 12:05:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8FB0C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 12:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C24212150A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 12:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6KAx1ZCJ-khd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 12:05:54 +0000 (UTC)
X-Greylist: delayed 00:39:58 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0130.hostedemail.com
 [216.40.44.130])
 by silver.osuosl.org (Postfix) with ESMTPS id 98CA51FF59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 12:05:54 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 620251801BE25
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:49:12 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 3089818225E0E;
 Tue,  5 Jan 2021 10:49:10 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: grip88_2400adf274d8
X-Filterd-Recvd-Size: 2242
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf10.hostedemail.com (Postfix) with ESMTPA;
 Tue,  5 Jan 2021 10:49:08 +0000 (UTC)
Message-ID: <120df949b3071bdde9c554451130d736eb1fa60c.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: David Laight <David.Laight@ACULAB.COM>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>
Date: Tue, 05 Jan 2021 02:49:07 -0800
In-Reply-To: <027501cb2506426d9c05adf56d002781@AcuMS.aculab.com>
References: <20210105093507.29297-1-dwaipayanray1@gmail.com>
 <cf102ac77eb1f9e6424f30aef835f6c61dd03407.camel@perches.com>
 <027501cb2506426d9c05adf56d002781@AcuMS.aculab.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix unescaped left
	braces
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

On Tue, 2021-01-05 at 10:35 +0000, David Laight wrote:
> From: Joe Perches
> > Sent: 05 January 2021 10:01
> > =

> > On Tue, 2021-01-05 at 15:05 +0530, Dwaipayan Ray wrote:
> > > Perl 5.22 onwards require that "A literal "{" should now be
> > > escaped in a pattern".
> =

> Sounds like a good reason to never use perl :-)
> =

> > Not quite correct.
> > =

> > > checkpatch contains several literal "{". Fix such instances
> > > by preceding them with a backslash.
> > =

> > Not all literal left braces need to be escaped.
> > https://www.perlmonks.org/?node_id=3D1191981
> > =

> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > []
> > > @@ -2036,7 +2036,7 @@ sub annotate_values {
> > > =A0			print "ASSIGN($1)\n" if ($dbg_values > 1);
> > > =A0			$type =3D 'N';
> > > =

> > > =

> > > -		} elsif ($cur =3D~/^(;|{|})/) {
> > > +		} elsif ($cur =3D~ /^(;|\{|\})/) {
> =

> isn't (;|{|}) much the same as [;{}] ??

Yes, but without the capture, so /^([;{}])/ would be the same.

I presume the | style was used for consistency with other uses
in the same block.

Andy Whitcroft wrote that bit a long time ago.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
