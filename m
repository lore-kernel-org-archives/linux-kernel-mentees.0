Return-Path: <SRS0=x+JC=FH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC5BC64E8A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Dec 2020 12:23:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725D522241
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Dec 2020 12:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 725D522241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A168587400;
	Thu,  3 Dec 2020 12:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vb8xdy1PUh-Z; Thu,  3 Dec 2020 12:23:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B6B6B87251;
	Thu,  3 Dec 2020 12:23:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FE4DC0FA8;
	Thu,  3 Dec 2020 12:23:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80C50C0FA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 12:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 668DB87225
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 12:23:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jgQqgdbgO7kF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 12:23:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C166B86FA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 12:23:51 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id w4so1273558pgg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 03 Dec 2020 04:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F8MVWeCRClr1yXty0PKunJoMG8zS3pGEs0D4DriH35A=;
 b=dyCIm6ORxo97pDQfbFUu9cqPhxzTI2zO3Gvokhs8JZN6E49HOpGZo6iC9l926FOxDM
 tZZK/OozkiRHmA3V6KPexlOrqXo/UDpeTmVKXsnmSbRdmxOCrwd15/VRFIX3mLkgGQM3
 s3gw9sILQzxFBBICVNhPh4WhMc0TiKw/OD/G0am3L2PqqNydwGqkGN30rFar4i36fNqR
 wGIjW+NcrsqdKJZ/RtKqacFXNxB0F9NzEgnUl41uaPMxGlAeE4/HwtpgUmLFTXEQaX58
 eS8Phcp6x950G8WBafPeZrrAUUTQQBs/xH9oSUEAmIcF5tjFzSaPB8mOEn82rXnh96oj
 ca4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F8MVWeCRClr1yXty0PKunJoMG8zS3pGEs0D4DriH35A=;
 b=ckZfVqBCeMiMwVKZ8YS4EOkdgpzdhoOhDhWS70jOp+ZZ7PEV+e+NEjUPmAK2BUsLdO
 OLvVTHpbNwbvBDF5UfGNKbIxjJK1XRyXkGI64vDy5LsrEoQ81voR6UOp0QSgl3Okzqme
 xzbDePyPGtv6TgGDXoiZyJ9kzM0O9Jl1Eksz+o49QOFLTj3lMThewHBwbPUFYUO5Oj9/
 RA4gD51KuyDlSt2f75Leo/xXf7twTYISbaUGwmlbG7l/XFNWxoHuGQHYfrV/n+NXs4q4
 9g/r2PiED6Z559GUHTaXDC2H52FTIjwPb8bT4Jb1wjPzFiZsHgPnP+2ExOvAcOhGAz0l
 4W1Q==
X-Gm-Message-State: AOAM532elPsUQQPiOBI6YV+bqXYElTGteibdni8sz7tqewjk06Z/2yc8
 S+4tGi6RLqOqrfd0umDoV5oRSkwjhPLH++fi
X-Google-Smtp-Source: ABdhPJyPx5ij6Pn7UHdIQ1geZvaL4KUCb2taIUUHh6mRDENln3v5QDk4VDk1vqC6tSTer86yncoUQg==
X-Received: by 2002:a62:2683:0:b029:19a:9594:1abe with SMTP id
 m125-20020a6226830000b029019a95941abemr999212pfm.19.1606998230925; 
 Thu, 03 Dec 2020 04:23:50 -0800 (PST)
Received: from [192.168.43.245] ([42.111.136.176])
 by smtp.gmail.com with ESMTPSA id s7sm1316750pju.37.2020.12.03.04.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 04:23:50 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <280235acc0e91365f3fd3b5be5a5244eced1ff61.camel@perches.com>
 <20201202183045.9309-1-yashsri421@gmail.com>
 <5afbcd1423ee8fc2dfad191d94aef6efc17198c8.camel@perches.com>
 <a2c74693-93ae-cd5a-7836-4ffff643fc09@gmail.com>
 <CAKXUXMxPMdGmnOWdYnS0VQXaAH9dTe7uNfUUPp-GLy2xTXuABw@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <2c0c1501-4e53-85a6-94d5-2082f8e98885@gmail.com>
Date: Thu, 3 Dec 2020 17:53:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMxPMdGmnOWdYnS0VQXaAH9dTe7uNfUUPp-GLy2xTXuABw@mail.gmail.com>
Content-Language: en-US
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH -mmots] checkpatch: add fix for
 non-standard signature - co-authored-by
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

On 3/12/20 4:29 pm, Lukas Bulwahn wrote:
> On Thu, Dec 3, 2020 at 10:59 AM Aditya <yashsri421@gmail.com> wrote:
>>
>> On 3/12/20 12:26 am, Joe Perches wrote:
>>> On Thu, 2020-12-03 at 00:00 +0530, Aditya Srivastava wrote:
>>>> Currently, checkpatch.pl warns us for BAD_SIGN_OFF on the usage of
>>>> non-standard signatures.
>>>>
>>>> An evaluation on v4.13..v5.8 showed that out of 539 warnings due to
>>>> non-standard signatures, 43 are due to the use of 'Co-authored-by'
>>>> tag, which may seem correct, but is not standard.
>>>>
>>>> The standard signature equivalent for 'Co-authored-by' is
>>>> 'Co-developed-by'.
>>>
>>> I'm not going to ack this as I don't mind non-standard signatures.
>>>
>>
>> What do you suggest?
>> Should I drop this patch and move on?
>>
> 
> Joe does not ack this, but he also does not nack it.
> 
> You either move on (which is perfectly fine), or
> 
> you either wait that Andrew Morton reviews it and accepts it because
> he thinks it useful, or
> 
> you reach out to the git committers that have been using
> Co-authored-by in the past and ask them if this kind of feature would
> have been helpful for them and you get an ack from them that convinces
> Andrew Morton to pick this.
> 
> I hope this helps. If nobody thinks it is a useful feature, move on to
> work others acknowledge as useful. We have enough stuff to work on.
> 

Okay. I get it now. Thanks a lot Lukas :)

--
Aditya

> Lukas
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
