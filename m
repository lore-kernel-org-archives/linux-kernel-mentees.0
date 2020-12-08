Return-Path: <SRS0=ZryW=FM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B447C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Dec 2020 16:44:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97B2423AC8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Dec 2020 16:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97B2423AC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5318120451;
	Tue,  8 Dec 2020 16:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DmKn5z8dWqkl; Tue,  8 Dec 2020 16:44:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5FC1B20444;
	Tue,  8 Dec 2020 16:44:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40A4BC0893;
	Tue,  8 Dec 2020 16:44:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7D68C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 16:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9CC0886398
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 16:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ftja6126yuLU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 16:44:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CE08C860EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Dec 2020 16:44:38 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y10so5792294plr.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Dec 2020 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V3UcoagUsWmcOMtgZB5dl7FPRJuipcmKsMggllXdo1A=;
 b=e/zRCZFlU0Xg7lwQdrmCVBVlzLrEAEYqzcYJLjoI6IUfcuHkoLZsoSCpCjl6Hpf/v9
 ORso6DDS0DAvYqxE8HL2osu3H+gV996OoB0Z91k+vE3EoY4829rYc7eVZcEO7QR+CruM
 qUEvhYOY7KHDVCi9S79fUS97Cj7Qz51Jg8Zm3LvEaQBjVSvZcdrXE2Wi6Pz6Jxn/g+Rf
 cqLXVhVHE2TBi3VQN8R+wRpBqcKEjKJSYRxaqLJugGRIbtJ34+OiqvSz9uaKG1JGoUwF
 eNMVJRGHoti59qJmHre8/CQgq/XW6GfjUz5yu8khY3COOnYP2IiCbRA3N9RXUjQ/59jT
 KuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V3UcoagUsWmcOMtgZB5dl7FPRJuipcmKsMggllXdo1A=;
 b=KSLWUTrFHLNND6seuerzKla+EGJ6iivu82x0Rpn0UMIsfmVZmg95K7HT+25tqe6i56
 q5/8xU51Rhvjn+3VcUpUNkqKmpCV72tbrwnLyOVFvxhuZngdjUR46GvNbwsRNTZ9Nq5O
 IV5MqJZTPMz/XW5H8bFJp1fgs6ZoT+g4gCZKAL90cc65lQzVYFjZG8WK2PJcl9DaBcbX
 aXeQo4OmB49s/2aSj3x8SkeaDCuG4JTmCCANt01Qgl8RAiF1V1PyG2sewEn6QJ6ag2Nn
 8I0s8lJT9kJlW8+h/3isbdGc9XY69X/GjJTp/MMYIPVArtsbsIBGmQCaKmw7PFHcjq2Y
 qgJw==
X-Gm-Message-State: AOAM533CmOFHz3QP5xe9Kq3tnX+e44in7MWb0ZImC/42Nl3T3KPMIvo3
 rEm75vXEqN3ek7DRXemXGXnUwhHb2v3gqA==
X-Google-Smtp-Source: ABdhPJz7u0r83WjS2bPavASn0NmByn41fImv2V8jM0TPGPeEBk8MId409M0wK12wP6uj01SMa2Uh2A==
X-Received: by 2002:a17:902:8541:b029:da:fcd1:7bf with SMTP id
 d1-20020a1709028541b02900dafcd107bfmr8979044plo.56.1607445877999; 
 Tue, 08 Dec 2020 08:44:37 -0800 (PST)
Received: from ?IPv6:2402:3a80:409:eab8:d9f9:133a:8ce7:6fdc?
 ([2402:3a80:409:eab8:d9f9:133a:8ce7:6fdc])
 by smtp.gmail.com with ESMTPSA id a12sm3842732pjm.44.2020.12.08.08.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 08:44:37 -0800 (PST)
From: Aditya <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
References: <20201202183649.9773-1-yashsri421@gmail.com>
Message-ID: <540be894-a369-160f-25cc-a22a06612c9f@gmail.com>
Date: Tue, 8 Dec 2020 22:14:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202183649.9773-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	BAD_SIGN_OFF
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

On 3/12/20 12:06 am, Aditya Srivastava wrote:
> Currently checkpatch warns us if the Co-developed-by line for an author
> isn't immediately followed by the Signed-off-by line.
> 
> Generally, this warning occurs because of:
> 1) Absence of Signed-off-by line for the author from the patch
> 2) Misplaced Signed-off-by line for the author in the patch
> 
> Provide a simple fix by:
> 1) Inserting Signed-off-by line for the author immediately after the
> Co-developed-by line
> 
> 2) Removing Signed-off-by line for the author (if it pre-existed on
> some other line)
> 
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 5c9f13a97c12..d8f9d4d8b13d 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2509,6 +2509,9 @@ sub process {
>  	my @setup_docs = ();
>  	my $setup_docs = 0;
>  
> +	my %signed_off_by_lines;
> +	my %co_developed_by_lines;
> +
>  	my $camelcase_file_seeded = 0;
>  
>  	my $checklicenseline = 1;
> @@ -2794,6 +2797,7 @@ sub process {
>  					my $ctx = $1;
>  					my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
>  					my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
> +					$signed_off_by_lines{$ctx} = $fixlinenr;
>  
>  					if ($email_address eq $author_address && $email_name eq $author_name) {
>  						$author_sob = $ctx;
> @@ -2989,11 +2993,17 @@ sub process {
>  					}
>  				}
>  				if (!defined $lines[$linenr]) {
> -					WARN("BAD_SIGN_OFF",
> -                                             "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
> +					if (WARN("BAD_SIGN_OFF",
> +						 "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline) &&
> +					    $fix) {
> +						$co_developed_by_lines{$email} = $fixlinenr;
> +					}
>  				} elsif ($rawlines[$linenr] !~ /^\s*signed-off-by:\s*(.*)/i) {
> -					WARN("BAD_SIGN_OFF",
> -					     "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
> +					if (WARN("BAD_SIGN_OFF",
> +						 "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]) &&
> +					    $fix) {
> +						$co_developed_by_lines{$email} = $fixlinenr;
> +					}
>  				} elsif ($1 ne $email) {
>  					WARN("BAD_SIGN_OFF",
>  					     "Co-developed-by and Signed-off-by: name/email do not match \n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
> @@ -7203,6 +7213,16 @@ sub process {
>  		ERROR("NOT_UNIFIED_DIFF",
>  		      "Does not appear to be a unified-diff format patch\n");
>  	}
> +
> +	if (%co_developed_by_lines) {
> +		foreach my $co_developer (keys %co_developed_by_lines) {
> +			if (exists($signed_off_by_lines{$co_developer})) {
> +				fix_delete_line($signed_off_by_lines{$co_developer}, "Signed-off-by: $co_developer");
> +			}
> +			fix_insert_line($co_developed_by_lines{$co_developer} + 1, "Signed-off-by: $co_developer");
> +		}
> +	}
> +
>  	if ($is_patch && $has_commit_log && $chk_signoff) {
>  		if ($signoff == 0) {
>  			ERROR("MISSING_SIGN_OFF",
> 

Hi Lukas
You probably missed this patch. Please review :)

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
