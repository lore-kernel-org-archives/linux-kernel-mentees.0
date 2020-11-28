Return-Path: <SRS0=hNXL=FC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219EBC63777
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 19:19:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79AE92087C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 19:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79AE92087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B4058715C;
	Sat, 28 Nov 2020 19:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xrV4u1hf8JT1; Sat, 28 Nov 2020 19:19:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E2A8E86E88;
	Sat, 28 Nov 2020 19:19:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5E56C0891;
	Sat, 28 Nov 2020 19:19:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46EEAC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 19:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2C9C0877A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 19:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JWkF8RwDIiTS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 19:19:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0190.hostedemail.com
 [216.40.44.190])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 494898723E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 19:19:01 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 3E3831801D524
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 19:13:04 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id B4C1B100E7B48;
 Sat, 28 Nov 2020 19:13:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: food23_5907ea127393
X-Filterd-Recvd-Size: 3656
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Sat, 28 Nov 2020 19:13:00 +0000 (UTC)
Message-ID: <c2087e41b85c3d45f1d224373b36ecff88d80298.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Date: Sat, 28 Nov 2020 11:12:59 -0800
In-Reply-To: <20201128183508.1195-1-yashsri421@gmail.com>
References: <2f5c625f5f342042ab55902fe4b808bff8dd297b.camel@perches.com>
 <20201128183508.1195-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add fix and
 improve warning msg for non-standard signature
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

On Sun, 2020-11-29 at 00:05 +0530, Aditya Srivastava wrote:
> Currently checkpatch warns for BAD_SIGN_OFF on non-standard signature
> styles.

Seems OK, but here are some last trivial notes:

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> +sub find_standard_signature {
> +	my ($sign_off) =3D @_;
> +	my @standard_signature_tags =3D (
> +		'signed-off-by:', 'co-developed-by:', 'acked-by:', 'tested-by:',
> +		'reviewed-by:', 'reported-by:', 'suggested-by:'

I would change this to the normal signatures:

	my @standard_signature_tags =3D (
		'Signed-off-by:', 'Co-developed-by:', 'Acked-by:', 'Tested-by:',
		'Reviewed-by:', 'Reported-by:', 'Suggested-by:'

> +	);
> +	my $standard_signature;
> +	my $min_edit_distance =3D 20; # setting default value

20 seems arbitrary, maybe (~0 << 1) ?

> +	my $edit_distance;

move this into the foreach (or maybe not use this at all)

> +	foreach (@standard_signature_tags) {

foreach style in this code uses foreach my $<something> and not $_

	foreach my $standard (@standard_signature_tags) {

> +		$edit_distance =3D get_edit_distance($sign_off, $_);

So:

		my $edit_distance =3D get_edit_distance($sign_off, $standard);

> +		if ($edit_distance < $min_edit_distance) {
> +			$min_edit_distance =3D $edit_distance;
> +			$standard_signature =3D $_;
> +		}
> +	}
> +        if ($min_edit_distance <=3D 2) {
> +		return ucfirst($standard_signature);

	return $standard;

Though maybe it's simpler to test in the loop if it's <=3D 2 as
the lowercase and dash strip is done inside get_edit_distance
so this seems rather simpler:

	foreach my $standard (@standard_signature_tags) {
		return $standard if (get_edit_distance($sign_off, $standard) <=3D 2);
	}

	return "";

> @@ -2773,8 +2839,17 @@ sub process {
> =A0			my $ucfirst_sign_off =3D ucfirst(lc($sign_off));
> =A0
> =

> =A0			if ($sign_off !~ /$signature_tags/) {
> -				WARN("BAD_SIGN_OFF",
> -				     "Non-standard signature: $sign_off\n" . $herecurr);
> +				my $suggested_signature =3D find_standard_signature($sign_off);
> +				if ($suggested_signature eq "") {
> +					WARN("BAD_SIGN_OFF",
> +					     "Non-standard signature: $sign_off\n" . $herecurr);
> +				} else {
> +					if (WARN("BAD_SIGN_OFF",
> +						 "Non-standard signature: $sign_off. Perhaps '$suggested_signature=
'\n" . $herecurr) &&

Please use consistent '' or nothing around signatures:

						"Non-standard signature: '$sign_off' - likely typo of '$suggested_sig=
nature'\n" . $herecurr) &&

> +					    $fix) {
> +						$fixed[$fixlinenr] =3D~ s/$sign_off/$suggested_signature/;
> +					}
> +				}
> =A0			}
> =A0			if (defined $space_before && $space_before ne "") {
> =A0				if (WARN("BAD_SIGN_OFF",


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
