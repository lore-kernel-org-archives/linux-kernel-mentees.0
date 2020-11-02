Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96D8C00A89
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 07:25:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 358F7221FF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 07:25:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxqQnRbt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 358F7221FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B35DD87357;
	Mon,  2 Nov 2020 07:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kwSpfeTg-47V; Mon,  2 Nov 2020 07:25:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0869C87232;
	Mon,  2 Nov 2020 07:25:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7542C0889;
	Mon,  2 Nov 2020 07:25:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 424FFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 30620203D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctQX-2rmS0E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:25:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id BB24C20482
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:25:03 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n18so13278953wrs.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Nov 2020 23:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=MQLK4mNHZJD9Sm9TBD2qY+qgjTLh5nvxbcWNeHwWuC4=;
 b=VxqQnRbtbaNl+H8CmQGVaPXGB0CCNc0Xi6bO7/f7naYr+rzAiPU+HI9sdmh0eTwQc1
 I5u+lm91DVGejVldeZodHe1jNBi/aQAmV9ESncDFixjCgrWEiq8SmcfW9ORFXsLMb1wJ
 0d+6TZvyFvSRvgS+k7n6HyWyH6E12S48jKwVYzTkqLchWZ7Qwa0oujcbfKAFgciu58pZ
 kpNGUuBkstVfJDpWmVvt5RcwhogjzNRG+Y4vZ+zm4Sti0TubqrNGjmpmQs6X447r3l29
 EI/XZj8r14ObxJYqpQ4fGNKRX7GowFGFVMXVe9OOfY046PFEU3N9nxgE86vxSIu/1xg8
 gXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=MQLK4mNHZJD9Sm9TBD2qY+qgjTLh5nvxbcWNeHwWuC4=;
 b=f196kimrbWd75uO0EY4LynJhrFsdRGCf/WG3FhQTGltcCvsKgDWG2A8ny+b/crTnCX
 bXYeYO29bzNkwVRDG12cn1ED7zqORBQsCYO8/jBMCAekNXzCmfD6I+j8zPmimNi58Rz2
 Hpi6YQQnEH+6X8wVZiRLnjkNV3BxGk8p9B6yjBsbNww365HOFGvE8RZZKaTFIZJP6QDL
 rafBfZCMvRvvKRK50ePOAakRlZe2NG/qgyD+5Q1g/rb/OzeNaJVsBiJWWJ4YsplJUPS4
 UkgIBRW+Fd7wEjeSl7CZzmWSSdPRWu2LM6MAjFLneghwUWXQcetAKDrMp+zIKqqgeHTH
 5hiQ==
X-Gm-Message-State: AOAM53022vSOwvE0lz/lRt6IGIPheLcaQWTthmvcti7wMrsb6fp7vXpE
 wiys38xfsVJB1tNT7kEOKsQ=
X-Google-Smtp-Source: ABdhPJxEqyFfZXxoza41bJZ4cFQMDkS0LV1ZKc7VfQJO9u1MiYmgiCrmv/qqnWQgGXbpqIEpRGcMfw==
X-Received: by 2002:adf:b190:: with SMTP id q16mr19057132wra.288.1604301902289; 
 Sun, 01 Nov 2020 23:25:02 -0800 (PST)
Received: from felia ([2001:16b8:2d08:5700:a4fc:57d8:461e:80f1])
 by smtp.gmail.com with ESMTPSA id t11sm10407348wmf.35.2020.11.01.23.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 23:25:01 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 2 Nov 2020 08:25:00 +0100 (CET)
X-X-Sender: lukas@felia
To: Aditya Srivastava <yashsri421@gmail.com>
In-Reply-To: <20201031132556.10379-1-yashsri421@gmail.com>
Message-ID: <alpine.DEB.2.21.2011020808040.11801@felia>
References: <20201031132556.10379-1-yashsri421@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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



On Sat, 31 Oct 2020, Aditya Srivastava wrote:

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

This is wrong on multiple levels:

1. We must first ensure that the COMMIT_LOG_LONG_LINE are actually 
largely true positives, i.e., it really makes sense to break those lines. 
In my evaluations, I found many cases where it is clear that lines should 
not be broken because it is tool output etc.

2. You cannot just break at character 75. You would need to identify word 
boundaries and break there.

3. The proper fix is to identify the whole paragraph and then word-wrap 
the whole paragraph with a limit of 75. Just adding some content in a new 
line will make the commit message even more unreadable than before. So, 
that is not a fix.


So, I suggest to come up with a good strategy to really identify 
COMMIT_LOG_LONG_LINE that sensibly can be word-wrapped, i.e.,
distinguish between free-floating commit description and tool output,
and then implement that word wrap properly.

Or to prioritize another issue and possiblity for fix rules.

You can see that there are potentially some good options for fixes around 
the tags and sign-offs Dwaipayan has investigated.

I am pretty sure this patch is this state will not be accepted.

Lukas

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
> -- 
> 2.17.1
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
