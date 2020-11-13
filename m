Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E6AC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 15:11:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F233C2225F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 15:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F233C2225F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9DBDF874DC;
	Fri, 13 Nov 2020 15:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ciftEljAVpYv; Fri, 13 Nov 2020 15:10:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D485987290;
	Fri, 13 Nov 2020 15:10:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFE34C0FAA;
	Fri, 13 Nov 2020 15:10:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52744C088E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3FB6987568
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Z6pGvdiln57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:10:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0138.hostedemail.com
 [216.40.44.138])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 19E1487534
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:10:54 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id B05D51800454E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 15:00:56 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 2E6B412F8;
 Fri, 13 Nov 2020 15:00:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: wind95_1816c962730f
X-Filterd-Recvd-Size: 2748
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Fri, 13 Nov 2020 15:00:52 +0000 (UTC)
Message-ID: <3a0455c93dfd6749cf2050dd973c5bee1cc9f237.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 13 Nov 2020 07:00:50 -0800
In-Reply-To: <20201113135739.46776-1-dwaipayanray1@gmail.com>
References: <20201113135739.46776-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix typo and remove
	duplicate word
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

On Fri, 2020-11-13 at 19:27 +0530, Dwaipayan Ray wrote:
> Delete repeated word in scripts/checkpatch.pl:
> "are are" -> "are"
> =

> Fix typos:
> "commments" -> "comments"
> "falsly" -> "falsely"
> =

> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---

style: this should have subject prefix:

"[PATCH V2] checkpatch: Fix spelling errors and remove repeated word"

And here below the --- line you should add a V2 changelog like:

o Add correction for falsly

Other than that, you might consider sending a V3 just to get
used the proper patch resubmission form but thanks.

> =A0scripts/checkpatch.pl | 6 +++---
> =A01 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 2749f32dffe9..041b82f6669e 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2841,7 +2841,7 @@ sub process {
> =A0
> =

> =A0
> =

> =A0				# stable@vger.kernel.org or stable@kernel.org shouldn't
> -				# have an email name. In addition commments should strictly
> +				# have an email name. In addition comments should strictly
> =A0				# begin with a #
> =A0				if ($email =3D~ /^.*stable\@(?:vger\.)?kernel\.org/i) {
> =A0					if (($comment ne "" && $comment !~ /^#.+/) ||
> @@ -5000,7 +5000,7 @@ sub process {
> =A0## 		    $line !~ /^.\s*$Type\s+$Ident(?:\s*=3D[^,{]*)?\s*,\s*$Type\s*=
$Ident.*/) {
> =A0##
> =A0## 			# Remove any bracketed sections to ensure we do not
> -## 			# falsly report the parameters of functions.
> +## 			# falsely report the parameters of functions.
> =A0## 			my $ln =3D $line;
> =A0## 			while ($ln =3D~ s/\([^\(\)]*\)//g) {
> =A0## 			}
> @@ -7109,7 +7109,7 @@ sub process {
> =A0		exit(0);
> =A0	}
> =A0
> =

> -	# This is not a patch, and we are are in 'no-patch' mode so
> +	# This is not a patch, and we are in 'no-patch' mode so
> =A0	# just keep quiet.
> =A0	if (!$chk_patch && !$is_patch) {
> =A0		exit(0);


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
