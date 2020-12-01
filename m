Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABF2C64E7A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 19:33:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E8962151B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 19:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E8962151B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E919887ED9;
	Tue,  1 Dec 2020 19:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kK5KxwFNbhfT; Tue,  1 Dec 2020 19:33:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7891787836;
	Tue,  1 Dec 2020 19:33:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5995EC163C;
	Tue,  1 Dec 2020 19:33:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04A6FC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 19:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D99FD87ED3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 19:32:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqKaPiOOROJ7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 19:32:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0017.hostedemail.com
 [216.40.44.17])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C47DB87836
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 19:32:57 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id C53F01801C63B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 19:32:56 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 4FF3D18028E7E;
 Tue,  1 Dec 2020 19:32:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: joke83_280d582273ad
X-Filterd-Recvd-Size: 3300
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Tue,  1 Dec 2020 19:32:53 +0000 (UTC)
Message-ID: <7f29e46d73c0b12ce53e659f0bcd3ec194522f2e.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Tue, 01 Dec 2020 11:32:51 -0800
In-Reply-To: <20201201190729.169733-1-dwaipayanray1@gmail.com>
References: <20201201190729.169733-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: fix TYPO_SPELLING
 check for words with apostrophe
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

On Wed, 2020-12-02 at 00:37 +0530, Dwaipayan Ray wrote:
> checkpatch reports a false TYPO_SPELLING warning for some words
> containing an apostrophe when run with --codespell option.

Thanks.
Acked-by: Joe Perches <joe@perches.com>

> =

> A false positive is "doesn't". Occurrence of the word causes
> checkpatch to emit the following warning:
> =

> "WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"
> =

> Modify the regex pattern to be more in line with the codespell
> default word matching regex. This fixes the word capture and
> avoids the false warning.
> =

> In addition, highlight the misspelled word location by adding a
> caret below the word.
> =

> Suggested-by: Joe Perches <joe@perches.com>
> Reported-by: Peilin Ye <yepeilin.cs@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
> Changes in v3:
> - Highlight misspelled word location using a caret
> =

> Changes in v2:
> - Use the default codespell word regex.
> - Modify commit message to specify --codespell usage
> =

> =A0scripts/checkpatch.pl | 7 +++++--
> =A01 file changed, 5 insertions(+), 2 deletions(-)
> =

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 3c86ea737e9c..e8c1ed0b1fad 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3106,15 +3106,18 @@ sub process {
> =A0# Check for various typo / spelling mistakes
> =A0		if (defined($misspellings) &&
> =A0		    ($in_commit_log || $line =3D~ /^(?:\+|Subject:)/i)) {
> -			while ($rawline =3D~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi=
) {
> +			while ($rawline =3D~ /(?:^|[^\w\-'`])($misspellings)(?:[^\w\-'`]|$)/g=
i) {
> =A0				my $typo =3D $1;
> +				my $blank =3D copy_spacing($rawline);
> +				my $ptr =3D substr($blank, 0, $-[1]) . "^";
> +				my $hereptr =3D "$hereline$ptr\n";
> =A0				my $typo_fix =3D $spelling_fix{lc($typo)};
> =A0				$typo_fix =3D ucfirst($typo_fix) if ($typo =3D~ /^[A-Z]/);
> =A0				$typo_fix =3D uc($typo_fix) if ($typo =3D~ /^[A-Z]+$/);
> =A0				my $msg_level =3D \&WARN;
> =A0				$msg_level =3D \&CHK if ($file);
> =A0				if (&{$msg_level}("TYPO_SPELLING",
> -						  "'$typo' may be misspelled - perhaps '$typo_fix'?\n" . $herecurr=
) &&
> +						  "'$typo' may be misspelled - perhaps '$typo_fix'?\n" . $hereptr)=
 &&
> =A0				    $fix) {
> =A0					$fixed[$fixlinenr] =3D~ s/(^|[^A-Za-z@])($typo)($|[^A-Za-z@])/$1$=
typo_fix$3/;
> =A0				}


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
