Return-Path: <SRS0=TF4G=HP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_RED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156B7C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 Feb 2021 09:46:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8364964DC3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 Feb 2021 09:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8364964DC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5343787011;
	Sat, 13 Feb 2021 09:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZgxIzO0J-UD; Sat, 13 Feb 2021 09:46:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 69B0986FE9;
	Sat, 13 Feb 2021 09:46:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51559C0891;
	Sat, 13 Feb 2021 09:46:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86E26C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 09:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CD736F6EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 09:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWFmsh4UskL4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 09:46:20 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id B3B956F704; Sat, 13 Feb 2021 09:46:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A5AA6F6EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 09:46:18 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id t25so1271054pga.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AoSv/JzsjwhJFceYF8qHhHBdPC2d2Mc6sfoMMF4pifQ=;
 b=PmZQ1rQC+97ptiO7Utnclk41KGNHTNNbDHhTza5M8I3P8CQY83gvLqmkV96iEYyo9Q
 z+/Qk/PpNahr7RomdOHmw/F1MSSC7xpxDmy8v/aK8MtPcKRwlpftEumCaWJQzD+XM8KH
 dw+W8XedieSEUzR6zyvvCpUPK+8OqP/mbSI69555x+mdPKM19B2D9JO1hAw61478A8mn
 1xmO8OCAt5eBEYQSyUQKbCFlZiDnBHzaEoDmOEhAp13NFVOaOgQ06J3MAzWlex0iqA6W
 d6YhRM5mPTOf1l4QvydZlMJtyhTe4egzuxPyV7/r8i5px7KFzqiaiYos2elSSMHAmYhJ
 NqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AoSv/JzsjwhJFceYF8qHhHBdPC2d2Mc6sfoMMF4pifQ=;
 b=ZTbvfVGttytGwILEagKiL7yxlOnooTPCqsDSUJ4g5erDkCZEW8jz/1q6RD1O3WD1Ze
 yRrGue4zemPR/Qjufnh1Ib4SzWV5xy7tGTgaIoTEnNCxGAP5bvLb0NFcHUXWzRZqK4+o
 94hwKI7KFdP6KcPlALthvLPzSQz5Oi1AStfhXJ7mS7zeBkydTceke15xOyYwiqNQckT+
 XW0ORI3xXWf7suSmQIpcGK48tNd2Zwa6kCi7y6eJKfMrPyyUain4q4CF4r77sHX+5LDx
 iJYE4kGbChN6L/8pPkqNcn+pppdd3baOsLzFMEidqzs4qecl0m7izcPFAjorJBPOdRFW
 Qlpw==
X-Gm-Message-State: AOAM530Nm2sJIJkPumDbOxcGfHTWeMges6yd3seYGpopaU7CtcFwYQMQ
 kKP2MpebrOCXdg5DD34Nzi8ut6yuDVNRZg==
X-Google-Smtp-Source: ABdhPJzs4+VcRu3u4u/CFfk4qTXmgTLJmJlw7U6LdsLR0MpZTe1UfZRnGUcuKyMM46Tt0iLAqVgwuA==
X-Received: by 2002:a63:461d:: with SMTP id t29mr6857209pga.192.1613209577365; 
 Sat, 13 Feb 2021 01:46:17 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:8d11:662e:bcf:8e60?
 ([2405:201:600d:a089:8d11:662e:bcf:8e60])
 by smtp.gmail.com with ESMTPSA id 71sm11935281pgh.55.2021.02.13.01.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Feb 2021 01:46:17 -0800 (PST)
From: Aditya <yashsri421@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <CAKXUXMzje=kiC5NwdWuFT4sO8d8WXXx3TQkT6HdybrgMU7NBFw@mail.gmail.com>
 <78c992f7-41c7-dca7-877d-839cb2b1dba0@gmail.com>
 <324545a0-4d3b-1435-f9d5-4f72ea0cc6a7@gmail.com>
 <CAKXUXMyegja847_6Hz2xA5fkiWgy2-kqU8g6vN4-g5wXRUcJzg@mail.gmail.com>
 <6cd694f5-1f24-55ec-2c8e-5a903e3a9cec@gmail.com>
Message-ID: <361d4ce2-06d7-b646-5f10-7977fcaa09d9@gmail.com>
Date: Sat, 13 Feb 2021 15:16:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6cd694f5-1f24-55ec-2c8e-5a903e3a9cec@gmail.com>
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

On 11/2/21 4:46 pm, Aditya wrote:
> On 11/2/21 4:13 pm, Lukas Bulwahn wrote:
>> On Thu, Feb 11, 2021 at 9:02 AM Aditya <yashsri421@gmail.com> wrote:
>>>
>>> On 9/2/21 10:31 pm, Aditya wrote:
>>>> On 9/2/21 9:43 am, Lukas Bulwahn wrote:
>>>>> Hi Aditya,
>>>>>
>>>>>
>>>>> I have been using ./scripts/kernel-doc lately and noticed a few issues
>>>>> with this script.
>>>>> For the third phase, I expect you to investigate the issues on
>>>>> ./scripts/kernel-doc below, describe the issue to the kernel-doc
>>>>> maintainer, and work on proper support for this parser in kernel-doc.
>>>>>
>>>>> When running kernel-doc on these files below, you should observe these errors:
>>>>>
>>>>> ./scripts/kernel-doc -none kernel/gcov/gcc_4_7.c
>>>>>
>>>>> Use of uninitialized value $param in regexp compilation at
>>>>> ./scripts/kernel-doc line 1559, <IN_FILE> line 95.
>>>>> Use of uninitialized value $actual in substitution (s///) at
>>>>> ./scripts/kernel-doc line 1523, <IN_FILE> line 95.
>>>>> Use of uninitialized value $actual in substitution (s///) at
>>>>> ./scripts/kernel-doc line 1523, <IN_FILE> line 95.
>>>>> Use of uninitialized value $param in substitution (s///) at
>>>>> ./scripts/kernel-doc line 1617, <IN_FILE> line 95.
>>>>> Use of uninitialized value $param in hash element at
>>>>> ./scripts/kernel-doc line 1651, <IN_FILE> line 95.
>>>>> Use of uninitialized value $param in pattern match (m//) at
>>>>> ./scripts/kernel-doc line 1651, <IN_FILE> line 95.
>>>>> Use of uninitialized value $param in hash element at
>>>>> ./scripts/kernel-doc line 1652, <IN_FILE> line 95.
>>>>> Use of uninitialized value $param in pattern match (m//) at
>>>>> ./scripts/kernel-doc line 1654, <IN_FILE> line 95.
>>>>> Use of uninitialized value $param in concatenation (.) or string at
>>>>> ./scripts/kernel-doc line 1655, <IN_FILE> line 95.
>>>>> Use of uninitialized value $param in hash element at
>>>>> ./scripts/kernel-doc line 1672, <IN_FILE> line 95.
>>>>>
>>>>>
>>>>> ./scripts/kernel-doc -none include/linux/zstd.h
>>>>>
>>>>> include/linux/zstd.h:153: error: Cannot parse struct or union!
>>>>> include/linux/zstd.h:170: error: Cannot parse struct or union!
>>>>> include/linux/zstd.h:180: error: Cannot parse struct or union!
>>>>> include/linux/zstd.h:230: error: Cannot parse struct or union!
>>>>> include/linux/zstd.h:273: error: Cannot parse struct or union!
>>>>> include/linux/zstd.h:365: error: Cannot parse struct or union!
>>>>>
>>>>> include/linux/zstd.h:421: error: Cannot parse struct or union!
>>>>>
>>>>> include/linux/zstd.h:537: error: Cannot parse struct or union!
>>>>> include/linux/zstd.h:682: error: Cannot parse struct or union!
>>>>>
>>>>> include/linux/zstd.h:935: error: Cannot parse struct or union!
>>>>>
>>>>> Can you reproduce these issues?
>>>>>>>
>>>>> Further, I would see that you can create two new features for kernel-doc:
>>>>>
>>>>> - Support for warning types and configuration of build warning flags,
>>>>> i.e., with -W command-line arguments and output as known for compilers
>>>>> - Support of default arguments
>>>>>
>>>>> Let us start with investigation of those issues in the files, though.
>>>>> Then, we see how complicated it is to resolve those and discuss that
>>>>> with the maintainer.
>>>>>
>>>>>
>>>>
>>>> Alright Lukas. Sounds interesting. I'll get back to you with my findings.
>>>>
>>>
>>> Hi Lukas
>>>
>>> I was able to reproduce the issues. In my investigation I found the
>>> following to be the cause of this:
>>>
>>> - For scripts/kernel-doc -none kernel/gcov/gcc_4_7.c :-
>>> Cause:
>>> struct gcov_info is a structure in this file, which has a parameter:
>>> void (*merge[GCOV_COUNTERS])(gcov_type *, unsigned int)
>>>
>>> This argument goes to the elsif condition for argument parsing "elsif
>>> ($arg =~ m/\(.+\)\s*\(/)"
>>> But the regex match at Line 1556 ($arg =~
>>> m/[^\(]+\(\*?\s*([\w\.]*)\s*\)/;) is not able to capture the $param.
>>>
>>> In my investigation, I found that it was expected to capture
>>> "*merge[GCOV_COUNTERS]" as $param. But the regex does not take into
>>> account the presence of square brackets("["."]"). As a result, the
>>> $param capture does not happen as expected.
>>> As $param remains undefined in this case, it causes the above error to
>>> occur.
>>>
>>> - For scripts/kernel-doc -none include/linux/zstd.h :-
>>> Cause: Certain struct definitions present in the file do not follow
>>> the expected format for parsing.
>>> For eg. for "struct ZSTD_compressionParameters", it is defined with
>>> the help of typedef syntax, ie
>>> typedef struct {
>>>         unsigned int windowLog;
>>>         unsigned int chainLog;
>>>         unsigned int hashLog;
>>>         unsigned int searchLog;
>>>         unsigned int searchLength;
>>>         unsigned int targetLength;
>>>         ZSTD_strategy strategy;
>>> } ZSTD_compressionParameters;
>>>
>>> Here, the definition might be compiler error free, but for kernel-doc
>>> parsing, the definition was probably supposed to go like:
>>>
>>> typedef struct ZSTD_compressionParameters {
>>>         unsigned int windowLog;
>>>         unsigned int chainLog;
>>>         unsigned int hashLog;
>>>         unsigned int searchLog;
>>>         unsigned int searchLength;
>>>         unsigned int targetLength;
>>>         ZSTD_strategy strategy;
>>> } ZSTD_compressionParameters;
>>>
>>> OR
>>>
>>> struct ZSTD_compressionParameters {
>>>         unsigned int windowLog;
>>>         unsigned int chainLog;
>>>         unsigned int hashLog;
>>>         unsigned int searchLog;
>>>         unsigned int searchLength;
>>>         unsigned int targetLength;
>>>         ZSTD_strategy strategy;
>>> };
>>>
>>> The parser probably expects struct struct_name to occur together,
>>> causing the above error.
>>>
>>
>> Good initial analysis. Do you want to extend those patterns, such that
>> these definitions are properly parsed as well?
>>
>> Then, we should check if we observe any other difference (caused any
>> regression) running kernel-doc on the complete tree.
>>

Hi Lukas

I generated the report by running kernel-doc on complete tree.
The report in itself is quite large (~20k lines). So, I shortened it
in no-warning(error_report.txt) and less-common
warnings(reduced_report.txt) versions.

No-warning version(error_report.txt):
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/error_report.txt

Less common warning version:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/reduced_report.txt

Complete report:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/report.txt

For the Uninitialized $param error, apart from kernel/gcov/gcc_4_7.c
file, drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h also
emits the same error with the script. The reason is same as gcc_4_7.c
file though, ie presence of square brackets in the params and regex
not taking into account the same.

Similarly, there is a total of 67 errors for "Cannot parse *".
58 of these are for "error: Cannot parse struct or union!". Rest are
for enum.

In addition, I observed that if data variables are mentioned in a
comma separated fashion ie @var1, var2, var3 in comments(as they have
common description), they may not be considered described.

For eg. running scripts/kernel-doc -none include/linux/mhi.h, we get:
include/linux/mhi.h:451: warning: Function parameter or member 'M0'
not described in 'mhi_controller'
include/linux/mhi.h:451: warning: Function parameter or member 'M2'
not described in 'mhi_controller'
include/linux/mhi.h:451: warning: Function parameter or member 'M3'
not described in 'mhi_controller'

However, these are described in comments as:
* @M0, M2, M3: Counters to track number of device MHI state changes

and present in struct definition as:
u32 M0, M2, M3;

I think that comma separated members are allowed in definition, but
maybe they are not yet supported in comment descriptions, hence
causing the error. But as the variables are described already in
comments, maybe this is an example of false positive.

Similarly there may be more such cases for false positives for
warnings, but it was taking a lot of time to analyze all of them, so I
decided to take feedback on the findings till now.

What do you think Lukas?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
