Return-Path: <SRS0=FEGG=EN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050DCC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 20:23:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7242A20885
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 20:23:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nnr9vcvS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7242A20885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DAA4B86830;
	Sat,  7 Nov 2020 20:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dp4tZH-irnA8; Sat,  7 Nov 2020 20:23:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9161B85FC4;
	Sat,  7 Nov 2020 20:23:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84CD5C088B;
	Sat,  7 Nov 2020 20:23:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2869C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 20:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 977DC8720A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 20:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MvHLZJwAdhFo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 20:23:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D07D987203
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 20:23:34 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id f21so2590920plr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Nov 2020 12:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yios1Yb3oXmlm/6WdjpQIHnM1AcYwf76IbjsSNJS1CQ=;
 b=Nnr9vcvSJVIuQKvncVXvHmPAbaJkZqXnL+frXsdmklrJIF40SW6W9JN+eQdwUK9GN6
 s09wm3M4sDNNxetRDaciS70QLMCQfY0OywWCBJy31Ov+CgQ/26mCU+HMOQHZIorP9w8j
 Vy7FKx+cIOK5zWbUsgdrM60TZqzkRuSlcYXE/BaLsLIDqiNjDtJKB6G3gxn+lT1sDnFe
 wMXL/jIXDrHlTWpQ9zF/PoFdk6MbBQAHUH4IWYMWvTfUN5uAKN/5N1Rh4+kE2VNQRxRM
 xtXxzMcLmjwl6IITh3bPFDGUCa+XYAOiKS71F053ji047CQ6K6g9mIWVtr9oN15oulGJ
 hqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yios1Yb3oXmlm/6WdjpQIHnM1AcYwf76IbjsSNJS1CQ=;
 b=I1U6Tb0c6qoY2E56LRD6NTMFxwA4Iu6ObV/hA0ebF9dvdfA3Z2J0s5iVXRBP+UAVzk
 op2Z53XBzIg1v9kDi0wQGZX098/DQ6gKqFKCZ6dFt83QDNQEOuqHOQ7UTPrrFIgAePOf
 R5CIirSnnQ5R6CZYyBvmzm1jz/ES5R2re0PRNVB6HzWOVJ2M0c/2rTK6/N7zkrA4gbnm
 ZkPVq7DS/Q8iQWiHuMCYq1T9CNQQ+Z0A3iU7K1qpvNdaefVlw7wXGrBeV6XRCMTW4Bmg
 dWDdT94E6vwPHO8WfQh7Yj7BgxxpQ4YlaUSQowJlRN/+/mTcNrrNPSzjopnmN3zEieC+
 L0qg==
X-Gm-Message-State: AOAM532CEOL10hcJpf0AquZVCSCKlvnqn7qjkWal0B+lralwaeOHKlkj
 b8lsfWNyvJtjfUcUojELY14fx+MroZkMxg==
X-Google-Smtp-Source: ABdhPJysQ9IeuINEew248J+k4LEeN+URIerOMOLE9ulbG5H360AWqwPJnYZFJaNAxsh0R5wZoBeaiw==
X-Received: by 2002:a17:90a:f206:: with SMTP id
 bs6mr5220432pjb.219.1604780614012; 
 Sat, 07 Nov 2020 12:23:34 -0800 (PST)
Received: from ?IPv6:2402:3a80:42d:7bb5:3470:9721:ad9d:115e?
 ([2402:3a80:42d:7bb5:3470:9721:ad9d:115e])
 by smtp.gmail.com with ESMTPSA id m6sm6423791pfa.61.2020.11.07.12.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 12:23:33 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201107121742.27144-1-yashsri421@gmail.com>
 <2837bf55-4bab-ffcc-843c-318c7de26ff4@gmail.com>
 <CAKXUXMxix-9oWtpbS1kAK+PY7hsNuKs7_z3GDvDyJHRadSZYNw@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <96a7795a-1a95-b1d7-3faa-113fb8c7d048@gmail.com>
Date: Sun, 8 Nov 2020 01:53:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMxix-9oWtpbS1kAK+PY7hsNuKs7_z3GDvDyJHRadSZYNw@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for COMMIT_LOG_LONG_LINE
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

On 8/11/20 12:13 am, Lukas Bulwahn wrote:
> On Sa., 7. Nov. 2020 at 15:49, Aditya <yashsri421@gmail.com> wrote:
> 
>> On 7/11/20 5:47 pm, Aditya Srivastava wrote:
>>> Currently, when a line exceeds 75 characters in a commit message,
>>> checkpatch.pl gives a warning corresponding to the same.
>>>
>>> E.g., running checkpatch on commit a1af2afbd244 ("drm/nouveau/volt:Fix
>>> for some cards having 0 maximum voltage") we get this warning:
>>>
>>> WARNING: Possible unwrapped commit description (prefer a maximum 75
>>> chars per line)
>>>
>>> Some, mostly Fermi, vbioses appear to have zero max voltage. That causes
>> Nouveau to not parse voltage entries, thus users not being able to set
>> higher clocks.
>>>
>>> Provide a fix by consuming first 70 chars of the corresponding line,
>>> then stop at the next whitespace, and substitute it with the consumed
>>> chars and a newline char.
>>>
>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>>> ---
>>>  scripts/checkpatch.pl | 7 +++++--
>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> index 5a1096a4e220..ee665208ef02 100755
>>> --- a/scripts/checkpatch.pl
>>> +++ b/scripts/checkpatch.pl
>>> @@ -2881,8 +2881,11 @@ sub process {
>>>                     $line =~ /^\s*(?:Fixes:|Link:)/i ||
>>>                                       # A Fixes: or Link: line
>>>                     $commit_log_possible_stack_dump)) {
>>> -                     WARN("COMMIT_LOG_LONG_LINE",
>>> -                          "Possible unwrapped commit description
>> (prefer a maximum 75 chars per line)\n" . $herecurr);
>>> +                     if (WARN("COMMIT_LOG_LONG_LINE",
>>> +                              "Possible unwrapped commit description
>> (prefer a maximum 75 chars per line)\n" . $herecurr) &&
>>> +                         $fix) {
>>> +                             $fixed[$fixlinenr] =~
>> s/(.{70}[^\s]*)\s+/$1\n/g;
>>> +                     }
>>>                       $commit_log_long_line = 1;
>>>               }
>>>
>>>
>>
> 
> Why do you not implement a proper word wrap function?
> 

Actually, I had searched on the web regarding it before implementation.
Here I have implemented text wrap only and regex is the best way I
could find of implementing it. Also the same was advised at
stackoverflow. I took help from the same.
Link:
https://stackoverflow.com/questions/956379/how-can-i-word-wrap-a-string-in-perl
Apart from it, perl also provides a wrap function using module
Text::Wrap, but I wasn't sure if I could use this module in my
changes. So, I proceeded with regex.

> A single commit tells us very little if this rule in checkpatch.pl really
> is a good rule or not. A proper evaluation of typical cases of long commit
> lines would help much more to improve this rule.
> 

I generated a list of commit_long_long_line warnings with the line for
which they are occurring at:(v4.13..v5.8)
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task6/summary.txt

As I could see, most of these messages are plain english. But there
are few instances of links, hex, file locations, such as:

1)https://lore.kernel.org/lkml/1559767582-11081-1-git-send-email-info@metux.net/

2)  /home6/tmricht/linux-next/tools/build/Makefile.build:96: recipe
for target 'libbpf.o' failed

3)	8b 35 7b fb e2 00	mov    0xe2fb7b(%rip),%esi # ffffffff82db9e64
<nr_cpu_ids>

I think we can use a better regex like:
s/(.{1,75}|\S{76,})(?:\s[^\S\r\n]*|\Z)/$1\n/g

I tested this regex with the above cases, in which
1) remains unaffected
2) gets wrapped at "..recipe for" (which is 69 chars in length)
3) gets wrapped at "# ffffffff82db9e64", which is 64 in length

I guess I can generate another file with how these lines will be
changed, when used with fix option.
What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
