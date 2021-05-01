Return-Path: <SRS0=C2G1=J4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C79E8C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 May 2021 09:30:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C26E6141E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 May 2021 09:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C26E6141E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FDB141C59;
	Sat,  1 May 2021 09:30:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wiAHOtH0vPjn; Sat,  1 May 2021 09:30:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE70841C5B;
	Sat,  1 May 2021 09:30:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA8BDC000E;
	Sat,  1 May 2021 09:30:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C4BFC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 09:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C80D841C5A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 09:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAmpY2vWdoNi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 09:30:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F363A41C59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 May 2021 09:30:30 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso7805835pje.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 May 2021 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ozGWR7HUiB8PmJLBAJ188PKLUOh7dBweE/9zGbN2Zp0=;
 b=D/0vPlgJu5jfqBOMQb50lihexlAJcQUP3pR3XMPv4HFKDZYb0SJapZVJ/gkmpAY8TG
 PyqPT9PUsuY5+PRiuEIMkfFVa21wyRDP2Pzb+NcG0GI7fQ7JOom2ex00qPbddZLHsoXL
 ckoFnKo9WAj563lpWcxYGf3SXQcLZUuOvRHmH8t5DnnODQ6ZIdpQ+2qJcm2KPuEjPR0n
 AI2ghO+t6CLTwfnhl7EDL5y5FyzjED2pRzPgEgSjBxJ8wgk2QpG07MnVQ6KI20afJ4VK
 o5Iq7bSCzkKekZFiGm8fYsq8aro5AtmnUKVvR2SDcx1kIOc6eqkw4CvoEyy3jBP9d/Sv
 vRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ozGWR7HUiB8PmJLBAJ188PKLUOh7dBweE/9zGbN2Zp0=;
 b=X+5xhZ1ol7DV6AEeUn2iVZgUl0frfbVzq1L0yCVQyqDHZr7kBLEGfuE/QHf6vpG69/
 LqbhY8XO1l86duR45wOX9iP2nM0ORGnS+LiAF9iDgBrcW2kxAKKYvrNZ/DIei7amZHSy
 MgIb29nwm/Y7YuWCjuRLiEdHOTAW58IScMN/KW/y/ZMUY8k9yyR3v3sYPyG/IcEQrxjw
 WYvHZTDnFK/K/NfUQ9FCdCqK1xGUCzvVLLbxHD3XOGIcl2tCZQuLuqHmB9GzghWLZ3WK
 IyD221Qe4jyCJez8SP4HoldRweoCW8oKX4m7phktIjItmWzYXkIHmqynBkSWap5G/jeA
 xonA==
X-Gm-Message-State: AOAM530b+AGL3HcWLB/h6807SmiC4jpBUAHtNHA+ER+kiYCafQbkgxCi
 n2cmDlA8agV4LuaHXSV9syU=
X-Google-Smtp-Source: ABdhPJwpm/0pMCfrGPM5UL4PfA3nBMBiph5MjUiyi4zHNxdxrqGxDn+fiDlj+fil1VWEFSLBopugoA==
X-Received: by 2002:a17:90a:b292:: with SMTP id
 c18mr20434639pjr.179.1619861430361; 
 Sat, 01 May 2021 02:30:30 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a089:4bc:4b06:bb39:6fa2?
 ([2405:201:600d:a089:4bc:4b06:bb39:6fa2])
 by smtp.gmail.com with ESMTPSA id ms2sm453915pjb.8.2021.05.01.02.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 May 2021 02:30:30 -0700 (PDT)
Subject: Re: [RFC v3] scripts: kernel-doc: reduce repeated regex expressions
 into variables
To: Jonathan Corbet <corbet@lwn.net>
References: <20210427165633.GA235567@casper.infradead.org>
 <20210429063729.8144-1-yashsri421@gmail.com> <8735v8d5ja.fsf@meer.lwn.net>
From: Aditya Srivastava <yashsri421@gmail.com>
Message-ID: <99186604-8ed6-ff72-0308-9ca788db3a51@gmail.com>
Date: Sat, 1 May 2021 15:00:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8735v8d5ja.fsf@meer.lwn.net>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, willy@infradead.org, linux-doc@vger.kernel.org
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

On 30/4/21 5:09 am, Jonathan Corbet wrote:
> Aditya Srivastava <yashsri421@gmail.com> writes:
> 
>> There are some regex expressions in the kernel-doc script, which are used
>> repeatedly in the script.
>>
>> Reduce such expressions into variables, which can be used everywhere.
>>
>> A quick manual check found that no errors and warnings were added/removed
>> in this process.
>>
>> Suggested-by: Jonathan Corbet <corbet@lwn.net>
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>> Changes in v3:
>> - Remove variables for separate qualifiers in "sub dump_struct"
>> - Make a common variable for all the qualifiers
>> - Make $attribute global variable to use it at "sub check_sections" as well
>>
>> Changes in v2:
>> - Rename $pointer_function to $function_pointer
>> - Combine elsif-block expressions at "sub dump_function" into lesser regex expressions
>> - Combine $prototype_end1,$prototype_end2 expressions into a common $prototype_end
>>
>>  scripts/kernel-doc | 71 ++++++++++++++++++++++------------------------
>>  1 file changed, 34 insertions(+), 37 deletions(-)
> 
> So this looks good but ... it adds a warning to the build:
> 
> /stuff/k/git/kernel/Documentation/driver-api/media/v4l2-controls:823: ./include/media/v4l2-ctrls.h:964: WARNING: Invalid C declaration: Expected identifier in nested name. [error at 6]
>   const * v4l2_ctrl_get_menu (u32 id)
>   ------^
> 
> So it looks like something isn't being parsed quite identically?
>

Hi Jonathan!
I could not reproduce this error..
Can you suggest me how can I reproduce this error?
I ran kernel-doc -none {$file} over the tree.

Probably, this is not a kernel-doc error

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
