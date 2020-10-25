Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59EDC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 17:59:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D5621707
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 17:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11D5621707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 783322042B;
	Sun, 25 Oct 2020 17:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5owNAbDpIVrH; Sun, 25 Oct 2020 17:59:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1D96D20423;
	Sun, 25 Oct 2020 17:59:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9EE5C088B;
	Sun, 25 Oct 2020 17:59:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66A6FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 17:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 543938720A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 17:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRTQCb9mx-NC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 17:59:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0198.hostedemail.com
 [216.40.44.198])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 65DCF87208
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 17:59:12 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 2D00418224D61;
 Sun, 25 Oct 2020 17:59:11 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: nest53_241321d2726c
X-Filterd-Recvd-Size: 2513
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Sun, 25 Oct 2020 17:59:10 +0000 (UTC)
Message-ID: <52f88d0bb938c5063ede693a05bf64961af5a496.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 25 Oct 2020 10:59:09 -0700
In-Reply-To: <20201025101537.59133-1-dwaipayanray1@gmail.com>
References: <20201025101537.59133-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: extend attributes
 check to handle more patterns
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

On Sun, 2020-10-25 at 15:45 +0530, Dwaipayan Ray wrote:
> It is generally preferred that the macros from
> include/linux/compiler_attributes.h are used, unless there
> is a reason not to.
> =

> checkpatch currently checks __attribute__ for each of
> packed, aligned, section, printf, scanf, and weak. Other
> declarations in compiler_attributes.h are not handled.
> =

> Add a generic test to check the presence of such attributes.
> Some attributes require more specific handling and are kept
> separate.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -6155,50 +6155,95 @@ sub process {
> =A0			}
> =A0		}
> =A0
> =

> -# Check for __attribute__ packed, prefer __packed
> +# Check for compiler attributes
> =A0		if ($realfile !~ m@\binclude/uapi/@ &&
> -		    $line =3D~ /\b__attribute__\s*\(\s*\(.*\bpacked\b/) {
> -			WARN("PREFER_PACKED",
> -			     "__packed is preferred over __attribute__((packed))\n" . $herecu=
rr);
> -		}
> +		    $rawline =3D~ /\b__attribute__\s*\(\s*($balanced_parens)\s*\)/) {

Using $rawline would also change comments and that seems wrong.
Any reason to use $rawline instead of $line?

[]

> +			if (scalar @conv_array > 0 && $conv_possible =3D=3D 1) {
> +				my $replace =3D join(' ', @conv_array);
> +				if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> +				         "$replace is preferred over __attribute__(($attr))\n" . $he=
recurr) &&
> +					$fix) {
> +					$fixed[$fixlinenr] =3D~ s/\b__attribute__\s*\(\s*\(\s*\Q$attr\E\s*\=
)\s*\)/$replace/;

I looks it would be useful to add
					$fixed[$fixlinenr] =3D~ s/\}\Q$replace\E/} $replace/;
so there's a space added between } and any replacements.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
