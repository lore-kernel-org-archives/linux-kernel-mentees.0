Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68060C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 11:04:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B09DC2192A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 11:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B09DC2192A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C8BB86DD9;
	Fri, 23 Oct 2020 11:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJmT16ajA+zK; Fri, 23 Oct 2020 11:04:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3CB948690F;
	Fri, 23 Oct 2020 11:04:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34929C0893;
	Fri, 23 Oct 2020 11:04:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 341A0C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 11:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1F9EE877D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 11:04:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJ9YEjHbB9Ai
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 11:04:47 +0000 (UTC)
X-Greylist: delayed 12:11:27 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0198.hostedemail.com
 [216.40.44.198])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 26483876E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 11:04:47 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id C4F128B759EE;
 Fri, 23 Oct 2020 11:04:44 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: bag64_200105227259
X-Filterd-Recvd-Size: 3643
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf10.hostedemail.com (Postfix) with ESMTPA;
 Fri, 23 Oct 2020 11:04:43 +0000 (UTC)
Message-ID: <d2b05b45adbcf3f1d16692b054862a7aa7353f6d.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 23 Oct 2020 04:04:42 -0700
In-Reply-To: <20201023094307.20820-1-dwaipayanray1@gmail.com>
References: <20201023094307.20820-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC v2] checkpatch: extend
 attributes check to handle more patterns
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

On Fri, 2020-10-23 at 15:13 +0530, Dwaipayan Ray wrote:
> It is generally preferred that the macros from
> include/linux/compiler_attributes.h are used, unless there
> is a reason not to.
> 
> Checkpatch currently checks __attribute__ for each of

checkpatch, no need for capitalization

and non-trivially:

> +			my $attr_list = qr {
> +				__alias__|
> +				__aligned__$|
> +				__aligned__\(.*\)|
> +				__always_inline__|
> +				__assume_aligned__\(.*\)|
> +				__cold__|
> +				__const__|
> +				__copy__\(.*\)|
> +				__designated_init__|
> +				__externally_visible__|
> +				__fallthrough__|
> +				__gnu_inline__|
> +				__malloc__|
> +				__mode__\(.*\)|
> +				__no_caller_saved_registers__|
> +				__noclone__|
> +				__noinline__|
> +				__nonstring__|
> +				__noreturn__|
> +				__packed__|
> +				__pure__|
> +				__used__
> +			}x;
[]
> +			my %attr_replace = (
> +				"__alias__"			=> "__alias",
> +				"__aligned__"		=> "__aligned_largest",
> +				"__aligned__("		=> "__aligned",
> +				"__always_inline__" 	=> "__always_inline",
> +				"__assume_aligned__("	=> "__assume_aligned",
> +				"__cold__"			=> "__cold",
> +				"__const__"			=> "__const",
> +				"__copy__("			=> "__copy",
> +				"__designated_init__"		=> "__designated_init",
> +				"__externally_visible__"	=> "__visible",
> +				"__fallthrough__"		=> "fallthrough",
> +				"__gnu_inline__"		=> "__gnu_inline",
> +				"__malloc__"		=> "__malloc",
> +				"__mode__("			=> "__mode",
> +				"__no_caller_saved_registers__" => "__no_caller_saved_registers",
> +				"__noclone__"		=> "__noclone",
> +				"__noinline__"		=> "noinline",
> +				"__nonstring__"		=> "__nonstring",
> +				"__noreturn__"		=> "__noreturn",
> +				"__packed__"		=> "__packed",
> +				"__pure__"			=> "__pure",
> +				"__used__"			=> "__used"
> +			);
> +
> +			if ($attr =~/^($attr_list)/) {

I would remove the __ from the entries here.

And you could check using

	$line =~ /__attribute__\s*\(\s*($balanced_parens)\s*)/

and check for all attributes in $1 after
stripping the leading and trailing parens
and any leading and trailing underscores
from each attribute.

And you only need one hash and you should 
check for existence of the key rather than
have multiple lists.

	if (exists($attributes($attr))) {

> +				my $old = $1;
> +				if ($old =~ /^(__.+__\()(.*)\)/) {
> +					my $new = $attr_replace{$1};
> +					WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> +					     "$new($2) is preffered over __attribute__(($old))\n" . $herecurr);

preferred

> +				} else {
> +					my $new = $attr_replace{$old};
> +					WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> +					     "$new is preffered over __attribute__(($old))\n" . $herecurr);
> +				}
> +			}


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
