Return-Path: <SRS0=wdXo=FG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA31DC64E7C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 21:03:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C890621D91
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 21:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C890621D91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2A3C220425;
	Wed,  2 Dec 2020 21:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZmKfvQSxzSQ; Wed,  2 Dec 2020 21:03:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 32213203EA;
	Wed,  2 Dec 2020 21:03:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 157A1C163C;
	Wed,  2 Dec 2020 21:03:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF616C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 21:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CBFB420425
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 21:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLbO1BbGSOYp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 21:03:27 +0000 (UTC)
X-Greylist: delayed 00:52:51 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0023.hostedemail.com
 [216.40.44.23])
 by silver.osuosl.org (Postfix) with ESMTPS id 1A802203EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 21:03:27 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 2542118021E57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 21:03:26 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id B7ABA837F24C;
 Wed,  2 Dec 2020 21:03:23 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: kick66_3f163df273b6
X-Filterd-Recvd-Size: 2574
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Wed,  2 Dec 2020 21:03:22 +0000 (UTC)
Message-ID: <51225354b2a533250dad967ef413aaa4f41dfd66.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Wed, 02 Dec 2020 13:03:21 -0800
In-Reply-To: <20201202205740.127986-1-dwaipayanray1@gmail.com>
References: <20201202205740.127986-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add warning for
 lines starting with a '#' in commit log
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

On Thu, 2020-12-03 at 02:27 +0530, Dwaipayan Ray wrote:
> Commit log lines starting with '#' are dropped by git as comments.
> Add a check to emit a warning for these lines.
> =

> Also add a --fix option to insert a space before the leading '#' in
> such lines.
> =

> Suggested-by: Joe Perches <joe@perches.com>
> Suggested-by: Peilin Ye <yepeilin.cs@gmail.com>
> Tested-by: Peilin Ye <yepeilin.cs@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

Acked-by: Joe Perches <joe@perches.com>

> ---
> Changes in v3:
> - Modify commit message for more clarity
> - Modify warning message
> - Modify --fix option to substitute single space instead of tab
> =

> Changes in v2:
> - Modify warning message and type
> - Style fixes
> =

> =A0scripts/checkpatch.pl | 9 +++++++++
> =A01 file changed, 9 insertions(+)
> =

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index e8c1ed0b1fad..7940889877ba 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2966,6 +2966,15 @@ sub process {
> =A0			$commit_log_possible_stack_dump =3D 0;
> =A0		}
> =A0
> =

> +# Check for lines starting with a #
> +		if ($in_commit_log && $line =3D~ /^#/) {
> +			if (WARN("COMMIT_COMMENT_SYMBOL",
> +				 "Commit log lines starting with '#' are dropped by git as comments\=
n" . $herecurr) &&
> +			    $fix) {
> +				$fixed[$fixlinenr] =3D~ s/^/ /;
> +			}
> +		}
> +
> =A0# Check for git id commit length and improperly formed commit descript=
ions
> =A0		if ($in_commit_log && !$commit_log_possible_stack_dump &&
> =A0		    $line !~ /^\s*(?:Link|Patchwork|http|https|BugLink|base-commit):=
/i &&


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
