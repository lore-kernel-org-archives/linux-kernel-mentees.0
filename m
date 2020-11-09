Return-Path: <SRS0=nBzY=EP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74B8C4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 13:19:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 256D0206D8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 13:19:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJlfytOh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 256D0206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5DF572051F;
	Mon,  9 Nov 2020 13:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHkLksbnsl3A; Mon,  9 Nov 2020 13:19:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7F9BE203FC;
	Mon,  9 Nov 2020 13:19:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69CEEC0889;
	Mon,  9 Nov 2020 13:19:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5815EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 349C386411
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id btI8Cji+r8yE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:19:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5A299863F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:19:45 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w4so7112122pgg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Nov 2020 05:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xSKuDUtv+MJQzi9cTEfJHmjW6WFuOZVwBi6C9Drwi4k=;
 b=sJlfytOhIcP5eyRmY/ukjc7D8AFrmthrIYfSPOA0DRByPtENI9wwytS0Y++WshIFKG
 zKKXp5qqEd478IiDX92Z32yCALQvleCfLdjE8dJLIHdylETOguKzuHcqDl9mZ1/P3lwI
 mmc5cDWRV23Zf8LG/LoJogl2ElCgRuJsokDGLM164dJB9Ln5sd5Vat7kn7+Iz16IyNn5
 Il6l9iV0x/CDIKPr0uIIBUBG2ebfiN0esNpow+i9Ew2YjHkB5xzjMsXB+/i8VWXc5u8I
 VF/g0BfufKCmEh+c1P+IAoM2jCPGbCLbaQ1t7VC5jO/SffLSeP3iVzF3u0ToR6yqTLzY
 EBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xSKuDUtv+MJQzi9cTEfJHmjW6WFuOZVwBi6C9Drwi4k=;
 b=O+aU4An0zQjx34ZJY3fU8yK+N5cMOZaVBfu0b175Z+RUGc9achnGkE3OCzim5PKNHM
 Pf/d27waK09tSwSkjv/xgfHPjqt2/tm0fBtLo/UM3jd0USuZE/gt2qkWUwugEYdnVxBa
 042qwQq+0IrR3IfrtLDCDAWmoKGVBaUQCeR1u9WplLjqWWlrvTCDHHfYiyVSjfNw4cfg
 2vWRlpbXeoJJTYXttiysyiMwZN04nkF579ujCTh6ACweMH91irlJUfOYkPOXTCkPN5b3
 OTkl5gwJ1c9KRex5PXES0yF8ApmQBif5vNXKCnH8lpGAwKMnG/6XIFvkqaIHTTpeAMbi
 dNBg==
X-Gm-Message-State: AOAM531DPFMdVMy/93NQ0CFSGAmJ4x5llea2tPC1kOdmvSmB7cwr6tmV
 qfQqQAIXlmjIpzMcAQZzf6CV6QLkArpkAA==
X-Google-Smtp-Source: ABdhPJxgXsakOExeNNtvqU2O+FuCaAJR+qd+45ygl4HmQgcdM4SQGlrXmkrupsgUM3BhXvv0pTf1oQ==
X-Received: by 2002:a17:90a:f00a:: with SMTP id
 bt10mr9975574pjb.91.1604927984536; 
 Mon, 09 Nov 2020 05:19:44 -0800 (PST)
Received: from ?IPv6:2402:3a80:415:19be:b84e:68cf:38c6:95bd?
 ([2402:3a80:415:19be:b84e:68cf:38c6:95bd])
 by smtp.gmail.com with ESMTPSA id u10sm11272814pfn.101.2020.11.09.05.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 05:19:44 -0800 (PST)
To: lukas.bulwahn@gmail.com
References: <20201109131040.19266-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <4edf97e9-129d-b089-9eef-94f737e00638@gmail.com>
Date: Mon, 9 Nov 2020 18:49:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109131040.19266-1-yashsri421@gmail.com>
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

On 9/11/20 6:40 pm, Aditya Srivastava wrote:
> Currently checkpatch warns us if there is no 'Signed-off-by' line
> for the patch.
> 
> E.g., running checkpatch on commit f68e7927212f ("Revert
> "powerpc/book3s32: Reorder _PAGE_XXX flags to simplify TLB handling"")
> reports this error:
> 
> ERROR: Missing Signed-off-by: line(s)
> 
> Provide a fix by adding a Signed-off-by line corresponding to the author
> of the patch before the start of diff(s)
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index cb46288127ac..bc447aa4e5b0 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2404,6 +2404,7 @@ sub process {
>  
>  	my $last_blank_line = 0;
>  	my $last_coalesced_string_linenr = -1;
> +	my $diff_linenr = 0;
>  
>  	our @report = ();
>  	our $cnt_lines = 0;
> @@ -2602,6 +2603,10 @@ sub process {
>  			$realfile =~ s@^([^/]*)/@@ if (!$file);
>  			$in_commit_log = 0;
>  			$found_file = 1;
> +			# to add missing sign off line before diff(s)
> +			if($diff_linenr == 0) {
> +				$diff_linenr = $fixlinenr;
> +			}
>  		} elsif ($line =~ /^\+\+\+\s+(\S+)/) {
>  			$realfile = $1;
>  			$realfile =~ s@^([^/]*)/@@ if (!$file);
> @@ -7119,8 +7124,11 @@ sub process {
>  	}
>  	if ($is_patch && $has_commit_log && $chk_signoff) {
>  		if ($signoff == 0) {
> -			ERROR("MISSING_SIGN_OFF",
> -			      "Missing Signed-off-by: line(s)\n");
> +			if (ERROR("MISSING_SIGN_OFF",
> +				  "Missing Signed-off-by: line(s)\n") &&
> +			    $fix) {
> +				fix_insert_line($diff_linenr, "Signed-off-by: $author\n");
> +			}
>  		} elsif ($authorsignoff != 1) {
>  			# authorsignoff values:
>  			# 0 -> missing sign off
> 

This probably is wrong. I should add the sign-off before first patch
separator(ie '---')
Will send the modified patch.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
