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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41C9C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Feb 2021 08:02:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 322D664D9E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Feb 2021 08:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 322D664D9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F29B18740F;
	Thu, 11 Feb 2021 08:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFfOoB9angT6; Thu, 11 Feb 2021 08:02:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 613C08740B;
	Thu, 11 Feb 2021 08:02:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F747C0174;
	Thu, 11 Feb 2021 08:02:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1559C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 08:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AD9B18740F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 08:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x33CQRSjZtv6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 08:02:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D4ECA8740B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 08:02:26 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id q72so2952570pjq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 00:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tigjCwfbsZo3Z9QpaiRwGefgaKTfMuVbQpTVycnFPJs=;
 b=gxMIQoCtPqHih/Z+e0Wy7hPZIpsxbpt0NRjvtv+hr+HjJcd3pjqaVCLE4YXCQY5eim
 0T3eZdpHbwklxgk37uqWt8YVQ00zBzcPNo25eqf1h3f754fIqRm4Dhoe30B0nmE140Uh
 aA7jT8lq9l/Rb/mNa0CsTwj34ZJeK1IeDPsE+PfrIIeZuYXhkeI9kTlRdgUL4WITJwt7
 mW7/yeTg5fGysk+ypvALLxz4DERKddIkbfVFE9m9FLJn0JZ+V8Qy+Zsa+tbE1k24nlkI
 ZM+TEhJOtcbmnqMdirofMjQ9CPAU2nxUqQFpdH10I05YWoN3m/4vwWVSKKA5pWc/qiVG
 DNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tigjCwfbsZo3Z9QpaiRwGefgaKTfMuVbQpTVycnFPJs=;
 b=tFJ9PwBaHmHCWxalR2TH3AA1qSvV8HqxCFuBzxjhEeI2lqNdpphG5n6wdcHc9DKjdY
 NjSkE7+6jXSdDPwhmhV5NX4DIXdLmqEiZ1oUSGBa6aSuMrKVliy/XS/A0abSLSWUAKHA
 UK0ZsX9CWcjGocI4DVfVguUAm8/ZiFGLl+wIeNlP0sV2Y+ut39VVVil5bUzW0Bb0dzM3
 nW3Toh6vSQrQX/2H9+6YFFWCmP9ENAI1ymLtcCSUvUNNh09tn+m05bSb9dWWNP2lBUTb
 sOp+4X279Zs+Bv8Jb9E9DXtme1KCS9BKy8+2Kiw9O1FJQUfPT6xIYth9/R5zdYYMK4Xj
 zbTw==
X-Gm-Message-State: AOAM5334+h1tIlBrxHO+tWZ4hHOlmfZ/2PmUEk/buXvY5Y6+OMSeebfD
 GWaW2mEjokBGHO0ynAKOR8gsD2aLtVQ6Aw==
X-Google-Smtp-Source: ABdhPJz2V2/WKEKP24Mo5Q+DftrD/NBGtIngxTZUGVLSpUNPCFaB74FhslGNGd3iYYQT/moyAhfraA==
X-Received: by 2002:a17:902:6b87:b029:dc:3402:18af with SMTP id
 p7-20020a1709026b87b02900dc340218afmr6764980plk.29.1613030546083; 
 Thu, 11 Feb 2021 00:02:26 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:c4bc:aff1:b3c4:2122?
 ([2405:201:600d:a089:c4bc:aff1:b3c4:2122])
 by smtp.gmail.com with ESMTPSA id x9sm4387201pfc.114.2021.02.11.00.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 00:02:25 -0800 (PST)
From: Aditya <yashsri421@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <CAKXUXMzje=kiC5NwdWuFT4sO8d8WXXx3TQkT6HdybrgMU7NBFw@mail.gmail.com>
 <78c992f7-41c7-dca7-877d-839cb2b1dba0@gmail.com>
Message-ID: <324545a0-4d3b-1435-f9d5-4f72ea0cc6a7@gmail.com>
Date: Thu, 11 Feb 2021 13:32:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <78c992f7-41c7-dca7-877d-839cb2b1dba0@gmail.com>
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

On 9/2/21 10:31 pm, Aditya wrote:
> On 9/2/21 9:43 am, Lukas Bulwahn wrote:
>> Hi Aditya,
>>
>>
>> I have been using ./scripts/kernel-doc lately and noticed a few issues
>> with this script.
>> For the third phase, I expect you to investigate the issues on
>> ./scripts/kernel-doc below, describe the issue to the kernel-doc
>> maintainer, and work on proper support for this parser in kernel-doc.
>>
>> When running kernel-doc on these files below, you should observe these errors:
>>
>> ./scripts/kernel-doc -none kernel/gcov/gcc_4_7.c
>>
>> Use of uninitialized value $param in regexp compilation at
>> ./scripts/kernel-doc line 1559, <IN_FILE> line 95.
>> Use of uninitialized value $actual in substitution (s///) at
>> ./scripts/kernel-doc line 1523, <IN_FILE> line 95.
>> Use of uninitialized value $actual in substitution (s///) at
>> ./scripts/kernel-doc line 1523, <IN_FILE> line 95.
>> Use of uninitialized value $param in substitution (s///) at
>> ./scripts/kernel-doc line 1617, <IN_FILE> line 95.
>> Use of uninitialized value $param in hash element at
>> ./scripts/kernel-doc line 1651, <IN_FILE> line 95.
>> Use of uninitialized value $param in pattern match (m//) at
>> ./scripts/kernel-doc line 1651, <IN_FILE> line 95.
>> Use of uninitialized value $param in hash element at
>> ./scripts/kernel-doc line 1652, <IN_FILE> line 95.
>> Use of uninitialized value $param in pattern match (m//) at
>> ./scripts/kernel-doc line 1654, <IN_FILE> line 95.
>> Use of uninitialized value $param in concatenation (.) or string at
>> ./scripts/kernel-doc line 1655, <IN_FILE> line 95.
>> Use of uninitialized value $param in hash element at
>> ./scripts/kernel-doc line 1672, <IN_FILE> line 95.
>>
>>
>> ./scripts/kernel-doc -none include/linux/zstd.h
>>
>> include/linux/zstd.h:153: error: Cannot parse struct or union!
>> include/linux/zstd.h:170: error: Cannot parse struct or union!
>> include/linux/zstd.h:180: error: Cannot parse struct or union!
>> include/linux/zstd.h:230: error: Cannot parse struct or union!
>> include/linux/zstd.h:273: error: Cannot parse struct or union!
>> include/linux/zstd.h:365: error: Cannot parse struct or union!
>>
>> include/linux/zstd.h:421: error: Cannot parse struct or union!
>>
>> include/linux/zstd.h:537: error: Cannot parse struct or union!
>> include/linux/zstd.h:682: error: Cannot parse struct or union!
>>
>> include/linux/zstd.h:935: error: Cannot parse struct or union!
>>
>> Can you reproduce these issues?
>>>>
>> Further, I would see that you can create two new features for kernel-doc:
>>
>> - Support for warning types and configuration of build warning flags,
>> i.e., with -W command-line arguments and output as known for compilers
>> - Support of default arguments
>>
>> Let us start with investigation of those issues in the files, though.
>> Then, we see how complicated it is to resolve those and discuss that
>> with the maintainer.
>>
>>
> 
> Alright Lukas. Sounds interesting. I'll get back to you with my findings.
> 

Hi Lukas

I was able to reproduce the issues. In my investigation I found the
following to be the cause of this:

- For scripts/kernel-doc -none kernel/gcov/gcc_4_7.c :-
Cause:
struct gcov_info is a structure in this file, which has a parameter:
void (*merge[GCOV_COUNTERS])(gcov_type *, unsigned int)

This argument goes to the elsif condition for argument parsing "elsif
($arg =~ m/\(.+\)\s*\(/)"
But the regex match at Line 1556 ($arg =~
m/[^\(]+\(\*?\s*([\w\.]*)\s*\)/;) is not able to capture the $param.

In my investigation, I found that it was expected to capture
"*merge[GCOV_COUNTERS]" as $param. But the regex does not take into
account the presence of square brackets("["."]"). As a result, the
$param capture does not happen as expected.
As $param remains undefined in this case, it causes the above error to
occur.

- For scripts/kernel-doc -none include/linux/zstd.h :-
Cause: Certain struct definitions present in the file do not follow
the expected format for parsing.
For eg. for "struct ZSTD_compressionParameters", it is defined with
the help of typedef syntax, ie
typedef struct {
	unsigned int windowLog;
	unsigned int chainLog;
	unsigned int hashLog;
	unsigned int searchLog;
	unsigned int searchLength;
	unsigned int targetLength;
	ZSTD_strategy strategy;
} ZSTD_compressionParameters;

Here, the definition might be compiler error free, but for kernel-doc
parsing, the definition was probably supposed to go like:

typedef struct ZSTD_compressionParameters {
	unsigned int windowLog;
	unsigned int chainLog;
	unsigned int hashLog;
	unsigned int searchLog;
	unsigned int searchLength;
	unsigned int targetLength;
	ZSTD_strategy strategy;
} ZSTD_compressionParameters;

OR

struct ZSTD_compressionParameters {
	unsigned int windowLog;
	unsigned int chainLog;
	unsigned int hashLog;
	unsigned int searchLog;
	unsigned int searchLength;
	unsigned int targetLength;
	ZSTD_strategy strategy;
};

The parser probably expects struct struct_name to occur together,
causing the above error.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
