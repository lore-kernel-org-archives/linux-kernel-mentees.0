Return-Path: <SRS0=3SZq=D7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAB3C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 00:27:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AACC42225E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 00:27:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cd6U2JgN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AACC42225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 421F6228B3;
	Sat, 24 Oct 2020 00:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIJe08ZsudW3; Sat, 24 Oct 2020 00:27:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3C3D2228B0;
	Sat, 24 Oct 2020 00:27:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23669C0052;
	Sat, 24 Oct 2020 00:27:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA178C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 00:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 89C29228B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 00:27:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtdS0OSlv07d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 00:27:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 5362C203D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 00:27:41 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id m3so117126pjf.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 17:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MNY+o3uP+L0Es3K4x/dnh14bBow7VRrfPWTllaXx+PA=;
 b=Cd6U2JgN3lOOxPvb0py3t3q6zO2m7Nf6xFIXUvhXQYGI4kAlNp23nNafG9tjM/9bZ2
 wU1NekEgipkV1Zzd74CPpdtOj13KoZ+eEBPV27FzO2hrSCHY4OaAW0JfNatsi+2+L8CZ
 4ajir9Obu3gMTTK8NA1voaUHnjLaTnPFq3hQOCdBZdWASZMBEQDM0woHq+hF/oYtShV7
 afXvKwRu6A6HIa0VTVw84ou78BYDCHuZ3542oanLkHcQ8u/6ITnTKxmvG3sKPIMH1o0p
 LENrIjrnyYFo+gdT8/XTkYfdRhtCpZ8I/vNlnwovoWltD341VOvtQ3u7Il1TR/JFtcoH
 jH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MNY+o3uP+L0Es3K4x/dnh14bBow7VRrfPWTllaXx+PA=;
 b=nKBS8ptB1vaZm6qLddMjtgBLJEbEefLSoxeh1RlK44wXt8YaZ6c0qvRHNeegfdT0ln
 s8G1tnZ+7dLG8Qg8y1HLbm4vRkn+4PZt4Lv8F72ZSoVpgu7pvrV7tYF7MTdmhOj+6lsg
 N/CvPJ15j2j3X0P7q7OKvFgyCRU1DZ0bOGDJepu/gjL3EtnHhrs1JSdpJ9Qa5jqKyTVe
 SFoRftif0STIzQPNzhE3NF56G9eOoHBtgx/qxj3HImBsA2IoZ7/ABPzZB2XUg9f1tXYB
 sS7+MchWCyitUnUTsG83y/DMH8COkfDKJw6nhXbFuweSz6/8a8iTpI8oArfJp0qcI+LV
 qM3Q==
X-Gm-Message-State: AOAM5315ifeS8luytkorbHTEELOTUcghqgV63DdeXETjo6oj/P9BRezG
 HlFxovCQKIlY+0YOseG21tI=
X-Google-Smtp-Source: ABdhPJx7tJD1Wj6ABsAvUNQPfP32A0eRZrn4iaJB6Q9nChiUSC37YUVbAejIPZPVBnbZ1Id402Xpkw==
X-Received: by 2002:a17:902:b107:b029:d2:ab87:c418 with SMTP id
 q7-20020a170902b107b02900d2ab87c418mr1533331plr.40.1603499260615; 
 Fri, 23 Oct 2020 17:27:40 -0700 (PDT)
Received: from ?IPv6:2402:3a80:429:6ba7:30ef:4722:a786:585f?
 ([2402:3a80:429:6ba7:30ef:4722:a786:585f])
 by smtp.gmail.com with ESMTPSA id d9sm3950188pjx.47.2020.10.23.17.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 17:27:40 -0700 (PDT)
To: joe@perches.com
References: <20201024000830.12871-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <f78dd5a8-f566-c933-2f4d-b003e49847f6@gmail.com>
Date: Sat, 24 Oct 2020 05:57:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201024000830.12871-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: fix false
 positives in REPEATED_WORD warning
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

On 24/10/20 5:38 am, Aditya Srivastava wrote:
> Presence of hexadecimal address or symbol results in false warning
> message by checkpatch.pl.
> 
> For example, running checkpatch on commit b8ad540dd4e4 ("mptcp: fix
> memory leak in mptcp_subflow_create_socket()") results in warning:
> 
> WARNING:REPEATED_WORD: Possible repeated word: 'ff'
>     00 00 00 00 00 00 00 00 00 2f 30 0a 81 88 ff ff  ........./0.....
> 
> Similarly, the presence of list command output in commit results in
> an unnecessary warning.
> 
> For example, running checkpatch on commit 899e5ffbf246 ("perf record:
> Introduce --switch-output-event") gives:
> 
> WARNING:REPEATED_WORD: Possible repeated word: 'root'
>   dr-xr-x---. 12 root root    4096 Apr 27 17:46 ..
> 
> Here, it reports 'ff' and 'root to be repeated, but it is in fact part
> of some address or code, where it has to be repeated.
> 
> In these cases, the intent of the warning to find stylistic issues in
> commit messages is not met and the warning is just completely wrong in
> this case.
> 
> To avoid these warnings, add additional regex check for the
> directory permission pattern and avoid checking the line for this
> class of warning. Similarly, to avoid hex pattern, check if the word
> consists of hex symbols and skip this warning if it is not among the
> common english words formed using hex letters.
> 
> A quick evaluation on v5.6..v5.8 showed that this fix reduces
> REPEATED_WORD warnings from 2797 to 907.
> 
> A quick manual check found all cases are related to hex output or
> list command outputs in commit messages.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7e505688257a..1d42d08d520b 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3049,7 +3049,9 @@ sub process {
>  		}
>  
>  # check for repeated words separated by a single space
> -		if ($rawline =~ /^\+/ || $in_commit_log) {
> +# avoid false positive from list command eg, '-rw-r--r-- 1 root root'
> +		if (($rawline =~ /^\+/ || $in_commit_log) &&
> +                    $rawline !~ /[bcCdDlMnpPs\?-][rwxsStT-]{9}/) {
>  			pos($rawline) = 1 if (!$in_commit_log);
>  			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
>  
> @@ -3074,6 +3076,17 @@ sub process {
>  				next if ($start_char =~ /^\S$/);
>  				next if (index(" \t.,;?!", $end_char) == -1);
>  
> +                                # avoid repeating hex occurrences like 'ff ff fe 09 ...'
> +                                my %allow_repeated_words = (
> +                                        add => '',
> +                                        added => '',
> +                                        bad => '',
> +                                        be => '',
> +                                );
> +                                if ($first =~ /\b[0-9a-f]{2,}\b/) {
> +                                        next if (!exists($allow_repeated_words{lc($first)}));
> +                                }
> +
>  				if (WARN("REPEATED_WORD",
>  					 "Possible repeated word: '$first'\n" . $herecurr) &&
>  				    $fix) {
> 

Changes made in v4:
- Fix indentation
- Reduce the dictionary size for allowed words
- Apply changes over Dwaipayan's patch
(https://lore.kernel.org/linux-kernel-mentees/20201017162732.152351-1-dwaipayanray1@gmail.com/)
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
