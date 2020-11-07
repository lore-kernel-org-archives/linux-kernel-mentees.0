Return-Path: <SRS0=FEGG=EN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B35C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 05:09:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A8A420872
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 05:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A8A420872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 18E848668A;
	Sat,  7 Nov 2020 05:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jdubXw+ibiW; Sat,  7 Nov 2020 05:09:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 61FD286BD0;
	Sat,  7 Nov 2020 05:09:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47A1DC088B;
	Sat,  7 Nov 2020 05:09:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BAECC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 05:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C584484030
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 05:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jv5jHIxh2xWY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 05:09:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0228.hostedemail.com
 [216.40.44.228])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8B48880ECB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 05:09:46 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 44D271801C194
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 05:09:45 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id D0EC1182CED28;
 Sat,  7 Nov 2020 05:09:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: card60_151077e272d8
X-Filterd-Recvd-Size: 3142
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Sat,  7 Nov 2020 05:09:41 +0000 (UTC)
Message-ID: <8c642098bbbc92e7c56201184091a97c7b58d073.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 06 Nov 2020 21:09:39 -0800
In-Reply-To: <CABJPP5Dyc4iK-3f-N1eKF9sPZhpr6A92PA1rFo1rx+9qvO10zQ@mail.gmail.com>
References: <20201106214530.367247-1-dwaipayanray1@gmail.com>
 <38c2889ad15c0f34ce8c223518f1f6dbc9945286.camel@perches.com>
 <CABJPP5Dyc4iK-3f-N1eKF9sPZhpr6A92PA1rFo1rx+9qvO10zQ@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: improve email
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

On Sat, 2020-11-07 at 10:11 +0530, Dwaipayan Ray wrote:
> On Sat, Nov 7, 2020 at 3:34 AM Joe Perches <joe@perches.com> wrote:
> > =

> > On Sat, 2020-11-07 at 03:15 +0530, Dwaipayan Ray wrote:
> > > checkpatch doesn't report warnings for many common mistakes
> > > in emails. Some of which are trailing commas and incorrect
> > > use of email comments.
> > =

> > Assuming it all works, this looks good.  I haven't tested it.
> > =

> > How did you test the $fix bits?
> > =

> Hi,
> I actually dumped about 17k unique emails from git log, put it in one of
> my previous patches, and ran checkpatch with --fix on it.
> I checked the diff and most of the cases looked pretty good to me.
> I could send the diff output if you like?

Please.  Likely just to me as I imagine it's not interesting to most.
 =

> > Trivial notes:
> > =

> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > []
> > > +                             # stable@vger.kernel.org or stable@kern=
el.org shouldn't
> > > +                             # have an email name. In addition commm=
ents should strictly
> > > +                             # begin with a #
> > > +                             if ($email =3D~ /^.*stable\@(?:vger\.)?=
kernel\.org/) {
> > =

> > Likely better to test with a case insensitive match so
> > STABLE@vger.kernel.org and such are still warned.
> =

> Sure, I will do that.
> > =

> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0if ($email =3D~ /\bstable\@(?:vger\.)?kernel\.or=
g\b/i) {
> > =

> > > +                                     if ($sign_off =3D~ /cc:$/i && (=
($comment ne "" && $comment !~ /^#.+/) ||
> > > +                                         ($email_name ne ""))) {
> > =

> > > > $sign_off !~ /^cc:/i ?
> =

> I actually had a doubt about that one. Only the stable address with
> Cc: should be checked right? Or something else?

yes.
 =

> What about those stable addresses with tags other than Cc: ? Should
> a change be suggested?

Ideally yes, but there were very few of those in the git commit
history so it's probably not a big deal one way or another.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
