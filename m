Return-Path: <SRS0=G515=D5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29431C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 14:58:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 787C02463B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 14:58:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcCPde1C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 787C02463B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CE4882E162;
	Thu, 22 Oct 2020 14:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxKVWvdR+V90; Thu, 22 Oct 2020 14:58:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 148C82E152;
	Thu, 22 Oct 2020 14:58:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F02B3C0052;
	Thu, 22 Oct 2020 14:58:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A604AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8489C2E152
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luOqxyKroLlq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:58:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 5F4EB2E14F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 14:58:18 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t18so1103665plo.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WD0jtBNTjlU9AN49fhz5jjiyP58Uz1jlaJhU9PAdtjM=;
 b=dcCPde1CvGRMz3wM7wYha4dqt3k7ghjEmbmwUrBkqVEzqFi9K4UX/sszrLKlLCEdjt
 OgVgu1x8IXbs6uqlDQzISq8JMv+PuwNHidl27bE/2C66q2NnEhBFdc7eBTcZnJTNeRMA
 1PEgEwX+HGZqDxwypiyGUe+HoF5+41CAq4ZAFAvvDwKs3+kHsqMolsFCXFT+vq+tUyKx
 6X93LSWyzHbcjHZWed9Ub5YRag+TodepPKSMDnE4R3sCfQEu+wsR7IqUiYiv+gnF+COE
 ++F/v85PIHDcu9U3U6jPnHusikRmF+Xe51R1wO3BJdOUShqhNAARaoFT9VhnnRY9dATr
 HY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WD0jtBNTjlU9AN49fhz5jjiyP58Uz1jlaJhU9PAdtjM=;
 b=drnet9m3z5noKqBjqavKF84O2SrqEHeiKrG+qIDWv6viXnkyG6jahKsgZ1ZCPJlxT0
 zYsf1qU49DKojnq0iDumVtFxIJIVorLgwwtUxw+MXLO2ruxyE8AjQmk26PrC9/p9/ije
 6U/vnXOMcO4pEFVKNQxtNW0Q6dY/fi6otce66SOtIhF2QUQLf1R3ESR0W0h2mGe7TiQw
 PSOVSETUrZ1S851L7druVqcaR0WZJVTe/WwjSwpdFHD/Z2nBj9fPQzqTi9zKqV2c+RS+
 ukXDVnYgRoYyYR/UY+2pMmcTuk4VCj5ZYQN/CYh/hwqBwsKbL2gGXScS1NmNBiqDjaHf
 tY5w==
X-Gm-Message-State: AOAM531UUxWj0n9TM6TMh8sUQWufvVxFJI9bjZodiTTi2awyIDsk2zIC
 3psZ5rbge6Evmj1IAQoZ19s=
X-Google-Smtp-Source: ABdhPJwy+XLpMOCBB3opoKCpHFBgZ75ggUWsKgHfEf9nERb3jpZYy8pk+k1tS8TI44/2yJaWLYfkrw==
X-Received: by 2002:a17:902:708a:b029:d4:cf7c:6c59 with SMTP id
 z10-20020a170902708ab02900d4cf7c6c59mr3103971plk.52.1603378697733; 
 Thu, 22 Oct 2020 07:58:17 -0700 (PDT)
Received: from ?IPv6:2402:3a80:41a:7419:e1bd:6bc1:d06a:efd1?
 ([2402:3a80:41a:7419:e1bd:6bc1:d06a:efd1])
 by smtp.gmail.com with ESMTPSA id b5sm2607693pfo.64.2020.10.22.07.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 07:58:17 -0700 (PDT)
To: joe@perches.com
References: <20201022145021.28211-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <1de93783-1faf-95b9-c8bd-2f2bb2f8a010@gmail.com>
Date: Thu, 22 Oct 2020 20:28:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201022145021.28211-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix false
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

On 22/10/20 8:20 pm, Aditya Srivastava wrote:
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
> consists of hex symbols and skip this warning if, it forms a pattern
> of repeating sequence or contains more special character after pattern
> than non hex characters.
> 
> A quick evaluation on v5.6..v5.8 showed that this fix reduces
> REPEATED_WORD warnings from 2797 to 907.
> 
> A quick manual check found all cases are related to hex output or
> list command outputs in commit messages.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9b9ffd876e8a..0f57e99ed670 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3051,7 +3051,10 @@ sub process {
>  		}
>  
>  # check for repeated words separated by a single space
> -		if ($rawline =~ /^\+/ || $in_commit_log) {
> +# avoid false positive from list command eg, '-rw-r--r-- 1 root root'
> +		if (($rawline =~ /^\+/ || $in_commit_log) &&
> +		$rawline !~ /[bcCdDlMnpPs\?-][rwxsStT-]{9}/) {
> +			my @hex_seq = $rawline =~ /\b[0-9a-f]{2,} \b/g;
>  			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
>  
>  				my $first = $1;
> @@ -3065,6 +3068,34 @@ sub process {
>  				next if ($first ne $second);
>  				next if ($first eq 'long');
>  
> +				# avoid repeating hex occurrences like 'ff ff fe 09 ...'
> +				if ($first =~ /\b[0-9a-f]{2,}/) {
> +					# if such sequence occurs more than 4, it is most probably part of some of code
> +					next if ((scalar @hex_seq)>4);
> +
> +					# for hex occurrences which are less than 4
> +					# get first hex word in the line
> +					if ($rawline =~ /\b[0-9a-f]{2,} /) {
> +						my $post_hex_seq = $';
> +
> +						# set suffieciently high default values to avoid ignoring or counting in absence of another
> +						my $non_hex_char_pos = 1000;
> +						my $special_chars_pos = 500;
> +
> +						if ($post_hex_seq =~ /[g-z]+/) {
> +							# first non hex character in post_hex_seq
> +							$non_hex_char_pos = $-[0];
> +						}
> +						if($post_hex_seq =~ /[^a-zA-Z0-9]{2,}/) {
> +							# first occurrence of 2 or more special chars
> +							$special_chars_pos = $-[0];
> +						}
> +
> +						# as such occurrences are not common, it is more likely to be a part of some code
> +						next if ($special_chars_pos<$non_hex_char_pos);
> +					}
> +				}
> +
>  				if (WARN("REPEATED_WORD",
>  					 "Possible repeated word: '$first'\n" . $herecurr) &&
>  				    $fix) {
> 

I have also generated some reports showing impact caused by the changes:

Hex variations causing warning previously:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/hex_variations.txt

Change in warnings and errors:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/relative_summary/summary_relative.txt

Warnings which are dropped:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/relative_summary/dropped_warnings/summary.txt

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
