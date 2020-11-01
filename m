Return-Path: <SRS0=yjWw=EH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E667DC55179
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Nov 2020 11:04:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FD8920756
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Nov 2020 11:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eu2XwJaM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FD8920756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E28587460;
	Sun,  1 Nov 2020 11:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6ikG6Mje9Ce; Sun,  1 Nov 2020 11:04:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4A2318745F;
	Sun,  1 Nov 2020 11:04:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E0B9C088B;
	Sun,  1 Nov 2020 11:04:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F22A0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 11:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DCFA28764C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 11:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uqkZv4uwgFdh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 11:04:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CE22A87618
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 11:04:10 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id g19so1052606pji.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Nov 2020 03:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rG3GBzV1DxebD4Yv+WVYveg501aneeVTu56PfKT/lyI=;
 b=Eu2XwJaM5BKn88VBm3LnJELt8SRkfpfAMnTvEFoWATfsxIyN4RRMuMVNV8CbQgBVcW
 FiyYs6iExWQsBikTJkARjqpOaC3UWkc/eSirayptM6tllO0Z1A2vleeq4HS9cT2RubjY
 eFfZoyJ3LXF0Jl3ykWJx8s76hSDKCFP5gOBKC/tLHYqgrlQYnLvrVwwBxV+98i5ZLnqu
 Zv0xGYXBxOGJHElj6YuDPgWF/bXUOqpqc5kMMi/8Kwes5gFnprs5zzW2MKjxUglluEav
 8jxZ8JjBeOcQvJFgCmrle6k+7lVS4KMJwR+cMla6bhoI+zoKSwzCmDBdGxandS0oDc3c
 ktkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rG3GBzV1DxebD4Yv+WVYveg501aneeVTu56PfKT/lyI=;
 b=LZz1/vYvg/JsLatQgqMNrf7h+gdjm1CUzW/UDGgmgrPjJ/GljwASsuWXzdI9DfKavG
 gnoyWc2tgQxCo0BVG0g8XYHmIIetYxffmXtvacRvfpk0L/CD+fktD/QnaDaTHtQZBJh8
 cE1XdCdzjCk5PUI8q8ebIu0SvnU7CQhwnDBd2bpT7qGicGynwTjnlgIN0qGEtSVmhJFz
 JiFBLI7Ar4K5YpTarGeDIElSRGDdbNhXrKp0caTjuEx1xeBwlcWMgseawBNdU9GmFTqe
 H+3sYKK0E/gLq18R9yc3uPd2SqcIDUjbhuqLVPelrni/5wHDWyzto9wa3uTfuC8zb06D
 H43A==
X-Gm-Message-State: AOAM533PgcCsHQ8yBbDQy3kUcOdoLi6bcbqdTBCecCRpIXqiUMbUqgQN
 mQ//9MUe09n8Fo3Wh2nvQjBfq/E8voqeaA==
X-Google-Smtp-Source: ABdhPJwnRuVpr5c50Doc43+SFyFm/l1WUmuBOtYipGs2j64n5HfZ5aCNkOIG6WyDmuvMaeYDrq2L1w==
X-Received: by 2002:a17:90a:d98c:: with SMTP id
 d12mr12639614pjv.191.1604228650136; 
 Sun, 01 Nov 2020 03:04:10 -0800 (PST)
Received: from ?IPv6:2402:3a80:40c:3397:d01d:7878:b941:f1cf?
 ([2402:3a80:40c:3397:d01d:7878:b941:f1cf])
 by smtp.gmail.com with ESMTPSA id c127sm10968379pfc.115.2020.11.01.03.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2020 03:04:09 -0800 (PST)
To: lukas.bulwahn@gmail.com
References: <20201031132556.10379-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <dbe7fc9c-8b68-aa2a-f35b-1a387b373186@gmail.com>
Date: Sun, 1 Nov 2020 16:34:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201031132556.10379-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	COMMIT_LOG_LONG_LINE
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

On 31/10/20 6:55 pm, Aditya Srivastava wrote:
> Currently, if a line exceeds 75 characters in a commit message,
> checkpatch.pl gives a warning corresponding to the same.
> 
> E.g., running checkpatch on commit a1af2afbd244 ("drm/nouveau/volt:Fix
> for some cards having 0 maximum voltage") reports this warning:
> 
> WARNING: Possible unwrapped commit description (prefer a maximum 75
> chars per line)
> 
> Some, mostly Fermi, vbioses appear to have zero max voltage. That causes Nouveau to not parse voltage entries, thus users not being able to set higher clocks.
> 
> Fix this warning by truncating the line after 75 chars, and push the
> remaining content to the next line
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 5329927fc1c1..a0107ed257d1 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2881,8 +2881,20 @@ sub process {
>  		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
>  					# A Fixes: or Link: line
>  		      $commit_log_possible_stack_dump)) {
> -			WARN("COMMIT_LOG_LONG_LINE",
> -			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
> +			if (WARN("COMMIT_LOG_LONG_LINE",
> +			     	 "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr) &&
> +			    $fix) {
> +				fix_delete_line($fixlinenr, $rawline);
> +				my $curr_line = $rawline;
> +				my $fixedline;
> +				while (length($curr_line) > 0) {
> +					# trim current line for any unnecessary spaces
> +					$curr_line = trim($curr_line);
> +					$fixedline = substr($curr_line, 0, 75);
> +					fix_insert_line($fixlinenr+1, $fixedline);
> +					$curr_line =~ s/$fixedline//;
> +				}
> +			}
>  			$commit_log_long_line = 1;
>  		}
>  
> 

Hi Sir
Seeking your feedback on this one

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
