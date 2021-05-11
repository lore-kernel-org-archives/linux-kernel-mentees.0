Return-Path: <SRS0=DPz5=KG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52231C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 May 2021 23:51:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6A606187E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 May 2021 23:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6A606187E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7433840EFD;
	Tue, 11 May 2021 23:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05eU6PVEjhJK; Tue, 11 May 2021 23:51:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D60F40EF6;
	Tue, 11 May 2021 23:51:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 443BDC000D;
	Tue, 11 May 2021 23:51:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34057C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 May 2021 23:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CC1940EFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 May 2021 23:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L2_KgHKGHSNd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 May 2021 23:51:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B565A40EF6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 May 2021 23:51:22 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id g24so12552848pji.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 May 2021 16:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jRIv26CWSKa/axySwYhnWGK/F55PS2gCs4qGxABhBpw=;
 b=L+RUX6/9ROIpoSbjzvEGm1ekokvTeuZ+JzDa6HSJcxTO/mSCsXYwJ/COSTG1Z0EVnZ
 6kiXLLWlw9KI6ooBoLfKGVRkx+HjklxJHnvk3eh2S8fn0u7/GGGPtvoa1KE2NYfOuq/m
 VWE3O0n7dl8icmi2YlMLHqwmRcmfFZI6FgNVB9Tx6eKeGP0O1G/FUXeqPxhB0mc6JSwB
 csH/XJR7v4XPVEDOPu5kuOQme3TKKElywhwvgL+KNOL3dh60t+25DyEWY7zlMkjl9XYu
 tFlbp0Pl4WepMT0pYc0oo/m8mqbCmZAG2drWXXSyLBYgA4kecCwwMDr1iEhX/Gf0CHlj
 8SiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jRIv26CWSKa/axySwYhnWGK/F55PS2gCs4qGxABhBpw=;
 b=fB2Ed2gPvQ5eP1wOierMtBR5PX/t71PAL+vx0RAChwCjIb4MxD8/HMqKJfTHz6loWx
 rjegCBZfili+tWkE9HKwSIyUIZvBOB5/pRaQQQy8+PqxAi9egtcaWPw+SzFNRx2GdqrF
 BvJFuy7aGlc9A3nnvPJ8cHGCUZd3bNHjK4faFxZfCECN7O3VDm+HSSZ4t3n+0oOaNAsy
 y2Q/Xe6AqP0Bm6xAI5iDRXz9vtQjc0WQBz8hLpW9Mhv+jjq/6Fe/00P9Q6LfAkDA7ziE
 /jS4GM3ytYwU91kEfjC2cyDGhEJc02RSHoWhE3evICJNwZIC1K/kprl22lhJwlCp8cYV
 NmTw==
X-Gm-Message-State: AOAM5324TlQHA6rBoilAdknDBm850hGAwK4ieqNIz8Ed172USHxaaJl1
 ySiigmfT21d5ZOqW0CBWedbK0tgIkyMaQavUIj3GTg==
X-Google-Smtp-Source: ABdhPJzhVDdRW0ZRALecZ/6mY1DXiY/a7BhLkd2VMh37ds8bwHGN+H0bwjj042iTbqIjoJTnw/dtBA==
X-Received: by 2002:a17:90b:508:: with SMTP id
 r8mr18562120pjz.152.1620777081496; 
 Tue, 11 May 2021 16:51:21 -0700 (PDT)
Received: from [10.71.15.213] ([111.223.96.126])
 by smtp.gmail.com with ESMTPSA id q21sm14417935pfl.152.2021.05.11.16.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 16:51:21 -0700 (PDT)
Subject: Re: [PATCH] Remove link to nonexistent rocket driver docs
To: Jonathan Corbet <corbet@lwn.net>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org
References: <20210511134937.2442291-1-desmondcheongzx@gmail.com>
 <87bl9hdwxt.fsf@meer.lwn.net>
From: Desmond Cheong <desmondcheongzx@gmail.com>
Message-ID: <d58cf981-4162-1756-1e1e-fa9516e35a1d@gmail.com>
Date: Tue, 11 May 2021 19:51:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87bl9hdwxt.fsf@meer.lwn.net>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 11/5/21 1:03 pm, Jonathan Corbet wrote:
> Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com> writes:
> 
>> Fixes: 3b00b6af7a5b ("tty: rocket, remove the driver")
>> The rocket driver and documentation were removed in this commit, but
>> the corresponding entry in index.rst was not removed.
>>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> 
> Please note: the "Fixes" tag should be down at the end with your
> signoff.
> 
>>   Documentation/driver-api/serial/index.rst | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/driver-api/serial/index.rst b/Documentation/driver-api/serial/index.rst
>> index 21351b8c95a4..8f7d7af3b90b 100644
>> --- a/Documentation/driver-api/serial/index.rst
>> +++ b/Documentation/driver-api/serial/index.rst
>> @@ -19,7 +19,6 @@ Serial drivers
>>   
>>       moxa-smartio
>>       n_gsm
>> -    rocket
>>       serial-iso7816
>>       serial-rs485
> 
> Otherwise this looks like a good fix.  I've applied it (with Fixes in
> the right place), thanks.
> 
> jon
> 

Thanks for the feedback and the amendment, Jon. I will take note in the 
future.

Best wishes,
Desmond

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
