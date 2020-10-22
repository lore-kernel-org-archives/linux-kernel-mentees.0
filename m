Return-Path: <SRS0=G515=D5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AA0C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 16:11:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2913024182
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 16:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2913024182
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D030C87857;
	Thu, 22 Oct 2020 16:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LL-eX8qa6CgO; Thu, 22 Oct 2020 16:11:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9DD3A87848;
	Thu, 22 Oct 2020 16:11:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83F65C088B;
	Thu, 22 Oct 2020 16:11:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC8E8C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 16:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7887220415
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 16:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AhZo9ySD-JK0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 16:11:03 +0000 (UTC)
X-Greylist: delayed 21:57:44 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0190.hostedemail.com
 [216.40.44.190])
 by silver.osuosl.org (Postfix) with ESMTPS id 3433A2040F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 16:11:03 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id C8C0E180A7FFC;
 Thu, 22 Oct 2020 16:11:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: ink14_5a132ed27252
X-Filterd-Recvd-Size: 2675
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Thu, 22 Oct 2020 16:11:00 +0000 (UTC)
Message-ID: <4cbbd8d8b6c4d686f71648af8bc970baa4b0ee9b.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Date: Thu, 22 Oct 2020 09:10:59 -0700
In-Reply-To: <20201022145021.28211-1-yashsri421@gmail.com>
References: <20201022145021.28211-1-yashsri421@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix false
 positives in REPEATED_WORD warning
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

On Thu, 2020-10-22 at 20:20 +0530, Aditya Srivastava wrote:
> Presence of hexadecimal address or symbol results in false warning
> message by checkpatch.pl.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3051,7 +3051,10 @@ sub process {
>  		}
>  
>  # check for repeated words separated by a single space
> -		if ($rawline =~ /^\+/ || $in_commit_log) {
> +# avoid false positive from list command eg, '-rw-r--r-- 1 root root'
> +		if (($rawline =~ /^\+/ || $in_commit_log) &&
> +		$rawline !~ /[bcCdDlMnpPs\?-][rwxsStT-]{9}/) {

Alignment and use \b before and after the regex please.

		if (($rawline =~ /^\+/ || $in_commit_log) &&
		    $rawline !~ /\b[bcCdDlMnpPs\?-][rwxsStT-]{9}\b/) {
> @@ -3065,6 +3068,34 @@ sub process {
>  				next if ($first ne $second);
>  				next if ($first eq 'long');
>  
> +				# avoid repeating hex occurrences like 'ff ff fe 09 ...'
> +				if ($first =~ /\b[0-9a-f]{2,}/) {
> +					# if such sequence occurs more than 4, it is most probably part of some of code
> +					next if ((scalar @hex_seq)>4);
> +					# for hex occurrences which are less than 4
> +					# get first hex word in the line
> +					if ($rawline =~ /\b[0-9a-f]{2,} /) {
> +						my $post_hex_seq = $';
> +
> +						# set suffieciently high default values to avoid ignoring or counting in absence of another
> +						my $non_hex_char_pos = 1000;
> +						my $special_chars_pos = 500;
> +
> +						if ($post_hex_seq =~ /[g-z]+/) {
> +							# first non hex character in post_hex_seq
> +							$non_hex_char_pos = $-[0];
> +						}
> +						if($post_hex_seq =~ /[^a-zA-Z0-9]{2,}/) {
> +							# first occurrence of 2 or more special chars
> +							$special_chars_pos = $-[0];
> +						}

What does all this code actually avoid?


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
