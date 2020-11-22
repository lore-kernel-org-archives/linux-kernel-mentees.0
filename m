Return-Path: <SRS0=zGdC=E4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C262EC5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Nov 2020 11:33:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EECF208C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Nov 2020 11:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EECF208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B4562203FE;
	Sun, 22 Nov 2020 11:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GAtr6QbzrxAP; Sun, 22 Nov 2020 11:32:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3FF5D203A4;
	Sun, 22 Nov 2020 11:32:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 266DAC0891;
	Sun, 22 Nov 2020 11:32:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7E0FC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 11:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B2DF4203DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 11:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BweRdXBcn4dI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 11:32:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0076.hostedemail.com
 [216.40.44.76])
 by silver.osuosl.org (Postfix) with ESMTPS id 61C76203A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 11:32:56 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 3C55B248D;
 Sun, 22 Nov 2020 11:32:55 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: jelly52_1906f722735c
X-Filterd-Recvd-Size: 2531
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Sun, 22 Nov 2020 11:32:54 +0000 (UTC)
Message-ID: <368300090d93ad66f7fb19076d076d4321a04c42.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Date: Sun, 22 Nov 2020 03:32:53 -0800
In-Reply-To: <20201122111025.17978-1-yashsri421@gmail.com>
References: <1823e72eb92280d30457dda49e0a0036dee15dd3.camel@perches.com>
 <20201122111025.17978-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add fix option
	for LOGICAL_CONTINUATIONS
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

On Sun, 2020-11-22 at 16:40 +0530, Aditya Srivastava wrote:
> Currently, checkpatch warns if logical continuations are placed at the
> start of a line and not at the end of previous line.
> =

> E.g., running checkpatch on commit 3485507fc272 ("staging:
> bcm2835-camera: Reduce length of enum names") reports:
> =

> CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the
> previous line
> +	if (!ret
> +	    && camera_port =3D=3D
> =

> Provide a simple fix by adding logical operator at the end of previous
> line and removing from current line, if both the lines are additions
> (ie start with '+')

Not quite yet.

> changes in v5: improve regex for comment and line end with '$;'
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3553,8 +3553,17 @@ sub process {
> =A0
> =

> =A0# check for && or || at the start of a line
> =A0		if ($rawline =3D~ /^\+\s*(&&|\|\|)/) {
> -			CHK("LOGICAL_CONTINUATIONS",
> -			    "Logical continuations should be on the previous line\n" . $herep=
rev);
> +			my $operator =3D $1;
> +			if (CHK("LOGICAL_CONTINUATIONS",
> +				"Logical continuations should be on the previous line\n" . $hereprev=
) &&
> +			    $fix && $prevrawline =3D~ /^\+/) {
> +				# add logical operator to the previous line, remove from current line
> +				if ($prevline =3D~ /[\s$;]*$/) {

This if is misleading as it will always match at least the EOL

> +					my $line_end =3D substr($prevrawline, $-[0]);
> +					$fixed[$fixlinenr - 1] =3D~ s/\Q$line_end\E/ $operator$line_end/;

It makes it seem as if this part is only done when the test is true.
The test is always true.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
