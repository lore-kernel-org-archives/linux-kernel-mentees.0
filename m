Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF30FC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 13:11:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ADDA20674
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 13:11:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1uzspNk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ADDA20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6D7178710E;
	Tue, 10 Nov 2020 13:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhSOLwErb19W; Tue, 10 Nov 2020 13:11:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 54E658709A;
	Tue, 10 Nov 2020 13:11:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47D06C0889;
	Tue, 10 Nov 2020 13:11:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB277C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 13:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B8E4C870D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 13:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11WhRFvBQ66K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 13:11:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 187B68709A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 13:11:24 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i7so10115790pgh.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 05:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Az+ydsTtN3wQ1Sht4+i8KQf933M2gqGHGmpLhFppT4=;
 b=I1uzspNkDNSldpZFt39YhSSkV/2ceuS5e12yJ26SZg82oqe7CZAxxVXBQh6Sfsk31m
 2O4ek+oWf6kad4jWIJZSRG8EqVFUZx80gT4Wt9jNAOqodkRh4pyKlKPZt/eLdkhGRaL+
 PhJ/uGbbESSCqnN5udnkQ/IpU6zdErbCVUJ8jWi/oESXN0fHjP2+qNf22xMfJXgzz9Rq
 7gf90Hg9HYazlCU3I/mWlIbvJPe5/BVUCwysBxr8YPEEQ/OdWdumYe7EREH2moukCGns
 /eMBncRjPG+1R0dYYwV3yrod98MTfTeRDnVdmhbGda7GS/Liova8T98/+UtRk0Byynrl
 IZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Az+ydsTtN3wQ1Sht4+i8KQf933M2gqGHGmpLhFppT4=;
 b=IH5WlkRDSPCdn76JDF0CyTmK3zVcMKdfTaNQCpajJ0/pfT7eENBkM090uKEgPaeoBy
 uj1lK08fZ6CXHTVeLOY2hWObfGNQsJgbpTxskc7mYd3/29dj0WRAA/uqIxjat+DL3Ctd
 WCGAVWzFbsDNwbGor48Rk1GP9Vu2oGm8ZbCH73TfTprGTnJBurF/7DYzC47pdj78AdJ0
 mWWHDSbmPHjEweqJajiCJMfyydKLJGrdMiw7zLYpbbnjZIZ5kQJ9IRV+6INsg+QsPkiQ
 pG9Bd5GnaLmkCmVHMpF6qIdNoYFbI6bPL3XVtMk/0a0Zpsae8v2tWHMj9m6UDH2ybme8
 iwnA==
X-Gm-Message-State: AOAM531QOpFawncWdUvBTfkERkrayqtWXka/ZCUXwBXsOj+IG9ml88Ao
 RPL9ib4IF2ciR/Hx6RJgz6Xc+t+V1pgOkg==
X-Google-Smtp-Source: ABdhPJxxsz2180Qn15KqoB6tUNBWF/2N6LL5aJZQAz9pi0E7cf26fcVEfgQ79qKBQLrOSAG1XrevKw==
X-Received: by 2002:a63:5650:: with SMTP id g16mr16472961pgm.353.1605013883419; 
 Tue, 10 Nov 2020 05:11:23 -0800 (PST)
Received: from ?IPv6:2402:3a80:413:8adf:79d0:1679:313c:70a2?
 ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
 by smtp.gmail.com with ESMTPSA id h4sm13578946pgc.13.2020.11.10.05.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 05:11:22 -0800 (PST)
To: lukas.bulwahn@gmail.com
References: <20201110130602.22359-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <b68fe426-b479-afbc-a5e1-58be057399b0@gmail.com>
Date: Tue, 10 Nov 2020 18:41:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110130602.22359-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MISSING_SIGN_OFF
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

On 10/11/20 6:36 pm, Aditya Srivastava wrote:
> Currently checkpatch warns us if there is no 'Signed-off-by' line
> for the patch.
> 
> E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
> Completely remove --version flag") reports this error:
> 
> ERROR: Missing Signed-off-by: line(s)
> 
> Provide a fix by adding a Signed-off-by line corresponding to the author
> of the patch before the patch separator line. Also avoid this error for
> the commits where some typo is present in the sign off.
> 
> E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
> for quirk") we get missing sign off as well as bad sign off for:
> 
> Siganed-off-by: Tony Lindgren <tony@atomide.com>
> 
> Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
> signature and avoid MISSING_SIGN_OFF
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> This patch was made after applying https://lore.kernel.org/linux-kernel-mentees/20201108100632.75340-1-dwaipayanray1@gmail.com/
> and my last changes at https://lore.kernel.org/linux-kernel-mentees/20201108134317.25400-1-yashsri421@gmail.com/
> 
>  scripts/checkpatch.pl | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index cb46288127ac..2deffd0c091b 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2404,6 +2404,8 @@ sub process {
>  
>  	my $last_blank_line = 0;
>  	my $last_coalesced_string_linenr = -1;
> +	my $patch_separator_linenr = 0;
> +	my $non_standard_signature = 0;
>  
>  	our @report = ();
>  	our $cnt_lines = 0;
> @@ -2755,6 +2757,10 @@ sub process {
>  		if ($line =~ /^---$/) {
>  			$has_patch_separator = 1;
>  			$in_commit_log = 0;
> +			# to add missing sign off line before diff(s)
> +			if($patch_separator_linenr == 0) {
> +				$patch_separator_linenr = $linenr;
> +			}
>  		}
>  
>  # Check if MAINTAINERS is being updated.  If so, there's probably no need to
> @@ -2775,6 +2781,9 @@ sub process {
>  			if ($sign_off !~ /$signature_tags/) {
>  				WARN("BAD_SIGN_OFF",
>  				     "Non-standard signature: $sign_off\n" . $herecurr);
> +
> +				# to avoid missing_sign_off error as it most probably is just a typo
> +				$non_standard_signature = 1;
>  			}
>  			if (defined $space_before && $space_before ne "") {
>  				if (WARN("BAD_SIGN_OFF",
> @@ -7118,9 +7127,12 @@ sub process {
>  		      "Does not appear to be a unified-diff format patch\n");
>  	}
>  	if ($is_patch && $has_commit_log && $chk_signoff) {
> -		if ($signoff == 0) {
> -			ERROR("MISSING_SIGN_OFF",
> -			      "Missing Signed-off-by: line(s)\n");
> +		if ($signoff == 0 && !$non_standard_signature) {
> +			if (ERROR("MISSING_SIGN_OFF",
> +				  "Missing Signed-off-by: line(s)\n") &&
> +			    $fix) {
> +				fix_insert_line($patch_separator_linenr - 1, "Signed-off-by: $author");
> +			}
>  		} elsif ($authorsignoff != 1) {
>  			# authorsignoff values:
>  			# 0 -> missing sign off
> 

Here I have changed $fixlinenr to $linenr and later reduced
$patch_separator_linenr by 1, at the time of inserting the line.

I changed it to go along with the variable name, ie
$patch_separator_linenr, earlier it was storing the line number before it.

It produces the same outcome in either way. Verified it on patches as
well.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
