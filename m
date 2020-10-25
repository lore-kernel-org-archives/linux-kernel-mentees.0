Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FEAC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 13:10:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B16AB2222F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 13:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B16AB2222F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 44F642048E;
	Sun, 25 Oct 2020 13:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RuD4-MW2BtKF; Sun, 25 Oct 2020 13:10:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8DCFD20403;
	Sun, 25 Oct 2020 13:10:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 654D0C0893;
	Sun, 25 Oct 2020 13:10:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BB07C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 13:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F3B04868B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 13:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6TfIjhKdweyA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 13:10:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0131.hostedemail.com
 [216.40.44.131])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 052E9866E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 13:10:51 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id A3EEC8124C85
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 08:22:19 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id F0DF418224D7E;
 Sun, 25 Oct 2020 08:22:16 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: drum10_180efbf27269
X-Filterd-Recvd-Size: 2240
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Sun, 25 Oct 2020 08:22:16 +0000 (UTC)
Message-ID: <e96f8306d57e9a2ce7118b545db197e819e97b19.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 25 Oct 2020 01:22:14 -0700
In-Reply-To: <20201025065134.21737-1-dwaipayanray1@gmail.com>
References: <20201025065134.21737-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: extend attributes
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

On Sun, 2020-10-25 at 12:21 +0530, Dwaipayan Ray wrote:
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
> Also add fixes for the generic attributes check.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> +				if (exists($attr_list{$curr_attr})) {
> +					my $new = $attr_list{$curr_attr};
> +					if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
> +					         "$new$params is preferred over __attribute__(($attr))\n" . $herecurr) &&
> +						$fix) {
> +						$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*\Q$attr\E\s*\)\s*\)/$new$params/;

Thanks.

This fix would only work for the single conversions
and would not work for multiple attributes like:

	__attribute__((aligned(4), packed))

It would be nice to be able to convert this to

	__aligned(4) __packed

One mechanism to do that might be to:

	create an empty array
	for each attr
		push(@array, conversion)
	s/__attribute__(...)/join(' ', @array)/

if all attrs were converted.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
