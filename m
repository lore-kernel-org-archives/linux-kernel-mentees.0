Return-Path: <SRS0=VniB=G7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A30C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Jan 2021 19:18:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C9B864E3A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Jan 2021 19:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C9B864E3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BC2BB8730F;
	Thu, 28 Jan 2021 19:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwklIpUqTf0E; Thu, 28 Jan 2021 19:18:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A9F087283;
	Thu, 28 Jan 2021 19:18:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34A32C0FA7;
	Thu, 28 Jan 2021 19:18:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35E3EC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 19:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 318518730A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 19:18:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1AzOW02O5Cdh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 19:18:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0076.hostedemail.com
 [216.40.44.76])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ABA0B87283
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 19:18:45 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 7866918024A65
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 19:11:10 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id D34D3181D3042;
 Thu, 28 Jan 2021 19:11:07 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: patch09_4108f99275a2
X-Filterd-Recvd-Size: 2214
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Thu, 28 Jan 2021 19:11:06 +0000 (UTC)
Message-ID: <37535426fad04587289023e3dcc705a438c59ef6.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 28 Jan 2021 11:11:05 -0800
In-Reply-To: <20210128143802.15888-2-dwaipayanray1@gmail.com>
References: <20210128143802.15888-1-dwaipayanray1@gmail.com>
 <20210128143802.15888-2-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 1/3] checkpatch: add verbose
	mode
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

On Thu, 2021-01-28 at 20:08 +0530, Dwaipayan Ray wrote:
> Add a new verbose mode to checkpatch.pl to emit additional verbose
> test descriptions. The verbose mode is optional and can be enabled
> by the flag -v or --verbose.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[] 
> +sub load_docs {
> +	open(my $docs, '<', "$docsfile")
> +	    or warn "$P: Can't read the documentation file $docsfile $!\n";
> +
> +	my @lines = ();
> +	while (<$docs>) {
> +		my $line = $_;
> +
> +		$line =~ s/\s*\n?$//g;

chomp

> +		push (@lines, $line);
> +	}
> +	close($docs);
> +
> +	my $linenr = 0;
> +	my $cnt = scalar @lines;
> +	while ($linenr < $cnt) {
> +		while ($linenr < $cnt &&
> +		       $lines[$linenr++] !~ /^\:(.+)\:$/)
> +		{
> +		}
> +
> +		last if ($linenr >= $cnt);
> +
> +		my $type = $lines[$linenr - 1];
> +		$type =~ s/^\:(.+)\:$/$1/;
> +		my $message = '';
> +
> +		while ($linenr < $cnt &&
> +		       $lines[$linenr] =~ /^(?:\s+(.+)$|$)/) {
> +			$message .= $1 if (defined $1);
> +			$message .= "\n";
> +			$linenr++;
> +		}
> +
> +		$message = trim($message);
> +		$verbose_messages{$type} = $message;
> +	}
> +}

I think this is overly complicated.

There's no need to read and store the entire file and then
parse it.  Just parse it line by line as its read.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
