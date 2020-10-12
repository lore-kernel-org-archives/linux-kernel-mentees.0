Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3B2C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 06:17:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53FC2074F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 06:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B53FC2074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2218D85E9F;
	Mon, 12 Oct 2020 06:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0pN044UF-Mc; Mon, 12 Oct 2020 06:17:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7C7C385BD5;
	Mon, 12 Oct 2020 06:17:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 603A6C0052;
	Mon, 12 Oct 2020 06:17:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAB4BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 06:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B2A26872FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 06:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tgE4K2TvT09H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 06:17:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0232.hostedemail.com
 [216.40.44.232])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 79ADB872FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 06:17:26 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 22A8D5C0;
 Mon, 12 Oct 2020 06:17:25 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: love65_0b0cd1e271f8
X-Filterd-Recvd-Size: 4046
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Mon, 12 Oct 2020 06:17:24 +0000 (UTC)
Message-ID: <63053585d41ff81cdaad6cb727eb83d81207041a.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>
Date: Sun, 11 Oct 2020 23:17:23 -0700
In-Reply-To: <20201012054943.1196031-1-ujjwalkumar0501@gmail.com>
References: <20201012054943.1196031-1-ujjwalkumar0501@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] checkpatch: add shebang
	check to EXECUTE_PERMISSIONS
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

On Mon, 2020-10-12 at 11:19 +0530, Ujjwal Kumar wrote:
> checkpatch.pl checks for invalid EXECUTE_PERMISSIONS on source
> files. The script leverages filename extensions and its path in
> the repository to decide whether to allow execute permissions on
> the file or not.
> 
> Based on current check conditions, a perl script file having
> execute permissions, without '.pl' extension in its filename
> and not belonging to 'scripts/' directory is reported as ERROR
> which is a false-positive.
> 
> Adding a shebang check along with current conditions will make
> the check more generalised and improve checkpatch reports.
> To do so, without breaking the core design decision of checkpatch,
> we can fetch the first line from the patch itself and match it for
> a shebang pattern.
> 
> There can be cases where the first line is not part of the patch.

For instance: a patch that only changes permissions
without changing any of the file content.

> 
> In that case there may be a false-positive report but in the end we
> will have less false-positives as we will be handling some of the
> unhandled cases.

> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> ---
> Apologies, I forgot to include linux-kernel@vger.kernel.org so I'm
> now resending.
> 
>  scripts/checkpatch.pl | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -1795,6 +1795,23 @@ sub get_stat_here {
>  	return $herectx;
>  }

First some style trivia:

> +sub get_shebang {
> +	my ($linenr, $realfile) = @_;
> +	my $rawline = "";
> +	my $shebang = "";
> +
> +	$rawline = raw_line($linenr, 3);
> +	if (defined $rawline &&
> +		$rawline =~ /^\@\@ -\d+(?:,\d+)? \+(\d+)(,(\d+))? \@\@/) {

alignment to open parenthesis please

> +		if (defined $1 && $1 == 1) {
> +			$shebang = raw_line($linenr, 4);
> +			$shebang = substr $shebang, 1;

parentheses around substr please.

> +		}
> +	}
> +
> +	return $shebang;
> +}

And some real notes:

$realfile isn't used in this function so there doesn't
seem to be a reason to have it as an function argument.

> +
>  sub cat_vet {
>  	my ($vet) = @_;
>  	my ($res, $coded);
> @@ -2680,7 +2697,9 @@ sub process {
>  # Check for incorrect file permissions
>  		if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {

probably better here to use a capture group for the permissions

		if ($line =~ /^new (?:file )?mode (\d+)$/) {
			my $mode = substr($1, -3);

>  			my $permhere = $here . "FILE: $realfile\n";
> +			my $shebang = get_shebang($linenr, $realfile);
>  			if ($realfile !~ m@scripts/@ &&

Maybe remove the $realfile directory test as
there are many source files that are not scripts
in this directory and its subdirectories.

> +			    $shebang !~ /^#!\s*(\/\w)+.*/ &&

unnecessary capture group

and add

			   $mode =~ /[1357]/ &&

>  			    $realfile !~ /\.(py|pl|awk|sh)$/) {

No need for a a capture group here either. (existing defect)

>  				ERROR("EXECUTE_PERMISSIONS",
>  				      "do not set execute permissions for source files\n" . $permhere);



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
