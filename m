Return-Path: <SRS0=fLed=JM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50390C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Apr 2021 11:17:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2A1A611AB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Apr 2021 11:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2A1A611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6F3F40FB1;
	Thu, 15 Apr 2021 11:17:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9KLOhlk_tjn; Thu, 15 Apr 2021 11:17:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7163B40E9C;
	Thu, 15 Apr 2021 11:17:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51843C000B;
	Thu, 15 Apr 2021 11:17:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C58B5C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 11:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5E1E40FB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 11:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sTsWNhAtVBje
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 11:17:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 891DC40E9C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 11:17:11 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id t22so11541627ply.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Apr 2021 04:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Xzhbfi8H9ftSIkgwmOeRE9lGFEylEcwsXMtPPxhe60=;
 b=VvrdAnQ+p0jxlGFOwXPb5TCzw7n/74reBVIuhJUv/J2WW6h1TBkAUy2SSFPoaOIshk
 mxJ8xeyo2voyIr+QqEKi3v69wx1IUokm0MLC8qJZG13hlYJaeX8ZczA5IQ8bEZYfrtLi
 peXMVx0PBJIsu4Pn2VZVysZJX4pEVFHkb0eFyZklKyEOc6EHJV5T4tuvZcASTOufczXx
 N2yP0OVYgGwxtfCYIJN66ym1gyT3kfJnlDFviM8hHFmpUyqbRTQkiuNG7eZrbZ9Sle6d
 dUSHgoTRsE61w9mB3/wCvpI8fq6rc8lD+830Nj49HrWEdHozf+BPvtrbvOi+4DPaY3Bb
 drqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Xzhbfi8H9ftSIkgwmOeRE9lGFEylEcwsXMtPPxhe60=;
 b=tFxutLF90jrA0Oir3Uw2OQHcXppjeoGhNS8b7tEDXbt0EyRb2tN2SDfKw87xrKUeFJ
 uLoFIgWDha7+mqHUucnxVopIeGZ0EA6P9ytkdLPEwJe3dFBLyYoTT9bf7e0K1Mqq+xzv
 UF/txfuMTfxLDT33gEf6BYnYrvkQ2D2UAh8mEjaOhOYDfx0dD7PcHWJ+iEq5T3nVdMPT
 OmumPQFWnH9RWiG28Njy9lUGDw70WweS0WyIdibBi07idDeste+V7GzRKg3+tSrMLgCX
 C0c7mFaQ+zUk1Am628hlCZKCYQWJZ+GmBTqpV24cjoHk8x2dQIKWaciar/yuDBHJNNQM
 D6ww==
X-Gm-Message-State: AOAM531v65HkNrXXkFuK4RNmfHhrl/8PFM+sZ4BRqq7/KEabLZRvSFrK
 Mvrf8Z1oPsNmJZZSEY/Vwhk=
X-Google-Smtp-Source: ABdhPJwVBgV01HQ5R9jcij9mWXogEw8h1tLfgGqxpYO3viU/s4KOZla/LreHcMt9mAZginlm7hPxPw==
X-Received: by 2002:a17:90b:3884:: with SMTP id
 mu4mr3365061pjb.128.1618485430760; 
 Thu, 15 Apr 2021 04:17:10 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a089:2483:f13d:beac:b531?
 ([2405:201:600d:a089:2483:f13d:beac:b531])
 by smtp.gmail.com with ESMTPSA id n3sm1803590pga.92.2021.04.15.04.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 04:17:10 -0700 (PDT)
Subject: Re: [RFC] scripts: kernel-doc: improve parsing for kernel-doc
 comments syntax
To: corbet@lwn.net
References: <20210414192529.9080-1-yashsri421@gmail.com>
From: Aditya Srivastava <yashsri421@gmail.com>
Message-ID: <d49dacfb-7612-b8fc-6ee5-3e2ec2a5c601@gmail.com>
Date: Thu, 15 Apr 2021 16:47:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210414192529.9080-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

On 15/4/21 12:55 am, Aditya Srivastava wrote:
> Currently kernel-doc does not identify some cases of probable kernel
> doc comments, for e.g. pointer used as declaration type for identifier,
> space separated identifier, etc.
> 
> Some example of these cases in files can be:
> i)" *  journal_t * jbd2_journal_init_dev() - creates and initialises a journal structure"
> in fs/jbd2/journal.c
> 
> ii) "*      dget, dget_dlock -      get a reference to a dentry" in
> include/linux/dcache.h
> 
> iii) "  * DEFINE_SEQLOCK(sl) - Define a statically allocated seqlock_t"
> in include/linux/seqlock.h
> 
> Also improve identification for non-kerneldoc comments. For e.g.,
> 
> i) " *	The following functions allow us to read data using a swap map"
> in kernel/power/swap.c does follow the kernel-doc like syntax, but the
> content inside does not adheres to the expected format.
> 
> Improve parsing by adding support for these probable attempts to write
> kernel-doc comment.
> 
> Suggested-by: Jonathan Corbet <corbet@lwn.net>
> Link: https://lore.kernel.org/lkml/87mtujktl2.fsf@meer.lwn.net
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/kernel-doc | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 888913528185..37665aa41e6b 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -2110,17 +2110,25 @@ sub process_name($$) {
>      } elsif (/$doc_decl/o) {
>  	$identifier = $1;
>  	my $is_kernel_comment = 0;
> -	if (/^\s*\*\s*([\w\s]+?)(\(\))?\s*([-:].*)?$/) {
> +	my $decl_start = qr{\s*\*};
> +	my $fn_type = qr{\w+\s*\*\s*}; # i.e. pointer declaration type, foo * bar() - desc
> +	my $parenthesis = qr{\(\w*\)};
> +	my $decl_end = qr{[-:].*};
> +	if (/^$decl_start\s*([\w\s]+?)$parenthesis?\s*$decl_end?$/) {
>  	    $identifier = $1;
> -	    $decl_type = 'function';
> -	    $identifier =~ s/^define\s+//;
> -	    $is_kernel_comment = 1;
>  	}
>  	if ($identifier =~ m/^(struct|union|enum|typedef)\b\s*(\S*)/) {
>  	    $decl_type = $1;
>  	    $identifier = $2;
>  	    $is_kernel_comment = 1;
>  	}
> +	elsif (/^$decl_start\s*$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||	# i.e. foo()
> +	    /^$decl_start\s*$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {	# i.e. static void foo() - description; or misspelt identifier
> +	    $identifier = $1;
> +	    $decl_type = 'function';
> +	    $identifier =~ s/^define\s+//;
> +	    $is_kernel_comment = 1;
> +	}
>  	$identifier =~ s/\s+$//;
>  
>  	$state = STATE_BODY;
> 

Hi
I have generated a diff file for changes in kernel-doc warnings for
all the files in the kernel-tree, before and after this patch.
It can be found at:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/kernel_doc_comment_syntax_improvement_diff.txt

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
