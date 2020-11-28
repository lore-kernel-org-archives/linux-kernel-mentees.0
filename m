Return-Path: <SRS0=hNXL=FC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9222C63798
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 20:15:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31CF8221FF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 20:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31CF8221FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B875220472;
	Sat, 28 Nov 2020 20:15:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VvszvaFwPkRT; Sat, 28 Nov 2020 20:15:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 32F582002F;
	Sat, 28 Nov 2020 20:15:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03787C163C;
	Sat, 28 Nov 2020 20:15:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD174C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C0F908712E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiM9Gbm4pPbN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:15:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0169.hostedemail.com
 [216.40.44.169])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 883D6870ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:15:53 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 7850E18003EFE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:08:49 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 14B37181D341E;
 Sat, 28 Nov 2020 20:08:47 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: spade01_050cf5f27393
X-Filterd-Recvd-Size: 4048
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Sat, 28 Nov 2020 20:08:45 +0000 (UTC)
Message-ID: <60fdeb69192219bfce0a0caf0ec2ea043b82100f.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Sat, 28 Nov 2020 12:08:44 -0800
In-Reply-To: <20201128200046.78739-1-dwaipayanray1@gmail.com>
References: <20201128200046.78739-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add warning for
 unnecessary use of %h[xudi] and %hh[xudi]
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

On Sun, 2020-11-29 at 01:30 +0530, Dwaipayan Ray wrote:
> Modifiers %h and %hh should never be used.

Seems OK, thanks.

Acked-by: Joe Perches <joe@perches.com>
 =

> Commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use
> of unnecessary %h[xudi] and %hh[xudi]") specifies that:
> =

> "Standard integer promotion is already done and %hx and %hhx is useless
> so do not encourage the use of %hh[xudi] or %h[xudi]."
> =

> "The "h" and "hh" things should never be used. The only reason for them
> being used if you have an "int", but you want to print it out as a
> "char" (and honestly, that is a really bad reason, you'd be better off
> just using a proper cast to make the code more obvious)."
> =

> Add a new check to emit a warning on finding an unneeded use of %h or
> %hh modifier.
> =

> Also add a fix option to the check.
> =

> Link: https://lore.kernel.org/lkml/4910042649a4f3ab22fac93191b8c1fa0a2e17=
c3.camel@perches.com/
> =

> Suggested-by: Joe Perches <joe@perches.com>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
> Changes in v4:
> - Change warning type and message
> - Use $stat_real and calculate line offset during matches
> - fix option now works for any patch line
> - # was added to format block to match %#06hh
> =

> Changes in v3:
> - Change warning message
> - Fix regex match to include capture group
> - Warn on every unnecesary use of %h on a line
> - Add fix option when the format line matches current line
> =

> Changes in v2:
> - Use $logFunctions instead of the manual list.
> - Relocate the check to after logging continuations check.
> - Remove perl_version_ok check
> =

> =

> =A0scripts/checkpatch.pl | 22 ++++++++++++++++++++++
> =A01 file changed, 22 insertions(+)
> =

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7dc094445d83..3c86ea737e9c 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6027,6 +6027,28 @@ sub process {
> =A0			     "Avoid logging continuation uses where feasible\n" . $herecurr=
);
> =A0		}
> =

> +# check for unnecessary use of %h[xudi] and %hh[xudi] in logging functio=
ns
> +		if (defined $stat &&
> +		    $line =3D~ /\b$logFunctions\s*\(/ &&
> +		    index($stat, '"') >=3D 0) {
> +			my $lc =3D $stat =3D~ tr@\n@@;
> +			$lc =3D $lc + $linenr;
> +			my $stat_real =3D get_stat_real($linenr, $lc);
> +			pos($stat_real) =3D index($stat_real, '"');
> +			while ($stat_real =3D~ /[^\"%]*(%[\#\d\.\*\-]*(h+)[idux])/g) {
> +				my $pspec =3D $1;
> +				my $h =3D $2;
> +				my $lineoff =3D substr($stat_real, 0, $-[1]) =3D~ tr@\n@@;
> +				if (WARN("UNNECESSARY_MODIFIER",
> +					 "Integer promotion: Using '$h' in '$pspec' is unnecessary\n" . "$h=
ere\n$stat_real\n") &&
> +				    $fix && $fixed[$fixlinenr + $lineoff] =3D~ /^\+/) {
> +					my $nspec =3D $pspec;
> +					$nspec =3D~ s/h//g;
> +					$fixed[$fixlinenr + $lineoff] =3D~ s/\Q$pspec\E/$nspec/;
> +				}
> +			}
> +		}
> +
> =A0# check for mask then right shift without a parentheses
> =A0		if ($perl_version_ok &&
> =A0		    $line =3D~ /$LvalOrFunc\s*\&\s*($LvalOrFunc)\s*>>/ &&


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
