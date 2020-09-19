Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F56EC43463
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 17:26:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D00207D3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 17:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0D00207D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 625F9871BD;
	Sat, 19 Sep 2020 17:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vEqw8fdab20u; Sat, 19 Sep 2020 17:26:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 11087871D3;
	Sat, 19 Sep 2020 17:26:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0019BC0859;
	Sat, 19 Sep 2020 17:26:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47F49C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 17:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4145F871D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 17:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M3J4xCRJLB3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 17:26:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0041.hostedemail.com
 [216.40.44.41])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3C7BC871BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 17:26:09 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 363F81DEB;
 Sat, 19 Sep 2020 17:26:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: sun72_231127327135
X-Filterd-Recvd-Size: 3279
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Sat, 19 Sep 2020 17:26:07 +0000 (UTC)
Message-ID: <ad937bba6ebd306f6e467add90cfd857bb4f2391.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 19 Sep 2020 10:26:06 -0700
In-Reply-To: <20200919081225.28624-1-dwaipayanray1@gmail.com>
References: <20200919081225.28624-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: apw@canonical.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: extend author
 Signed-off-by check for split From: header
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

On Sat, 2020-09-19 at 13:42 +0530, Dwaipayan Ray wrote:
> Checkpatch did not handle cases where the author From: header
> was split into two lines. The author string went empty and
> checkpatch generated a false NO_AUTHOR_SIGN_OFF warning.

It's good to provide an example where the current code
doesn't work.

It likely would be better to do this by searching forward for
any extension lines after a "^From:' rather than searching
backwards as there can be any number of extension lines.

> Support split From: headers in AUTHOR_SIGN_OFF check by adding
> an additional clause to resolve author identity in such cases.
> 
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 504d2e431c60..86975baead22 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1210,6 +1210,16 @@ sub reformat_email {
>  	return format_email($email_name, $email_address);
>  }
>  
> +sub format_author_email {
> +	my ($email, $from) = @_;
> +
> +	$email = encode("utf8", $email) if ($from =~ /=\?utf-8\?/i);
> +	$email =~ s/"//g;
> +	$email = reformat_email($email);
> +
> +	return $email;
> +}
> +
>  sub same_email_addresses {
>  	my ($email1, $email2) = @_;
>  
> @@ -2347,6 +2357,7 @@ sub process {
>  	my $signoff = 0;
>  	my $author = '';
>  	my $authorsignoff = 0;
> +	my $prevheader = '';
>  	my $is_patch = 0;
>  	my $is_binding_patch = -1;
>  	my $in_header_lines = $file ? 0 : 1;
> @@ -2658,12 +2669,21 @@ sub process {
>  			}
>  		}
>  
> +# Check the patch for a split From:
> +		if($prevheader ne '') {
> +			if ($author eq '' && decode("MIME-Header", $prevheader) =~ /^From:\s*(.*)/) {
> +				my $email = $1.$line;
> +				$author = format_author_email($email, $prevheader);
> +			}
> +			$prevheader = '';
> +		}
> +
>  # Check the patch for a From:
>  		if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
> -			$author = $1;
> -			$author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
> -			$author =~ s/"//g;
> -			$author = reformat_email($author);
> +			$author = format_author_email($1, $line);
> +			if($author eq '') {
> +				$prevheader = $line;
> +			}
>  		}
>  
>  # Check the patch for a signoff:

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
