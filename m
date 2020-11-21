Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F85C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 18:34:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D7D5221FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 18:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D7D5221FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9CA0820457;
	Sat, 21 Nov 2020 18:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKhFKl9aA-q0; Sat, 21 Nov 2020 18:34:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 167B820445;
	Sat, 21 Nov 2020 18:34:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6E78C1825;
	Sat, 21 Nov 2020 18:34:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B5B5C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 18:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 21208868C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 18:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJ3-Jv07l9uk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 18:34:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0064.hostedemail.com
 [216.40.44.64])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 35E3285249
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 18:34:39 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 1BB7F1801ABF7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 18:34:37 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 1C9F4180A7FC6;
 Sat, 21 Nov 2020 18:34:34 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: debt62_00182dd27356
X-Filterd-Recvd-Size: 2878
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf10.hostedemail.com (Postfix) with ESMTPA;
 Sat, 21 Nov 2020 18:34:33 +0000 (UTC)
Message-ID: <a6ee46ce01747627196478ff2a965d48dd4eed73.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Date: Sat, 21 Nov 2020 10:34:31 -0800
In-Reply-To: <20201121181357.7621-1-yashsri421@gmail.com>
References: <d68afd4b87e2ce3fc846d8ca5ab9a401ce04344a.camel@perches.com>
 <20201121181357.7621-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix option
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

On Sat, 2020-11-21 at 23:43 +0530, Aditya Srivastava wrote:
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
> =

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> changes in v2: quote $operator at substitution
> =

> changes in v3: add a check for previous line ending with comment;
> If so, insert $operator at the last non-comment, non-whitespace char of t=
he previous line
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3553,8 +3553,22 @@ sub process {
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
> +				# if last line ends with a comment
> +				if ($prevrawline =3D~ /(\/\/.*)$/) {

Not the best mechanism.

check $prevline =3D~ /[\s$;]*$/ and use the starting position of any
match as the insertion point, and then insert the operator and
matching bits from the $prevrawline.

I'll leave that as an exercise for you for now.

> +					my $comment =3D trim($1);
> +					$fixed[$fixlinenr - 1] =3D~ s/\s*$comment//;
> +					$fixed[$fixlinenr - 1] .=3D " $operator $comment";


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
