Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9722FC5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 20:39:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF450246C5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 20:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF450246C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4FAA287005;
	Wed, 18 Nov 2020 20:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KtkXsGBa0sJ9; Wed, 18 Nov 2020 20:39:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8283686B58;
	Wed, 18 Nov 2020 20:39:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7516AC0891;
	Wed, 18 Nov 2020 20:39:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 290FDC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0FFE985184
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4oKRhvVxF2L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:39:06 +0000 (UTC)
X-Greylist: delayed 02:24:10 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0120.hostedemail.com
 [216.40.44.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F2D248517E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:39:05 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id BA1D41801A774
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 20:39:04 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 5397E180A885F;
 Wed, 18 Nov 2020 20:39:02 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: ghost41_0b0b22e2733d
X-Filterd-Recvd-Size: 4652
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Wed, 18 Nov 2020 20:39:01 +0000 (UTC)
Message-ID: <c69f32af186d672c9370750985914b889f6a5b14.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 18 Nov 2020 12:39:00 -0800
In-Reply-To: <CABJPP5DTBkuzEjs28wufdnOXf61-T=wtoZWiTya_idXfJ92eNQ@mail.gmail.com>
References: <20201118124035.96976-1-dwaipayanray1@gmail.com>
 <457730448c84136be089748bea69abd2254e3832.camel@perches.com>
 <CABJPP5CqKjY3_mfkJEsHX_8Zc7q1TRCgA4T54sTEZBiKgPS+OQ@mail.gmail.com>
 <754e240d1c88274ce2d94a5b6dbcfff1cc8c9508.camel@perches.com>
 <CABJPP5CHofzA46FHe3eJrgjQBTcaoCkR=dc29xxK80oFZJVfoQ@mail.gmail.com>
 <12b44d3a477de314320dc9d26b26576875525f27.camel@perches.com>
 <CABJPP5DTBkuzEjs28wufdnOXf61-T=wtoZWiTya_idXfJ92eNQ@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option for
	OPEN_BRACE issues
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

On Thu, 2020-11-19 at 01:52 +0530, Dwaipayan Ray wrote:
> On Thu, Nov 19, 2020 at 1:28 AM Joe Perches <joe@perches.com> wrote:
> > On Thu, 2020-11-19 at 00:15 +0530, Dwaipayan Ray wrote:
> > > On Thu, Nov 19, 2020 at 12:09 AM Joe Perches <joe@perches.com> wrote:
> > > > On Thu, 2020-11-19 at 00:03 +0530, Dwaipayan Ray wrote:
> > > > > On Wed, Nov 18, 2020 at 11:44 PM Joe Perches <joe@perches.com> wr=
ote:
> > > > > > On Wed, 2020-11-18 at 18:10 +0530, Dwaipayan Ray wrote:
> > > > > > > Brace style misuses of the following types are now
> > > > > > > corrected:
> > > > > > []
> > > > > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > > > > []
> > > > > > > @@ -3937,9 +3937,23 @@ sub process {
> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0#print "pre<$pre_ctx>\nline<$line>\nctx<$ctx>\nnext<$lines[$ctx_ln - =
1]>\n";
> > > > > > > =

> > > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0if ($ctx !~ /{\s*/ && defined($lines[$ctx_ln - 1]) && $lines[$ctx_ln =
- 1] =3D~ /^\+\s*{/) {
> > > > > > > -                             ERROR("OPEN_BRACE",
> > > > > > > -                                   "that open brace { should=
 be on the previous line\n" .
> > > > > > > -                                     "$here\n$ctx\n$rawlines=
[$ctx_ln - 1]\n");
> > > > > > > +                             if (ERROR("OPEN_BRACE",
> > > > > > > +                                       "that open brace { sh=
ould be on the previous line\n" .
> > > > > > > +                                             "$here\n$ctx\n$=
rawlines[$ctx_ln - 1]\n") &&
> > > > > > > +                                 $fix) {
> > > > > > > +                                     my $line1 =3D $rawlines=
[$ctx_ln - 2];
> > > > > > =

> > > > > > How are you sure that in a patch context this line always start=
s with /^\+/ ?
> > > > > =

> > > > > Hi,
> > > > > I followed it from the other fixes for OPEN_BRACE which were alre=
ady
> > > > > there. In the patch context if the lines are added then only I th=
ink the fix
> > > > > should be triggered. Other instances should not be modified.
> > > > =

> > > > As far as I know there are no existing uses of --fix with OPEN_BRAC=
E.
> > > > =

> > > =

> > > I think you added it via 8d1824780f2f1 ("checkpatch: add --fix option
> > > for a couple OPEN_BRACE misuses")
> > =

> > The difference here is that you are dealing with a $stat context and
> > the existing --fix entries are just for single line fixes.
> > =

> =

> Hi,
> Ya I understand that. Though I am dealing with $stat content,
> I am also directly accessing $rawlines here.
> So I think that should have the proper patch line format, starting
> with + or - or so.
> =

> So in this case if the error is triggered, checking for /^+/ should be do=
ne
> becase it would be wrong to fix the others with /^[- ]/
> =

> Is there something else that I am not getting here?

$stat does not include lines that are skipped if the lines start with -

Patch context may be:

line	content

1		func(...
2	-	     original arguments);
3	+	     changed);

where $stat does not include the 'original arguments' changed line

	func(...,
	     changed);

but the $rawlines[] entries are consecutive.

Anyway, this needs to be handled very carefully if handled at all.

I think it's easier to avoid handling these cases and let the
patch submitter fix it manually if appropriate.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
