Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40700C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 17:04:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6FD2173E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 17:03:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuqZDTaV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6FD2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DBB3087E04;
	Wed, 14 Oct 2020 17:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LjH3dwYuh7gH; Wed, 14 Oct 2020 17:03:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 529ED87E01;
	Wed, 14 Oct 2020 17:03:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C337C0891;
	Wed, 14 Oct 2020 17:03:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3665AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 17:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2CE0E87E0D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 17:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TlF5l2mxzS4w
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 17:03:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 91F6A87E01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 17:03:56 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id b193so15729pga.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NhWyzI7aMhYeZgBfQrXPOlBd5EyMGk6DGlbxl4s8L48=;
 b=PuqZDTaVk/7N/V+wFl4Z/q/o65LFPqsn56Tfvim69FdFTu9oMjKGDQ8bgj8W+oBMG9
 zi+E5IUuxGxZyNzMOJ+ytSwCUOn+Ar/oJPYdZz5ytrBA47ZKej3JK6SA8zoXxQ+K7Uyc
 GhiQWGxG17b3CVqT/+l5pp8Nc5X6MghW80VjyCOrX8aW7QVnZNJlRiHgzNdRtOwIlRN4
 sXYrkBSLnJBSrbkqTarsJr5a6N6EIbFikfjBy3DmOHewa1SbfhdbEYwqT69y/z3YWHKS
 GghpqV0fbgbYQmgujUv5ndpNkeHwPhhJVqebdV1lCBox/CudPhhjYnxcNG6nuOxu5iA4
 54/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NhWyzI7aMhYeZgBfQrXPOlBd5EyMGk6DGlbxl4s8L48=;
 b=C0uN5JMIFidDTt+nfDA6Tv5YbBSux6FilqOTDd4cYwWKgGPr/NXuKyzzOwboXgJtjy
 +29TkMm/NYiHQrEitsEl2gl3ZEotNjvUu8PRBVqporn7C/XehzXbwT86tWQzJzcS6AYQ
 ++wDnMvnlQgk+5GNsYcR2Usm15adGeqONBfIxCR72T1lzML5QcjkPKk8InlP/AraI/KW
 gKBc6+HP2fR1Do0zEgT1UxYcPedbgGtNU933UutDxbpc6cJ2uWGCCpw4Zv/AjBqMWucq
 k1uBl/MqU6RqLG2onsdunF6OjK2Pdj628gd90upmuMI4tPVyM1ZVQFgWczfz69g2I9Ct
 Srig==
X-Gm-Message-State: AOAM532ha39kU72LaZbjK9k+KI0e1+YhgLGf1muFrpdnYWqrhnM5wZ8G
 djvpADcuwIHhM3pe8jwOLw6GY19fk4CeKA==
X-Google-Smtp-Source: ABdhPJxwJu+sa7oJPKCU8rwqaLOCtljUGyepqhaKePlYFbOcysqHtVGtxB9rXaZ8b67yu2Yp+NAsYQ==
X-Received: by 2002:a63:ba49:: with SMTP id l9mr4836634pgu.246.1602695035520; 
 Wed, 14 Oct 2020 10:03:55 -0700 (PDT)
Received: from [192.168.43.245] ([42.111.144.73])
 by smtp.gmail.com with ESMTPSA id t5sm76452pgs.74.2020.10.14.10.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 10:03:55 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
References: <20201013060714.33713-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2010130811050.14590@felia>
From: Aditya <yashsri421@gmail.com>
Message-ID: <ebc09f62-7ba3-0965-e999-0ca33156f40f@gmail.com>
Date: Wed, 14 Oct 2020 22:33:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010130811050.14590@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix missing
	whitespace in formatted email
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


On 13/10/20 11:46 am, Lukas Bulwahn wrote:
>
> On Tue, 13 Oct 2020, Dwaipayan Ray wrote:
>
>> Commit 0c01921e56f9 ("checkpatch: add new warnings to author signoff
>> checks.") introduced new checks for author sign off. The format_email
>> procedure was modified to add comment blocks to the formatted email. But
>> no space was added between the email address and mail comment.
>>
>> This causes wrong email formatting in cases where the email is in the form
>> "author@example.com (Comment block)". The space between the address and
>> comment block is removed, which causes incorrect parsing of the
>> formatted email.
>>
>> An evaluation on checkpatch brought up this case. For example,
>> on commit 1129d31b55d5 ("ima: Fix ima digest hash table key calculation"),
>> the following warning was reported:
>>
>> WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big endian
>> system concerns)' might be better as 'David.Laight@aculab.com(big endian
>> system concerns)'
>>
>> Add a single space in between the address and comment when the
>> extracted comment is not empty.
>>
> Dwaipayan, looks good to me.
>
> So, how about a 'Fixes:' tag?
>
> Aditya, can you rerun your evaluation with this fix patch applied on top?
>
> Then, we need a comparison for:
> 1. completely before vs. after the two patches, and
> 2. after the first patch vs. after the two patches (to see that the fix 
> works)
>
> More support on evaluation from others interested to become mentees are of 
> course welcome.
>
> Lukas
>  
>> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>> ---
>>  scripts/checkpatch.pl | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index fab38b493cef..f1a4e61917eb 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -1221,7 +1221,9 @@ sub format_email {
>>  	} else {
>>  		$formatted_email = "$name$name_comment <$address>";
>>  	}
>> -	$formatted_email .= "$comment";
>> +	if ("$comment" ne "") {
>> +		$formatted_email .= " $comment";
>> +	}
>>  	return $formatted_email;
>>  }
>>  
>> -- 
>> 2.27.0
>>
>>
Hi Sir

I have analyzed the reports using this patch and made comparison. The links are as follows:

1. completely before vs. after this patch: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/before_v_second/summary_relative.txt
2. after the first patch vs. after the two patches: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/first_v_second/summary_relative.txt

Kindly let me know if you have any questions.

Aditya

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
