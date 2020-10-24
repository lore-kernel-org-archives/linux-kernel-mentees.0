Return-Path: <SRS0=3SZq=D7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09F0C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 23:41:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ED2D22246
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 23:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ED2D22246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D65B187414;
	Sat, 24 Oct 2020 23:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J-o4UndKfcbL; Sat, 24 Oct 2020 23:41:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4569F87434;
	Sat, 24 Oct 2020 23:41:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3236CC0052;
	Sat, 24 Oct 2020 23:41:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBE6FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 23:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D311E86C07
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 23:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Zde+laMkiRL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 23:40:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0168.hostedemail.com
 [216.40.44.168])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B25C986BD5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 23:40:59 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave08.hostedemail.com (Postfix) with ESMTP id C0D46182D4AD4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 23:21:40 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 47821837F24C;
 Sat, 24 Oct 2020 23:21:38 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: ants30_3d13d1a27266
X-Filterd-Recvd-Size: 3099
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Sat, 24 Oct 2020 23:21:37 +0000 (UTC)
Message-ID: <1d9d4793a6f89dda2e06ae73065ed7a28b50e02f.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 24 Oct 2020 16:21:36 -0700
In-Reply-To: <20201024090557.45092-1-dwaipayanray1@gmail.com>
References: <20201024090557.45092-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: extend attributes
 check to handle more patterns
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

On Sat, 2020-10-24 at 14:35 +0530, Dwaipayan Ray wrote:
> It is generally preferred that the macros from
> include/linux/compiler_attributes.h are used, unless there
> is a reason not to.
> 
> checkpatch currently checks __attribute__ for each of
> packed, aligned, printf, scanf, and weak. Other declarations
> in compiler_attributes.h are not handled.
> 
> Add a generic test to check the presence of such attributes.
> Some attributes require more specific handling and are kept
> separate.
[]
> -		}
> +		    $line =~ /__attribute__\s*\(\s*($balanced_parens)\s*\)/) {
> +			my $attr = $1;
> +			$attr =~ s/\s*\(\s*(.*)\)\s*/$1/;
> +
> +			my %attr_list = (
> +				"alias"				=> "__alias",
> +				"aligned"			=> "__aligned",
> +				"always_inline"			=> "__always_inline",
> +				"assume_aligned"		=> "__assume_aligned",
> +				"cold"				=> "__cold",
> +				"const"				=> "__const",
> +				"copy"				=> "__copy",
> +				"designated_init"		=> "__designated_init",
> +				"externally_visible"		=> "__visible",
> +				"fallthrough"			=> "fallthrough",

I'd remove fallthrough.

It doesn't make sense as the attribute could be in any line
of a switch/case block and fallthrough; must be the last line
of the block.

> +			if ($attr =~ /^(\w+)\s*(${balanced_parens})?/) {
> +				my $curr_attr = $1;
> +				my $params = '';
> +				$params = $2 if defined($2);
> +				$curr_attr =~ s/^[\s_]+|[\s_]+$//g;
> +
> +				if (exists($attr_list{$curr_attr})) {
> +					my $new = $attr_list{$curr_attr};
> +					WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> +					     "$new$params is preffered over __attribute__(($attr))\n" . $herecurr);

Be nice to have a $fix option here

> +			# Check for __attribute__ format(printf, prefer __printf
> +			if ($attr =~ /^_*format_*\s*\(\s*printf/) {
> +				if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> +				         "__printf(string-index, first-to-check) is preferred over __attribute__((format(printf, string-index, first-to-check)))\n" . $herecurr) &&
> +					$fix) {
> +					$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*printf\s*,\s*(.*)\)\s*\)\s*\)/"__printf(" . trim($1) . ")"/ex;

like for format(printf, index, pos)
and format(scanf, index, pos)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
