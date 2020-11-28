Return-Path: <SRS0=hNXL=FC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED6CC63777
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 20:58:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DC75221FF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Nov 2020 20:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DC75221FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3296D8735D;
	Sat, 28 Nov 2020 20:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDiHmJ217wjw; Sat, 28 Nov 2020 20:58:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1FCDD87345;
	Sat, 28 Nov 2020 20:58:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEE8CC163C;
	Sat, 28 Nov 2020 20:58:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A004C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 15DB887F25
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucQ3ZkO14Oe9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:58:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0223.hostedemail.com
 [216.40.44.223])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A591587F1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Nov 2020 20:58:01 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 715D6837F24F;
 Sat, 28 Nov 2020 20:58:00 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: wax38_2617ef727393
X-Filterd-Recvd-Size: 5612
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Sat, 28 Nov 2020 20:57:59 +0000 (UTC)
Message-ID: <db1195235752685fc85fb52ecb1b1af3f35b5394.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Sat, 28 Nov 2020 12:57:58 -0800
In-Reply-To: <20201128204333.7054-1-yashsri421@gmail.com>
References: <c2087e41b85c3d45f1d224373b36ecff88d80298.camel@perches.com>
 <20201128204333.7054-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v6] checkpatch: add fix and
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

On Sun, 2020-11-29 at 02:13 +0530, Aditya Srivastava wrote:
> Currently checkpatch warns for BAD_SIGN_OFF on non-standard signature
> styles.

Thanks.

Acked-by: Joe Perches <joe@perches.com>

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
> applies on next-20201120
> =

> changes in v2: modify commit message: replace specific example with overa=
ll evaluation, minor changes
> =

> changes in v3: summarize commit message
> =

> changes in v4: improve commit message; remove signature suggestions of sm=
all length (ie 'cc' and 'to')
> =

> changes in v5: modify coding styles: improve function names, whitespaces
> =

> changes in v6: Simplify foreach loop; change standard signature tag value=
s to normal ucfirst; modify warning message
> =

> =A0scripts/checkpatch.pl | 71 +++++++++++++++++++++++++++++++++++++++++--
> =A01 file changed, 69 insertions(+), 2 deletions(-)
> =

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fdfd5ec09be6..4a026926139f 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -506,6 +506,64 @@ our $signature_tags =3D qr{(?xi:
> =A0	Cc:
> =A0)};
> =A0
> =

> +sub edit_distance_min {
> +	my (@arr) =3D @_;
> +	my $len =3D scalar @arr;
> +	if ((scalar @arr) < 1) {
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
> +	$str1 =3D lc($str1);
> +	$str2 =3D lc($str2);
> +	$str1 =3D~ s/-//g;
> +	$str2 =3D~ s/-//g;
> +	my $len1 =3D length($str1);
> +	my $len2 =3D length($str2);
> +	# two dimensional array storing minimum edit distance
> +	my @distance;
> +	for my $i (0 .. $len1) {
> +		for my $j (0 .. $len2) {
> +			if ($i =3D=3D 0) {
> +				$distance[$i][$j] =3D $j;
> +			} elsif ($j =3D=3D 0) {
> +				$distance[$i][$j] =3D $i;
> +			} elsif (substr($str1, $i-1, 1) eq substr($str2, $j-1, 1)) {
> +				$distance[$i][$j] =3D $distance[$i - 1][$j - 1];
> +			} else {
> +				my $dist1 =3D $distance[$i][$j - 1]; #insert distance
> +				my $dist2 =3D $distance[$i - 1][$j]; # remove
> +				my $dist3 =3D $distance[$i - 1][$j - 1]; #replace
> +				$distance[$i][$j] =3D 1 + edit_distance_min($dist1, $dist2, $dist3);
> +			}
> +		}
> +	}
> +	return $distance[$len1][$len2];
> +}
> +
> +sub find_standard_signature {
> +	my ($sign_off) =3D @_;
> +	my @standard_signature_tags =3D (
> +		'Signed-off-by:', 'Co-developed-by:', 'Acked-by:', 'Tested-by:',
> +		'Reviewed-by:', 'Reported-by:', 'Suggested-by:'
> +	);
> +	foreach my $signature (@standard_signature_tags) {
> +		return $signature if (get_edit_distance($sign_off, $signature) <=3D 2);
> +	}
> +
> +	return "";
> +}
> +
> =A0our @typeListMisordered =3D (
> =A0	qr{char\s+(?:un)?signed},
> =A0	qr{int\s+(?:(?:un)?signed\s+)?short\s},
> @@ -2773,8 +2831,17 @@ sub process {
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
> +						 "Non-standard signature: '$sign_off' - perhaps '$suggested_signat=
ure'?\n" . $herecurr) &&
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
