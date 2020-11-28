Return-Path: <SRS0=hNXL=FC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57600C63777
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 16:18:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFA892467C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 16:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFA892467C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76F0487C6D;
	Sat, 28 Nov 2020 16:18:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pPkV4wzRwcA; Sat, 28 Nov 2020 16:18:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C5CC987C10;
	Sat, 28 Nov 2020 16:18:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1677C163C;
	Sat, 28 Nov 2020 16:18:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 740B9C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 16:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6FB9487C6D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 16:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1LPsDEbDZWLu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 16:18:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0162.hostedemail.com
 [216.40.44.162])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 26FF387C10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 16:18:16 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id C1FEA1813C43E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 15:40:37 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 387901800CFE6;
 Sat, 28 Nov 2020 15:40:35 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: chin74_030df9227391
X-Filterd-Recvd-Size: 6098
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Sat, 28 Nov 2020 15:40:34 +0000 (UTC)
Message-ID: <2f5c625f5f342042ab55902fe4b808bff8dd297b.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Date: Sat, 28 Nov 2020 07:40:33 -0800
In-Reply-To: <20201128130501.23448-1-yashsri421@gmail.com>
References: <20201128130501.23448-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add fix and
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

On Sat, 2020-11-28 at 18:35 +0530, Aditya Srivastava wrote:
> Currently checkpatch warns for BAD_SIGN_OFF on non-standard signature
> styles.
> =

> A large number of these warnings occur because of typo mistakes in
> signature tags. An evaluation over v4.13..v5.8 showed that out of 539
> warnings due to non-standard signatures, 87 are due to typo mistakes.
> =

> Following are the standard signature tags which are often incorrectly
> used, along with their individual counts of incorrect use (over
> v4.13..v5.8):
> =

> =A0Reviewed-by: 42
> =A0Signed-off-by: 25
> =A0Reported-by: 6
> =A0Acked-by: 4
> =A0Tested-by: 4
> =A0Suggested-by: 4
> =

> Provide a fix by calculating levenshtein distance for the signature tag
> with all the standard signatures and suggest a fix with a signature, whose
> edit distance is less than or equal to 2 with the misspelled signature.
> =

> Out of the 86 mispelled signatures fixed with this approach, 85 were
> found to be good corrections and 1 was bad correction.
> =

> Following was found to be a bad correction:
> =A0Tweeted-by (count: 1) =3D> Tested-by
> =

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> changes in v2: modify commit message: replace specific example with overa=
ll evaluation, minor changes
> =

> changes in v3: summarize commit message
> =

> changes in v4: improve commit message; remove signature suggestions of sm=
all length (ie 'cc' and 'to')

Seems OKish but this needs style modifications as there are
several whitespace uses that don't match the typical forms
and perhaps some new function naming could be improved.

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -506,6 +506,77 @@ our $signature_tags =3D qr{(?xi:
> =A0	Cc:
> =A0)};
> =A0
> =

> +sub get_min {

probably a poor name choice.  Maybe edit_distance_min

> +	my (@arr) =3D @_;
> +	my $len =3D scalar @arr;
> +	if((scalar @arr) < 1) {

space after if

> +		# if underflow, return
> +		return;
> +	}
> +	my $min =3D $arr[0];
> +	for my $i (0 .. ($len-1)) {
> +		if ($arr[$i] < $min) {
> +			$min =3D $arr[$i];
> +		}
> +	}
> +	return $min;
> +}
> +
> +sub get_edit_distance {
> +	my ($str1, $str2) =3D @_;

maybe lc($str) =3D~ s/-//g; here instead of the code in the caller

> +	my $len1 =3D length($str1);
> +	my $len2 =3D length($str2);
> +	# two dimensional array storing minimum edit distance
> +	my @distance;
> +	for my $i (0 .. $len1) {
> +		for my $j (0 .. $len2) {
> +			if ($i =3D=3D 0) {
> +				$distance[$i][$j] =3D $j;
> +			}
> +			elsif ($j =3D=3D 0) {

} elsif {

> +				$distance[$i][$j] =3D $i;
> +			}
> +			elsif (substr($str1, $i-1, 1) eq substr($str2, $j-1, 1)) {
> +				$distance[$i][$j] =3D $distance[$i - 1][$j - 1];
> +			}
> +			else {

} else {

> +				my $dist1 =3D $distance[$i][$j - 1]; #insert distance
> +				my $dist2 =3D $distance[$i - 1][$j]; # remove
> +				my $dist3 =3D $distance[$i - 1][$j - 1]; #replace
> +				$distance[$i][$j] =3D 1 + get_min($dist1, $dist2, $dist3);
> +			}
> +		}
> +	}
> +	return $distance[$len1][$len2];
> +}
> +
> +sub get_standard_signature {

find_standard_signature ?

> +	my ($sign_off) =3D @_;
> +	$sign_off =3D lc($sign_off);
> +	$sign_off =3D~ s/\-//g; # to match with formed hash

why not strip the dashes in get_edit_distance instead
of using this weird dance with dashes here?

> +	my @standard_signature_tags =3D (
> +		'signed-off-by:', 'co-developed-by:', 'acked-by:', 'tested-by:',
> +		'reviewed-by:', 'reported-by:', 'suggested-by:'
> +	);
> +	# setting default values
> +	my $standard_signature =3D 'signed-off-by';

why is does this need to be given a value?

> +	my $min_edit_distance =3D 20;
> +	my $edit_distance;
> +	foreach (@standard_signature_tags) {
> +		my $signature =3D $_;
> +		$_ =3D~ s/\-//g;

and this dancing here

> +		$edit_distance =3D get_edit_distance($sign_off, $_);
> +		if ($edit_distance < $min_edit_distance) {
> +			$min_edit_distance =3D $edit_distance;
> +			$standard_signature =3D $signature;
> +		}
> +	}
> +        if($min_edit_distance<=3D2) {

bad indentation, if (, spaces around test <=3D

> +		return ucfirst($standard_signature);
> +        }

bad indentation

> +	return "";
> +}
> +
> =A0our @typeListMisordered =3D (
> =A0	qr{char\s+(?:un)?signed},
> =A0	qr{int\s+(?:(?:un)?signed\s+)?short\s},
> @@ -2773,8 +2844,18 @@ sub process {
> =A0			my $ucfirst_sign_off =3D ucfirst(lc($sign_off));
> =A0
> =

> =A0			if ($sign_off !~ /$signature_tags/) {
> -				WARN("BAD_SIGN_OFF",
> -				     "Non-standard signature: $sign_off\n" . $herecurr);
> +				my $suggested_signature =3D get_standard_signature($sign_off);
> +				if ($suggested_signature eq "") {
> +					WARN("BAD_SIGN_OFF",
> +					"Non-standard signature: $sign_off\n" . $herecurr);

bad alignment

> +				}
> +				else {

} else {

> +					if (WARN("BAD_SIGN_OFF",
> +						 "Non-standard signature: $sign_off. Please use '$suggested_signat=
ure' instead\n" . $herecurr) &&

"perhaps" rather than "please use" or "likely typo of"

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
