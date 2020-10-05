Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5C4C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 07:18:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5535020659
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 07:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5535020659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DD94A2045B;
	Mon,  5 Oct 2020 07:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSo2ajI66Fzj; Mon,  5 Oct 2020 07:18:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D5EA52002B;
	Mon,  5 Oct 2020 07:18:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1F65C07FF;
	Mon,  5 Oct 2020 07:18:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85B19C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 07:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7BC4085402
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 07:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kK246otLRsyT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 07:18:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0067.hostedemail.com
 [216.40.44.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4BA20841D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 07:18:23 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id EFD1C18001161
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 07:18:21 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 70A4F18029210;
 Mon,  5 Oct 2020 07:18:19 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: worm55_1211179271bc
X-Filterd-Recvd-Size: 4609
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf15.hostedemail.com (Postfix) with ESMTPA;
 Mon,  5 Oct 2020 07:18:18 +0000 (UTC)
Message-ID: <a5cba9bb723626091f8790c794efe8de4ab184b8.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 05 Oct 2020 00:18:17 -0700
In-Reply-To: <20201005064842.33495-1-dwaipayanray1@gmail.com>
References: <20201005064842.33495-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new warnings
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

On Mon, 2020-10-05 at 12:18 +0530, Dwaipayan Ray wrote:
> The author signed-off-by checks are currently very vague.
> Cases like same name or same address are not handled separately.
> 
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
> Introduced three new types of warnings:
> 
> 1) Address matches, but names are different.
>    "James Watson <james@gmail.com>", "James <james@gmail.com>"
> 
> 2) Name matches, but addresses are different.
>    "James Watson <james@watson.com>", "James Watson <james@gmail.com>"
> 
> 3) Name matches, but addresses without mail extensions are same.
>    "James Watson <james@gmail.com>", "James Watson <james+a@gmail.com>"
> 
> For the 3rd class, a --strict check message is generated, and for the
> other two, warnings are generated.

I don't have any issue with the concept, but please
be consistent with spacing after if tests.

Always use a single space after if

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl

> @@ -2347,6 +2347,7 @@ sub process {
>  	my $signoff = 0;
>  	my $author = '';
>  	my $authorsignoff = 0;
> +	my $authorsignoff_ctx = '';

ctx isn't a descriptive name.

Maybe $author_sob

> @@ -2674,9 +2675,34 @@ sub process {
>  		if ($line =~ /^\s*signed-off-by:\s*(.*)/i) {
>  			$signoff++;
>  			$in_commit_log = 0;
> -			if ($author ne '') {
> +			if ($author ne ''  && $authorsignoff != 1) {

Has space after if

>  				if (same_email_addresses($1, $author)) {
>  					$authorsignoff = 1;
> +				} else {
> +					my $ctx = $1;
> +					my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
> +					my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
> +
> +					if($email_address eq $author_address) {

No space after if, etc...

> @@ -6891,9 +6917,32 @@ sub process {
>  		if ($signoff == 0) {
>  			ERROR("MISSING_SIGN_OFF",
>  			      "Missing Signed-off-by: line(s)\n");
> -		} elsif (!$authorsignoff) {
> -			WARN("NO_AUTHOR_SIGN_OFF",
> -			     "Missing Signed-off-by: line by nominal patch author '$author'\n");
> +		} elsif ($authorsignoff != 1) {
> +			# authorsignoff values:
> +			# 0 -> missing sign off
> +			# 1 -> sign off present

sign off identical

> +			# 2 -> address matches, name different
> +			# 3 -> name matches, address different
> +			# 4 -> name matches, address matches without extension

extension here isn't obvious

> +
> +			my $ctx_msg = "'Signed-off-by: $authorsignoff_ctx' should be:\n'Signed-off-by: $author'";

New line not necessary or useful really.

And for mismatches, it's really not known that
it should be one way or the or the other is it?

> +
> +			if($authorsignoff == 0) {
> +				WARN("NO_AUTHOR_SIGN_OFF",
> +					"Missing Signed-off-by: line by nominal patch author '$author'\n");
> +			}
> +			elsif($authorsignoff == 2) {
> +				WARN("NO_AUTHOR_SIGN_OFF",
> +					"Author name mismatch:\n$ctx_msg\n");
> +			}
> +			elsif($authorsignoff == 3) {
> +				WARN("NO_AUTHOR_SIGN_OFF",
> +					"Author address mismatch:\n$ctx_msg\n");
> +			}
> +			elsif($authorsignoff == 4) {
> +				CHK("NO_AUTHOR_SIGN_OFF",
> +					"Author mail extension mismatch:\n$ctx_msg\n");
> +			}
>  		}
>  	}
>  

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
