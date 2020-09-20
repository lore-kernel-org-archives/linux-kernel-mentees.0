Return-Path: <SRS0=4nEd=C5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C3BC43463
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 17:40:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2084820789
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Sep 2020 17:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2084820789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB2F785F2F;
	Sun, 20 Sep 2020 17:40:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AUjuCeM1vVhJ; Sun, 20 Sep 2020 17:39:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 98D4A85DC7;
	Sun, 20 Sep 2020 17:39:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9243DC0859;
	Sun, 20 Sep 2020 17:39:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BAB7AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 17:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B231386A25
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 17:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8LB3ClC+NVtn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 17:39:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0242.hostedemail.com
 [216.40.44.242])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C429686A24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 17:39:55 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id C252E1813BCF7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Sep 2020 17:39:53 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id BBEF0180A7FDD;
 Sun, 20 Sep 2020 17:39:51 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: shame47_050a3db2713e
X-Filterd-Recvd-Size: 2993
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Sun, 20 Sep 2020 17:39:50 +0000 (UTC)
Message-ID: <cb359f57c645831ac4f4d89cf67ab1101ac76c00.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Sun, 20 Sep 2020 10:39:49 -0700
In-Reply-To: <20200920091706.56276-1-dwaipayanray1@gmail.com>
References: <20200920091706.56276-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: apw@canonical.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: extend author
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

On Sun, 2020-09-20 at 14:47 +0530, Dwaipayan Ray wrote:
> Checkpatch did not handle cases where the author From: header
> was split into multiple lines. The author identity could not
> be resolved and checkpatch generated a false NO_AUTHOR_SIGN_OFF
> warning.
> 
> A typical example is Commit e33bcbab16d1 ("tee: add support for
> session's client UUID generation"). When checkpatch was run on
> this commit, it displayed:
> 
> "WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal
> patch author ''"
> 
> This was due to split header lines not being handled properly and
> the author himself wrote in Commit cd2614967d8b ("checkpatch: warn
> if missing author Signed-off-by"):
> 
> "Split From: headers are not fully handled: only the first part
> is compared."
> 
> Support split From: headers by correctly parsing the header
> extension lines. RFC 2822, Section-2.2.3 stated that each extended
> line must start with a WSP character (a space or htab). The solution
> was therefore to concatenate the lines which start with a WSP to
> get the correct long header.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Link: https://lore.kernel.org/linux-kernel-mentees/f5d8124e54a50480b0a9fa638787bc29b6e09854.camel@perches.com/
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

Acked-by: Joe Perches <joe@perches.com>

> ---
>  scripts/checkpatch.pl | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 504d2e431c60..9e65d21456f1 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2661,6 +2661,10 @@ sub process {
>  # Check the patch for a From:
>  		if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
>  			$author = $1;
> +			my $curline = $linenr;
> +			while(defined($rawlines[$curline]) && ($rawlines[$curline++] =~ /^[ \t]\s*(.*)/)) {
> +				$author .= $1;
> +			}
>  			$author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
>  			$author =~ s/"//g;
>  			$author = reformat_email($author);

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
