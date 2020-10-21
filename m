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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F173C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 12:10:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 884C122249
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 12:10:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBML8wbp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 884C122249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1B640872AC;
	Wed, 21 Oct 2020 12:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjtK62nj79xR; Wed, 21 Oct 2020 12:09:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 61001872AB;
	Wed, 21 Oct 2020 12:09:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47DDEC08A1;
	Wed, 21 Oct 2020 12:09:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99CD9C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 12:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 817AB86881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 12:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWLUvd9cWwxQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 12:09:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C97E186A1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 12:09:55 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id h7so1375403pfn.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 05:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OfWWqOiQfRIb5At2WXFGX9P7JP9fJoeOUIfKzcCJKdU=;
 b=rBML8wbpH4IkBCTvHuMDai3kn+cXAr+0OThN38827n78D12Jb5YPyRANyWZVaJjJQ4
 9lqqKs+I6RztG9pmKJcgvTioKNwEW0UjU6MxnarvG0qq/Vec0r9X8K0vmp7VAW+jE+gF
 l5sEmlbmTUkkB2tKveTNFVw3FQSBSPsEybouGO+WNLW64PkXU3S1zXYymh0cbhEC1xOg
 +y6/iAzmFtxW0X1Veo4cXuHWvAHVZnl7GUMjL7RmweZGfFHFDK6XdJxxCjXZipC4E/Ef
 b9iviCObHEbIRe1IiYO/MJdA02tAHLM7WDAR7LJVhAlavVRDzJPFYR061122IicbwJwk
 o1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OfWWqOiQfRIb5At2WXFGX9P7JP9fJoeOUIfKzcCJKdU=;
 b=Fo3deeLAsxn5KNPabBqQjDTnGWMgmZqXeF/shDpqf0OYv7KQSvcBJLt/LZcr/UCS+8
 PGvtnq1PShz6g7l3HofisPa1I+iLuNqD67NpuLNmN8chvUMFEu1zxEY/r8d7twKv2XEg
 J1jJ3++NbdtbXNKF47c2MFpur1lzQJp9fBq20NmJ8eD4/7r18NfvmOvR5vesbeinXZCa
 WyK5xrsKL+3TJhiCHHCvg3Q7zqubJHp44EmeRo/z81PB+mGjEuceIRmdKbMIvszMlY6z
 IItLDFVMtmBvVoNui6hWB/7szhnPVPCAwO0zCL7EKy3ugdiFk/KLZ0lu1pSUX8zYPRlX
 gfDQ==
X-Gm-Message-State: AOAM531u2hSD4uVyRP1ru/jrLtiK/GZM8f81AOH1BxBv84JSABHofile
 Ym/tINUE+B3YnjfMIpkt/0K6oVohHjVBi5Oq
X-Google-Smtp-Source: ABdhPJyvcOuYaDl+Pwizij3Hn1C7UuOnYHBtVsXtUSLN4B2KTgTgxRfEfpNG0FrbLsEIlid5igrsQA==
X-Received: by 2002:a62:878f:0:b029:155:ec80:9658 with SMTP id
 i137-20020a62878f0000b0290155ec809658mr3255299pfe.57.1603282194872; 
 Wed, 21 Oct 2020 05:09:54 -0700 (PDT)
Received: from ?IPv6:2402:3a80:41d:60ec:8cb2:c45f:197:35d9?
 ([2402:3a80:41d:60ec:8cb2:c45f:197:35d9])
 by smtp.gmail.com with ESMTPSA id x19sm1024881pjk.25.2020.10.21.05.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 05:09:54 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
References: <20201021050027.13253-1-yashsri421@gmail.com>
 <75340ad4-d0c1-4b60-9a2f-ea68ab97fe67@gmail.com>
 <alpine.DEB.2.21.2010210801120.8328@felia>
 <CABJPP5CRJTe3wuLwo8HpFX_dygThic6Ci1=L1=6x0p6e+yR32g@mail.gmail.com>
 <alpine.DEB.2.21.2010211049020.8328@felia>
From: Aditya <yashsri421@gmail.com>
Message-ID: <81e9cdec-d3c7-e5ba-0f2d-061fc0738385@gmail.com>
Date: Wed, 21 Oct 2020 17:39:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010211049020.8328@felia>
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

On 21/10/20 2:22 pm, Lukas Bulwahn wrote:
> 
> 
> On Wed, 21 Oct 2020, Dwaipayan Ray wrote:
> 
>> Hey Aditya and Lukas,
>>
>>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>>>> index 9b9ffd876e8a..181c95691715 100755
>>>>> --- a/scripts/checkpatch.pl
>>>>> +++ b/scripts/checkpatch.pl
>>>>> @@ -3052,7 +3052,9 @@ sub process {
>>>>>
>>>>>  # check for repeated words separated by a single space
>>>>>             if ($rawline =~ /^\+/ || $in_commit_log) {
>>>>> -                   while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
>>>>> +                   # avoid repeating hex occurrences like 'ff ff fe 09 ...'
>>>>> +                   while ($rawline !~ /((\s)*[0-9a-z]{2}( )+){4,}/ &&
>>
>> Pattern is probably wrong. It doesn't recognize word boundaries or
>> tabs between words. Example of the first type:
>>
>> 000 00 ff ff ...
>>
> 
> I am wondering if this pattern really appears.
> 
> Hex stuff is usually written two-letter and spaces.
> 
> Maybe it is best to limit it to 0-9a-f, though. I think there should not 
> be matches with other letters than that.
> 
> Aditya, evaluations on those alternatives would help to make decisions.
> 
>> The regex matches "00 00 ff ff" ignoring the first 0.
>>
>> I think it could be perhaps better with something like:
>>
>>  # check for repeated words separated by a single space
>> -               if ($rawline =~ /^\+/ || $in_commit_log) {
>> +               if (($rawline =~ /^\+/ || $in_commit_log) &&
>> +                   $rawline !~ /(?:\b(?:[0-9a-f]{2}\s+){4,})/) {
>>                         pos($rawline) = 1 if (!$in_commit_log);
>>                         while ($rawline =~ /\b($word_pattern)
>> (?=($word_pattern))/g) {
>>
>> Please test it though. I only ran it on a few patterns.
>>
>> Apart from it, this does fix the problem. But I am quite sceptical about
>> matching 4 or more 2 lettered words in a row. There could be counter
>> examples but I guess that is very rare. It's not very general, but for
>> the moment it does the job.
>>
>> So I think it's probably good with some changes. Not sure what Joe
>> would have in mind though.
>>
>> Lukas, I think with the changes in place, it is ready to go for discussion.
>>
> 
> Dwaipayan, thanks for your review.
> 
> Lukas
> 

Hi Sir
I made these changes:
 # check for repeated words separated by a single space
 		if ($rawline =~ /^\+/ || $in_commit_log) {
-			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
+			# avoid repeating hex occurrences like 'ff ff fe 09 ...'
+			while ($rawline !~ /(\b[0-9a-f]{2}( )+){4,}/ &&
+				$rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {

 				my $first = $1;
 				my $second = $2;



Reports:
List of errors and warnings after applying the patch:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/summary.txt

Change in errors and warnings compared to previous patch:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/relative_summary/summary_relative.txt

Dropped warnings compared to previous patch:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task3/relative_summary/dropped_warnings/summary.txt

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
