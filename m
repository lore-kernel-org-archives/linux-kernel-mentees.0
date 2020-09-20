Return-Path: <SRS0=4nEd=C5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C29C43463
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 17:00:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 670E920870
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 17:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 670E920870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1CCD585F5F;
	Sun, 20 Sep 2020 17:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zl_aQoBke8hb; Sun, 20 Sep 2020 17:00:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D4F2185F5B;
	Sun, 20 Sep 2020 17:00:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8661C0889;
	Sun, 20 Sep 2020 17:00:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08503C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 17:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E08BD8689D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 17:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RckMQBFn-1YG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 17:00:51 +0000 (UTC)
X-Greylist: delayed 01:33:26 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0168.hostedemail.com
 [216.40.44.168])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5DD8A81439
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 17:00:51 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id BCF1A18005B13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 16:54:37 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 1925D100E7B42;
 Sun, 20 Sep 2020 16:54:35 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: north86_030928e2713e
X-Filterd-Recvd-Size: 8245
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Sun, 20 Sep 2020 16:54:34 +0000 (UTC)
Message-ID: <52ccb41c8922dda44ac325f2f3e09f81f1936611.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 20 Sep 2020 09:54:32 -0700
In-Reply-To: <CABJPP5Chm2xd2PW77=Ru9t4C6Yvq3SyEmr1gKsaQGyF5AxRVfA@mail.gmail.com>
References: <20200920091706.56276-1-dwaipayanray1@gmail.com>
 <7958ded756c895ca614ba900aae7b830a992475e.camel@perches.com>
 <CABJPP5Chm2xd2PW77=Ru9t4C6Yvq3SyEmr1gKsaQGyF5AxRVfA@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: apw@canonical.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: extend author
 Signed-off-by check for split From: header
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

On Sun, 2020-09-20 at 21:52 +0530, Dwaipayan Ray wrote:
> On Sun, Sep 20, 2020 at 8:39 PM Joe Perches <joe@perches.com> wrote:
> > On Sun, 2020-09-20 at 14:47 +0530, Dwaipayan Ray wrote:
> > > Checkpatch did not handle cases where the author From: header
> > > was split into multiple lines. The author identity could not
> > > be resolved and checkpatch generated a false NO_AUTHOR_SIGN_OFF
> > > warning.
> > =

> I think there won't be any problem. Is my
> observation correct?

Likely true, it probably doesn't matter.
Still, I'd imagine it doesn't hurt either.

> > What I have does a bit more by saving any post-folding
> > =

> > "From: <name and email address>"
> > =

> > and comparing that to any "name and perhaps different
> > email address" in a Signed-off-by: line.
> > =

> > A new message is emitted if the name matches but the
> > email address is different.
> > =

> > Perhaps it's reasonable to apply your patch and then
> > update it with something like the below:
> > ---
> >  scripts/checkpatch.pl | 32 ++++++++++++++++++++++++++++----
> >  1 file changed, 28 insertions(+), 4 deletions(-)
> > =

> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 3e474072aa90..1ecc179e938d 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -1240,6 +1240,15 @@ sub same_email_addresses {
> >                $email1_address eq $email2_address;
> >  }
> > =

> > +sub same_email_names {
> > +       my ($email1, $email2) =3D @_;
> > +
> > +       my ($email1_name, $name1_comment, $email1_address, $comment1) =
=3D parse_email($email1);
> > +       my ($email2_name, $name2_comment, $email2_address, $comment2) =
=3D parse_email($email2);
> > +
> > +       return $email1_name eq $email2_name;
> > +}
> > +
> >  sub which {
> >         my ($bin) =3D @_;
> > =

> > @@ -2679,20 +2688,32 @@ sub process {
> >                 }
> > =

> >  # Check the patch for a From:
> > -               if (decode("MIME-Header", $line) =3D~ /^From:\s*(.*)/) {
> > +               if ($line =3D~ /^From:\s*(.*)/i) {
> >                         $author =3D $1;
> > -                       $author =3D encode("utf8", $author) if ($line =
=3D~ /=3D\?utf-8\?/i);
> > +                       my $curline =3D $linenr;
> > +                       while (defined($rawlines[$curline]) && $rawline=
s[$curline++] =3D~ /^\s(\s+)?(.*)/) {
> > +                               $author .=3D ' ' if (defined($1));
> > +                               $author .=3D "$2";
> > +                       }
> > +                       if ($author =3D~ /=3D\?utf-8\?/i) {
> > +                               $author =3D decode("MIME-Header", $auth=
or);
> > +                               $author =3D encode("utf8", $author);
> > +                       }
> > +
> >                         $author =3D~ s/"//g;
> >                         $author =3D reformat_email($author);
> >                 }
> > =

> >  # Check the patch for a signoff:
> >                 if ($line =3D~ /^\s*signed-off-by:\s*(.*)/i) {
> > +                       my $sig =3D $1;
> >                         $signoff++;
> >                         $in_commit_log =3D 0;
> >                         if ($author ne '') {
> > -                               if (same_email_addresses($1, $author)) {
> > -                                       $authorsignoff =3D 1;
> > +                               if (same_email_addresses($sig, $author)=
) {
> > +                                       $authorsignoff =3D "1";
> > +                               } elsif (same_email_names($sig, $author=
)) {
> > +                                       $authorsignoff =3D $sig;
> >                                 }
> >                         }
> >                 }
> > @@ -6937,6 +6958,9 @@ sub process {
> >                 } elsif (!$authorsignoff) {
> >                         WARN("NO_AUTHOR_SIGN_OFF",
> >                              "Missing Signed-off-by: line by nominal pa=
tch author '$author'\n");
> > +               } elsif ($authorsignoff ne "1") {
> > +                       WARN("NO_AUTHOR_SIGN_OFF",
> > +                            "From:/SoB: email address mismatch: 'From:=
 $author' !=3D 'Signed-off-by: $authorsignoff'\n");
> >                 }
> >         }
> > =

> > =

> =

> Yes, this is definitely more logical !
> I was actually hoping to talk with you on this.

Hope granted, but only via email... (smile)

> The code you sent better handles name mismatches when
> email addresses are same. But I also have found several
> such commits in which the author have signed off using
> a different email address than the one which he/she used
> to send the patch.
> =

> For example, Lukas checked commits between v5.4 and
> v5.8 and he found:
>     175 Missing Signed-off-by: line by nominal patch authorrep
>     'Daniel Vetter <daniel.vetter@ffwll.ch>'
> =

> Infact in all of those commits he signed off using a different
> mail, Daniel Vetter <daniel.vetter@intel.com>.
> =

> So is it possible to resolve these using perhaps .mailmap
> entries? Or should only the name mismatch part be better
> handled? Or perhaps both?

Dunno.  It certainly can be improved...
Try adding some more logic and see what you come up with.

btw:

The most frequent NO_AUTHOR_SIGN_OFF messages for v5.7..v5.8 are

     98 WARNING: From:/SoB: email address mismatch: 'From: Daniel Vetter <d=
aniel.vetter@ffwll.ch>' !=3D 'Signed-off-by: Daniel Vetter <daniel.vetter@i=
ntel.com>'
     24 WARNING: From:/SoB: email address mismatch: 'From: Thinh Nguyen <Th=
inh.Nguyen@synopsys.com>' !=3D 'Signed-off-by: Thinh Nguyen <thinhn@synopsy=
s.com>'
     19 WARNING: From:/SoB: email address mismatch: 'From: Wolfram Sang <ws=
a+renesas@sang-engineering.com>' !=3D 'Signed-off-by: Wolfram Sang <wsa@ker=
nel.org>'
     11 WARNING: From:/SoB: email address mismatch: 'From: Luke Nelson <luk=
enels@cs.washington.edu>' !=3D 'Signed-off-by: Luke Nelson <luke.r.nels@gma=
il.com>'
      8 WARNING: From:/SoB: email address mismatch: 'From: Christophe Leroy=
 <christophe.leroy@c-s.fr>' !=3D 'Signed-off-by: Christophe Leroy <christop=
he.leroy@csgroup.eu>'
      6 WARNING: From:/SoB: email address mismatch: 'From: Davidlohr Bueso =
<dave@stgolabs.net>' !=3D 'Signed-off-by: Davidlohr Bueso <dbueso@suse.de>'
      5 WARNING: Missing Signed-off-by: line by nominal patch author '"Paul=
 A. Clarke" <pc@us.ibm.com>'
      4 WARNING: Missing Signed-off-by: line by nominal patch author 'Huang=
 Ying <ying.huang@intel.com>'
      3 WARNING: Missing Signed-off-by: line by nominal patch author '"Step=
han M=FCller" <smueller@chronox.de>'

For the Missing Signed-off-by: lines above,
even after decoding, the email matches but
the names do not.

From: "Paul A. Clarke" <pc@us.ibm.com>
[...]
Signed-off-by: Paul Clarke <pc@us.ibm.com>

From: Huang Ying <ying.huang@intel.com>
[...]
Signed-off-by: "Huang, Ying" <ying.huang@intel.com>

From: =3D?UTF-8?q?Stephan=3D20M=3DC3=3DBCller?=3D <smueller@chronox.de>
[...]
Signed-off-by: Stephan Mueller <smueller@chronox.de>

> Also, I would like to know if there are any more changes
> required for the current patch or if it is good to go?

I think it's fine.

cheers, Joe

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
