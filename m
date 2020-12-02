Return-Path: <SRS0=wdXo=FG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83278C6369E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 20:10:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C61192222F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 20:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C61192222F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6569287A3C;
	Wed,  2 Dec 2020 20:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ct-2CE31qB-4; Wed,  2 Dec 2020 20:10:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5864F87A29;
	Wed,  2 Dec 2020 20:10:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41CE7C163C;
	Wed,  2 Dec 2020 20:10:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B392C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 20:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 32CED1FEED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 20:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRg48PNqH0XB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 20:10:39 +0000 (UTC)
X-Greylist: delayed 02:53:59 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0080.hostedemail.com
 [216.40.44.80])
 by silver.osuosl.org (Postfix) with ESMTPS id 4EDB91FCA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 20:10:39 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 4EF3418034ABC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 20:10:37 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id D1CEE181D337B;
 Wed,  2 Dec 2020 20:10:34 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: teeth55_5c01c8d273b5
X-Filterd-Recvd-Size: 3695
Received: from [192.168.1.142] (unknown [172.58.19.39])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Wed,  2 Dec 2020 20:10:33 +0000 (UTC)
Message-ID: <f6db65a7f3744b35da84d7d4be77b2f89da1102a.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 02 Dec 2020 12:10:29 -0800
In-Reply-To: <CABJPP5DSEb5G6G1O1Gvga_E3bT0DftTp6qcgh4RPSKL8cfus-Q@mail.gmail.com>
References: <20201202101448.8494-1-dwaipayanray1@gmail.com>
 <CABJPP5DSEb5G6G1O1Gvga_E3bT0DftTp6qcgh4RPSKL8cfus-Q@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for
 lines starting with a '#' in commit log
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

On Thu, 2020-12-03 at 01:30 +0530, Dwaipayan Ray wrote:
> On Wed, Dec 2, 2020 at 3:45 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wr=
ote:
> > =

> > Commit log lines starting with a '#' can be dropped by git if
> > the corresponding commit message is reworded by a maintainer.
> > This minor error can be easily avoided if checkpatch warns
> > for the same.
> > =

> > Add a new check which emits a warning on finding lines starting
> > with a '#'. Also add a quick fix by adding a tab in front of
> > such lines.
> > =

> > Suggested-by: Peilin Ye <yepeilin.cs@gmail.com>
> > Tested-by: Peilin Ye <yepeilin.cs@gmail.com>
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> > =A0scripts/checkpatch.pl | 9 +++++++++
> > =A01 file changed, 9 insertions(+)
> > =

> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index e8c1ed0b1fad..a12edcf4f63a 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2966,6 +2966,15 @@ sub process {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0$commit_log_possible_stack_dump =3D 0;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > =

> > +# Check for lines starting with a #
> > +               if ($in_commit_log && $line =3D~ /^#/) {
> > +                       if (WARN("POSSIBLE_IGNORED_LINE",
> > +                                "Commit log lines starting with a '#' =
might be dropped by git.\n" . $herecurr)
> > +                           && $fix) {
> > +                               $fixed[$fixlinenr] =3D~ s/^#/\t#/;
> > +                       }
> > +               }
> > +
> > =A0# Check for git id commit length and improperly formed commit descri=
ptions
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if ($in_commit_log && !=
$commit_log_possible_stack_dump &&
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0$line !~ /^=
\s*(?:Link|Patchwork|http|https|BugLink|base-commit):/i &&
> > --
> > 2.27.0
> > =

> Hi,
> This patch may seem trivial but I wanted to send it to you for review
> nevertheless.
> =

> Peilin had earlier faced this problem in one of his patches which was
> mainlined. There were some '#define' lines in the commit log. Due to
> some reason the Maintainer had to reword the commit message, and
> ultimately those '#define' lines were lost in the tree that was merged.
> =

> I am not sure if it would be exactly helpful for regular committers but f=
or
> new contributers it might be nice to avoid such a mistake. Do you think
> it deserves inclusion in checkpatch?

Even regular committers face this.

Please fix the && $fix so that the && is at EOL and change the
'might be dropped' to 'will be dropped by git as a comment' and
remove the period.

"POSSIBLE_IGNORED_LINE" could be something like "COMMIT_COMMENT_SYMBOL".


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
