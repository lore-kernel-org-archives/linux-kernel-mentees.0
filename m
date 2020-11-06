Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047E9C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 22:04:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B832087E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 22:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46B832087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BE5ED20434;
	Fri,  6 Nov 2020 22:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bnpnb979io3; Fri,  6 Nov 2020 22:04:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BE4F920470;
	Fri,  6 Nov 2020 22:04:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60D60C088B;
	Fri,  6 Nov 2020 22:04:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 157C8C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 22:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EFB1E8654D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 22:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OIfLW0vKCIbo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 22:04:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0131.hostedemail.com
 [216.40.44.131])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 03B7D864E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 22:04:03 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id A7E1B182CF666;
 Fri,  6 Nov 2020 22:04:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: town76_4b09d98272d6
X-Filterd-Recvd-Size: 3214
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Fri,  6 Nov 2020 22:04:00 +0000 (UTC)
Message-ID: <38c2889ad15c0f34ce8c223518f1f6dbc9945286.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 06 Nov 2020 14:03:59 -0800
In-Reply-To: <20201106214530.367247-1-dwaipayanray1@gmail.com>
References: <20201106214530.367247-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: improve email
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

On Sat, 2020-11-07 at 03:15 +0530, Dwaipayan Ray wrote:
> checkpatch doesn't report warnings for many common mistakes
> in emails. Some of which are trailing commas and incorrect
> use of email comments.

Assuming it all works, this looks good.  I haven't tested it.

How did you test the $fix bits?

Trivial notes:

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> +				# stable@vger.kernel.org or stable@kernel.org shouldn't
> +				# have an email name. In addition commments should strictly
> +				# begin with a #
> +				if ($email =3D~ /^.*stable\@(?:vger\.)?kernel\.org/) {

Likely better to test with a case insensitive match so
STABLE@vger.kernel.org and such are still warned.

				if ($email =3D~ /\bstable\@(?:vger\.)?kernel\.org\b/i) {

> +					if ($sign_off =3D~ /cc:$/i && (($comment ne "" && $comment !~ /^#.+=
/) ||
> +					    ($email_name ne ""))) {

|| $sign_off !~ /^cc:/i ?

> +						my $cur_name =3D $email_name;
> +						my $new_comment =3D $comment;
> +
> +						$cur_name =3D~ s/[a-zA-Z\s\-\"]+//g;
> +						$new_comment =3D~ s/^[\s\#\(\[]+|[\s\)\]]+$//g;
> +						$new_comment =3D trim("$new_comment $cur_name") if $cur_name ne $n=
ew_comment;
> +						$new_comment =3D " # $new_comment" if length($new_comment) > 0;
> +						my $new_email =3D "$email_address$new_comment";
> +
> +						if (WARN("BAD_SIGN_OFF",
> +						    "Invalid email format for stable: '$email', prefer '$new_email=
'\n" . $herecurr) &&

These message lines should be aligned to the next open parenthesis
(7 tabs, 1 space)

> +						    $fix) {
> +							$fixed[$fixlinenr] =3D~ s/\Q$email\E/$new_email/;
> +						}

As a cc to stable isn't a sign-off, perhaps this should be a different
"BAD_<FOO>" like "BAD_STABLE_ADDRESS_STYLE" or such.

> +					}
> +				} else {

elsif ?

> +					if ($comment ne "" && $comment !~ /^(?:#.+|\(.+\))$/) {
> +						if (WARN("BAD_SIGN_OFF",
> +						    "Unexpected content after email: '$email'\n" . $herecurr) &&

7 tabs, 1 space

> +						    $fix) {
> +							my $new_comment =3D $comment;
> +							$new_comment =3D~ s/^(?:\/\*|\.|\,)//g;
> +							$new_comment =3D~ s/^[\s\{\[]+|[\s\}\]]+$//g;
> +							$new_comment =3D " ($new_comment)" if length($new_comment) > 0;
> +							$fixed[$fixlinenr] =3D~ s/\s*\Q$comment\E$/$new_comment/;
> +						}
> +					}
> =A0				}
> =A0			}
> =A0
> =



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
