Return-Path: <SRS0=R4Bt=FA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76929C6379D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 09:28:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A75602173E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 09:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A75602173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 54AF887270;
	Thu, 26 Nov 2020 09:28:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2EShprGt0KS; Thu, 26 Nov 2020 09:28:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AFCC48726A;
	Thu, 26 Nov 2020 09:28:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A9FBC0891;
	Thu, 26 Nov 2020 09:28:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B51DC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 09:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 74C9120377
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 09:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gtsfb-7NFh+d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 09:28:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0017.hostedemail.com
 [216.40.44.17])
 by silver.osuosl.org (Postfix) with ESMTPS id 498452E1F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 09:28:20 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id EF36F182CF666;
 Thu, 26 Nov 2020 09:28:17 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: snake52_100d3822737e
X-Filterd-Recvd-Size: 3167
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Thu, 26 Nov 2020 09:28:16 +0000 (UTC)
Message-ID: <dbc8d300b4b53dfc3e62d0400d58865e6d3c14f8.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 26 Nov 2020 01:28:15 -0800
In-Reply-To: <20201126084623.39178-1-dwaipayanray1@gmail.com>
References: <20201126084623.39178-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add warning for
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

On Thu, 2020-11-26 at 14:16 +0530, Dwaipayan Ray wrote:
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

> Link: https://lore.kernel.org/lkml/4910042649a4f3ab22fac93191b8c1fa0a2e17=
c3.camel@perches.com/
> =

> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
> Changes in v2:
> - Use $logFunctions instead of the manual list.
> - Relocate the check to after logging continuations check.
> - Remove perl_version_ok condition which is unneeded here.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -6027,6 +6027,18 @@ sub process {
> =A0			     "Avoid logging continuation uses where feasible\n" . $herecurr=
);
> =A0		}
> =

> +# check for unnecessary use of %h[xudi] and %hh[xudi] in logging functio=
ns
> +		if (defined $stat &&
> +		    $line =3D~ /\b$logFunctions\s*\(/) {
> +			my $lc =3D $stat =3D~ tr@\n@@;
> +			$lc =3D $lc + $linenr;
> +			my $stat_real =3D get_stat_real($linenr, $lc);
> +			if ($stat_real =3D~ /\"[^\"]*%[\d\.\*\-]*h+[idux].*\"/i) {
> +				WARN("UNNECESSARY_MODIFIER",
> +				     "Unnecessary use of modifiers %h[xudi] or %hh[xudi]\n" . "$here=
\n$stat_real\n");

o Why not capture the group and show the actual integer format portion here?
  (%[\d\.\*\-]*h+[idux])
o This might also show every unnecessary use of %h. (using while (.../g)
o The .*\" isn't useful.
o The /i is probably wrong.
o Perhaps this could use a --fix line if the format is on the same line
  as $logFunctions
o Perhaps the message should say something about integer promotion.
  Maybe something like:
  "Integer promotion: using 'h' in '$1' is unnecessary\n"



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
