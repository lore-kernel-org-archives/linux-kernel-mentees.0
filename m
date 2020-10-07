Return-Path: <SRS0=isT2=DO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9894EC4363C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Oct 2020 21:08:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 076092083B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Oct 2020 21:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 076092083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B55E8730D;
	Wed,  7 Oct 2020 21:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bngjmlvu5M-2; Wed,  7 Oct 2020 21:08:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5967187306;
	Wed,  7 Oct 2020 21:08:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EF7CC016F;
	Wed,  7 Oct 2020 21:08:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEF3AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 21:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9621486AD7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 21:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s36Mryq0+S+Q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 21:08:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0210.hostedemail.com
 [216.40.44.210])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4008F86ACD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 21:08:00 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 0F45518019563
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 20:30:20 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 73EBF837F253;
 Wed,  7 Oct 2020 20:30:17 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: egg60_050b0d7271d2
X-Filterd-Recvd-Size: 9384
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Wed,  7 Oct 2020 20:30:16 +0000 (UTC)
Message-ID: <945aa49a6fcaefebbd7c8343661fc1a0d2ece539.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Wed, 07 Oct 2020 13:30:14 -0700
In-Reply-To: <20201007192029.551744-1-dwaipayanray1@gmail.com>
References: <20201007192029.551744-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v6] checkpatch: add new warnings
 to author signoff checks.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, 2020-10-08 at 00:50 +0530, Dwaipayan Ray wrote:
> The author signed-off-by checks are currently very vague.
> Cases like same name or same address are not handled separately.

Thanks Dwaipayan.

This might have to eventually change case #5 to CHK, but
otherwise this seems sensible and let's see how it goes...

Acked-by: Joe Perches <joe@perches.com>

> For example, running checkpatch on commit be6577af0cef
> ("parisc: Add atomic64_set_release() define to avoid CPU soft lockups"),
> gives:
> 
> WARNING: Missing Signed-off-by: line by nominal patch author
> 'John David Anglin <dave.anglin@bell.net>'
> 
> The signoff line was:
> "Signed-off-by: Dave Anglin <dave.anglin@bell.net>"
> 
> Clearly the author has signed off but with a slightly different version
> of his name. A more appropriate warning would have been to point out
> at the name mismatch instead.
> 
> Previously, the values assumed by $authorsignoff were either 0 or 1
> to indicate whether a proper sign off by author is present.
> Extended the checks to handle four new cases.
> 
> $authorsignoff values now denote the following:
> 
> 0: Missing sign off by patch author.
> 
> 1: Sign off present and identical.
> 
> 2: Addresses and names match, but comments differ.
>    "James Watson(JW) <james@gmail.com>", "James Watson <james@gmail.com>"
> 
> 3: Addresses match, but names are different.
>    "James Watson <james@gmail.com>", "James <james@gmail.com>"
> 
> 4: Names match, but addresses are different.
>    "James Watson <james@watson.com>", "James Watson <james@gmail.com>"
> 
> 5: Names match, addresses excluding subaddress details (RFC 5233) match.
>    "James Watson <james@gmail.com>", "James Watson <james+a@gmail.com>"
> 
> Also introduced a new message type FROM_SIGN_OFF_MISMATCH
> for cases 2, 3, 4 and 5.
> 
> Link: https://lore.kernel.org/linux-kernel-mentees/c1ca28e77e8e3bfa7aadf3efa8ed70f97a9d369c.camel@perches.com/
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 93 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 77 insertions(+), 16 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 31624bbb342e..124ff9432b51 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1163,10 +1163,10 @@ sub parse_email {
>  		}
>  	}
>  
> +	$comment = trim($comment);
>  	$name = trim($name);
>  	$name =~ s/^\"|\"$//g;
> -	$name =~ s/(\s*\([^\)]+\))\s*//;
> -	if (defined($1)) {
> +	if ($name =~ s/(\s*\([^\)]+\))\s*//) {
>  		$name_comment = trim($1);
>  	}
>  	$address = trim($address);
> @@ -1181,10 +1181,12 @@ sub parse_email {
>  }
>  
>  sub format_email {
> -	my ($name, $address) = @_;
> +	my ($name, $name_comment, $address, $comment) = @_;
>  
>  	my $formatted_email;
>  
> +	$name_comment = trim($name_comment);
> +	$comment = trim($comment);
>  	$name = trim($name);
>  	$name =~ s/^\"|\"$//g;
>  	$address = trim($address);
> @@ -1197,9 +1199,9 @@ sub format_email {
>  	if ("$name" eq "") {
>  		$formatted_email = "$address";
>  	} else {
> -		$formatted_email = "$name <$address>";
> +		$formatted_email = "$name$name_comment <$address>";
>  	}
> -
> +	$formatted_email .= "$comment";
>  	return $formatted_email;
>  }
>  
> @@ -1207,17 +1209,23 @@ sub reformat_email {
>  	my ($email) = @_;
>  
>  	my ($email_name, $name_comment, $email_address, $comment) = parse_email($email);
> -	return format_email($email_name, $email_address);
> +	return format_email($email_name, $name_comment, $email_address, $comment);
>  }
>  
>  sub same_email_addresses {
> -	my ($email1, $email2) = @_;
> +	my ($email1, $email2, $match_comment) = @_;
>  
>  	my ($email1_name, $name1_comment, $email1_address, $comment1) = parse_email($email1);
>  	my ($email2_name, $name2_comment, $email2_address, $comment2) = parse_email($email2);
>  
> +	if ($match_comment != 1) {
> +		return $email1_name eq $email2_name &&
> +		       $email1_address eq $email2_address;
> +	}
>  	return $email1_name eq $email2_name &&
> -	       $email1_address eq $email2_address;
> +	       $email1_address eq $email2_address &&
> +	       $name1_comment eq $name2_comment &&
> +	       $comment1 eq $comment2;
>  }
>  
>  sub which {
> @@ -2347,6 +2355,7 @@ sub process {
>  	my $signoff = 0;
>  	my $author = '';
>  	my $authorsignoff = 0;
> +	my $author_sob = '';
>  	my $is_patch = 0;
>  	my $is_binding_patch = -1;
>  	my $in_header_lines = $file ? 0 : 1;
> @@ -2674,9 +2683,37 @@ sub process {
>  		if ($line =~ /^\s*signed-off-by:\s*(.*)/i) {
>  			$signoff++;
>  			$in_commit_log = 0;
> -			if ($author ne '') {
> -				if (same_email_addresses($1, $author)) {
> +			if ($author ne ''  && $authorsignoff != 1) {
> +				if (same_email_addresses($1, $author, 1)) {
>  					$authorsignoff = 1;
> +				} else {
> +					my $ctx = $1;
> +					my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
> +					my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
> +
> +					if ($email_address eq $author_address && $email_name eq $author_name) {
> +						$author_sob = $ctx;
> +						$authorsignoff = 2;
> +					} elsif ($email_address eq $author_address) {
> +						$author_sob = $ctx;
> +						$authorsignoff = 3;
> +					} elsif ($email_name eq $author_name) {
> +						$author_sob = $ctx;
> +						$authorsignoff = 4;
> +
> +						my $address1 = $email_address;
> +						my $address2 = $author_address;
> +
> +						if ($address1 =~ /(\S+)\+\S+(\@.*)/) {
> +							$address1 = "$1$2";
> +						}
> +						if ($address2 =~ /(\S+)\+\S+(\@.*)/) {
> +							$address2 = "$1$2";
> +						}
> +						if ($address1 eq $address2) {
> +							$authorsignoff = 5;
> +						}
> +					}
>  				}
>  			}
>  		}
> @@ -2733,7 +2770,7 @@ sub process {
>  			}
>  
>  			my ($email_name, $name_comment, $email_address, $comment) = parse_email($email);
> -			my $suggested_email = format_email(($email_name, $email_address));
> +			my $suggested_email = format_email(($email_name, $name_comment, $email_address, $comment));
>  			if ($suggested_email eq "") {
>  				ERROR("BAD_SIGN_OFF",
>  				      "Unrecognized email address: '$email'\n" . $herecurr);
> @@ -2743,9 +2780,9 @@ sub process {
>  				$dequoted =~ s/" </ </;
>  				# Don't force email to have quotes
>  				# Allow just an angle bracketed address
> -				if (!same_email_addresses($email, $suggested_email)) {
> +				if (!same_email_addresses($email, $suggested_email, 0)) {
>  					WARN("BAD_SIGN_OFF",
> -					     "email address '$email' might be better as '$suggested_email$comment'\n" . $herecurr);
> +					     "email address '$email' might be better as '$suggested_email'\n" . $herecurr);
>  				}
>  			}
>  
> @@ -6891,9 +6928,33 @@ sub process {
>  		if ($signoff == 0) {
>  			ERROR("MISSING_SIGN_OFF",
>  			      "Missing Signed-off-by: line(s)\n");
> -		} elsif (!$authorsignoff) {
> -			WARN("NO_AUTHOR_SIGN_OFF",
> -			     "Missing Signed-off-by: line by nominal patch author '$author'\n");
> +		} elsif ($authorsignoff != 1) {
> +			# authorsignoff values:
> +			# 0 -> missing sign off
> +			# 1 -> sign off identical
> +			# 2 -> names and addresses match, comments mismatch
> +			# 3 -> addresses match, names different
> +			# 4 -> names match, addresses different
> +			# 5 -> names match, addresses excluding subaddress details (refer RFC 5233) match
> +
> +			my $sob_msg = "'From: $author' != 'Signed-off-by: $author_sob'";
> +
> +			if ($authorsignoff == 0) {
> +				ERROR("NO_AUTHOR_SIGN_OFF",
> +				      "Missing Signed-off-by: line by nominal patch author '$author'\n");
> +			} elsif ($authorsignoff == 2) {
> +				CHK("FROM_SIGN_OFF_MISMATCH",
> +				    "From:/Signed-off-by: email comments mismatch: $sob_msg\n");
> +			} elsif ($authorsignoff == 3) {
> +				WARN("FROM_SIGN_OFF_MISMATCH",
> +				     "From:/Signed-off-by: email name mismatch: $sob_msg\n");
> +			} elsif ($authorsignoff == 4) {
> +				WARN("FROM_SIGN_OFF_MISMATCH",
> +				     "From:/Signed-off-by: email address mismatch: $sob_msg\n");
> +			} elsif ($authorsignoff == 5) {
> +				WARN("FROM_SIGN_OFF_MISMATCH",
> +				     "From:/Signed-off-by: email subaddress mismatch: $sob_msg\n");
> +			}
>  		}
>  	}
>  

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
