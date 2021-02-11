Return-Path: <SRS0=BNSL=HN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46379C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Feb 2021 11:17:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B25D364DD5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Feb 2021 11:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B25D364DD5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B34D6F620
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Feb 2021 11:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ne5bQfWRJNKA
	for <linux-kernel-mentees@archiver.kernel.org>;
	Thu, 11 Feb 2021 11:17:01 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 705A36F53B; Thu, 11 Feb 2021 11:17:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EF79600D1;
	Thu, 11 Feb 2021 11:16:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CA99C0174;
	Thu, 11 Feb 2021 11:16:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1927BC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 11:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EED52600D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 11:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZyM0SMeKi7iu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 11:16:56 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id C7C2C6F49E; Thu, 11 Feb 2021 11:16:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 050AC600D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 11:16:53 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id j5so3615886pgb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 03:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Eok38EjOVZrrFs5gpeC+1/wPIPUaeBoh32nOGXbb7qU=;
 b=mcylKQ4cBs5ABj0YFku9dcq3CddRjOdCf6k0b3WxjzQADHjv+nvtN9UQMw0vP4VgZA
 8yxtjV+oqnWfXtGQp5wJFEj2kybP5i/ymVo+QUJp67LivpHvhhOy5O4++3CagCj2RTUO
 trQZ6RlYphXmWPFKNRtg16JPXYG+Qxi1JVMmNZnk8spv7WaCTNcNtUko+HUgFQ5gu4Qt
 085HKIn/dj/h11tMIeRDHan5XrJOXxMb73iaIrGwfTz6+e3nfWYK/OA94o5fCYBuqAeI
 uR8RZmZHtqtRmC71MKD/ru5SIE2RAwbbhoXpjco8dA4daEfaZfe58WoKGVC7jShLXGMr
 eVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Eok38EjOVZrrFs5gpeC+1/wPIPUaeBoh32nOGXbb7qU=;
 b=YO6gABDWgh97+/AylHh0VlH0swYKHRK91Esnytl20VqzijMmUYrLO8yudQCM153MlF
 It2fa0UsCqo2lvTDtgx0+AoVA6Edd7RFl1AX9Lx2C7tGoWd3InK9K0K16TAi5LzW6mox
 Y1F3UIYQDEk3+qn5WTyqOpEIdIIxcMqPPVkj9GndWIkxhDrQ5XMltTwd1xvbtNZYCgfP
 9HjKGw4N9D5k76tRlUb7TvJAlub6SSo+jN4dP2dm7+nirFSm7UfxxRRMWVEAIHsKblaq
 j/vWPhAiLx+hCT0d58t3HOyK9W4sg22nHwADUUtdvggU9ZN4XECBfKggKvp1KMycR1EC
 eXeQ==
X-Gm-Message-State: AOAM533Y1EqZb+1peh8e/fiMOUH0uX8pPf+YiTKbqoInF7BdVroIIWur
 DgDkBkP0Z9JiKN/4W/N3VRtn0/YIAeFlmw==
X-Google-Smtp-Source: ABdhPJzFIr6O/PhJ2aJN8pvwwJhiKW+/251oO77Y2EJt6b7vH+90r+762ElXpy5egDRN2C8pWht/qg==
X-Received: by 2002:a63:7c5:: with SMTP id 188mr7554338pgh.22.1613042212989;
 Thu, 11 Feb 2021 03:16:52 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:c9bb:4bbf:5951:59d0?
 ([2405:201:600d:a089:c9bb:4bbf:5951:59d0])
 by smtp.gmail.com with ESMTPSA id t23sm5182933pfl.80.2021.02.11.03.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 03:16:52 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <CAKXUXMzje=kiC5NwdWuFT4sO8d8WXXx3TQkT6HdybrgMU7NBFw@mail.gmail.com>
 <78c992f7-41c7-dca7-877d-839cb2b1dba0@gmail.com>
 <324545a0-4d3b-1435-f9d5-4f72ea0cc6a7@gmail.com>
 <CAKXUXMyegja847_6Hz2xA5fkiWgy2-kqU8g6vN4-g5wXRUcJzg@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <6cd694f5-1f24-55ec-2c8e-5a903e3a9cec@gmail.com>
Date: Thu, 11 Feb 2021 16:46:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMyegja847_6Hz2xA5fkiWgy2-kqU8g6vN4-g5wXRUcJzg@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Investigating ./scripts/kernel-doc for
	third phase of mentorship
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

On 11/2/21 4:13 pm, Lukas Bulwahn wrote:
> On Thu, Feb 11, 2021 at 9:02 AM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 9/2/21 10:31 pm, Aditya wrote:
>>> On 9/2/21 9:43 am, Lukas Bulwahn wrote:
>>>> Hi Aditya,
>>>>
>>>>
>>>> I have been using ./scripts/kernel-doc lately and noticed a few issues
>>>> with this script.
>>>> For the third phase, I expect you to investigate the issues on
>>>> ./scripts/kernel-doc below, describe the issue to the kernel-doc
>>>> maintainer, and work on proper support for this parser in kernel-doc.
>>>>
>>>> When running kernel-doc on these files below, you should observe these errors:
>>>>
>>>> ./scripts/kernel-doc -none kernel/gcov/gcc_4_7.c
>>>>
>>>> Use of uninitialized value $param in regexp compilation at
>>>> ./scripts/kernel-doc line 1559, <IN_FILE> line 95.
>>>> Use of uninitialized value $actual in substitution (s///) at
>>>> ./scripts/kernel-doc line 1523, <IN_FILE> line 95.
>>>> Use of uninitialized value $actual in substitution (s///) at
>>>> ./scripts/kernel-doc line 1523, <IN_FILE> line 95.
>>>> Use of uninitialized value $param in substitution (s///) at
>>>> ./scripts/kernel-doc line 1617, <IN_FILE> line 95.
>>>> Use of uninitialized value $param in hash element at
>>>> ./scripts/kernel-doc line 1651, <IN_FILE> line 95.
>>>> Use of uninitialized value $param in pattern match (m//) at
>>>> ./scripts/kernel-doc line 1651, <IN_FILE> line 95.
>>>> Use of uninitialized value $param in hash element at
>>>> ./scripts/kernel-doc line 1652, <IN_FILE> line 95.
>>>> Use of uninitialized value $param in pattern match (m//) at
>>>> ./scripts/kernel-doc line 1654, <IN_FILE> line 95.
>>>> Use of uninitialized value $param in concatenation (.) or string at
>>>> ./scripts/kernel-doc line 1655, <IN_FILE> line 95.
>>>> Use of uninitialized value $param in hash element at
>>>> ./scripts/kernel-doc line 1672, <IN_FILE> line 95.
>>>>
>>>>
>>>> ./scripts/kernel-doc -none include/linux/zstd.h
>>>>
>>>> include/linux/zstd.h:153: error: Cannot parse struct or union!
>>>> include/linux/zstd.h:170: error: Cannot parse struct or union!
>>>> include/linux/zstd.h:180: error: Cannot parse struct or union!
>>>> include/linux/zstd.h:230: error: Cannot parse struct or union!
>>>> include/linux/zstd.h:273: error: Cannot parse struct or union!
>>>> include/linux/zstd.h:365: error: Cannot parse struct or union!
>>>>
>>>> include/linux/zstd.h:421: error: Cannot parse struct or union!
>>>>
>>>> include/linux/zstd.h:537: error: Cannot parse struct or union!
>>>> include/linux/zstd.h:682: error: Cannot parse struct or union!
>>>>
>>>> include/linux/zstd.h:935: error: Cannot parse struct or union!
>>>>
>>>> Can you reproduce these issues?
>>>>>>
>>>> Further, I would see that you can create two new features for kernel-doc:
>>>>
>>>> - Support for warning types and configuration of build warning flags,
>>>> i.e., with -W command-line arguments and output as known for compilers
>>>> - Support of default arguments
>>>>
>>>> Let us start with investigation of those issues in the files, though.
>>>> Then, we see how complicated it is to resolve those and discuss that
>>>> with the maintainer.
>>>>
>>>>
>>>
>>> Alright Lukas. Sounds interesting. I'll get back to you with my findings.
>>>
>>
>> Hi Lukas
>>
>> I was able to reproduce the issues. In my investigation I found the
>> following to be the cause of this:
>>
>> - For scripts/kernel-doc -none kernel/gcov/gcc_4_7.c :-
>> Cause:
>> struct gcov_info is a structure in this file, which has a parameter:
>> void (*merge[GCOV_COUNTERS])(gcov_type *, unsigned int)
>>
>> This argument goes to the elsif condition for argument parsing "elsif
>> ($arg =~ m/\(.+\)\s*\(/)"
>> But the regex match at Line 1556 ($arg =~
>> m/[^\(]+\(\*?\s*([\w\.]*)\s*\)/;) is not able to capture the $param.
>>
>> In my investigation, I found that it was expected to capture
>> "*merge[GCOV_COUNTERS]" as $param. But the regex does not take into
>> account the presence of square brackets("["."]"). As a result, the
>> $param capture does not happen as expected.
>> As $param remains undefined in this case, it causes the above error to
>> occur.
>>
>> - For scripts/kernel-doc -none include/linux/zstd.h :-
>> Cause: Certain struct definitions present in the file do not follow
>> the expected format for parsing.
>> For eg. for "struct ZSTD_compressionParameters", it is defined with
>> the help of typedef syntax, ie
>> typedef struct {
>>         unsigned int windowLog;
>>         unsigned int chainLog;
>>         unsigned int hashLog;
>>         unsigned int searchLog;
>>         unsigned int searchLength;
>>         unsigned int targetLength;
>>         ZSTD_strategy strategy;
>> } ZSTD_compressionParameters;
>>
>> Here, the definition might be compiler error free, but for kernel-doc
>> parsing, the definition was probably supposed to go like:
>>
>> typedef struct ZSTD_compressionParameters {
>>         unsigned int windowLog;
>>         unsigned int chainLog;
>>         unsigned int hashLog;
>>         unsigned int searchLog;
>>         unsigned int searchLength;
>>         unsigned int targetLength;
>>         ZSTD_strategy strategy;
>> } ZSTD_compressionParameters;
>>
>> OR
>>
>> struct ZSTD_compressionParameters {
>>         unsigned int windowLog;
>>         unsigned int chainLog;
>>         unsigned int hashLog;
>>         unsigned int searchLog;
>>         unsigned int searchLength;
>>         unsigned int targetLength;
>>         ZSTD_strategy strategy;
>> };
>>
>> The parser probably expects struct struct_name to occur together,
>> causing the above error.
>>
> 
> Good initial analysis. Do you want to extend those patterns, such that
> these definitions are properly parsed as well?
> 
> Then, we should check if we observe any other difference (caused any
> regression) running kernel-doc on the complete tree.
> 

Sounds good. I'll be back with the report.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
