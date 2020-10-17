Return-Path: <SRS0=PE7C=DY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B18C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 05:41:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C55620714
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 05:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C55620714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 04EAF88A10;
	Sat, 17 Oct 2020 05:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzvwcfrJx6bu; Sat, 17 Oct 2020 05:41:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 32EC588A12;
	Sat, 17 Oct 2020 05:41:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EF17C07FF;
	Sat, 17 Oct 2020 05:41:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4549C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CBDF488A12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPTBGF3O7BED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:41:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0138.hostedemail.com
 [216.40.44.138])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B030288A10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:41:08 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 60B3E180A8142;
 Sat, 17 Oct 2020 05:41:07 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: art22_2a0f92227223
X-Filterd-Recvd-Size: 3801
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Sat, 17 Oct 2020 05:41:06 +0000 (UTC)
Message-ID: <fc47f1e6babab1044c9dece4b30200e239438931.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 16 Oct 2020 22:41:05 -0700
In-Reply-To: <20201017052243.17095-1-dwaipayanray1@gmail.com>
References: <20201017052243.17095-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add new exception
	to repeated word check
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

On Sat, 2020-10-17 at 10:52 +0530, Dwaipayan Ray wrote:
> Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
> moved the repeated word test to check for more file types. But after
> this, if checkpatch.pl is run on MAINTAINERS, it generates several
> new warnings of the type:
> 
> WARNING: Possible repeated word: 'git'
> 
> For example:
> WARNING: Possible repeated word: 'git'
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git
> 
> So, the pattern "git git://..." is a false positive in this case.
> 
> There are several other combinations which may produce a wrong
> warning message, such as "@size size", ":Begin begin", etc.
> 
> Extend repeated word check to compare the characters before and
> after the word matches. If the preceding or succeeding character
> belongs to the exception list, the warning is avoided.
> 
> Link: https://lore.kernel.org/linux-kernel-mentees/81b6a0bb2c7b9256361573f7a13201ebcd4876f1.camel@perches.com/
> Suggested-by: Joe Perches <joe@perches.com>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index f1a4e61917eb..89430dfd6652 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -595,6 +595,7 @@ our @mode_permission_funcs = (
>  );
>  
>  my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
> +my $exclude_chars = '[^\.\,\+\s]';

Why include a + character here?

>  #Create a search pattern for all these functions to speed up a loop below
>  our $mode_perms_search = "";
> @@ -3056,15 +3057,27 @@ sub process {
>  
>  				my $first = $1;
>  				my $second = $2;
> -
> +				my $start_pos = $-[1];
> +				my $end_pos = $+[2];
>  				if ($first =~ /(?:struct|union|enum)/) {
>  					pos($rawline) += length($first) + length($second) + 1;
>  					next;
>  				}
>  
> -				next if ($first ne $second);
> +				next if (lc($first) ne lc($second));
>  				next if ($first eq 'long');
>  
> +				# check for character before and after the word matches
> +				my $start_char = '';
> +				my $end_char = '';
> +				$start_char = substr($rawline, $start_pos - 1, 1) if ($start_pos > 0);
> +				$end_char = substr($rawline, $end_pos, 1) if ($end_pos <= length($rawline));


substr uses index 0, so I believe the if should be < 

> +
> +				if ($start_char =~ /^$exclude_chars$/ ||
> +				    $end_char =~ /^$exclude_chars$/) {
> +					next;
> +				}
 
Please use "next if (test);" to be similar to the other uses above.

And this doesn't work on end of phrase or sentence.

ie: "my sentence is is, a duplicate word word."

so $end_char could be a comma or a period.

so likely the $end_char test should be !~

What is the reason to add and use $exclude_chars?


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
