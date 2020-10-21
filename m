Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000BCC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 15:19:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BFFA2177B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 15:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BFFA2177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 05AF587401;
	Wed, 21 Oct 2020 15:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n+XztXF3-LLS; Wed, 21 Oct 2020 15:19:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4AAEE87400;
	Wed, 21 Oct 2020 15:19:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32A97C088B;
	Wed, 21 Oct 2020 15:19:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF569C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9E67886505
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0NEmWR0bPD3g
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:19:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0064.hostedemail.com
 [216.40.44.64])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C4584864C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:19:00 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 7961A180A7FFA;
 Wed, 21 Oct 2020 15:18:59 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: tail45_2c0cd3027249
X-Filterd-Recvd-Size: 2737
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Wed, 21 Oct 2020 15:18:58 +0000 (UTC)
Message-ID: <f073750511750336de5f82600600ba6cb3ddbec0.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Date: Wed, 21 Oct 2020 08:18:57 -0700
In-Reply-To: <20201021150120.29920-1-yashsri421@gmail.com>
References: <20201021150120.29920-1-yashsri421@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
	for REPEATED_WORD warning
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

On Wed, 2020-10-21 at 20:31 +0530, Aditya Srivastava wrote:
> Presence of hexadecimal address or symbol results in false warning
> message by checkpatch.pl.
> 
> For example, running checkpatch on commit b8ad540dd4e4 ("mptcp: fix
> memory leak in mptcp_subflow_create_socket()") results in warning:
> 
> WARNING:REPEATED_WORD: Possible repeated word: 'ff'
>     00 00 00 00 00 00 00 00 00 2f 30 0a 81 88 ff ff  ........./0.....

Right.

> To avoid all such reports, add an additional regex check for a repeating
> pattern of 4 or more 2-lettered words separated by space in a line.

> A quick evaluation on v5.6..v5.8 showed that this fix reduces
> REPEATED_WORD warnings from 2797 to 1043.

Are many of the other 1043 false positives?
Any pattern to them?

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3050,8 +3050,10 @@ sub process {
>  			}
>  		}
>  
> -# check for repeated words separated by a single space
> -		if ($rawline =~ /^\+/ || $in_commit_log) {
> +# check for repeated words separated by a single space and
> +# avoid repeating hex occurrences like 'ff ff fe 09 ...'
> +		if (($rawline =~ /^\+/ || $in_commit_log) &&
> +		$rawline !~ /(\b[0-9a-f]{2}( )+){4,}/) {

This might be better as \b$Hex to avoid FF FF
and FFFFFFFF FFFFFFFF

I might add that check to the line below where
the repeated words are checked against long
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fab38b493cef..929866999f81 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3062,6 +3062,7 @@ sub process {
 
 				next if ($first ne $second);
 				next if ($first eq 'long');
+				next if ($first =~ /^$Hex$/;
 
 				if (WARN("REPEATED_WORD",
 					 "Possible repeated word: '$first'\n" . $herecurr) &&


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
