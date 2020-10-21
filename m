Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED238C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 22:13:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35C0624198
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 22:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fM/IXSI4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35C0624198
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7BD0E2E160;
	Wed, 21 Oct 2020 22:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ukZWdF3DQVJ; Wed, 21 Oct 2020 22:13:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 50F9D2EE90;
	Wed, 21 Oct 2020 19:10:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AD14C088B;
	Wed, 21 Oct 2020 19:10:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9529EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 846D386955
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SnvJlIlonlx5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:10:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0E73484F76
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:10:40 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 144so2055860pfb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 12:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sqKrdcb1JW7aapeQZweUM78mpTGqQvC1e1ca9+gRkRk=;
 b=fM/IXSI4xylUS4vB7syq9meRyttA3/TlwkeKmvNJg9JrIOQ9/nmrpE+ATWYsgjhXKl
 o0+g1dFcGFZYezdF2HXjB3Ap+CBApCphI0D9QoZNl7QWGImv6dqfcRlRcfk6GP5wmjZl
 aDQ0QCgN0nLyS7rox3JFKcwf6RtJEw2+ifeEMWZKXuNc4UsYjKbTjYArJiLsHiiwcSs0
 TNj4wJzUP0IdaQl0bwMt0EZpqYdr8kpgidDP+9kvykAuNWpBhVxSTGZfNePiw6vpU0VF
 EyGBtdV7VwjZ9ymhZcPty7hLSWWcW5f3RPAGKY/mwwnLjOHF7zt5AVXZgvb5gNFk6t+3
 qNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sqKrdcb1JW7aapeQZweUM78mpTGqQvC1e1ca9+gRkRk=;
 b=Bwee0j55MLh+In3xxpD/zhm60JGYipTRUCAib7XYQ509/OrYLw4aHHepjO64CplfO7
 7sAAV5D17Erc5NGzqRhZjzXbH/V4y9dceKPtERiM2SqjiUqoUumP+B2piweJqc3Jvo0a
 F6Kcox6/OEK+8XEmi93XmRscBzB+Kp/hZpxOJt18Rr6/68jAj4v/pqpDmrPeMWYmxNWS
 Orz15Ypu2hWFbZ3mSGz+M/dDChDJBxgULCMi1kSrFWrHKNyKyj/FpPxik89yup28OMIX
 IzOPkL5uQGw94csfnMHGGd6UBGizOHsWgGAcx0Dqi0iuDUOyZvah+1B0kELczu8FUgZX
 JgIQ==
X-Gm-Message-State: AOAM533Jpk4EjqSY8tU3ml39/kM7oBgCCalB7OEnyUDjywaebHscxbqT
 5aBHZ8XLaVXrvrJ7ZDlHIKg=
X-Google-Smtp-Source: ABdhPJyp49QFzlg5V0OUdPSExSsCgmgqLJI4KZwaScPscItQSmsUKPy+x84prqM4Uz5ntJTOg5kbQQ==
X-Received: by 2002:a62:8f81:0:b029:152:6184:6c69 with SMTP id
 n123-20020a628f810000b029015261846c69mr5033535pfd.75.1603307439452; 
 Wed, 21 Oct 2020 12:10:39 -0700 (PDT)
Received: from ?IPv6:2402:3a80:431:7ac0:8cb2:c45f:197:35d9?
 ([2402:3a80:431:7ac0:8cb2:c45f:197:35d9])
 by smtp.gmail.com with ESMTPSA id f66sm3186429pfa.59.2020.10.21.12.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 12:10:38 -0700 (PDT)
To: Joe Perches <joe@perches.com>
References: <20201021150120.29920-1-yashsri421@gmail.com>
 <f073750511750336de5f82600600ba6cb3ddbec0.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <0562c42d-f9af-1141-ab77-8abb73bfd31f@gmail.com>
Date: Thu, 22 Oct 2020 00:40:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f073750511750336de5f82600600ba6cb3ddbec0.camel@perches.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
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

On 21/10/20 8:48 pm, Joe Perches wrote:
> On Wed, 2020-10-21 at 20:31 +0530, Aditya Srivastava wrote:
>> Presence of hexadecimal address or symbol results in false warning
>> message by checkpatch.pl.
>>
>> For example, running checkpatch on commit b8ad540dd4e4 ("mptcp: fix
>> memory leak in mptcp_subflow_create_socket()") results in warning:
>>
>> WARNING:REPEATED_WORD: Possible repeated word: 'ff'
>>     00 00 00 00 00 00 00 00 00 2f 30 0a 81 88 ff ff  ........./0.....
> 
> Right.
> 
>> To avoid all such reports, add an additional regex check for a repeating
>> pattern of 4 or more 2-lettered words separated by space in a line.
> 
>> A quick evaluation on v5.6..v5.8 showed that this fix reduces
>> REPEATED_WORD warnings from 2797 to 1043.
> 
> Are many of the other 1043 false positives?
> Any pattern to them?
> 

Apart from the changes suggested by Dwaipayan in
https://lore.kernel.org/linux-kernel-mentees/20201017162732.152351-1-dwaipayanray1@gmail.com/

The 'ls -l' output seems to be another common false positive for
REPEATED_WORD (Frequency 106 over v5.6..v5.8). For eg.

WARNING:REPEATED_WORD: Possible repeated word: 'root'
#18:
  drwxr-xr-x. 2 root root    0 Apr 17 10:53 .

WARNING:REPEATED_WORD: Possible repeated word: 'nobody'
#28:
drwxr-xr-x 5 nobody nobody    0 Jan 25 18:08 .

WARNING:REPEATED_WORD: Possible repeated word: 'irogers'
#17:
  -rw-r----- 1 irogers irogers 553 Apr 17 14:31
../../../util/unwind-libdw.h

These can be avoided by using:
@@ -3050,8 +3050,10 @@ sub process {
 			}
 		}

-		if ($rawline =~ /^\+/ || $in_commit_log) {
+		if (($rawline =~ /^\+/ || $in_commit_log) &&
+		$rawline !~ /\b[a-z-]+.* \d{1,3} [a-zA-Z]+ \w+ +\d+ \w{3} \d{1,2}
\d{1,2}:\d{1,2}/) {

Sincerely
Aditya

>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
>> @@ -3050,8 +3050,10 @@ sub process {
>>  			}
>>  		}
>>  
>> -# check for repeated words separated by a single space
>> -		if ($rawline =~ /^\+/ || $in_commit_log) {
>> +# check for repeated words separated by a single space and
>> +# avoid repeating hex occurrences like 'ff ff fe 09 ...'
>> +		if (($rawline =~ /^\+/ || $in_commit_log) &&
>> +		$rawline !~ /(\b[0-9a-f]{2}( )+){4,}/) {
> 
> This might be better as \b$Hex to avoid FF FF
> and FFFFFFFF FFFFFFFF
> 
> I might add that check to the line below where
> the repeated words are checked against long
> ---
>  scripts/checkpatch.pl | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fab38b493cef..929866999f81 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3062,6 +3062,7 @@ sub process {
>  
>  				next if ($first ne $second);
>  				next if ($first eq 'long');
> +				next if ($first =~ /^$Hex$/;
>  
>  				if (WARN("REPEATED_WORD",
>  					 "Possible repeated word: '$first'\n" . $herecurr) &&
> 
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
