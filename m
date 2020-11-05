Return-Path: <SRS0=u7S/=EL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB31BC4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Nov 2020 17:41:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEF4B206CA
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Nov 2020 17:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEF4B206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6D2E285B0A;
	Thu,  5 Nov 2020 17:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4t1NdsXEe1L; Thu,  5 Nov 2020 17:41:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 166A585AB5;
	Thu,  5 Nov 2020 17:41:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00725C088B;
	Thu,  5 Nov 2020 17:41:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FC2EC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 17:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F1FDC865D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 17:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAY7OBApzJS1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 17:41:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0164.hostedemail.com
 [216.40.44.164])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 518C2866E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 17:41:23 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 33611180275DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Nov 2020 17:41:21 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id A4EDD182233F3;
 Thu,  5 Nov 2020 17:41:18 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: vase31_190ca99272cb
X-Filterd-Recvd-Size: 5912
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Thu,  5 Nov 2020 17:41:17 +0000 (UTC)
Message-ID: <f83c2eeafdebc6307ee6e515e4d6652b2606a068.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, stable@vger.kernel.org, Greg KH
 <gregkh@linuxfoundation.org>
Date: Thu, 05 Nov 2020 09:41:15 -0800
In-Reply-To: <20201105115949.39474-1-dwaipayanray1@gmail.com>
References: <20201105115949.39474-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: improve email
	parsing
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

(adding stable and Greg KH for additional review)
On Thu, 2020-11-05 at 17:29 +0530, Dwaipayan Ray wrote:
> checkpatch doesn't report warnings for many common mistakes
> in emails. Some of which are trailing commas and incorrect
> use of email comments.

I presume you've tested this against the git tree.

Can you send me a file with the BAD_SIGN_OFF messages generated
and if possible the git SHA-1s of the commits?

> At the same time several false positives are reported due to
> incorrect handling of mail comments. The most common of which
> is due to the pattern:
> =

> <stable@vger.kernel.org> # X.X
> =

> Improve email parsing in checkpatch.
> =

> Some general comment rules are defined:
> =

> - Multiple name comments should not be allowed.
> - Comments inside address should not be allowed.
> - In general comments should be enclosed within parentheses.
> =A0=A0Exception for stable@vger.kernel.org # X.X

not just vger.kernel.org, but this should also allow stable@kernel.org
and only allow cc: and not any other -by: type for that email address.

A process preference question for Greg and the stable team:

The most common stable forms are

	stable@vger.kernel.org # version info
then
	stable@vger.kernel.org [ version info ]

with some other relatively infrequently used outlier styles, some
that use parentheses, but this is not frequent.

It might be sensible to standardize on the "# version info" trailer
comment version info style and warn on any other form.

A somewhat common style for the stable address is to use a name
before the stable address which describes the version info:

Perhaps any name before stable should be warned and the version
should be a comment.

Here's a list of the stable addresses with "version name" then
stable address in the git tree and other outlier styles.

     24 linux-stable <stable@vger.kernel.org>
     21 5.4+ <stable@vger.kernel.org>
     14 All applicable <stable@vger.kernel.org>
      6 3.10+ <stable@vger.kernel.org>
      5 5.9+ <stable@vger.kernel.org>
      5 5.3+ <stable@vger.kernel.org>
      5 5.1+ <stable@vger.kernel.org>
      4 5.6+ <stable@vger.kernel.org>
      4 4.20+ <stable@vger.kernel.org>
      3 Stable Team <stable@vger.kernel.org>
      3 4.19+ <stable@vger.kernel.org>
      3 4.15+ <stable@vger.kernel.org>
      3 4.10+ <stable@vger.kernel.org>
      2 stable@vger.kernel.org (v2.6.12+)
      2 5.2+ <stable@vger.kernel.org>
      2 4.16+ <stable@vger.kernel.org>
      1 v5.8+ <stable@vger.kernel.org>
      1 v5.7+ <stable@vger.kernel.org>
      1 v5.6+ <stable@vger.kernel.org>
      1 v5.3+ <stable@vger.kernel.org>
      1 v5.0+ <stable@vger.kernel.org>
      1 v4.9+ <stable@vger.kernel.org>
      1 <stable@vger.kernel.org> v5.0+
      1 <stable@vger.kernel.org> +v4.18
      1 stable@vger.kernel.org (3.14+)
      1 5.8+ <stable@vger.kernel.org>
      1 5.5+ <stable@vger.kernel.org>
      1 5.0+ <stable@vger.kernel.org>
      1 4.18+ <stable@vger.kernel.org>
      1 4.14+ <stable@vger.kernel.org>
      1 4.13+ <stable@vger.kernel.org>
      1 4.0+ <stable@vger.kernel.org>
      1 3.15+ <stable@vger.kernel.org>
      1 3.11+ <stable@vger.kernel.org>

> Improvements to parsing:
> =

> - Detect and report unexpected content after email.
> - Quoted names are excluded from comment parsing.
> - Trailing dots or commas in email are removed during
> =A0=A0formatting. Correspondingly a BAD_SIGN_OFF warning
> =A0=A0is emitted.
> - Improperly quoted email like '"name <address>"' are now
> =A0=A0warned about.

All of the above seems right but perhaps the comment style for any
<foo>-by: lines should also allow # comments.

The below is just comments on the patch itself.

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -2800,9 +2806,57 @@ sub process {
> =A0				$dequoted =3D~ s/" </ </;
> =A0				# Don't force email to have quotes
> =A0				# Allow just an angle bracketed address
> -				if (!same_email_addresses($email, $suggested_email, 0)) {
> +				if (!same_email_addresses($email, $suggested_email)) {
> +					if (WARN("BAD_SIGN_OFF",
> +					    "email address '$email' might be better as '$suggested_email'\n=
" . $herecurr) &&
> +						$fix) {

trivia:

Please always align $fix with tabs to the if and then 4 spaces to the
open parenthesis.

> +				# Comments must begin only with (
> +				# or # in case of stable@vger.kernel.org
> +				if ($email =3D~ /^.*stable\@vger/) {

I believe this should be

				if ($email =3D~ /^stable\@(?:vger\.)?kernel.org$/) {

> +					if ($comment ne "" && $comment !~ /^#.+/) {
> +						if (WARN("BAD_SIGN_OFF",
> +						    "Invalid comment format for stable: '$email', prefer parenthes=
es\n" . $herecurr) &&

Prefer #

> +							$fix) {
> +							my $new_comment =3D $comment;
> +							$new_comment =3D~ s/^[ \(\[]+|[ \)\]]+$//g;

Does the comment include any leading whitespace here?
I presumed not given the $comment !~ /^#/ test above.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
