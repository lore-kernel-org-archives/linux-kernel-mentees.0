Return-Path: <SRS0=ha8c=IN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE30C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Mar 2021 17:28:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7749664E98
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Mar 2021 17:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7749664E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FCFF834F5;
	Mon, 15 Mar 2021 17:28:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ggIuhpw2v67t; Mon, 15 Mar 2021 17:28:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D980834BA;
	Mon, 15 Mar 2021 17:28:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B7E8C000A;
	Mon, 15 Mar 2021 17:28:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBBCBC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 17:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2C6740196
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 17:28:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKjq53ut8rj1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 17:28:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5185A40170
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 17:28:40 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id b23so7021546pfo.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 10:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5gnEZY9mFGBFMfKq49DrvBCMPyNX5q5pukAl05EuTws=;
 b=O7d04w+g65wkjQSjN9kSHAW+hdiPAjBi25iwq/uLbh6IS3zxrFqvpnAi/VTkz+CizL
 rfXV7/1plKzg4JvtsRMv8DGn32fjDN1MFrf/pgOFWvht0nh2KxM0BnxS7ZecU87zvVsK
 5/Gl67eKcYe4Eo9s6/AgYVkrP1SHoBJHETrmAW92wsWf8eX+eH6W3rcSN3wMJAGInsFW
 EQlK0GwegHsZvWA8rzmwsEwYo8N6NIC162Ecdby0XzavyBh0gGSB7KX2I34F23qYDcVY
 wrwhZjNYxnWdsFznV5bZTGO3H5853/Z9czTvnQm3CDnlWgreKBHFMFr6325do7ABhNG3
 dhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5gnEZY9mFGBFMfKq49DrvBCMPyNX5q5pukAl05EuTws=;
 b=tfcKdTiK0QWcNpjX2ZhNeAgUEvYUddfxehlMsOgzVZNcfCjt/zXJHXeE07+zKfigBV
 g2FEf51n5ZbfcP9j3sk25b15xowhDXPuBW7dZekNVovc/hZN6R8j+LOMpkCCecx8ZxEC
 UM+hWyoN33JMM+qllV68B7YV4kKfsHTY8MH93nITST+SH5yPRAMk16+w1wDajzGwIi4T
 UPrD7k7LBaQaBE9ygFGN4+sQddldcSeGmjOYr9GKzFF+xNGYcE/6slikQWeRvz28Gg7s
 GtdpGV9uYvF14XyxbUCiaNcOQhqcrE6kKf1pe2Ml5E10wcig1f25KP1b8o0suj2tdsif
 LsFQ==
X-Gm-Message-State: AOAM531b5gd/SL3KWornTZJvs+d9KkcAw3l1sR9GpWNw3FF2uH5FOGeL
 9/X92kt2oYqOZ3DVqM/VhKk=
X-Google-Smtp-Source: ABdhPJxCyPkvAC/1zsx3cLBzAVQAvVUt6KZS6L9LBmrU/jVzsbM4wwPNP8IatVlzERw24Tf6Vbq2Tg==
X-Received: by 2002:a63:f70f:: with SMTP id x15mr170946pgh.109.1615829319543; 
 Mon, 15 Mar 2021 10:28:39 -0700 (PDT)
Received: from ?IPv6:2405:201:600d:a089:d096:1684:81a3:45b7?
 ([2405:201:600d:a089:d096:1684:81a3:45b7])
 by smtp.gmail.com with ESMTPSA id c24sm229672pjv.18.2021.03.15.10.28.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 10:28:39 -0700 (PDT)
Subject: Re: [PATCH 00/10] rsi: fix comment syntax in file headers
To: Kalle Valo <kvalo@codeaurora.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20210314201818.27380-1-yashsri421@gmail.com>
 <CAKXUXMzH-cUVeuCT6eM_0iHzgKpzvZUPO6pKNpD0yUp2td09Ug@mail.gmail.com>
 <87a6r4u7ut.fsf@codeaurora.org>
From: Aditya <yashsri421@gmail.com>
Message-ID: <643c93f6-1c01-a18d-6ef6-d4d0fb5304fa@gmail.com>
Date: Mon, 15 Mar 2021 22:58:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87a6r4u7ut.fsf@codeaurora.org>
Content-Language: en-US
Cc: Netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, amitkarwar@gmail.com,
 siva8118@gmail.com, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>
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

On 15/3/21 2:11 pm, Kalle Valo wrote:
> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
> 
>> On Sun, Mar 14, 2021 at 9:18 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>>
>>> The opening comment mark '/**' is used for highlighting the beginning of
>>> kernel-doc comments.
>>> There are files in drivers/net/wireless/rsi which follow this syntax in
>>> their file headers, i.e. start with '/**' like comments, which causes
>>> unexpected warnings from kernel-doc.
>>>
>>> E.g., running scripts/kernel-doc -none on drivers/net/wireless/rsi/rsi_coex.h
>>> causes this warning:
>>> "warning: wrong kernel-doc identifier on line:
>>>  * Copyright (c) 2018 Redpine Signals Inc."
>>>
>>> Similarly for other files too.
>>>
>>> Provide a simple fix by replacing the kernel-doc like comment syntax with
>>> general format, i.e. "/*", to prevent kernel-doc from parsing it.
>>>
>>
>> Aditya, thanks for starting to clean up the repository following your
>> investigation on kernel-doc warnings.
>>
>> The changes to all those files look sound.
>>
>> However I think these ten patches are really just _one change_, and
>> hence, all can be put into a single commit.
> 
> I agree, this is one logical change to a single driver so one patch will
> suffice. I think for cleanup changes like this one patch per driver is a
> good approach.
> 

Thanks for the feedback Lukas and Kalle. I will be sending the
modified v2.

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
