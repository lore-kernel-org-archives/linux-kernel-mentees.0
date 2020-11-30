Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FACC64E8A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 09:45:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0317207F7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 09:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QU6dr425"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0317207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 309B422875;
	Mon, 30 Nov 2020 09:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hAdFvF0Rcq25; Mon, 30 Nov 2020 09:45:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D745522843;
	Mon, 30 Nov 2020 09:45:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC4E7C0859;
	Mon, 30 Nov 2020 09:45:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A82FC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 603CD86925
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c87j0qXsbqgy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:45:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CA4FF86910
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:45:12 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id s63so9749463pgc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 01:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4hXlOHiUGB8Erw3bFDxPZbhc0EiZXLXRk8mF5Y0gpNA=;
 b=QU6dr425vlwunMB8BIlO60w5RYCztvwPEnzfkfKRb4fq9p31d40c7XEdiHzwvSzGJH
 60chsTKcneLwgWwyiwQeZB/rZFofU4uWAhZnCYha46V82trRG1czhPMJxuge1OBOjMF6
 bIpZAuoVefwGAiDUk+UB1vn+GljCAF9fdb46IH6yx6opNLfw1hbdPQapMbEBjlWob1tn
 maMxg8NjZfEuIfHZkPldyWK8OVbAkfbFP1lJ9kdmCgqo9OSLMqluM8Vk4rgzCIVlVVO5
 D4IJf3XkUi8s9SK20PP2orApXhk5nPGHMZM+BTGdDI+d4faePVc+9yDkrH6n+Hv/eLye
 Ethw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4hXlOHiUGB8Erw3bFDxPZbhc0EiZXLXRk8mF5Y0gpNA=;
 b=iDICF4JDjfHQp2DYrUaU5UkHxm8UZHg6Z661TBZ1L2bROMtfH3+cJPqHqCLqbgS4z1
 l78jsjjnPvMf5M5RmbCwjI9uvvz43xYozLoHp4xUBCWoAbYOKSA5ILraut3ahZX9ySUu
 8WZPm5iyvE5si2RPhL4nC6LIgQfq8wuVT8k9qckEQgJsptb7PWq8U25fjbige5LnlDXw
 MLENCRaxZOBDF9v4f7pvhNaRFZtnNIkkqpMyBR5Fo6rkSh399QygAfEfosqwLDOgixlo
 djxg+GZ6juvoQkiA0z4hZRprTR+bwtphRMtN6xoNJYZUQuzgagJ4LQeZygLyMRiEEjkq
 m+eA==
X-Gm-Message-State: AOAM531inu6HmVEsA/Z2ycxAggJq5ozFZrRYJmyG4QkFMo69IEDcqsvx
 BcnhPsIaCnvj7n0RY7LzibYInFuS0TIKSQ==
X-Google-Smtp-Source: ABdhPJyDQ+p9uM1TEV1XzEeDGROVjTuDPYfnfvQucucH3IGDXy+u7pEd4aZ/3B527aKUns7PpuQYbg==
X-Received: by 2002:aa7:9087:0:b029:197:daff:a9a8 with SMTP id
 i7-20020aa790870000b0290197daffa9a8mr17827668pfa.26.1606729511997; 
 Mon, 30 Nov 2020 01:45:11 -0800 (PST)
Received: from ?IPv6:2402:3a80:419:6b90:c59c:7043:caf9:832d?
 ([2402:3a80:419:6b90:c59c:7043:caf9:832d])
 by smtp.gmail.com with ESMTPSA id t36sm14871328pfg.55.2020.11.30.01.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 01:45:11 -0800 (PST)
To: joe@perches.com
References: <20201130091042.14987-1-yashsri421@gmail.com>
 <20201130091545.15585-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <e049e52a-4b33-ac23-bf33-241f5cc5ea12@gmail.com>
Date: Mon, 30 Nov 2020 15:15:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130091545.15585-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix option
	for MISSING_SIGN_OFF
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

On 30/11/20 2:45 pm, Aditya Srivastava wrote:
> Currently checkpatch warns us if there is no 'Signed-off-by' line for
> the patch.
> 
> E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
> Completely remove --version flag") reports this error:
> 
> ERROR: Missing Signed-off-by: line(s)
> 
> Provide a fix by adding a Signed-off-by line corresponding to the author
> of the patch before the patch separator line.
> 
> Also, avoid this fix with the Non-standard signature warning, as the
> missing sign off is most likely because of typo.
> 
> E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
> for quirk") we get missing sign off as well as bad sign off warnings for:
> 
> Siganed-off-by: Tony Lindgren <tony@atomide.com>
> 
> Here it is probably best to fix the typo with BAD_SIGN_OFF warning and
> avoid adding an additional signoff.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> applies over next-20201120 and my last changes at:https://lore.kernel.org/linux-kernel-mentees/db1195235752685fc85fb52ecb1b1af3f35b5394.camel@perches.com/T/#u
> 
> Changes in v2:
>   Add space after 'if'
>   Add check for $patch_separator_linenr to be greater than 0
> 
> Changes in v3:
>   Give MISSING_SIGN_OFF warning irrespective of the value of $non_standard_signature, add check with fix option instead
>   Modify commit message accordingly
> 
>  scripts/checkpatch.pl | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 4a026926139f..3abf34bb9b00 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2462,6 +2462,8 @@ sub process {
>  
>  	my $last_blank_line = 0;
>  	my $last_coalesced_string_linenr = -1;
> +	my $patch_separator_linenr = 0;
> +	my $non_standard_signature = 0;
>  
>  	our @report = ();
>  	our $cnt_lines = 0;
> @@ -2813,6 +2815,10 @@ sub process {
>  		if ($line =~ /^---$/) {
>  			$has_patch_separator = 1;
>  			$in_commit_log = 0;
> +			# to add missing signed-off-by line before diff(s)
> +			if ($patch_separator_linenr == 0) {
> +				$patch_separator_linenr = $linenr;
> +			}
>  		}
>  
>  # Check if MAINTAINERS is being updated.  If so, there's probably no need to
> @@ -2842,6 +2848,7 @@ sub process {
>  						$fixed[$fixlinenr] =~ s/$sign_off/$suggested_signature/;
>  					}
>  				}
> +				$non_standard_signature = 1;
>  			}
>  			if (defined $space_before && $space_before ne "") {
>  				if (WARN("BAD_SIGN_OFF",
> @@ -7188,8 +7195,11 @@ sub process {
>  	}
>  	if ($is_patch && $has_commit_log && $chk_signoff) {
>  		if ($signoff == 0) {
> -			ERROR("MISSING_SIGN_OFF",
> -			      "Missing Signed-off-by: line(s)\n");
> +			if (ERROR("MISSING_SIGN_OFF",
> +				  "Missing Signed-off-by: line(s)\n") &&
> +			    $fix && !$non_standard_signature && $patch_separator_linenr > 0) {
> +				fix_insert_line($patch_separator_linenr - 1, "Signed-off-by: $author");
> +			}
>  		} elsif ($authorsignoff != 1) {
>  			# authorsignoff values:
>  			# 0 -> missing sign off
> 

In reply to:
https://lore.kernel.org/linux-kernel-mentees/f21acc492ab37acc42390abffb61aed370a22118.camel@perches.com/

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
