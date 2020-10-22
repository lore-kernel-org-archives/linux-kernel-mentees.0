Return-Path: <SRS0=G515=D5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59B1C5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 19:15:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F3DF24656
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 19:15:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpvUWooZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F3DF24656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8068A87073;
	Thu, 22 Oct 2020 19:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nfMp9KI9owDL; Thu, 22 Oct 2020 19:15:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA23F86FE9;
	Thu, 22 Oct 2020 19:15:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B870EC088B;
	Thu, 22 Oct 2020 19:15:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84FCFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 19:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 720B186FE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 19:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QlOAY1PgpcCQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 19:15:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 994CB87073
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 19:15:06 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id h6so1536006pgk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 12:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MTOPs1CSneNAIcv0bX2fvvyRnuzty6FLHw/Un0yy0DU=;
 b=dpvUWooZMZxO3OAxNAJlXh0PhQvoFvvAOnv3KzUxOWanOsJIHJtKosY7lX3+S2ggYB
 a8K3w2zCYXj2bKjWxD3yTP7RpMM6MbXp2Z0BwqKHGlc/91ZBI6IBuVBkHxdPCZnbdQrG
 fsRolZDMezc5XqP5rUHBBmd/MG7ru9xnTl+QD5g0dZTOBEgWyMWTVzRnlbmd5dWcKI7L
 o6zxoJICUC04q4gTwj3Dn+GD+acCCxbh35+VqFSskD4gHB1VGSBKSxW+ZMuBUvfgYZoo
 gwT+vI0tExgeGbLD3CF+XQZL289HtQzeDfDzPstAFkqOYEFqFgIedpT8c85wPVwREqQU
 trJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MTOPs1CSneNAIcv0bX2fvvyRnuzty6FLHw/Un0yy0DU=;
 b=W4Cedi/rAYwjzS5mGbR1FLY/R5IScZWYAwBxRNUldxuc3iuYD9VPezGgKz4dWA6pE/
 TeUIBCP+2IiiWlOE0LxiAPhGrxXhoWn7hCXvqPzHphNY5Bd+vCPr0fBz9xKoZ+fmP2/t
 tfSVwvopMm8rPLjxomc35Wc2s19XPyuH94wBSeDcDS8k/w7I071vCUOCl/SZkns5r0kL
 e5iX2TF7rLv960N461MenMiH5TvfpRDF+EJYcO4ot1HsXjmrb005sk8hAcbD0aMUEWZw
 y37FT95sGkAlQGkaWxVlKlNm19sJt7Jvj6qTTJEDEwuOIUXyP9nKf0023MRcHaqK/VUH
 wrrQ==
X-Gm-Message-State: AOAM532ZdytfS9GinH88Eoev7IWxeMIht4QhskUC6N2RGpBj1N4ieJCt
 McKsBol7+eNMvNz3JugGM+Q=
X-Google-Smtp-Source: ABdhPJz9pcCvEF/9HR1/lctA5F5SxcIGH+6rTGs+MVMyRtCMFyMPTLygkwlaa8dobVnCGzx2bPbRTQ==
X-Received: by 2002:a05:6a00:13aa:b029:15d:73e6:2e9f with SMTP id
 t42-20020a056a0013aab029015d73e62e9fmr4159975pfg.0.1603394105920; 
 Thu, 22 Oct 2020 12:15:05 -0700 (PDT)
Received: from ?IPv6:2402:3a80:41a:7419:e1bd:6bc1:d06a:efd1?
 ([2402:3a80:41a:7419:e1bd:6bc1:d06a:efd1])
 by smtp.gmail.com with ESMTPSA id b3sm3170844pfd.66.2020.10.22.12.15.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 12:15:05 -0700 (PDT)
To: Joe Perches <joe@perches.com>
References: <20201022145021.28211-1-yashsri421@gmail.com>
 <4cbbd8d8b6c4d686f71648af8bc970baa4b0ee9b.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <5121bf7c-a126-6178-62ff-e54f0bb4cb6e@gmail.com>
Date: Fri, 23 Oct 2020 00:44:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4cbbd8d8b6c4d686f71648af8bc970baa4b0ee9b.camel@perches.com>
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

On 22/10/20 9:40 pm, Joe Perches wrote:
> On Thu, 2020-10-22 at 20:20 +0530, Aditya Srivastava wrote:
>> Presence of hexadecimal address or symbol results in false warning
>> message by checkpatch.pl.
> []
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
>> @@ -3051,7 +3051,10 @@ sub process {
>>  		}
>>  
>>  # check for repeated words separated by a single space
>> -		if ($rawline =~ /^\+/ || $in_commit_log) {
>> +# avoid false positive from list command eg, '-rw-r--r-- 1 root root'
>> +		if (($rawline =~ /^\+/ || $in_commit_log) &&
>> +		$rawline !~ /[bcCdDlMnpPs\?-][rwxsStT-]{9}/) {
> 
> Alignment and use \b before and after the regex please.

If we use \b either before or after or both it does not match patterns
such as:
+   -rw-r--r--. 1 root root 112K Mar 20 12:16
selinux-policy-3.14.4-48.fc31.noarch.rpm

This is happening probably because it is counting '-' for '\b'
I have not observed any negatives of using this though.

> 
> 		if (($rawline =~ /^\+/ || $in_commit_log) &&
> 		    $rawline !~ /\b[bcCdDlMnpPs\?-][rwxsStT-]{9}\b/) {
>> @@ -3065,6 +3068,34 @@ sub process {
>>  				next if ($first ne $second);
>>  				next if ($first eq 'long');
>>  
>> +				# avoid repeating hex occurrences like 'ff ff fe 09 ...'
>> +				if ($first =~ /\b[0-9a-f]{2,}/) {
>> +					# if such sequence occurs more than 4, it is most probably part of some of code
>> +					next if ((scalar @hex_seq)>4);
>> +					# for hex occurrences which are less than 4
>> +					# get first hex word in the line
>> +					if ($rawline =~ /\b[0-9a-f]{2,} /) {
>> +						my $post_hex_seq = $';
>> +
>> +						# set suffieciently high default values to avoid ignoring or counting in absence of another
>> +						my $non_hex_char_pos = 1000;
>> +						my $special_chars_pos = 500;
>> +
>> +						if ($post_hex_seq =~ /[g-z]+/) {
>> +							# first non hex character in post_hex_seq
>> +							$non_hex_char_pos = $-[0];
>> +						}
>> +						if($post_hex_seq =~ /[^a-zA-Z0-9]{2,}/) {
>> +							# first occurrence of 2 or more special chars
>> +							$special_chars_pos = $-[0];
>> +						}
> 
> What does all this code actually avoid?
> 
> 

Sir, there are multiple variations of hex for which this warning is
occurring, for eg:
1) 00 c0 06 16 00 00 ff ff 00 93 1c 18 00 00 ff ff  ................
2) ffffffff ffffffff 00000000 c070058c
3)     f5a:       48 c7 44 24 78 ff ff    movq
$0xffffffffffffffff,0x78(%rsp)
4) +    fe fe
5) +    fe fe   - ? end marker ?
6) Code: ff ff 48 (...)

So I first check if the repeated word matches /\b[0-9a-f]{2,}/ . If it
does and occurs as a sequence of such repetitions more than 4(ie more
than or equal to 5), then it is most probably a part of hexadecimal
code. This is implemented here,

+				if ($first =~ /\b[0-9a-f]{2,}/) {
+					# if such sequence occurs more than 4, it is most probably part
of some of code
+					next if ((scalar @hex_seq)>4);

This addresses our issues for warning similar to example (1),(2) and (3).

But still we haven't detected 4,5,6. One can argue that we can modify:

+					next if ((scalar @hex_seq)>4);

with (scalar @hex_seq)>2 or (scalar @hex_seq)>3

but then, we'll not be able to account for warnings such as:

7) +	 * sets this to -1, the slack value will be calculated to be be
halfway
8) + * @seg: index of packet segment whose raw fields are to be be
extracted
9) The data in destination buffer is expected to be be parsed in big
10) +	 *   1. New session or device can'be be created - session sysfs
files

Here I observed that in hex codes, there are atleast 2 special
characters present before any non-hex character, for eg. in (5). Also
generally such occurrences are very rare in writing english, and it is
also helpful in our case.

This is implemented here:

>> +				# avoid repeating hex occurrences like 'ff ff fe 09 ...'
>> +				if ($first =~ /\b[0-9a-f]{2,}/) {
>> +					# if such sequence occurs more than 4, it is most probably
part of some of code
>> +					next if ((scalar @hex_seq)>4);
>> +					# for hex occurrences which are less than 4
>> +					# get first hex word in the line
>> +					if ($rawline =~ /\b[0-9a-f]{2,} /) {
>> +						my $post_hex_seq = $';
>> +
>> +						# set suffieciently high default values to avoid ignoring or
counting in absence of another
>> +						my $non_hex_char_pos = 1000;
>> +						my $special_chars_pos = 500;
>> +
>> +						if ($post_hex_seq =~ /[g-z]+/) {
>> +							# first non hex character in post_hex_seq
>> +							$non_hex_char_pos = $-[0];
>> +						}
>> +						if($post_hex_seq =~ /[^a-zA-Z0-9]{2,}/) {
>> +							# first occurrence of 2 or more special chars
>> +							$special_chars_pos = $-[0];
>> +						}

I have used these two lines for cases like example(4):
+						my $non_hex_char_pos = 1000;
+						my $special_chars_pos = 500;

Here, non-hex characters are missing, thus the default character helps
us to get desired result.
Also, I have set higher values such that if one of them occurs in a
line, the result remain unaffected, than with lower default values.


Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
