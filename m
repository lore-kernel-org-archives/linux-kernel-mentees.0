Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932E9C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 15:06:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C162D2224E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 15:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiZDeFPC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C162D2224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 22D84863E1;
	Wed, 21 Oct 2020 15:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-57BZa6h0IA; Wed, 21 Oct 2020 15:06:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B250E863E0;
	Wed, 21 Oct 2020 15:06:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA95CC0052;
	Wed, 21 Oct 2020 15:06:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F128C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1F0D32E2C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id joRl2E4D-xRe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:06:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 378152F409
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 05:15:58 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y14so758586pfp.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Oct 2020 22:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jf3LaR2SPzVxD4dMjezVSel91TsxG5Gazy+tlsYzin4=;
 b=AiZDeFPCfKUTa9XR80vgvL5APKmK8jSS3RCLb5btdJyeT1VpbOS12xcupJvgNN0qka
 kFdK9PJZib1fH/1tA0InNW1xG78tJ8R8rKXjrUFH4AxolCwgHMToIqPL4LLx13tEg8L8
 Dkt4kvZ3m5rSKjpBboNf1v1EZeFQq7pnrq6AUFY7YjafZo2KaZT2DwsL9lyetmWfVT5w
 waHTmPFSgb/nos9Qs2JhAY2zU4Mdh2pFqM00OHwjaTqW2Krsip9C0dDoYUZsIjz7ZYe6
 DDEsjpk4BgjQU3MUc0t7OJ5FWh/b+GLL51fRsAgoepUalZSB5xrsHkILn1fFtyPV3oXu
 mWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jf3LaR2SPzVxD4dMjezVSel91TsxG5Gazy+tlsYzin4=;
 b=EC/EKipbKBe1jWSAbyGoRC19TIOVJ3gwUOy4Mv67QDiqQpc6fdxR+XfIys4D/qLcz8
 Umct5M90Im8HclFTqLSeeGHp+gAhpjVShbTevS2k9YxmDGKe7I+O41BlsLLiArnrZNS4
 AKdr7Ztu4xImVqsBMA/fpZqcqAUDoilk4h38VPG7IGvdWmmmQZUMhSaFltSS4FCOSA3X
 jafgFlFbct4nOEzxX1+gXRSCcMwy67lCw0+0VvYkRSqWdv58wWWACzdqJqvYX0TvGuKO
 I0jEv/KDYS/V+uQdcdwF3SVP9HLnSCN5toe4mI6/Jp8U077+Ec8zDQSaN28zJD7jrEET
 LduA==
X-Gm-Message-State: AOAM533i2E1Xu2gKEdumgg5JuuvkWneBqoYOw/Kk3SScc1Z+w6qwWvNo
 B/amY9BiI56jbVMVatBk33Q=
X-Google-Smtp-Source: ABdhPJxPpTc4P4d03v25d8BlavPwcy+k8cRvel32oF7HqiYnd0rXzTJZ0I5LhBg9OoFiD6CxEKmZ9Q==
X-Received: by 2002:aa7:8b17:0:b029:15b:c0ba:f2f4 with SMTP id
 f23-20020aa78b170000b029015bc0baf2f4mr1638713pfd.22.1603257357736; 
 Tue, 20 Oct 2020 22:15:57 -0700 (PDT)
Received: from ?IPv6:2402:3a80:425:f573:8cb2:c45f:197:35d9?
 ([2402:3a80:425:f573:8cb2:c45f:197:35d9])
 by smtp.gmail.com with ESMTPSA id y13sm682777pfl.166.2020.10.20.22.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 22:15:57 -0700 (PDT)
To: lukas.bulwahn@gmail.com
References: <20201021050027.13253-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <75340ad4-d0c1-4b60-9a2f-ea68ab97fe67@gmail.com>
Date: Wed, 21 Oct 2020 10:45:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201021050027.13253-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
	for REPEATED_WORD warning
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

On 21/10/20 10:30 am, Aditya Srivastava wrote:
> Presence of hexadecimal address or symbol results in false warning
> message by checkpatch.pl.
> 
> For example, running checkpatch on commit b8ad540dd4e4 ("mptcp: fix
> memory leak in mptcp_subflow_create_socket()") results in warning:
> 
> WARNING:REPEATED_WORD: Possible repeated word: 'ff'
>     00 00 00 00 00 00 00 00 00 2f 30 0a 81 88 ff ff  ........./0.....
> 
> Here, it reports 'ff' to be repeated, but it is infact part of some
> address or code, where it has to be repeated. Thus the warning seems
> unnecessary in this case.
> 
> To avoid all such reports, add an additional regex check for a repeating
> pattern of 4 or more 2-lettered words separated by space in a line.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9b9ffd876e8a..181c95691715 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3052,7 +3052,9 @@ sub process {
>  
>  # check for repeated words separated by a single space
>  		if ($rawline =~ /^\+/ || $in_commit_log) {
> -			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> +			# avoid repeating hex occurrences like 'ff ff fe 09 ...'
> +			while ($rawline !~ /((\s)*[0-9a-z]{2}( )+){4,}/ &&
> +				$rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
>  
>  				my $first = $1;
>  				my $second = $2;
> 


Report of the impact of patch/changes(taken over v5.6..v5.8):

List of errors and warnings after applying the patch:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/summary.txt

Change in errors and warnings compared to previous patch:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/relative_summary/summary_relative.txt

Impact/Conclusion:
It can be seen that a large amount of warning messages under
REPEATED_WORD were because of such hex occurrences.
The changes made reduces the warning count of REPEATED_WORD by more
than 60%, ie. from 2797 to 1015 (over v5.6..v5.8)

Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
