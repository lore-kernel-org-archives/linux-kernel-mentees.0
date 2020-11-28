Return-Path: <SRS0=hNXL=FC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9406EC63777
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 18:46:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6CC8223BE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 18:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6CC8223BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7A7A78743B;
	Sat, 28 Nov 2020 18:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zStmH2bzq15i; Sat, 28 Nov 2020 18:46:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3E7A1872D3;
	Sat, 28 Nov 2020 18:46:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FF62C163C;
	Sat, 28 Nov 2020 18:46:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8915C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 18:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CF06C87321
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 18:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RLKDCQXy8jl4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 18:46:54 +0000 (UTC)
X-Greylist: delayed 02:48:51 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0109.hostedemail.com
 [216.40.44.109])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8AAF3872D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 18:46:54 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 37034180206ED;
 Sat, 28 Nov 2020 18:46:52 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: board30_171438327392
X-Filterd-Recvd-Size: 4846
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Sat, 28 Nov 2020 18:46:51 +0000 (UTC)
Message-ID: <55d38c770a3316a3c67f5380ffb8ed37540900da.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 28 Nov 2020 10:46:50 -0800
In-Reply-To: <20201128173850.66509-1-dwaipayanray1@gmail.com>
References: <20201128173850.66509-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add warning for
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

On Sat, 2020-11-28 at 23:08 +0530, Dwaipayan Ray wrote:
> Modifiers %h and %hh should never be used.
> =

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

> =A0scripts/checkpatch.pl | 16 ++++++++++++++++
> =A01 file changed, 16 insertions(+)
> =

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7dc094445d83..dc25d32f0c5f 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6027,6 +6027,22 @@ sub process {
> =A0			     "Avoid logging continuation uses where feasible\n" . $herecurr=
);
> =A0		}
> =A0
> =

> +# check for unnecessary use of %h[xudi] and %hh[xudi] in logging functio=
ns
> +		if (defined $stat &&
> +		    $line =3D~ /\b$logFunctions\s*\(/) {
> +			my $lc =3D $stat =3D~ tr@\n@@;
> +			for (my $cur_ln =3D $linenr; $cur_ln <=3D $linenr + $lc; $cur_ln++) {
> +				my $cur_rawline =3D raw_line($cur_ln, 0);
> +				while ($cur_rawline =3D~ /^\+.*\"[^\"]*(%[\d\.\*\-]*h+[idux])/g) {
> +					if (WARN("INTEGER_PROMOTION",
> +						 "Using 'h' in $1 is unnecessary\n" . "$cur_rawline\n") &&
> +					    $fix && ($cur_ln =3D=3D $linenr)) {
> +						$fixed[$fixlinenr] =3D~ s/(\"[^\"]*%[\d\.\*\-]*)h+([idux])/$1$2/;
> +					}
> +				}
> +			}
> +		}
> +

Here was what I tried:

There are uses like %#06hh", so # was addedto the format block
and multiple line uses were also inspected.


 scripts/checkpatch.pl | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7dc094445d83..b985b6b37ba8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6027,6 +6027,29 @@ sub process {
 			     "Avoid logging continuation uses where feasible\n" . $herecurr);
 		}
 =

+# check for unnecessary use of %h[xudi] and %hh[xudi] in logging functions
+		if (defined $stat &&
+		    $line =3D~ /\b$logFunctions\s*\(/ &&
+		    index($stat, '"') >=3D 0) {
+			my $lc =3D $stat =3D~ tr@\n@@;
+			$lc =3D $lc + $linenr;
+			my $stat_real =3D get_stat_real($linenr, $lc);
+			pos($stat_real) =3D index($stat_real, '"');
+			my $lineoff =3D substr($stat_real, 0, pos($stat_real)) =3D~ tr/\n//;
+			while ($stat_real =3D~ /[^"%]*(%[#\d\.\*\-]*(h+)[idux])/g) {
+				my $pspec =3D $1;
+				my $h =3D $2;
+				if (WARN("UNNECESSARY_MODIFIER",
+					 "Integer promotion: '$h' use in '$pspec' is unnecessary\n" . "$here\=
n$stat_real\n") &&
+				    $fix &&
+				    $fixed[$fixlinenr + $lineoff] =3D~ /^\+/) {
+					my $nspec =3D $pspec;
+					$nspec =3D~ s/h//g;
+					$fixed[$fixlinenr + $lineoff] =3D~ s/\Q$pspec\E/$nspec/;
+				}
+			}
+		}
+
 # check for mask then right shift without a parentheses
 		if ($perl_version_ok &&
 		    $line =3D~ /$LvalOrFunc\s*\&\s*($LvalOrFunc)\s*>>/ &&


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
