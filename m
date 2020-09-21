Return-Path: <SRS0=KrtX=C6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1874C43464
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 09:48:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 483A021789
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 09:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 483A021789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DE6FA85F8E;
	Mon, 21 Sep 2020 09:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSBvbGbkbmfb; Mon, 21 Sep 2020 09:48:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1E33585EC0;
	Mon, 21 Sep 2020 09:48:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EB15C0889;
	Mon, 21 Sep 2020 09:48:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54F18C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 09:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 35439870FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 09:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0zQkgeuCV-yx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 09:48:04 +0000 (UTC)
X-Greylist: delayed 18:30:38 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0064.hostedemail.com
 [216.40.44.64])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0ED7F870FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 09:48:04 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 1A34C180275BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 09:48:02 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 62019182251A2;
 Mon, 21 Sep 2020 09:47:59 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: wind22_0914db627144
X-Filterd-Recvd-Size: 3631
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Mon, 21 Sep 2020 09:47:58 +0000 (UTC)
Message-ID: <984edba5dae45d5b5a9b8381f6164423380037d7.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 21 Sep 2020 02:47:57 -0700
In-Reply-To: <alpine.DEB.2.21.2009210921520.7483@felia>
References: <20200920091706.56276-1-dwaipayanray1@gmail.com>
 <7958ded756c895ca614ba900aae7b830a992475e.camel@perches.com>
 <CABJPP5Chm2xd2PW77=Ru9t4C6Yvq3SyEmr1gKsaQGyF5AxRVfA@mail.gmail.com>
 <52ccb41c8922dda44ac325f2f3e09f81f1936611.camel@perches.com>
 <alpine.DEB.2.21.2009210921520.7483@felia>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: apw@canonical.com, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On Mon, 2020-09-21 at 09:39 +0200, Lukas Bulwahn wrote:
> On Sun, 20 Sep 2020, Joe Perches wrote:
> > On Sun, 2020-09-20 at 21:52 +0530, Dwaipayan Ray wrote:
[]
> > > For example, Lukas checked commits between v5.4 and
> > > v5.8 and he found:
> > >     175 Missing Signed-off-by: line by nominal patch authorrep
> > >     'Daniel Vetter <daniel.vetter@ffwll.ch>'
> > > =

> > > Infact in all of those commits he signed off using a different
> > > mail, Daniel Vetter <daniel.vetter@intel.com>.
> > > =

> > > So is it possible to resolve these using perhaps .mailmap
> > > entries? Or should only the name mismatch part be better
> > > handled? Or perhaps both?
> > =

> > Dunno.  It certainly can be improved...
> > Try adding some more logic and see what you come up with.
> > =

> > btw:
> > =

> > The most frequent NO_AUTHOR_SIGN_OFF messages for v5.7..v5.8 are
> > =

> >      98 WARNING: From:/SoB: email address mismatch: 'From: Daniel Vette=
r <daniel.vetter@ffwll.ch>' !=3D 'Signed-off-by: Daniel Vetter <daniel.vett=
er@intel.com>'
> >      24 WARNING: From:/SoB: email address mismatch: 'From: Thinh Nguyen=
 <Thinh.Nguyen@synopsys.com>' !=3D 'Signed-off-by: Thinh Nguyen <thinhn@syn=
opsys.com>'
> >      19 WARNING: From:/SoB: email address mismatch: 'From: Wolfram Sang=
 <wsa+renesas@sang-engineering.com>' !=3D 'Signed-off-by: Wolfram Sang <wsa=
@kernel.org>'
> >      11 WARNING: From:/SoB: email address mismatch: 'From: Luke Nelson =
<lukenels@cs.washington.edu>' !=3D 'Signed-off-by: Luke Nelson <luke.r.nels=
@gmail.com>'
> >       8 WARNING: From:/SoB: email address mismatch: 'From: Christophe L=
eroy <christophe.leroy@c-s.fr>' !=3D 'Signed-off-by: Christophe Leroy <chri=
stophe.leroy@csgroup.eu>'
> >       6 WARNING: From:/SoB: email address mismatch: 'From: Davidlohr Bu=
eso <dave@stgolabs.net>' !=3D 'Signed-off-by: Davidlohr Bueso <dbueso@suse.=
de>'
> >       5 WARNING: Missing Signed-off-by: line by nominal patch author '"=
Paul A. Clarke" <pc@us.ibm.com>'
> >       4 WARNING: Missing Signed-off-by: line by nominal patch author 'H=
uang Ying <ying.huang@intel.com>'
> >       3 WARNING: Missing Signed-off-by: line by nominal patch author '"=
Stephan M=FCller" <smueller@chronox.de>'
[]
> I hope Dwaipayan can come up with a '.AUTHOR_SIGN_OFF.mailmap' file that =

> we can use to distinguish the known developers that knowingly and =

> intentionally use different identities vs. the 'newbies' that should =

> validly be warned.

I hope not.  One .mailmap should be enough.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
