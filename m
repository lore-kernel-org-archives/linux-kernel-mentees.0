Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D19FC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 16:59:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3E4D207BC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 16:59:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWyeNsi7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3E4D207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 914D185773;
	Mon,  5 Oct 2020 16:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id seEqn8UO4DI4; Mon,  5 Oct 2020 16:59:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CE8C8852D5;
	Mon,  5 Oct 2020 16:59:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1894C016F;
	Mon,  5 Oct 2020 16:59:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F1F2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 16:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 57160870E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 16:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0cJvwNztS9Rq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 16:59:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 235EA870C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 16:59:22 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id j2so10177410eds.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=cgOVR0GSPViQASRx+ad6EYz9kXxpKdibnYZ4F8aITaQ=;
 b=EWyeNsi7apqIoAvj8nJgZZQYUU6jpazO1EbrGALGqH+ps0J2Mr5CUO4Aql1DPsX1Hm
 vRWqIFIMQ/jGsfqre5glMUr5oap1nBpKesmAyRxEZr3HRiu2Uy+qh50Toz1QrjsvNvS4
 gqOO+HtsSbfH9X3sMrYzA4g6ARsqgz08wB4ZKJMMUk98/gwjW3ihItJ+1OFUUt2M0JDJ
 utCnwkQdhwJ3MfjNAEKYWoU9mVSOyiSqEcSlV/7aWUSJ1U+/mQt54SmKFTigkvYS9bHP
 5qt5Kv2Ee0TJDi+TYCQ4rA3MgeuMpU7EtTkp4UAYaoYK1RpWTyGMn/JmLV4BSYYwEdwK
 uYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=cgOVR0GSPViQASRx+ad6EYz9kXxpKdibnYZ4F8aITaQ=;
 b=qLapz0qi0KPKT6ykq0kWbZlJ/R1n41lU/fTKrqfm1DYpX/rCt9Zzc1H1vF7IJrGIXY
 zNuDqWlXj5yzuAJq/OsnUITuZXpEUMM17QsIgQOAxBZklUGDLCkfaAlCRlh4oTET2E+s
 D+NzuwKxVLvk7DzZmviQbwuwG2kJF3JVKwErThSvH60Ex0vXNMnjUjIROVnc9/skrPYm
 uNeUtUUuO4F7dwsOoAIBfDocvMa3PdjicIbNOEMDTN33UDbQL8mc7E3bjnLGgsrPQyWC
 rbkSwfZ3kG2GGJM+sjHVwMZfzwMnLhAx8/3YGi3HPW4hDVHt/GgK14n0OimjSQo1Wazp
 xYqA==
X-Gm-Message-State: AOAM531Wi+vsgEHepsaeqM2nsUlnugElZu310gLuGXQaTzrl+wj+Dlc/
 iaKU0ehWpyqhK5thdPTLIY8=
X-Google-Smtp-Source: ABdhPJxr9+mEQkrSB6Tgn4Aa5VJNnDqaDVef36RVxI9QlbWWHGvv6RE4v0RbnQ0NCnYlfVaV0oQgiQ==
X-Received: by 2002:aa7:c68b:: with SMTP id n11mr590401edq.340.1601917160582; 
 Mon, 05 Oct 2020 09:59:20 -0700 (PDT)
Received: from felia ([2001:16b8:2dcc:7300:c984:a2d0:fd72:6e87])
 by smtp.gmail.com with ESMTPSA id r11sm286041edi.91.2020.10.05.09.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 09:59:19 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 5 Oct 2020 18:59:13 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <20201005095634.69713-1-dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2010051755040.12029@felia>
References: <20201005095634.69713-1-dwaipayanray1@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add new warnings to
	author signoff checks.
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



On Mon, 5 Oct 2020, Dwaipayan Ray wrote:

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

Make the numbers and cases match the return value and just add which were 
existent before this patch.

Looks good to me. Send it out to lkml for discussion.

I did not check the whitespace and tab issues, but I hope you got it now 
right.

Lukas

 
> For the 3rd class, a --strict check message is generated, and for the
> other two, warnings are generated.
> 
> Link: https://lore.kernel.org/lkml/7958ded756c895ca614ba900aae7b830a992475e.camel@perches.com/
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 54 +++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 50 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 31624bbb342e..1380212f1a9d 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2347,6 +2347,7 @@ sub process {
>  	my $signoff = 0;
>  	my $author = '';
>  	my $authorsignoff = 0;
> +	my $author_sob = '';
>  	my $is_patch = 0;
>  	my $is_binding_patch = -1;
>  	my $in_header_lines = $file ? 0 : 1;
> @@ -2674,9 +2675,34 @@ sub process {
>  		if ($line =~ /^\s*signed-off-by:\s*(.*)/i) {
>  			$signoff++;
>  			$in_commit_log = 0;
> -			if ($author ne '') {
> +			if ($author ne ''  && $authorsignoff != 1) {
>  				if (same_email_addresses($1, $author)) {
>  					$authorsignoff = 1;
> +				} else {
> +					my $ctx = $1;
> +					my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
> +					my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
> +
> +					if ($email_address eq $author_address) {
> +						$author_sob = $ctx;
> +						$authorsignoff = 2;
> +					} elsif ($email_name eq $author_name) {
> +						$author_sob = $ctx;
> +						$authorsignoff = 3;
> +
> +						my $address1 = $email_address;
> +						my $address2 = $author_address;
> +
> +						if ($address1 =~ /(\S+)\+\S+(\@.*)/) {
> +							$address1 = $1.$2;
> +						}
> +						if ($address2 =~ /(\S+)\+\S+(\@.*)/) {
> +							$address2 = $1.$2;
> +						}
> +						if ($address1 eq $address2) {
> +							$authorsignoff = 4;
> +						}
> +					}
>  				}
>  			}
>  		}
> @@ -6891,9 +6917,29 @@ sub process {
>  		if ($signoff == 0) {
>  			ERROR("MISSING_SIGN_OFF",
>  			      "Missing Signed-off-by: line(s)\n");
> -		} elsif (!$authorsignoff) {
> -			WARN("NO_AUTHOR_SIGN_OFF",
> -			     "Missing Signed-off-by: line by nominal patch author '$author'\n");
> +		} elsif ($authorsignoff != 1) {
> +			# authorsignoff values:
> +			# 0 -> missing sign off
> +			# 1 -> sign off identical
> +			# 2 -> addresses match, names different
> +			# 3 -> names match, addresses different
> +			# 4 -> names match, addresses excuding mail extensions (subaddresses) match
> +
> +			my $sob_msg = "'From: $author' != 'Signed-off-by: $author_sob'";
> +
> +			if ($authorsignoff == 0) {
> +				WARN("NO_AUTHOR_SIGN_OFF",
> +					 "Missing Signed-off-by: line by nominal patch author '$author'\n");
> +			} elsif ($authorsignoff == 2) {
> +				WARN("NO_AUTHOR_SIGN_OFF",
> +					 "From:/Signed-off-by: email name mismatch:\n$sob_msg\n");
> +			} elsif ($authorsignoff == 3) {
> +				WARN("NO_AUTHOR_SIGN_OFF",
> +					 "From:/Signed-off-by: email address mismatch:\n$sob_msg\n");
> +			} elsif ($authorsignoff == 4) {
> +				CHK("NO_AUTHOR_SIGN_OFF",
> +					"From:/Signed-off-by: email extension mismatch:\n$sob_msg\n");
> +			}
>  		}
>  	}
>  
> -- 
> 2.27.0
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
