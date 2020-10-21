Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE126C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 16:49:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D65D920B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 16:49:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZfdQ0U+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D65D920B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5003287458;
	Wed, 21 Oct 2020 16:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBsa4CR137R6; Wed, 21 Oct 2020 16:49:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C11BA87452;
	Wed, 21 Oct 2020 16:49:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6AC3C0052;
	Wed, 21 Oct 2020 16:49:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A003C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 16:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2C7982E3CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 16:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I-n6-yKZcCwo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 16:49:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 07A2433D8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 12:53:19 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y1so1170696plp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 05:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hSkVDyeO7oxl4ZqYfI+FDgFJDQbzlOCOa+ifs4+ZE78=;
 b=YZfdQ0U+vS4Qp/iJ1vIdePdl2JDoiLxKrPntbsTnXfJb8BmUg/gVSjVmM3mFKk/TRO
 Btl7TXmXMUbhSc86FOS6oIo68vmz7kiNwtHj0C016rBmYpWj9Snb9PqVBNj8moXQxMaL
 V9xbIwTsItqOzOePvhaXiMZnjZQyWWr4JIauR3cOydQ3a93hCjaE3uxfR6o6ftuWRHh3
 ZeVxMH8lefa/Z2j9LhYt/bTt+3lXFimM5nW8WsJs+X7yXPoBPRorc+x3KDUTaNfFZoNu
 AYdEkEKuBe3awyDhJ+AuAQoyvxNnxT64cjq5NZA2fPhH7m5Mz1i7b/Sa4kjDDdNDLXwc
 IhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hSkVDyeO7oxl4ZqYfI+FDgFJDQbzlOCOa+ifs4+ZE78=;
 b=Ud3Pc3kTZ2SVVD4W8+x6ZpQxSJBEZR328AhCEoX4tjXJUioOy4LGetHhO33NsgBSWr
 l9eZ4Wb7s6jSuCWC9MPIb0UN45pZwQ2sOGt8qb8s/DDL3ebtl1sbOtAM4wDkX4+PMDZE
 uzX4A3XEeNsWscEknDhoCFrXsx3TroNPFslc7uzBbTP2OzsS+YgmNbRNl5Vlt5fZre8k
 PNCtuSt3NmgXgOj6WPI1swIcQoxO+T/lneRG2EUE2+7RBHxaefMIecvOdOzi5InRV3SK
 mRMzS+O1UnHom2PZCHh5Bux2pOVpp1u6LPRfDsyijwPxkCT8ZocuOdGxZqmUNvp9Rn4r
 nkAw==
X-Gm-Message-State: AOAM531bXZC7IgP3yRP70tQscdPEWMf0U8l5rRB7FeG4GVoojSa2ps5b
 8LcqMJp+xp1BPfiqnGWH8F3b+Uz9UL1Gp/n9
X-Google-Smtp-Source: ABdhPJxO2y49iK9swYEHIhPEaRYgS6ZiwBAEPuxqxCqn0r5/AVuNWOsBSeZzlEKqb9S0NdEnofLTDQ==
X-Received: by 2002:a17:90a:4684:: with SMTP id
 z4mr3232840pjf.97.1603284799116; 
 Wed, 21 Oct 2020 05:53:19 -0700 (PDT)
Received: from ?IPv6:2402:3a80:41d:60ec:8cb2:c45f:197:35d9?
 ([2402:3a80:41d:60ec:8cb2:c45f:197:35d9])
 by smtp.gmail.com with ESMTPSA id w19sm2451027pff.6.2020.10.21.05.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 05:53:18 -0700 (PDT)
From: Aditya <yashsri421@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
References: <20201021050027.13253-1-yashsri421@gmail.com>
 <75340ad4-d0c1-4b60-9a2f-ea68ab97fe67@gmail.com>
 <alpine.DEB.2.21.2010210801120.8328@felia>
 <CABJPP5CRJTe3wuLwo8HpFX_dygThic6Ci1=L1=6x0p6e+yR32g@mail.gmail.com>
 <alpine.DEB.2.21.2010211049020.8328@felia>
 <81e9cdec-d3c7-e5ba-0f2d-061fc0738385@gmail.com>
Message-ID: <caec3a76-319f-5520-17b6-471be1f64767@gmail.com>
Date: Wed, 21 Oct 2020 18:23:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <81e9cdec-d3c7-e5ba-0f2d-061fc0738385@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On 21/10/20 5:39 pm, Aditya wrote:
> On 21/10/20 2:22 pm, Lukas Bulwahn wrote:
>>
>>
>> On Wed, 21 Oct 2020, Dwaipayan Ray wrote:
>>
>>> Hey Aditya and Lukas,
>>>
>>>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>>>>> index 9b9ffd876e8a..181c95691715 100755
>>>>>> --- a/scripts/checkpatch.pl
>>>>>> +++ b/scripts/checkpatch.pl
>>>>>> @@ -3052,7 +3052,9 @@ sub process {
>>>>>>
>>>>>>  # check for repeated words separated by a single space
>>>>>>             if ($rawline =~ /^\+/ || $in_commit_log) {
>>>>>> -                   while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
>>>>>> +                   # avoid repeating hex occurrences like 'ff ff fe 09 ...'
>>>>>> +                   while ($rawline !~ /((\s)*[0-9a-z]{2}( )+){4,}/ &&
>>>
>>> Pattern is probably wrong. It doesn't recognize word boundaries or
>>> tabs between words. Example of the first type:
>>>
>>> 000 00 ff ff ...
>>>
>>
>> I am wondering if this pattern really appears.
>>
>> Hex stuff is usually written two-letter and spaces.
>>
>> Maybe it is best to limit it to 0-9a-f, though. I think there should not 
>> be matches with other letters than that.
>>
>> Aditya, evaluations on those alternatives would help to make decisions.
>>
>>> The regex matches "00 00 ff ff" ignoring the first 0.
>>>
>>> I think it could be perhaps better with something like:
>>>
>>>  # check for repeated words separated by a single space
>>> -               if ($rawline =~ /^\+/ || $in_commit_log) {
>>> +               if (($rawline =~ /^\+/ || $in_commit_log) &&
>>> +                   $rawline !~ /(?:\b(?:[0-9a-f]{2}\s+){4,})/) {
>>>                         pos($rawline) = 1 if (!$in_commit_log);
>>>                         while ($rawline =~ /\b($word_pattern)
>>> (?=($word_pattern))/g) {
>>>
>>> Please test it though. I only ran it on a few patterns.
>>>
>>> Apart from it, this does fix the problem. But I am quite sceptical about
>>> matching 4 or more 2 lettered words in a row. There could be counter
>>> examples but I guess that is very rare. It's not very general, but for
>>> the moment it does the job.
>>>
>>> So I think it's probably good with some changes. Not sure what Joe
>>> would have in mind though.
>>>
>>> Lukas, I think with the changes in place, it is ready to go for discussion.
>>>
>>
>> Dwaipayan, thanks for your review.
>>
>> Lukas
>>
> 
> Hi Sir
> I made these changes:
>  # check for repeated words separated by a single space
>  		if ($rawline =~ /^\+/ || $in_commit_log) {
> -			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> +			# avoid repeating hex occurrences like 'ff ff fe 09 ...'
> +			while ($rawline !~ /(\b[0-9a-f]{2}( )+){4,}/ &&
> +				$rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> 
>  				my $first = $1;
>  				my $second = $2;
> 
> 
> 
> Reports:
> List of errors and warnings after applying the patch:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/summary.txt
> 
> Change in errors and warnings compared to previous patch:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/relative_summary/summary_relative.txt
> 
> Dropped warnings compared to previous patch:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/relative_summary/dropped_warnings/summary.txt
> 
> Thanks
> Aditya
> 

I have also generated report to find the missing warnings from both
versions of my patches. Here is the report:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/relative_summary/dropped_warnings/patch_revision_summary.txt

Thank You
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
