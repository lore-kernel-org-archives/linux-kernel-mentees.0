Return-Path: <SRS0=lIAf=FD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BDCC3E8C5
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Nov 2020 08:55:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D07AC2076A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Nov 2020 08:55:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RG7aCMZC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D07AC2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4CA6D204CC;
	Sun, 29 Nov 2020 08:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eASCZtxRBA-m; Sun, 29 Nov 2020 08:55:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 02768204AD;
	Sun, 29 Nov 2020 08:55:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8FA1C0859;
	Sun, 29 Nov 2020 08:55:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F5F6C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 08:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 15B4E86B00
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 08:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HyU0ReM4vOvq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 08:55:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3583D86AEC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 08:55:17 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w187so8260485pfd.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 00:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=asdqBoIk1ZdzjfqdX/jQ+vQPjLAQMqzWC0xNbHtbH/M=;
 b=RG7aCMZCbbpDxaV4pWpEo01Q/1oq0fy8d7t/whwLwnwkmEhpEcXuZHhE086oRR/+do
 bl3+Hl1jjuqKGCLXqxAxaKtxOiIP4+A9dZ2vsTJsNxX2BPHVkVgLVYVj0jb2vexkCId+
 x5xQmuOCddJe9NVF+ITdnVofNmSwbhhhookzEIuGeiw2dXzfoTEVVQYWca+FaCQDX8AN
 Nby53fbLjf1c8ZiWewkVPhqgYUDWvZIF6eiVBIBi++bb1MyF4Qh++8hICTkS3mbqXFXQ
 9/CpOPZm510m89YQB/fVyFCiuOhj4ykbYxkW5fkrTd3kcxb3adMJP3bcTlXO1eyTtNGR
 BwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=asdqBoIk1ZdzjfqdX/jQ+vQPjLAQMqzWC0xNbHtbH/M=;
 b=f9URWhXhfk7YDkKV+NsSZI8Quv89tUY1fmEvDCZHZ81bylqUS4VAFuklBfW0L8XEq3
 5KOdtF+Oi/qLWavG9sReGULVoOBHteVK9EeMfdr2Ja8Us08upQAEB8HLW8qqeE2oyFrP
 gIVJpKx8wnzcqaN/k5ejo36XA4rT3y93xsQxmudfqCon3nSTphAdGIEZzGJ9X75sz2hK
 uBukLZ06KkQD1AzUG0Ee6dSa7ufSBeQglXz4yrka8UIgNKQdfI36Sv0L3rSvEKmqh+nw
 oZ4b1BSdazgFQqpE6UwACEAXY+HJ+0U4JaG36FTgwN/xV5UA7aY56uJMM/CWPUo6hWIW
 OHGA==
X-Gm-Message-State: AOAM533kG3LvPBvsV9r2dUhvSCHrO4lY3jrbV57/rXw9oDVct5Y9A5oI
 v597CV/dhQkpoG7GO0s6qhLeX0MKkLkoqw==
X-Google-Smtp-Source: ABdhPJyIk08effv0WRJDXi9p8cYwoDb4KiIBSTOMrIW6LBoPezP0AjX81vOC1ix5VdHIfSHU7qLZ8g==
X-Received: by 2002:a17:90a:2b0b:: with SMTP id
 x11mr20233613pjc.65.1606640116459; 
 Sun, 29 Nov 2020 00:55:16 -0800 (PST)
Received: from ?IPv6:2402:3a80:43d:11a0:15a2:ad13:ec3b:4e56?
 ([2402:3a80:43d:11a0:15a2:ad13:ec3b:4e56])
 by smtp.gmail.com with ESMTPSA id h4sm11513617pgp.8.2020.11.29.00.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Nov 2020 00:55:15 -0800 (PST)
To: joe@perches.com
References: <afaa79a6d86a4184878595ced3f2de1a92a4058c.camel@perches.com>
 <20201123102818.24364-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <a0f6479e-0c1b-a2f8-a265-32cc31313870@gmail.com>
Date: Sun, 29 Nov 2020 14:25:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201123102818.24364-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v7] checkpatch: add fix option
	for LOGICAL_CONTINUATIONS
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

On 23/11/20 3:58 pm, Aditya Srivastava wrote:
> Currently, checkpatch warns if logical continuations are placed at the
> start of a line and not at the end of previous line.
> 
> E.g., running checkpatch on commit 3485507fc272 ("staging:
> bcm2835-camera: Reduce length of enum names") reports:
> 
> CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the
> previous line
> +	if (!ret
> +	    && camera_port ==
> 
> Provide a simple fix by inserting logical operator at the last
> non-comment, non-whitespace char of the previous line and removing from
> current line, if both the lines are additions(ie start with '+')
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> changes in v2: quote $operator at substitution
> 
> changes in v3: add a check for previous line ending with comment;
> If so, insert $operator at the last non-comment, non-whitespace char of the previous line
> 
> changes in v4: improve the matching mechanism by matching line termination at comment or white space;
> insert the operator before comments (if any) separated by a whitespace;
> append the comment and its pre-whitespace after the inserted operator (if comment was present),
> ie if no comment was present nothing will be inserted after the operator
> 
> changes in v5: improve regex for comment and line end with '$;'
> 
> changes in v6: remove if-check; modify commit message
> 
> changes in v7: add an extra '$' symbol at '$fixed[$fixlinenr - 1]' regex substitution to ensure match at line end
> 
>  scripts/checkpatch.pl | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 5b1a5a65e69a..fb3c50e0bde2 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3553,8 +3553,16 @@ sub process {
>  
>  # check for && or || at the start of a line
>  		if ($rawline =~ /^\+\s*(&&|\|\|)/) {
> -			CHK("LOGICAL_CONTINUATIONS",
> -			    "Logical continuations should be on the previous line\n" . $hereprev);
> +			my $operator = $1;
> +			if (CHK("LOGICAL_CONTINUATIONS",
> +				"Logical continuations should be on the previous line\n" . $hereprev) &&
> +			    $fix && $prevrawline =~ /^\+/) {
> +				# insert logical operator at last non-comment, non-whitepsace char on previous line
> +				$prevline =~ /[\s$;]*$/;
> +				my $line_end = substr($prevrawline, $-[0]);
> +				$fixed[$fixlinenr - 1] =~ s/\Q$line_end\E$/ $operator$line_end/;
> +				$fixed[$fixlinenr] =~ s/\Q$operator\E\s*//;
> +			}
>  		}
>  
>  # check indentation starts on a tab stop
> 

Hi Joe
You probably missed this patch. Please review :)

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
