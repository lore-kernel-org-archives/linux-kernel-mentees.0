Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD934C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 18:01:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E9022072D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 18:01:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOLj9ATX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E9022072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 19CC385701;
	Tue,  3 Nov 2020 18:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fxq4KCCTPKJ0; Tue,  3 Nov 2020 18:01:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 464F981FCB;
	Tue,  3 Nov 2020 18:01:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C114C088B;
	Tue,  3 Nov 2020 18:01:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 410A3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 18:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 306C78645E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 18:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xnIK0EUysuS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 18:01:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6513B86456
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 18:01:30 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id i7so12338791pgh.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 10:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TReIZEk5EDY+6BNUmApSQsJOwpedRSzVjyt/TLQkipw=;
 b=eOLj9ATXr6IrenDsJ6cSKh4N6+ZRx6d9hwlUYPbs1RK431i1pq9V9cLpDPqWrxl0S4
 SEV2fbrVyEAfwIYoyyZp6CHDapOd6HK/myMLcWU94UURgQVmTx7lJVdyFLq6zNbP/Oqy
 ol6WU4wU6hBnbsswfQcIqm19lSspqPXqzQ/lt2uBEKqrSa7Rk6YlSmWZB473zCnuT9Qk
 5rjKS9rFAqar/VrCOUJNBgSLtDgizRlQX1VuQmwqAw+EBpmKuif21YMEACn4CBDDdUt2
 kUaIYMoGHlw98QU9MJYEVm3Co9dJkTqbA/fjgDL7JM1zuJK2zEwaLMvLenleR4PmsyHK
 fmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TReIZEk5EDY+6BNUmApSQsJOwpedRSzVjyt/TLQkipw=;
 b=OPR4eysKBR7lZrMzo0aLJEZ86Klirzv7BdIHo2Nj6WUY/JgdxeX8eIILYEkgoP8WH+
 UKgksdW35w1s9jaNEr24Y8QNXgi0RCuumI+KbZHwPdfToQjG3kN7EvHbtbVEaQ1WUlM2
 oWo8IBwRnBilqGXWwvu6ySNet2teYtn1h1LDtwalTU7c0bu0xdNjmwUfTEzU4m5yhGJx
 FCFUEv6qP+QpXPZGvVexV2EXoRSmeYBQTheKvO2+Ijrxru0m3PgyTWKVNlfsBicjal4z
 tduz1iqgIXeujpUeddKOGK56q/ePD6i99YWEqvcxKGdAIDX1PNhG7tQNPVlKPhhia6kg
 H7JA==
X-Gm-Message-State: AOAM530FggeNNc1gsNdTjGH/ETmzn8xO7pyNsnlY6UvZV+bp8UEYiG3l
 s/bvNwEeOkbYnxsTVp2e1QPYRIMfjxuL8yzx
X-Google-Smtp-Source: ABdhPJzLPtN1hkH6q2fV2L/dOs71xSEA6mxRn087TzgnYzFuxKcr3YQtyXM2sju31L2lLfCgeD51fA==
X-Received: by 2002:a63:1365:: with SMTP id 37mr18420172pgt.247.1604426489371; 
 Tue, 03 Nov 2020 10:01:29 -0800 (PST)
Received: from ?IPv6:2402:3a80:41d:f163:a1ff:26e5:2871:4390?
 ([2402:3a80:41d:f163:a1ff:26e5:2871:4390])
 by smtp.gmail.com with ESMTPSA id q123sm17926940pfq.56.2020.11.03.10.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 10:01:28 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201103133052.21053-1-yashsri421@gmail.com>
 <CAKXUXMx9nYkFBy3RYf-LY9VYUeWcf4FuQpT9F3=_p=9baBQikA@mail.gmail.com>
 <9d2a5a04-fd6e-f805-2036-2ab68358fbf4@gmail.com>
 <CAKXUXMyigTJoFAbwp=dE-4QEpOyUkMT=87UMJ3HZub35azb_4g@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <7c83fa07-8882-8261-cf35-3bd3347faccb@gmail.com>
Date: Tue, 3 Nov 2020 23:31:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMyigTJoFAbwp=dE-4QEpOyUkMT=87UMJ3HZub35azb_4g@mail.gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fixes for
	BAD_SIGN_OFF
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

On 3/11/20 9:04 pm, Lukas Bulwahn wrote:
> On Tue, Nov 3, 2020 at 3:47 PM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 3/11/20 7:09 pm, Lukas Bulwahn wrote:
>>> On Tue, Nov 3, 2020 at 2:31 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>>>
>>>> Currently, checkpatch warns if the author signs-off two or more times
>>>> for the same role.
>>>> E.g., for commit 6dd47d9754ff ("mac80211: fix
>>>> ieee80211_txq_setup_flows() failure path") we get warning:
>>>>
>>>> WARNING: Duplicate signature
>>>> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
>>>>
>>>> Here there are two Signed-off-by lines present for the same user. So,
>>>> we get a warning to remove one.
>>>>
>>>> Similarly, we get warning if the author of the commit signs-off under
>>>> co-developed-by.
>>>> E.g. for commit 6e88559470f5 ("Documentation: Add section about
>>>> CPU vulnerabilities for Spectre") we get:
>>>>
>>>> WARNING: Co-developed-by: should not be used to attribute nominal
>>>> patch author 'Tim Chen <tim.c.chen@linux.intel.com>'
>>>> Co-developed-by: Tim Chen <tim.c.chen@linux.intel.com>
>>>>
>>>> Provide fixes by removing the duplicate signature line and the
>>>> co-developed-by line from the commit
>>>>
>>>
>>>
>>> The duplicate signature fix is simply wrong, because the indication of
>>> the duplicate signature is imprecise.
>>>
>>> Probably, we would first really need to understand the valid cases of
>>> duplicate signature warnings compared to the invalid ones.
>>>
>>> Please rework.
>>>
>>>
>>> Lukas
>>>
>>
>> Oh, Alright. I get it now.
>> I ran a script over WARNING: Duplicate signature.
>> I found out that it is occurring with these prefixes and their
>> frequencies:
>>
>> Acked-by -- 6
>> Signed-off-by -- 218
>> Tested-by -- 3
>> Reported-by -- 1
>> Reviewed-by -- 8
>> Cc -- 28
>>
>> IMO largely Signed-off-by warnings in this frequency might be false
>> positives. This is so because we are simply checking for duplicate
>> occurrences in the sign-offs in checkpatch.pl
>>
>>> Probably, we would first really need to understand the valid cases
>>> of duplicate signature warnings compared to the invalid ones.
>>>
>>
>> Is there any way I can know that the second sign-off is intended?
>>
>> In my observation, this particular commit was prefixed by '^Link:.*$'
>> Alternatively, we could use maintainers list to ensure that the signer
>> is maintainer and avoid this warning.
>>
> 
> That is somehow difficult to say, but probably it is best to
> deactivate this multiple Signed-off-by: warning on git commits.
> 
> On patches it makes sense to warn about duplicate Signed-off-by: ; on
> commits, not so much.
> 
>> How about other prefixes. Can we remove them?
>>
> 
> Can you show the duplicate Tested-by, Acked-by, Reported-by,
> Reviewed-by, Cc in some structured format to quickly check those?
> 
> Probably for those, we can really assess them to be all true positives
> (maybe we can find out the reasons as well) and hence a fix for them
> would make sense.
> 

I generated git logs of all such commits, which might help us get some
idea about mailing list or sign offs as well.

Acked-by:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/acked_by.txt

Reported-by:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/reported_by.txt

Reviewed by:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/reviewed_by.txt

Tested-by:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/tested_by.txt

Cc: https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task5/cc.txt


>> I observed one of the 'Tested-by' warnings and it was because of these
>> sign offs:
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Tested-by:Liang Yang <liang.yang@amlogic.com>
>> Acked-by: Liang Yang <liang.yang@amlogic.com>
>> Tested-by:Liang Yang <liang.yang@amlogic.com>
>> Acked-by: Liang Yang <liang.yang@amlogic.com>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>
>> Here tested-by is occurring 2 times.
>>
> 
> That example seems to be a clear true positive. It would be
> interesting to see how that happened to be added twice in a commit.
> What was the state on the mailing list and what did the maintainer do
> to add these tags twice (was this done manually or is there some
> automatic tool involved?).
> 

I found the mailing list state corresponding to that day. It indeed
seems like a true positive.

Link1:
https://lore.kernel.org/linux-mtd/CAFBinCB9Z_H4wX3_g2hVL-XnS6Oq-KtPHa4Z1ws79FGp5jCapQ@mail.gmail.com/

Link2 (reply):
https://lore.kernel.org/linux-mtd/8ff232c3-f325-5b91-4de1-a39e63939df2@amlogic.com/

Thanks
Aditya



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
