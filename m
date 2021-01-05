Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291A4C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 10:37:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8F3D2222A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 10:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8F3D2222A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 61CC685C28;
	Tue,  5 Jan 2021 10:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8o27A4dpUOJK; Tue,  5 Jan 2021 10:37:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DFD5485579;
	Tue,  5 Jan 2021 10:37:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7536C088B;
	Tue,  5 Jan 2021 10:37:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 954BCC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8D27C85C28
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FcC-leFebhZy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:37:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0080.hostedemail.com
 [216.40.44.80])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7AFE185579
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:37:45 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 9030018016678
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:37:43 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 2516D182CF66C;
 Tue,  5 Jan 2021 10:37:41 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: watch31_3a0e7d1274d8
X-Filterd-Recvd-Size: 3854
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Tue,  5 Jan 2021 10:37:38 +0000 (UTC)
Message-ID: <834383f004e107752d21ca8331add97808b3719d.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Tue, 05 Jan 2021 02:37:37 -0800
In-Reply-To: <20210105103044.40282-1-dwaipayanray1@gmail.com>
References: <20210105103044.40282-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: trivial style fixes
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

On Tue, 2021-01-05 at 16:00 +0530, Dwaipayan Ray wrote:
> Indentations should use tabs wherever possible.
> Replace spaces by tabs for indents.

Thanks.

Acked-by: Joe Perches <joe@perches.com>

> =

> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
> =A0scripts/checkpatch.pl | 18 +++++++++---------
> =A01 file changed, 9 insertions(+), 9 deletions(-)
> =

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index e6857bdfcb2d..7a323ca8a177 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2974,7 +2974,7 @@ sub process {
> =A0				}
> =A0				if (!defined $lines[$linenr]) {
> =A0					WARN("BAD_SIGN_OFF",
> -                                             "Co-developed-by: must be i=
mmediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
> +					     "Co-developed-by: must be immediately followed by Signed-off-b=
y:\n" . "$here\n" . $rawline);
> =A0				} elsif ($rawlines[$linenr] !~ /^\s*signed-off-by:\s*(.*)/i) {
> =A0					WARN("BAD_SIGN_OFF",
> =A0					     "Co-developed-by: must be immediately followed by Signed-off=
-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
> @@ -2997,8 +2997,8 @@ sub process {
> =A0			if (ERROR("GERRIT_CHANGE_ID",
> =A0			          "Remove Gerrit Change-Id's before submitting upstream\n" =
. $herecurr) &&
> =A0			    $fix) {
> -                                fix_delete_line($fixlinenr, $rawline);
> -                        }
> +				fix_delete_line($fixlinenr, $rawline);
> +			}
> =A0		}
> =A0
> =

> =A0# Check if the commit log is in a possible stack dump
> @@ -3240,10 +3240,10 @@ sub process {
> =A0				next if ($start_char =3D~ /^\S$/);
> =A0				next if (index(" \t.,;?!", $end_char) =3D=3D -1);
> =A0
> =

> -                                # avoid repeating hex occurrences like '=
ff ff fe 09 ...'
> -                                if ($first =3D~ /\b[0-9a-f]{2,}\b/i) {
> -                                        next if (!exists($allow_repeated=
_words{lc($first)}));
> -                                }
> +				# avoid repeating hex occurrences like 'ff ff fe 09 ...'
> +				if ($first =3D~ /\b[0-9a-f]{2,}\b/i) {
> +					next if (!exists($allow_repeated_words{lc($first)}));
> +				}
> =A0
> =

> =A0				if (WARN("REPEATED_WORD",
> =A0					 "Possible repeated word: '$first'\n" . $herecurr) &&
> @@ -4432,7 +4432,7 @@ sub process {
> =A0			WARN("STATIC_CONST_CHAR_ARRAY",
> =A0			     "char * array declaration might be better as static const\n" .
> =A0				$herecurr);
> -               }
> +		}
> =A0
> =

> =A0# check for sizeof(foo)/sizeof(foo[0]) that could be ARRAY_SIZE(foo)
> =A0		if ($line =3D~ m@\bsizeof\s*\(\s*($Lval)\s*\)@) {
> @@ -5285,7 +5285,7 @@ sub process {
> =A0		    $lines[$linenr - 3] !~ /^[ +]\s*$Ident\s*:/) {
> =A0			WARN("RETURN_VOID",
> =A0			     "void function return statements are not generally useful\n" .=
 $hereprev);
> -               }
> +		}
> =A0
> =

> =A0# if statements using unnecessary parentheses - ie: if ((foo =3D=3D ba=
r))
> =A0		if ($perl_version_ok &&


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
