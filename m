Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B30BC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 20:48:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38A322087D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 20:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38A322087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A21F87150;
	Fri, 23 Oct 2020 20:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sxy35EO7gQBO; Fri, 23 Oct 2020 20:48:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B61738710C;
	Fri, 23 Oct 2020 20:48:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97A04C0052;
	Fri, 23 Oct 2020 20:48:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE231C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 20:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B49502079A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 20:48:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hXeIqugBWXS0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 20:48:18 +0000 (UTC)
X-Greylist: delayed 22:01:20 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0170.hostedemail.com
 [216.40.44.170])
 by silver.osuosl.org (Postfix) with ESMTPS id 8286A204C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 20:48:18 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 1AEBB18018723
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 20:42:19 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 8D97D18224D86;
 Fri, 23 Oct 2020 20:42:16 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: bite17_5c072682725c
X-Filterd-Recvd-Size: 2218
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Fri, 23 Oct 2020 20:42:15 +0000 (UTC)
Message-ID: <8710630d8c01bf6f3749e3d11d193a805f2d2048.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 23 Oct 2020 13:42:14 -0700
In-Reply-To: <2a3b90ee-b9bd-2586-9d68-45cbf7e499a9@gmail.com>
References: <20201023094307.20820-1-dwaipayanray1@gmail.com>
 <d2b05b45adbcf3f1d16692b054862a7aa7353f6d.camel@perches.com>
 <CABJPP5Dx4qj-_0gOx0bmaWvJj3okB-tNGJg5-8Y3KF2LnCjowQ@mail.gmail.com>
 <2e8279841d604dde8a3335c092db921007f6744e.camel@perches.com>
 <2a3b90ee-b9bd-2586-9d68-45cbf7e499a9@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC v2] checkpatch: extend
 attributes check to handle more patterns
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

On Sat, 2020-10-24 at 00:44 +0530, Dwaipayan Ray wrote:
> Hi,

Hi again.

> I modified the check to check the attributes from the map.
> There are two checks - one for the normal attributes and
> one for the ones with arguments, which needs just a bit more
> processing.
> =

> So attributes like __packed__ as well as those like
> __aligned__(x) are handled.
> =

> What do you think?
> =

> ---
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 $line =3D~ /__attribute__\s*\(\s*($balance=
d_parens)\s*\)/)
> {
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 my $attr =3D trim($1);
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 $attr =3D~ s/\(\s*_*(.*)\)/$1/;
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 while($attr =3D~ s/(.*)_$/$1/) {}=A0 # Rem=
ove trailing
> underscores

	I think this could be a single test like:

		while ($attr =3D~ /\s*(\w+)\s*(${balanced_parens})?/g) {
			my $curr_attr =3D $1;
			my $parens =3D $2;
			$curr_attr =3D s/^_*(.*)_*$/$1/;
			=

> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 my %attr_list =3D (
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 "alias"=A0=A0=A0 =A0=A0=A0 =A0=
=A0=A0 =3D> "__alias",
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 "aligned"=A0=A0=A0 =A0=A0=A0 =3D=
> "__aligned",

These might be better using tab alignment.

And you might special case format(printf/scanf here too


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
