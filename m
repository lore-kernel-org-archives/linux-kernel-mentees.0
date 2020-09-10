Return-Path: <SRS0=Icdq=CT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE22CC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 07:02:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DD8720732
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Sep 2020 07:02:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIUOxaEN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DD8720732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 08C0E874BB;
	Thu, 10 Sep 2020 07:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9YC9mG2V2xkZ; Thu, 10 Sep 2020 07:02:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CDD628741C;
	Thu, 10 Sep 2020 07:02:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4214C0052;
	Thu, 10 Sep 2020 07:02:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B05EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 07:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 59C9A87518
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 07:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J+7afZ3pq+Sy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 07:02:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EA98587517
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 07:02:25 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id t16so5179736edw.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 00:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=RCTyRjMua0wQIG4ynt/lT/11wRzgd1wYhGuolc//qQ8=;
 b=IIUOxaENQ7H6hn5b/lwCuMAFx5bMtgMNuJDjO4AQC8luvOjt7HCAdpPLOvpzYmqfMb
 C9682pKll9iCDowcr0NMLfp5joJbE0MAoBi16avM+HldNKOiwRnFNUQn2fnP1Abj5jRF
 BdBBu8QhVi2gxDViI71gk4j7qUWhOq4h/5ikLRW1ieW0SMVgJdqcSYybk03QdS6c4HyQ
 Fb8Q/LCe1n6hknZDgT2jSKwVAFp13unggatwMrbBIgynJlqyxPpZbYMUqaKNCF6KMzFU
 UyPXkJZDmZ5ZJxUVfpYkbNHQXvO2s6qrCtrwUQmBy22Ne2HVoLXibtkqCsXs/sT37C1M
 bjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=RCTyRjMua0wQIG4ynt/lT/11wRzgd1wYhGuolc//qQ8=;
 b=imhWcRjCc5lLCDT2VUokKlIOjJM1mnSve69BWqBBHfWEjws0sedpIH1i97oysNajqX
 VIYM7AvgaGh+2zJO0DK3pe9EGqya71Cv4DefQ/TQ3ZZVkSRxKA64nVBh6QAn+wxuimuA
 wRTzBMkQ+qVrLhCYpJYUj9uXTpiEmI/IRPp2IKjUOUQvNTM9xRYW1aUH08sDYpNLGuHu
 hNSbtlqB9r343tVcO6UyUNruPO/x0WBE5ZRoKn7nv5BpdZFZ+UgAd8Wu9kAzgg9C75gz
 NS2PFpvMKijDd+iNpTNsVn3BIwiL3tXqQXdkDPaTiFCMD8svY9t4ul0XqKhnUL29Oybv
 IN4A==
X-Gm-Message-State: AOAM531zKaTxpT3MjXnb4uL2N2m0y/AzESQKHp14IsTrz/E8seHyiyV9
 wTfgITYzUVG43jDCBW06wWk=
X-Google-Smtp-Source: ABdhPJya1h8tJoIq0ewhV5AuV6AfvwwUSmnqCJrH4iMr/dTmNmDhnfYWBxmR806bdW9v6dlWY+NALQ==
X-Received: by 2002:a05:6402:6d3:: with SMTP id
 n19mr7626014edy.381.1599721344298; 
 Thu, 10 Sep 2020 00:02:24 -0700 (PDT)
Received: from felia ([2001:16b8:2d2b:3f00:adbe:f1da:86fc:8df])
 by smtp.gmail.com with ESMTPSA id rn4sm5751353ejb.43.2020.09.10.00.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 00:02:23 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 10 Sep 2020 09:02:22 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <20200910063834.42495-1-ayush@disroot.org>
Message-ID: <alpine.DEB.2.21.2009100843320.5893@felia>
References: <20200910063834.42495-1-ayush@disroot.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: handle line break
 between commit and hash value
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



On Thu, 10 Sep 2020, Ayush wrote:

> While checking for improperly formed commit desciptions,
> those cases where there is a line break between commit and
> hash value, are not handled properly and an error is given.
>

This sentence above is not comprehensible.

How about

  checkpatch.pl checks for proper references to other commits with 
the intended format, commit <12 characters of SHA-1 ID> ("<commit 
message") and warns about typical mistakes. Currently, it does 
not handle the case where there is a line break between commit and the 
hash value.

It falsely warns that the hash is not prefixed by the word commit.

At the very end, you can also write:

  This issue was discovered through a thorough investigation of 
  checkpatch.pl warnings of type COMMIT_ID on commit range ??.

Maybe you can then also report a before and after statistics to see the 
impact of your change?

> This adds new conditions to parse and identify such commits and
> to not give error in such cases.
>

"to not give error" is not proper English, how about "to not report an 
error"?

> following type of cases are handled:
> 
> - Without quotes in commits message.
> commit
> f4d51dffc6c01 ("Linux 5.9-rc4")
> 
> - With quotes in commit message.
> commit
> 77f4689de17c ("fix regression in "epoll: Keep a reference on files added to the check list"")
> 
> (commits taken as example only)
>

THIS IS IMPORTANT:

You are doing two things at once, and hence the review is more difficult.

How about one commit for each new case you are handling?

One commit for handling the line break, then another commit for handling 
quotes in commit messages?


Looking forward to the next version.

Lukas
 
> Signed-off-by: Ayush <ayush@disroot.org>
> ---
>  scripts/checkpatch.pl | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 149518d2a6a7..639eb55041eb 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2831,8 +2831,9 @@ sub process {
>  		if ($in_commit_log && !$commit_log_possible_stack_dump &&
>  		    $line !~ /^\s*(?:Link|Patchwork|http|https|BugLink|base-commit):/i &&
>  		    $line !~ /^This reverts commit [0-9a-f]{7,40}/ &&
> -		    ($line =~ /\bcommit\s+[0-9a-f]{5,}\b/i ||
> -		     ($line =~ /(?:\s|^)[0-9a-f]{12,40}(?:[\s"'\(\[]|$)/i &&
> +		    ($line =~ /\bcommit$/i ||
> +		     $line =~ /\bcommit\s+[0-9a-f]{5,}\b/i ||
> +		     ($line =~ /(?:\s)[0-9a-f]{12,40}(?:[\s"'\(\[]|$)/i &&
>  		      $line !~ /[\<\[][0-9a-f]{12,40}[\>\]]/i &&
>  		      $line !~ /\bfixes:\s*[0-9a-f]{12,40}/i))) {
>  			my $init_char = "c";
> @@ -2852,6 +2853,8 @@ sub process {
>  				$orig_commit = lc($2);
>  			} elsif ($line =~ /\b([0-9a-f]{12,40})\b/i) {
>  				$orig_commit = lc($1);
> +			} elsif ($rawlines[$linenr] =~ /^([0-9a-f]{12,40})\b/i) {
> +				$orig_commit = lc($1);
>  			}
>  
>  			$short = 0 if ($line =~ /\bcommit\s+[0-9a-f]{12,40}/i);
> @@ -2874,6 +2877,18 @@ sub process {
>  				$rawlines[$linenr] =~ /^\s*([^"]+)"\)/;
>  				$orig_desc .= " " . $1;
>  				$hasparens = 1;
> +			} elsif ($line =~ /\bcommit$/i &&
> +				 defined $rawlines[$linenr]) {
> +				if($rawlines[$linenr] =~ /\b[0-9a-f]{5,}\s+\("([^"]+)"\)/i) {
> +					$orig_desc = $1;
> +				} elsif($rawlines[$linenr] =~ /\b[0-9a-f]{5,}\s+\("([^"]+"[^"]+[^"]")"\)/i) {
> +					$orig_desc = $1;
> +				}
> +				$hasparens = 1;
> +				$space = 0;
> +				$short = 0 if ($rawlines[$linenr] =~ /^[0-9a-f]{12,40}/i);
> +				$long = 1 if ($rawlines[$linenr] =~ /^[0-9a-f]{41,}/i);
> +				$case = 0 if ($rawlines[$linenr] =~ /^[0-9a-f]{5,40}[^A-F]/i);
>  			}
>  
>  			($id, $description) = git_commit_info($orig_commit,
> -- 
> 2.28.0
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
