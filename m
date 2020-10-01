Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B3DC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 18:41:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72B2C20B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 18:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72B2C20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 415FB2725F;
	Thu,  1 Oct 2020 18:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJpBQzzbs3Uv; Thu,  1 Oct 2020 18:40:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AB96B20029;
	Thu,  1 Oct 2020 18:40:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 991D1C0889;
	Thu,  1 Oct 2020 18:40:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71453C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 18:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5805E86739
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 18:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QzqoZFIboKAQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 18:40:52 +0000 (UTC)
X-Greylist: delayed 05:23:24 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0243.hostedemail.com
 [216.40.44.243])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4CF208672E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 18:40:52 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 0C775180208CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 17:25:09 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id B6BF3180A7FE4;
 Thu,  1 Oct 2020 17:25:06 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: fruit04_06039822719d
X-Filterd-Recvd-Size: 3799
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Thu,  1 Oct 2020 17:25:05 +0000 (UTC)
Message-ID: <c5e3b0067f32bc16f90390c51162b47f257935ac.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Thu, 01 Oct 2020 10:25:04 -0700
In-Reply-To: <20201001171903.312021-1-dwaipayanray1@gmail.com>
References: <20201001171903.312021-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: Andy Whitcroft <apw@canonical.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix multi-statement
 macro checks for while blocks.
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

On Thu, 2020-10-01 at 22:49 +0530, Dwaipayan Ray wrote:
> Checkpatch.pl doesn't have a check for excluding while (...) {...}
> blocks from MULTISTATEMENT_MACRO_USE_DO_WHILE error.
> 
> For example, running checkpatch.pl on the file mm/maccess.c in the
> kernel generates the following error:
> 
> ERROR: Macros with complex values should be enclosed in parentheses
> +#define copy_from_kernel_nofault_loop(dst, src, len, type, err_label)  \
> +       while (len >= sizeof(type)) {                                   \
> +               __get_kernel_nofault(dst, src, type, err_label);        \
> +               dst += sizeof(type);                                    \
> +               src += sizeof(type);                                    \
> +               len -= sizeof(type);                                    \
> +       }
> 
> The error is misleading for this case. Enclosing it in parentheses
> doesn't make any sense.
> 
> Checkpatch already has an exception list for such common macro types.
> Added a new exception for while (...) {...} style blocks to the same.
> 
> In addition, the brace flatten logic was modified by changing the
> substitution characters from "1" to "1u". This was done to ensure that
> macros in the form "#define foo(bar) while(bar){bar--;}" were also
> correctly procecssed.
> 
> Link: https://lore.kernel.org/linux-kernel-mentees/dc985938aa3986702815a0bd68dfca8a03c85447.camel@perches.com/
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

Thanks.  Andrew, can you pick this up please?

> ---
>  scripts/checkpatch.pl | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9e65d21456f1..31624bbb342e 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5299,9 +5299,9 @@ sub process {
>  			$dstat =~ s/\s*$//s;
>  
>  			# Flatten any parentheses and braces
> -			while ($dstat =~ s/\([^\(\)]*\)/1/ ||
> -			       $dstat =~ s/\{[^\{\}]*\}/1/ ||
> -			       $dstat =~ s/.\[[^\[\]]*\]/1/)
> +			while ($dstat =~ s/\([^\(\)]*\)/1u/ ||
> +			       $dstat =~ s/\{[^\{\}]*\}/1u/ ||
> +			       $dstat =~ s/.\[[^\[\]]*\]/1u/)
>  			{
>  			}
>  
> @@ -5342,6 +5342,7 @@ sub process {
>  			    $dstat !~ /^\.$Ident\s*=/ &&				# .foo =
>  			    $dstat !~ /^(?:\#\s*$Ident|\#\s*$Constant)\s*$/ &&		# stringification #foo
>  			    $dstat !~ /^do\s*$Constant\s*while\s*$Constant;?$/ &&	# do {...} while (...); // do {...} while (...)
> +			    $dstat !~ /^while\s*$Constant\s*$Constant\s*$/ &&		# while (...) {...}
>  			    $dstat !~ /^for\s*$Constant$/ &&				# for (...)
>  			    $dstat !~ /^for\s*$Constant\s+(?:$Ident|-?$Constant)$/ &&	# for (...) bar()
>  			    $dstat !~ /^do\s*{/ &&					# do {...

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
